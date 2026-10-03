Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A212A41F5D1
	for <linux-sound@vger.kernel.org>; Sat,  3 Oct 2026 10:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791025075; cv=none; b=REUHCs7Qnd+aIah1ZlSXsnQpT4/zerlFfK150/QUnC3oTiKLlde8jiwn9ULoz7F0WZgd3Laj6XTTlb680DQPtGEwr0ySK7GtVAHo9kJ+5tzrrZhNqLBmqAyzkyU4wuyWmYJiZVteVY4QlI9vlqYtoa0gPMq3oLYSLP/iLzm3kQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791025075; c=relaxed/simple;
	bh=4pH9DA34XYII0kwSqoE4FcaXPs/w3buNnSqQG5iggE8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X8mJVRW6jYwwWkZpG/TFt+kESjZpaWqoDI1roL0mPhu/Ia6QMIgcj6TIoQkdPCacCj+Njq8OLz9BpZfL/UisLHjQcc+K2EJXrezrmmdczd+F3RbI27v6mJnGrKWEbrIQngjiGfFt0C9nnFcwH/+2DQESoE0JTmljIaAB6Rz5bjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zoHCi5vc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WKV+oKZS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hUGfYQ54; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SQ7Mo7Ow; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zoHCi5vc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WKV+oKZS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hUGfYQ54";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SQ7Mo7Ow"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B95F71FED1;
	Sat,  3 Oct 2026 10:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791025066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AJaxWNsICb+/jFI2xfbF55mZhWv8uYIg9rLYceT9bmg=;
	b=zoHCi5vczJdDTQ8UVkXrQi0UxYVDq0m7XRRPRsRuaTw8cKu0Cazc436TdjdAK2emNc4ACd
	tv4uwyuWaqRhNqxlyrgYNIRWmpsj6WZTZ3hv+P7LELDNvwR0tnLopI55DYXAHFCwSwh2G4
	feID52/bNO1Tz+mihrLqQhsKiNYFWQU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791025066;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AJaxWNsICb+/jFI2xfbF55mZhWv8uYIg9rLYceT9bmg=;
	b=WKV+oKZSdHubxlkkOnv3yTNZqJFTdSkTaEqsSabY+bcCVd7l+o2XJvqPJg2RtUKJ6YDF3m
	kPH/lz/KtGTuWoCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hUGfYQ54;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SQ7Mo7Ow
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791025062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AJaxWNsICb+/jFI2xfbF55mZhWv8uYIg9rLYceT9bmg=;
	b=hUGfYQ54ozV4JIWIIDYPx9WM07DYupmp5uaoJ6LRTe3c24R6YGhx6WqgHQBpssDc0Us4io
	XKCX/fAln8YxFnBwYF9P0NDi+b4YdF+enNR+nHQlL7Bg6FdKt9WopKCLDFImRSbtCbHrMb
	sfi/GwSH9Lf5DOH6X5cYjOO4HkgQdYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791025062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AJaxWNsICb+/jFI2xfbF55mZhWv8uYIg9rLYceT9bmg=;
	b=SQ7Mo7OwbP9j+LxOJ+f71b3Ff52z4K2e+HwozljY4nLkphldbv7WQb8vjngEObiN1kHO54
	qRYzCqdBcziv6iAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2CBCC13879;
	Sat,  3 Oct 2026 10:57:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rc1+HaXfwGosCAAAD6G6ig:T5
	(envelope-from <tiwai@suse.de>); Sat, 03 Oct 2026 10:57:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 4/9] ALSA: parisc: harmony: Use devres card management
Date: Sat,  3 Oct 2026 12:57:11 +0200
Message-ID: <20261003105719.1070427-5-tiwai@suse.de>
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
X-Rspamd-Queue-Id: B95F71FED1
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

The harmony driver's remove callback is nothing but a simple
snd_card_free() call, so let's use the devres for managing the card,
for simplifying the handling.

Now the card is created via snd_devm_card_new() that is auto-cleaned
up at probe for errors.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/parisc/harmony.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/sound/parisc/harmony.c b/sound/parisc/harmony.c
index a9625aedf2a4..6cdd09f5855b 100644
--- a/sound/parisc/harmony.c
+++ b/sound/parisc/harmony.c
@@ -897,24 +897,24 @@ static int __init
 snd_harmony_probe(struct parisc_device *padev)
 {
 	int err;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct snd_harmony *h;
 
-	err = snd_card_new(&padev->dev, index, id, THIS_MODULE, 0, &card);
+	err = snd_devm_card_new(&padev->dev, index, id, THIS_MODULE, 0, &card);
 	if (err < 0)
 		return err;
 
 	err = snd_harmony_create(card, padev, &h);
 	if (err < 0)
-		goto free_and_ret;
+		return err;
 
 	err = snd_harmony_pcm_init(h);
 	if (err < 0)
-		goto free_and_ret;
+		return err;
 
 	err = snd_harmony_mixer_init(h);
 	if (err < 0)
-		goto free_and_ret;
+		return err;
 
 	strscpy(card->driver, "harmony");
 	strscpy(card->shortname, "Harmony");
@@ -923,27 +923,17 @@ snd_harmony_probe(struct parisc_device *padev)
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto free_and_ret;
+		return err;
 
 	parisc_set_drvdata(padev, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
-
-free_and_ret:
-	snd_card_free(card);
-	return err;
-}
-
-static void __exit
-snd_harmony_remove(struct parisc_device *padev)
-{
-	snd_card_free(parisc_get_drvdata(padev));
 }
 
 static struct parisc_driver snd_harmony_driver __refdata = {
 	.name = "harmony",
 	.id_table = snd_harmony_devtable,
 	.probe = snd_harmony_probe,
-	.remove = __exit_p(snd_harmony_remove),
 };
 
 static int __init 
-- 
2.55.0

