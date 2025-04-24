Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A17222DF9B
	for <linux-sound@vger.kernel.org>; Thu, 24 Apr 2025 10:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490331; cv=none; b=JOd+3d088VOBa2HPkpn7Popi/e8uIttBSjx0eiwGzn1Sd3W+F5aoW/j8e3Yw87viZ0s4OcpMcLCHh2vh22FQk2ijDcSnQ+CywHyMKs6GhXVs1HyeP6DIAlsza8bCWiLmeVbAJ0lIu5Q3XZdwWP+u9OogwFr2ShlutN5OX3cRKQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490331; c=relaxed/simple;
	bh=ORoBOKClhRWUDm0wMhxb1yzCEXRsVXqohDtvhQ3sE0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qdz4LTSNQzM3MEjole9wavHR7dxHK/BzmejLZsKpl/5xr7hC+7cHPXfLIfkLCg9K+LS393gkN05PteYyH5fPucfXgAuuhKUx1iXj5it8PbVB6hWaFviLJMJHNYwhk69pbsezlf6tjac74QuoG242qSIubTdtK6hL5dlSvIhzw4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fwBH8mky; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fwBH8mky"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22d95f0dda4so12223225ad.2
        for <linux-sound@vger.kernel.org>; Thu, 24 Apr 2025 03:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490330; x=1746095130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhbo3dWwgEK3uRwRq4Xx2zA/jDMc12TYdmm1e2oYkOE=;
        b=fwBH8mkyo36SXhyXDeHEu68w6Nb+jckvzCx8/mCkFI7HFMNIM8KRXsM6ZVJm8sTE/a
         2JKa0QiJvCuIQuvfFm4guDbp3wmHLVJRxgJICIvh7+1BQ4bNKXVvdRhRGB5+dKoqofY7
         PpZJpKPxhShgQA/nHN0BoKzofSFLkTmcOWW5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490330; x=1746095130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhbo3dWwgEK3uRwRq4Xx2zA/jDMc12TYdmm1e2oYkOE=;
        b=YhCfY8N6O1ci0gC1aUPjEWK5F9NyXHp9Lpx/rv+GAR2m/lQeSrrBZuFTUQ8J0DYrmO
         qN7cB2BxDtsv9zjUvjwHHmCeAjvokw/bPbVCJ4W7zCSlmuRHxyxrZ/JMlE3IFh1AvnDz
         mWAYqXxl5jtx6bVKFNvDcMc4HBFQy6CUtTlqKdahN2weiGYpL06ai12ywO83kpsvQI76
         00WNei1EQriBu1FBdmQy2fw9Qfn0freY4xRiTmxHMSZX/fQl3RT0/Zh68lWMuRlnBSBb
         k+Wpe5ywXwXU8Tqx66GDnEF5MzWjgCsCG+8h82XA1z9xKuyW7Hy/WCKTi1AkPEY/qUIf
         KkyA==
X-Forwarded-Encrypted: i=1; AJvYcCVRm3/MQ9iaEMyZFPMJk3wQiX9oen8SBTAAyRY8wEvfSNT2h4Xw5Rucpv/cu/+xIwFEP2qh+eMzLI9Mng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3oZodqJYD33AKqLYS7kLPpDqGPJOK8RSQjVP0D3Gx5HNxqlJR
	YqqtvFuAYRR8kJoXF+5mf1F5jCzZSPqo5tqfCatOFR7uGqxQ5AsC/mN4MrnHJw==
X-Gm-Gg: ASbGncuHoGn5Cxi55gptYO2T9cAtcLLLdpTpiqFfXn9M7Ag1V+vRESROb6RvNU947dy
	ZhDCqQCajMB2sfBEL7Vo0PzgB969WbxBB+VeQ+e/CWhhjaXgnDIw9RUnWmDnNyhETJpe85BPMO4
	ZXHTjhVx/TVjxJRrazCywLNNq0TW9QWiHvdIhtT7jf/BI4rWWrtrSciBaOgbBz6+xVQlT9Ycx1j
	JWecch6C6Uym0W+VPEAt44Lu/3xjmFMN3noc6hcHtE5eVk5/Ke3F5TqqJmdMkVkQPfRXvaq+GIw
	n8229jQEhrf9pGeTmJLfY60CjqlhQJlCG+KO1l+lhpgWpyJ0U+1qZ0hjhQ==
X-Google-Smtp-Source: AGHT+IELSxxaIrlWkT9p38inClLfKF8hG21EugY89NAyG2v2PsTI+Qb1Qw/gECNiLb039w0VJotWQg==
X-Received: by 2002:a17:903:90e:b0:223:f408:c3dc with SMTP id d9443c01a7336-22db3bb22c0mr25973895ad.9.1745490329723;
        Thu, 24 Apr 2025 03:25:29 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:29 -0700 (PDT)
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
Subject: [PATCH v2 03/13] ASoC: dt-bindings: mt8173-afe-pcm: Allow specifying reserved memory region
Date: Thu, 24 Apr 2025 18:24:57 +0800
Message-ID: <20250424102509.1083185-4-wenst@chromium.org>
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

It is desirable to reserve memory for the audio frontend.

Allow the "memory-region" property, to be used to point to a reserved
memory region.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
index 666408d32f5c..d8993b5d457a 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
@@ -48,6 +48,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  memory-region:
+    description: memory region for audio DMA buffers
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -90,4 +94,5 @@ examples:
                        "i2s2_m",
                        "i2s3_m",
                        "i2s3_b";
+          memory-region = <&afe_dma_mem>;
     };
-- 
2.49.0.805.g082f7c87e0-goog

