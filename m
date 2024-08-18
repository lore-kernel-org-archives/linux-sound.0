Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348771EB36
	for <linux-sound@vger.kernel.org>; Sun, 18 Aug 2024 17:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724002243; cv=none; b=TsnWabwomi1xUmmMQ7Pw2ExIiOQFHivbKzzqjCIkkR2/jOTUoH1mLmPvZCyoCtxXDL+cRN9XX+zGiFFmevkJdsW8UkAXXgpz+UFJ51mIpMEHgsBi3Akx6qK9iZ1VDKhrtp0f/NRrWtKT+FEXv/7lin/FuCJzup9g2XdxUW8zO78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724002243; c=relaxed/simple;
	bh=eZxyfFWiOMWgxzgfMrHHDe1GsJVaWTRUphozkk0Nczs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mHn0dIc31vP7rjehIay2YvVJaGx/5IxIuFmTYFW4M9doD3DPqzgh/TLxX24FryJeCuLtyT1JxD1XLps2rBuuupRj7uR6GKNDYMrFDI57QEPQ9jgtFDLFpfiYviaEBoBPFJ5ory8n6KgCxIhLuqDj1n/rSE1pqwqkxIxoQjDbuF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eazQ+PWI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eazQ+PWI"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42816ca782dso29524265e9.2
        for <linux-sound@vger.kernel.org>; Sun, 18 Aug 2024 10:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724002240; x=1724607040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hze/nH6p6tvHNE8D/sjNOf2elLJDjNOnQCuybaofysA=;
        b=eazQ+PWIYMnmwBlJrfEcOpfLDe5cNo+ULi8K5PlMLs6dh8bU/XEgSatDeCsih1oExg
         fdD9ThiPlr+Y/x2Z61dAyRAz/pR6UxOv6DC0oygW1Tcunp/F28YH/bqOBCFICde0Cla+
         N5dE1u/L3CeKQv73AaahpNueMcpJ+YQKoySIxOrgvFDXaFkPoYrVLR8zaRYUKE6iMOrG
         IdqAO7tfdE3RQA3W/CFwBCR/poE9jeJeUlT0wCNAeR/bLv0O6bcnmHIBm3h6iGH+l/wm
         t8rfUhE/2sqXxDfLMFVmjfoBMu0MFwuG7X4LdI59oBxXcqfbln/z99Tojf7C3lPwiAWy
         lAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724002240; x=1724607040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hze/nH6p6tvHNE8D/sjNOf2elLJDjNOnQCuybaofysA=;
        b=DJ9YB7rqC0y1AiJ3FWLMHSuFM95/eFYxOPy6hrM4atfOtNflehKocgLguZ9tjtHsSA
         l+Lu7OgxCqe97p7CMV4mzP1QHQ/Q+sCs8O2nwloJqFZfqFsukCFoW3TvMftqF2VeA9IG
         Gyth3lX0R4jCXVBuTOrJMa15OSc0drzKYqww2MOYB2KuBo5s5fxcCk4WczY868AwdywH
         bElAqNbMz5W8oGaU3dRZn8lNoafl2pxtD13jwmPVOHVYWkin9xB8OLayS8miGidx37lQ
         dZWo9+5L4c6KXM4/4xHUqs2CBnokzVKj5671u0FFD5mHR+DfaZEgkfvib2Wn//hcpUA5
         0JqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQSJxiTdLz8eKoXLRYhlcFzO2C4LlcKJeeUvZxoBltwGOfAUEkU1upg5UYiRioUeVoOYjDk8gKh0Mcl7LJmek8w8ofMPINq+U9HSE=
X-Gm-Message-State: AOJu0YyOR+fO2hCXUcAlf21Ryy8q09JZ+Tgz9PO+6JQeH+cG1uwkVzeV
	NKhhaKbjoOeg7p1ir/DFheoug2P+5GVk6LgO3BcgFIyuzveZk0PSWxoZiSC78eg=
X-Google-Smtp-Source: AGHT+IEHHk1AWmAyr7jcxzOjPyrSWQ9wN+5ntefeNwrp3Cysr3LtJPZ7XWcf0YS+yO+S+WhnHLleiA==
X-Received: by 2002:a05:600c:4683:b0:428:1694:bd8c with SMTP id 5b1f17b1804b1-42aa8276727mr29780845e9.37.1724002240500;
        Sun, 18 Aug 2024 10:30:40 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded1813dsm139020545e9.7.2024.08.18.10.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 10:30:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: samsung,odroid: drop stale clocks
Date: Sun, 18 Aug 2024 19:30:37 +0200
Message-ID: <20240818173037.122152-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clocks property was present only to allow usage of assigned-clocks in
the sound card node, however in upstream DTS the assigned-clocks were
moved in commit 4afb06afd768 ("ARM: dts: exynos: move assigned-clock*
properties to i2s0 node in Odroid XU4") to respective I2S nodes.  Linux
drivers never parsed "clocks" so it can be safely dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/samsung,odroid.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung,odroid.yaml b/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
index b77284e3e26a..c3dea852cc8d 100644
--- a/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
@@ -27,11 +27,6 @@ properties:
       - const: samsung,odroid-xu4-audio
         deprecated: true
 
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-  assigned-clocks: true
-  clocks: true
-
   cpu:
     type: object
     additionalProperties: false
-- 
2.43.0

