Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F15C2D6611
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142321; cv=none; b=hCQzRz8oSEQiFEB77juRGLgeGonn4CADpMFe4UAVaIz3y8/jGEKBwrTY6jmijSIp4TgI4M/g4NJ4ndfI6PwJQm1NaFrBxDDforRowk46KfDwr0RPKaXZgAuUedkbFq5wT+AhNgwedEbaPT/iMp3QCFPWWRiEdu9MrxVdxEVgNvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142321; c=relaxed/simple;
	bh=ym2dcn9of2B2qbYffRWaOdkPkWT15txM5fpHEwp+b1k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mFHOr5e35fqmlSUAz//eGQUAseKu2Fi2yOyo5BRdcMViqvaWHkYVdxhTdfop49teh3+DyrxzmNE56ZnTsSuMQdzYBgrpu0lOAG9TujmbAfBbDhS7wzu2sZMDTQqhaDJ0BYt7JPHLBgUDk0t8LmeGs3lXZSbd/C9Q0w9BdZd9wcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yVVT8OfL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NsfGOGny; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yVVT8OfL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NsfGOGny; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yVVT8OfL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NsfGOGny";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yVVT8OfL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NsfGOGny"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 782491F78D;
	Thu, 10 Jul 2025 10:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WwZ65QRXZ1Z7V/fUtDyPXDbXTXVUYcG6CfaO3jJYd9k=;
	b=yVVT8OfL5HRDFJlyQoCbajpCeWLdJ2gMjkRIcEmn5nmErgsb5NF+q4nAX5mWoZjb57cS34
	FSUFncUXzfRpX2vu2ATWRQwBZW8FcZlhjJ8BPcAI4K9YjhaWrvDOweuuWhk0mxezfXdMkg
	U/upZHqzsJR8hdlBxdzAcF9Xf2gfUyM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WwZ65QRXZ1Z7V/fUtDyPXDbXTXVUYcG6CfaO3jJYd9k=;
	b=NsfGOGnyxiJF8BK6uVR/LYq2E3ibzEww6OPlfY+fOgwYDhv+OC+AnVjWI/FQxmm4QvkL1Z
	/haNfuJPRLAaClDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WwZ65QRXZ1Z7V/fUtDyPXDbXTXVUYcG6CfaO3jJYd9k=;
	b=yVVT8OfL5HRDFJlyQoCbajpCeWLdJ2gMjkRIcEmn5nmErgsb5NF+q4nAX5mWoZjb57cS34
	FSUFncUXzfRpX2vu2ATWRQwBZW8FcZlhjJ8BPcAI4K9YjhaWrvDOweuuWhk0mxezfXdMkg
	U/upZHqzsJR8hdlBxdzAcF9Xf2gfUyM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WwZ65QRXZ1Z7V/fUtDyPXDbXTXVUYcG6CfaO3jJYd9k=;
	b=NsfGOGnyxiJF8BK6uVR/LYq2E3ibzEww6OPlfY+fOgwYDhv+OC+AnVjWI/FQxmm4QvkL1Z
	/haNfuJPRLAaClDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C53313A70;
	Thu, 10 Jul 2025 10:07:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UCRYFfaQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 101/103] ALSA: cmipci: Copy string more safely
Date: Thu, 10 Jul 2025 12:07:23 +0200
Message-ID: <20250710100727.22653-102-tiwai@suse.de>
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

The probe code uses sprintf() and strcat() without caring about the
string buffer size.  Replace with safer code.

Only a cosmetic safety matter, no functional changes intended.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cmipci.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index 9056214e9cda..c4ee550d7c96 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -3008,11 +3008,12 @@ static int snd_cmipci_create(struct snd_card *card, struct pci_dev *pci,
 	    pci->device != PCI_DEVICE_ID_CMEDIA_CM8338B)
 		query_chip(cm);
 	/* added -MCx suffix for chip supporting multi-channels */
-	if (cm->can_multi_ch)
-		sprintf(cm->card->driver + strlen(cm->card->driver),
-			"-MC%d", cm->max_channels);
-	else if (cm->can_ac3_sw)
-		strcpy(cm->card->driver + strlen(cm->card->driver), "-SWIEC");
+	if (cm->can_multi_ch) {
+		int l = strlen(cm->card->driver);
+		scnprintf(cm->card->driver + l, sizeof(cm->card->driver) - l,
+			  "-MC%d", cm->max_channels);
+	} else if (cm->can_ac3_sw)
+		strlcat(cm->card->driver, "-SWIEC", sizeof(cm->card->driver));
 
 	cm->dig_status = SNDRV_PCM_DEFAULT_CON_SPDIF;
 	cm->dig_pcm_status = SNDRV_PCM_DEFAULT_CON_SPDIF;
-- 
2.50.0

