Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B7E126BF1
	for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 00:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733964463; cv=none; b=vF7fEm6UKNTnehs6Jb3vJzuqKyQp+Qw6dhY2g+cmXBYmSbEK/MorTlIFW653d03H9v2vKUFI369R4daLHZiY+uQu+W+syGDGJoJVkQqInmk/dJohgpUNFl+G29YCTcHmeVkjxWlcAeqLFd4WglMrfo1zbNOvB8morrNe4VZ+MII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733964463; c=relaxed/simple;
	bh=KYn3uuYZj7NpZtiTkHvPGGaN8yS+R6O8JQi1SN8+UfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pR9gOD7/60jVbDcP0xoo8wEF6T+HqneewBpdnjrGMzZ+if+OGlVCcaXE4LAwBNeZ6WkxCbynuNstAsLZO2/SuUW/LKudrzeao/S8YpeaHGUPPinM+GxcPMumatjPU8A9W8x2gIde/Ppem5T1s4i+tUZI1Hb5U7nDSODwiy9kEIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P8X5pHkK; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P8X5pHkK"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43622267b2eso513015e9.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Dec 2024 16:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733964460; x=1734569260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrR6DiKypyiSRNkIPUHsCZVzuVT+9VDdCizIFEiX0fc=;
        b=P8X5pHkKaapQm5/0VngGGSBDrJtx8b89/suvo5A7H4wZ4/6g9xQ0Yf1EZeXJGgRJDH
         NcjPo3nZ6Wd60bMuWsfXHVrNslfDAE7SWxL0uQoVuNnhAaDMKo3XgT/y4XtTbYiAaQTY
         V+xb8fi8+0Qr0cb9ICn+/Nb2kzbtJ7Wkgi4WMyHQtFpCOOf4H3kRvVJqVdVtCe+Kl9dT
         whLjValdX3GpbxOGEd5aZB3h/L56H9mImFcjzrOsaP85moHCKtk0tPQxaPem/kzEjqsz
         j5xDRokQY4e1PFq5QsbvSEQaqydMXkK6pjplrL+EK27ZKGh04I2pbZYbTFcuAX1W4F4f
         IK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733964460; x=1734569260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jrR6DiKypyiSRNkIPUHsCZVzuVT+9VDdCizIFEiX0fc=;
        b=Z9liitWYkGB+XQgIHK/sJiXNj6daXqm224+1istiE3IA16xgKaHq2RnRgLqctsf4db
         Go7dbOVcrqvqtV5g0Z+kAlpia6vioFxcPK0o2fMeiIlJtEuVzSXZ6nDmtTpfpirVUeL+
         64Ldl5kyr1pmepN4LehNpnaNjkgbBWTQZmb1W1WU2syDlbUztlWlFrjycxsuPJzxgC4x
         i+vx+R3H+O4p9t1gipklXbLDsD5FCuGzCwzpGrFcRHzIOwzidN7AVbeMr6Ws6SfUQVFf
         9Zpuoqy8HH1iJZATIVJxKeeMM80edIxoEmX2cdQ+DwUZNCyimnpLwXNwXhmrAph0pEl5
         OZ7w==
X-Forwarded-Encrypted: i=1; AJvYcCXWjViY01UvfaUmAUz30ndRxfSR8J5FQmvpJLhySREPWB+4YDromU2FCEQWrMILGG1aPkhKfM3pHnzVrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKLkQXcWfOaN94FalKiuklC+kyVLipzBUgj2VhThTeSfgLMxhE
	VVwDW7wvVAYYD8wrNuq661n00mpOM0egzXXnDiGcG7I0oMZlKvRYue8FZ1g1OeY=
X-Gm-Gg: ASbGncvdkx8PRaZ5Z2qSp7e8PTrdM33IajBmDY36p81EOK90srFA+eGL50ayxFsVJZg
	zl+TDovje1YeaX492QLFZo3x/x10uTG4tkijKYvYSqSVIcdZT557eEEn7Gqhbbz7PR+Va0znx3e
	HFiqUUke+IbJMVYCjDhbYzLoZudl42ibfZbKklhLtw7ejUZWo8gdFS/2sgGEfG7rZd1umvjTIOs
	9cyOq/EGQKcXlicePjrC3ryw0Ys82KCbwDrEY6PUpyCmXjcDhWqJDuAOKbtRbmZAQY8WDqs
X-Google-Smtp-Source: AGHT+IGkBmZlNH90HFm8x5XhlTxKfUTueo4mDUUf5V2mYTwxmdvnSzy08A+89Jn4AKPGnkZs6ppvcA==
X-Received: by 2002:a05:600c:4446:b0:434:fa73:a907 with SMTP id 5b1f17b1804b1-4361c3723acmr38051395e9.13.1733964460449;
        Wed, 11 Dec 2024 16:47:40 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4ef4sm2459660f8f.39.2024.12.11.16.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 16:47:39 -0800 (PST)
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
Subject: [PATCH v2 05/14] arm64: dts: qcom: sm4250: add description of soundwire and dmic pins
Date: Thu, 12 Dec 2024 00:47:18 +0000
Message-ID: <20241212004727.2903846-6-alexey.klimov@linaro.org>
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

Adds data and clock pins description (their active state) of
soundwire masters and onboard DMIC.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm4250.dtsi | 62 ++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm4250.dtsi b/arch/arm64/boot/dts/qcom/sm4250.dtsi
index cd8c8e59976e..723391ba9aa2 100644
--- a/arch/arm64/boot/dts/qcom/sm4250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4250.dtsi
@@ -37,10 +37,36 @@ &cpu7 {
 	compatible = "qcom,kryo240";
 };
 
+&swr0 {
+	pinctrl-0 = <&lpass_tx_swr_active>;
+	pinctrl-names = "default";
+};
+
+&swr1 {
+	pinctrl-0 = <&lpass_rx_swr_active>;
+	pinctrl-names = "default";
+};
+
 &lpass_tlmm {
 	compatible = "qcom,sm4250-lpass-lpi-pinctrl";
 	gpio-ranges = <&lpass_tlmm 0 0 27>;
 
+	lpass_dmic01_active: lpass-dmic01-active-state {
+		clk-pins {
+			pins = "gpio6";
+			function = "dmic01_clk";
+			drive-strength = <8>;
+			output-high;
+		};
+
+		data-pins {
+			pins = "gpio7";
+			function = "dmic01_data";
+			drive-strength = <8>;
+			input-enable;
+		};
+	};
+
 	lpi_i2s2_active: lpi-i2s2-active-state {
 		sck-pins {
 			pins = "gpio10";
@@ -74,4 +100,40 @@ ext-mclk1-pins {
 			output-high;
 		};
 	};
+
+	lpass_tx_swr_active: lpass-tx-swr-active-state {
+		clk-pins {
+			pins = "gpio0";
+			function = "swr_tx_clk";
+			drive-strength = <10>;
+			slew-rate = <3>;
+			bias-disable;
+		};
+
+		data-pins {
+			pins = "gpio1", "gpio2";
+			function = "swr_tx_data";
+			drive-strength = <10>;
+			slew-rate = <3>;
+			bias-bus-hold;
+		};
+	};
+
+	lpass_rx_swr_active: lpass-rx-swr-active-state {
+		clk-pins {
+			pins = "gpio3";
+			function = "swr_rx_clk";
+			drive-strength = <10>;
+			slew-rate = <3>;
+			bias-disable;
+		};
+
+		data-pins {
+			pins = "gpio4", "gpio5";
+			function = "swr_rx_data";
+			drive-strength = <10>;
+			slew-rate = <3>;
+			bias-bus-hold;
+		};
+	};
 };
-- 
2.45.2

