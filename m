Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E68C2D877E
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142409; cv=none; b=JIucZLPz1DyzwKzu1C7YszLORtQkR29op3hXkwjh0FeWexvJuFgXWm/8+aI7Ui8gvTMSCoLmf57t6psE3ACdVEuvMmOIDZfbwogubx0pFSM0jJC/ys8cDNCGXUB3oLj5fCBisac/zSXb91uuhu79ySHZ/H/RtD/yfAv4skXnAR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142409; c=relaxed/simple;
	bh=PPOJsrhWE/I0OtQ1/Jdd5iipKhgsUK/+KlG/0k7KIHs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iYpwWWUKLFXPcs9ZCifmD20hiK3mTOAKILkisOUxV5ir2dgOU/jJOqywaAy8IOiKauN+ntyHA6amlP7PN6uRl0f2+pOGLoTM4i45WfBuudbr87aV04WoUg5MNPf8qpncvdCoFLg7fEnb+etm1L8nG06qJ3++8UOfqoZluWbXhS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R99HPIrr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ECSJa1YM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R99HPIrr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ECSJa1YM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R99HPIrr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ECSJa1YM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R99HPIrr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ECSJa1YM"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C9027211C6;
	Thu, 10 Jul 2025 10:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qi/hkEKT/usBEcBoZ1ddXGlUceURhNs+qgyZmrNRqp0=;
	b=R99HPIrrglGDTKjoywsix1SGocn6/6Nil44zxCAxyAufxj9pGr0dnSW6mE1jXKfjjjR0Yq
	sNth6x0nm5XXeUVNuLCE0lqn8HsJ5fH8JK9z/v4k7LIyh3ZA1NGtsFKh3oDXC+KXmh0Pce
	jsoCE1e95lySlt7PVtTiQEZHahMYIiI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qi/hkEKT/usBEcBoZ1ddXGlUceURhNs+qgyZmrNRqp0=;
	b=ECSJa1YMynmCPHi8GdDtI/6mKxj+UTkf0AKl8ANBLtBt741ESgIrVnIYegqfeFFVKgODFY
	KhzvHZMBW3oxNXBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qi/hkEKT/usBEcBoZ1ddXGlUceURhNs+qgyZmrNRqp0=;
	b=R99HPIrrglGDTKjoywsix1SGocn6/6Nil44zxCAxyAufxj9pGr0dnSW6mE1jXKfjjjR0Yq
	sNth6x0nm5XXeUVNuLCE0lqn8HsJ5fH8JK9z/v4k7LIyh3ZA1NGtsFKh3oDXC+KXmh0Pce
	jsoCE1e95lySlt7PVtTiQEZHahMYIiI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qi/hkEKT/usBEcBoZ1ddXGlUceURhNs+qgyZmrNRqp0=;
	b=ECSJa1YMynmCPHi8GdDtI/6mKxj+UTkf0AKl8ANBLtBt741ESgIrVnIYegqfeFFVKgODFY
	KhzvHZMBW3oxNXBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B0FC4136DC;
	Thu, 10 Jul 2025 10:07:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MPnoKfWQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 096/103] ALSA: line6: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:07:18 +0200
Message-ID: <20250710100727.22653-97-tiwai@suse.de>
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
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/line6/driver.c   | 8 ++++----
 sound/usb/line6/midi.c     | 4 ++--
 sound/usb/line6/pcm.c      | 2 +-
 sound/usb/line6/toneport.c | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/usb/line6/driver.c b/sound/usb/line6/driver.c
index e9eb5c74d6c7..f2f9261489a2 100644
--- a/sound/usb/line6/driver.c
+++ b/sound/usb/line6/driver.c
@@ -678,7 +678,7 @@ static int line6_hwdep_init(struct usb_line6 *line6)
 	err = snd_hwdep_new(line6->card, "config", 0, &hwdep);
 	if (err < 0)
 		goto end;
-	strcpy(hwdep->name, "config");
+	strscpy(hwdep->name, "config");
 	hwdep->iface = SNDRV_HWDEP_IFACE_LINE6;
 	hwdep->ops = hwdep_ops;
 	hwdep->private_data = line6;
@@ -770,9 +770,9 @@ int line6_probe(struct usb_interface *interface,
 	line6->ifcdev = &interface->dev;
 	INIT_DELAYED_WORK(&line6->startup_work, line6_startup_work);
 
-	strcpy(card->id, properties->id);
-	strcpy(card->driver, driver_name);
-	strcpy(card->shortname, properties->name);
+	strscpy(card->id, properties->id);
+	strscpy(card->driver, driver_name);
+	strscpy(card->shortname, properties->name);
 	sprintf(card->longname, "Line 6 %s at USB %s", properties->name,
 		dev_name(line6->ifcdev));
 	card->private_free = line6_destruct;
diff --git a/sound/usb/line6/midi.c b/sound/usb/line6/midi.c
index 9b5176086280..1d77794b4490 100644
--- a/sound/usb/line6/midi.c
+++ b/sound/usb/line6/midi.c
@@ -228,8 +228,8 @@ static int snd_line6_new_midi(struct usb_line6 *line6,
 		return err;
 
 	rmidi = *rmidi_ret;
-	strcpy(rmidi->id, line6->properties->id);
-	strcpy(rmidi->name, line6->properties->name);
+	strscpy(rmidi->id, line6->properties->id);
+	strscpy(rmidi->name, line6->properties->name);
 
 	rmidi->info_flags =
 	    SNDRV_RAWMIDI_INFO_OUTPUT |
diff --git a/sound/usb/line6/pcm.c b/sound/usb/line6/pcm.c
index d4dbbc432505..c1e2a8ab66fa 100644
--- a/sound/usb/line6/pcm.c
+++ b/sound/usb/line6/pcm.c
@@ -486,7 +486,7 @@ static int snd_line6_new_pcm(struct usb_line6 *line6, struct snd_pcm **pcm_ret)
 	if (err < 0)
 		return err;
 	pcm = *pcm_ret;
-	strcpy(pcm->name, line6->properties->name);
+	strscpy(pcm->name, line6->properties->name);
 
 	/* set operators */
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK,
diff --git a/sound/usb/line6/toneport.c b/sound/usb/line6/toneport.c
index c073b38cd673..68cda7bf330c 100644
--- a/sound/usb/line6/toneport.c
+++ b/sound/usb/line6/toneport.c
@@ -199,7 +199,7 @@ static int snd_toneport_source_info(struct snd_kcontrol *kcontrol,
 	if (uinfo->value.enumerated.item >= size)
 		uinfo->value.enumerated.item = size - 1;
 
-	strcpy(uinfo->value.enumerated.name,
+	strscpy(uinfo->value.enumerated.name,
 	       toneport_source_info[uinfo->value.enumerated.item].name);
 
 	return 0;
-- 
2.50.0

