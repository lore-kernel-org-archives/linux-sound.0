Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792940038;
	b=yuMl41x4GkiAqwE4e1Kl71BAEUCoFJssXxzdVAtjAm/tT1udyC1T+ehTY92M9hwL1CUI
	 F/ulJ9SeqblVzqtakOY5iZ3gRNTEOhzYkHTVLnj1QIAxEB7Kn+2oSkk1HMGEflndjFV2t
	 ZtoB+gxLtFNRyyxqhZUPjr4DE/xqWjKfG9sqyM34pXj06icPzRmNsJNgr1xHRXI8+qoGl
	 tCUMrdfaOYd2pfrpn9VRS96V3k8oLo9sLalAWp29JK8uI1SJWTJaSPDtRhsvzFg5xJs+r
	 XmmxIEjMUfyy5I0ldMnJtrrcWo8spIvGCE6iLi/dfa2sgpG1IhfO8hPTlijtjlTiz3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792940038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oXFztGQN0f+1MY9Wri1v1FfmKUwWYfKAL0FN/sMrW0Q=;
	b=OcXsisAzU7ChRXvYOsJ7t+6BJFTK2scD//cr+sgDtij7cscknGPAyWRMacZi1YXqkr4j
	 v8txSN0IZUM9I/+WPOIanG687u82VJ3zG/7mpTL8elB9Vz2s/buNM5DGCJu8vooamXDqZ
	 8LqpngEGACsyFZ0sQhf/1f/UtdGF/wjNg7vb+5jONHAjXtP84467p6n/2qoI2K6925HTG
	 4ayTnomQNcYZjv3gKLyYdA9w1BEtya2tLTiXUOr6PXzRM6d09SaDnbgXzx/+jRXiCB4bM
	 /i7wX554oMeOwNpy+H2nTaD7tYuJGNuWb2YwdRqr4TqWeS9qE25UzLW6HT8UMCz/buQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=abCqUT2q;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0461606A321
	for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 14:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0461606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=abCqUT2q
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1331381f8f.1
        for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 07:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792940036; x=1793544836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXFztGQN0f+1MY9Wri1v1FfmKUwWYfKAL0FN/sMrW0Q=;
        b=abCqUT2qPhh0VNCVDM4lRtN/Avcf8m2uOEUxnQbNwh46fgt8mndJ8E9RVdpNvxBHGE
         PKzyAeub3ezAtRI6CBQ+jE7mqJwu5G5xFPbQqs7ZiCHgYtmU7JifZdVjkgbt8vHoVrgK
         mCO2txsgZqB3YNpWFdS/t58f9+6DRNa5ddy0zHkQP12q/jvEg/dETYCZPSY+6WNJjUKj
         PRtYLuAVgAWlhkLndT2owcdropdC9Hwqa/VMBW+QNay99FIkILlBphNTd9UP80sYkWM/
         k5wLMVp/8AnO3SBcJvRJWaezPIeZp2aB6CHpzHVX+JIAdJvzXry2CzM8NPVagZ0UktCo
         8s7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792940036; x=1793544836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oXFztGQN0f+1MY9Wri1v1FfmKUwWYfKAL0FN/sMrW0Q=;
        b=b9uq+hDBgGltItALJGBeVoiJMZyIkIaSxiF8C080ksg+3xTwrPCNCd0i1Kox+ti5wC
         r/CjfEKebQp5TSVZOxdWz380mKvjYIetx2/O9yMrDlT0qPpm/f73AM5mWVysGX/l91qQ
         7Vn/brhSGLD44bftQUvik3fthS90NfvOD2NBq1hTHCg/4/zdq07RdR2oqs1OdURG+Kvl
         9fjMdzFcpqQS2iuMsrZukr264SHhNnXjWofMXFZHBYWpomrqUWTwiMM45vyphP2PvX8a
         Zr4HZ1WY4G0g3KrFJlk4jZoWa5wuzMocbrgiuZi+dezxvEkiH6fjjtJbmxpw+UfGVvLW
         pWfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIEIB/xZKI34+GNfXKjZed5BxxOB3CW8nBoUn9QZzHh2Mh30IhDRfm8jKPfEFIZYQlspB6THfuNSG28Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJzjhuiZp2ZjyfqkUSPe7fPTEs4fskHnInDi+u+9xrUfst+ES83
	ZPGbqNNZzfAzpx+o3tn8Ge1AFnH5dlx6MpH6d+mbEwXiYt+hdXIo8KPDp/5iIDWf
X-Gm-Gg: AYBFou3DCrTsZ5Xv7cfelPARKKNmLCnZcHbk2tut+XCICzninIw17KGLSGGtcK6TTHn
	GS32N7S7on9tobZKZwS7ZQyExI+bJ/45pfMXkIt7NagxI6Cw4Az3UJ4JXQaAJPy8lQjF8A8Jk4u
	pORS6wjimVi3IgbzDToBHBApWtWAjXI5IFiYoTuMSpbHAoQp5capOFGMvWCrUJghSVB+qQA+RPh
	bP18Q/DV/xxJU5PMUhFY9eqI3urnEmahJ/GdRb+PZ+noHU2OQQBFLEsrSY8GzG5WTlazqi4Sedt
	Q4YQYF/MOtNQSyhXjnmxl2TKKktU8KtWSFkmmAhOhKzB/rVutUNNaSQbEkEJcK3QZfc5P7yVVxo
	fvzQB92JaTR+bY04xmxCnab1uMjz+aZap7qHsTEqgVLztXi0luUMvdrFrRAQp8R2oMHjsYOCDe4
	zNBDlaaabab6RG1KpxIquPDAg7S6wc0HSkuf0EhrU32KYWd6QKWlwCNk9mdTxcuYyAVIGrq0ZrD
	YD3RocPAR7Zx8vu0G+cPgb+RpZaM/GQWTSXQj0VkxsbL41jb6aHyZk1P4rB6LtAnUaHDGSnipQQ
	RKkGNh54o6H+UgFhKSaoLVNYNBL0FMDGUgOy46Sd+ZOgA0+7lGbDzJDCVX8FQHF9JdQeUMM=
X-Received: by 2002:a05:6000:607:b0:48d:ff81:5201 with SMTP id ffacd0b85a97d-48e3eb9930fmr9037851f8f.41.1792940035985;
        Sun, 25 Oct 2026 07:53:55 -0700 (PDT)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:4c3:3a00:d533:9d50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb9cesm10986471f8f.27.2026.10.25.07.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:53:55 -0700 (PDT)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: dt-bindings: realtek,rt5631: Add the optional MCLK
Date: Sun, 25 Oct 2026 15:53:53 +0100
Message-ID: <20261025145354.3476371-2-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025145354.3476371-1-romain.tisserand@gmail.com>
References: <20261025145354.3476371-1-romain.tisserand@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RT5631 runs from a master clock on its MCLK pin. On boards where that
clock comes from a SoC clock output, the codec node needs to name it so
the driver can keep it running while the codec is in use.

Document an optional "mclk" clock, as the realtek,rt5616 binding does.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../devicetree/bindings/sound/realtek,rt5631.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
index 747a731c44..03ee25e1eb 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
@@ -45,6 +45,14 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: Master clock to the CODEC
+
+  clock-names:
+    items:
+      - const: mclk
+
   port:
     $ref: audio-graph-port.yaml#
     unevaluatedProperties: false
-- 
2.43.0

