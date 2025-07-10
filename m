Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E992D5A04
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142155; cv=none; b=IYtLU24ZwgSaBOk+iMXyWEzoavs8k4EMWZqyCrUA2j1V5yop8GPgdzua90PEKj/fKrRDxgS0mJryDEy2E0rUUjGqNqGtURWPXDYG5wOcwFu2HlCXM6V1Uf0Mt6zBu1LsRkbLg9EFGK/1+xa80rO8yZ7QpS+h6gZN/h6Mg5NlH9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142155; c=relaxed/simple;
	bh=WFBdhy7I3a9VGS9izeR4FUEJVPoXM000lJf+7q3QZ6E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j4jfOH7qaEaP9RLABgiJGEf17HPXrW8MAhG6UtihQNPz7moQBZkzLt4IiCOq2sRNqvfaKKnu8z0ZfkElRmU4lrPtdnOBzI7Bj0uLnNdiv0m5FdbVOcO4dssx6XG5QdfdMT/HGcTK205eLrooT5wx5cIhgu4+l1Obwq/CljVKxQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hwfLylVg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OZWT2F4g; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hwfLylVg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OZWT2F4g; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hwfLylVg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OZWT2F4g";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hwfLylVg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OZWT2F4g"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 250941F460;
	Thu, 10 Jul 2025 10:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5eO4C6QAyGiTcVKlqNsrI7MLoQ6o7KF1laBcNLC7RSw=;
	b=hwfLylVgZ2/jAK5TA4j9sibdAcvSv70aFl0niNZrBJjlNTpEQHp0O0yzxrvVMSkoFaWNub
	wW01UeUztUx/YL7rB4xRye2Vnt7Or7QMz5IBjdfUXtTrf9qQzLrr7hPkBow+U7qyUv8jAj
	8JKYMD9eQS26RW8D8ZQIZWt+sA0N1O0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5eO4C6QAyGiTcVKlqNsrI7MLoQ6o7KF1laBcNLC7RSw=;
	b=OZWT2F4gwtnYDluMCj1eNT2kijkyRjineTuwYmM5eLwHZF+CyEH1OUQfwY3Yq8PdfxUm79
	a6jRbVNjfL0J3oDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hwfLylVg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OZWT2F4g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5eO4C6QAyGiTcVKlqNsrI7MLoQ6o7KF1laBcNLC7RSw=;
	b=hwfLylVgZ2/jAK5TA4j9sibdAcvSv70aFl0niNZrBJjlNTpEQHp0O0yzxrvVMSkoFaWNub
	wW01UeUztUx/YL7rB4xRye2Vnt7Or7QMz5IBjdfUXtTrf9qQzLrr7hPkBow+U7qyUv8jAj
	8JKYMD9eQS26RW8D8ZQIZWt+sA0N1O0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5eO4C6QAyGiTcVKlqNsrI7MLoQ6o7KF1laBcNLC7RSw=;
	b=OZWT2F4gwtnYDluMCj1eNT2kijkyRjineTuwYmM5eLwHZF+CyEH1OUQfwY3Yq8PdfxUm79
	a6jRbVNjfL0J3oDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0B1BF136DC;
	Thu, 10 Jul 2025 10:07:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qG11Ae+Qb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 048/103] ALSA: atiixp: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:30 +0200
Message-ID: <20250710100727.22653-49-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 250941F460
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/atiixp.c       | 10 +++++-----
 sound/pci/atiixp_modem.c |  6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/pci/atiixp.c b/sound/pci/atiixp.c
index 427006be240b..4f544950ee7b 100644
--- a/sound/pci/atiixp.c
+++ b/sound/pci/atiixp.c
@@ -1271,7 +1271,7 @@ static int snd_atiixp_pcm_new(struct atiixp *chip)
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_atiixp_playback_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_atiixp_capture_ops);
 	pcm->private_data = chip;
-	strcpy(pcm->name, "ATI IXP AC97");
+	strscpy(pcm->name, "ATI IXP AC97");
 	chip->pcmdevs[ATI_PCMDEV_ANALOG] = pcm;
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
@@ -1301,9 +1301,9 @@ static int snd_atiixp_pcm_new(struct atiixp *chip)
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_atiixp_spdif_ops);
 	pcm->private_data = chip;
 	if (chip->spdif_over_aclink)
-		strcpy(pcm->name, "ATI IXP IEC958 (AC97)");
+		strscpy(pcm->name, "ATI IXP IEC958 (AC97)");
 	else
-		strcpy(pcm->name, "ATI IXP IEC958 (Direct)");
+		strscpy(pcm->name, "ATI IXP IEC958 (Direct)");
 	chip->pcmdevs[ATI_PCMDEV_DIGITAL] = pcm;
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
@@ -1576,8 +1576,8 @@ static int __snd_atiixp_probe(struct pci_dev *pci,
 		return err;
 	chip = card->private_data;
 
-	strcpy(card->driver, spdif_aclink ? "ATIIXP" : "ATIIXP-SPDMA");
-	strcpy(card->shortname, "ATI IXP");
+	strscpy(card->driver, spdif_aclink ? "ATIIXP" : "ATIIXP-SPDMA");
+	strscpy(card->shortname, "ATI IXP");
 	err = snd_atiixp_init(card, pci);
 	if (err < 0)
 		return err;
diff --git a/sound/pci/atiixp_modem.c b/sound/pci/atiixp_modem.c
index 8d3083b9b024..f7417c2bb477 100644
--- a/sound/pci/atiixp_modem.c
+++ b/sound/pci/atiixp_modem.c
@@ -982,7 +982,7 @@ static int snd_atiixp_pcm_new(struct atiixp_modem *chip)
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_atiixp_capture_ops);
 	pcm->dev_class = SNDRV_PCM_CLASS_MODEM;
 	pcm->private_data = chip;
-	strcpy(pcm->name, "ATI IXP MC97");
+	strscpy(pcm->name, "ATI IXP MC97");
 	chip->pcmdevs[ATI_PCMDEV_ANALOG] = pcm;
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
@@ -1206,8 +1206,8 @@ static int __snd_atiixp_probe(struct pci_dev *pci,
 		return err;
 	chip = card->private_data;
 
-	strcpy(card->driver, "ATIIXP-MODEM");
-	strcpy(card->shortname, "ATI IXP Modem");
+	strscpy(card->driver, "ATIIXP-MODEM");
+	strscpy(card->shortname, "ATI IXP Modem");
 	err = snd_atiixp_init(card, pci);
 	if (err < 0)
 		return err;
-- 
2.50.0

