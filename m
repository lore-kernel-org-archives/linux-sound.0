Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1C320D4FF
	for <linux-sound@vger.kernel.org>; Thu, 27 Mar 2025 10:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070004; cv=none; b=bf0TkAh9PGN9IWNb+DZ8VSxcSzT5278G1tvjnOX7BSL6Oo5ubLf9ycpWp9MabrqqYkhNv9wULXm4ghMkvFO+Ya/dj74zmsvMSK2Q6gIcf/muN2MVf+KgWDTX4oZT3awgNNODi+5tCBuXBfvTapVsNOcYsJV5p1UU4bmZEN2HjRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070004; c=relaxed/simple;
	bh=nzVmJfufed+ekMZEjdRDlysNfkHvhI2RIGmGqRITGrI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nent6l8m8GAhvfY7Tp7Zw6Y1/SVwctiJdCfpHwVRx2zV6phm0PE4E3m3RRF5ORh1zxD1kb/DGWZK5SnCJDkr/HIX0iCPYMiB1Bx5sAlscgdAQTfigGm2dY08aQn+65sRBb3mOShLnH5Ayw3lm6UPtAYAonPtj17iexEDFBOfL4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hIVhyRMl; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hIVhyRMl"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf848528aso6302795e9.2
        for <linux-sound@vger.kernel.org>; Thu, 27 Mar 2025 03:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743070001; x=1743674801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGhDhYESbCVLGZrKJ7EvUOhY/AIfq8zAGCvPtzsm0PA=;
        b=hIVhyRMlKMflEvXMQV5ueApdn2nsXlgpeaCM9JWCGQkxyJulKbXdd45LpKvySlItim
         k65fJ47tK3jbdraszg9XVWmZzLlIt1dyxTxNhiTACiQPr/ulfYCogspa21ZyyzsQHayL
         S5tPVKrTIMI4uF2GR3eHR9BFADKcW9g18hnDMaBejnTc1T3HqTahJXS/meA20lFGWhy/
         igohQcXtGV1cziaT3TWlYj9PlGJZIFNEI2cHDDGxpRk9mDNwe1PdrAs1a1dS+7TnBjY4
         47GjbWeIac9/B4oR9dq0Lsa/Wix39xD2UfoGVfsNkTLSECZ9WQxh1QxtlnpBRMS+5hgM
         a/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070001; x=1743674801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGhDhYESbCVLGZrKJ7EvUOhY/AIfq8zAGCvPtzsm0PA=;
        b=v6VcrTulLZ3pL4xVRbWaleov19zoJl1eWCk8wHZWDa80fRLf4VP8xDRMhjvWcsprOj
         fldvCCCezKmqcc5vPmOBGjl2V9cbY8WrwdsylBPjotkbQi/2RbLY4gX7hbMOCiYt5oui
         irD+rOuY77R2uQaE3vfuZbZTgIfED+EKxMkgaQAKcKr9t38xIIR3JBVmIU5KZhQg/r7m
         TCPcFHdB5yUOSo7ND/PBOHnSLy1lAozbm4Fo8XKgVSdN0yPe59QPFQThM2lG89G0A5fo
         ddyDJQcTtgf3UcQVMQlL/6cgDpgJ2gcyRPx153H9yUMzNhkoz2qGc0Caf7PLVkXSG4rf
         bEFg==
X-Forwarded-Encrypted: i=1; AJvYcCU4kOA0EStXa2BmV/c2m1UiJnmGphBJ3KFzEXG6tKX3anND9j1wK0eKv7vgG/q1jsVBtb2kb6CjO0MlSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWB1kWd4UjRy9RjSp4vGVJ3AB5qV3wHPiss7f/EXvQ8wOIc+3s
	kmJfslCeTfWn4Ke02uHLI7bupgsnzmHuoxsmBxGu2+dXGr+uWpw8ZfTPuMhfHnc=
X-Gm-Gg: ASbGncsh6BJskFd0uvzWFWpyxNQzTjUoEuEirnEEbvBR8MpM4FvwmYzcRFGPItFPlQf
	jYMj5/tRpfCQ6lPzVkpjWOLPLmFVQO3zbcTUnKb+17BZ+5aDD8Y4G4lsnZFMJqePvEJg8fW+Iy5
	/6IBkmy+l3VbbgnYvP8Y+qNJtMlBY3txSt5yTsz8srTvzDXizO+Asgyj3fNwlvIy5Y20CF+3daG
	UVjSbgXQkV8cNhObYnQhjLA0Sz+v2kDUAX61jdm7DLJH9mGIiA2MSM4VjcgpUOgAF2xS4IDjpuv
	EAr0SMTelwEdP+k/1cMkZ/B9bcSXTBp+iezkm7HFasfEVLnVOnlxTEy6O+E4YS226Qytlwj+0eD
	1oRHV
X-Google-Smtp-Source: AGHT+IHbYEkEV56STjfU0lTRDtdedS8WvMVSd1pZC2L1XQBbBW4aRCx0Kn4wXUGWvcbo2+wiKfBSJQ==
X-Received: by 2002:a5d:5f42:0:b0:399:6ad6:34 with SMTP id ffacd0b85a97d-39ad1760701mr2932999f8f.35.1743070001456;
        Thu, 27 Mar 2025 03:06:41 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39ac3ce3dd1sm10843204f8f.88.2025.03.27.03.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 03:06:40 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: peda@axentia.se,
	broonie@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com,
	lgirdwood@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/6] dt-bindings: mux: add optional regulator binding to gpio mux
Date: Thu, 27 Mar 2025 10:06:28 +0000
Message-Id: <20250327100633.11530-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On some platforms to minimise pop and click during switching between
CTIA and OMTP headset an additional HiFi Mux Switch is used. Most common
case is that this switch is switched on by default, but on some
platforms this needs a regulator enable. One such platform is Lenovo
T14s.

This patch adds required bindings in gpio-mux to add such optional regulator.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mux/gpio-mux.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mux/gpio-mux.yaml b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
index b597c1f2c577..ef7e33ec85d4 100644
--- a/Documentation/devicetree/bindings/mux/gpio-mux.yaml
+++ b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
@@ -25,6 +25,10 @@ properties:
     description:
       List of gpios used to control the multiplexer, least significant bit first.
 
+  mux-supply:
+    description:
+      Regulator to power on the multiplexer.
+
   '#mux-control-cells':
     enum: [ 0, 1 ]
 
-- 
2.39.5

