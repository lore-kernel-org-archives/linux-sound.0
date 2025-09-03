Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64DA322539
	for <linux-sound@vger.kernel.org>; Wed,  3 Sep 2025 15:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912451; cv=none; b=DkqjIAKJK8zH9d32zZhubKuKG8dv3QSDIo0EjacKOGJUVnKCeMmzU5B3MoPvquw4yj24mMz8UUPfRoDjkK3pxiJAnKTBJfhKXDqVB++seUvgE7xLBjh2wl9Ng7TixPr4R+VDXgQSmMf5MWwEnRcGHuh9E+Dd79NHRYuwxsbfJj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912451; c=relaxed/simple;
	bh=iBKYOpGPyv+9zI93qQknVrs+/6gKwzWVCvy1W+3qLW4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c6b2TbaCTchGmF702A90EgCM70dH+MqYlCJ6mwUdV90Z19mMhwXpPwuZMSD2SNzMy4HGyL0G3GYLGDDiMY0Y00NG7+mSIZQkSWbPYIcp3W3VL0f07IKZfebTCIYTVTF3SDqAV0q3OW0SfeCjoHBv1l1xyuDrHTCEdJintfFUZy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aUJvs2LV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aUJvs2LV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Dx1w3005455
	for <linux-sound@vger.kernel.org>; Wed, 3 Sep 2025 15:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RsvsUgYey4U
	BhpLmgTWdFwV40CxonIezuuQ/VfUSJX8=; b=aUJvs2LVsW8uQ84kIHe3/1cDbws
	9A7sdTsAoQ4Ed8Ax5BUtNkoW9vPHEgYEpXZvswh6MCi2VGD+gEzfUyBUmmjZJ0Ys
	JJ7EmqopLx/QxPQrOSsu4okv16zHReznLbQc1xq7jTsNeSlxjnetwY9nCdY/FYja
	YdBMYUXWvpyeqP7mvl4eP9tgjFeYgmfHgbQHijTYmnfuqSpIuemLv0UqASljeqDD
	QYy0IcBW5+x63ugKmfHSI4D3J285ljF16nU98kmOw8NLCOgqixjHv6Vb+iCfJAEk
	jhGpUkx5GlhXCPEz8eKlIqbF1gHUxhoP0qra/PUW7Prlq51lgf272BQ648g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjm39n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 03 Sep 2025 15:14:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24a94fef521so675365ad.1
        for <linux-sound@vger.kernel.org>; Wed, 03 Sep 2025 08:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912448; x=1757517248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RsvsUgYey4UBhpLmgTWdFwV40CxonIezuuQ/VfUSJX8=;
        b=GkrxizZvyP0U3flrWUR7AIs62Favjt7v6pHKbZmLS2vbxHNA7lBchi/8HXe/1uFheQ
         0HSZE/L4loengxazSXxFy0IleaMg5yeim2LLLp0/HnvRVZxpcIkM6VuAFI96B+oR0Nrn
         ua+WZMB2A72VR1GKVbRIMWr+ukdPw1t0G2lmhw77ELEC45ppEK1LmfowBrdZbIHYLjAD
         JR6/+I/Kxm//s+KHlnvC2fxoKI4byZp8UkFhUCc+kSF16TqRTiKdsiPZbrGMSF55MXv3
         Sp4e5yWiAn674Wd3Kv8UlWi4eJcCZf3ReMvkrC8K8OO980xvYkT3VbaQiXASxvIG+11d
         QU4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVuYHWW/TlQHDqYTw6QbV3T6SpjP/qGTtVQRnaNlEBobQ0zleDzxglYzZkS8sGvEjyq7g3KeGMRGtM/Zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBtS2T0azA5ftLHMod4daze8969jByAi5h3G1E07Fw2aqBzadJ
	m8bjeErbJ76WhzWpj7m9DKV7NPU7GAhZlFtuiJqz3hqrcMDzJWyKN2jrZnkkvhmGnADty6AzTbS
	IYey62FKxq1eduYn1ZIxexPvV3cxudThB/0/dUiYtBiQn1/4b8fxGt4bR+amk9z30IQ==
X-Gm-Gg: ASbGncuiUdXFe6XqU8DbGI+F8r496/LddQe8zgpWdsPkD2ftqZGTtEUT1hNCmjdUJjE
	FgjAGLaS0MpfgZ8mHnTRsIGHbLgjxdyyOmEh7md0ldp22tNQCQk3ALJzfrH0EDPJSOOIpvWaQIV
	Qb6OeiMaSj4Yg6vypZvpYnNoXKCP8knUx2UM1anK+B+okqnzHF1yVs4zdfZ4KtGyggi5SfLZeJF
	dqT5jTxJEYLurwGyrzLB2heeMe00a4G+Nzghm5DatZEVaqznbbnte7rEeiYWm/ks597npi1fyxP
	Ki0FZFKAJ23OTead5/wfACPOf3ouRRKj9Uomeouot3eJlKJK53xUaYq4JM/Kf0kDSIpb4+aqCpb
	9
X-Received: by 2002:a17:903:2c03:b0:240:92f9:7b85 with SMTP id d9443c01a7336-249446d2982mr177996845ad.0.1756912447429;
        Wed, 03 Sep 2025 08:14:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0MgnlTxIAVarLgp0e9JQQUNXagDbI4OQFXCoge5p1C6fk5EN8sgATia2tBH5VV5Q9tApHRw==
X-Received: by 2002:a17:903:2c03:b0:240:92f9:7b85 with SMTP id d9443c01a7336-249446d2982mr177996335ad.0.1756912446898;
        Wed, 03 Sep 2025 08:14:06 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903758b89sm164818945ad.59.2025.09.03.08.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 08:14:06 -0700 (PDT)
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
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v9 3/8] arm64: dts: qcom: sc7280: Add WSA SoundWire and LPASS support
Date: Wed,  3 Sep 2025 20:43:32 +0530
Message-Id: <20250903151337.1037246-4-mohammad.rafi.shaik@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b85b40 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=cYIjkc3OaKe1eJlVBt8A:9
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 8HUGvtmO209LgOrnFekzNsIwLgjsgiMN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX8CP1VeP+a4wg
 EXuAkB0P5+FbUeok664J0Umw6G0lUIxQwpI/1emcBeTEpxMfbYxPEYQ6aQm4jbK79ow+dR4Ailx
 4Uk7pE953OsvNDVfu+BCKE0014lZ0xkDyhtv48MpbIxhGEDtjRf7qxIYlJw53l0sGN51/fJCgJz
 aGYHh+z0R6x3NJVdBEngXOnt7R3ZUsN1s89NXhQ70IvboIGgU5nTwXukQ4ymN1S3+ufpUu9+X4s
 lKUghrSFshWLnXSYWMETrK3h5XZ+AeWxwa26B4ywKxgdUK64Q3tC/1VwsEF/VNrvly1HPZXDhCp
 hhoTfxrPICUpqWsOuhOvb44hzPX0GLid4BC7ZMCnOoonardJSgCWonDsLrmKI1Lyu07kmDq9Ifn
 nnPYtwa5
X-Proofpoint-ORIG-GUID: 8HUGvtmO209LgOrnFekzNsIwLgjsgiMN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

Add WSA LPASS macro Codec along with SoundWire controller.

Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 77 ++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 9fa294cc9a3e..4f7aca76f364 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -28,6 +28,7 @@
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,lpass.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
 #include <dt-bindings/thermal/thermal.h>
 
@@ -2773,6 +2774,66 @@ swr1: soundwire@3230000 {
 			status = "disabled";
 		};
 
+		lpass_wsa_macro: codec@3240000 {
+			compatible = "qcom,sc7280-lpass-wsa-macro";
+			reg = <0x0 0x03240000 0x0 0x1000>;
+
+			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
+				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
+				 <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_va_macro>;
+			clock-names = "mclk",
+				      "npl",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			pinctrl-0 = <&lpass_wsa_swr_clk>, <&lpass_wsa_swr_data>;
+			pinctrl-names = "default";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
+		swr2: soundwire@3250000 {
+			compatible = "qcom,soundwire-v1.6.0";
+			reg = <0x0 0x03250000 0x0 0x2000>;
+
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lpass_wsa_macro>;
+			clock-names = "iface";
+
+			resets = <&lpass_audiocc LPASS_AUDIO_SWR_WSA_CGCR>;
+			reset-names = "swr_audio_cgcr";
+
+			qcom,din-ports = <2>;
+			qcom,dout-ports = <6>;
+
+			qcom,ports-sinterval-low = /bits/ 8 <0x07 0x1f 0x3f 0x07
+								0x1f 0x3f 0x0f 0x0f>;
+			qcom,ports-offset1 = /bits/ 8 <0x01 0x02 0x0c 0x06 0x12 0x0d 0x07 0x0a>;
+			qcom,ports-offset2 = /bits/ 8 <0xff 0x00 0x1f 0xff 0x00 0x1f 0x00 0x00>;
+			qcom,ports-hstart = /bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop = /bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length = /bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode = /bits/ 8 <0xff 0xff 0x01 0xff 0xff 0x01
+							       0xff 0xff>;
+			qcom,ports-block-group-count = /bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
+								0xff 0xff>;
+			qcom,ports-lane-control = /bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
+							    0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
 		lpass_audiocc: clock-controller@3300000 {
 			compatible = "qcom,sc7280-lpassaudiocc";
 			reg = <0 0x03300000 0 0x30000>,
@@ -2976,6 +3037,22 @@ lpass_tx_swr_data: tx-swr-data-state {
 				pins = "gpio1", "gpio2", "gpio14";
 				function = "swr_tx_data";
 			};
+
+			lpass_wsa_swr_clk: wsa-swr-clk-state {
+				pins = "gpio10";
+				function = "wsa_swr_clk";
+				drive-strength = <2>;
+				slew-rate = <1>;
+				bias-disable;
+			};
+
+			lpass_wsa_swr_data: wsa-swr-data-state {
+				pins = "gpio11";
+				function = "wsa_swr_data";
+				drive-strength = <2>;
+				slew-rate = <1>;
+				bias-bus-hold;
+			};
 		};
 
 		gpu: gpu@3d00000 {
-- 
2.34.1

