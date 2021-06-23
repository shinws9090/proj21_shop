package proj21_shoes.mapper;

import java.util.List;

import proj21_shoes.commend.ReviewCommand;
import proj21_shoes.dto.ReView;

public interface ReviewMapper {
	

	List<ReView> selectReviewByProductCode(int productCode);
	List<ReviewCommand> selectReviewbyProductCode(int productCode);
	
	int updateProductCode(String ProductCode);
	int deleteProductCode(String ProductCode);

}
