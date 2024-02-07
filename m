Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046507FBDC
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321121; cv=none; b=PnyTbWSlFOZyJnPpCzZ+BkMYfxhQBHtncVRRPTUhlKD4N6saXOxdnTJVWbRKZ08Ozq6CtSm1XNXQJM/fq2CZwR/9WrsIpTYubEHFb2uGUQJRfon0eFu6UjNLxRYpjVMMHTecJZ4jLMDdoxCg34lQIDOsXfRD3qbrQhvEXqaQc0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321121; c=relaxed/simple;
	bh=u/Hmthk/oY2z641D7wxQQcp3OujBgVy5OagUF2XOscs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IIARgEMEhLq/DZIHXnBePIId2wD4hAugeTLLPCVuMCvyil1sLN1kEGO1DCaNwMte0a9IQb3BPOp1Wn0RkYEyu4elSU7H9kj+OMtbmGfUW+9uYkrde4mL2HLVHBJIIatiRK1gIBEcw0XFA1kbH3WbH7/1Y+1x6UX27C2B/4T+v20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V5ircxCY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GmvR9NM2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V5ircxCY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GmvR9NM2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V5ircxCY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GmvR9NM2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V5ircxCY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GmvR9NM2"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1D9AF222CF;
	Wed,  7 Feb 2024 15:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=90dOLoGPXIt4waCEstt1PSJ34YASOo9TwS+j775ujVc=;
	b=V5ircxCYXzKYiQFTc4rc73X6WuJa9AeKlnAxgHnbntQLE5240daM6TInFPiU9882I1e/tT
	IG8er14ii8Ja5itrmjQ7juWIEJ6nvQTXZ6fv5hjfiGH6tA5XPUXiVW6aYeko8AYGVxzYlb
	gbsCOUgOA8r0e3upLII0XT4VzVcKQrY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=90dOLoGPXIt4waCEstt1PSJ34YASOo9TwS+j775ujVc=;
	b=GmvR9NM2Cr7FGLWQm87lQpKE5VfHmVeAROPsnZaHY4d6A21QzsnGbYV5BLSGOCONxtvUJ8
	/yxPsCYdFEApzFAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=90dOLoGPXIt4waCEstt1PSJ34YASOo9TwS+j775ujVc=;
	b=V5ircxCYXzKYiQFTc4rc73X6WuJa9AeKlnAxgHnbntQLE5240daM6TInFPiU9882I1e/tT
	IG8er14ii8Ja5itrmjQ7juWIEJ6nvQTXZ6fv5hjfiGH6tA5XPUXiVW6aYeko8AYGVxzYlb
	gbsCOUgOA8r0e3upLII0XT4VzVcKQrY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=90dOLoGPXIt4waCEstt1PSJ34YASOo9TwS+j775ujVc=;
	b=GmvR9NM2Cr7FGLWQm87lQpKE5VfHmVeAROPsnZaHY4d6A21QzsnGbYV5BLSGOCONxtvUJ8
	/yxPsCYdFEApzFAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F04BC139B9;
	Wed,  7 Feb 2024 15:51:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UMWANx2nw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:51:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 01/29] ALSA: aloop: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:12 +0100
Message-Id: <20240207155140.18238-2-tiwai@suse.de>
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
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: *
X-Spam-Score: 1.07
X-Spamd-Result: default: False [1.07 / 50.00];
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
	 BAYES_HAM(-2.63)[98.36%]
X-Spam-Flag: NO

Use the new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for code-simplification.  We need no longer CONFIG_PM_SLEEP ifdefs.
Just a cleanup, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/aloop.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 1c65e0a3b13c..892c4e29c0a3 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -1830,7 +1830,6 @@ static int loopback_probe(struct platform_device *devptr)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int loopback_suspend(struct device *pdev)
 {
 	struct snd_card *card = dev_get_drvdata(pdev);
@@ -1847,11 +1846,7 @@ static int loopback_resume(struct device *pdev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(loopback_pm, loopback_suspend, loopback_resume);
-#define LOOPBACK_PM_OPS	&loopback_pm
-#else
-#define LOOPBACK_PM_OPS	NULL
-#endif
+static DEFINE_SIMPLE_DEV_PM_OPS(loopback_pm, loopback_suspend, loopback_resume);
 
 #define SND_LOOPBACK_DRIVER	"snd_aloop"
 
@@ -1859,7 +1854,7 @@ static struct platform_driver loopback_driver = {
 	.probe		= loopback_probe,
 	.driver		= {
 		.name	= SND_LOOPBACK_DRIVER,
-		.pm	= LOOPBACK_PM_OPS,
+		.pm	= &loopback_pm,
 	},
 };
 
-- 
2.35.3

