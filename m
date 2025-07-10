Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7FD2D5C99
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142261; cv=none; b=B+ymIXJKFhDI0R+hXkKVeDmiScpICvF3ktfO2hW/rn7QaWS2NLxEPSLHgVMevFMv+x5bh3IysjC73NQWk9qYCtDy/h2N9h3gjlb4/nQcwB2/rIk1rBvugQQ3uFaLPM/hLc9P1OfmmDsYaLGtZF1+diZ6dGpQtbYPEHWlFCVVnsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142261; c=relaxed/simple;
	bh=KFzRUphEEzpgbK9iZjPqlwcV9XwPi0ntuMjQXANn9pI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XUAr00qf6jFtVSRSJC8IkU16HofKpDY9sLmqTzz+Fir8HqeEOBnU3aI0NhTeAS6hDttzw/m6GiJdD6jkoiWmCrMXYE1RdKkqxRRZjjMXTMjlWg1IRZS+3pCiWhjgMRmlIf/KsR7cyIZnH3DYPIUpca9wgpZ8DnLn5fAYYODImZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HcgzulZ/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OzZ5lRhe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HcgzulZ/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OzZ5lRhe; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HcgzulZ/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OzZ5lRhe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HcgzulZ/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OzZ5lRhe"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AC1F61F76C;
	Thu, 10 Jul 2025 10:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3YKrqwSMl2ksODUL4cQQXuMMk8w9eOxjSDsilJ2Ioms=;
	b=HcgzulZ/Jmz3LJ+tjxSkKIxOFVewfzIShIlzPR41iCUMUEqeOcDmEFwh6NdO1MCJ7YIrWG
	ihX/V+0OzQCJuJ1TEatW0+GlXtcuz7oEPHyRS2+GvP2dypmqWJ3TrDN9uLP+di1aPaRaC7
	6gM1VALtpigKPVciFThZhj9/aBRowto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142067;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3YKrqwSMl2ksODUL4cQQXuMMk8w9eOxjSDsilJ2Ioms=;
	b=OzZ5lRheinsDGR1PpwwwLU7eaV9uYk4GYGeO3jBOfE66c6QJ1zR6sVzI33ZehqNz3T0qtz
	MM43J8iyMpS6FHAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3YKrqwSMl2ksODUL4cQQXuMMk8w9eOxjSDsilJ2Ioms=;
	b=HcgzulZ/Jmz3LJ+tjxSkKIxOFVewfzIShIlzPR41iCUMUEqeOcDmEFwh6NdO1MCJ7YIrWG
	ihX/V+0OzQCJuJ1TEatW0+GlXtcuz7oEPHyRS2+GvP2dypmqWJ3TrDN9uLP+di1aPaRaC7
	6gM1VALtpigKPVciFThZhj9/aBRowto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142067;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3YKrqwSMl2ksODUL4cQQXuMMk8w9eOxjSDsilJ2Ioms=;
	b=OzZ5lRheinsDGR1PpwwwLU7eaV9uYk4GYGeO3jBOfE66c6QJ1zR6sVzI33ZehqNz3T0qtz
	MM43J8iyMpS6FHAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9377F13A70;
	Thu, 10 Jul 2025 10:07:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aEzTIvOQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 081/103] ALSA: hdspm: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:07:03 +0200
Message-ID: <20250710100727.22653-82-tiwai@suse.de>
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
 sound/pci/rme9652/hdspm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index 2041cf00cca0..a0976824beda 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -6355,7 +6355,7 @@ static int snd_hdspm_create_hwdep(struct snd_card *card,
 
 	hdspm->hwdep = hw;
 	hw->private_data = hdspm;
-	strcpy(hw->name, "HDSPM hwdep interface");
+	strscpy(hw->name, "HDSPM hwdep interface");
 
 	hw->ops.open = snd_hdspm_hwdep_dummy_op;
 	hw->ops.ioctl = snd_hdspm_hwdep_ioctl;
@@ -6412,7 +6412,7 @@ static int snd_hdspm_create_pcm(struct snd_card *card,
 
 	hdspm->pcm = pcm;
 	pcm->private_data = hdspm;
-	strcpy(pcm->name, hdspm->card_name);
+	strscpy(pcm->name, hdspm->card_name);
 
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK,
 			&snd_hdspm_ops);
@@ -6512,8 +6512,8 @@ static int snd_hdspm_create(struct snd_card *card,
 	pci_read_config_word(hdspm->pci,
 			PCI_CLASS_REVISION, &hdspm->firmware_rev);
 
-	strcpy(card->mixername, "Xilinx FPGA");
-	strcpy(card->driver, "HDSPM");
+	strscpy(card->mixername, "Xilinx FPGA");
+	strscpy(card->driver, "HDSPM");
 
 	switch (hdspm->firmware_rev) {
 	case HDSPM_RAYDAT_REV:
-- 
2.50.0

