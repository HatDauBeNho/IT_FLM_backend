package Haui.ITFacultyLearningManagement.custom.data;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OptionRequest {
    @JsonProperty(namespace = "limit")
    private Integer limit;
    @JsonProperty(namespace = "offset")
    private Integer offset;
    @JsonProperty(namespace = "order")
    private String order;

    public String checkOptionRequest() {
        if (this.limit == null) {
            this.limit = 10;
        } else if (this.limit < 1) {
            return "Incorrect limit";
        }

        if (this.offset == null) {
            this.offset = 1;
        } else if (this.offset < 1) {
            return "Incorrect offset";
        }

        if (this.order == null || this.order.isEmpty()) {
            this.order = "desc";
        } else if (!this.order.equals("asc") && !this.order.equals("desc")) {
            return "Incorrect order";
        }

        return "";
    }
}
