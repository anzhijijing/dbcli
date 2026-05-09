package ai.dbcli.core;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

import java.util.List;
import java.util.Map;

/**
 * Output formatter for different formats
 */
public class OutputFormatter {

    private static final ObjectMapper jsonMapper = new ObjectMapper()
            .enable(SerializationFeature.INDENT_OUTPUT);

    private String format = "table";

    public OutputFormatter() {}

    public OutputFormatter(String format) {
        this.format = format;
    }

    /**
     * Format result as JSON
     */
    public String formatJson(Object result) {
        try {
            return jsonMapper.writeValueAsString(result);
        } catch (Exception e) {
            return "{\"error\": \"" + e.getMessage() + "\"}";
        }
    }

    /**
     * Format result as table
     */
    public String formatTable(QueryResult result) {
        StringBuilder sb = new StringBuilder();
        
        List<String> columns = result.getColumns();
        List<Map<String, Object>> data = result.getData();
        
        if (columns.isEmpty()) {
            return "No results";
        }
        
        // Calculate column widths
        int[] widths = new int[columns.size()];
        for (int i = 0; i < columns.size(); i++) {
            widths[i] = columns.get(i).length();
        }
        
        for (Map<String, Object> row : data) {
            for (int i = 0; i < columns.size(); i++) {
                Object value = row.get(columns.get(i));
                String strValue = value == null ? "NULL" : value.toString();
                widths[i] = Math.max(widths[i], strValue.length());
            }
        }
        
        // Cap widths at 50
        for (int i = 0; i < widths.length; i++) {
            widths[i] = Math.min(widths[i], 50);
        }
        
        // Header
        sb.append("|");
        for (int i = 0; i < columns.size(); i++) {
            sb.append(" ").append(padRight(columns.get(i), widths[i])).append(" |");
        }
        sb.append("\n");
        
        // Separator
        sb.append("|");
        for (int i = 0; i < columns.size(); i++) {
            sb.append(" ").append(repeat("-", widths[i])).append(" |");
        }
        sb.append("\n");
        
        // Data rows
        for (Map<String, Object> row : data) {
            sb.append("|");
            for (int i = 0; i < columns.size(); i++) {
                Object value = row.get(columns.get(i));
                String strValue = value == null ? "NULL" : value.toString();
                if (strValue.length() > widths[i]) {
                    strValue = strValue.substring(0, widths[i] - 3) + "...";
                }
                sb.append(" ").append(padRight(strValue, widths[i])).append(" |");
            }
            sb.append("\n");
        }
        
        // Footer
        sb.append("\n");
        sb.append("Rows: ").append(result.getRowCount());
        if (result.isLimited()) {
            sb.append(" (limited)");
        }
        
        if (!result.getWarnings().isEmpty()) {
            sb.append("\nWarnings:\n");
            for (String warning : result.getWarnings()) {
                sb.append("  - ").append(warning).append("\n");
            }
        }
        
        return sb.toString();
    }

    /**
     * Format list as table
     */
    public String formatList(List<?> items, String[] fields) {
        StringBuilder sb = new StringBuilder();
        
        if (items.isEmpty()) {
            return "No items";
        }
        
        // Header
        sb.append("|");
        for (String field : fields) {
            sb.append(" ").append(field).append(" |");
        }
        sb.append("\n");
        
        // Separator
        sb.append("|");
        for (String field : fields) {
            sb.append(" ").append(repeat("-", field.length())).append(" |");
        }
        sb.append("\n");
        
        // Data rows
        for (Object item : items) {
            sb.append("|");
            try {
                Map<String, Object> map = jsonMapper.convertValue(item, Map.class);
                for (String field : fields) {
                    Object value = map.get(field);
                    String strValue = value == null ? "" : value.toString();
                    sb.append(" ").append(padRight(strValue, field.length())).append(" |");
                }
            } catch (Exception e) {
                sb.append(" Error formatting row |");
            }
            sb.append("\n");
        }
        
        sb.append("\nTotal: ").append(items.size());
        
        return sb.toString();
    }

    private String padRight(String s, int width) {
        if (s.length() >= width) {
            return s.substring(0, width);
        }
        return s + repeat(" ", width - s.length());
    }

    private String repeat(String s, int count) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < count; i++) {
            sb.append(s);
        }
        return sb.toString();
    }

    /**
     * Format success response
     */
    public ApiResponse success(Object data) {
        ApiResponse response = new ApiResponse();
        response.setSuccess(true);
        response.setData(data);
        return response;
    }

    /**
     * Format error response
     */
    public ApiResponse error(String errorCode, String message) {
        ApiResponse response = new ApiResponse();
        response.setSuccess(false);
        response.setErrorCode(errorCode);
        response.setMessage(message);
        return response;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }
}