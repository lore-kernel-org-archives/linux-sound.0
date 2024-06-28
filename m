Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D811DDF5
	for <linux-sound@vger.kernel.org>; Fri, 28 Jun 2024 01:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719536846; cv=none; b=ln0bylVSfaOWfuKRleiHi2bpNKdGEuREeXOfz7z9d9I2wXW51bN5US+DbwQQmTgK55HnfmXfyGmWvyjyRb8Tr4IVr9edmb4MJFPcBnfxaAMqagt/RC7qz3MXXYFWw4fBPvR7o33MCWDKG5+pLUpFwEjF2b4KwyclN6gwXdheDMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719536846; c=relaxed/simple;
	bh=ZZbdHFT9ZRAwH2jwxwKvq+WMg4pTAYm+sxzcfmphUPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e0372MrcKljdMTBGNJDiMHHFoMLSeGCOpuJS0Dr6dBTCJiYFRrbHVCqTypQha90WE677dyXx5XfGV6zaT9K2GTyjAUinMABO3w1Et/u2qIOxDKt8aDNOc3oT63Xs3C2YkMqdoWeFgDqiRyHlEt+tLGmEqtJGt+f7LM+LLUlpvwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i9XeR50I; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i9XeR50I"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42562e4b5d1so480415e9.1
        for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 18:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719536842; x=1720141642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dynAb/Zg+8LwHqw/4XbLMs/MXNbFYTrBo5jd++nUj2c=;
        b=i9XeR50I6m+nb9xnfrPel0TRjc5ET8RlXxnweIh4FBk3vvoc3WHiU/Xl1BZATkWjhq
         5Y6cHnjKDhHSx1N8+ZVS7c9YXKPYdkdioppITH9qsKUlCOOSQdaDiQgAt5twENRKPNzX
         HOH3uyc4NcMTyWlK6+0B4r6WFioWlUitt7tEu7X+6LqYYRsa6HMs5OSon0bSNZTXyBEt
         eOGEFtCnajJKHjiaXKs92AJLdqZnsN82E/nGhE8vEz09nA0eK1aR/omy6nJl4NKcXORC
         CS3muZEgvO+DGZYrRdpaIIa/fCuug7tpBokUM2EJfW+flLsYws+40f9wTKiXeglQCJvu
         a+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719536842; x=1720141642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dynAb/Zg+8LwHqw/4XbLMs/MXNbFYTrBo5jd++nUj2c=;
        b=gfHZZBtwNO9VfO0L+7x1C+g9fpYylCahMro6QJD+j0YCl6GlmB2L9iEIvD+M54D/L/
         iCWV3REX1zFR7l8tkYz3nBswPgPjbbXu+os/iVU04AFkL96pZhsuF76PmNv2yqzOLE6d
         edCD4d/R3EUI8Ck+2UNYy205hGcgyB6jW/AjyoQw6cxGnecumPW49+Ahdd3VNgeaZe/u
         g6/NXr+vyrJCjJCqJW+G9GmPwjpVnRlxD5wt98OeECj7yunSIDbMLRa+kNfAu9QWE0mG
         /zRL0BSDCZ5M7csRpZFGQuLDwMGI7sKmZWItQaXP+fbVsoV61+0XUuv4e5qqNB2hyAH4
         3kig==
X-Gm-Message-State: AOJu0YyDy+XVv3HbHwqmIISGFgGLbRcRtsUp57RXI3I+v/pXW0B68Q6y
	JKOkTHsgcdHjeWYVJe/MoVN2nEYvnCLr0V57j0aDEH16UNH5Up9D29/fOOD8NTsz69EDHZln98/
	Vb7k=
X-Google-Smtp-Source: AGHT+IGOKI5oJNmHOq5jyVwdpyCLf2KYJIoEqX0YWFdClIjga1qqCIxKbsEXzORyUUOyqTbaEueFlA==
X-Received: by 2002:a05:600c:1789:b0:424:a403:565f with SMTP id 5b1f17b1804b1-424a4035701mr65078085e9.11.1719536842616;
        Thu, 27 Jun 2024 18:07:22 -0700 (PDT)
Received: from fuerta.Home ([2a02:c7c:7213:c700:2cd1:b0e8:abb:540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af3c27dsm13075805e9.7.2024.06.27.18.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 18:07:22 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	elder@linaro.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	alexey.klimov@linaro.org
Subject: [PATCH 6/7] arm64: dts: qcom: sm6115: add description of lpi_i2s2 pins
Date: Fri, 28 Jun 2024 02:07:14 +0100
Message-ID: <20240628010715.438471-7-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628010715.438471-1-alexey.klimov@linaro.org>
References: <20240628010715.438471-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is required to enable to HDMI audio playback on
QRB4210 RB2 board.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 3a9fb1780c90..5487b274836f 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -823,6 +823,40 @@ lpass_tlmm: pinctrl@a7c0000 {
 			gpio-ranges = <&lpass_tlmm 0 0 26>;
 
 			status = "disabled";
+
+			lpi_i2s2_active: lpi-i2s2-active-state {
+				sck-pin {
+					pins = "gpio10";
+					function = "i2s2_clk";
+					bias-disable;
+					drive-strength = <8>;
+					output-high;
+				};
+
+				ws-pins {
+					pins = "gpio11";
+					function = "i2s2_ws";
+					bias-disable;
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio12";
+					function = "i2s2_data";
+					bias-disable;
+					drive-strength = <8>;
+					output-high;
+				};
+
+				ext-mclk1 {
+					pins = "gpio18";
+					function = "ext_mclk1_a";
+					bias-disable;
+					drive-strength = <16>;
+					output-high;
+				};
+			};
 		};
 
 		gcc: clock-controller@1400000 {
-- 
2.45.2

