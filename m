Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F1641F5FB
	for <linux-sound@vger.kernel.org>; Sat,  3 Oct 2026 10:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791025083; cv=none; b=BhELUQ+4qy30Mj6Ab+rTOeLHDsun7F1Ycs2LaZN5OkbRUBfVgpI49sFXOCTgXZkTcQXT0xHMWh8YlRCQIfNH5u5f3lMapHc1oRIsDIVkXPL9jBS51OR9QGKd4V/TP4JpXWPQzaSSgLi/slaQSydQBBcydvRDrl/W3o01C+YsVi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791025083; c=relaxed/simple;
	bh=6ZbAa03qJLuR1kkrasS6KoxUmlzlT9DYOVLUCFYSVu8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iLwAVTYLsAdb7NydDjhc5sQ5d2ueqUXpDknKtn6rmjbKWfxQ60hMAsA9Qpi0RT3JB24Uwr2HTv4B9Bkjrgfdvus/XmDyLs5QwyWOVxfmR9SNI9+lchVvfbWtb7jrYgx8YC2h1GSSazlzOqZLyV2gUevdNDxlwjisAN7nFCBLvVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uK7kp96s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=b+cgDkms; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WR3v1E8Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FzeJPVBj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uK7kp96s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b+cgDkms";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WR3v1E8Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FzeJPVBj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D462F1FED3;
	Sat,  3 Oct 2026 10:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791025075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8mqkHuj8IrVS5N+ShlW0C+R4OL8LwtSBrRDXbOcerGk=;
	b=uK7kp96sr1UozSF8d9Au/qBgM+aD6IlQhyaTVJU0uwgR+jWhDQTwBf9t8PJ518EzFng2D+
	vKyDdp+QMVEQ/sk+bcA3F/q1iys8FfmcPi/G27dltISRHfoz8ZlzVsPz0TGQxzHNEBg296
	lzi4rAfDvrqc8hp8hRR788qYEq48vCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791025075;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8mqkHuj8IrVS5N+ShlW0C+R4OL8LwtSBrRDXbOcerGk=;
	b=b+cgDkms3vSt2icc0kIkWUSCxiJRbOHajRs/xMhB6tJ/hKFx4Y0f5kEKXegtCAi2p+74T8
	My1ULt6joehw1jCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WR3v1E8Z;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FzeJPVBj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791025070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8mqkHuj8IrVS5N+ShlW0C+R4OL8LwtSBrRDXbOcerGk=;
	b=WR3v1E8ZaYIw5SftUKEjDUsHdonRlzjMBRko3nm63Zw65Xvuad0KE52TGBH+6O9XOcRnTJ
	y3pY7SmpSmdtRfweh3LH0mxlorRDF521XIz5lJ9RYuQFTdXImm3KASWziy0uVM5hcjfTPV
	d29/yj5tMii/brCKMcxwz0FfYx6ISJQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791025070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8mqkHuj8IrVS5N+ShlW0C+R4OL8LwtSBrRDXbOcerGk=;
	b=FzeJPVBjtXt0Os3cFNaKgcWKydhlIAPVSpYS40fTpYgN+NOSb7jvQCt0dr6fdZCleHVNjH
	vqTyFW/TJb1OPuCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ADD4313886;
	Sat,  3 Oct 2026 10:57:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rc1+HaXfwGosCAAAD6G6ig:T9
	(envelope-from <tiwai@suse.de>); Sat, 03 Oct 2026 10:57:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 8/9] ALSA: sparc: cs4231: Use devres card management
Date: Sat,  3 Oct 2026 12:57:15 +0200
Message-ID: <20261003105719.1070427-9-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: D462F1FED3
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

The cs4231 driver's remove callback is nothing but a simple
snd_card_free() call, so let's use the devres for managing the card,
for simplifying the handling.

Now the card is created via snd_devm_card_new() that is auto-cleaned
up at probe for errors.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/sparc/cs4231.c | 49 +++++++++++++++++++-------------------------
 1 file changed, 21 insertions(+), 28 deletions(-)

diff --git a/sound/sparc/cs4231.c b/sound/sparc/cs4231.c
index d9e5cca94c73..0489eac165c9 100644
--- a/sound/sparc/cs4231.c
+++ b/sound/sparc/cs4231.c
@@ -1497,8 +1497,8 @@ static int cs4231_attach_begin(struct platform_device *op,
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&op->dev, index[dev], id[dev], THIS_MODULE,
-			   sizeof(struct snd_cs4231), &card);
+	err = snd_devm_card_new(&op->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(struct snd_cs4231), &card);
 	if (err < 0)
 		return err;
 
@@ -1519,28 +1519,24 @@ static int cs4231_attach_finish(struct snd_card *card)
 
 	err = snd_cs4231_pcm(card);
 	if (err < 0)
-		goto out_err;
+		return err;
 
 	err = snd_cs4231_mixer(card);
 	if (err < 0)
-		goto out_err;
+		return err;
 
 	err = snd_cs4231_timer(card);
 	if (err < 0)
-		goto out_err;
+		return err;
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto out_err;
+		return err;
 
 	dev_set_drvdata(&chip->op->dev, chip);
 
 	dev++;
 	return 0;
-
-out_err:
-	snd_card_free(card);
-	return err;
 }
 
 #ifdef SBUS_SUPPORT
@@ -1771,7 +1767,7 @@ static int snd_cs4231_sbus_create(struct snd_card *card,
 static int cs4231_sbus_probe(struct platform_device *op)
 {
 	struct resource *rp = &op->resource[0];
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	int err;
 
 	err = cs4231_attach_begin(op, &card);
@@ -1785,12 +1781,14 @@ static int cs4231_sbus_probe(struct platform_device *op)
 		op->archdata.irqs[0]);
 
 	err = snd_cs4231_sbus_create(card, op, dev);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
-	return cs4231_attach_finish(card);
+	err = cs4231_attach_finish(card);
+	if (err < 0)
+		return err;
+	card = NULL; /* probe succeeded, don't release as error */
+	return 0;
 }
 #endif
 
@@ -1968,7 +1966,7 @@ static int snd_cs4231_ebus_create(struct snd_card *card,
 
 static int cs4231_ebus_probe(struct platform_device *op)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	int err;
 
 	err = cs4231_attach_begin(op, &card);
@@ -1981,12 +1979,15 @@ static int cs4231_ebus_probe(struct platform_device *op)
 		op->archdata.irqs[0]);
 
 	err = snd_cs4231_ebus_create(card, op, dev);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
-	return cs4231_attach_finish(card);
+	err = cs4231_attach_finish(card);
+	if (err < 0)
+		return err;
+
+	card = NULL; /* probe succeeded, don't release as error */
+	return 0;
 }
 #endif
 
@@ -2004,13 +2005,6 @@ static int cs4231_probe(struct platform_device *op)
 	return -ENODEV;
 }
 
-static void cs4231_remove(struct platform_device *op)
-{
-	struct snd_cs4231 *chip = dev_get_drvdata(&op->dev);
-
-	snd_card_free(chip->card);
-}
-
 static const struct of_device_id cs4231_match[] = {
 	{
 		.name = "SUNW,CS4231",
@@ -2030,7 +2024,6 @@ static struct platform_driver cs4231_driver = {
 		.of_match_table = cs4231_match,
 	},
 	.probe		= cs4231_probe,
-	.remove		= cs4231_remove,
 };
 
 module_platform_driver(cs4231_driver);
-- 
2.55.0

