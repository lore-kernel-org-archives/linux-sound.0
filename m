Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90A314A0BD
	for <linux-sound@vger.kernel.org>; Thu, 22 Feb 2024 15:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708615917; cv=none; b=JI2aJPFFOVw6pn2qrqZVvUg1Oy0movWkG/3/ZTuszNjMLVR/JAmH8iG0dEF0oSyVpWBwKrQy681DN4XP0UQZ5aLfV974nwLr+HnQI9Oz3UUwXCrMliVxIVnpOY0GIipACSt2R56hRKzg2nfDI9E97nLwP21Qr1Ti47ex3qcsjsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708615917; c=relaxed/simple;
	bh=NZJ5qH5AupD0f+olzAiLyanGxNC8bVCOGPo9b29pwV4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=rTUmISdxk7ccyVGEpZbmqSGiIFnnxGfPE6dW2Yd9St1gPlx/kGixsPtVmiBLMnmA+yC2UM5T2CmcKQNyT2PNWl9Db6cpwufOWr3tS0uSWAN6UcAxuTt1tmLzngWCVEsJxVL8lyjT6j6F0+s1RPRAwHA4zBPCA7viWMsK3gdS1qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Si+ktjF+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ldmW+Bdi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1YyEBVNA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=n3SPwH0k; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Si+ktjF+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ldmW+Bdi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1YyEBVNA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n3SPwH0k"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D50B01F745;
	Thu, 22 Feb 2024 15:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708615914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gwonfQiq16pe3VNfpHhO3XzsPzZk8sccdBLXxhuhOmY=;
	b=Si+ktjF+Y3DmD7GjCK3hsrHQwJ7PSsAumhnM8n5yaLi24MFhjwJUGFw23s0iDPodLNefyx
	GBvtd9vaB9kfXfYz87llcDADdRUlFZkX1SdbBQyoAdI4o8wZ60kP9fX14FT5jeApBw4UWe
	cd8fOJ+DslZhEZXi57yQDISnKn4IOp0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708615914;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gwonfQiq16pe3VNfpHhO3XzsPzZk8sccdBLXxhuhOmY=;
	b=ldmW+Bdi3JLfYSlq0UNuAOUZeI9l/+G2W9cUgOa3zyA+ZhhwqQ34So/LsfHq4ApueHYY30
	D1NFFDtKaZOsVnAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708615913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gwonfQiq16pe3VNfpHhO3XzsPzZk8sccdBLXxhuhOmY=;
	b=1YyEBVNAljBWvLwegw4q3MrR9z9XhIGnC3+PgThRWnDESnatd2zKu4ADradZjBUXhgBP3C
	Jrw1fgDVzdMyCCfZwTycQ5rhQo0jgWT586WlMCSdphhPx5Tv1thVyiN4bM0dezm+v0t/Oi
	xXo+L01mhaQI7h5iqGk/PEgwG2JwDtY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708615913;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gwonfQiq16pe3VNfpHhO3XzsPzZk8sccdBLXxhuhOmY=;
	b=n3SPwH0kCZurQmrhecm5UW1VJvgXKsqo4akX9Yx5NS79ccBkuI1XSyXxfMgt71exfh5hGb
	x5Hzj0cYgT9/g3BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B8ACC13A8C;
	Thu, 22 Feb 2024 15:31:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id U9HMK+lo12UBWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 Feb 2024 15:31:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda: beep: Drop stale mutex
Date: Thu, 22 Feb 2024 16:31:48 +0100
Message-Id: <20240222153148.19691-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: ***
X-Spamd-Bar: +++
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1YyEBVNA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=n3SPwH0k
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [3.49 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[41.02%]
X-Spam-Score: 3.49
X-Rspamd-Queue-Id: D50B01F745
X-Spam-Flag: NO

The beep->mutex is no longer used since the drop of beep_mode=2.
Let's get rid of it.

Fixes: 0920c9b4c4d8 ("ALSA: hda - Remove beep_mode=2")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_beep.c | 1 -
 sound/pci/hda/hda_beep.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/sound/pci/hda/hda_beep.c b/sound/pci/hda/hda_beep.c
index e63621bcb214..e51d47572557 100644
--- a/sound/pci/hda/hda_beep.c
+++ b/sound/pci/hda/hda_beep.c
@@ -231,7 +231,6 @@ int snd_hda_attach_beep_device(struct hda_codec *codec, int nid)
 	codec->beep = beep;
 
 	INIT_WORK(&beep->beep_work, &snd_hda_generate_beep);
-	mutex_init(&beep->mutex);
 
 	input_dev = input_allocate_device();
 	if (!input_dev) {
diff --git a/sound/pci/hda/hda_beep.h b/sound/pci/hda/hda_beep.h
index db76e3ddba65..923ea862446a 100644
--- a/sound/pci/hda/hda_beep.h
+++ b/sound/pci/hda/hda_beep.h
@@ -27,7 +27,6 @@ struct hda_beep {
 	unsigned int playing:1;
 	unsigned int keep_power_at_enable:1;	/* set by driver */
 	struct work_struct beep_work; /* scheduled task for beep event */
-	struct mutex mutex;
 	void (*power_hook)(struct hda_beep *beep, bool on);
 };
 
-- 
2.35.3

