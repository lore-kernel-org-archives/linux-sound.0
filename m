Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C592D640B
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142309; cv=none; b=BdAzIXJyE0cMcC+ALYefCcL+1HBQQCvrJvNrBeJiQqMZ6T9OD38djxH30QvxwSdmBhj4clM+eO6/ogvLdiDAf31Ozny+BzhQ5Rg8+CMQsSGjmGyf8d1lcBwu9W89MWunyI0PW5M9Eeqt6RtAERwsMoAFh2jP+F/wv5BW5NmdNHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142309; c=relaxed/simple;
	bh=tFHa/Pr1V9P93LoOFPlMWkn93hwL2ej0Y2t1DYSU+nU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=frGiR4B5tulhwFmxFpfZAMfBzDoNmSfmt16tpC2vZR5Eo76Cas/bo924/9JG6Zq/27kRFjQgXPJPt7KCp9std1A9ryfgx38vbv8dTc2UKk+ED9PhuBaOkPfI9jabihYKxluDKSta5X3xim906vaGbRu1UkA80WsRKy31JngUGn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rpxuQM73; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=alrf5C0I; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rpxuQM73; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=alrf5C0I; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rpxuQM73";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="alrf5C0I";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rpxuQM73";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="alrf5C0I"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AAF391F78A;
	Thu, 10 Jul 2025 10:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eJzj01eDdeWi7nxttg/hGqx/mjdMEiGzhKjcXWN3ywU=;
	b=rpxuQM73ixYRmtsBqQrUVaAzO8wEK2HOMnOv9Y8t0SffZxZCJ6+553QmxUKW1aX7VexwJh
	9cp57yiGkw6on0fdjPrhracl6xlXiTpQrMA3VjlX4jpQQFs1dvSUwymWltwiTifQFlNlRx
	dtIDrbF8Yao4Ks0OFMQD8YDynvmg7WU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eJzj01eDdeWi7nxttg/hGqx/mjdMEiGzhKjcXWN3ywU=;
	b=alrf5C0ITdTEHXquCECz1wx1ht987/LjI9UY8GrzZqrHZ9tVNGwey2DOIU8BNLxzGWIJ7Y
	1JoSwOXJJussGMDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rpxuQM73;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=alrf5C0I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eJzj01eDdeWi7nxttg/hGqx/mjdMEiGzhKjcXWN3ywU=;
	b=rpxuQM73ixYRmtsBqQrUVaAzO8wEK2HOMnOv9Y8t0SffZxZCJ6+553QmxUKW1aX7VexwJh
	9cp57yiGkw6on0fdjPrhracl6xlXiTpQrMA3VjlX4jpQQFs1dvSUwymWltwiTifQFlNlRx
	dtIDrbF8Yao4Ks0OFMQD8YDynvmg7WU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eJzj01eDdeWi7nxttg/hGqx/mjdMEiGzhKjcXWN3ywU=;
	b=alrf5C0ITdTEHXquCECz1wx1ht987/LjI9UY8GrzZqrHZ9tVNGwey2DOIU8BNLxzGWIJ7Y
	1JoSwOXJJussGMDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9195113A70;
	Thu, 10 Jul 2025 10:07:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KIdHIvWQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 095/103] ALSA: 6fire: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:07:17 +0200
Message-ID: <20250710100727.22653-96-tiwai@suse.de>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: AAF391F78A
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/6fire/chip.c | 4 ++--
 sound/usb/6fire/midi.c | 2 +-
 sound/usb/6fire/pcm.c  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/usb/6fire/chip.c b/sound/usb/6fire/chip.c
index d562a30b087f..9eb4bf9b138b 100644
--- a/sound/usb/6fire/chip.c
+++ b/sound/usb/6fire/chip.c
@@ -125,8 +125,8 @@ static int usb6fire_chip_probe(struct usb_interface *intf,
 		dev_err(&intf->dev, "cannot create alsa card.\n");
 		return ret;
 	}
-	strcpy(card->driver, "6FireUSB");
-	strcpy(card->shortname, "TerraTec DMX6FireUSB");
+	strscpy(card->driver, "6FireUSB");
+	strscpy(card->shortname, "TerraTec DMX6FireUSB");
 	sprintf(card->longname, "%s at %d:%d", card->shortname,
 			device->bus->busnum, device->devnum);
 
diff --git a/sound/usb/6fire/midi.c b/sound/usb/6fire/midi.c
index de2691d58de6..923f7767e62f 100644
--- a/sound/usb/6fire/midi.c
+++ b/sound/usb/6fire/midi.c
@@ -183,7 +183,7 @@ int usb6fire_midi_init(struct sfire_chip *chip)
 		return ret;
 	}
 	rt->instance->private_data = rt;
-	strcpy(rt->instance->name, "DMX6FireUSB MIDI");
+	strscpy(rt->instance->name, "DMX6FireUSB MIDI");
 	rt->instance->info_flags = SNDRV_RAWMIDI_INFO_OUTPUT |
 			SNDRV_RAWMIDI_INFO_INPUT |
 			SNDRV_RAWMIDI_INFO_DUPLEX;
diff --git a/sound/usb/6fire/pcm.c b/sound/usb/6fire/pcm.c
index 32c39d8bd2e5..d53cad97889a 100644
--- a/sound/usb/6fire/pcm.c
+++ b/sound/usb/6fire/pcm.c
@@ -640,7 +640,7 @@ int usb6fire_pcm_init(struct sfire_chip *chip)
 	}
 
 	pcm->private_data = rt;
-	strcpy(pcm->name, "DMX 6Fire USB");
+	strscpy(pcm->name, "DMX 6Fire USB");
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &pcm_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &pcm_ops);
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
-- 
2.50.0

