Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E1628C5D9
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142131; cv=none; b=B+aqojN3qxfyRsDpyqsl5vfrh7uUxHAFU/qgeVA9hjY0BF/JsD2h/sM36b4lKNDCiiJgHBHLVFP8hZftlTa5raW3etcr1JJ819YlHgiZvprekViFKSONzEm6AAc9UAvZDiJ++f9/Ln4w8Tp3esWoBjeK/pBBVi4IErdDi9BMsIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142131; c=relaxed/simple;
	bh=l7nVpIJ+i1liqXgVHoBJpBYVe1oK8AzxN3Ij1CVTka0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DKJcpWWkZ5ICovrsI3P+/9DChxR5e5EOmjuq/xiO/fcp7sTKS1+uPnoh7tKSVVlLW4IyrXSgjH+X1Y1aBVvEwgCaTku2q8EyALNGHelgYFZpC2aIWph24qw+EoFMzcgqSS+my9qR0SLMzpXyqycc7MuvxeAdIsL8//JPaeklR70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=THiX0jxw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8pe/jA8y; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=THiX0jxw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8pe/jA8y; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="THiX0jxw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8pe/jA8y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="THiX0jxw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8pe/jA8y"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1665D1F45B;
	Thu, 10 Jul 2025 10:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i0gg64M3bXscDgKx96tdVZxG205SVSSl6sJxvNDF/EA=;
	b=THiX0jxwNgkxTVLyWt7NvpxxHz8zUgZk0RiWOx6V/4CUlWg/be2S55OFrzN8EtXhc28esZ
	Tauc5LXD/vR8/hJ1wgB5rlQb1U7WkFGtTlpN6x1uR94ylKkL0RFdrB0ak06CwHNMN4fKTS
	SSrmIO6TldrAZy/OVBDPxKX9Xtd1qo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i0gg64M3bXscDgKx96tdVZxG205SVSSl6sJxvNDF/EA=;
	b=8pe/jA8yTm/eJn1/HlZhJdqni9ro6RwtuIHlMTnMj/Sfl6GuxaRecPZM1B9VcXERrvqTd2
	q48ZKqUW2flMfkDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i0gg64M3bXscDgKx96tdVZxG205SVSSl6sJxvNDF/EA=;
	b=THiX0jxwNgkxTVLyWt7NvpxxHz8zUgZk0RiWOx6V/4CUlWg/be2S55OFrzN8EtXhc28esZ
	Tauc5LXD/vR8/hJ1wgB5rlQb1U7WkFGtTlpN6x1uR94ylKkL0RFdrB0ak06CwHNMN4fKTS
	SSrmIO6TldrAZy/OVBDPxKX9Xtd1qo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i0gg64M3bXscDgKx96tdVZxG205SVSSl6sJxvNDF/EA=;
	b=8pe/jA8yTm/eJn1/HlZhJdqni9ro6RwtuIHlMTnMj/Sfl6GuxaRecPZM1B9VcXERrvqTd2
	q48ZKqUW2flMfkDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 00A0A136DC;
	Thu, 10 Jul 2025 10:07:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YIuTOuyQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:40 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 032/103] ALSA: msnd: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:14 +0200
Message-ID: <20250710100727.22653-33-tiwai@suse.de>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
 sound/isa/msnd/msnd.c                |  2 +-
 sound/isa/msnd/msnd_pinnacle.c       | 22 +++++++++++-----------
 sound/isa/msnd/msnd_pinnacle_mixer.c |  2 +-
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/isa/msnd/msnd.c b/sound/isa/msnd/msnd.c
index 69c515421dd8..8c1d2e27854b 100644
--- a/sound/isa/msnd/msnd.c
+++ b/sound/isa/msnd/msnd.c
@@ -673,7 +673,7 @@ int snd_msnd_pcm(struct snd_card *card, int device)
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_msnd_capture_ops);
 
 	pcm->private_data = chip;
-	strcpy(pcm->name, "Hurricane");
+	strscpy(pcm->name, "Hurricane");
 
 	return 0;
 }
diff --git a/sound/isa/msnd/msnd_pinnacle.c b/sound/isa/msnd/msnd_pinnacle.c
index 8caf431677e5..969bbb18657b 100644
--- a/sound/isa/msnd/msnd_pinnacle.c
+++ b/sound/isa/msnd/msnd_pinnacle.c
@@ -221,8 +221,8 @@ static int snd_msnd_probe(struct snd_card *card)
 	}
 
 #ifdef MSND_CLASSIC
-	strcpy(card->shortname, "Classic/Tahiti/Monterey");
-	strcpy(card->longname, "Turtle Beach Multisound");
+	strscpy(card->shortname, "Classic/Tahiti/Monterey");
+	strscpy(card->longname, "Turtle Beach Multisound");
 	dev_info(card->dev, LOGNAME ": %s, "
 	       "I/O 0x%lx-0x%lx, IRQ %d, memory mapped to 0x%lX-0x%lX\n",
 	       card->shortname,
@@ -251,38 +251,38 @@ static int snd_msnd_probe(struct snd_card *card)
 	switch (info & 0x7) {
 	case 0x0:
 		rev = "I";
-		strcpy(card->shortname, pin);
+		strscpy(card->shortname, pin);
 		break;
 	case 0x1:
 		rev = "F";
-		strcpy(card->shortname, pin);
+		strscpy(card->shortname, pin);
 		break;
 	case 0x2:
 		rev = "G";
-		strcpy(card->shortname, pin);
+		strscpy(card->shortname, pin);
 		break;
 	case 0x3:
 		rev = "H";
-		strcpy(card->shortname, pin);
+		strscpy(card->shortname, pin);
 		break;
 	case 0x4:
 		rev = "E";
-		strcpy(card->shortname, fiji);
+		strscpy(card->shortname, fiji);
 		break;
 	case 0x5:
 		rev = "C";
-		strcpy(card->shortname, fiji);
+		strscpy(card->shortname, fiji);
 		break;
 	case 0x6:
 		rev = "D";
-		strcpy(card->shortname, fiji);
+		strscpy(card->shortname, fiji);
 		break;
 	case 0x7:
 		rev = "A-B (Fiji) or A-E (Pinnacle)";
-		strcpy(card->shortname, pinfiji);
+		strscpy(card->shortname, pinfiji);
 		break;
 	}
-	strcpy(card->longname, "Turtle Beach Multisound Pinnacle");
+	strscpy(card->longname, "Turtle Beach Multisound Pinnacle");
 	dev_info(card->dev, LOGNAME ": %s revision %s, Xilinx version %s, "
 	       "I/O 0x%lx-0x%lx, IRQ %d, memory mapped to 0x%lX-0x%lX\n",
 	       card->shortname,
diff --git a/sound/isa/msnd/msnd_pinnacle_mixer.c b/sound/isa/msnd/msnd_pinnacle_mixer.c
index 63633bd41e5b..2f1bb5a2b376 100644
--- a/sound/isa/msnd/msnd_pinnacle_mixer.c
+++ b/sound/isa/msnd/msnd_pinnacle_mixer.c
@@ -299,7 +299,7 @@ int snd_msndmix_new(struct snd_card *card)
 	if (snd_BUG_ON(!chip))
 		return -EINVAL;
 	spin_lock_init(&chip->mixer_lock);
-	strcpy(card->mixername, "MSND Pinnacle Mixer");
+	strscpy(card->mixername, "MSND Pinnacle Mixer");
 
 	for (idx = 0; idx < ARRAY_SIZE(snd_msnd_controls); idx++) {
 		err = snd_ctl_add(card,
-- 
2.50.0

