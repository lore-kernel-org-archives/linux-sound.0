Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90C4322DA5
	for <linux-sound@vger.kernel.org>; Wed,  3 Sep 2025 15:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912460; cv=none; b=LcDTM5lHMOoZ8AWUM/gTFUJGIQ+VEU4IF9fAX9WBjXB1Fk4Wdz+rSwZNUMszQh3jEj5L/NZOQVsBXKnToSR3kVh078OYV4+PewzHmGqRyHsUYACDTgNsc0EMuAatgZ3RsOr4iv9u74k+T6XyO2StjrsmnbyhuIZz2dYBvoLX5Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912460; c=relaxed/simple;
	bh=3WgManmGGmRgZEYgOpSmRFfDQ/zGDT1DJJBkUWr5tDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N0gVf5gApH2lTsWrQiZ2wY4TK4zmbCWgbPpohKc9yfBeBP5p51GTVS5A0g3LUvsfUS1z/Fp7wXkisWimPYvMm2qPaXHn/S5edUZ6nswIT/CvAqgEWwJyJHgsvJmhkI1esfKqubnpveO2y3uYXDiRSG8lj+ET5wfNnlbaGlXn1H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQkt0FkB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QQkt0FkB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583DwqkF007495
	for <linux-sound@vger.kernel.org>; Wed, 3 Sep 2025 15:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CILLYp7u8rt
	HqTekHx+ovWP7/XIiospfeIW9Ee9kHLQ=; b=QQkt0FkBAh1RPA+UxNytO9wLllT
	J62KYwqeW7r3tfRAeClrnpTpnX5bYSgImIYTIl/4UT5iDWXNL7QCNyRyL2UI4bPU
	OCpJk5qCELYUcmz84h9CTtY4OuQfso+JsXNHDJ9i3KeXDx0mKuiL53RzBlOub3hc
	I9tsKNvHFgQb5CWnR6syDKBnyDUnIL2ArYiVuz5ttZMvf5oDsfwJ4PqvXHUC7rZ2
	66I4chPdq+nnLq4L0FlKUgq1hHYPb7EUPT9kIeraaxugpbyXcqpSj+EZv2CTcUQg
	pI3zVB9+dSqSWkh5KiSKEE/Y1piuIbIYcgPyp8Sx4E7uhghSWLBtWxVrdJQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv49eh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 03 Sep 2025 15:14:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24c99f6521dso481295ad.3
        for <linux-sound@vger.kernel.org>; Wed, 03 Sep 2025 08:14:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912456; x=1757517256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CILLYp7u8rtHqTekHx+ovWP7/XIiospfeIW9Ee9kHLQ=;
        b=mURrtA9amzM6ZTpItz5/ziAbcOMaJX45CJr0tdLPauO4EyAh6cBlHCT+Np7E2oXlQm
         AHpSX0KQ0TDE2CDqB7pdVPm/kBCWNqdtU32MeK7MIumbDX6FWIrDlwRGKkRTvtXvnBHB
         STP3ryCEdvS/fs2Z6X69o8p8EotMOUc3OHgJ6CMf6ls/jTkGRTTkLZtMi7y0/wvFKCvM
         DlqnspSvP9rwaKrfjR8LxuVGPWhPcuorfoLf7PrXh5pKrkRNCmgFkd8dKIsbPRrYvBuL
         jOgDb45jFUvmT05Z953Vyt3homwAPHnuyhx0lXSsYZadRYZkbzuhBwXyBZ5DMoNNKGSb
         K3RA==
X-Forwarded-Encrypted: i=1; AJvYcCUATSt0BldYaOSFSJZzX94/mid23s6byZ36H84IP8/2xRNJ1vsNtFkRyXi+eX9/CI691E7oPccioxVO5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBnnz/8ov/1JK3xmaW7tcwPCM5Bq/cfJTG8pySfZI+F4DgrmWp
	0ECjkpMrf/WfNgTQx29VhlzVyqypd7pCbbnx+HKZKIkquvT2NkzSuAOL8hmxHjFqJKci34+Din6
	VDHalXh8J97xVULaRXRdEozCpJjxewUH+kLfmmGbaNK9Z/WC29ybtybrvTiRfeRlbhA==
X-Gm-Gg: ASbGncuvyyvZ1eoCMUhAR8cvk8bOrkOdX+rZoGnGnuBD7AR5mkofMIO5qHBcZzisPqw
	39kk5fQ6vSw0Kc2jvAVXifZSJMNjjgg7hztg3v2S0OZbxQdvx5VXmNDHyvYRlP0yHUZ8oZNlnXX
	4iriG72emVg8xXpaMZzM4TTO4E9D3WztwD/tSVgvQuJRJuSQX1tOXHBYSyhHMVq1G48W7UnXXys
	892YYYszLNvCHiqd8lV6XCQQqLhoXFFMxZmqhC+JCHXndZ+WMtun2sYTedGxfrf8zcUA4TsPtnG
	p0bcT+S20qqbm5qqyU5PGr1hbqz/9yhkXgQb8VeC/XtvvFw6vc51sx0qgIv1Ht6bQrCbbGCtIow
	v
X-Received: by 2002:a17:903:32cc:b0:24b:1692:e0bf with SMTP id d9443c01a7336-24b1692e695mr102822185ad.31.1756912456359;
        Wed, 03 Sep 2025 08:14:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXcpc9DYi46E+HqPMbUNFcwcC1pb7rLaBVk/wabHnwuuA392JEYSWK4iqIaPiPwLic40lnNQ==
X-Received: by 2002:a17:903:32cc:b0:24b:1692:e0bf with SMTP id d9443c01a7336-24b1692e695mr102821595ad.31.1756912455832;
        Wed, 03 Sep 2025 08:14:15 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903758b89sm164818945ad.59.2025.09.03.08.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 08:14:15 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Subject: [PATCH v9 5/8] arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830 speakers amplifier
Date: Wed,  3 Sep 2025 20:43:34 +0530
Message-Id: <20250903151337.1037246-6-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903151337.1037246-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250903151337.1037246-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfXxUH4tOJiUkiw
 s74C4gEhM5XZmmIqTccGS03yl5ucZKpI7tJsOkH/45WCX+bH3rayAHzXmG1hEsJjN1qkO9izULz
 vGhB+FewHp4PQKDXENQtBUelrojtPtYSbb9NMZHMnSTS7Dpv3o80cUEuZLyN41dqy/DKArebb1Z
 os6mV+vxHHUrGCi4E+gl9AbUhvMsg6rOJJSYijuVhz51nt6LiVUlmOi6XYCuj1g2iXtrh/2qgRX
 Fp4c5+pFji/MvFpYlt/v0PqDbMopSwj9G2Bpy89LYcCZqI1dK4lbsk0h7bdGsjSxTvHJhBvhy9s
 0ij3SmTlOKyTI2uwnCtkPx53aExb2KhyRx0BFbKLmKDFGH+ffTSpDjofqBq5s9jlTVOOM4LFz13
 2Al3JEQc
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b85b49 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=CLL5YfBxrXNaip5VhtkA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8HRXQGuMBBt2GY7B3T6Mjne6Hajt2xxx
X-Proofpoint-GUID: 8HRXQGuMBBt2GY7B3T6Mjne6Hajt2xxx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

Add nodes for WSA8830 speakers amplifier on qcs6490-rb3gen2 board.

Enable lpass_wsa and lpass_va macros along with pinctrl settings
for audio.

Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../boot/dts/qcom/qcs6490-audioreach.dtsi     |  6 ++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  | 35 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |  8 +++++
 3 files changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
index bdf4b6c3fc6d..c1867711298b 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
@@ -56,6 +56,12 @@ &lpass_va_macro {
 	clock-names = "mclk",
 		      "macro",
 		      "dcodec";
+
+	pinctrl-0 = <&lpass_dmic01_clk>, <&lpass_dmic01_data>,
+		    <&lpass_dmic23_clk>, <&lpass_dmic23_data>;
+	pinctrl-names = "default";
+
+	qcom,dmic-sample-rate = <4800000>;
 };
 
 &lpass_wsa_macro {
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 7509c27bd3f8..09e2cb9053a6 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -19,6 +19,7 @@
 #include "pm7325.dtsi"
 #include "pm8350c.dtsi"
 #include "pmk8350.dtsi"
+#include "qcs6490-audioreach.dtsi"
 
 /delete-node/ &ipa_fw_mem;
 /delete-node/ &rmtfs_mem;
@@ -765,6 +766,14 @@ redriver_usb_con_sbu: endpoint {
 	};
 };
 
+&lpass_va_macro {
+	status = "okay";
+};
+
+&lpass_wsa_macro {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };
@@ -1039,6 +1048,32 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&swr2 {
+	status = "okay";
+
+	left_spkr: speaker@0,1 {
+		compatible = "sdw10217020200";
+		reg = <0 1>;
+		reset-gpios = <&tlmm 158 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		#thermal-sensor-cells = <0>;
+		vdd-supply = <&vreg_l18b_1p8>;
+		qcom,port-mapping = <1 2 3 7>;
+	};
+
+	right_spkr: speaker@0,2 {
+		compatible = "sdw10217020200";
+		reg = <0 2>;
+		reset-gpios = <&tlmm 158 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		#thermal-sensor-cells = <0>;
+		vdd-supply = <&vreg_l18b_1p8>;
+		qcom,port-mapping = <4 5 6 8>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <32 2>, /* ADSP */
 			       <48 4>; /* NFC */
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 4f7aca76f364..5b78d111b2f2 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3001,21 +3001,29 @@ lpass_tlmm: pinctrl@33c0000 {
 			lpass_dmic01_clk: dmic01-clk-state {
 				pins = "gpio6";
 				function = "dmic1_clk";
+				drive-strength = <8>;
+				bias-disable;
 			};
 
 			lpass_dmic01_data: dmic01-data-state {
 				pins = "gpio7";
 				function = "dmic1_data";
+				drive-strength = <8>;
+				bias-pull-down;
 			};
 
 			lpass_dmic23_clk: dmic23-clk-state {
 				pins = "gpio8";
 				function = "dmic2_clk";
+				drive-strength = <8>;
+				bias-disable;
 			};
 
 			lpass_dmic23_data: dmic23-data-state {
 				pins = "gpio9";
 				function = "dmic2_data";
+				drive-strength = <8>;
+				bias-pull-down;
 			};
 
 			lpass_rx_swr_clk: rx-swr-clk-state {
-- 
2.34.1

