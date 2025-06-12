Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A8121D3DD
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 07:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714568; cv=none; b=MzMzTRzmQuK1pS2/1Fgh+IlOEpBh1fChpIdavJHFHcnNdSidc/DXG27tPLnObfCd4ySRMNAI+JpdMC3y5t4B1evRgbeY58eALMBZJKnAjEQ4LpcvLlQ8HF5vUbdD3Qb3pNB9SYv6wuYH/qT1Yok+PZtssLmFp6l5XsyL4qNR6Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714568; c=relaxed/simple;
	bh=GB/p/LNUInAZmB/jmWxOOXaF6ppDZpt2N2fwtIwapzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M7JIiJMWuWl1G2sn8KHiFoU+KNprEE39ZIRwYxSj7tbevPImf/8XTyJu+JKnr/DS8hgJSElmP/lxTtReJpNXgpE+E7POdNt1uDhuEbrEr8EcVN4D9UuFQ4dDlRustUHdOJNMgmzxGfnhIGnBO2YEV8C71/OVc84SJVNkznlWkc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gymkjwyh; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gymkjwyh"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2360ff7ac1bso5086715ad.3
        for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 00:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749714566; x=1750319366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qw5Lgt5fODmZWlZ1xq501GDoPtHJnRW5D55nCqbrfp4=;
        b=gymkjwyhy1Bb7Ebnb1EQ8Pm7FjBoDvQEMRQLvIB2zK0o6p7HSm42UPnPCdVXPlJ1eL
         72YeODFwANy+sGp2O3Nt4nirVDNSO82Xch1x50A3V6ID28R4RRm3DNrOmMuQLofpigIO
         QEGVaug2vVsAT0vyTkxbX3uwG96bgcOHjkITc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714566; x=1750319366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qw5Lgt5fODmZWlZ1xq501GDoPtHJnRW5D55nCqbrfp4=;
        b=nP+eI3oBYJgtY0dpw04CE0LGVGd2X5JDPSKg8tr4qBOLall97UAbmuh28ajkt9NhSp
         ZV3wdBNSVRwwh225W/PtW6k41x8DfsdUOHIgbmzQeOkkMB5PVjhNVnWuUS1ZplEzGD2a
         4QCluhMesfPuGc6frhiomg3lUq2WZQe8chsX5FEufTPeB44uqrAm6TfJljE6agKI9D8+
         D0os5lqXKTRl8J/KiaM4t1l4C86hMK05dUnxCS/3KKPUotvGZ7JcdPZXkM5AJMzHQWeF
         cmoUB8xF8YXCJH0BRzspxaQXvMw4a9YVx17PVknULXMHIHJIGHzDH/0DYaWzLzRypFQm
         /9Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ2gIqGP0Nx7fzlOicIHnKIDSFFIpia4tZNgFsLH47d8AbLmWpUxGtC3mUtxqYKsNEmZeF2c8Yo3L6Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl9vkvoZTu5luj0rqeHPP2cSjmd5SwMBNWMlPnjuOOZx9qvFpr
	+KtXR3C8miUfs9R15R3RI++MZGpBEt0vY3WH3je7CGi6769ieMUzYuNivNKdmwkFmQ==
X-Gm-Gg: ASbGncu8oyTh/BVFDYnBvy2xIiDb/0CcE75xEA6oFzDokJNYFNC2jn7aKRbArvOz5pE
	z2yfmDP7oZaLuRslK5/FFgo30kTUy/uumA0IYKvasJAt4zXmfOoclqTYCruWKly8iLM5wX7DLE6
	rcWN/zZRDUQoxrz8/ADcA7MtBhpmG4DhPZcl0QTqTZY1TYJ8QkP3mgumi3hAbLrjQYNjyPHH/fx
	utcDz52iEqnrEKRm72hEBok5sKtfYNn+vAGagfUW0Rx9GZVZG7EhfaemnYio4LgAn+oMbud8nT1
	J1CGBWYbXFU8B0+CtBn+hlPEdjrGH02SUGZRGLW141Ovr6VQqM6GYQpPxIASNF8Ve0dQz7ihMzP
	iAGo=
X-Google-Smtp-Source: AGHT+IGLmVy09OL49mJ9w79Slu0toVZtoekmlbumEh4gtf04pg2yxxSPvNOvb9XVQc/93dY7TLT9gg==
X-Received: by 2002:a17:902:db08:b0:235:f632:a4d5 with SMTP id d9443c01a7336-23641aa22e5mr78622785ad.9.1749714566433;
        Thu, 12 Jun 2025 00:49:26 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5b9:e73a:2e58:5a47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e63d42esm7893295ad.74.2025.06.12.00.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:49:26 -0700 (PDT)
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
Subject: [PATCH v3 4/9] ASoC: dt-bindings: mt8186-afe-pcm: Allow specifying reserved memory region
Date: Thu, 12 Jun 2025 15:48:55 +0800
Message-ID: <20250612074901.4023253-5-wenst@chromium.org>
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

It is desirable to reserve memory for the audio frontend.

Allow the "memory-region" property, to be used to point to a reserved
memory region.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
index 7fe85b08f9df..f5af2cf18158 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
@@ -25,6 +25,10 @@ properties:
   reset-names:
     const: audiosys
 
+  memory-region:
+    description: memory region for audio DMA buffers
+    maxItems: 1
+
   mediatek,apmixedsys:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of the mediatek apmixedsys controller
@@ -170,6 +174,7 @@ examples:
                       "top_apll12_div_tdm",
                       "top_mux_audio_h",
                       "top_clk26m_clk";
+        memory-region = <&afe_dma_mem>;
     };
 
 ...
-- 
2.50.0.rc1.591.g9c95f17f64-goog

