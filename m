Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC3429ACC0
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 17:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935671; cv=none; b=fVNZV0LmGAjmL2SSnk0iYuzJMKamc3+5YPJgngDSf62Wd/ghjN7SGI04cG2kWrjrQcZIOhmG0dTldNN+1vJDp2Rr2K8NHEZs7nXZLGKhPxogxOUIUA1TiB18e0t1CbNA326ygQTcu4++tDHJ7quBapH/qu+9Jy7KOIKY2UR3GNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935671; c=relaxed/simple;
	bh=KEPTMakCA32PkhOCrneqwQED+KPaxi3ID2lG6vlGRmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HL6c6rhoKA3anHIfL48JEGcozhhUdcYrDkIDjutEy/GhbcpNyPNZC1C2YyWWN7bj1+EKjIP6EE4nt8Pvr0f92p3D6rd3dBzBLDX9BbxxEANEbhwr8M/tjXdgIF1eyindcywxQv9NFaj6q9mHMw689Xyw0mFvbdmtM7GaQW5syus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vh6eOja6; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vh6eOja6"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so95680265e9.2
        for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 10:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935665; x=1748540465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b6zBILNgMTTruPAKW6TCbU3LqqO81pSI/MBmJZg4XxA=;
        b=vh6eOja6Pyx0N1mL7J5ArhNCbPg6RCcMCYbJEoiyyjvPI9cheM9vyZ2jmrBvBqKikP
         4zssXMDJ+pe4wiqXvYAws8tfKAix/8J23/l/urxF8Zf/Darxu+wQH6rpNkhzJy/buiZu
         PKndfdpYUHmCf42fQ1Za8OQ3eWbmc99/aDe1j1P/lTfYy5HS5GFC8lIkxafRw/RKX6ox
         h20bB29XG58Qy7LSzhzOaw4PVY1FpOPODj5AfYxzMo6hPTstKZEDP1ODIQ3f5CJy1tf8
         D4snMholPimtH+GOu8+BKka2vI8iDtkW9XR5hwd83+GD+a8siEEO2MR9KzHKxDNdQSGa
         ueeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935665; x=1748540465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6zBILNgMTTruPAKW6TCbU3LqqO81pSI/MBmJZg4XxA=;
        b=TPGXURRnHF2P1JDKLHXNbqAMW1TPDx9GhZfhH/B0o6FRaHhlRUGwQNVmYfC9C3eXAg
         yQ2rskxXdWcsQCaPw0Oro1NU2SriF29GLv/D2rkvhdI5HYEf3i/YwDfLBw0j6GSox9jy
         9wbwgagq1EgOQoivdtVA7rAxcM9OF+wN5UmuLbff9aWDfql4cc/W2Sd7WobA56lucSoC
         PoyEfe/7FbDFyIgm39s/UpzeqXOyYfTGahGZ8LT+irByTerOEPcQ60DaLC2Z+wURmbDb
         enERIIlDdoteFplEIhR+T2mGH9gpF1DiznBkgp2UJxfG3vUjzXlVOVuNwlNXWpgt7sdv
         sVRA==
X-Forwarded-Encrypted: i=1; AJvYcCWeZemjXbE7GaFI0rpPzjIZLBpTa53HI33WnyNKBf5zjPbeq4vT2IY9l3/MCcJi0T4ZKCe8QWpd+/zzvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrxE9yypZRpBBJqwYaFOiBcmEKGagPd4lrewmbjPdiyKD94125
	q8a9/OtOHBt3lAx6h+e8nd/FC2/SP2+qzAePmf/oIhiQKNp6Ib2M+n0Mo/qIgHZ0Kgc=
X-Gm-Gg: ASbGncswqtL3RVHZq00VXTz3m9PRHTqUGQKpZgCpi+PzzyTd4ntHUAj+KKXi/Ew3XNs
	w3AmuEeOxHDGh5U7j9zot6QHLND/hqso+g5Bn6Jouj4OwKmHK+tHz0wchMR3AmbzyzdKmjRHDvX
	T2owQYhc+RTibQw3vlBkiV0h5reZaulBRTd8cP1fhPb/ZIA0zJH99nesBG+gbIOlLYEXQMnM+DB
	fShbZ6R5HI/rCIp62mMi1/Vs7/8Zteec2i5kWexggJEwmouwBiE6Ll2XhSzUOioGvBICk78bNZu
	nfOomRnSyxZFRV5DJ5Vt02Gf67/jdyPZwzQuXbAgD4zj1g8+zutlomYOHuscfCUCUODicg==
X-Google-Smtp-Source: AGHT+IEF5HaUFQwCelNdRVlj1OZcIfPLTd/t+FpobYKsjTVhFlb/PhZuoCsEx3xvOKWYBUnoGfdrcw==
X-Received: by 2002:a05:6000:184d:b0:3a0:b84c:52b4 with SMTP id ffacd0b85a97d-3a35c809250mr25368671f8f.10.1747935665397;
        Thu, 22 May 2025 10:41:05 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:41:04 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 22 May 2025 18:41:00 +0100
Subject: [PATCH v3 10/12] arm64: dts: qcom: qrb4210-rb2: enable wsa881x
 amplifier
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-rb2_audio_v3-v3-10-9eeb08cab9dc@linaro.org>
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
In-Reply-To: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2

One WSA881X amplifier is connected on QRB4210 RB2 board
hence only mono speaker is supported. This amplifier is set
to work in analog mode only. Also add required powerdown
pin/gpio.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 6bce63720cfffd8e0e619937fb1f365cbbbcb283..4b878e585227ee6b3b362108be96aad99acba21d 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -270,6 +270,24 @@ zap-shader {
 	};
 };
 
+&i2c1 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	wsa881x: amplifier@f {
+		compatible = "qcom,wsa8815";
+		reg = <0x0f>;
+		pinctrl-0 = <&wsa_en_active>;
+		pinctrl-names = "default";
+		clocks = <&q6afecc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		powerdown-gpios = <&lpass_tlmm 16 GPIO_ACTIVE_LOW>;
+		mclk-gpios = <&lpass_tlmm 18 GPIO_ACTIVE_HIGH>;
+		sound-name-prefix = "SpkrMono";
+		#sound-dai-cells = <0>;
+		#thermal-sensor-cells = <0>;
+	};
+};
+
 &i2c2_gpio {
 	clock-frequency = <400000>;
 	status = "okay";
@@ -736,6 +754,14 @@ wcd_reset_n: wcd-reset-n-state {
 		drive-strength = <16>;
 		output-high;
 	};
+
+	wsa_en_active: wsa-en-active-state {
+		pins = "gpio106";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-high;
+	};
 };
 
 &uart3 {

-- 
2.47.2

