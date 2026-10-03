Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A349D41D4EF
	for <linux-sound@vger.kernel.org>; Sat,  3 Oct 2026 10:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791025075; cv=none; b=NauCbuYG+KDL7Sh/ufeHd3p4nwaggPy5uoQOoivAMz/VgOS4krJenEnQRpNaI81Ab59ma0HiFt4igukI9eqT4OJWFL+y3MXbzHW++F6Yw+dCClMyVwbPxbfFjDJKmek/8Em4H3c5IT9AR0OuxP+09R+xyjIhiT3AgihQAkRXyJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791025075; c=relaxed/simple;
	bh=9ieI59/n3lAp8MYRUyaTmXib1nqJ3hv/WggOWzApfoo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tKfNH/ofoFzfZDifE+qOn5Ye+cCGJQbFGNjjasRvbWvHIGIBn0mDf/hAk9L5edGj/sA25aOaJ/j2a9pUGEP70v56xcpVpLSrX9UwcR9658safGFn+KwhBUcGpAMiJ1C4OJKfFm1Xu1Z5wVz5iTDOSj4zxPhJpq8OjyugbAsHU7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bCfy2Rea; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f8G+g5u1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O2oE5rr4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iW1n+1xH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bCfy2Rea";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f8G+g5u1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O2oE5rr4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iW1n+1xH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5F6AC1FED0;
	Sat,  3 Oct 2026 10:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791025066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BXwVJEAU5dVfkE7OvCoSTly0y9a3rssJRzJFuyUwirc=;
	b=bCfy2Reacvt4OMqg6DyIdcU91WCNM+y+FTL6fWHRceY8bsfAcrMbSoIwtWiQBKtcA/LxR0
	eTfiD7RuLeUdy8OqAP34N7KgHKOotj/6PNA57Eo3+EzmToi3/11HarkMFOWfbKJrihcBBy
	PubUMMzCd5xD45Il5EI6PJ1HSanCbnI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791025066;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BXwVJEAU5dVfkE7OvCoSTly0y9a3rssJRzJFuyUwirc=;
	b=f8G+g5u1UvZjvPjHefZfX8z4cpjMHZz3/YPWSUhpt3mawbklSnOiMXBFjK3De2hAJqwFHF
	VKgDmzjjDbPSc9Dw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=O2oE5rr4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=iW1n+1xH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791025062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BXwVJEAU5dVfkE7OvCoSTly0y9a3rssJRzJFuyUwirc=;
	b=O2oE5rr4wWn3/2GWbZyrvk9dAz3Nk2CdsinmtqseYoMaYBf01apP6s/fJ5ZnK6hahYeeFi
	ui1fORQgBJx5Jcbed0S59GMG9rnAMq7b7eVmvv6gyTEqhRScqvg2thWvP4uBNQpqviWky5
	xdCJGrG0YSnBDz4IlC4yLlMCt7Lll3k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791025062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BXwVJEAU5dVfkE7OvCoSTly0y9a3rssJRzJFuyUwirc=;
	b=iW1n+1xHSeETBrWEtpCTdVk5hhfUXuoIsLmakgH8NBGEMdJ3tkRdGziNMBK7HwImhUYmn8
	xFD/NRbXV0Bsj9Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E13CA13874;
	Sat,  3 Oct 2026 10:57:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rc1+HaXfwGosCAAAD6G6ig:T3
	(envelope-from <tiwai@suse.de>); Sat, 03 Oct 2026 10:57:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/9] ALSA: mips: sgio2audio: Use devres card management
Date: Sat,  3 Oct 2026 12:57:09 +0200
Message-ID: <20261003105719.1070427-3-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003105719.1070427-1-tiwai@suse.de>
References: <20261003105719.1070427-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 5F6AC1FED0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

The sgio2audio driver's remove callback is nothing but a simple
snd_card_free() call, so let's use the devres for managing the card,
for simplifying the handling.

Now the card is created via snd_devm_card_new() that is auto-cleaned
up at probe for errors.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/mips/sgio2audio.c | 30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/sound/mips/sgio2audio.c b/sound/mips/sgio2audio.c
index 35648b0b97b9..25c1871f72c1 100644
--- a/sound/mips/sgio2audio.c
+++ b/sound/mips/sgio2audio.c
@@ -859,30 +859,24 @@ static int snd_sgio2audio_create(struct snd_card *card,
 
 static int snd_sgio2audio_probe(struct platform_device *pdev)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct snd_sgio2audio *chip;
 	int err;
 
-	err = snd_card_new(&pdev->dev, index, id, THIS_MODULE, 0, &card);
+	err = snd_devm_card_new(&pdev->dev, index, id, THIS_MODULE, 0, &card);
 	if (err < 0)
 		return err;
 
 	err = snd_sgio2audio_create(card, &chip);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	err = snd_sgio2audio_new_pcm(chip);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	err = snd_sgio2audio_new_mixer(chip);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	strscpy(card->driver, "SGI O2 Audio");
 	strscpy(card->shortname, "SGI O2 Audio");
@@ -892,24 +886,16 @@ static int snd_sgio2audio_probe(struct platform_device *pdev)
 		MACEISA_AUDIO3_MERR_IRQ);
 
 	err = snd_card_register(card);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
+
 	platform_set_drvdata(pdev, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
 }
 
-static void snd_sgio2audio_remove(struct platform_device *pdev)
-{
-	struct snd_card *card = platform_get_drvdata(pdev);
-
-	snd_card_free(card);
-}
-
 static struct platform_driver sgio2audio_driver = {
 	.probe	= snd_sgio2audio_probe,
-	.remove	= snd_sgio2audio_remove,
 	.driver	= {
 		.name	= "sgio2audio",
 	}
-- 
2.55.0

