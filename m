Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB28C2D5433
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142068; cv=none; b=RKjdQF93M0At3LecfwxXFVVUK8pAuFoWu8vA58WDN6vfVz4iAmOUEk0sBtR+5qe7uIvSaneTWpYb3ZLTVvRmsD+0TNBTaYuU7u1T439mEdefF7HbfRhTP1/31dCnvdQ7YAayCbbTeB2j3FxIRzkD3NuwaRM8kUXK72eUWtf4oUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142068; c=relaxed/simple;
	bh=eXtfaKqUEJPCAFzUA8NAktmVU2vrBXHF0NhqXLYEL0U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ImOtOtwB4lShMkXs64OmpPAHWyLrbHKwFh0tsfuvFqTZJwnFLZfIHOvagkSL++OmpkP1YcqYZ5Kb8XFKIlIFrTiX09f292TraFr1j+JIl8qu0xxzWk/YdDsCTh2erokRAmqBCfYOWbwVx77SdENVehCkZl6qRQlLYcRHiKsRtQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lPy2jhNN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6gc4YZ1H; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lPy2jhNN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6gc4YZ1H; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lPy2jhNN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6gc4YZ1H";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lPy2jhNN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6gc4YZ1H"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6FD161F443;
	Thu, 10 Jul 2025 10:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G6nDM8a4aQmzPEcMYJ8W6B/SJyJMwpVs0bDF1IRoxpY=;
	b=lPy2jhNNBjWs/8QwPzaD1blwiqOU+mtAHybvCZZ41HPyXWqYBlfW2OYPGFHeE4+KIZUr1z
	FT0UFrdIwkeibQerS/GO4zNTn+H1FiDFRAjKU+0By9S6QszEJ8NTMOcaySKFiqHq6qZ/HU
	0HKwChZmX97yvhsUBx5j3ZNuAwy0xBY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142057;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G6nDM8a4aQmzPEcMYJ8W6B/SJyJMwpVs0bDF1IRoxpY=;
	b=6gc4YZ1HBUbbDc4XIsOx9AlZ3WgD9KrSF97Ez+fJ0CjQch+LVkGZKjVLytFZd0ghf/wW7J
	BCLc8H8g7zccwRBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lPy2jhNN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6gc4YZ1H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G6nDM8a4aQmzPEcMYJ8W6B/SJyJMwpVs0bDF1IRoxpY=;
	b=lPy2jhNNBjWs/8QwPzaD1blwiqOU+mtAHybvCZZ41HPyXWqYBlfW2OYPGFHeE4+KIZUr1z
	FT0UFrdIwkeibQerS/GO4zNTn+H1FiDFRAjKU+0By9S6QszEJ8NTMOcaySKFiqHq6qZ/HU
	0HKwChZmX97yvhsUBx5j3ZNuAwy0xBY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142057;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G6nDM8a4aQmzPEcMYJ8W6B/SJyJMwpVs0bDF1IRoxpY=;
	b=6gc4YZ1HBUbbDc4XIsOx9AlZ3WgD9KrSF97Ez+fJ0CjQch+LVkGZKjVLytFZd0ghf/wW7J
	BCLc8H8g7zccwRBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5456613AAB;
	Thu, 10 Jul 2025 10:07:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GPJfE+mQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:37 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 005/103] ALSA: opl3: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:05:47 +0200
Message-ID: <20250710100727.22653-6-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 6FD161F443
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/opl3/opl3_lib.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/drivers/opl3/opl3_lib.c b/sound/drivers/opl3/opl3_lib.c
index 4e57e3b2f118..cd9642a6689b 100644
--- a/sound/drivers/opl3/opl3_lib.c
+++ b/sound/drivers/opl3/opl3_lib.c
@@ -245,7 +245,7 @@ static int snd_opl3_timer1_init(struct snd_opl3 * opl3, int timer_no)
 	tid.subdevice = 0;
 	err = snd_timer_new(opl3->card, "AdLib timer #1", &tid, &timer);
 	if (err >= 0) {
-		strcpy(timer->name, "AdLib timer #1");
+		strscpy(timer->name, "AdLib timer #1");
 		timer->private_data = opl3;
 		timer->hw = snd_opl3_timer1;
 	}
@@ -266,7 +266,7 @@ static int snd_opl3_timer2_init(struct snd_opl3 * opl3, int timer_no)
 	tid.subdevice = 0;
 	err = snd_timer_new(opl3->card, "AdLib timer #2", &tid, &timer);
 	if (err >= 0) {
-		strcpy(timer->name, "AdLib timer #2");
+		strscpy(timer->name, "AdLib timer #2");
 		timer->private_data = opl3;
 		timer->hw = snd_opl3_timer2;
 	}
@@ -497,18 +497,18 @@ int snd_opl3_hwdep_new(struct snd_opl3 * opl3,
 	if (device == 0)
 		hw->oss_type = SNDRV_OSS_DEVICE_TYPE_DMFM;
 #endif
-	strcpy(hw->name, hw->id);
+	strscpy(hw->name, hw->id);
 	switch (opl3->hardware & OPL3_HW_MASK) {
 	case OPL3_HW_OPL2:
-		strcpy(hw->name, "OPL2 FM");
+		strscpy(hw->name, "OPL2 FM");
 		hw->iface = SNDRV_HWDEP_IFACE_OPL2;
 		break;
 	case OPL3_HW_OPL3:
-		strcpy(hw->name, "OPL3 FM");
+		strscpy(hw->name, "OPL3 FM");
 		hw->iface = SNDRV_HWDEP_IFACE_OPL3;
 		break;
 	case OPL3_HW_OPL4:
-		strcpy(hw->name, "OPL4 FM");
+		strscpy(hw->name, "OPL4 FM");
 		hw->iface = SNDRV_HWDEP_IFACE_OPL4;
 		break;
 	}
@@ -524,7 +524,7 @@ int snd_opl3_hwdep_new(struct snd_opl3 * opl3,
 #if IS_ENABLED(CONFIG_SND_SEQUENCER)
 	if (snd_seq_device_new(card, seq_device, SNDRV_SEQ_DEV_ID_OPL3,
 			       sizeof(struct snd_opl3 *), &opl3->seq_dev) >= 0) {
-		strcpy(opl3->seq_dev->name, hw->name);
+		strscpy(opl3->seq_dev->name, hw->name);
 		*(struct snd_opl3 **)SNDRV_SEQ_DEVICE_ARGPTR(opl3->seq_dev) = opl3;
 	}
 #endif
-- 
2.50.0

