**課程網頁上有一檔案growth.csv，若幼兒的體重(weight,單位：公斤)可能受到出生時的體重(brthwtkg,單位：公斤)、性別(gender, 1:male; 2:female，以female作為基準組)、年紀(age,單位：年)的影響，以SAS proc mixed分析之，請配適一個可與G-side analysis相等的R-side analysis，並回答以下各小題：**

1. **ICC=_________，如何由Estimated R Matrix求得？**

   $ICC = Cor(Y_{1j}, Y_{1i}) = \dfrac{\sigma_{ij}}{\sqrt{\sigma^{2} \sigma^{2}}} = \dfrac{0.243}{1.8093 \times 1.8093} = 0.07423097$

2. **Covariance Parameter Estimates部分，有何結論？**

   type=cs   covariance structutre中所估計的參數個數 = 2

   $H_{0}:\sigma _{ij}=0​$ vs. $H_{1}:\sigma _{ij} \neq 0​$ , pnorm(1.55, lower=F)*2 =  0.1211415  (雙尾檢定)

   結論：重複測量的covariance不顯著(covariance = 0)，所以可忽略重複測量間的相關性。

3. **Fit Statistics部分，請計算出AIC, AICC, BIC**

   $AIC = -2\log L_{R} + 2p = 679.4 + 2 \times 2 = 683.4$

   $AICC = 	-2\log L_{R} + 2p\left( \dfrac {N}{N-p}\right) = 679.4 + 2\times 2\left( \dfrac {198}{198-2}\right) = 683.4$

   $BIC = -2\log L_{R} + p\log(n) = 679.4 + 2\times \log(68) = 687.839$


4. **Null Model Likelihood Ratio Test部分，請寫出虛無假說與對立假說，有何結論？**

   $H_{0}: \sigma _{ij} = 0$:  Reduced model (小模式) (即使忽略重複測量間的相關性也無所謂)

   $H_{1}: \sigma_{ij} \neq 0$:  Larger model (大模式)

   $p$ > 0.05, 接受 $H_{0}$, 結論：可忽略重複測量間的相關性。

   與Covariance Parameter Estimates 部分的結論一致。

   ​