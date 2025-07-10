Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519B72D781F
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142421; cv=none; b=Q0MRb64/CUN2XWVbz1QFh1pQt5Um0PhiozVK4Jf06l+fH/BHlK/xZb/x6xTcY2JEOSqqUWYRRFsD8ASAkpUkxrsgSODMCzDS8R4p/sOYkLbxA2yJg8zrNstRNgGtBpst3qnpz24+3oPr/ghw37iynESd5Z7mHcUrYkOj04yM+ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142421; c=relaxed/simple;
	bh=FR79kg2OyBRyks6WyAiQ6ZBE/CdkWMNc7yEsk+AjZLk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qzd6ZI4wfMb/uAVbS1CmsNAsDugcIhRjIHADISPy+Fg6X3myB8aUHvFEEy0IzPVGycpm/atZ8pc015gwf/pdUd2zs4dRiMzer5qDmAP+YLXzJ0mOkgTR1TQTRcu+SItuMyxAmcsPmjkWwcP9bMNs7WmR67abGUA5ARkdyua01Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y6VjWgvw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HDERx8t4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y6VjWgvw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HDERx8t4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y6VjWgvw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HDERx8t4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y6VjWgvw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HDERx8t4"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 35710211C9;
	Thu, 10 Jul 2025 10:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GLmAMSQZim01dk7PPUogepksP/GjoEWp/TMvt79YvVA=;
	b=y6VjWgvwUrCVAcipH2bo12ufq2AnlZH+0MYyl4sku8vCLhvSwkaDdjpdtrWiaLHo0XX5EJ
	iJc0LOKH2DvJ/Kphu1q4YOYHVia2Pn/GZ0dwv2p36KLneaLy6OaTtq7PKUNcGkPyJ6Zo5O
	JXhRa4ORElsfD7GrCFUr2ZGJ31BOdOQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GLmAMSQZim01dk7PPUogepksP/GjoEWp/TMvt79YvVA=;
	b=HDERx8t4kcdx0JQvwnUVbi6cOL7sGXjANvnXpKvz1XndlQpYrasolV3CxOD+7RE+MX/4Ja
	FZkXhUCJEZycZvCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GLmAMSQZim01dk7PPUogepksP/GjoEWp/TMvt79YvVA=;
	b=y6VjWgvwUrCVAcipH2bo12ufq2AnlZH+0MYyl4sku8vCLhvSwkaDdjpdtrWiaLHo0XX5EJ
	iJc0LOKH2DvJ/Kphu1q4YOYHVia2Pn/GZ0dwv2p36KLneaLy6OaTtq7PKUNcGkPyJ6Zo5O
	JXhRa4ORElsfD7GrCFUr2ZGJ31BOdOQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GLmAMSQZim01dk7PPUogepksP/GjoEWp/TMvt79YvVA=;
	b=HDERx8t4kcdx0JQvwnUVbi6cOL7sGXjANvnXpKvz1XndlQpYrasolV3CxOD+7RE+MX/4Ja
	FZkXhUCJEZycZvCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1BC7613A70;
	Thu, 10 Jul 2025 10:07:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qM+gBfaQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 099/103] ALSA: usb-audio: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:07:21 +0200
Message-ID: <20250710100727.22653-100-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
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
 sound/usb/card.c   | 2 +-
 sound/usb/midi.c   | 2 +-
 sound/usb/mixer.c  | 2 +-
 sound/usb/stream.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 9fb8726a6c93..630ce40ed2c9 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -756,7 +756,7 @@ static int snd_usb_audio_create(struct usb_interface *intf,
 
 	card->private_free = snd_usb_audio_free;
 
-	strcpy(card->driver, "USB-Audio");
+	strscpy(card->driver, "USB-Audio");
 	sprintf(component, "USB%04x:%04x",
 		USB_ID_VENDOR(chip->usb_id), USB_ID_PRODUCT(chip->usb_id));
 	snd_component_add(card, component);
diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index 866e613fee4f..acb3bf92857c 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -2407,7 +2407,7 @@ static int snd_usbmidi_create_rawmidi(struct snd_usb_midi *umidi,
 			      out_ports, in_ports, &rmidi);
 	if (err < 0)
 		return err;
-	strcpy(rmidi->name, umidi->card->shortname);
+	strscpy(rmidi->name, umidi->card->shortname);
 	rmidi->info_flags = SNDRV_RAWMIDI_INFO_OUTPUT |
 			    SNDRV_RAWMIDI_INFO_INPUT |
 			    SNDRV_RAWMIDI_INFO_DUPLEX;
diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 11be79af26db..a7cd7d51e66b 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -3569,7 +3569,7 @@ int snd_usb_create_mixer(struct snd_usb_audio *chip, int ctrlif)
 	struct usb_mixer_interface *mixer;
 	int err;
 
-	strcpy(chip->card->mixername, "USB Mixer");
+	strscpy(chip->card->mixername, "USB Mixer");
 
 	mixer = kzalloc(sizeof(*mixer), GFP_KERNEL);
 	if (!mixer)
diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index aa91d63749f2..749498fbf9cb 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -538,7 +538,7 @@ static int __snd_usb_add_audio_stream(struct snd_usb_audio *chip,
 	if (chip->pcm_devs > 0)
 		sprintf(pcm->name, "USB Audio #%d", chip->pcm_devs);
 	else
-		strcpy(pcm->name, "USB Audio");
+		strscpy(pcm->name, "USB Audio");
 
 	snd_usb_init_substream(as, stream, fp, pd);
 
-- 
2.50.0

