Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572DE44AB76
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931337; cv=none; b=t5IyMmBPzdKOpTDZEcoQldenMgtaOK8NiRL7lHJRTdldtHGf3ae5kSvPZ7V0RBi7lfq3SXlBChJ1n/8t0DxSEzoKBKYcnMnAxpGZ3M0y5xqqW3rP0fGHis89geP9CahdaAyHyei4xojLRynjp624vLI6V5C5i4oYIG23XV/w3Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931337; c=relaxed/simple;
	bh=7joiBNuz/ofGFdYkJNCNVIYFbRL3SopnwJQNpy5US8E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S7ridNydA4oOHnNbIZldlnentV9JRAF0r3Hg5dsyjCFjHCP8QUybNn7lo8ikV2WKA/tY5XfduDEOv9xAW/plxSaZbJ2UAYCR8zpkKxLeMprjFqyAeDcw85JKvczeuTyqZtOjj1UsAvvOJUN8/Lad+WRY4UerL1OaByQNC84xQOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oAnSzmpi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=816hkGQN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jB686wf3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aUOg3bgx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oAnSzmpi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="816hkGQN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jB686wf3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aUOg3bgx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 04BDC21F3B;
	Fri,  2 Oct 2026 08:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vzdN3rzZz39lfjBsN8gUmyp2v8Kul234Di9olPTgKxw=;
	b=oAnSzmpilVnNFULUyTUjvIz3sXHW5YF4o3hTcjTamrqZZye6ANpZg/gC1r4xsv8SMJ0FdI
	VITIDDoC87H+tbWXIPsP8aT6g0QAWeo4KcUaPpsL3c1lbSP8N9VyaABgkmg+CtZczzBz5O
	CK9+ag8eMwhQBn3FKsTkk/Gm1/8h0N8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931330;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vzdN3rzZz39lfjBsN8gUmyp2v8Kul234Di9olPTgKxw=;
	b=816hkGQNRp/nZ9QgoNLn49IL07ByTZrq319wzGiFLTXH3SBIE3Kd9LMklZ15cLSkTRGe6D
	jPoFQx7QPPzxGFCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vzdN3rzZz39lfjBsN8gUmyp2v8Kul234Di9olPTgKxw=;
	b=jB686wf3TtoIuiR1I8wVHH+iADnUv9fzT1Gnjzgyv1WXYqob3rdwThkImaiAZYl3NGA/73
	tV7TgMb0eh41R2ATA3Ti/5cTZYFzCE9g4VwIHB1Y/7z56ntjwtELfUKvzuDblayusPV7r7
	YP77o21K5VlyeSbaQ9DId9a5bb9uZc4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vzdN3rzZz39lfjBsN8gUmyp2v8Kul234Di9olPTgKxw=;
	b=aUOg3bgx6QrEBrO+IA5KLWYVtu5Dbg3otIoxg8lprEok29RfaNXFkHLSMIcJ5yxop57uNT
	s3oWdmfCF2IH4rCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9097D13BFE;
	Fri,  2 Oct 2026 08:55:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T3
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 02/32] ALSA: sc6000: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:54:40 +0200
Message-ID: <20261002085517.693510-3-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sc6000.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/isa/sc6000.c b/sound/isa/sc6000.c
index cd3a63c7c2a7..f75533fe03a4 100644
--- a/sound/isa/sc6000.c
+++ b/sound/isa/sc6000.c
@@ -572,14 +572,14 @@ static void snd_sc6000_free(struct snd_card *card)
 		sc6000_setup_board(card->dev, sc6000->vport, 0);
 }
 
-static int __snd_sc6000_probe(struct device *devptr, unsigned int dev)
+static int snd_sc6000_probe(struct device *devptr, unsigned int dev)
 {
 	static const int possible_irqs[] = { 5, 7, 9, 10, 11, -1 };
 	static const int possible_dmas[] = { 1, 3, 0, -1 };
 	int err;
 	int xirq = irq[dev];
 	int xdma = dma[dev];
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct snd_sc6000 *sc6000;
 	struct snd_wss *chip;
 	struct snd_opl3 *opl3;
@@ -696,14 +696,10 @@ static int __snd_sc6000_probe(struct device *devptr, unsigned int dev)
 		return err;
 
 	dev_set_drvdata(devptr, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
 }
 
-static int snd_sc6000_probe(struct device *devptr, unsigned int dev)
-{
-	return snd_card_free_on_error(devptr, __snd_sc6000_probe(devptr, dev));
-}
-
 #ifdef CONFIG_PM
 static int snd_sc6000_suspend(struct device *devptr, unsigned int dev,
 			      pm_message_t state)
-- 
2.55.0

