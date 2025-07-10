Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4392D5A19
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142200; cv=none; b=pUt5hUrr2sucD8iXcO+8YsjwyYEhKkHYZRICBCPmaNCBfb+Ch0db4YECxGAujI4swvKq25XqWOWNL8sFPMdu5mIGc/wwu1OZGSnIVzmWs1AABL8HGHPuX4C+8YRj0DQZFjvx56occ9vOxQV8avJnbWjkFM3r24DQWtCJLoJ0YTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142200; c=relaxed/simple;
	bh=G+/LYcK7ClUMAuLUn18LfHTuRD0HiBGHPb6bT4UHmws=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IxRC2jx8xUFmlPNw94YAx+FAVnEJzd5bPE2LRSnbKxKxDd7JzJeDBZ2Zd48W5j3EdVoteOAkBFE0s0J+l4bs+k8yrZazE9YbMnpSnsV4KIkWD/YKxlVrBbc8vcjr9ghYn3mRoeFFDutR4xt+IFhOShtjLzaP0JL2HIZZ/6LF+Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fcbUn8ew; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZpFGYJ3p; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RQq/GZJ/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dJIDLx4D; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fcbUn8ew";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZpFGYJ3p";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RQq/GZJ/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dJIDLx4D"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 136911F745;
	Thu, 10 Jul 2025 10:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7+vHguw83edpzQwIFgAhtnhSoFyNqaWMK1UuPiqoCmY=;
	b=fcbUn8ewaXgoLCloOMz+0VJZ/aWymId2D69TftOeTu4F3fsAvaLotlB+QU6B0Yd+zvTTLy
	sXqiuxfDeXjke3FWoRoU+/ytvw+pYf5hDCF0pzhbhlAOuGuA4IU+X/ISrAL7stODbdccHC
	v7Hv9uo0z+N7LrFpBL+dZu8DzZ6BLUw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142065;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7+vHguw83edpzQwIFgAhtnhSoFyNqaWMK1UuPiqoCmY=;
	b=ZpFGYJ3pCDyErJn+xesvTo2IW7QwD0KGzB9ENYTvB8DX7Tp0Ydn7bjtOnTTJA9qHQ+qdEO
	minG1liwLg2NS1CQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="RQq/GZJ/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dJIDLx4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7+vHguw83edpzQwIFgAhtnhSoFyNqaWMK1UuPiqoCmY=;
	b=RQq/GZJ/iP8ZIrMJbXYud77wSPu8C5qtxsUOmgEtFe3vFzPzsgdpx+pLO0S9N0kmZ/mKf6
	wCOAh9p1/0jXKhbMCqPzEvIveCfn8HB3OeseIwuutHD8ZIQpMVzcAnJokYpJG/daRBjArg
	KXxgMaRGJxTi02Exmrj1bp0liCBKp28=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142064;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7+vHguw83edpzQwIFgAhtnhSoFyNqaWMK1UuPiqoCmY=;
	b=dJIDLx4Dqb9Qj0Z7jE48HOq45JDIDBpCrJMkV1gvyvD4z0NgeFQCKM1Ky/x8lVHQVTut4U
	tdy1Vw6MD/bZ/zAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EDBC313A70;
	Thu, 10 Jul 2025 10:07:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qAvcOO+Qb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 055/103] ALSA: cs4281: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:37 +0200
Message-ID: <20250710100727.22653-56-tiwai@suse.de>
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
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 136911F745
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cs4281.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
index 90958a422b75..31cb9cbe2f03 100644
--- a/sound/pci/cs4281.c
+++ b/sound/pci/cs4281.c
@@ -950,7 +950,7 @@ static int snd_cs4281_pcm(struct cs4281 *chip, int device)
 
 	pcm->private_data = chip;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, "CS4281");
+	strscpy(pcm->name, "CS4281");
 	chip->pcm = pcm;
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, &chip->pci->dev,
@@ -1715,7 +1715,7 @@ static int snd_cs4281_midi(struct cs4281 *chip, int device)
 	err = snd_rawmidi_new(chip->card, "CS4281", device, 1, 1, &rmidi);
 	if (err < 0)
 		return err;
-	strcpy(rmidi->name, "CS4281");
+	strscpy(rmidi->name, "CS4281");
 	snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT, &snd_cs4281_midi_output);
 	snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_INPUT, &snd_cs4281_midi_input);
 	rmidi->info_flags |= SNDRV_RAWMIDI_INFO_OUTPUT | SNDRV_RAWMIDI_INFO_INPUT | SNDRV_RAWMIDI_INFO_DUPLEX;
@@ -1870,8 +1870,8 @@ static int __snd_cs4281_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 	snd_cs4281_create_gameport(chip);
-	strcpy(card->driver, "CS4281");
-	strcpy(card->shortname, "Cirrus Logic CS4281");
+	strscpy(card->driver, "CS4281");
+	strscpy(card->shortname, "Cirrus Logic CS4281");
 	sprintf(card->longname, "%s at 0x%lx, irq %d",
 		card->shortname,
 		chip->ba0_addr,
-- 
2.50.0

