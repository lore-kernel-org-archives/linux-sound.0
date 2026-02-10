Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD38C1E4BE
	for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 18:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770749842; cv=none; b=E4xZmKRhSPTF/M9oEjQCIEmY5d0VMRr0luu2iU3hl3XBuyZKNR6AQl4yihkYJR0NjoYU7EyjgGWAkG31PsNmFbmzhJSJ222QNhTN8w5JHMI0NhT0m6q1IcQGPhQjz84dORjjV2UXpQV70G/fRuCporZdTOUcdzYYDBu1U8nl2i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770749842; c=relaxed/simple;
	bh=gJgVXacEBUNhn77KJjM4KhMpZj1cfOPpjzzwqQ8eruA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u1n+sTKIjUHfrEEuepkajt0bEVcM6YeEhNf8OGSmEPfo2e9UxlOU/lIBdNmxT1rV8aiqg+Cb8+ijzuG6SbIUEh3mxV+AgFab0RqIXUiKH7vO6JT9fC3XO5nwi88CxUv8bOFIG67REKd+Z0eNGz9JSL56VocLzZGZufrl5gxkBwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; spf=pass smtp.mailfrom=u.northwestern.edu; dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b=Yb/gFLWH; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b="Yb/gFLWH"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50143fe869fso60673661cf.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 10:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1770749840; x=1771354640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EsOvx8MYis3OxBhDDm84POW3mkp8XwXXG9CZxnTszuM=;
        b=Yb/gFLWHR5TNrjU5iEPFFphNI7O9zCwlR4wthO1vUStecIliouvq03XfdYX732WyYY
         1GuWYBgg3Kap+fXIkczRN6zVujJFqnI1QMbct/q0NJCpAA+XONnU/6iNWHI3XoVA6Pc/
         v8K7XqMvvBh3x8L3bkXN4lhIw4jd88/AbRGcK4a1CeTJDb6XH5wdMAjbDppMEaEnSYXE
         jEHDU28uOXIdg364gNsNB7G2Mb/6m6ziKfMomWLfDS/WY4Tr0KtwhpNBg212JoCBcE6S
         /vLe5YdHo3SIuTMOUvruLNQ+0MaK+VsrzFaq5fyqLaRjAsYBJQBKe9NQjZJRbdO6KxRI
         zVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770749840; x=1771354640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EsOvx8MYis3OxBhDDm84POW3mkp8XwXXG9CZxnTszuM=;
        b=jt3A80tDU5L+Hs0sRDTl8/ESuza21G32HRgohXiQBh21fgByUAEN1+E7ZD9LCXd8J6
         zKu+9IT4TvR7opJ9JWagXWgHPgor7zClx3B/5e+liwXXY4CkCzlORwraB1FgW1ZMlgVK
         FuXdbkCnvpvxy7go5oZBxvIuTY3If5AKQQW16kkEoaifMeqSNIGDOfeGwvPvdNhk+aai
         IfC74FQE420bJ+UeOzn0TgvL9volob0qD8VkJICdvlRPm7FXd1zEm4WfQ4RAgyyRqYDh
         7KqXSPac8Wh4pmzWRJKp+e3QqicczexDlo2S2BThL8oMzBGWYmMQPfHvCsooYPfBa7S0
         8qWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfH2Hy65sa5OtxP1YDYGRzEmnueeCPLdKGYa0I1JKJMWazJ5b4mFP/uUPfLc2ihengV5CobgzV649ydw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe7DFHvU1N/GiDtHvxqUj0gPjkSIFIJ+/JC6EZ5PzEjZaJbegm
	BbLrIU4LoC3wAUVxZJzUiaH/zk4Lq3oawtpdq1fsgUZBHMMlP71zLcR1XkLi19V/D4g=
X-Gm-Gg: AZuq6aLFsflYkHAZ5wG4z9BOv2G+eBh0zxQaFBHEBeFylnbZSNn20mTiRXVKK3ZiQWV
	4Pae6PpKRilbq4akZkpu2ji22d3XVPrVM8saPm7uHz9MhPvMqSpnEMVjWJ9pJjvAt3HaaFtB0qZ
	zkXwEZP1uNrLIApjJuW95VFrHfuwwHL3+SJkYbb3s/9rIfgnptdbZPbNFfyQgWOdpcz166WBEnI
	SEKQfaDjcHjb0jnGkqifzbvjoFPmGVRxNzqz6P8BqU6r8Fr+Jb+pgu0quDYGnp7A4qKjJxr86Hg
	Rc3QyRcZxACJ46Ey29/JTTO06xDcPUa+N2JCeH+GMMPpfu/03HbarL/s/VuhpW7MmhZNrx/acQE
	MuF1ojCs1vYk2eFy0iAhxpW7xPmddbV0/APhqspW8SwTlIospViLRyQpX3OYWpUtyeMbEk2r7Aq
	95tYbXPSbTZAKEAPLtSQdLKdYw4XJXt0JEnMjInMY9DqRDgfyZAsroQwPN/WiXvzKvN5vV3ih0h
	xg6+zoneluLj6lZeHtQeswbb+ooD5ZS4anlFr0oVYs=
X-Received: by 2002:ac8:5952:0:b0:502:a063:c439 with SMTP id d75a77b69052e-506399e4349mr205718631cf.80.1770749839732;
        Tue, 10 Feb 2026 10:57:19 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506392c1d4esm106040631cf.27.2026.02.10.10.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 10:57:19 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Mark Brown <broonie@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH v2] ASoC: fsl_xcvr: Revert fix missing lock in fsl_xcvr_mode_put()
Date: Tue, 10 Feb 2026 18:57:14 +0000
Message-Id: <20260210185714.556385-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit f51424872760 ("ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put()").

The original patch attempted to acquire the card->controls_rwsem lock in
fsl_xcvr_mode_put(). However, this function is called from the upper ALSA
core function snd_ctl_elem_write(), which already holds the write lock on
controls_rwsem for the whole put operation. So there is no need to simply
hold the lock for fsl_xcvr_activate_ctl() again.

Acquiring the read lock while holding the write lock in the same thread
results in a deadlock and a hung task, as reported by Alexander Stein.

Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Closes: https://lore.kernel.org/linux-sound/5056506.GXAFRqVoOG@steina-w/
Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
v2:
 - Refactor subject line style
 - Include human readable descriptions
 - Fix the sha1 information for sound/soc/fsl/fsl_xcvr.c

 sound/soc/fsl/fsl_xcvr.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 5de93f458b56..a268fb81a2f8 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -223,13 +223,10 @@ static int fsl_xcvr_mode_put(struct snd_kcontrol *kcontrol,
 
 	xcvr->mode = snd_soc_enum_item_to_val(e, item[0]);
 
-	down_read(&card->snd_card->controls_rwsem);
 	fsl_xcvr_activate_ctl(dai, fsl_xcvr_arc_mode_kctl.name,
 			      (xcvr->mode == FSL_XCVR_MODE_ARC));
 	fsl_xcvr_activate_ctl(dai, fsl_xcvr_earc_capds_kctl.name,
 			      (xcvr->mode == FSL_XCVR_MODE_EARC));
-	up_read(&card->snd_card->controls_rwsem);
-
 	/* Allow playback for SPDIF only */
 	rtd = snd_soc_get_pcm_runtime(card, card->dai_link);
 	rtd->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream_count =
-- 
2.34.1

