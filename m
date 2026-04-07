Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80AA3314B9;
	Tue,  7 Apr 2026 15:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575240; cv=none; b=bC5FpJVykXQjAbRWoiACf2VZYdi8Tu2ogMwSe8NnEFzWHXYEt31wRoNy3xyjaUOOHmS5jcRCJdY8GtodWF4agkgCsVziRqsfJ8HZhavfDGUTqmqSBTSKrK4nSM+HWKPw2ZQlyT/70jqCPcYRD+8fgqsj/HcMP72V9xDPoGM4tsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575240; c=relaxed/simple;
	bh=6D5o3aRIvVw2mCnM4sWHf6QgcCsjwGnaYRepeqs6ZN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B+dojJalQ9bMyHzqa3UudBK+5ANm5bpPzFHQpuUA+9FV5GRGxeZpye54kb4FWlZ9r0yWn8WTyzW2+IvPoXICzC/32zU4NkrWuUH47U2cxMsaEIN76bPVi+eZDFwaobY5EQUqxloAKjEfsAU6HOM7Azen+Kgx+ksCMRLbcmDyXKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz19t1775575227t766628a7
X-QQ-Originating-IP: xphdlHTr9lW6Vn8mo8g2kkD+mYJX5nmHsVuHkbktNIE=
Received: from [192.168.30.32] ( [116.234.14.100])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 07 Apr 2026 23:20:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13575695803740898803
EX-QQ-RecipientCnt: 15
From: Xilin Wu <sophon@radxa.com>
Date: Tue, 07 Apr 2026 23:19:58 +0800
Subject: [PATCH 06/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Drop
 QSPI node and reserve its pins
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-dragon-q6a-feat-fixes-v1-6-14aca49dde3d@radxa.com>
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2875; i=sophon@radxa.com;
 h=from:subject:message-id; bh=6D5o3aRIvVw2mCnM4sWHf6QgcCsjwGnaYRepeqs6ZN8=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJlXFZbsTPNbv+6rguzxvQsVTRIunlw1cd++YwtrRJ9nV
 /k7crv6dpSyMIhxMciKKbIoxDPMZa/MvfZUrFQPZg4rE8gQBi5OAZgIExcjw8sPhlXSWjV7nW/c
 zfXLTYk9PCd+T4LJnvj0jOrN5447STP8FeDy1lho8dPxdNW1OP/VQd1dBR9mP4158+19WP3T109
 7mAA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Md6GZDcNObI8iZgFedqg3T5sDSirFHKpiC8frv40kRgcB1zdymwF5tRS
	q4B3SEB4/5hbuvOJvrCuQIgs2KKm9Wp9vokVC2Q+xzyERbSXn1BwF6LDWYJdEHvcWJNcZe7
	0TRW9VI9vEUWI3oAp+n/nw0lBr9SPCoXURVukLfSFjuJMLKvPaz6dudiGCuwo738jx6HlHI
	o2aTK6fuJ5ZbgHz5ejbdlt46I2hFvKJkPigVnUQiaMnfwA7D8hdOyMglBnDe7tRaHQKGKNl
	c1u8wPxTbl922rCIc3KC1bHFBqRzSCJGovCGZhdzRKVRKGeJNHo2ydoOzfqQuLHYE2UEl6g
	x6kf8JpxKpnfAomf0qtRuTvkm7bU+CasWiGuXuk4wuUulwnt4o+3C17JYY2jqraCV9v8Bxl
	ycbOUKlV1VTjpoQOHy4i1hmG8SCtV9usn3uouQ76hDq/zGaIPhEqcHnP9QljlrAwOcNrZBH
	om5zfksm7yDUEtlrDEP4cXiv8ePWLyDX2MZwwRlFswVZACRExD4TcirkFT8GZxhp69CjkI+
	MjN8sl2nrm6QvIy69/Q4Eng2XeCgpYAIIY/rygyCgrHigUKI3gdncp/rMijQfqmg3EDFrQr
	CxFlI91LFKUi1VCoQYKshg7u6UIB3U3piRK2S9mdqaeV2GH4flv1wMnwfVOSB8RaLziXq4L
	AXcJt2vAnCLaqyy8bdzLJ58m32eL919xsDaNH3T34KNdkaWT6cVsrE9/u2PvDgd22xgKgCk
	GA7uvuN9ezWQNgtaq0P48DjbXfoJLe5tP9JiWnjDnwawAvkLZSsb7FtVtfjQzjH/myu66Mb
	nerku+ixfUcz3UtKekglmYU1g8qAvalOSWaZlgY6QiokMKJGZvmmjXR7FFgMfFsvZFqxeUi
	CkA1DSK9iKzGO8OKxhTkEu7EI6kOZPVv777m/JraB/RdvPTxVZ+r8QAe00r92RT0nfhrZiR
	bLIXFqQx1zdX+cQ7wi0ofYZ5L2G4Rx+9PkktKc8O4HI4/w+5dw3WzKmH3F+wQpsyaoOoQRk
	eWaUVEoenIpHbkFzpfGzYD7FiNHTpve4NfWTBwXRrhkZWJof2RW3MOxG8ORQk=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

The latest official boot firmware configures TrustZone to restrict
direct access to the QSPI controller. Any attempt to access it from
the non-secure world causes an immediate board reset.

Remove the QSPI flash node and its associated pinctrl states, mark
GPIOs 12-17 as reserved, and protect the QSPI clocks in the GCC
node to prevent the kernel from touching this hardware.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 60 +++-------------------
 1 file changed, 7 insertions(+), 53 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index 91f1b4f57915..8d6bb4b0724b 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -513,6 +513,9 @@ &gcc {
 			   <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
 			   <GCC_MSS_Q6_MEMNOC_AXI_CLK>,
 			   <GCC_MSS_SNOC_AXI_CLK>,
+			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+			   <GCC_QSPI_CORE_CLK>,
+			   <GCC_QSPI_CORE_CLK_SRC>,
 			   <GCC_SEC_CTRL_CLK_SRC>,
 			   <GCC_WPSS_AHB_BDG_MST_CLK>,
 			   <GCC_WPSS_AHB_CLK>,
@@ -745,28 +748,6 @@ &pon_pwrkey {
 	status = "okay";
 };
 
-&qspi {
-	/* It's not possible to use QSPI with iommu */
-	/* due to an error in qcom_smmu_write_s2cr */
-	/delete-property/ iommus;
-
-	pinctrl-0 = <&qspi_clk>, <&qspi_cs0>, <&qspi_data0>,
-				<&qspi_data1>, <&qspi_data23>;
-	pinctrl-1 = <&qspi_sleep>;
-	pinctrl-names = "default", "sleep";
-
-	status = "okay";
-
-	spi_flash: flash@0 {
-		compatible = "winbond,w25q256", "jedec,spi-nor";
-		reg = <0>;
-
-		spi-max-frequency = <104000000>;
-		spi-tx-bus-width = <4>;
-		spi-rx-bus-width = <4>;
-	};
-};
-
 &qupv3_id_0 {
 	firmware-name = "qcom/qcm6490/qupv3fw.elf";
 	status = "okay";
@@ -906,6 +887,10 @@ wcd_tx: codec@0,3 {
 };
 
 &tlmm {
+	/*
+	 * 12-17: reserved for QSPI flash
+	 */
+	gpio-reserved-ranges = <12 6>;
 	gpio-line-names =
 		/* GPIO_0 ~ GPIO_3 */
 		"PIN_13", "PIN_15", "", "",
@@ -1024,12 +1009,6 @@ pcie1_wake_n: pcie1-wake-n-state {
 		bias-pull-up;
 	};
 
-	qspi_sleep: qspi-sleep-state {
-		pins = "gpio12", "gpio13", "gpio14", "gpio15", "gpio16", "gpio17";
-		function = "gpio";
-		output-disable;
-	};
-
 	sd_cd: sd-cd-state {
 		pins = "gpio91";
 		function = "gpio";
@@ -1210,31 +1189,6 @@ &pcie1_clkreq_n {
 	drive-strength = <2>;
 };
 
-&qspi_clk {
-	bias-disable;
-	drive-strength = <16>;
-};
-
-&qspi_cs0 {
-	bias-disable;
-	drive-strength = <8>;
-};
-
-&qspi_data0 {
-	bias-disable;
-	drive-strength = <8>;
-};
-
-&qspi_data1 {
-	bias-disable;
-	drive-strength = <8>;
-};
-
-&qspi_data23 {
-	bias-disable;
-	drive-strength = <8>;
-};
-
 &sdc1_clk {
 	bias-disable;
 	drive-strength = <16>;

-- 
2.53.0

