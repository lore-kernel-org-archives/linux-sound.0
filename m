Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432E44E0B63
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 15:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953670; cv=none; b=UCnbtBiL99tEoh/RYDKo3IAHLo2VMjrzbH6gRjenHbQcrCa2VdtEDlQXLhqCDhfjrPxrneQETvDrkuczVO1p9Q2wMlUynUy0Lp7/fgn6EkFiXm5pvVC1Hr43RsEgzTZuBXeRizG/inRwRotMZxLE9YB4vfxEa8pAfNbC8EasqpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953670; c=relaxed/simple;
	bh=7Txa8vN/rN8gVkvGR+TcPaFhA9EPR0KSZp8ziNzETFI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d7brM9VpcHF2cYGvsnKNwovNMUlA0wh2RLUryf1e+tircB3E1OIO8TtRCKR+x0IJD3djZKjwrFNThUlSd16kn3URngW9aHcO2BfLyEW2qB4dciT5JXBy7F82lcfJKYziDgP6FjKs4OCkVi8cqgDo8uQNjNRTdqW85gohMXjXyJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tHWiWMwX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KRozYBZc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rcSkLy95; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m2+998Sg; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tHWiWMwX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KRozYBZc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rcSkLy95";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m2+998Sg"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5C75321EB4;
	Fri,  2 Oct 2026 15:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790953662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Se5/r4wEU6zfh8iZvZCOLfayongm2fhVeTI7Rd9eqfc=;
	b=tHWiWMwXs4pam/wm46hhqBN/ah/GLgiwAfEToEHII4Frlq+aZMbGJTXtYBe2WDvdrsX26k
	Img220ccAI8DmiQR6UTJX4peLJMLTuISKiOKkMQAmGXB7fVBDKE4trm09FXSF56ulMdUnP
	JuJuHxq9nFm9mgfdjzcgvfngg8qVllQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790953662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Se5/r4wEU6zfh8iZvZCOLfayongm2fhVeTI7Rd9eqfc=;
	b=KRozYBZc1q/TpPprnYPeCi154J6OowwpdJyy5biXJur9RKkYve9lpC7qVUoz8M51V7pIBg
	m//EeUH3K4Yon5Dg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790953658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Se5/r4wEU6zfh8iZvZCOLfayongm2fhVeTI7Rd9eqfc=;
	b=rcSkLy95f+GbH92ggsc49ORJmfqjSdU8ZjmMraOtZavuUa7C1GTloi4ooact+61vsWI/D1
	diQfEwYb9hczW7MUMuTiLgomCAo3/Q5hP3lM0AdaJ9zu7CP6BCTI5G7TQfIJR8A3NH8pE8
	yUjDcZJ/kKTq4F6EB0egbCQVocEivds=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790953658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Se5/r4wEU6zfh8iZvZCOLfayongm2fhVeTI7Rd9eqfc=;
	b=m2+998SgAKanzra3luXJP/O7iReWJLcSs42nuS/h6oX1QSGD2M/7LKTRVHOT5Ox2HOBUYN
	T25lrvmbYNpUgCDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F1453139D5;
	Fri,  2 Oct 2026 15:07:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bn6aIrnIv2qpZwAAD6G6ig:T3
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 15:07:37 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/9] ALSA: aw2: Avoid manual calls of snd_card_free() at probe card error handling
Date: Fri,  2 Oct 2026 17:07:24 +0200
Message-ID: <20261002150733.880051-3-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002150733.880051-1-tiwai@suse.de>
References: <20261002150733.880051-1-tiwai@suse.de>
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
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Instead of the manual calls of snd_card_free() at probe error
handling, use the auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/aw2/aw2-alsa.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/pci/aw2/aw2-alsa.c b/sound/pci/aw2/aw2-alsa.c
index 60a87322eae4..513249b9bb78 100644
--- a/sound/pci/aw2/aw2-alsa.c
+++ b/sound/pci/aw2/aw2-alsa.c
@@ -251,7 +251,7 @@ static int snd_aw2_probe(struct pci_dev *pci,
 			 const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct aw2 *chip;
 	int err;
 
@@ -273,7 +273,7 @@ static int snd_aw2_probe(struct pci_dev *pci,
 	/* (3) Create main component */
 	err = snd_aw2_create(card, pci);
 	if (err < 0)
-		goto error;
+		return err;
 
 	/* initialize mutex */
 	mutex_init(&chip->mtx);
@@ -292,17 +292,14 @@ static int snd_aw2_probe(struct pci_dev *pci,
 	/* (6) Register card instance */
 	err = snd_card_register(card);
 	if (err < 0)
-		goto error;
+		return err;
 
 	/* (7) Set PCI driver data */
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 
 	dev++;
 	return 0;
-
- error:
-	snd_card_free(card);
-	return err;
 }
 
 /* open callback */
-- 
2.55.0

