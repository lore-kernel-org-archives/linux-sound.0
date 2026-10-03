Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41A6420483
	for <linux-sound@vger.kernel.org>; Sat,  3 Oct 2026 10:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791025083; cv=none; b=oeqhYrjXZZOAmyKXbeX1/+764xA3Ic4ksJgHan+sQGBEpevtCxuRZu33ZdL/YoZQ87Fz6VujqzSL4cvmnRRiuUIpQtCmKbBO4wzrbhEdwNhDjqcl7/mlIyXyfq4LBD1b4ydcbEowOvZDQMXNFjiwaFAi9uApQ2UqUcrLCNOBKbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791025083; c=relaxed/simple;
	bh=GCO4e05aiUxy5pWTbMKoPRDxHUzNXP+q2RLTaXb3LRM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=losagz1JGLeg/2zk/Mh679KFoCTQgIdj7gBFxUISX+3PesZj3Y8wnU9w0dmecGxAOxfWd93MY+gAnaFMyri4QBxrxomDHtayl1onoCHC/Q/BF18SAwqjToXIVVsct2qaMf3XK/BjUoPyGbQf6pimyOOsioKdFlOlDMq2s4utT3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ga5ekbiW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BkW9ZM5z; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=A9meNZMM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y12cE51C; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ga5ekbiW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BkW9ZM5z";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A9meNZMM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y12cE51C"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DC34821C61;
	Sat,  3 Oct 2026 10:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791025075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yJqNZ86H/quO1F4/8YUBzmItUmLc7W3aC+h3pcHgY44=;
	b=Ga5ekbiWe8lZcLcdhzYp0utyzpCXJoUtcNR02gkYA0jsEjznNRguAcbD81w+gXhv7HWqNo
	rmIzCc3Fk7be4jmCNE8png9e5krp/MuS4JYoXTkbw85l08q/3XZlqjVmjaj/dXUlZMhuRf
	uxb2F3I+lCH9JDQHuHp+xu1kqDe1NAc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791025075;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yJqNZ86H/quO1F4/8YUBzmItUmLc7W3aC+h3pcHgY44=;
	b=BkW9ZM5zL07a2y79t8GuJw4/wSAf6uVsmuRTj5WAoiJgcTUqn2KPFZsi5roj0ZJ+iCcTH8
	rD0weF5bHXx33YAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=A9meNZMM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=y12cE51C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791025070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yJqNZ86H/quO1F4/8YUBzmItUmLc7W3aC+h3pcHgY44=;
	b=A9meNZMMVwafmR3wRLqgsuPbqELIP1sIDYy3vshNeKBUzoB8ehFDqlIJIzv6SuycdDPRBJ
	Ea2Pb/PZ0C0N4j29U+MrHDLxD2wNjV379KbOr+u/llcdKczgpFAq69Rz4g4BtvACqKWPRb
	RdfsjIq1Je682UHxB+NAjaRHgCHgz1Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791025070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yJqNZ86H/quO1F4/8YUBzmItUmLc7W3aC+h3pcHgY44=;
	b=y12cE51CJZgWxvDP2q6XT6pfytcitmgkQl4SpAA5rYbpJKLo3BZr1uowwPmY6dH9g/eLGS
	/xgu4qMRzfmrI+DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB1DE13888;
	Sat,  3 Oct 2026 10:57:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rc1+HaXfwGosCAAAD6G6ig:T10
	(envelope-from <tiwai@suse.de>); Sat, 03 Oct 2026 10:57:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 9/9] ALSA: sparc: dbri: Use devres card management
Date: Sat,  3 Oct 2026 12:57:16 +0200
Message-ID: <20261003105719.1070427-10-tiwai@suse.de>
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
X-Rspamd-Queue-Id: DC34821C61
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

The dbri driver's remove callback is nothing but a simple
snd_card_free() call in addition to the snd_dbri_free() call, and the
latter can be gracefully handled by card's private_free callback.

For the code simplification, let's use the devres for managing the
card.  Now the card is created via snd_devm_card_new() that is
auto-cleaned up at probe for errors.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/sparc/dbri.c | 37 ++++++++++++++-----------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/sound/sparc/dbri.c b/sound/sparc/dbri.c
index ccaa36525f8d..9fad4102dc70 100644
--- a/sound/sparc/dbri.c
+++ b/sound/sparc/dbri.c
@@ -2576,11 +2576,16 @@ static void snd_dbri_free(struct snd_dbri *dbri)
 				  (void *)dbri->dma, dbri->dma_dvma);
 }
 
+static void dbri_card_free(struct snd_card *card)
+{
+	snd_dbri_free(card->private_data);
+}
+
 static int dbri_probe(struct platform_device *op)
 {
 	struct snd_dbri *dbri;
 	struct resource *rp;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	static int dev;
 	int irq;
 	int err;
@@ -2598,8 +2603,8 @@ static int dbri_probe(struct platform_device *op)
 		return -ENODEV;
 	}
 
-	err = snd_card_new(&op->dev, index[dev], id[dev], THIS_MODULE,
-			   sizeof(struct snd_dbri), &card);
+	err = snd_devm_card_new(&op->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(struct snd_dbri), &card);
 	if (err < 0)
 		return err;
 
@@ -2609,21 +2614,20 @@ static int dbri_probe(struct platform_device *op)
 	sprintf(card->longname, "%s at 0x%02lx:0x%016llx, irq %d",
 		card->shortname,
 		rp->flags & 0xffL, (unsigned long long)rp->start, irq);
+	card->private_free = dbri_card_free;
 
 	err = snd_dbri_create(card, op, irq, dev);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	dbri = card->private_data;
 	err = snd_dbri_pcm(card);
 	if (err < 0)
-		goto _err;
+		return err;
 
 	err = snd_dbri_mixer(card);
 	if (err < 0)
-		goto _err;
+		return err;
 
 	/* /proc file handling */
 	snd_dbri_proc(card);
@@ -2631,27 +2635,15 @@ static int dbri_probe(struct platform_device *op)
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto _err;
+		return err;
 
 	printk(KERN_INFO "audio%d at %p (irq %d) is DBRI(%c)+CS4215(%d)\n",
 	       dev, dbri->regs,
 	       dbri->irq, op->dev.of_node->name[9], dbri->mm.version);
 	dev++;
 
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
-
-_err:
-	snd_dbri_free(dbri);
-	snd_card_free(card);
-	return err;
-}
-
-static void dbri_remove(struct platform_device *op)
-{
-	struct snd_card *card = dev_get_drvdata(&op->dev);
-
-	snd_dbri_free(card->private_data);
-	snd_card_free(card);
 }
 
 static const struct of_device_id dbri_match[] = {
@@ -2672,7 +2664,6 @@ static struct platform_driver dbri_sbus_driver = {
 		.of_match_table = dbri_match,
 	},
 	.probe		= dbri_probe,
-	.remove		= dbri_remove,
 };
 
 module_platform_driver(dbri_sbus_driver);
-- 
2.55.0

