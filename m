Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ED445D926
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931346; cv=none; b=K+WiMsxJ6A7EvPa6RggJDQV+YHmiIU1jgiesT+thtp1c4YFZOszPHjEORlv2axB0F0lRr8VUQF8+4EPLAcJIzf//CB+sQeNLSAe/sRbZZJSUdkNeVQ3nXG4H2nVSG93JAhNRyy8EmRbR8hX1kWVOJuhVm4ERr2Y9yvt2iwXjAmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931346; c=relaxed/simple;
	bh=KDpRfVd1llNtYJZlEgQRdElHweFTWXK+lzZqOzawTs4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J4degDsY/Vlr8MDJc24yt+0U04/M/eUxzYEpziXa3e43wKj1kbjXjgrwLzbjfDk1Fu3QB2hjP9iMBafy71F4AC6HNN2JZacznFZhljtZygz2TR39YoiDPuKMJzF/S6IY9KDyi8YjflxeQo/SxmtYznQ8odNTaj/h7Fd/ANFHq/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XI3zLYoD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Vn1JxJAN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OCUE5EsL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gXqiotq9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XI3zLYoD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Vn1JxJAN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OCUE5EsL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gXqiotq9"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9B79721F4A;
	Fri,  2 Oct 2026 08:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uuxlaad1Epnoofos7Te/efaIxPTp+XvB0PIDXFiVsG0=;
	b=XI3zLYoDYcQkppevVUNPbRL5t7vc9QPwOKLfbLmeGlAYWOArn8a9V8uo7exUoPG+Quomff
	QXnLMpz7gwGGKEr8gbDVS6mSPL29bqRIUZo6R4V83fWroiS26HWUAfvEF7IOkqr6xlwfwk
	5V120qMO2A/4qMPbwPNoqCNs6c79Hbc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931338;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uuxlaad1Epnoofos7Te/efaIxPTp+XvB0PIDXFiVsG0=;
	b=Vn1JxJANEuC9A5WXkyMjUTqMCPrAMFcLc+wjBUMZU6vfCsqUQ7oV84ZBwgIC/7MJPEwGyF
	/UhE/jDJFafv/5Dg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931334; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uuxlaad1Epnoofos7Te/efaIxPTp+XvB0PIDXFiVsG0=;
	b=OCUE5EsLDlMRsKEaXu5aQyvgMsVD2h6xjDGsu1g8yxtvgTDDBS/2UOGh37a3mFasy97Z6l
	vfwsgA1XjRKXAl02epAfS2rDkwv682IIPxDE2LTcKCbS6CV65Q3f9/34bY8MArWiwqlHXE
	VqxwW1sCtMvzWAq9/sRZoVSpxeO9s1k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931334;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uuxlaad1Epnoofos7Te/efaIxPTp+XvB0PIDXFiVsG0=;
	b=gXqiotq9fgtR4ciJhjOZs2/AyUWKF3ZAgG/yHfq9YiJJJFaNw3MrPV7O6geZFAi74T59SD
	G85WqkU8EKF4vkCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CD0DE13C06;
	Fri,  2 Oct 2026 08:55:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T12
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 11/32] ALSA: cs4281: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:54:49 +0200
Message-ID: <20261002085517.693510-12-tiwai@suse.de>
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
 sound/pci/cs4281.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
index f51f4bb63766..985d80d5c87d 100644
--- a/sound/pci/cs4281.c
+++ b/sound/pci/cs4281.c
@@ -1811,11 +1811,11 @@ static void snd_cs4281_opl3_command(struct snd_opl3 *opl3, unsigned short cmd,
 	udelay(30);
 }
 
-static int __snd_cs4281_probe(struct pci_dev *pci,
-			      const struct pci_device_id *pci_id)
+static int snd_cs4281_probe(struct pci_dev *pci,
+			    const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct cs4281 *chip;
 	struct snd_opl3 *opl3;
 	int err;
@@ -1868,16 +1868,11 @@ static int __snd_cs4281_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_cs4281_probe(struct pci_dev *pci,
-			    const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_cs4281_probe(pci, pci_id));
-}
-
 /*
  * Power Management
  */
-- 
2.55.0

