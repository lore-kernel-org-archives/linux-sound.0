Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358492D5C98
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142272; cv=none; b=YQ/jLrCLW2eC2VD/T0zoTTbyT1uQfI+fjJMML/Nw5YWZTo0TWhMGso9n9sQtzQB/b+L0xLHNp2nnC3Q7M2RmVGAOM1RDjrdLoYQmvecHIs8EpXEwNh1mmKejQ82dx07n4q/RoUT8cQf9zg9kpsCUOQfKMKi3C1HK7SDfOusmIp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142272; c=relaxed/simple;
	bh=eZIrNvh4xqNI4Pqs+6guZLrTe3XXTD6SQFhdIF0L/io=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T8hBcNQCeU5d4O+0SyQUkaw2emSwDQpWump/kLQe3F91A2jAphOiSKSdBTM68uOsdU3vqlsUuT0Obn5KJCg+DdS9M6nfPazU7WyvxYPO86iPsJu4IMdHRloj7+ksjLaZLmQPPz827njVt8DWuO9lYmKdPH7uoPvQZpOgrUvXP9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k8DZchC8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+lcwz0Z/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k8DZchC8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+lcwz0Z/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k8DZchC8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+lcwz0Z/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k8DZchC8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+lcwz0Z/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 65770211A1;
	Thu, 10 Jul 2025 10:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RXAa0ueNaAREe9zoZShrh47SZPOJjVeghVdRwFNjMmI=;
	b=k8DZchC8Lcx1IWHGg9xXvQ3B3B8W1RdJWaSvGXYVeuXk7nR45DqN2AbnUx6Yf4QkXC/9hc
	UqgmRdsNNR0VPV7Tkwc89N/XJa71VzOQyE4mLsCY6iaUFLUoBpWDbTOMupjrHOSLlD2bJI
	eKKy5G4SHOaoSfXM9ZDtFWuUsASJzM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RXAa0ueNaAREe9zoZShrh47SZPOJjVeghVdRwFNjMmI=;
	b=+lcwz0Z/WFL5urob75viPlTIgFSMXPoNb+scvYkEWHDIOkodHnHDwtXPTLe7Lr/AMMTmw4
	C3VUe7+7GOexrNDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=k8DZchC8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="+lcwz0Z/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RXAa0ueNaAREe9zoZShrh47SZPOJjVeghVdRwFNjMmI=;
	b=k8DZchC8Lcx1IWHGg9xXvQ3B3B8W1RdJWaSvGXYVeuXk7nR45DqN2AbnUx6Yf4QkXC/9hc
	UqgmRdsNNR0VPV7Tkwc89N/XJa71VzOQyE4mLsCY6iaUFLUoBpWDbTOMupjrHOSLlD2bJI
	eKKy5G4SHOaoSfXM9ZDtFWuUsASJzM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RXAa0ueNaAREe9zoZShrh47SZPOJjVeghVdRwFNjMmI=;
	b=+lcwz0Z/WFL5urob75viPlTIgFSMXPoNb+scvYkEWHDIOkodHnHDwtXPTLe7Lr/AMMTmw4
	C3VUe7+7GOexrNDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 49FAB136DC;
	Thu, 10 Jul 2025 10:07:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8DyzEO+Qb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 050/103] ALSA: aw2: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:32 +0200
Message-ID: <20250710100727.22653-51-tiwai@suse.de>
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
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
X-Rspamd-Queue-Id: 65770211A1
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/aw2/aw2-alsa.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/pci/aw2/aw2-alsa.c b/sound/pci/aw2/aw2-alsa.c
index 7b4b8f785517..1d7aab14579e 100644
--- a/sound/pci/aw2/aw2-alsa.c
+++ b/sound/pci/aw2/aw2-alsa.c
@@ -281,8 +281,8 @@ static int snd_aw2_probe(struct pci_dev *pci,
 	/* init spinlock */
 	spin_lock_init(&chip->reg_lock);
 	/* (4) Define driver ID and name string */
-	strcpy(card->driver, "aw2");
-	strcpy(card->shortname, "Audiowerk2");
+	strscpy(card->driver, "aw2");
+	strscpy(card->shortname, "Audiowerk2");
 
 	sprintf(card->longname, "%s with SAA7146 irq %i",
 		card->shortname, chip->irq);
@@ -509,7 +509,7 @@ static int snd_aw2_new_pcm(struct aw2 *chip)
 	pcm_device = &chip->device_playback[NUM_STREAM_PLAYBACK_ANA];
 
 	/* Set PCM device name */
-	strcpy(pcm_playback_ana->name, "Analog playback");
+	strscpy(pcm_playback_ana->name, "Analog playback");
 	/* Associate private data to PCM device */
 	pcm_playback_ana->private_data = pcm_device;
 	/* set operators of PCM device */
@@ -541,7 +541,7 @@ static int snd_aw2_new_pcm(struct aw2 *chip)
 	pcm_device = &chip->device_playback[NUM_STREAM_PLAYBACK_DIG];
 
 	/* Set PCM device name */
-	strcpy(pcm_playback_num->name, "Digital playback");
+	strscpy(pcm_playback_num->name, "Digital playback");
 	/* Associate private data to PCM device */
 	pcm_playback_num->private_data = pcm_device;
 	/* set operators of PCM device */
@@ -574,7 +574,7 @@ static int snd_aw2_new_pcm(struct aw2 *chip)
 	pcm_device = &chip->device_capture[NUM_STREAM_CAPTURE_ANA];
 
 	/* Set PCM device name */
-	strcpy(pcm_capture->name, "Capture");
+	strscpy(pcm_capture->name, "Capture");
 	/* Associate private data to PCM device */
 	pcm_capture->private_data = pcm_device;
 	/* set operators of PCM device */
-- 
2.50.0

