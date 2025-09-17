Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1542D7DEF
	for <linux-sound@vger.kernel.org>; Wed, 17 Sep 2025 11:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758107576; cv=none; b=QvgFE1sB1rHfc8BnXEa22Zuhoa3cQJLy1AmYYv4iKTALmwm53LlNqQReWgTtgtyQ0amU9FuLjxIJGJCtR1uAc4RrInaqjnq7UOB/hTrmuO72tLrIjb3KKD16K4Bl6cHwpMQay7P9bsakIpPvkNPNiTgglXZJomM0Uqk+DoPSt9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758107576; c=relaxed/simple;
	bh=t/AXIHjLDX2kuVv4iRZrrgPSIjByWQ11zhDmIZ5HLh8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=kNU7wLBuusgmvl2ixGVo2ijgouD/NTFM4+c7NXXMf0+OOGpW//jw6ZfIZbgrlQpwg8RxuhvRCGWV+9HdgBhkDkvwu+H36UGpmxybwRzEPRK0uWmp1ExrULLsSAw919jF7nuyAJfX/ki7iGV1SfO8C9Q4m8GflJuRO0JvHnFlY5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QQaXjCQA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qOnL2687; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JlmPE4Z/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hP2zPzb0; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QQaXjCQA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qOnL2687";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JlmPE4Z/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hP2zPzb0"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DFD5B21D64;
	Wed, 17 Sep 2025 11:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758107573; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WGhrZrwVKBeEh6Lkkx1RI0FnsxmSQEgS+dUYoW4t+rU=;
	b=QQaXjCQA1oFYxoqju6/+1o6NU0PsccIc1VUN/SUMnItKsnOSLQBAhKY8P9Q3bHir7hZLDp
	JLf2izbm7g7Cyv6vO7HfKdnxfLIwnktXrG1lkWMUEATpCTe2gGxxXklii/Yi/gyH3BhG7k
	NWz5NTzUJUMxVsCkXeydFydUvH5KYaA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758107573;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WGhrZrwVKBeEh6Lkkx1RI0FnsxmSQEgS+dUYoW4t+rU=;
	b=qOnL2687CCd+RFaWzURdb+xCuXFlk0Hww1icPIu930cJ9v9R8waR3ewvxvFc0eJ/2HdWbC
	z4kcrlOtr2tsYuAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="JlmPE4Z/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hP2zPzb0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758107572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WGhrZrwVKBeEh6Lkkx1RI0FnsxmSQEgS+dUYoW4t+rU=;
	b=JlmPE4Z/4l5rvFuwpvFIeJ+uIGLdPsXuCtIQ9/2pSEn/+SZ8ESWCRFYE30PzbxmnlAYFFm
	exPof3WBkoBsvdmnUoBCW1nFB1TdCgK4r+ew5DCz6O6yzz1eESaJjDjQ9SBhLbTD4bTlgF
	e/dXBsYifUfuNB+Z7ESzADXYnulVEYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758107572;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WGhrZrwVKBeEh6Lkkx1RI0FnsxmSQEgS+dUYoW4t+rU=;
	b=hP2zPzb06cVgU697ozq3zttddwMDTpH9liz8Pw9I/DrdyWxniAqmNZh7gyjJROVd1jXtR7
	cq3u1VDj98dPbQBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BA8B11368D;
	Wed, 17 Sep 2025 11:12:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id S3krLLSXymhIRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 17 Sep 2025 11:12:52 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: spi/at73c213: Use guard() for spin locks
Date: Wed, 17 Sep 2025 13:12:49 +0200
Message-ID: <20250917111251.29830-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: DFD5B21D64
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/spi/at73c213.c | 46 ++++++++++++++++++++------------------------
 1 file changed, 21 insertions(+), 25 deletions(-)

diff --git a/sound/spi/at73c213.c b/sound/spi/at73c213.c
index 0ece7ccbd55f..0c2394733dc4 100644
--- a/sound/spi/at73c213.c
+++ b/sound/spi/at73c213.c
@@ -273,9 +273,8 @@ static int snd_at73c213_pcm_trigger(struct snd_pcm_substream *substream,
 				   int cmd)
 {
 	struct snd_at73c213 *chip = snd_pcm_substream_chip(substream);
-	int retval = 0;
 
-	spin_lock(&chip->lock);
+	guard(spinlock)(&chip->lock);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -288,13 +287,11 @@ static int snd_at73c213_pcm_trigger(struct snd_pcm_substream *substream,
 		break;
 	default:
 		dev_dbg(&chip->spi->dev, "spurious command %x\n", cmd);
-		retval = -EINVAL;
+		return -EINVAL;
 		break;
 	}
 
-	spin_unlock(&chip->lock);
-
-	return retval;
+	return 0;
 }
 
 static snd_pcm_uframes_t
@@ -358,31 +355,30 @@ static irqreturn_t snd_at73c213_interrupt(int irq, void *dev_id)
 	int next_period;
 	int retval = IRQ_NONE;
 
-	spin_lock(&chip->lock);
+	scoped_guard(spinlock, &chip->lock) {
+		block_size = frames_to_bytes(runtime, runtime->period_size);
+		status = ssc_readl(chip->ssc->regs, IMR);
 
-	block_size = frames_to_bytes(runtime, runtime->period_size);
-	status = ssc_readl(chip->ssc->regs, IMR);
+		if (status & SSC_BIT(IMR_ENDTX)) {
+			chip->period++;
+			if (chip->period == runtime->periods)
+				chip->period = 0;
+			next_period = chip->period + 1;
+			if (next_period == runtime->periods)
+				next_period = 0;
 
-	if (status & SSC_BIT(IMR_ENDTX)) {
-		chip->period++;
-		if (chip->period == runtime->periods)
-			chip->period = 0;
-		next_period = chip->period + 1;
-		if (next_period == runtime->periods)
-			next_period = 0;
+			offset = block_size * next_period;
 
-		offset = block_size * next_period;
+			ssc_writel(chip->ssc->regs, PDC_TNPR,
+				   (long)runtime->dma_addr + offset);
+			ssc_writel(chip->ssc->regs, PDC_TNCR,
+				   runtime->period_size * runtime->channels);
+			retval = IRQ_HANDLED;
+		}
 
-		ssc_writel(chip->ssc->regs, PDC_TNPR,
-				(long)runtime->dma_addr + offset);
-		ssc_writel(chip->ssc->regs, PDC_TNCR,
-				runtime->period_size * runtime->channels);
-		retval = IRQ_HANDLED;
+		ssc_readl(chip->ssc->regs, IMR);
 	}
 
-	ssc_readl(chip->ssc->regs, IMR);
-	spin_unlock(&chip->lock);
-
 	if (status & SSC_BIT(IMR_ENDTX))
 		snd_pcm_period_elapsed(chip->substream);
 
-- 
2.50.1

