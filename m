Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8D22D5A0B
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142167; cv=none; b=feG9GHovLxUtZLbwiwdqXumx55MVEyAZDj582uvmJXZqgSBm7YorEPfcZ3MI053gtXzrNJFkKoh4qn3Fw48aHc8BtDZmh7L1R/8zhagPefgySEbVTQmhOBsSNR0sR1YwEB0PhQJmVbuJ4LaN8k4YSysE9cMqjMP8+Rv3MQAiVzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142167; c=relaxed/simple;
	bh=0QfNgp52b78J2m7DbQpray7LWVaDa702SdXgC42jWx8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FMpgKKXwuKXQBGwKkTHE2VEsPb3rRR9hyUfTX/14pZ+0IaM5iKTSJtkKwHSOC9NXjhxmw1ssiR7X4aTjHwgUTrEeWB5pL1KHcWYhqus4lgBp5ydFxMq1ODSU+ejKZNVbllHvDrxATu09JUoX33BOfBuWfuXf63bvHKS8eW7aP/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gzraywhh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fIMKBKix; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gzraywhh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fIMKBKix; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gzraywhh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fIMKBKix";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gzraywhh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fIMKBKix"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C855F1F46E;
	Thu, 10 Jul 2025 10:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r/edrmn79US3YlT7FcrJ9DmO+Orl5C5Fsf0WMxgeSnc=;
	b=gzraywhhYz13wwpI5hRa7YTsvXOnU7lsG1492B3sqVOT3ibr+exvkbEJL0OaiP3elL25hW
	XMGSLpSFYmOy8WKCpLIfuDTe9cNvrbgfX4q8MqMwwLIem8lTrflGPZkBkZHe1BzgJEYUgX
	90HEYvrljroxJL0oZiTVxL+GqyztojI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r/edrmn79US3YlT7FcrJ9DmO+Orl5C5Fsf0WMxgeSnc=;
	b=fIMKBKixgWFMT0ix5L7Ix6mHI3n79ACOOBZexnAho32q6/g10j7ZTjniwjo4zA29MYFxNb
	tAJ46c5d1Y6a+1Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r/edrmn79US3YlT7FcrJ9DmO+Orl5C5Fsf0WMxgeSnc=;
	b=gzraywhhYz13wwpI5hRa7YTsvXOnU7lsG1492B3sqVOT3ibr+exvkbEJL0OaiP3elL25hW
	XMGSLpSFYmOy8WKCpLIfuDTe9cNvrbgfX4q8MqMwwLIem8lTrflGPZkBkZHe1BzgJEYUgX
	90HEYvrljroxJL0oZiTVxL+GqyztojI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r/edrmn79US3YlT7FcrJ9DmO+Orl5C5Fsf0WMxgeSnc=;
	b=fIMKBKixgWFMT0ix5L7Ix6mHI3n79ACOOBZexnAho32q6/g10j7ZTjniwjo4zA29MYFxNb
	tAJ46c5d1Y6a+1Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE5D613A70;
	Thu, 10 Jul 2025 10:07:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YDYiKe+Qb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 053/103] ALSA: ca0106: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:35 +0200
Message-ID: <20250710100727.22653-54-tiwai@suse.de>
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
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ca0106/ca0106_main.c  | 6 +++---
 sound/pci/ca0106/ca0106_mixer.c | 4 ++--
 sound/pci/ca0106/ca_midi.c      | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/pci/ca0106/ca0106_main.c b/sound/pci/ca0106/ca0106_main.c
index 7c7119cad63c..242618793181 100644
--- a/sound/pci/ca0106/ca0106_main.c
+++ b/sound/pci/ca0106/ca0106_main.c
@@ -1315,7 +1315,7 @@ static int snd_ca0106_pcm(struct snd_ca0106 *emu, int device)
         }
 
 	pcm->info_flags = 0;
-	strcpy(pcm->name, "CA0106");
+	strscpy(pcm->name, "CA0106");
 
 	for(substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream; 
 	    substream; 
@@ -1617,8 +1617,8 @@ static int snd_ca0106_create(int dev, struct snd_card *card,
 	pci_read_config_word(pci, PCI_SUBSYSTEM_ID, &chip->model);
 	dev_info(card->dev, "Model %04x Rev %08x Serial %08x\n",
 	       chip->model, pci->revision, chip->serial);
-	strcpy(card->driver, "CA0106");
-	strcpy(card->shortname, "CA0106");
+	strscpy(card->driver, "CA0106");
+	strscpy(card->shortname, "CA0106");
 
 	for (c = ca0106_chip_details; c->serial; c++) {
 		if (subsystem[dev]) {
diff --git a/sound/pci/ca0106/ca0106_mixer.c b/sound/pci/ca0106/ca0106_mixer.c
index 1d5a899b2c24..f7b6b2db889b 100644
--- a/sound/pci/ca0106/ca0106_mixer.c
+++ b/sound/pci/ca0106/ca0106_mixer.c
@@ -701,7 +701,7 @@ static int remove_ctl(struct snd_card *card, const char *name)
 {
 	struct snd_ctl_elem_id id;
 	memset(&id, 0, sizeof(id));
-	strcpy(id.name, name);
+	strscpy(id.name, name);
 	id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	return snd_ctl_remove_id(card, &id);
 }
@@ -849,7 +849,7 @@ int snd_ca0106_mixer(struct snd_ca0106 *emu)
 			return err;
 	}
 
-	strcpy(card->mixername, "CA0106");
+	strscpy(card->mixername, "CA0106");
         return 0;
 }
 
diff --git a/sound/pci/ca0106/ca_midi.c b/sound/pci/ca0106/ca_midi.c
index 957e60f64821..f9cec67f31ac 100644
--- a/sound/pci/ca0106/ca_midi.c
+++ b/sound/pci/ca0106/ca_midi.c
@@ -287,7 +287,7 @@ int ca_midi_init(void *dev_id, struct snd_ca_midi *midi, int device, char *name)
 	spin_lock_init(&midi->input_lock);
 	spin_lock_init(&midi->output_lock);
 
-	strcpy(rmidi->name, name);
+	strscpy(rmidi->name, name);
 	snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT, &ca_midi_output);
 	snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_INPUT, &ca_midi_input);
 	rmidi->info_flags |= SNDRV_RAWMIDI_INFO_OUTPUT |
-- 
2.50.0

