Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671F8336896
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 03:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780544178; cv=none; b=XDkXJHLtJ5ujO3ofkzx8uAGlPe18w6FGgptI4soQzsjFBa8M0umYVzXxJ5A6db4+3yuvTVM57yoR8y5KFQ621DbIldUEz2IGwxiMhO7DM0GCBsPngPJRvrcgr0KFuBklAMj+VagYDob44nEYkYhFxZt341/GMMFOy/KB+TA67HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780544178; c=relaxed/simple;
	bh=xCjeuu7+zl859aKolJL90IgyyO7+SOpa7ucBzKSx38g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZP1Q2RsvcI8cYxK3kpI17ePbHjCjD7hKKsNrcSdfWQOmgy3CQrujG30FCbSK1Zift05XN7zv6PRFK81ovs4SKnT0aceZzMR4qdaXZ7dC26mQA3xfE8ZRWlUNjUCOvvx9UZhmTpiMvIwcJmT2v2MYMbLfePG3UvNsKAotb3C4SKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MIaIDThh; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIaIDThh"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8423f626a65so87323b3a.2
        for <linux-sound@vger.kernel.org>; Wed, 03 Jun 2026 20:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780544177; x=1781148977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqiGW/dz4YSeZ3jaBcWBt4ocDaFmKXFEK9JnLN8NHsw=;
        b=MIaIDThhoAnPL9gVvVCnWtmV229n5wZeyqBQKS9leY+CDiaSF9uOfEEbGqBPZbAIwq
         sF7vA1TbzwsQ2S1c1i3vj9iUH+AP9itiBvDpYi+RKg/2gi/zEjSrc6PsAdJmlCyKWx/+
         ARsdlulUYKNO1L9otrrjZ3FoNu1VGT9hVUPgjMgUFRzYLn5D3GC0SW1/YZO5btiybnJ9
         4bGl/cQ1qhGRLVUHWFyf6DEIU0N/TmvrthexACeyWlW7HRRMjNdrufH6AsqREj0nNz4P
         fvzF4pE9scqL2zaHPlcuw9xSBeTvvZT/G5Zmh0FM3vys6X2MlvglWrhimVazvzxW/dwz
         JFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780544177; x=1781148977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QqiGW/dz4YSeZ3jaBcWBt4ocDaFmKXFEK9JnLN8NHsw=;
        b=D30G8V9Shf0Al8WWjGpm0deI/rIp7IR6hTAb3JzYPWnJX0RbjzY/Fia4uvFuIO72/W
         nZIKMlKOUqB1eBcWZe5durNlsEpvGJBBBk7Kd7AyoVe6UkPL7k7KFw7PbjIDvF1JHCqB
         TCnGrUZKr7gbqWSLe90wSRpvPeTXnpzS0F45UGxVj9N4IGS47ENBMuGyRi5YQMHIX9bJ
         htaQwwcpv1U190E/eYb/FXhI9xLgZSUNubuePy85OXyavlzJh3+zfj4ot/fJOIRRS7hU
         61BlMEtymIFZJ2OVYEBKyzeASv6FG9Ay2h2s9oKkONtz0BZWAMkvLJlTLvsAUGAgDIBx
         i/EQ==
X-Forwarded-Encrypted: i=1; AFNElJ90KzXkgP3wg8Nj5QKTcpiZ2SpEqxtaduE+/imbS5AHXW6cBBZr/nOdW4HbgioSt3dYpMUYQ/WVwuwrZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMu4offcH6tUFrO+q2v1HXM0igRN6EyglJFvyVjARywSINuail
	KZnT8xp8AGqfw4A2HiObHRy0NE/s8nrARaEAa1879VBqcVM8qdbIQqjK
X-Gm-Gg: Acq92OG2r8RkilRFYXLtEs8ppBCOrkWtuWU62eVa6A6SHDIpVUlpTGh7Mjmlf0H2IAc
	b/MpW0GjZ7KV+FjG92oN+ezVj5m4GfUPzYHWwLctCaTqKgYywFMZcRjOzTJ4/mwgWyNCUp9E9K2
	iMs+dR8Br2qWUcHL6lQjNDL9OJG7C8rpe1gGXIGpZBRUqkHgO2TWdAT/3/O3hdHaAdUb1qP8hGk
	oamdvFT5KYg1hTKEHnE26VeqBZKjvlllGc3mp5SexfxkrgGuf9IrTl1B9DZ9jDeThqohuvJ+MRf
	rFqbqZFw37AFgSjnMR7FDtZlHrIjeUhiF25YL0wG7pJreYE4kWS7eVrLVg8MeRHulrR3dEmmnas
	FJasAc7AG9t4uvJIHFakSH+LbJh+lkrtuumEY/ZdWKrsccsBFf3wUtBHDwTNsY0lU7iQ9K3l20M
	M0mK5Sd4oyN44b5okYxk5W/ERAcw68m6lRHLWjkUwS38/d5doDpbtgjQpRDTh81+HH5guk+kSFV
	MjUHbc=
X-Received: by 2002:a05:6a00:1302:b0:837:80a:5abe with SMTP id d2e1a72fcca58-84284fd0951mr6418129b3a.37.1780544176738;
        Wed, 03 Jun 2026 20:36:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221a7e9sm5539745b3a.11.2026.06.03.20.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 20:36:16 -0700 (PDT)
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
Subject: [PATCH v2 2/3] ASoC: rockchip: i2s-tdm: Use guard() for spin locks
Date: Thu,  4 Jun 2026 10:35:52 +0700
Message-ID: <20260604033554.96996-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604033554.96996-1-phucduc.bui@gmail.com>
References: <20260604033554.96996-1-phucduc.bui@gmail.com>
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

