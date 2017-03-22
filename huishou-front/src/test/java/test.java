import java.math.BigDecimal;
import java.math.RoundingMode;

import com.alibaba.dubbo.container.Main;

public class test {
public static void main(String[] args) {
	
	
	
	BigDecimal basePrice = new BigDecimal(1000);
	
	
	BigDecimal totalValue = new BigDecimal(0);
	BigDecimal totalValue1 = new BigDecimal(10);
	BigDecimal totalValue2 = new BigDecimal(20);
	totalValue = totalValue.add(totalValue1);
	totalValue = totalValue.add(totalValue2);
	totalValue = totalValue.divide(new BigDecimal(100));
	System.out.println(totalValue.toString());
	
	BigDecimal basePriceValue = basePrice.multiply(totalValue);
	
	basePrice = basePrice.add(basePriceValue);
	System.out.println(basePrice);
	
}	
}
