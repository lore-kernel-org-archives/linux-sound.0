Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B71780024
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321121; cv=none; b=ewNum2Zt3t/+Gxy+u8HJORa8UFe8vTKOQzLvvRPFw66hdcdXeA07L7DqnBm3Fos8PvHNKJ2PBsp8dIVbggV79Mc47mxhZ3/tARbAHKH657R9N2ON8Y/jZHH2xR2mD+IE1mXifmZ6r5Y9Ex0+e1k4vbFGmDeRM0tjg1fDqNejS1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321121; c=relaxed/simple;
	bh=4kOLIGa1YWUoi0wMHH7ciygmsuGiuPYZIZNU0hXbx4I=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oOIAToeUE0fRRoi3mgan9kqRd9djPIg19mHj7EhUNAHKdh0vZCwM1KJgcqqrEL5W1UCds04OF5pGuoZJK9m1kk+G20phw4CWqEPsjs+vOpAUXvgmFjq4jiSBCglEok1ZDYGMQLjrGYJ+3lUiv3BNh47tJpJGbq5SdpRMstm7uKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vW7d3kNq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/3zIvyOl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vW7d3kNq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/3zIvyOl; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vW7d3kNq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/3zIvyOl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vW7d3kNq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/3zIvyOl"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6F3621FBFA;
	Wed,  7 Feb 2024 15:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r5gCCxF5xoJ/8ZjJ2Y7PSheqLSQpE13wPX+A4HTTq7s=;
	b=vW7d3kNqarhkHcxyWYhfUaIK9GdqKRRxIBrdbU7M7T7lwrm813YZmU1xRljcr38BQZlqGa
	sjK9friYsY3zBW0RHGQ5HhOO+IrMBLX5D4etohz/T53BqW4HKJBtsIW/tro8t735Mk7kSu
	/12hkJjpn4EabLeG+CgPG8fTjkkAlss=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r5gCCxF5xoJ/8ZjJ2Y7PSheqLSQpE13wPX+A4HTTq7s=;
	b=/3zIvyOlgs6QpFdbhTChEngU7mhNFlevgFpiPwhZnn8SxB9jbDlWksYyaGekj2lG6fCcpl
	gIw36QngI9npVcDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r5gCCxF5xoJ/8ZjJ2Y7PSheqLSQpE13wPX+A4HTTq7s=;
	b=vW7d3kNqarhkHcxyWYhfUaIK9GdqKRRxIBrdbU7M7T7lwrm813YZmU1xRljcr38BQZlqGa
	sjK9friYsY3zBW0RHGQ5HhOO+IrMBLX5D4etohz/T53BqW4HKJBtsIW/tro8t735Mk7kSu
	/12hkJjpn4EabLeG+CgPG8fTjkkAlss=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r5gCCxF5xoJ/8ZjJ2Y7PSheqLSQpE13wPX+A4HTTq7s=;
	b=/3zIvyOlgs6QpFdbhTChEngU7mhNFlevgFpiPwhZnn8SxB9jbDlWksYyaGekj2lG6fCcpl
	gIw36QngI9npVcDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4BEA9139B9;
	Wed,  7 Feb 2024 15:51:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8I3kEB6nw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:51:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 03/29] ALSA: pcsp: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:14 +0100
Message-Id: <20240207155140.18238-4-tiwai@suse.de>
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
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00];
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
	 BAYES_HAM(-0.00)[35.63%]
X-Spam-Flag: NO

Use the	new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for code-simplification.  We need no longer CONFIG_PM_SLEEP ifdefs.
Just a cleanup, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/pcsp/pcsp.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/drivers/pcsp/pcsp.c b/sound/drivers/pcsp/pcsp.c
index c7be1c395bcb..7195cb49e00f 100644
--- a/sound/drivers/pcsp/pcsp.c
+++ b/sound/drivers/pcsp/pcsp.c
@@ -176,7 +176,6 @@ static void pcsp_stop_beep(struct snd_pcsp *chip)
 	pcspkr_stop_sound();
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int pcsp_suspend(struct device *dev)
 {
 	struct snd_pcsp *chip = dev_get_drvdata(dev);
@@ -184,11 +183,7 @@ static int pcsp_suspend(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(pcsp_pm, pcsp_suspend, NULL);
-#define PCSP_PM_OPS	&pcsp_pm
-#else
-#define PCSP_PM_OPS	NULL
-#endif	/* CONFIG_PM_SLEEP */
+static DEFINE_SIMPLE_DEV_PM_OPS(pcsp_pm, pcsp_suspend, NULL);
 
 static void pcsp_shutdown(struct platform_device *dev)
 {
@@ -199,7 +194,7 @@ static void pcsp_shutdown(struct platform_device *dev)
 static struct platform_driver pcsp_platform_driver = {
 	.driver		= {
 		.name	= "pcspkr",
-		.pm	= PCSP_PM_OPS,
+		.pm	= &pcsp_pm,
 	},
 	.probe		= pcsp_probe,
 	.shutdown	= pcsp_shutdown,
-- 
2.35.3

