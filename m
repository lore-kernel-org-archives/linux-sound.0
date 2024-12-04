Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A68E1F8AF3
	for <linux-sound@vger.kernel.org>; Wed,  4 Dec 2024 14:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733320837; cv=none; b=AxcR9K9tQ5ylTAihGrDEOhTwL+T0S7G2EGjPm3I2imEaFxQE0uS9+33KC1sruaVIrlAUp5lDT696G7tyKCiRfHkWZsQdWAKyKG+HNFj1flBcEzj9vzF9MkdPVz88Ne5zFT5WEnZdQsLb0rSpbcxdFx7G5PaY/cpR9Ybad6I7AFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733320837; c=relaxed/simple;
	bh=REvlMMxx0XAJybhZSmB310utOAbwLWPvmzpZTyrvIuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NsvU+Dtb/6vemwFQGL2iPo+NM1DGW/wbXsBJhDxM8kjFv6kzLmFw54R670TD2SMekAV3aaNO8rDsJDAba6qlftz31nMeB4IBHs2RGiN+JDMp1O/aSvyuyZOnResSYquB+K29HKDBNW+FPHhrN3dIGT5ISfa5bWud1wFqV28ElKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JOJS4CjN; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JOJS4CjN"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385e1f3f2a6so3378815f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 04 Dec 2024 06:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733320833; x=1733925633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Lorw65PtQ4cm8iqjexRvk/cRJr+lEVzhB14Mwt3cdQ=;
        b=JOJS4CjNkh+aw+dEJeFPZcPYIvVVmMnDBdRJJaftoCTwjTkMDrmc0gzggGU0KBQnt6
         //oYfGDy6Lnqz1YJynHWz+GPYCFUlnjEmtiDEDv1YFfRvntSFdpvXGi2wqWTlV1OAsYI
         9z5ZzU0E9TlLRwiQF+/IIjZYHrofMjqSNW/ryfgNSlJcdbpVfQJQHN8oXouvZJQtsAzf
         l2iP3dJokTWIYg+BT43pEq3WvA3qCLXg0iZRwM29rTk+fVZ5tIfPEUiDNNYPhXxf8yPm
         J2jiIb8Th9zhMkdqpbizYEdiiVdN4PanTGvUvL64gOde0xEfFqliTMY/ECrdiIz48TPv
         JK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733320833; x=1733925633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Lorw65PtQ4cm8iqjexRvk/cRJr+lEVzhB14Mwt3cdQ=;
        b=FU8lcReS+IrRY9ZXBrbPqLBEN/ZuP7U1zgDP4K+LW/C0YadGrjOr/hvnoQlGqkTcQn
         Y9zenvYHN90PCfRDrQR6U00IgFGvXx6lc212RuyOgx0NtWOAIfVJfnLyQH6VjX/5X2P+
         S1qQPOrUTSgFhuJIBki/Y7/LX0QQKKPmLYZhH6An+Q3l7JluK0R/u307ZL0gjVu2J6VP
         0fGT4TN8yMJapkXeWQjKSxgP1gTz3aEYqsbc23Gi61ErFXkehacaX3belq4ltmE1Rj5+
         nA/0+9yH/E0BqqDekEMScuZxIgPQfHgagvJrF4+lS51HjQWn45026CLsBK3CtrQJiLHv
         /YDA==
X-Gm-Message-State: AOJu0YxcgGeuIwnrpRdbfT1gW/Ve+5f+Tc/9ITWTqyYOhHwxsPsqnLnG
	Rleu/U3oDInLX22RaFn/FFi3PQk/4y0T0RQABUsgctW6LSR+l1RdiJI47Gbs8cQ=
X-Gm-Gg: ASbGncsY11oW+cmWUTqaTiEH+JrDtypyRHKqNHwb+w+ibp8D+opvNxwdlBHJpng8EIF
	2Lf1wdISeJtwxnfCWNnTpV56MAAfiQexd5Ih+vExpcJB0uq2nXp44zHDgwlewoElZj2mzrPkPyA
	lnv6uZOBbBxp9VjCOWC/g40Vu/DQ7LxSvAGHyjLAZ4kLRwHfe3Am/hzqb5BC8Sy9BMRaGR6tbRi
	hbMgcJz0HmoeTOMahDa6pfV9+nAyuPwT3GahSedElrtAX6eMw/RZwYROwNwnMoVpuaUcjs=
X-Google-Smtp-Source: AGHT+IEhbpa9f+P23WmGe+eMo7IUbIQGX/UUlmqDiHg7PK8H8fusSK3gTlimkg0zm5RcyUlNRq/QLw==
X-Received: by 2002:a5d:6daa:0:b0:385:f195:27f with SMTP id ffacd0b85a97d-385fd3cd094mr4427049f8f.5.1733320833194;
        Wed, 04 Dec 2024 06:00:33 -0800 (PST)
Received: from localhost.localdomain ([2a00:2381:fd67:101:8e2:966d:36c4:3579])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e2c84d52sm13689978f8f.49.2024.12.04.06.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 06:00:32 -0800 (PST)
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
Subject: [PATCH v6 3/4] arm64: dts: qcom: sm4250: add LPASS LPI pin controller
Date: Wed,  4 Dec 2024 14:00:26 +0000
Message-ID: <20241204140027.2198763-4-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204140027.2198763-1-alexey.klimov@linaro.org>
References: <20241204140027.2198763-1-alexey.klimov@linaro.org>
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

