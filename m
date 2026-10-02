Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8162418A2D
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931354; cv=none; b=Uy5mlJuutCl+yoymJI7SB6X8KOCwjI5bT7Is4ONpmJVAdglgiJQN4r0jAJ26m/RSkXb2vjEAJRT32SJfjplol4Q8nTwAgDwEDdvd4oKTsHuH6wZZLEzNyXYher49oP7kZtvHNRtkwQ9flbLtZYwGO3/FBwCJ1digNYDFc+u40zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931354; c=relaxed/simple;
	bh=POKOWDSXg7eXyYGIP79WHaB/f32cqpcNdE5pMtqRx2c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tsFSbMtBqyDSDT3A/6szCq3vZfxyyVor1UiIWg99HAx+RD7JJKK8blqz7fuPNfTCclyGwuSFKvYzFwhTT60hlEB+3CBYATBqaKxylFEoX7jLOLCS83nvjl3Hj90PVwuzTjg1YJH8dZpGrisfAyHUVYw2QKKDmsJI0GG+O8vgh7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IB63okLD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0SMU6s0+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EG2hGxiq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lfGNvbUw; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IB63okLD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0SMU6s0+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EG2hGxiq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lfGNvbUw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9A29D21E44;
	Fri,  2 Oct 2026 08:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0wZGQkuByN1jEnj1FHtrN/anKCMdaxpPnZwYsUX7to=;
	b=IB63okLDElGsngdV7+jdD4JuXWOHnKCb+yrAuN7bxrx+Y0BtBtJ27JNcNbyDUqezLplt1D
	nYeeBEDqphYOoVSUKeBJV9Y2/JhX6nyuKSvDoVnmYde2B6hPt/XBFK7JYRR5XTseVTlzbH
	258/FGrk1YxmbdoSC/KpR4yeTTuTuQs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931346;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0wZGQkuByN1jEnj1FHtrN/anKCMdaxpPnZwYsUX7to=;
	b=0SMU6s0+xN0GaaZnV4cjvSLB0aNYKyL2tw9B2Vq/r3UfuVUbtIDL/kiRkt8nJ7G7lxYkdl
	cgumTSmj1u7okVDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0wZGQkuByN1jEnj1FHtrN/anKCMdaxpPnZwYsUX7to=;
	b=EG2hGxiqx+R+hXjpm5cP7n9uEYh4rtzGV3eO3cs4+GHqLR5jeL/JRSQmYpUnRt3GKIH+lM
	dVpbgDnACP8fmSDZ8PPLWd5BM5lNWXJNCKlExI3h4v2VzDTG7GCatb+p3lACzSI4TakVou
	DPS62iKfxLO8YIEVAK4Owp/9JI9qvUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931342;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0wZGQkuByN1jEnj1FHtrN/anKCMdaxpPnZwYsUX7to=;
	b=lfGNvbUwMIJBm4ro9dIAETsnKDHtiJH75vRAQXoAYXZsg+JNe2r+qcQt7tMvqYGZUb7ZGx
	AZRCtC99hS1odqCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D5E8613C0D;
	Fri,  2 Oct 2026 08:55:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T19
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:27 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 18/32] ALSA: fm801: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:54:56 +0200
Message-ID: <20261002085517.693510-19-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002085517.693510-1-tiwai@suse.de>
References: <20261002085517.693510-1-tiwai@suse.de>
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
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/fm801.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/fm801.c b/sound/pci/fm801.c
index 9cc96b807dd7..507ea0fe22a9 100644
--- a/sound/pci/fm801.c
+++ b/sound/pci/fm801.c
@@ -1264,11 +1264,11 @@ static int snd_fm801_create(struct snd_card *card,
 	return 0;
 }
 
-static int __snd_card_fm801_probe(struct pci_dev *pci,
-				  const struct pci_device_id *pci_id)
+static int snd_card_fm801_probe(struct pci_dev *pci,
+				const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct fm801 *chip;
 	struct snd_opl3 *opl3;
 	int err;
@@ -1325,16 +1325,11 @@ static int __snd_card_fm801_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_card_fm801_probe(struct pci_dev *pci,
-				const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_card_fm801_probe(pci, pci_id));
-}
-
 static const unsigned char saved_regs[] = {
 	FM801_PCM_VOL, FM801_I2S_VOL, FM801_FM_VOL, FM801_REC_SRC,
 	FM801_PLY_CTRL, FM801_PLY_COUNT, FM801_PLY_BUF1, FM801_PLY_BUF2,
-- 
2.55.0

