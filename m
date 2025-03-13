Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE4C269AE6
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741885686; cv=none; b=AQarKoUM9jy944DyMfuAjuzGWczeV5U9vyDQfmILqtvAdRwSGDTbagnXweb+CHE3TPPdsIVRdiFFe+Z3NyvF3FUVd9laO1TrRdj93Qq6ZKn7lVxHXYp0HfM4Qs4sFJcG/8R7bOvSVKkMJR2Us+iKi9ikLii5nyK7j75i0+JIOx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741885686; c=relaxed/simple;
	bh=O/2pjy3caht/eRp14YugfQBYwgyo7A36Z959K0PDTtc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ecWAU8wh/fVR/pYjbdkYgmEB4hO/C0cFapYm7GrD4Czw+4C9i4zYSj/w5qrgIA426MSdugBS760FlXdNem4YVC1wdlrJRhFMYbQqkJH87Pziw4IwXn7beDF+kY3biqB/jfEvNayyKplIUSJ9zop4ej8CLAGUrw7vHDfVShLsdxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wzFuPlXb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=D1IIzbVO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wzFuPlXb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=D1IIzbVO; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wzFuPlXb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D1IIzbVO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wzFuPlXb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D1IIzbVO"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2B6E5211BF;
	Thu, 13 Mar 2025 17:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741885657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wxi2Ldr2u5AQn9M4NE3ra5sfPIza4BjjEG15cn0c8kY=;
	b=wzFuPlXbymkJZLYiKjH/xnb3S/EZlaM8VqYZTFdKzWlRCGskfQDIGw+mxtqEwhOmJyTtjx
	1xsfmFKK5A7M1yj/UazqL3vV3XyIexteFMUg8ruCrJF7TeBSmqo10jtXxCye0qIykFT7Zk
	uF8k3Ggkz5fBawc+G/fnRh7t2WUPWdo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741885657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wxi2Ldr2u5AQn9M4NE3ra5sfPIza4BjjEG15cn0c8kY=;
	b=D1IIzbVOE8pdPw31TiHsQE9p/Sp5B7nChSjyj6vqC2wQykMlBr/DCL2tOYZ3ioMqXLUik8
	Nz+bKFjXaSXBbADQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741885657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wxi2Ldr2u5AQn9M4NE3ra5sfPIza4BjjEG15cn0c8kY=;
	b=wzFuPlXbymkJZLYiKjH/xnb3S/EZlaM8VqYZTFdKzWlRCGskfQDIGw+mxtqEwhOmJyTtjx
	1xsfmFKK5A7M1yj/UazqL3vV3XyIexteFMUg8ruCrJF7TeBSmqo10jtXxCye0qIykFT7Zk
	uF8k3Ggkz5fBawc+G/fnRh7t2WUPWdo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741885657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wxi2Ldr2u5AQn9M4NE3ra5sfPIza4BjjEG15cn0c8kY=;
	b=D1IIzbVOE8pdPw31TiHsQE9p/Sp5B7nChSjyj6vqC2wQykMlBr/DCL2tOYZ3ioMqXLUik8
	Nz+bKFjXaSXBbADQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 11A37139D2;
	Thu, 13 Mar 2025 17:07:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QLgTA9kQ02ciOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:07:37 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 8/9] ALSA: vx222: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Thu, 13 Mar 2025 18:07:26 +0100
Message-ID: <20250313170731.26943-9-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313170731.26943-1-tiwai@suse.de>
References: <20250313170731.26943-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer DEFINE_SIMPLE_DEV_PM_OPS() macro instead of
SIMPLE_DEV_PM_OPS() together with pm_ptr(), which makes
CONFIG_PM_SLEEP ifdefs superfluous.

Merely a cleanup, there should be no actual code change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/vx222/vx222.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/pci/vx222/vx222.c b/sound/pci/vx222/vx222.c
index 468a6a20dc1e..fdb039896205 100644
--- a/sound/pci/vx222/vx222.c
+++ b/sound/pci/vx222/vx222.c
@@ -204,7 +204,6 @@ static int snd_vx222_probe(struct pci_dev *pci,
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int snd_vx222_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
@@ -221,18 +220,14 @@ static int snd_vx222_resume(struct device *dev)
 	return snd_vx_resume(&vx->core);
 }
 
-static SIMPLE_DEV_PM_OPS(snd_vx222_pm, snd_vx222_suspend, snd_vx222_resume);
-#define SND_VX222_PM_OPS	&snd_vx222_pm
-#else
-#define SND_VX222_PM_OPS	NULL
-#endif
+static DEFINE_SIMPLE_DEV_PM_OPS(snd_vx222_pm, snd_vx222_suspend, snd_vx222_resume);
 
 static struct pci_driver vx222_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_vx222_ids,
 	.probe = snd_vx222_probe,
 	.driver = {
-		.pm = SND_VX222_PM_OPS,
+		.pm = pm_ptr(&snd_vx222_pm),
 	},
 };
 
-- 
2.43.0

