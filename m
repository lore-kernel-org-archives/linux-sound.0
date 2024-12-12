Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158877DA67
	for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 00:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733964462; cv=none; b=FiYhouevZPZ3/anfmm9jNLoIX5MMo1oa2Q9OMKI28RIeWQT+7DGzvZzwKkaOhiekyxcGnJC7oYwaCJZEMYfjLVsloaU1baPdwu/UUV0vrrtg9NPVZAkeiTIKuefCnpehCE+P+Q2EfSlL7JtcPap1hCTjrIlvPIQ5Tzcm8y1ghzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733964462; c=relaxed/simple;
	bh=VcDfr3Lt5hKiAoZ77NfWvgJsCBvmpceDpK8hpp98ByU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y7anBn/Gdq202Smi8LybXIBQx5dTN/or0fwGPy/XZw2m0kOKyspgZzaLRPJfIrTmhipLA6eF81ulsdKaJBN4qDsMT3EnPlmmYYdVxEHIxa289QbUxs0NhBhiN3Y9zH5JqZhQKzmkaPo4/gN19Fa991HhEBZcWt/5LSitA/hkoaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tQwIp+kb; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tQwIp+kb"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434ab114753so286165e9.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Dec 2024 16:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733964458; x=1734569258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTnPl8WPue9GkuOReiVApSbo/qq5drlSaoqa3s2cxF8=;
        b=tQwIp+kbumVPMzylzw/vxzPNAOhBfHQezg8Cqu9SEOVVeGu7LGNnM7PBGo/e/yCyUu
         EZli5Q0bCgjI3+j55mW+yWQJKlSYEV+MDkPuhpzogwPQ8SMIIAly/QR5jgG5F08uUbdV
         BGBz8uwWlJKw6RwwIrApLqYAoQGvcx1dxz0g0tGSAj6E1opXZAzIyQ1jrGX92I4vLiOr
         mNaG8K3nrZwYlpr50WuJe5MvrcSjlAPwV1cIvU9/AE7pHQkxxoxPsSts2bZj6chSKeYr
         48WvXT/MFMXK/LM7FHfvCpam0DGRw6WnNv8VWgb93fb1faNQanyr/N/o5j9vRfRrjHgb
         CEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733964458; x=1734569258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTnPl8WPue9GkuOReiVApSbo/qq5drlSaoqa3s2cxF8=;
        b=mYnJvz3fFRWIAzMKbBRDXEAHOuhWc94KvErW/aRCozdcE8MMqEx6PgqaGK85N2WAEs
         XsiE60mbSH2h61KgjOFkN4iFK9YUk7rHJ7CEzAbywkf6P4AwYkfpfnsTeleGgw2il2Gj
         EMnk6Ep4rb7l85l5XleFl5SWhhCOkYrh6LJZPyQd+01pKjvT/DBPzHVdrbSqf9TRXjgC
         thXv46awKOImQ3UOXyWa3YkX7NSLs/adwCaW/TWkhzBB1KJI+uOUKd7Fd2tYEOGzCU77
         KsZzWmagEFz3RyZ+utw8Z9iR+sU0Zk4qHOO9zB6RqKqjwElN2WApydSegyO/Ai2woB3t
         9iRA==
X-Forwarded-Encrypted: i=1; AJvYcCUGTE0uKWFxVbQtLzvLoQROnNtBUUJxSOHZH0ceYlD/4cmZl96CGzjyFHffDG+Yyh3Lg5nBCBsa++QCOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWx4hEPgkoTQPhQfecafvfgZ/k5PTQQTjLcBASsh400Qw07PJV
	Nm2KFColvuSVj0L05ENP8+gTp7d3mtklQJgllj4IuoIOrrYzv9OmIG9Q7UkmRWQ=
X-Gm-Gg: ASbGncvNxk7I4suuYoQd/vmmSMELk2tvYn30AJyJ1Dp11Fz+W4G3ZNsMxArajQxIXt/
	4OOqS2jQ9ddZ+Up/WbveanDsMuSzX0OzDM1uBkF3wlZ1nO+8k3hYwmdXLD23RkLh7RR3WKZmp5L
	YH22UgmI1dtan5JBE4JQhjvBUt8mBr7O0C9Sd5PeDFtnleEH+EEGFCggpMDPm8KEtFmETkK9egf
	IPclf/HCqjOWm9jt8C5AF+hIgc+IMeDk3iG3Zw/utZj8Zo3BFcBt3DU8cBt+Lu9dWJd2o6z
X-Google-Smtp-Source: AGHT+IF6am6lPKI4xcRMhy4NNTcsJOmsxM27JO68aKAsm4zvbgjSuu3xAU+7ShZcg3XMlMDenV4jVw==
X-Received: by 2002:a5d:584c:0:b0:382:4115:1ccb with SMTP id ffacd0b85a97d-3864ce49607mr4242548f8f.7.1733964458438;
        Wed, 11 Dec 2024 16:47:38 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4ef4sm2459660f8f.39.2024.12.11.16.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 16:47:37 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/14] arm64: dts: qcom: sm6115: add LPASS devices
Date: Thu, 12 Dec 2024 00:47:17 +0000
Message-ID: <20241212004727.2903846-5-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241212004727.2903846-1-alexey.klimov@linaro.org>
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock
controllers are required to support audio playback and
audio capture on sm6115 and its derivatives.

Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Co-developed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 132 +++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index df2241237b26..9412cbe23d88 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -2687,6 +2687,138 @@ funnel_apss1_in: endpoint {
 			};
 		};
 
+		rxmacro: codec@a600000 {
+			compatible = "qcom,sm6115-lpass-rx-macro";
+			reg = <0x0 0xa600000 0x0 0x1000>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_RX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_RX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&vamacro>;
+			clock-names = "mclk",
+				      "npl",
+				      "dcodec",
+				      "fsgen";
+			assigned-clocks = <&q6afecc LPASS_CLK_ID_RX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+					  <&q6afecc LPASS_CLK_ID_RX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			assigned-clock-rates = <22579200>,
+					       <22579200>;
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		swr1: soundwire@a610000 {
+			compatible = "qcom,soundwire-v1.6.0";
+			reg = <0x0 0x0a610000 0x0 0x2000>;
+			interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&rxmacro>;
+			clock-names = "iface";
+
+			resets = <&lpass_audiocc 0>;
+			reset-names = "swr_audio_cgcr";
+
+			label = "RX";
+			qcom,din-ports = <0>;
+			qcom,dout-ports = <5>;
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x1f 0x1f 0x07 0x00>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
+		txmacro: codec@a620000 {
+			compatible = "qcom,sm6115-lpass-tx-macro";
+			reg = <0x0 0x0a620000 0x0 0x1000>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&vamacro>;
+			clock-names = "mclk",
+				      "npl",
+				      "dcodec",
+				      "fsgen";
+			assigned-clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+					  <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			assigned-clock-rates = <19200000>,
+					       <19200000>;
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		lpass_audiocc: clock-controller@a6a9000 {
+			compatible = "qcom,sm6115-lpassaudiocc";
+			reg = <0x0 0x0a6a9000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+
+		vamacro: codec@a730000 {
+			compatible = "qcom,sm6115-lpass-va-macro";
+			reg = <0x0 0x0a730000 0x0 0x1000>;
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "mclk",
+				      "dcodec",
+				      "npl";
+			assigned-clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+					  <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			assigned-clock-rates = <19200000>,
+					       <19200000>;
+			#clock-cells = <0>;
+			clock-output-names = "fsgen";
+			#sound-dai-cells = <1>;
+		};
+
+		swr0: soundwire@a740000 {
+			compatible = "qcom,soundwire-v1.6.0";
+			reg = <0x0 0x0a740000 0x0 0x2000>;
+			interrupts = <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&txmacro>;
+			clock-names = "iface";
+
+			resets = <&lpasscc 0>;
+			reset-names = "swr_audio_cgcr";
+
+			label = "VA_TX";
+			qcom,din-ports = <3>;
+			qcom,dout-ports = <0>;
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x03 0x03>;
+			qcom,ports-offset1 =		/bits/ 8 <0x01 0x02 0x01>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x00 0x00 0x00>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
+		lpasscc: clock-controller@a7ec000 {
+			compatible = "qcom,sm6115-lpasscc";
+			reg = <0x0 0x0a7ec000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+
 		remoteproc_adsp: remoteproc@ab00000 {
 			compatible = "qcom,sm6115-adsp-pas";
 			reg = <0x0 0x0ab00000 0x0 0x100>;
-- 
2.45.2

