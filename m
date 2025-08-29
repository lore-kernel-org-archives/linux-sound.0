Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A1D322774
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480460; cv=none; b=PVd5GdcsN+MyMJO8+9YwYPfoq+cacpAT6ayVCUrjg8QVJDCw2pQ1vXDBHB92A4zuEaHNL/vmESle6r8M+QpC7FjGzLvRrD8Lgz5UV2KZAtizoOTfnUNULFJWeVqzmtkT5d2KTTaDS9jUzACqSP9ePRreqWouno+OS1ffdoZfEcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480460; c=relaxed/simple;
	bh=eYosBvStKKjoqClYsDhWxlu2ZDlxCGpt5jU2ashMwhc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p8Ax+O0NbhTjAw4CI7A53Jyw/BFCHfowN4ES40z6KLmYKCiOXkM1Mav3VFvi7Ddo+EKl9ZM/4XUb5zNzX1tyGAl5BlbW776Bd1+hlY3K6Xn85glGDlCRqs1pG4iNmFxUsU3x5WOZ7vM2dKA1DI8rU0Xiry+ornj7xI1vm+Jl5MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=K6DLvd4g; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0xPjqc85; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=K6DLvd4g; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0xPjqc85; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K6DLvd4g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0xPjqc85";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K6DLvd4g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0xPjqc85"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9175133F0A;
	Fri, 29 Aug 2025 15:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0raErs1mNd/Y9gmFBtSasevvWUv73C2skaIJ3Np3pR8=;
	b=K6DLvd4g/bIun2D7FVPsqQbUNQ3jqADp5qX2m+hC2tM0ep+F2p1BWsdH2zMwO0W8ZxzrF5
	2hlVcof7wbsVnB5A+hbVCb2/9Fn27eiX7KXN6TWJE0WCTBJI7Res/TaPs9QrKoX3aoJI82
	uebTdiU5W8fbDzq3M4l1VyjHT3auSY4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0raErs1mNd/Y9gmFBtSasevvWUv73C2skaIJ3Np3pR8=;
	b=0xPjqc855uBU2QPpd1cZ0aTiQKVAO1nQhh8al/1qhaaNpSs8dfZEgEmQy4cLXRtDqT/VXi
	hfUYbaoy6jnpCFCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0raErs1mNd/Y9gmFBtSasevvWUv73C2skaIJ3Np3pR8=;
	b=K6DLvd4g/bIun2D7FVPsqQbUNQ3jqADp5qX2m+hC2tM0ep+F2p1BWsdH2zMwO0W8ZxzrF5
	2hlVcof7wbsVnB5A+hbVCb2/9Fn27eiX7KXN6TWJE0WCTBJI7Res/TaPs9QrKoX3aoJI82
	uebTdiU5W8fbDzq3M4l1VyjHT3auSY4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0raErs1mNd/Y9gmFBtSasevvWUv73C2skaIJ3Np3pR8=;
	b=0xPjqc855uBU2QPpd1cZ0aTiQKVAO1nQhh8al/1qhaaNpSs8dfZEgEmQy4cLXRtDqT/VXi
	hfUYbaoy6jnpCFCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 77C5B13A6A;
	Fri, 29 Aug 2025 15:13:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OAf1G6bDsWiQIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:13:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 10/19] ALSA: pdaudiocf: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 17:13:24 +0200
Message-ID: <20250829151335.7342-11-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829151335.7342-1-tiwai@suse.de>
References: <20250829151335.7342-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pcmcia/pdaudiocf/pdaudiocf_core.c |  3 +--
 sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c  | 25 ++++++++++++-------------
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/sound/pcmcia/pdaudiocf/pdaudiocf_core.c b/sound/pcmcia/pdaudiocf/pdaudiocf_core.c
index 11aacc7e3f0b..a104baac3a94 100644
--- a/sound/pcmcia/pdaudiocf/pdaudiocf_core.c
+++ b/sound/pcmcia/pdaudiocf/pdaudiocf_core.c
@@ -161,14 +161,13 @@ static void snd_pdacf_ak4117_change(struct ak4117 *ak4117, unsigned char c0, uns
 
 	if (!(c0 & AK4117_UNLCK))
 		return;
-	mutex_lock(&chip->reg_lock);
+	guard(mutex)(&chip->reg_lock);
 	val = chip->regmap[PDAUDIOCF_REG_SCR>>1];
 	if (ak4117->rcs0 & AK4117_UNLCK)
 		val |= PDAUDIOCF_BLUE_LED_OFF;
 	else
 		val &= ~PDAUDIOCF_BLUE_LED_OFF;
 	pdacf_reg_write(chip, PDAUDIOCF_REG_SCR, val);
-	mutex_unlock(&chip->reg_lock);
 }
 
 int snd_pdacf_ak4117_create(struct snd_pdacf *chip)
diff --git a/sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c b/sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c
index 20aba745f1dc..228822996ef7 100644
--- a/sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c
+++ b/sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c
@@ -64,21 +64,20 @@ static int pdacf_pcm_trigger(struct snd_pcm_substream *subs, int cmd)
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&chip->reg_lock);
-	chip->pcm_running += inc;
-	tmp = pdacf_reg_read(chip, PDAUDIOCF_REG_SCR);
-	if (chip->pcm_running) {
-		if ((chip->ak4117->rcs0 & AK4117_UNLCK) || runtime->rate != rate) {
-			chip->pcm_running -= inc;
-			ret = -EIO;
-			goto __end;
+	scoped_guard(mutex, &chip->reg_lock) {
+		chip->pcm_running += inc;
+		tmp = pdacf_reg_read(chip, PDAUDIOCF_REG_SCR);
+		if (chip->pcm_running) {
+			if ((chip->ak4117->rcs0 & AK4117_UNLCK) || runtime->rate != rate) {
+				chip->pcm_running -= inc;
+				ret = -EIO;
+				break;
+			}
 		}
+		tmp &= ~mask;
+		tmp |= val;
+		pdacf_reg_write(chip, PDAUDIOCF_REG_SCR, tmp);
 	}
-	tmp &= ~mask;
-	tmp |= val;
-	pdacf_reg_write(chip, PDAUDIOCF_REG_SCR, tmp);
-      __end:
-	mutex_unlock(&chip->reg_lock);
 	snd_ak4117_check_rate_and_errors(chip->ak4117, AK4117_CHECK_NO_RATE);
 	return ret;
 }
-- 
2.50.1

