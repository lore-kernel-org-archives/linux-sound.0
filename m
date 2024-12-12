Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC8D13AA27
	for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 00:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733964465; cv=none; b=VS/JqhdjH8quDZdLb+QN/VhEEQOXRcCl/icU07dAPRmnL6CQe/bTK0iI7EqW3Av0DGAiQ178z2QsUhHW3SXrEnTP06hVGqupzjz8fRN0Fp8mcHrtGy7YyuVp+pI9ye8ZsHdCnILBWfIo/cpkmGMWo5F0Y63ih7GcXYEW8/0qK0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733964465; c=relaxed/simple;
	bh=tyapNoEQY3XYO+jmzcvBF2+W19GTvYciSfkZQRjl4gE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iRO9EpWlMtCBucOEWlxu39Be8SxByTn5E0Q3yFGTEQ3CD87qbZ2CFYMWm88CmamtZ5Ifp7leik2Vxx8ZIvSf5IaZ+KOdF6C7s5oSf2FI62fuZymr4Dvls5cLUCSTu+zkIcVoVaCwnORQjfsyWt/VLO0KmRaKuuEn4t4z3elwcw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nCIDFUqZ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nCIDFUqZ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-386329da1d9so7433f8f.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Dec 2024 16:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733964462; x=1734569262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeswejV8LMfcb7qwCslWXku0mWaecv3bAOXmE+9YQHo=;
        b=nCIDFUqZC1EYfaWP4mXqjCQiKZbE2+3ycLkcLsNwfWHH3GRPtUJUkRl3xniTPgwBu0
         er5csjwZPBrS/V00d/86Q6mHu5VB2RQtbQQq1K8WLOs6ppQ0kbgajOgpXcES+KgsIUwJ
         D15vFpmbB+9BJhG7dhwzvzz0tVst2bZQ/utRtdqUkcrVsGlWgWZeBUmJ6q/Nv19ZOmip
         bGPSSe+t0KScCcd3vy9fwkXBVvuwoXT69xmbKGxvpUVqEmZW4SymO2CVSxIMbhAYBx/Y
         kDHy4/v9Hr30QgtxO9KM+34ddg4Tc2Rj+UHFGxbneNW14KNUm0hpEkJQfU94Ar7dQQZJ
         KNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733964462; x=1734569262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MeswejV8LMfcb7qwCslWXku0mWaecv3bAOXmE+9YQHo=;
        b=Qo3841pedPBMv97MvqXtrEfR2qp3n3th0d4rAgRXdZSnTV+8HVtpUGAfQzn7Xjx0JE
         wlA6U/92wzXdtbTPkv3Z/LpjSW5m9srU0ti5l/k4uNfhtNZ/DQ3EqpjNgw3Qtw4oKeJR
         8ykL186b+oox3HRvtTjmtJwNFv/3ldBdjCknr54fOpwvS5SPtYIYWIAti1f1DWp0ok5J
         30Hszkpw8+HRa5Qzg/14r3dgfTVp8W69uSozejQpaaV/ScP4V1WonFh0FIf//xuX6myf
         oMaHCMpXwb8ZSKIwu0+6VOkLP3gIv5n/rIfnlHzBrbb/1DWTfB6KBv8pEO71qnZkibUx
         k+JA==
X-Forwarded-Encrypted: i=1; AJvYcCWEbB/Ghlo0/siNAOyO/uNIgq/MI/vEvb2QFosQNoOCgeLwVdTi/ImB6q5TEPH6cGaf8/gbNx7qclmtaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK33kI/WnH669gz2CODvW1FBuzTepA0OQMgrSTWSyBppdLvBT9
	9iytQwo283nYeQvdQC5H7dZVKFMexV5omJgRYaYOvLT7SQdaAVY4RoYADYiLzyc=
X-Gm-Gg: ASbGncugSwXadfL/D2QzFSclYuatygrMXCmlwngg+dftS7cxb7Nzmzhz5/YdCf+/i6f
	efth0NL9AgBYBOBZ37+gI8grEx7gxs4xc/oyf4k+i7n5uLya+nx2e3SilOvk7y2YuaF9A7/8Z78
	EvzYib8KnFCWPLwnBXSLzRVoYfZA0LxbIng9bg8gMLuFf1SlHVGFHnaH0wBud1+yPdVCfzFEgyD
	Ob76c42gBIYRPRuNaePiKwoY5rms4NxKTz/YXDBCsSHSvJ5CYkujEbChAUkPVwfri8GWIwo
X-Google-Smtp-Source: AGHT+IHgKENLpDieQsFB14HFzmuxdYzoOXPmh+CHOUJNHXU2LbSWQXM8lcVrkY+JONlF+DyQH9GcDw==
X-Received: by 2002:a05:6000:68e:b0:385:cf9d:2720 with SMTP id ffacd0b85a97d-3864ce55a73mr3615290f8f.23.1733964462584;
        Wed, 11 Dec 2024 16:47:42 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4ef4sm2459660f8f.39.2024.12.11.16.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 16:47:41 -0800 (PST)
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
Subject: [PATCH v2 06/14] arm64: dts: qcom: qrb4210-rb2: add wcd937x codec support
Date: Thu, 12 Dec 2024 00:47:19 +0000
Message-ID: <20241212004727.2903846-7-alexey.klimov@linaro.org>
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

wcd937x codec contains soundwire RX and TX slave devices
and can convert digital audio to analog audio and vice versa.
The codec node also requires description of reset pin/gpio.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 47 ++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index edfb18c85da8..6217bc6e6282 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
@@ -146,6 +147,25 @@ codec {
 		};
 	};
 
+	wcd937x: codec {
+		compatible = "qcom,wcd9370-codec";
+		pinctrl-0 = <&wcd_reset_n>;
+		pinctrl-names = "default";
+		reset-gpios = <&tlmm 82 GPIO_ACTIVE_LOW>;
+		vdd-buck-supply = <&vreg_l9a_1p8>;
+		vdd-rxtx-supply = <&vreg_l9a_1p8>;
+		vdd-px-supply = <&vreg_l9a_1p8>;
+		vdd-mic-bias-supply = <&vdc_vbat_som>;
+		qcom,micbias1-microvolt = <1800000>;
+		qcom,micbias2-microvolt = <1800000>;
+		qcom,micbias3-microvolt = <1800000>;
+		qcom,micbias4-microvolt = <1800000>;
+		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
+		qcom,rx-device = <&wcd937x_rx>;
+		qcom,tx-device = <&wcd937x_tx>;
+		#sound-dai-cells = <1>;
+	};
+
 	vreg_hdmi_out_1p2: regulator-hdmi-out-1p2 {
 		compatible = "regulator-fixed";
 		regulator-name = "VREG_HDMI_OUT_1P2";
@@ -599,6 +619,26 @@ &sleep_clk {
 	clock-frequency = <32000>;
 };
 
+&swr1 {
+	status = "okay";
+
+	wcd937x_rx: codec@0,4 {
+		compatible = "sdw20217010a00";
+		reg = <0 4>;
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+	};
+};
+
+&swr0 {
+	status = "okay";
+
+	wcd937x_tx: codec@0,3 {
+		compatible = "sdw20217010a00";
+		reg = <0 3>;
+		qcom,tx-port-mapping = <1 1 2 3>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <43 2>, <49 1>, <54 1>,
 			       <56 3>, <61 2>, <64 1>,
@@ -683,6 +723,13 @@ sdc2_card_det_n: sd-card-det-n-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	wcd_reset_n: wcd-reset-n-state {
+		pins = "gpio82";
+		function = "gpio";
+		drive-strength = <16>;
+		output-high;
+	};
 };
 
 &uart3 {
-- 
2.45.2

