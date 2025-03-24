Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0031A25E462
	for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 11:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742814389; cv=none; b=HX4diPCq8/litxdWq4AtxsywD31pvmew6vbIDge4QAqtjLxNGUhGLp7lsnkLa5Yco0OrYBnaL3H+I5LYO1fXL7OD/AHIhJx0vRZh07rYlzBlqDZ+buGKun3Pge6W9MWZNwtICOCjgRr4dp27/7gIiFjQJZGoCOAXivGYBu44fok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742814389; c=relaxed/simple;
	bh=kf+isSZ+GQZroxJu0G1Ja5oS+lqo6LQdxVZrCG2obkc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oLDZ/9ro/Bs/Q+SaF3Xc8zzQHlxWGqcW1Fr0AuptZqyyYfdw+NvCJkX2UsyDz05Np2hvclwuJcAXf+KDMJ1Po86D5UosAM711taB1Wu6eKJm87KnAWIO99AZC6HsHXYArO5leVPRcGm5o8VG+urPnk4IA6CYF1Dyi+HWvM/eBFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pk6txyZc; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pk6txyZc"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso18819345e9.3
        for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 04:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742814384; x=1743419184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVoHGISMF8yznIukeGwdQkZ9ZYF3qlKA/mjLYUuaQaE=;
        b=Pk6txyZcch/aJES3YfKqzfG8MdYkZAwVWmG1rGfXfPyieuAGn/Qn767mC7xdM0iQRV
         sSr0ffZhScA7J3v35wPLBMLd2UDVMiYHbbrY/D9EqshMdkBw3AMxJTt+KUkWGFpSQIAQ
         NX1/TzR5vUtOcLbdCAwv1U8tkAG/GzMaMLLk/gi9FHWelpQ9lHo4An3ljAn+bliSQIUq
         ljm5Gpt3A8qkOhlNE+7B22Dph7X2jhE36HzRkfu5M5biMAAayEoRyDVqeJjT+m117s/N
         1k9i9Oql6RgAQK+ruOyhLn8S7b5/R6mXPeq3XpgIcrpMuNDtA6CkedP7zco1mOid9Beo
         YfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742814384; x=1743419184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVoHGISMF8yznIukeGwdQkZ9ZYF3qlKA/mjLYUuaQaE=;
        b=A5qoJ+LwPT0rADpPxI9jxLyoY0B7Iv3ylh5W/FamQZLz3V5UN3g3weNQg/BU4ruB1R
         sY4WmfkjJuOfNrzG4fcwypa9Q/TYb1NgbzAP8U+92cOzmehuKahpDaQD5yFn90lZ1L38
         lB61AmBZGn2wThPZ6u9b0FqooxQDR5jLcBFpu675R4zZefBA++84ndrx+299eucm4a0N
         uAWoREqdGbno7wv5fEDzpWgOCeKFO+5tlhFtsKsd5L8UCtejCNkq0OPim3j2t7Fe1hri
         C6ZsqeSQa5AoxifX6jRTzS9T12GpcYPsnOPVDygbOKAp3aRwknmjIAVNMNqNHLD2Ly6j
         twgg==
X-Forwarded-Encrypted: i=1; AJvYcCU453u5YWIZ1Sm6h5LJXefsaTN8aOZV6XPmuEB5pn1SAt+J5xIz36wfkE+yfSRMN8FgAV4D8KfxlS7ovg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6LI51kngf3WGF0pRtBxkdYFHvTeiWqf3j/wvbpZsoKLXBW9N3
	1CpA6ID0HkX+bIIwwuUhpnEeGIPMJXGj6clKEcebZNq+w5k20LiPlvyQhsNE2Ns=
X-Gm-Gg: ASbGncs80bRzRBd42D5ZSHyjb8gmlxH99Eo3eRhuERdBC1XGOFA0EbYYpo4ZsI2BHg3
	abbQSVjsNdVApR6IB0wEwLM6vz3R+FWJ4uJ55Q0ANofLkMUW0RFkGOLljcXZaO4e7/lGDemD8Gd
	eZrKv/Gq4gWKaqPLKtCew127Gy5cD60khHsP3X2S0edPM5ZdG1myShk8aC4j6yy2mRmCepEJypQ
	wC1vtEctQRXmA8XSzVJdwW7YQv3yvbANxJ76uYEpOJUUIfhb0a24IhFcGFJS2lfljHhs3Y8CXYi
	/7XNcFa9ZqAvgDsrcicKlTeiYXrxWiED0ptWXRky3beq6TlqN/Uqn5KzxkgUPT66tI500w==
X-Google-Smtp-Source: AGHT+IH5XvwKpEbYBwlRsHeQR/bbmwfsvDbjrTdTHYv5Tzne+9/8Zd3GE27Ynz9a8q2GSpnxGcW/xQ==
X-Received: by 2002:a05:600c:3b9c:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-43d50a4ca6bmr105056735e9.30.1742814384123;
        Mon, 24 Mar 2025 04:06:24 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd28a46sm117236055e9.24.2025.03.24.04.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 04:06:23 -0700 (PDT)
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
	Christopher Obbard <christopher.obbard@linaro.org>
Subject: [PATCH v3 4/6] ASoC: dt-bindings: wcd93xx: add bindings for audio mux controlling hp
Date: Mon, 24 Mar 2025 11:06:04 +0000
Message-Id: <20250324110606.32001-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250324110606.32001-1-srinivas.kandagatla@linaro.org>
References: <20250324110606.32001-1-srinivas.kandagatla@linaro.org>
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
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
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

