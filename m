Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3408616BE3A
	for <linux-sound@vger.kernel.org>; Fri, 18 Oct 2024 02:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729220103; cv=none; b=nU+8dTvY59YfhWi0KwYkI58BlKRJU504TqibdgLxlBkNg7BbeKANEb7e8JjK3kmDfH+nznVCh9umfCgSzgbTNN0d1TYsyGZTElA06w9xM6S8AwBIjUoeUjP005YhrlmZC5vEYGSVhZnYQFBBNmVN2Zt0ZMJkW7lJ+iFRvp7tZfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729220103; c=relaxed/simple;
	bh=hqXupY2ADGb8Cnb+Kj4tt/WRXJGRf0F1nR1WKfBvTWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hV3HueFMYHLIX869zCD976vn73HYVW9hlEWNvgE0gRuJnt4TD0XfscgrP8HGnFeJXW2Xh+glDJVD6mzyNXxD1IGZmPOwrr3C2tu5sBP3B0L31ki+dn2Pyec1rJO3KX1fBegIv6Ee3OOGWDA6NjMTgYC89cOvfUN+8x0ESo6cTrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HxwK9aFW; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HxwK9aFW"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso15214465e9.0
        for <linux-sound@vger.kernel.org>; Thu, 17 Oct 2024 19:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729220100; x=1729824900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsLzVHKzeV33ogJAzMy8zA1MEbSeiTdl6VMX9FoSLcE=;
        b=HxwK9aFWA94Bllt1RONM1mjdDQp591JwN4XSvZnF1scXl3QTsyhRWaVc5L7tp2MUpz
         jP+zHDqPv77vHrevSNjBAXfKe3754lX/yjUQ1QVA22nXhLEt71WQHJCyrogV7XOuBaCT
         y3B45RLFiE8R0IcAoPj9rmfcb5c2BRyphybK5frMGO0sR7vE8e++i3DBjc2QBPxSiJ5d
         JtEhXGJaoUpmBlwatkHmajNHiSQirz2iOvejOu+rDkF4NBbKWqfglpg3ebIlR5zRF+WY
         P5TM8E8kpg5x0SGHC4cqgnkCLQ+b61sW6q1sgS0f0AMFlirYIho8KpFnfCr66Q4p/PeG
         hkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729220100; x=1729824900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsLzVHKzeV33ogJAzMy8zA1MEbSeiTdl6VMX9FoSLcE=;
        b=vY7JkGWmozVH4opdBRdKZ1/btoyj+05xBooRTqgvnnupHG7luHGW5dQxKIZvWuW/Re
         L11CbrQrY+3JjMepnT+FgjSFXWj1Ob7n+iFoTN83yr4UluaxtcG09bmq+f24kS/Yw447
         Qn2mLvEw/i6VBP9iyPEGojo0U4oHsVCpyUDks5wce8tJ62TBRqO08UrdU/Fo4mqzqVps
         37VRzXh7Z2A6NtgiY9RghzGF3Yi2KKwrsf2T2ZrEm13JiQhk08spdmekaozksxTWTq0W
         ieh0kGms+4hVcOTlFSauD4MwVxlmGsLSY5rWfkSr/7roiKq/smbnp4bL462CReKC5/HT
         UXPQ==
X-Gm-Message-State: AOJu0Yw/CWT2G5oTsDu/YmAUmb3DqxGOq0IVzd5pgcZhTLA6VLBjtIpQ
	/1vkJ47UckcbfOMoR5KPEu3ztTM9ngqfLf5UiB7IOV0cJB+g1PrBLuId/f2xCMKX7rPswYbcdFt
	HRJw=
X-Google-Smtp-Source: AGHT+IEsD5yXDxfUzoFybsXIoglRfcxdQJaSnddDjdvvdYbQFhGwxOX6rfJqovbrZKbUlTb+tgHFTg==
X-Received: by 2002:a05:600c:1547:b0:431:5e3c:2ff0 with SMTP id 5b1f17b1804b1-4316163c947mr3908555e9.8.1729220100333;
        Thu, 17 Oct 2024 19:55:00 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0ed599sm596135f8f.69.2024.10.17.19.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 19:54:59 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	a39.skl@gmail.com
Subject: [PATCH v3 3/5] arm64: dts: qcom: sm6115: add LPASS LPI pin controller
Date: Fri, 18 Oct 2024 03:54:49 +0100
Message-ID: <20241018025452.1362293-4-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241018025452.1362293-1-alexey.klimov@linaro.org>
References: <20241018025452.1362293-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
controller device node required for audio subsystem on Qualcomm
QRB4210 RB2.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index b211a49982d6..4fc6978d105b 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -16,6 +16,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -810,6 +811,20 @@ data-pins {
 			};
 		};
 
+		lpass_tlmm: pinctrl@a7c0000 {
+			compatible = "qcom,sm6115-lpass-lpi-pinctrl";
+			reg = <0x0 0x0a7c0000 0x0 0x20000>,
+			      <0x0 0x0a950000 0x0 0x10000>;
+
+			clocks = <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "audio";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 19>;
+
+		};
+
 		gcc: clock-controller@1400000 {
 			compatible = "qcom,gcc-sm6115";
 			reg = <0x0 0x01400000 0x0 0x1f0000>;
-- 
2.45.2

