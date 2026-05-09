package ai.dbcli.dialect;

import java.util.ArrayList;
import java.util.List;

/**
 * SQL validation result
 */
public class SqlValidateResult {

    private boolean valid;
    private String errorCode;
    private String message;
    private String sqlType;
    private List<String> warnings;

    public SqlValidateResult() {
        this.warnings = new ArrayList<>();
    }

    public static SqlValidateResult valid() {
        SqlValidateResult result = new SqlValidateResult();
        result.setValid(true);
        return result;
    }

    public static SqlValidateResult invalid(String errorCode, String message) {
        SqlValidateResult result = new SqlValidateResult();
        result.setValid(false);
        result.setErrorCode(errorCode);
        result.setMessage(message);
        return result;
    }

    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
    }

    public String getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(String errorCode) {
        this.errorCode = errorCode;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getSqlType() {
        return sqlType;
    }

    public void setSqlType(String sqlType) {
        this.sqlType = sqlType;
    }

    public List<String> getWarnings() {
        return warnings;
    }

    public void setWarnings(List<String> warnings) {
        this.warnings = warnings;
    }

    public void addWarning(String warning) {
        this.warnings.add(warning);
    }
}