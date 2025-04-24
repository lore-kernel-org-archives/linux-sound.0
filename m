Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F10224B02
	for <linux-sound@vger.kernel.org>; Thu, 24 Apr 2025 10:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490328; cv=none; b=sT/RsGppyUqpxa2OSUdI5iq83zu3LCbpucQ3ohxyTj0bI+BfAQ7LLJ/ZF6aOBTPMOkXPbebHeTj3XNQyP4AuAvk3KoKSRB1Dx19zkjMjW7yc9W9+buJmuZHUg54FlNIsT4RzngUXGPB7Lkb37Il1/jiS1HDRbp5NC9H3k2Lm2JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490328; c=relaxed/simple;
	bh=LiV5+dbe3T+WgDBltbYE2AK3dTrKP24hFYm02zLoduE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PEIqFnkXaWrHCCeFpYO0T/s+2R/cEt9bqjbYDPr9dIYGZufzzNwODGwUxPz/4CvqkBrE3G4snimKgzrO7yAaliDK6/El1E6AXHx3m4p73n0lJpkVKi+Isf3rJ1CJhc8MhSQnULUXV+/v+u7Ksi6zUStrZM9NTwEwacS/pBr4J98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FsasgelO; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FsasgelO"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-223f4c06e9fso7487565ad.1
        for <linux-sound@vger.kernel.org>; Thu, 24 Apr 2025 03:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490326; x=1746095126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6fx4MUr4te9jDkTy05iUwkmlLiv1scjMrYy23qe190=;
        b=FsasgelOkjsI0lOlO9ANUaCe+C8F0Y355M93O1x303XmvZpTzW4N90Noh5jS55XAXN
         XjRkffI0T3J5Y0L9W19C5YxmE09oGs0F0X+fFi+8ZlP6Rxj0vFNx8+mZYpvmnSt27meo
         SfGLWGcYV7tV8R0oHYGE0vOaYh0lcm2W2a8PI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490326; x=1746095126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6fx4MUr4te9jDkTy05iUwkmlLiv1scjMrYy23qe190=;
        b=IsTHmjsRu3W57aIKkEexPdGQyatqzLbVg7IyYkLfEImAKa1Ug2Of6wk7sky1H8YMr2
         KUOgGAkCu8b71/uOt2zceRoLlO/i/1ws7nuKS4qnlp+0ByKcG9Nn4Fs/MQGD8DDJY1t/
         y0ckza0OE7z4z7hOvIAXeQBsYkmD5T8cHb3XeksCB3zGu57KkrDzb8Jf20wRPbySfeKZ
         q2Vt7QqsyTxUxpZNvN/atZqAHWqPvdcBlJnR21kRU1WjatZgQjLBRZCMplYWoR5686De
         j7KeSmDQExxdFfXcBKmcSMy1egnclLM6QqCrHpNEABOWlDYKqFKJLv2in8ghGixO6o0r
         YT5w==
X-Forwarded-Encrypted: i=1; AJvYcCXlEQgTIB8Jzm7peWItdAperYSop8ru8OO4+pFtF3nJUtoXVxGilu7Ii74Cea/lsHGZBuGpgNpCCbCf6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCqyA6tBzXpETEpDRJdKMlI2OEH4eyOO/+cp4eFfYbPD3CPFJt
	szSFJoOjE4tJVvh5QjJrdGjXKuicRX6t0zRFqwLoEDQLzYoZkm6pkYMwoyNg7A==
X-Gm-Gg: ASbGnctjCC3A3WJK0SiZ7xYMhK69bKgNTm1oRgQ2YQILKhl43p/5DG7BKYVWxDptfTQ
	heoBRMBazfSm8Ee2D3XEjr5jnZwW3OO+MX6IfybbRy0/3tDoCjhyjPHpm8If+k4DhywboPfGbff
	xSVv0ppOQqp8w3QNFDlUsQ7GxfKOSbEvJayp1lmI1UVfpaFsmvHRV9iYL4Ve5zBDYO/fvPGa0Tx
	CAzFxKNftNFvGnJEOt0oZsQbFF8FUpso4nRFzavM0C6Ra1733UnxcHaSB6EOk61HlqZyM0TCoJF
	v5pr+T0ZZtUPB83eKQGfZprLRJey7clR9PudhH7hpsOQilL5LwezQY096A==
X-Google-Smtp-Source: AGHT+IFNflA0jQPNmROa9h8mKkta9N2LCXUl+MkxIZxkk1EuSqHoA4OT4/Txgj+BWOug6XhvWUVquw==
X-Received: by 2002:a17:902:ec84:b0:220:e91f:4408 with SMTP id d9443c01a7336-22db499755emr24690085ad.22.1745490326648;
        Thu, 24 Apr 2025 03:25:26 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:25 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/13] ASoC: dt-bindings: mt8173-afe-pcm: Add power domain
Date: Thu, 24 Apr 2025 18:24:56 +0800
Message-ID: <20250424102509.1083185-3-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The audio subsystem sits under a controllable power domain.

Add it to the binding.

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
2.49.0.805.g082f7c87e0-goog

