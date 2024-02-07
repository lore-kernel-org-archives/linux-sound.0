Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6347080027
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321122; cv=none; b=DlbA/bj86hWNKXT8CkTrMqWzOrfhGyhvBmwNsEC0OWMAGQvWIIZIZdHuzssEimra9DAwDhgd/KA5oJKxSkULoYdNHDpnyH1trCjPx8mkCopOVvy/iixDrlAcEqclOk19hNp2uqWl7xA1oxgABIoJ3qDv+gRMnac0PCrtEK+Q07k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321122; c=relaxed/simple;
	bh=QBjR7zL3zkjrgba6HruXpg6Cx60pNzlJj+MbMtehyzQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oVDgIoXG3VOWht6ORjakLODGPlAyvEzVAA6DPeKGauS+U4Qgor9jQPmPKVc/ZXVtTvZ1hAZdgcvoY8H7GNZ9bmUDfDgyXBsep0zMGKVdzdiKoRy+UaEBrln0B8PZmnDwDeqKeJToubIclWh7q/1ZnTRgDwNzxFt/1BzOZ87v+94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KEczlGdE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3/Tzwbz9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KEczlGdE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3/Tzwbz9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KEczlGdE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3/Tzwbz9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KEczlGdE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3/Tzwbz9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B7DBC1FBFB;
	Wed,  7 Feb 2024 15:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=In03LCVvKjdVVnOZxRHqmTh/otU4C0vSFFDZP/9P3ZU=;
	b=KEczlGdEBIQLzR/bmQZgfouxGONmnm7HSdu7xO0TjTHC8ZhYGsx7T5TObHDs/NFzvZV+a1
	XC0N9rk0df9ntjQon7XnF6faUIun5snOT7rqMYrgUOTb7ZmbR8NXwJ/zx8Kim3MYBvB/yZ
	3jEcuOcKhNAnFdtHYgFrzlHdPuzD3jc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=In03LCVvKjdVVnOZxRHqmTh/otU4C0vSFFDZP/9P3ZU=;
	b=3/Tzwbz9Sp2mjc542LpZOaGLdeUsntWQbh7I+rX+2ljR6sKTDK75M+1hOMuXAnQqYxSSil
	1Ujo4BFrWbFiPnBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=In03LCVvKjdVVnOZxRHqmTh/otU4C0vSFFDZP/9P3ZU=;
	b=KEczlGdEBIQLzR/bmQZgfouxGONmnm7HSdu7xO0TjTHC8ZhYGsx7T5TObHDs/NFzvZV+a1
	XC0N9rk0df9ntjQon7XnF6faUIun5snOT7rqMYrgUOTb7ZmbR8NXwJ/zx8Kim3MYBvB/yZ
	3jEcuOcKhNAnFdtHYgFrzlHdPuzD3jc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=In03LCVvKjdVVnOZxRHqmTh/otU4C0vSFFDZP/9P3ZU=;
	b=3/Tzwbz9Sp2mjc542LpZOaGLdeUsntWQbh7I+rX+2ljR6sKTDK75M+1hOMuXAnQqYxSSil
	1Ujo4BFrWbFiPnBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 98B53139B9;
	Wed,  7 Feb 2024 15:51:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KJjQIx6nw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:51:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 05/29] ALSA: als4000: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:16 +0100
Message-Id: <20240207155140.18238-6-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240207155140.18238-1-tiwai@suse.de>
References: <20240207155140.18238-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.69
X-Spamd-Result: default: False [3.69 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.01)[51.22%]
X-Spam-Flag: NO

Use the	new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for code-simplification.  We need no longer CONFIG_PM_SLEEP ifdefs.

For building properly, add the dummy functions for
snd_sbmixer_suspend/resume() functions, too.

Just a cleanup, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/sb.h  | 3 +++
 sound/pci/als4000.c | 9 ++-------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/include/sound/sb.h b/include/sound/sb.h
index f540339fb0c7..24970f36c38a 100644
--- a/include/sound/sb.h
+++ b/include/sound/sb.h
@@ -290,6 +290,9 @@ int snd_sbmixer_new(struct snd_sb *chip);
 #ifdef CONFIG_PM
 void snd_sbmixer_suspend(struct snd_sb *chip);
 void snd_sbmixer_resume(struct snd_sb *chip);
+#else
+static inline void snd_sbmixer_suspend(struct snd_sb *chip) {}
+static inline void snd_sbmixer_resume(struct snd_sb *chip) {}
 #endif
 
 /* sb8_init.c */
diff --git a/sound/pci/als4000.c b/sound/pci/als4000.c
index f33aeb692a11..022473594c73 100644
--- a/sound/pci/als4000.c
+++ b/sound/pci/als4000.c
@@ -936,7 +936,6 @@ static int snd_card_als4000_probe(struct pci_dev *pci,
 	return snd_card_free_on_error(&pci->dev, __snd_card_als4000_probe(pci, pci_id));
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int snd_als4000_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
@@ -968,18 +967,14 @@ static int snd_als4000_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(snd_als4000_pm, snd_als4000_suspend, snd_als4000_resume);
-#define SND_ALS4000_PM_OPS	&snd_als4000_pm
-#else
-#define SND_ALS4000_PM_OPS	NULL
-#endif /* CONFIG_PM_SLEEP */
+static DEFINE_SIMPLE_DEV_PM_OPS(snd_als4000_pm, snd_als4000_suspend, snd_als4000_resume);
 
 static struct pci_driver als4000_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_als4000_ids,
 	.probe = snd_card_als4000_probe,
 	.driver = {
-		.pm = SND_ALS4000_PM_OPS,
+		.pm = &snd_als4000_pm,
 	},
 };
 
-- 
2.35.3

