Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F41220F20
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 07:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714562; cv=none; b=eZ6C48raoXLMK+SJBUO0suqUizAFnqpQI64rbxen21Mb/8sUfdW23ICI8SF5hh20d6sPDrQUCfrae/6dhFBo8vk4xw6/dxTp2qqgirleng7DWnxRZgjwqTzeUV50pnrlLCYVh84Gk56DohksNvufgyze+65m2YjVijYPkRgQCis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714562; c=relaxed/simple;
	bh=M6CossAzrTItIWAzn1A9+kxxQ8xCK/jJ8XqU64/5Zf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rCFrL+HZrlgdORo1G98khmQXIDJXWyPRobhjFBHfezDxuvQPSCaUk+wed0qRRx6Re2jAjU6S5crR5E0Szz3xSf7GMA27tCakc2I5Av2TABQXxJcGgo4kfxyTY2qWmFBGjfZkcdHeAQa0UeQjP7HQ4Nkds4MP2RsQn/3arv/LA4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QpMq05/2; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QpMq05/2"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2363497cc4dso5939185ad.1
        for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 00:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749714560; x=1750319360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYQyoxfiAVqopjQvGW02GMsvVlG13E9Tz7Vl2Ymi3WE=;
        b=QpMq05/2z0Omoetd1k2lkYpR5mgNnSVKYnFD96tlVCx3UOsgllXd/gTeyw2iLXoGsg
         PQfj4eTdL0UiPNTFYIkujWcpQUV1SfJ9EdRsdSk9bKe9QeX8xqR0YTzTUJCiDiZ7mHqJ
         xUn9fp6+ytjSwG44KQ0/ve6hmOhsBzJw8UsoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714560; x=1750319360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYQyoxfiAVqopjQvGW02GMsvVlG13E9Tz7Vl2Ymi3WE=;
        b=O2tfQS/U7b9g3wwMlvwCe7XKcFOTO5Lh2nBeQMEIVk4kVDPtsjeKGAQiaUiJ4FwByK
         G1OeOKr7UdKfKAQRFsDybZVfgUjFZRKOf2YQ1kN9SwArnznfRiPsRMBYWPzCfYo8U19s
         QzitUbPMruSJfkqyKM1/MbRiE09UjFLUCAW6fes124xTOKhAVU7N2nQsk7LA7uqYRKC3
         AIjiw4cmJgKIygHytgDYiyP1mkdCEjCH30xm1UHKnzsy8Eva2f7pBe8Ct9tGJqUeWpwo
         UkKl7w5vmyPQD/Wsnm6SsIepx9QlzIuW+L9MXmpAjKULzrrLd6o/7nqpgyD1Ay3v9LaR
         ASmw==
X-Forwarded-Encrypted: i=1; AJvYcCXHbdFffjDtUfIHKNiy6WLsTTTLzIU6EyA4BpT33T6wruW+5gMnXg27LON+d2+/ENk0bSAiHbW0MSFnCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgxtFoJfWHC4aJ9BKvTj8IwuEYXu7na1HBB1OEJdPpriYqKJd6
	tkNAjaWBp2XH5GwRXH0iV944owH924D1UMMgEqYVNyTJU0vM3ZAw/LSrRk1sjJ97zw==
X-Gm-Gg: ASbGncuhXAJjpl7HkBGZNTyGz0XDe8mlXGnZlBvlGXhjUys7Wv/8j3TjQnMzKLPef0H
	4PHp1zW2haYe3pj8RF5zAy7ZhSRJqNzdzbRjVqwHQjnrMlCpz3mSEw5gOclob1DKOf9iBKh3NZL
	kGvLZKRT7ri1gFqQssl8HEe/3OiU81V/lVW1n02H6J1J370iZsRLRb8OvHBvV0D4FeGY4RTR/BX
	mAVplt/Gh+fheetobdATc0Nf61mdbZ9A5znmSRi01HS/NTimdAXdA7zGip601Kbqp3LRaoFDaRL
	9ERn3f96o4/99kIF68I/XdY2vrkXwdvhezqgKJDRikrwN/cgan8mDIaE4V+FwkBlPO009otPik5
	jAYo=
X-Google-Smtp-Source: AGHT+IFaK/aSeTPU1FVSUiJwy75RRBlflMYnV4oLKYPHyMqt0+SId2lcqzKkgBqwPYhNLtKoxyy+Ag==
X-Received: by 2002:a17:902:d60d:b0:223:4537:65b1 with SMTP id d9443c01a7336-23641b28de4mr102187465ad.36.1749714560273;
        Thu, 12 Jun 2025 00:49:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5b9:e73a:2e58:5a47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e63d42esm7893295ad.74.2025.06.12.00.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:49:19 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/9] ASoC: dt-bindings: mt8173-afe-pcm: Add power domain
Date: Thu, 12 Jun 2025 15:48:53 +0800
Message-ID: <20250612074901.4023253-3-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250612074901.4023253-1-wenst@chromium.org>
References: <20250612074901.4023253-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The audio subsystem sits under a controllable power domain.

Add it to the binding.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
index a95215ba6361..666408d32f5c 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
@@ -45,12 +45,16 @@ properties:
       - const: i2s3_m
       - const: i2s3_b
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
   - interrupts
   - clocks
   - clock-names
+  - power-domains
 
 additionalProperties: false
 
@@ -59,11 +63,13 @@ examples:
     #include <dt-bindings/clock/mt8173-clk.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     mt8173-afe-pcm@11220000 {
         compatible = "mediatek,mt8173-afe-pcm";
         reg = <0x11220000 0x1000>;
         interrupts = <GIC_SPI 134 IRQ_TYPE_EDGE_FALLING>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_AUDIO>;
         clocks = <&infracfg CLK_INFRA_AUDIO>,
                  <&topckgen CLK_TOP_AUDIO_SEL>,
                  <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
-- 
2.50.0.rc1.591.g9c95f17f64-goog

