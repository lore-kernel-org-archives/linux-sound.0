Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32C73F4137
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 03:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780459125; cv=none; b=p0H+bTdRQACl6q2VBwpTcoaUTz3ZAsc0hVJBSdC8YUg/AuYeV5DjDtCFoyF2nJrsAKpGiOQcf8baWAmV/T53dkcIpXojFcdRC47SzYZq8HuT4Ak11zHnpTubZ+/Ha7g7ri1k2YVYX7mYKt7qDhqXyzbKnuHBo+4IdGUwMPl01mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780459125; c=relaxed/simple;
	bh=xCjeuu7+zl859aKolJL90IgyyO7+SOpa7ucBzKSx38g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cqMXBS3xyhqfejgWLYbWpigTmsw8fqR5mqi8zecFHO+6nKgN0THJInjAZub27Cyh+ry934yt2R3n5T0rOsdczjPM1oDOoqL0YZfXstnpPm4q9WxnY1LuOCgrNxLHruWilYEbtNsSnLtisNqqfns0GDWwlBB05ZUm2QolvEFAHmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmvfT/0z; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmvfT/0z"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c8588f8fef3so1503985a12.0
        for <linux-sound@vger.kernel.org>; Tue, 02 Jun 2026 20:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780459124; x=1781063924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqiGW/dz4YSeZ3jaBcWBt4ocDaFmKXFEK9JnLN8NHsw=;
        b=bmvfT/0zm6w9yU+U0JlWOxvJ6Ji+XpxfQvTus51t9fusEhj+GZ2wGIqHtKvBQgeaTw
         3rNNuWUxZgbZHfQX/JSgiK5m6W2CL+IFUUsJGVJMgsJlFg0nvKyxJNtI0pmplTycmowA
         QICG55tzKyO2hy/Y97t9Lei4umTK7Z1kx+mRUo3bRPnexEskeboFDDWiun6ESmLOsTqq
         yEAFMXzqDlCGTEsu89omOhVzIFYOL6LOUE8/Kbys5X+TbUcl8QI7JRC1oQPaVDjHlT+4
         PXRtyhuRAhUjQ9mYHHhX9JpBc0meAk9UjEnXN49weM5URV3LXH0qk+IpGHp4sFc8EKTz
         v9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780459124; x=1781063924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QqiGW/dz4YSeZ3jaBcWBt4ocDaFmKXFEK9JnLN8NHsw=;
        b=q4D6wwBwFICxCzuXL099g9LZVtt7NimKSbdrNQgf24IaS/ToSVb/SlsxCq1wn8WprT
         hJ69o69UgoDjQmJ1sJc0dWCF61PA3Ok2ABc+eti0MZDBlpMjsXKe5rWAtjk+L9bXTW1Y
         EYiIcXoAx0loBrUP+ANdKJmGi6GaX3BUdP2S2IHGO4oFeMtaOqbglpVpTE4WTcbLhgDX
         xZmIKKLZYTBaGQVPfXbliNk2N2j2VSBFrmhliQJLHSwp+RiSeu7Rf4PBF6nvrRhK2u6w
         ZXcispL+PsKVMp/mVHBbr72CfRGc+TtsgUGX9fsoSFQ6d7BeMnHRN7QdThRqZQ2Xebsb
         wqWA==
X-Forwarded-Encrypted: i=1; AFNElJ9uaQPYEoPIHTX2bw0UM8JdUYPjrBctzri4L2lydJ6usYQ/USvvWc6PmOVkB7QTKaJnksyWGbnXU8QrGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr4daGmsQ9RLNMw0+zJS953yzIPRgwENVCkwDOh4AP1yD98aEI
	bI0RUfqXbXkqRTXI5E0TERuXY4eHPEtiKJcZg9lSmiz6KxgHokk1Na4e
X-Gm-Gg: Acq92OHuexxnVc/IfnGHSLSz3BgoBKNFH5i0lV2lLVEqH8vtejh4luJqiZaNr0XbiJw
	K1m4WUgtiqjDzOPdkEfj0d78wKNl4qmBjYjm3gzNe5dSHSlFO07O68JlQpz1RRRlX4qkkb1eI6y
	CIyMt12+adzg8uRzRxxuE2iZ3s9UrRQpxQOPY216M4XTMZdYJFIiWc7B6nCP+cYzNCE67rbAyPI
	pDP3gbX7zmrqkGF0dkmqkWnYiqih/MZ6AC8XUUVaMNqVC/l8+zQ9FrVOooYjkhURgxy56sjEZyN
	sl/8Oonf6BDk1dNEZVGT+DnuyD9pNn9UWvb+IRMRS6Nhr8eaPLqMy7DFjT3ttA3zzcTvTjEj5JS
	9HsfzwPF6cCRryL4uUV4b9/KPYrXPqv9jqBTZTAOQi0iNDhQAfKWaQyD/e1e0hQs8BwhnmP2Oh8
	aopyBKQCoFI2L9JVCoIdhWERNr/zrpBjHmcIWK7YM46u4Kwom2zOpVwmFhHY1FMJgjw7I2
X-Received: by 2002:a17:902:e5c6:b0:2c0:cb90:1e07 with SMTP id d9443c01a7336-2c163a12aedmr16797215ad.11.1780459124031;
        Tue, 02 Jun 2026 20:58:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e294sm8461085ad.6.2026.06.02.20.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:58:43 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] ASoC: rockchip: i2s-tdm: Use guard() for spin locks
Date: Wed,  3 Jun 2026 10:57:40 +0700
Message-ID: <20260603035741.68893-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603035741.68893-1-phucduc.bui@gmail.com>
References: <20260603035741.68893-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.

 sound/soc/rockchip/rockchip_i2s_tdm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index fc52149ed6ae..3f3db28b8940 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -285,9 +285,8 @@ static void rockchip_snd_txrxctrl(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai, int on)
 {
 	struct rk_i2s_tdm_dev *i2s_tdm = to_info(dai);
-	unsigned long flags;
 
-	spin_lock_irqsave(&i2s_tdm->lock, flags);
+	guard(spinlock_irqsave)(&i2s_tdm->lock);
 	if (on) {
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			rockchip_enable_tde(i2s_tdm->regmap);
@@ -313,7 +312,6 @@ static void rockchip_snd_txrxctrl(struct snd_pcm_substream *substream,
 						I2S_CLR_TXC | I2S_CLR_RXC);
 		}
 	}
-	spin_unlock_irqrestore(&i2s_tdm->lock, flags);
 }
 
 static void rockchip_snd_txctrl(struct rk_i2s_tdm_dev *i2s_tdm, int on)
@@ -587,12 +585,11 @@ static int rockchip_i2s_trcm_mode(struct snd_pcm_substream *substream,
 				  unsigned int fmt)
 {
 	struct rk_i2s_tdm_dev *i2s_tdm = to_info(dai);
-	unsigned long flags;
 
 	if (!i2s_tdm->clk_trcm)
 		return 0;
 
-	spin_lock_irqsave(&i2s_tdm->lock, flags);
+	guard(spinlock_irqsave)(&i2s_tdm->lock);
 	if (i2s_tdm->refcount)
 		rockchip_i2s_tdm_xfer_pause(substream, i2s_tdm);
 
@@ -614,7 +611,6 @@ static int rockchip_i2s_trcm_mode(struct snd_pcm_substream *substream,
 
 	if (i2s_tdm->refcount)
 		rockchip_i2s_tdm_xfer_resume(substream, i2s_tdm);
-	spin_unlock_irqrestore(&i2s_tdm->lock, flags);
 
 	return 0;
 }
-- 
2.43.0

