Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468D13EDAD4
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 10:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876152; cv=none; b=mazCHOefbDRJOtxvAhZXwW2f14pGgkuH0aMt28CETvq+zknAoGIWPPh+rFme2iQb9sNtv4vAA458n43/9fD2gGFAXtdaGdMCgk3EI175OE3vFs7uwUJawly/KAuPgudA1PsYNPtHYjXYJd3+1jUmoIbZLv/cuVXOl07aegaaiGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876152; c=relaxed/simple;
	bh=NLNQqeXkei9wv3klacbTTFdaeG/NZV4GJ88Um9WERzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BYyrIwhffoAdpORU57RpmQIOOSAlWMhmWHq+nDYu7CFVLwZaUYRHxWw1H2C966iijSdGeECZ5823xXW5ws8k166Q7liw2pO/9lLiaNg9OE4Q7oAik4yVKntGkakPfZJqZbFIgvU2E92QvuaM8UZAlz2Ip7+VxOYHj3HyZlviF6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n+zK11zy; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n+zK11zy"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36af4b7840aso2036500a91.3
        for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 03:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779876151; x=1780480951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruiN7Don1fsxHLQ1dcIBOeuAr/tHo9uT0rXYDH6zHfM=;
        b=n+zK11zy0TSG9FtQRWTQK3J7kEj4IfY9fihMBD0h/SL1tpH3WjEiP2vlYuxP4htfJW
         3r0NQQqADSQzjoYjBjHzCajNyg2oEDsO7ioV3YgLcZMSM8iQq+pVAFdNyuFJlo5GzDJI
         CU5MWO59ZgsFChawL5C65/wTv2KCDPvN849UIOoZXl/xOQUrnaYYhVEVbAcGqYbxLbQ2
         IBALjXhJaiulrqiBIxq/8ghuuhuzxpkW61IoDolYDEWtv3t0KPUoldUS/I9yvDzAWW2y
         YNXi7MlHV3h16/Og8Yi5icgi/HRiyN5zBXdvSNQncz16F3aIMbNF2g9zY1o8Wj8CX8pb
         A9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779876151; x=1780480951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ruiN7Don1fsxHLQ1dcIBOeuAr/tHo9uT0rXYDH6zHfM=;
        b=RA2KZAOerKJDimGP3poWgn7YgEBMXSOPbTDMwtg7cG1rXLxqRM2qHisoV/J8/WCqCW
         cvxIYB5263R55kPI+vKiJ3SjISVz1kg2ppWRIG2+p62DuyNllUeeFdHjkMVgOPpsam62
         B1MHZpyFgz0cvfD28L4lQPJmtqY+csFvqFwj514t6laqjVpjcRK1yAruw8myE8mmtujM
         6KGcdbg/pcGT3Ngqn/BPgnD12/PA41ejzm7r0nLV1Jkw0GXQRHOCoJfud8vRnq/ZAcHU
         g8xqrpi6qmoJEgS6mSi6vkwBKBkigA4Ts65AR/O6A+LuELdgkSIAlcxp2Tp417B2G9jF
         5IQg==
X-Forwarded-Encrypted: i=1; AFNElJ80rcRUDne4Azy/AWehrcEL0GLEIKo9HWYibu8J6p8rM9JgkjmlNUfBfHi2SsqQT53REWpmI5gH6JmyWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGx4OCpshTCREJwlzLHQ5vw3jlaFy+z9kQpt9yyTpjxhbCeO61
	/ujlcpVIXPwcRRPVJCUrH49v+iWeZtFz7djymd6nXoyH1N8GIWs98f3D
X-Gm-Gg: Acq92OH/xjwPih/Zi04iKK7JfotzwZXpdEdzhjFCxN53kWTiXdjobeMCq45hP+7D4i2
	g06eWjSA4g/eNsIcrYpB+4lHgfXbjJhq3pwBlQC9eFKyCbuEus09alAqFqumMgljQyeLDEulbJ/
	nCB9B8AtXkzA04aAZ2rdwQJGa7DqG9zanpdYWW1s8VFSyKBzxaFnI0Q+5OW7xSPnF5QGWYuhkPF
	DXxyeEpDodFrGJeFldbuD3j2ItsSHharZFoafPETB/lhiwevRDMCrk28I5ne1ylWa/2fo+q9feq
	C/MWiLf08uuQJUCOenEonsb4kXUVrTanYyPPeAiAZR3NmiThOXli0E/k8QKNFYb61BE9+iYl5WL
	gr1Yitdk2J2PEs0sU0lbqJQdB9f2kGdOKQzBAAKHbKiC82JXdie7F3qcP9BqOkXfzOyntZ5Tja9
	M/1K+25R5fYfMPLZnCnpsdpwZYNXaM2SwHu2qGKqlISVAr3bOm+Jw4J3+EVgxqn9/Irzde
X-Received: by 2002:a17:90a:c88d:b0:366:10f1:3d86 with SMTP id 98e67ed59e1d1-36a67616988mr23282564a91.22.1779876150588;
        Wed, 27 May 2026 03:02:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202902b1sm12205631a12.6.2026.05.27.03.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 03:02:30 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: sti: uniperif_player: Use guard() for mutex & spin locks
Date: Wed, 27 May 2026 17:02:06 +0700
Message-ID: <20260527100206.26788-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527100206.26788-1-phucduc.bui@gmail.com>
References: <20260527100206.26788-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex & spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Compile-tested only.

 sound/soc/sti/uniperif_player.c | 73 ++++++++++++++-------------------
 1 file changed, 31 insertions(+), 42 deletions(-)

diff --git a/sound/soc/sti/uniperif_player.c b/sound/soc/sti/uniperif_player.c
index 45d35b887e4e..e4b9799ad9b2 100644
--- a/sound/soc/sti/uniperif_player.c
+++ b/sound/soc/sti/uniperif_player.c
@@ -65,13 +65,15 @@ static irqreturn_t uni_player_irq_handler(int irq, void *dev_id)
 	unsigned int status;
 	unsigned int tmp;
 
-	spin_lock(&player->irq_lock);
+	guard(spinlock)(&player->irq_lock);
 	if (!player->substream)
-		goto irq_spin_unlock;
+		return ret;
 
 	snd_pcm_stream_lock(player->substream);
-	if (player->state == UNIPERIF_STATE_STOPPED)
-		goto stream_unlock;
+	if (player->state == UNIPERIF_STATE_STOPPED) {
+		snd_pcm_stream_unlock(player->substream);
+		return ret;
+	}
 
 	/* Get interrupt status & clear them immediately */
 	status = GET_UNIPERIF_ITS(player);
@@ -116,7 +118,8 @@ static irqreturn_t uni_player_irq_handler(int irq, void *dev_id)
 			dev_err(player->dev,
 				"unexpected Underflow recovering\n");
 			ret = -EPERM;
-			goto stream_unlock;
+			snd_pcm_stream_unlock(player->substream);
+			return ret;
 		}
 		/* Read the underflow recovery duration */
 		tmp = GET_UNIPERIF_STATUS_1_UNDERFLOW_DURATION(player);
@@ -143,10 +146,7 @@ static irqreturn_t uni_player_irq_handler(int irq, void *dev_id)
 		ret = IRQ_HANDLED;
 	}
 
-stream_unlock:
 	snd_pcm_stream_unlock(player->substream);
-irq_spin_unlock:
-	spin_unlock(&player->irq_lock);
 
 	return ret;
 }
@@ -363,10 +363,10 @@ static int uni_player_prepare_iec958(struct uniperif *player,
 
 	SET_UNIPERIF_CTRL_ZERO_STUFF_HW(player);
 
-	mutex_lock(&player->ctrl_lock);
 	/* Update the channel status */
-	uni_player_set_channel_status(player, runtime);
-	mutex_unlock(&player->ctrl_lock);
+	scoped_guard(mutex, &player->ctrl_lock)
+		uni_player_set_channel_status(player, runtime);
+
 
 	/* Clear the user validity user bits */
 	SET_UNIPERIF_USER_VALIDITY_VALIDITY_LR(player, 0);
@@ -546,11 +546,11 @@ static int uni_player_prepare_tdm(struct uniperif *player,
 
 	/* set unip clk rate (not done vai set_sysclk ops) */
 	freq = runtime->rate * tdm_frame_size * 8;
-	mutex_lock(&player->ctrl_lock);
-	ret = uni_player_clk_set_rate(player, freq);
-	if (!ret)
-		player->mclk = freq;
-	mutex_unlock(&player->ctrl_lock);
+	scoped_guard(mutex, &player->ctrl_lock) {
+		ret = uni_player_clk_set_rate(player, freq);
+		if (!ret)
+			player->mclk = freq;
+	}
 
 	return 0;
 }
@@ -575,12 +575,11 @@ static int uni_player_ctl_iec958_get(struct snd_kcontrol *kcontrol,
 	struct uniperif *player = priv->dai_data.uni;
 	struct snd_aes_iec958 *iec958 = &player->stream_settings.iec958;
 
-	mutex_lock(&player->ctrl_lock);
+	guard(mutex)(&player->ctrl_lock);
 	ucontrol->value.iec958.status[0] = iec958->status[0];
 	ucontrol->value.iec958.status[1] = iec958->status[1];
 	ucontrol->value.iec958.status[2] = iec958->status[2];
 	ucontrol->value.iec958.status[3] = iec958->status[3];
-	mutex_unlock(&player->ctrl_lock);
 	return 0;
 }
 
@@ -591,23 +590,20 @@ static int uni_player_ctl_iec958_put(struct snd_kcontrol *kcontrol,
 	struct sti_uniperiph_data *priv = snd_soc_dai_get_drvdata(dai);
 	struct uniperif *player = priv->dai_data.uni;
 	struct snd_aes_iec958 *iec958 =  &player->stream_settings.iec958;
-	unsigned long flags;
 
-	mutex_lock(&player->ctrl_lock);
+	guard(mutex)(&player->ctrl_lock);
 	iec958->status[0] = ucontrol->value.iec958.status[0];
 	iec958->status[1] = ucontrol->value.iec958.status[1];
 	iec958->status[2] = ucontrol->value.iec958.status[2];
 	iec958->status[3] = ucontrol->value.iec958.status[3];
 
-	spin_lock_irqsave(&player->irq_lock, flags);
-	if (player->substream && player->substream->runtime)
-		uni_player_set_channel_status(player,
-					      player->substream->runtime);
-	else
-		uni_player_set_channel_status(player, NULL);
-
-	spin_unlock_irqrestore(&player->irq_lock, flags);
-	mutex_unlock(&player->ctrl_lock);
+	scoped_guard(spinlock_irqsave, &player->irq_lock) {
+		if (player->substream && player->substream->runtime)
+			uni_player_set_channel_status(player,
+						      player->substream->runtime);
+		else
+			uni_player_set_channel_status(player, NULL);
+	}
 
 	return 0;
 }
@@ -642,9 +638,8 @@ static int snd_sti_clk_adjustment_get(struct snd_kcontrol *kcontrol,
 	struct sti_uniperiph_data *priv = snd_soc_dai_get_drvdata(dai);
 	struct uniperif *player = priv->dai_data.uni;
 
-	mutex_lock(&player->ctrl_lock);
+	guard(mutex)(&player->ctrl_lock);
 	ucontrol->value.integer.value[0] = player->clk_adj;
-	mutex_unlock(&player->ctrl_lock);
 
 	return 0;
 }
@@ -661,12 +656,11 @@ static int snd_sti_clk_adjustment_put(struct snd_kcontrol *kcontrol,
 	    (ucontrol->value.integer.value[0] > UNIPERIF_PLAYER_CLK_ADJ_MAX))
 		return -EINVAL;
 
-	mutex_lock(&player->ctrl_lock);
+	guard(mutex)(&player->ctrl_lock);
 	player->clk_adj = ucontrol->value.integer.value[0];
 
 	if (player->mclk)
 		ret = uni_player_clk_set_rate(player, player->mclk);
-	mutex_unlock(&player->ctrl_lock);
 
 	return ret;
 }
@@ -693,12 +687,10 @@ static int uni_player_startup(struct snd_pcm_substream *substream,
 {
 	struct sti_uniperiph_data *priv = snd_soc_dai_get_drvdata(dai);
 	struct uniperif *player = priv->dai_data.uni;
-	unsigned long flags;
 	int ret;
 
-	spin_lock_irqsave(&player->irq_lock, flags);
-	player->substream = substream;
-	spin_unlock_irqrestore(&player->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &player->irq_lock)
+		player->substream = substream;
 
 	player->clk_adj = 0;
 
@@ -734,11 +726,10 @@ static int uni_player_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 	if (clk_id != 0)
 		return -EINVAL;
 
-	mutex_lock(&player->ctrl_lock);
+	guard(mutex)(&player->ctrl_lock);
 	ret = uni_player_clk_set_rate(player, freq);
 	if (!ret)
 		player->mclk = freq;
-	mutex_unlock(&player->ctrl_lock);
 
 	return ret;
 }
@@ -996,15 +987,13 @@ static void uni_player_shutdown(struct snd_pcm_substream *substream,
 {
 	struct sti_uniperiph_data *priv = snd_soc_dai_get_drvdata(dai);
 	struct uniperif *player = priv->dai_data.uni;
-	unsigned long flags;
 
-	spin_lock_irqsave(&player->irq_lock, flags);
+	guard(spinlock_irqsave)(&player->irq_lock);
 	if (player->state != UNIPERIF_STATE_STOPPED)
 		/* Stop the player */
 		uni_player_stop(player);
 
 	player->substream = NULL;
-	spin_unlock_irqrestore(&player->irq_lock, flags);
 }
 
 static int uni_player_parse_dt_audio_glue(struct platform_device *pdev,
-- 
2.43.0

