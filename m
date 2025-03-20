Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918511E5B8B
	for <linux-sound@vger.kernel.org>; Thu, 20 Mar 2025 11:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742471806; cv=none; b=VDZQOr4s6Nm3JArbonnvcBJlbYU3BjixP6ppW/eDu9alfULaDNYCBgzWxMykimnkhs6mtiM+L7FCp2aQHBzFQ4/Od/b/hVwwp+Upu4ICekhGGlqAU7E8fgkkwel2Bs2C0akbdazmo1pCeVHpLU4nXx53ajJo5ExFL/NPFZqqmSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742471806; c=relaxed/simple;
	bh=Aon4CSRLZAp00bOLv5cqnz1HdCAHQzSH1gGdjQ1+p2s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B1HlL3HCO7XkaKeFLVoPXYySjKw50ILrAVqPKS6BxHo9Isx+2rLVwKwu4WO8qmaWy7vR6dTDkU6r4qWQv+wGyWyPShqT0s9N3zp2FbKOV+VS7OiuJ2dMm3ZaY2IvrJCb3Ee8mxAoD3NtrWjeRxOwo1HYYrS2O7YJygcnhtDvgOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SJwQIkHg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SJwQIkHg"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43948021a45so5733655e9.1
        for <linux-sound@vger.kernel.org>; Thu, 20 Mar 2025 04:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742471802; x=1743076602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTBcwD7zMY77Gd6SVP9wN85Z8q1nB61DYTk+PAfaKwU=;
        b=SJwQIkHgEM7R1WTrjxpobSyb1vdk6Rz0QmdMccVtxj/JyReA8AwE217gHf/RAxD0kf
         yeqNsFxw/EvLoQ8/QZdgJozzsPBFfQcs11YRe/bfbPnPhJVG/cjxX8iM3CRgkJDsDJro
         7GVfCMkvz/OwuH6r7LCyr7Hc6+3SbAbUIy3jvL/LgeTZzO3ANr9SOWQ75GXsdKzSUxi0
         kuxM4uzz4iZW+nWICN+EsyLdexxtOIqTFZttRfrR3p9lSNapHqk/EAiIXEZ8+M8EJFUv
         JfrQAV+ntcUyLWVW5c6m2avoCH46AeC1eE/RW6f0CB/ncTOJ+NPhinuobkizybiYVFo4
         iXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742471802; x=1743076602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTBcwD7zMY77Gd6SVP9wN85Z8q1nB61DYTk+PAfaKwU=;
        b=XBwFLF+Z2nbke5wDa7FjO1yuIeg3tou3cZ0KkqpGNGcTVl9FUBfhymaz6vpVq4+lSi
         L4rQxuamYR2UIg8Kh2Uq6w4RThfLaCu8zWEX8ZqU/ezgEAhVSrhu3RDFRYJ+FtT80o4r
         aZZ5B/gEyDZFBdJa65peOkQ/BVig1/kNUI4nl22PgTLl0yffUaNyP1OMpqOvQBwkpcJM
         SdsUu5fbfjmllN+38eFwTIq02+SX++OO2i3yXs0v0NKBvgygFi4EUqAQ6xA4b4Wc7dYU
         R/sssLNYtRJyKaeljiR7XSiv0iKG5nQ4YgLELkkS4TwEYZ+B2WyGAmrSCgbCWWhtpkEO
         zD2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWq/MneiSK/WCs27q1U8FcycLYC+XHSYHYkS3QEGfc1KMo8tOaERIDWXTymRKF2KpDsdfpGeDC7hLdLdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLTMwq1jhNockLc+Hz5If6Aa/VeGNHs23JRxcXChavqUQOCha4
	+oIvCvS9bDA/+8JUj+X/7aWgh5m3tJX0nk8fVh9vNqQfhMXkugPYmMdYizMRd2o=
X-Gm-Gg: ASbGnctyUiS4pN4F98/gcw1wwqQPtl8CBHP5bxuXvf788zk6qJh1+90BBaOBBoDdVnC
	PFYoi65AKbddJ5MDkWwh+USyusW3C16DbSwFeXFTX+IOrMj6t3IZFNZxXT9TzQ+xAee+zW76zc7
	5Qn3Kr5vAT8CVA83ivnvZWpWoJvCBEXz+HYn1xF8N7rAA7W0cGa5kE+VlO4ZcP/DlJn+8k0mPnc
	5ZYgPI2dwb/A0D5LtoXtt3ka9AiBH3UEgtYO+2Fxj1le+/alI6tGohyT8lob8AgTO1zoPqV7Vii
	rGnwN43Eaa4JWMvyqFtYUpRcrBe/KQ2EWOqFBi9dAPbKE4UPpqW/pOJokq+cvL9mgtQ/BA==
X-Google-Smtp-Source: AGHT+IELSu1Fy0iTPGOQqguY/3CHrp5HN+wulAbklczgtP+/n5Gl76d1bxZyG2Z7RhRwAdDyddobKg==
X-Received: by 2002:a05:600c:1546:b0:43c:fb5b:84d8 with SMTP id 5b1f17b1804b1-43d49549405mr24419195e9.16.1742471801801;
        Thu, 20 Mar 2025 04:56:41 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c888117csm23257857f8f.44.2025.03.20.04.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 04:56:40 -0700 (PDT)
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
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 1/5] dt-bindings: mux: add optional regulator binding to gpio mux
Date: Thu, 20 Mar 2025 11:56:29 +0000
Message-Id: <20250320115633.4248-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
References: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
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

