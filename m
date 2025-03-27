Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAA820FA83
	for <linux-sound@vger.kernel.org>; Thu, 27 Mar 2025 10:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070010; cv=none; b=s4m36UNdfWLxN1BWa8RsdP9sAASoZAr01TZEzaS5YpddNUcqMHgQgBFDjkpa7DdFU1LYkMPauxJFmY/VoToTQtC8hWs8ysaeqWXqjHCEuz3O7Sfbrm05nV0BFAXuso8lHU0KTfGzUo2lYd0e6ydro+Mpw1g9oSQOKPIPxZ8JEDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070010; c=relaxed/simple;
	bh=SaEurHg9my0SgGDfooWj4uP1HnHehhMQjbSphU85xtU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kvAtmDDJY18vHCcmZApym5gU69MdZ7G2eZq77HxJ4eiz+zmcdJ7vJ30Re9rcS9TwMcVFIqwysqNDRy81jAFCgnR0iC0Cq98Vd+Iy2ad4BBsyv9M39rI+Jx0KRf/pxZ2VT2q5MiNi+lyFBdjwjDfxczAAv2JVRRbq5lpTEKImceg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RWBVyzsp; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RWBVyzsp"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf257158fso5316505e9.2
        for <linux-sound@vger.kernel.org>; Thu, 27 Mar 2025 03:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743070007; x=1743674807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZ6QvHirUebkLT0cLpo0Lkee0nQc81mUaPIyQl+HrrA=;
        b=RWBVyzspIITBF/LjZQR+Ys1DXVagbLEMWe1WSqXfw+PjeeLjzB0V1iYx9024fzEmPu
         GHnGSnBh0P+wq4bHZsiRqdXi6puKwbbQB4tFB0VMfZmgWrMIsYl8uyK7QiVsr21OVD77
         2MUyzL0R/LTuN9GdRKChM7x1mkqw8PSm0HghOhmRoLXpyUn5Dh5BJT4y7w/nrnn54oQB
         o/pYDl0VNO1cubYikwqdI4Nw+3Ci9JLb3rlKzzuIJCE2MoltToKkZ3jvCqjrAJTmsJ03
         CBbnYIVNiqpQuoXvH9pYXy0KOHehBGZKhBmzLgBoXOqPFheC8Qy6G+D9Gs1nBL4vgju8
         6pJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070007; x=1743674807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZ6QvHirUebkLT0cLpo0Lkee0nQc81mUaPIyQl+HrrA=;
        b=c+yrJyFaJVoK+xeltJ3ZAjBs7+v/1Xv6PorY9C3UeCz5ZFPJ1Q1dk4V22SZjvsoXuU
         wxfimBaEXI2elZ4saseq9LNJw1lUNdEXf2CvZur9zwCxtrotPNrPkeJfxnvlFr0ZCfdJ
         u5TJKXhHVud3Pw5s3pEZM83l8l3Tr6gEG9n+VJrDloSb0S2ksulq6sMmbL2vTraGmYJD
         AUwHlF2YdU+ln3Ua3AdPMRgEWVhuBUVmMgS/4i8ie+ngjVUyPxbzX8foYR3QKsINsRFU
         e0yfCyY8pYDUtD3LeKtcMVCgDI/Rije4dDU8Glr8aEpEO/m7KpqpPnvcD9fUb3DMYzWx
         C5rw==
X-Forwarded-Encrypted: i=1; AJvYcCUQCthcZ9Qm2o5HvX2fHmIF4ODsASc0ak/rOQub6f7kKO4nY8OZchlvBHsx13MMxNmllt8RC3xPPVJ3cA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZNX1Phibiu0ObNQjuJ+UUwaXKYX4QK2gqfSVliqzqiCyGa2GG
	cX51J/trmhQtASfjY66+/uK3gNwaQZ66blA3MWtRhGJgLLz/PRyMeJhZk1PUrgU=
X-Gm-Gg: ASbGncsdEJ1DL/QFF5vF9jdMofRoXY4chk94TM7NMZ9Juw4zqJCB1i+rWY39lnbfROv
	uPKrSAqrrCI02p5s9SdvnSD0Sr924gnq95smIHdOGgIaSDJyWiq+fewsZdOjG971Khr1oEQrINJ
	OQI7czx4CFRQPHQDgCD7jJQL4ebfh52RMIPHPPNnPHsNBHrwDMZkM81vwYh9Jj+P/Ce+J+B2l0S
	5NVkzZ+i7iRWjy7574yhTpUo0dKw+olK7EkKHTPqY+VM2G/xPJkLdSSi+9tA+I4RiO98LZuDPRU
	7n/baFPnrl+9ABCIhtI4tV3x19W1+NX5gyGHiovN0Oh6DHRJxXZsmQwsIk/u1bYywxaFbJkluWx
	GYf/I
X-Google-Smtp-Source: AGHT+IHjrGVJ6opjaRJWbDSpA1taDVutESVaqvXu4Xk53ocP4KRa0hpwUBXOt4Nk9M3e5Zr5W844zw==
X-Received: by 2002:a05:600c:4e05:b0:43d:26e3:f2f6 with SMTP id 5b1f17b1804b1-43d84f5e5bcmr31621435e9.5.1743070007164;
        Thu, 27 Mar 2025 03:06:47 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39ac3ce3dd1sm10843204f8f.88.2025.03.27.03.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 03:06:45 -0700 (PDT)
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
Subject: [PATCH v6 4/6] ASoC: dt-bindings: wcd93xx: add bindings for audio mux controlling hp
Date: Thu, 27 Mar 2025 10:06:31 +0000
Message-Id: <20250327100633.11530-5-srinivas.kandagatla@linaro.org>
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
CTIA and OMTP headset an additional HiFi mux is used. Most common
case is that this switch is switched on by default, but on some
platforms this needs a regulator enable.

Move to using mux-controls so that both the gpio and regulators can be
driven correctly, rather than adding regulator handing in the codec.

This patch adds required bindings to add such mux controls.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
index 10531350c336..ab1c6285dbf8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
@@ -23,9 +23,15 @@ properties:
       - qcom,wcd9380-codec
       - qcom,wcd9385-codec
 
+  mux-controls:
+    description: A reference to the audio mux switch for
+      switching CTIA/OMTP Headset types
+    maxItems: 1
+
   us-euro-gpios:
     description: GPIO spec for swapping gnd and mic segments
     maxItems: 1
+    deprecated: true
 
 required:
   - compatible
-- 
2.39.5

