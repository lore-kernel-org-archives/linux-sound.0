Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50671E7A25
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037661; cv=none; b=I6jFcSGJLJthKPlcknlY+w8+Jt/dpyg1FuVrZgB6DusoqfL087z86NcgpEtfCEFHU+9YVqzlCji14tqj2GUEN2fImU81ObODJ6aTHC4yeRuuD/jbY74E5Ci/B9CcDVW4vQBY0EjeSqeRh9mpETPRnkNA4aNBBxYHtrbS06A86F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037661; c=relaxed/simple;
	bh=/kCPnegesBzagf+pcA8xS35t/fiF9t0JycRUddxqZR4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oig0OE2umY4kYnDMeUv5oxkPC2RHd95WDMky+9/V/Teq2W4GXrLQ0Lu+oUP7BONLqpPzCL623of8fSKNT1TAK2pifdZHrfoDBSq/OBENW5HQxgCBe43pPWH3AgKF8TF9xPzpy/86w8qG/6aF3JIjsvx/I685CrM1dNIXoeUOvIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0Js/gyl9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1W3GxkV/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0Js/gyl9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1W3GxkV/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0Js/gyl9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1W3GxkV/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0Js/gyl9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1W3GxkV/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 141991FB59;
	Wed,  7 Aug 2024 13:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RCZlARSMwttr1laZmuh2e3lh1qhyrNd+dlxfxFmjqwg=;
	b=0Js/gyl987YfvHmtvK4s7ocbx3hK/qO7plFvQH2X95OUY2nEw+RAV+j5iIVZe1sATq3GwH
	0fL0kSr9f+krv002rEGYPwein0N8xrA8PJqhYU0VvE1GPt+Aqx7DYwsB7ab/X8bUUnFTYm
	PnbASl+VMCZdJKuE/+wF+buJNGPynGY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RCZlARSMwttr1laZmuh2e3lh1qhyrNd+dlxfxFmjqwg=;
	b=1W3GxkV/AReuCYkuIY2R1dkW7XOjYWIZ5CTgBBmi1V7vhO2d9UYUJDYyHernKr9fHOULu8
	TXxfApi8+HYRNrCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RCZlARSMwttr1laZmuh2e3lh1qhyrNd+dlxfxFmjqwg=;
	b=0Js/gyl987YfvHmtvK4s7ocbx3hK/qO7plFvQH2X95OUY2nEw+RAV+j5iIVZe1sATq3GwH
	0fL0kSr9f+krv002rEGYPwein0N8xrA8PJqhYU0VvE1GPt+Aqx7DYwsB7ab/X8bUUnFTYm
	PnbASl+VMCZdJKuE/+wF+buJNGPynGY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RCZlARSMwttr1laZmuh2e3lh1qhyrNd+dlxfxFmjqwg=;
	b=1W3GxkV/AReuCYkuIY2R1dkW7XOjYWIZ5CTgBBmi1V7vhO2d9UYUJDYyHernKr9fHOULu8
	TXxfApi8+HYRNrCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EFBAE13B05;
	Wed,  7 Aug 2024 13:34:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QOFUOdl3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 10/54] ALSA: vx_core: Drop unused dev field
Date: Wed,  7 Aug 2024 15:34:00 +0200
Message-ID: <20240807133452.9424-11-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807133452.9424-1-tiwai@suse.de>
References: <20240807133452.9424-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [0.20 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.994];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: 0.20

The vx_core.dev field has never been set but referred incorrectly at
firmware loading.  Pass the proper device pointer from card->dev at
request_firmware(), and drop the unused dev field from vx_core, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/vx_core.h     | 1 -
 sound/drivers/vx/vx_hwdep.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/sound/vx_core.h b/include/sound/vx_core.h
index 1ddd3036bdfc..ca87fa6a8135 100644
--- a/include/sound/vx_core.h
+++ b/include/sound/vx_core.h
@@ -155,7 +155,6 @@ struct vx_core {
 	unsigned int chip_status;
 	unsigned int pcm_running;
 
-	struct device *dev;
 	struct snd_hwdep *hwdep;
 
 	struct vx_rmh irq_rmh;	/* RMH used in interrupts */
diff --git a/sound/drivers/vx/vx_hwdep.c b/sound/drivers/vx/vx_hwdep.c
index efbb644edba1..74f7ab330c7f 100644
--- a/sound/drivers/vx/vx_hwdep.c
+++ b/sound/drivers/vx/vx_hwdep.c
@@ -58,7 +58,7 @@ int snd_vx_setup_firmware(struct vx_core *chip)
 		if (! fw_files[chip->type][i])
 			continue;
 		sprintf(path, "vx/%s", fw_files[chip->type][i]);
-		if (request_firmware(&fw, path, chip->dev)) {
+		if (request_firmware(&fw, path, chip->card->dev)) {
 			snd_printk(KERN_ERR "vx: can't load firmware %s\n", path);
 			return -ENOENT;
 		}
-- 
2.43.0

