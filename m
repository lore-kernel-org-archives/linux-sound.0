Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D27426D13
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 07:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135535; cv=none; b=MnEaXTFSrnJY99g9x2cl0ydedFHndo0GmENMMPGDtgue9l7qx48rICyCzEaNDqwMqryLZDy6f3QEOhC7S2QZcRajIqKLKOHnnAbAAoEkkzbFF/OeIZavjlqk2Eg3SdzjDbntLpNTyR+znIhV5+ZAD0U+sXDK8z8K9D4hitJ5Qxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135535; c=relaxed/simple;
	bh=LSyouvcf5HL9PBdZ6BqALa5TCyY+PO8Ne3Kq3E4EY6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dBBvs8ihNCnDIwHikqvQhfYROyZwAhuSFDGgCuqn50Mgz40yhjtzPkVp5ZFM9+p4vqB++WFJD0Nz8cokkGFlSdV7M4RKoe1x+IY0Ip7wJGrRwErDirBwoPQg186KWmgYQ1ZKWR5+IJV1Uvpxnc5KmZVdsOF5f5goARhgtS2hwV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o8w3pIWB; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o8w3pIWB"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so1570324a12.0
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 00:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792135533; x=1792740333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dFOnmACi7RqhQH/i7qX8OEUyqzmBEbcDIMRqXIVixj4=;
        b=o8w3pIWBhBJFwutYs0i6/ZKgbyNF/1McngUfSWWK9Iydht7Bl2W1Mw3Lzn7l/G9KRW
         1PU7hGHCmJeezvL3NUytKn40/LCfrDBx4q7uPxHD7ybKuyNRUCgSi8XxwvzRy3+brVIA
         TvEb9Dzjy7dnqDaCse4E8jdheZJoPIGVNoWmXi31NCAWPqjTg1Vt0HeYKpKiFtpgdjn+
         ZFkAsXq0gnydkY4qCTqXhJsyo0Kftds9SsuqozE/2KkleBVMcJ1tq6uVwF5UM5r9aQdD
         bGm48UtenRq26sIHMN4gYB2JUeuDEAk+f8qbZ+/GWWK0gIzfMRbncyHaHPwJoDKLoYiZ
         EDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792135533; x=1792740333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dFOnmACi7RqhQH/i7qX8OEUyqzmBEbcDIMRqXIVixj4=;
        b=ikuq0kknGnZtnGeek2RqcCW8DPq10zj4Eq4yN4y4QyzSMFoI2jOGM/Rvt9vIlwlLFQ
         TuV6bAiP2kRgix00+to/3RqODFvfhTroqnshz7GTd2xqd6BAAl28kdQ7wFaEEEk1BbXp
         /GMPGiMOAuEK9QkBcI5H4rtTHqL7lMA6ss9yW02n825v+zvCzAk6uIvsXF6pwT/Uu+r1
         yp0SWB4nhNkS/ChnoIJt4NWw0No55icF6QCpHKl/LM3Gkit3rFABANNZ59OK33kn4LV5
         ImRI+UfyLmAVB2qzjQk9GVX3HWyT2j6OLLQ5TbABdmVMIuJEABVon0aW+/NnsLYU39mz
         alWg==
X-Forwarded-Encrypted: i=1; AKwUvByC5wUCRk/t7Qy3JcpO7RvcOcFA8C2dmrwMCP/zQQ060JFiJL2QsVw9LDaK1W0A6FtDJ5WMUwJIkkKTmg==@vger.kernel.org
X-Gm-Message-State: AFq9FYI/ks26AMSiwmrPSPXj7GOgeO6PX3AMx4wRJzlCBGCSeH8N8LKw
	wAEc56ZCrpw1nXqMnkKydSRFpF46dHipxVtbVZvtsYgwvCRdfn7zjzCMxf84kEJ1
X-Gm-Gg: AYBFou3P+hZU3tgCC0uCIAU/wTxPG+xPW/qP5XK019cMXM1vp9fIn2aqDERo2p7ESkb
	A7yGFIOsPongOYLkXOJSZPIYCn3dXgXGTMtBQr1dTmwRYsRey0+cmDBa38yL+dQmWWmhVsQaV1M
	l1+ddwaqnmMP9EwdnOfcX3BYlq4Z1aP2NVoJhbKtIdgS/kBBz6kPqO9KVenphQnshS7Ilu1WOxv
	snD+HAdOI1JDEoaimwrP7wCHyghrDhfKpgBvEfzCOYo+wt9cdJUvAK+z19rA2NEQcfdnuV/xH4B
	4CbrbKslgCRhhXxXB1ag2j7gbJQkkStn4H01WCYo3K5txbTz0aSmPyA+WY09xcyGI+BRdzJPu7M
	And+QackRPSG4g7hlxmw9LhapY/sKPIA0gpwKVxQt/q0dkmcOHEWdSahIPBhZHPEQoAfDpTB/fW
	Nr2O5bOsBmY42XOTBg/BwPvQDH/T/TAyGdXxWm70YSzRNN/YHE/e0UmEpdeQvVHBiqtwpqS8QbQ
	57R+JGNm1KeUv5XssM4VLfTmi0MgxW28PBdvx1biHc/XuM/bGZ5h1ZYnTE3o6eamEralhaRSnw=
X-Received: by 2002:a05:6a21:e00d:b0:3e1:792e:f51b with SMTP id adf61e73a8af0-3e1792ef5e0mr13276138637.86.1792135533530;
        Fri, 16 Oct 2026 00:25:33 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549b6171sm615257a12.14.2026.10.16.00.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:25:32 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	support.opensource@diasemi.com,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] ASoC: codecs: sta32x: Fix definition of Ch2 and Ch3 Volume Bypass controls
Date: Fri, 16 Oct 2026 16:25:18 +0900
Message-ID: <8576f091aa0fe172ce43f28dacd6a1bf638258c6.1792135144.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792135144.git.sammiee5311@gmail.com>
References: <cover.1792135144.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each channel's master volume bypass (CxVBP) is in its own
configuration register, C2CFG and C3CFG, not in C1CFG, which holds the
channel 1 bit.

Fixes: c034abf6e503 ("ASoC: add STA32X codec driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/sta32x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/sta32x.c b/sound/soc/codecs/sta32x.c
index 2865a07be395..1e4a19769618 100644
--- a/sound/soc/codecs/sta32x.c
+++ b/sound/soc/codecs/sta32x.c
@@ -491,8 +491,8 @@ SOC_SINGLE("Ch2 Tone Control Bypass Switch", STA32X_C2CFG, STA32X_CxCFG_TCB_SHIF
 SOC_SINGLE("Ch1 EQ Bypass Switch", STA32X_C1CFG, STA32X_CxCFG_EQBP_SHIFT, 1, 0),
 SOC_SINGLE("Ch2 EQ Bypass Switch", STA32X_C2CFG, STA32X_CxCFG_EQBP_SHIFT, 1, 0),
 SOC_SINGLE("Ch1 Master Volume Bypass Switch", STA32X_C1CFG, STA32X_CxCFG_VBP_SHIFT, 1, 0),
-SOC_SINGLE("Ch2 Master Volume Bypass Switch", STA32X_C1CFG, STA32X_CxCFG_VBP_SHIFT, 1, 0),
-SOC_SINGLE("Ch3 Master Volume Bypass Switch", STA32X_C1CFG, STA32X_CxCFG_VBP_SHIFT, 1, 0),
+SOC_SINGLE("Ch2 Master Volume Bypass Switch", STA32X_C2CFG, STA32X_CxCFG_VBP_SHIFT, 1, 0),
+SOC_SINGLE("Ch3 Master Volume Bypass Switch", STA32X_C3CFG, STA32X_CxCFG_VBP_SHIFT, 1, 0),
 SOC_ENUM("Ch1 Limiter Select", sta32x_limiter_ch1_enum),
 SOC_ENUM("Ch2 Limiter Select", sta32x_limiter_ch2_enum),
 SOC_ENUM("Ch3 Limiter Select", sta32x_limiter_ch3_enum),
-- 
2.43.0

