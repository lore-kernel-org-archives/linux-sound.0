Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA722D640E
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142302; cv=none; b=jp9RpJ1SgXJ+Wvw0RRcTIf4/XUB2pqjnj8qFur+00YIjnfrWSjoxxyGztDIOv6cxD7oTvO8GE2po1dCPMFhN+Owhdx3AIJ68EuW7pZiJH0T+CqepvlEfKKXsEJqQIeaUlgT2XYvemh6TA9+zjWQG3POvVnP62kG6WoTz/ISOe4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142302; c=relaxed/simple;
	bh=W/N7HN5jGLw2ow85R7b5lwyofSO2/poG4/Zmpr9ORK8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KDX5XYgfeOH/X+y5EFkk3hSTRHEYioRUTWjfuTDqn8hV3O/27trN/yP6lGpB4Df3QjX968w+IlWzYHd/y95W8/ZoQp5Q6X+DQCLyVqkp8jthZsCTwVIdNQj7sXCeaAOcW0uEpS85dzrk6ybpyZXyAQuwtBDfScPZ3+rBArD9QYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=t51oD4H4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F0Ayic5x; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mODfnZG2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ql1V6jjZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="t51oD4H4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F0Ayic5x";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mODfnZG2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ql1V6jjZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EABB7211A7;
	Thu, 10 Jul 2025 10:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mUh+7LcBy4l/6xoVSX1dBAhVAhQYM//O/6Vl8CD+rDU=;
	b=t51oD4H4Ug7TFeUdTdzsKHmoRcmPvzxMOUQNET8rNMLfvhz1DbKWtTTghrN+GQQgDYTh9b
	YrtSrxM21a+FlEindERJFuntibi9D8yD8kQVUgXUTNIDDWt2CbVFl/8IFskkucWtxuIDJl
	Jt9oeUfwbEuaGAoDH1TOBaBp8T249TA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142065;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mUh+7LcBy4l/6xoVSX1dBAhVAhQYM//O/6Vl8CD+rDU=;
	b=F0Ayic5xNIurxJHezsV15LmRWyTSKREKMwFviJmi5c1/YR/x+NOpjP22r/NiYHSt/kNJ8k
	TGiolgKQeBYIQIDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mUh+7LcBy4l/6xoVSX1dBAhVAhQYM//O/6Vl8CD+rDU=;
	b=mODfnZG24VCP0B4nwV70ykjOszdszIQD8LlO2V274B09txB4IgmWBQHsAif1ebhOXzLayV
	jKRvBOAxgZPkLPaqNr4JEWDUQVY2rq9XFROwOCJZiD5uR/C0qDkJ+nhQ5H1RL34THVf8XV
	B2dMU/iGbGFcJFrPWoDAo7uJ4+oArfA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142064;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mUh+7LcBy4l/6xoVSX1dBAhVAhQYM//O/6Vl8CD+rDU=;
	b=ql1V6jjZ7bJyhP6KRFA3eB76swUQM9hUVP+wa+qGLT7mXgOvMDBubjIGbhggrfDvwJYlLw
	AaPqneCPyaGQFvAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D17CE13AAB;
	Thu, 10 Jul 2025 10:07:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cIHmMfCQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 061/103] ALSA: emu10k1: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:43 +0200
Message-ID: <20250710100727.22653-62-tiwai@suse.de>
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
 sound/pci/emu10k1/emumpu401.c |  2 +-
 sound/pci/emu10k1/emupcm.c    | 10 +++++-----
 sound/pci/emu10k1/p16v.c      |  2 +-
 sound/pci/emu10k1/timer.c     |  2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/pci/emu10k1/emumpu401.c b/sound/pci/emu10k1/emumpu401.c
index 747c34b3d566..efff19bbc0e9 100644
--- a/sound/pci/emu10k1/emumpu401.c
+++ b/sound/pci/emu10k1/emumpu401.c
@@ -320,7 +320,7 @@ static int emu10k1_midi_init(struct snd_emu10k1 *emu, struct snd_emu10k1_midi *m
 	spin_lock_init(&midi->open_lock);
 	spin_lock_init(&midi->input_lock);
 	spin_lock_init(&midi->output_lock);
-	strcpy(rmidi->name, name);
+	strscpy(rmidi->name, name);
 	snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT, &snd_emu10k1_midi_output);
 	snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_INPUT, &snd_emu10k1_midi_input);
 	rmidi->info_flags |= SNDRV_RAWMIDI_INFO_OUTPUT |
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 1bf6e3d652f8..5414148057ea 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -1425,7 +1425,7 @@ int snd_emu10k1_pcm(struct snd_emu10k1 *emu, int device)
 
 	pcm->info_flags = 0;
 	pcm->dev_subclass = SNDRV_PCM_SUBCLASS_GENERIC_MIX;
-	strcpy(pcm->name, "ADC Capture/Standard PCM Playback");
+	strscpy(pcm->name, "ADC Capture/Standard PCM Playback");
 	emu->pcm = pcm;
 
 	/* playback substream can't use managed buffers due to alignment */
@@ -1457,7 +1457,7 @@ int snd_emu10k1_pcm_multi(struct snd_emu10k1 *emu, int device)
 
 	pcm->info_flags = 0;
 	pcm->dev_subclass = SNDRV_PCM_SUBCLASS_GENERIC_MIX;
-	strcpy(pcm->name, "Multichannel Playback");
+	strscpy(pcm->name, "Multichannel Playback");
 	emu->pcm_multi = pcm;
 
 	for (substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream; substream; substream = substream->next)
@@ -1491,7 +1491,7 @@ int snd_emu10k1_pcm_mic(struct snd_emu10k1 *emu, int device)
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_emu10k1_capture_mic_ops);
 
 	pcm->info_flags = 0;
-	strcpy(pcm->name, "Mic Capture");
+	strscpy(pcm->name, "Mic Capture");
 	emu->pcm_mic = pcm;
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, &emu->pci->dev,
@@ -1818,9 +1818,9 @@ int snd_emu10k1_pcm_efx(struct snd_emu10k1 *emu, int device)
 
 	pcm->info_flags = 0;
 	if (emu->audigy)
-		strcpy(pcm->name, "Multichannel Capture");
+		strscpy(pcm->name, "Multichannel Capture");
 	else
-		strcpy(pcm->name, "Multichannel Capture/PT Playback");
+		strscpy(pcm->name, "Multichannel Capture/PT Playback");
 	emu->pcm_efx = pcm;
 
 	if (!emu->card_capabilities->emu_model) {
diff --git a/sound/pci/emu10k1/p16v.c b/sound/pci/emu10k1/p16v.c
index a9a75891f1da..e774174d10de 100644
--- a/sound/pci/emu10k1/p16v.c
+++ b/sound/pci/emu10k1/p16v.c
@@ -573,7 +573,7 @@ int snd_p16v_pcm(struct snd_emu10k1 *emu, int device)
 
 	pcm->info_flags = 0;
 	pcm->dev_subclass = SNDRV_PCM_SUBCLASS_GENERIC_MIX;
-	strcpy(pcm->name, "p16v");
+	strscpy(pcm->name, "p16v");
 	emu->pcm_p16v = pcm;
 	emu->p16v_interrupt = snd_p16v_interrupt;
 
diff --git a/sound/pci/emu10k1/timer.c b/sound/pci/emu10k1/timer.c
index bb2478319361..1231ae2bf931 100644
--- a/sound/pci/emu10k1/timer.c
+++ b/sound/pci/emu10k1/timer.c
@@ -80,7 +80,7 @@ int snd_emu10k1_timer(struct snd_emu10k1 *emu, int device)
 	tid.subdevice = 0;
 	err = snd_timer_new(emu->card, "EMU10K1", &tid, &timer);
 	if (err >= 0) {
-		strcpy(timer->name, "EMU10K1 timer");
+		strscpy(timer->name, "EMU10K1 timer");
 		timer->private_data = emu;
 		timer->hw = snd_emu10k1_timer_hw;
 	}
-- 
2.50.0

