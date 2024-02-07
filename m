Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679B980BEA
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321129; cv=none; b=Ka6z8QTP072Q+rULI6iE53fyez8xH6Ct1RlugN/zWfuk1FTYAGyBrqmhyop1oShylDWd8mHWehrEnqLR9a3iIXeuxR38sF3GZu44atYs8P2ha5DImyTDsx7zSiCZufHM7r6i11AhXhwXVBsnkOJTdj4iriFHc/gxHGMgCuMZwxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321129; c=relaxed/simple;
	bh=TFxDqmodC0dPcnqSPJZcO8/tu+U8D7YUK8FzJWQCFbk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lm2wJqFmABOIltkeBH2UqyYCy+S/jEtRlrAXGJy9Vp7O6yjGluGyIN09OTfXOPm4Q/f2s/NfkOVeMkiQ6NrvfutbUcvxVu1X5v46MOw/+dxIk9jdx/GC2HdDEtlCDFH15aBBHLOjJUHSn543frWY2hU7KiEyRF8NE3R2xf9mado=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=A4K0Yfo6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uFSvcXKM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=A4K0Yfo6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uFSvcXKM; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A4K0Yfo6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uFSvcXKM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A4K0Yfo6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uFSvcXKM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5AD511FC81;
	Wed,  7 Feb 2024 15:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=16NhmWpNbx9Lf2GN0v9lg9275T0VINQUew4BU1QJ12U=;
	b=A4K0Yfo6TjFFkHZOSNMtF7ZN91U99ymAZ81kBIP9htjF85Ch1PSErfBAaGXI+w+GnbCUJX
	0cvtT/B44PHCn7nKt35tAfa4mlYb+YYh2qdjy1iwbckF8J9+ED8AtdPJ2BCf2yocnT84nd
	ul1262M7y4984v3uRQtCXaEPtM8ao98=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321121;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=16NhmWpNbx9Lf2GN0v9lg9275T0VINQUew4BU1QJ12U=;
	b=uFSvcXKMkAwMh01BxWph7w90NAeye5424XPCoPPIJwPiutLtgt2Mr3sk07D6pJaNeB0FF9
	BGBDRGMq5ZWHSuAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=16NhmWpNbx9Lf2GN0v9lg9275T0VINQUew4BU1QJ12U=;
	b=A4K0Yfo6TjFFkHZOSNMtF7ZN91U99ymAZ81kBIP9htjF85Ch1PSErfBAaGXI+w+GnbCUJX
	0cvtT/B44PHCn7nKt35tAfa4mlYb+YYh2qdjy1iwbckF8J9+ED8AtdPJ2BCf2yocnT84nd
	ul1262M7y4984v3uRQtCXaEPtM8ao98=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321121;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=16NhmWpNbx9Lf2GN0v9lg9275T0VINQUew4BU1QJ12U=;
	b=uFSvcXKMkAwMh01BxWph7w90NAeye5424XPCoPPIJwPiutLtgt2Mr3sk07D6pJaNeB0FF9
	BGBDRGMq5ZWHSuAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3A90513A41;
	Wed,  7 Feb 2024 15:52:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WCzEDCGnw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:52:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 21/29] ALSA: es1938: Simplify with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:32 +0100
Message-Id: <20240207155140.18238-22-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=A4K0Yfo6;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uFSvcXKM
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.06 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DWL_DNSWL_HI(-3.50)[suse.de:dkim];
	 RCPT_COUNT_ONE(0.00)[1];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.05)[60.04%]
X-Spam-Score: -0.06
X-Rspamd-Queue-Id: 5AD511FC81
X-Spam-Flag: NO

Use the new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for code-simplification.  We need no longer CONFIG_PM_SLEEP ifdefs.

This ends up with the allocation of a few additional bytes for the
register dumps even if it's not really used, but the code
simplification should justify the cost.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/es1938.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/sound/pci/es1938.c b/sound/pci/es1938.c
index ec598ba1a883..018a8d53ca53 100644
--- a/sound/pci/es1938.c
+++ b/sound/pci/es1938.c
@@ -216,9 +216,7 @@ struct es1938 {
 #ifdef SUPPORT_JOYSTICK
 	struct gameport *gameport;
 #endif
-#ifdef CONFIG_PM_SLEEP
 	unsigned char saved_regs[SAVED_REG_SIZE];
-#endif
 };
 
 static irqreturn_t snd_es1938_interrupt(int irq, void *dev_id);
@@ -1395,7 +1393,6 @@ static void snd_es1938_chip_init(struct es1938 *chip)
 	outb(0, SLDM_REG(chip, DMACLEAR));
 }
 
-#ifdef CONFIG_PM_SLEEP
 /*
  * PM support
  */
@@ -1461,11 +1458,7 @@ static int es1938_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(es1938_pm, es1938_suspend, es1938_resume);
-#define ES1938_PM_OPS	&es1938_pm
-#else
-#define ES1938_PM_OPS	NULL
-#endif /* CONFIG_PM_SLEEP */
+static DEFINE_SIMPLE_DEV_PM_OPS(es1938_pm, es1938_suspend, es1938_resume);
 
 #ifdef SUPPORT_JOYSTICK
 static int snd_es1938_create_gameport(struct es1938 *chip)
@@ -1787,7 +1780,7 @@ static struct pci_driver es1938_driver = {
 	.id_table = snd_es1938_ids,
 	.probe = snd_es1938_probe,
 	.driver = {
-		.pm = ES1938_PM_OPS,
+		.pm = &es1938_pm,
 	},
 };
 
-- 
2.35.3

