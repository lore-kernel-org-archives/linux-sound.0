Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A4C2DCF57
	for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 04:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776918543; cv=none; b=sWrSRkSxzk2B5WPSSgkHbA6QhZKmNENcZLmDiV8a1Dsm3p5bO+7CbOu59XQmCO8rO59kQQPodKOiQQu6ux3GioC3qoiy9uPQjkKYomegdkbetzwMW96QQekF4QrVZsESSi7F9TjZppDS4h4wjBvqGd7xQ7Z+r5jK2XVWQADWvEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776918543; c=relaxed/simple;
	bh=1B0rx0wn/c2cXAJ68pTEAXr2+tPyfi7KL9uUYQmogoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JNDDV8mdKDXVn6t6vsH3ghT0J5n07eYSYsVVbk+SkdONJ9WkrQavVVxtwyAifV05YySXnMRSQxHXp034PyuZxa8FJwHVt4rpYcyhqUTo/7Ql6LLAaJia3F8CvQH0o8FHLanTsa+BoCxinhbsFwApNQ4RJFRHxWmdNIO1jp0rvok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iM4jw1Sd; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iM4jw1Sd"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2aae146b604so41455365ad.3
        for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 21:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776918542; x=1777523342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldKzYRVzGfk7M04BaN4noHVbGeTb3XbIYu+RVxu/5hQ=;
        b=iM4jw1SdI2H9ZuPlWmdgbz48PMr4ALwLEYiOlR4iWJuOc9tWNf8bhnyhRR1oVyJnCg
         cEECRIKquOqcrv2UFbRdvqt8qDf4oXVlgO7PjYEq5OKSf3+2sPsprbQxN0UyGUAswkOF
         GFXOSBFOV8uovu4raFHO62+dtJxwYl4IqiUYwWdriXYnT23kI4z9z3+X8JzDn+a+Hl8d
         uYfc0sSNNn3Ub1CsK4rVSUYdm/Pj/jLQCpUH0Haof7EdagmNXSe9bfiOtsJh6yteJ5Fm
         4PcskqqovzAleX970nDztcNx8CwxjyqVOaLXV6nxvpcwqhAenLrWiGmer9UT9icoHWT8
         7giQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776918542; x=1777523342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ldKzYRVzGfk7M04BaN4noHVbGeTb3XbIYu+RVxu/5hQ=;
        b=ZcqEGIUkLIzmE/aTXM2VzIu5vLHtglI3bm8KQ/nfwCP/KIGpvJc6WN8Z2mh9QR7mvJ
         QmLOz9vqHDFceEcvzC0LSyTM/I4O0COS6Z+tpasLGCmWoKeUjROaf+IUkcyLlwVRWNUx
         95YHlRsxhc7I/FOX6MTH94iG61gmnXIPMaX80XyCyOxiVliV9I2gacVGpiA8N1d1dZhk
         HU02DgVZuU4xbn3AY/vT9M1fqlasLQ8IuZedrx4UKOzOnZ0DbcdkekKNrBZ8OG5lgp6V
         LmYJ8KNAbE2tkAxDOXD5Q9btk/XuH0/7xflMOzsm8jgXloROzbyVuh5DGtwTzdnizDsU
         BUsw==
X-Forwarded-Encrypted: i=1; AFNElJ/fSO20hGqWkkFTf8aLRCZqZTjVcoO4l4A5zTKDoswDp4apQjUccBpdGatn7XGpdrFZvP1JXssVeiBNbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxpIZCeusD+nCaOUZXRMSmNOfGyiYsrP09DzTXCUuHQ/G+Y6Gx
	pypUp8PBVzO6HVrZo0o7uuKotZRUNZTRgWRs0EfEmyPJkimwC4RB2Kb3
X-Gm-Gg: AeBDiesyN6frL0EurfiK3ZHzPYs79hEof+2UlD53Po5wFrr8TbJtGl2iHfGE4wT862a
	KZnfliHmO1Rukt+fvIwQSkWwKUIT6hqArL2+AOyRp+ZdRjscwcaW6nXdueyC7AkjRqybsSdD0xX
	ZTzjgEz+U1sanPAas3dfnYtM8Rj8orYamFcgkRnG+2r4vt9+/ET40yxBd9URHawC+ioQNG70OUF
	8WrrWp4i8clPlf4aUroiBcCDpntOuKairHzxD0v7az8H+Ba7Ar9+4yo/kFBGTXAgjFA6HOMt004
	V1ddZ0Lo0lX83PJb6P/yJHP6i4opwjLxDnBii3AnmhrZFcqi9EJHAexD5EtNgD/g+KFGlYdXFBD
	xYZCaxYF/8t/B0L0bZVJp73zT7MtqCpVjYesZGgiWD9lxTwcIKWipRfEcxLoPljoaFLzoWTQo0h
	/WvpjMufBLxJmD6eD+R25tytQ0E/CHzxoA7G/KjaYQXVZoSVTCt4WYrIaK3yHliZZDoTe/
X-Received: by 2002:a17:902:cec8:b0:2b0:5b4e:370c with SMTP id d9443c01a7336-2b5f9f8b3ccmr282724315ad.32.1776918541770;
        Wed, 22 Apr 2026 21:29:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab4049bsm165723755ad.77.2026.04.22.21.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 21:29:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Joseph Chen <chenjh@rock-chips.com>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	David Rau <David.Rau.opensource@dm.renesas.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: dt-bindings: drop redundant wakeup-source definitions
Date: Thu, 23 Apr 2026 11:28:31 +0700
Message-ID: <20260423042831.21114-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423042831.21114-1-phucduc.bui@gmail.com>
References: <20260423042831.21114-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The 'wakeup-source' property already has its type defined in the core
schema. A number of sound binding files redundantly specify the
'type: boolean' and provide descriptions which only repeat the generic
meaning of the property.
Drop these redundant definitions and descriptions to clean up the binding
files and rely on the core schema instead.
No functional change intended.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 Documentation/devicetree/bindings/sound/dialog,da7219.yaml  | 5 +----
 Documentation/devicetree/bindings/sound/realtek,rt5514.yaml | 4 +---
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/dialog,da7219.yaml b/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
index 19137abdba3e..fab37cd92e0d 100644
--- a/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
+++ b/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
@@ -45,10 +45,7 @@ properties:
       - wakeup
       - irq
 
-  wakeup-source:
-    type: boolean
-    description:
-      Flag to indicate this device can wake system (suspend/resume).
+  wakeup-source: true
 
   "#clock-cells":
     const: 1
diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5514.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5514.yaml
index 7fbf7739c371..57e5c09c05c0 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5514.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5514.yaml
@@ -48,9 +48,7 @@ properties:
 
   spi-max-frequency: true
 
-  wakeup-source:
-    type: boolean
-    description: Flag to indicate this device can wake system (suspend/resume).
+  wakeup-source: true
 
 required:
   - compatible
-- 
2.43.0

