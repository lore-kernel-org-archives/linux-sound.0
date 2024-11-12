Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496C2207A3E
	for <linux-sound@vger.kernel.org>; Tue, 12 Nov 2024 02:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731379998; cv=none; b=Xm4ULqRWWOiNMGXx3pFSlLpP5MsOlQ3Y8hinuN8GAxxDH22HxMHH0d06mBgZiGqsvNPh+FJjDRtVwKjQZdZK9OQD7fCYczDKDQVJX/lFFYQaZIkio1uRD+SnOOdmjNy8D8VpKduJYLx0aNq7oq+VDv1tF+gLVT/31HdVVxmNQxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731379998; c=relaxed/simple;
	bh=REvlMMxx0XAJybhZSmB310utOAbwLWPvmzpZTyrvIuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TB4TZNQ5TjqhqtnIn7vFTDy96AMLyoR5TrT194q3+LJRwt9sniTzXvIOaaJrY5PZlB9lcBrcFQYAAD5OUB02ZlElUpPL+F+M48jIj87PPMSaH35flj2xi8zqeLz8nCLqvmz2yQ8QKkTSfBLRacanqiyBlwUtYSqqHcnRepPNW+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jzudQ6IX; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jzudQ6IX"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-431481433bdso45356855e9.3
        for <linux-sound@vger.kernel.org>; Mon, 11 Nov 2024 18:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731379995; x=1731984795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Lorw65PtQ4cm8iqjexRvk/cRJr+lEVzhB14Mwt3cdQ=;
        b=jzudQ6IXcq6zylUew8J4c7ND21Fivm26rnbW39CiC09GFjtfG/ROCRKbahgElPV4I5
         7ruzqXr+SV9FRDh+p2+8SRwP1L/z70W+qH/gztfnQs/R6VdMaFPg9k5QoZ/bkcmpkQMI
         sbb5KQQS2O8Mltx70AuJsDzm4UmrZUMPFLSzhIzY/QlLvanXP/7/r/fAkOMBB9J9ZTJf
         wNbxGda1p1uHgpMAFeGnkybvw4PqXh+dzyZaAH3XKn2I039b7dEbv0SMZCdJlqXqyz8r
         S93hjsS7tIuwPZzrAIWD0lo7ltuAOIz+IKe2lvkR1rfpJ0pqqcVsbTfavanHt9GbtylC
         B98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731379995; x=1731984795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Lorw65PtQ4cm8iqjexRvk/cRJr+lEVzhB14Mwt3cdQ=;
        b=nJH4ncrS+LxOCkLEVuWo6jnQYbfDzDzPbArQRhQcpiHc+VgSIWvvHBlsjqQhmn+wyF
         MgHyGD09Am3N7hcfquLYsSUEOjRm7xk215ju8+9/5NCnKQUGJ3vsog3CNzQOHURf8t/t
         Dz4/B/9bmCCzn9HqSLMULlMgdLr3ePscVKCyt4ZQ5cUtKGFwOedzj/kHKf8EvOUVlrBm
         k/0z2wfA9tK4zZQ0xll0xdWGufqYGyvwX3fq+4PNMoKhg8g94mb7KI8EBkShKmpgjCkl
         40ggt8yVXAjnlyAUejR46s4dNlzqMgCFZ2EdFLNK27mZ92CK7ZO1ZTXkCqjuh95ssk1o
         yb+A==
X-Gm-Message-State: AOJu0YxwX0zCuvom0iqEzMb8yA6y4b76XMOLoeJc+2XxDmjMa7+O8/k1
	FiVv0lhP9adlhZb4PNw3exj8E64H9VG8gUJRL8S+Hhg23LJwT5QTlNJQ2EaSZc4=
X-Google-Smtp-Source: AGHT+IEXkJ1aBj0V8ruILZdaXYACOVbungEyelI77L3kEH9tEoDfZehKRKzAE7Jp6HasezXgUkm9Zg==
X-Received: by 2002:a05:6000:2d11:b0:381:f604:4aa8 with SMTP id ffacd0b85a97d-381f6044ed7mr6571685f8f.53.1731379994783;
        Mon, 11 Nov 2024 18:53:14 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed999e0csm14056380f8f.59.2024.11.11.18.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 18:53:13 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	a39.skl@gmail.com,
	konrad.dybcio@oss.qualcomm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/4] arm64: dts: qcom: sm4250: add LPASS LPI pin controller
Date: Tue, 12 Nov 2024 02:53:05 +0000
Message-ID: <20241112025306.712122-4-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112025306.712122-1-alexey.klimov@linaro.org>
References: <20241112025306.712122-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
controller device node required for audio subsystem on Qualcomm
QRB4210 RB2. QRB4210 is based on sm4250 which has a slightly different
lpass pin controller comparing to sm6115.

While at this, also add description of lpi_i2s2 pins (active state)
required for audio playback via HDMI.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm4250.dtsi | 39 ++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm4250.dtsi b/arch/arm64/boot/dts/qcom/sm4250.dtsi
index a0ed61925e12..cd8c8e59976e 100644
--- a/arch/arm64/boot/dts/qcom/sm4250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4250.dtsi
@@ -36,3 +36,42 @@ &cpu6 {
 &cpu7 {
 	compatible = "qcom,kryo240";
 };
+
+&lpass_tlmm {
+	compatible = "qcom,sm4250-lpass-lpi-pinctrl";
+	gpio-ranges = <&lpass_tlmm 0 0 27>;
+
+	lpi_i2s2_active: lpi-i2s2-active-state {
+		sck-pins {
+			pins = "gpio10";
+			function = "i2s2_clk";
+			bias-disable;
+			drive-strength = <8>;
+			output-high;
+		};
+
+		ws-pins {
+			pins = "gpio11";
+			function = "i2s2_ws";
+			bias-disable;
+			drive-strength = <8>;
+			output-high;
+		};
+
+		data-pins {
+			pins = "gpio12";
+			function = "i2s2_data";
+			bias-disable;
+			drive-strength = <8>;
+			output-high;
+		};
+
+		ext-mclk1-pins {
+			pins = "gpio18";
+			function = "ext_mclk1_a";
+			bias-disable;
+			drive-strength = <16>;
+			output-high;
+		};
+	};
+};
-- 
2.45.2

