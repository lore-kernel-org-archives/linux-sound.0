Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B75980025
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321121; cv=none; b=lbjigCw3tGexr6z5GbTOtBu/T6titbu/uL1En7gWhWdCoy+5WcOhtvX329e2BuxB/G4YhdFGPamj7nItJ2If1nFx/ynEHgc6tL7T4jbHZRPnw70jhznyEHpimyplDp92dRqJsbJJhgVGpE7HN5C1dZaV/eC/Za5mCnjhsDUUF1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321121; c=relaxed/simple;
	bh=NADiDpOHVPGkUPdX+RtRYzKOE77wofYnm2SQ6UONfiM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PjrKJWbvEYQZr+8BdcueGxHbxLvQ8OtWnaqOxsIW8amypfA2fiYZbSbZhHFtklLqMpldBZ7gRCDseBDlPfPWg27F98fHTjp2SDarJNQBGWRORfYhiJIFRWRoM3yvsD21aZvkyncsIRTiVSu8jIsBUUysA/gnEg3j1nUGjjBEOPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JxLBwYhG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=B4sRFey5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JxLBwYhG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=B4sRFey5; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JxLBwYhG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B4sRFey5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JxLBwYhG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B4sRFey5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 44C681F78B;
	Wed,  7 Feb 2024 15:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UFiBIN5aqjHkHLH2HbX1vUuPotltfIbfJ84MkeIOIr4=;
	b=JxLBwYhG1dsjE+vyHiCwD2C5/K3Ko4u/rXCkE4HW9QYox3qfs5FSNuoAn0mUWbEMnNmcqC
	9T28WeN+nZbO9XjOYyc7LUeyafY1B/vsfv4+qn6UzDe2Ai6Nm/UNqUsGKaaxJWUQaepjSO
	XA4LkvBbdq5QW5bRQP42cwzQLEwDfJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UFiBIN5aqjHkHLH2HbX1vUuPotltfIbfJ84MkeIOIr4=;
	b=B4sRFey5fWAsBVv8FTDA8BcFDqpDZtlht5OzMHId8K9koUoC6dzXNubud6XOdO89Yo5flK
	zZmSHcndzajdfJAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UFiBIN5aqjHkHLH2HbX1vUuPotltfIbfJ84MkeIOIr4=;
	b=JxLBwYhG1dsjE+vyHiCwD2C5/K3Ko4u/rXCkE4HW9QYox3qfs5FSNuoAn0mUWbEMnNmcqC
	9T28WeN+nZbO9XjOYyc7LUeyafY1B/vsfv4+qn6UzDe2Ai6Nm/UNqUsGKaaxJWUQaepjSO
	XA4LkvBbdq5QW5bRQP42cwzQLEwDfJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UFiBIN5aqjHkHLH2HbX1vUuPotltfIbfJ84MkeIOIr4=;
	b=B4sRFey5fWAsBVv8FTDA8BcFDqpDZtlht5OzMHId8K9koUoC6dzXNubud6XOdO89Yo5flK
	zZmSHcndzajdfJAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 23ED3139D8;
	Wed,  7 Feb 2024 15:51:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4KY/Bx6nw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:51:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 02/29] ALSA: dummy: Replace with DEFINE_SIPMLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:13 +0100
Message-Id: <20240207155140.18238-3-tiwai@suse.de>
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
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JxLBwYhG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=B4sRFey5
X-Spamd-Result: default: False [4.19 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.50)[79.94%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 4.19
X-Rspamd-Queue-Id: 44C681F78B
X-Spam-Level: ****
X-Spam-Flag: NO
X-Spamd-Bar: ++++

Use the	new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for code-simplification.  We need no longer CONFIG_PM_SLEEP ifdefs.
Just a cleanup, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/dummy.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index 4317677ba24a..52ff6ac3f743 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -1098,7 +1098,6 @@ static int snd_dummy_probe(struct platform_device *devptr)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int snd_dummy_suspend(struct device *pdev)
 {
 	struct snd_card *card = dev_get_drvdata(pdev);
@@ -1115,11 +1114,7 @@ static int snd_dummy_resume(struct device *pdev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(snd_dummy_pm, snd_dummy_suspend, snd_dummy_resume);
-#define SND_DUMMY_PM_OPS	&snd_dummy_pm
-#else
-#define SND_DUMMY_PM_OPS	NULL
-#endif
+static DEFINE_SIMPLE_DEV_PM_OPS(snd_dummy_pm, snd_dummy_suspend, snd_dummy_resume);
 
 #define SND_DUMMY_DRIVER	"snd_dummy"
 
@@ -1127,7 +1122,7 @@ static struct platform_driver snd_dummy_driver = {
 	.probe		= snd_dummy_probe,
 	.driver		= {
 		.name	= SND_DUMMY_DRIVER,
-		.pm	= SND_DUMMY_PM_OPS,
+		.pm	= &snd_dummy_pm,
 	},
 };
 
-- 
2.35.3

