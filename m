Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB182D5436
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142083; cv=none; b=pvFKWGwX+Z7kr6qgocN5CfqVSRGhD1vkSPdBHWIEnT4wTh9uUoxwUmhH2TjWjb4Tb4mwL5wmUYrhr74rk+eOl3I+AcBw2/lxkAE9Ka2fl7VsxCO45brGNgqrgWpVHhgEkGo8tV9r756+fQd2b2EKn2lf1Qu/a5LHdxNocv6w8cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142083; c=relaxed/simple;
	bh=xm0oizxwneDNXlb39xDKQvhu9qAO+I+mR+jZbg7+rbA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPenZT3Iz4HcuzcSt0xfzDrVoRWZMJlstuPy8DiwNtAkYtgBY+JpgEY3cvwBvuQBjax1pbvWuf7w3QmxAPYhado43dLjz7vNHZquIPgCE3Q/jLQm7xaZYHi/51JtVSDRQQ8ZcN8ixUV6LNKL+lp9t8Kl+kfm9Fuo/FUj4p3uvYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VVT17YQ4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qTj4KN9Q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VVT17YQ4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qTj4KN9Q; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VVT17YQ4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qTj4KN9Q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VVT17YQ4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qTj4KN9Q"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AA55C1F451;
	Thu, 10 Jul 2025 10:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AKPComVCgVWkr5RATgXGRyN+HXLNLbxBmT9AQFHYa88=;
	b=VVT17YQ4SIThkM0EF34nP4WjUu1NR/Fi3WEyXJiuv7LvQecigBJvqBVxwsgiZyptdO+cx+
	VoYw8GpV15PwePzkW+SewrUkWzf6o67EhW5E03Uw7VwkNyNrFQ8em6Z3xixUUGoWzknTUR
	WhvyZmz9Ez6uogxgWBd8BLb7C3AQANY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142058;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AKPComVCgVWkr5RATgXGRyN+HXLNLbxBmT9AQFHYa88=;
	b=qTj4KN9QwdrOwjckPpVqNqZuiSH6Lz9KWOD4TJ/B7Y/oos01F7bEs1YDZeUrCWB6zGW8YC
	EMQOfzZTt6j5IFAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VVT17YQ4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qTj4KN9Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AKPComVCgVWkr5RATgXGRyN+HXLNLbxBmT9AQFHYa88=;
	b=VVT17YQ4SIThkM0EF34nP4WjUu1NR/Fi3WEyXJiuv7LvQecigBJvqBVxwsgiZyptdO+cx+
	VoYw8GpV15PwePzkW+SewrUkWzf6o67EhW5E03Uw7VwkNyNrFQ8em6Z3xixUUGoWzknTUR
	WhvyZmz9Ez6uogxgWBd8BLb7C3AQANY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142058;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AKPComVCgVWkr5RATgXGRyN+HXLNLbxBmT9AQFHYa88=;
	b=qTj4KN9QwdrOwjckPpVqNqZuiSH6Lz9KWOD4TJ/B7Y/oos01F7bEs1YDZeUrCWB6zGW8YC
	EMQOfzZTt6j5IFAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7FA4A13AAB;
	Thu, 10 Jul 2025 10:07:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8NDzHeqQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 014/103] ALSA: firewire: dice: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:05:56 +0200
Message-ID: <20250710100727.22653-15-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710100727.22653-1-tiwai@suse.de>
References: <20250710100727.22653-1-tiwai@suse.de>
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
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: AA55C1F451
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/dice/dice-hwdep.c |  2 +-
 sound/firewire/dice/dice-pcm.c   |  2 +-
 sound/firewire/dice/dice.c       | 10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/firewire/dice/dice-hwdep.c b/sound/firewire/dice/dice-hwdep.c
index ffc0b97782d6..d165dd427bd3 100644
--- a/sound/firewire/dice/dice-hwdep.c
+++ b/sound/firewire/dice/dice-hwdep.c
@@ -179,7 +179,7 @@ int snd_dice_create_hwdep(struct snd_dice *dice)
 	err = snd_hwdep_new(dice->card, "DICE", 0, &hwdep);
 	if (err < 0)
 		return err;
-	strcpy(hwdep->name, "DICE");
+	strscpy(hwdep->name, "DICE");
 	hwdep->iface = SNDRV_HWDEP_IFACE_FW_DICE;
 	hwdep->ops = ops;
 	hwdep->private_data = dice;
diff --git a/sound/firewire/dice/dice-pcm.c b/sound/firewire/dice/dice-pcm.c
index 2cf2adb48f2a..cfc19bd0d5dd 100644
--- a/sound/firewire/dice/dice-pcm.c
+++ b/sound/firewire/dice/dice-pcm.c
@@ -442,7 +442,7 @@ int snd_dice_create_pcm(struct snd_dice *dice)
 			return err;
 		pcm->private_data = dice;
 		pcm->nonatomic = true;
-		strcpy(pcm->name, dice->card->shortname);
+		strscpy(pcm->name, dice->card->shortname);
 
 		if (capture > 0)
 			snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE,
diff --git a/sound/firewire/dice/dice.c b/sound/firewire/dice/dice.c
index d362e4251c68..9675ec14271d 100644
--- a/sound/firewire/dice/dice.c
+++ b/sound/firewire/dice/dice.c
@@ -102,9 +102,9 @@ static void dice_card_strings(struct snd_dice *dice)
 	unsigned int i;
 	int err;
 
-	strcpy(card->driver, "DICE");
+	strscpy(card->driver, "DICE");
 
-	strcpy(card->shortname, "DICE");
+	strscpy(card->shortname, "DICE");
 	BUILD_BUG_ON(NICK_NAME_SIZE < sizeof(card->shortname));
 	err = snd_dice_transaction_read_global(dice, GLOBAL_NICK_NAME,
 					       card->shortname,
@@ -117,16 +117,16 @@ static void dice_card_strings(struct snd_dice *dice)
 		card->shortname[sizeof(card->shortname) - 1] = '\0';
 	}
 
-	strcpy(vendor, "?");
+	strscpy(vendor, "?");
 	fw_csr_string(dev->config_rom + 5, CSR_VENDOR, vendor, sizeof(vendor));
-	strcpy(model, "?");
+	strscpy(model, "?");
 	fw_csr_string(dice->unit->directory, CSR_MODEL, model, sizeof(model));
 	snprintf(card->longname, sizeof(card->longname),
 		 "%s %s (serial %u) at %s, S%d",
 		 vendor, model, dev->config_rom[4] & 0x3fffff,
 		 dev_name(&dice->unit->device), 100 << dev->max_speed);
 
-	strcpy(card->mixername, "DICE");
+	strscpy(card->mixername, "DICE");
 }
 
 static void dice_card_free(struct snd_card *card)
-- 
2.50.0

