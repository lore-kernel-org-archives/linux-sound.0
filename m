Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80245811E1
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321128; cv=none; b=Gy5HGUATEs/HyDW6xH1g7WrLAAUAZl8Qf4l38riEQQSsT1onlmxgUD/jiNIMWVHZoechNQT7SGO3gvqR9o8E2EFJxsyOBeJjJP3YvbL6LV3K2F2ZuMUzuOhAdzSSSOfSt0VmeXmKOTD9nAIyBrSdvxvyn0McKGjwxsU4YIlcrS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321128; c=relaxed/simple;
	bh=j1ptuY6qE3DOvTce0gVq9GKOliHGZVv99FvLPys5Bog=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JlsGT9rNc4VxR2TCUJxaegJ98xRddk44+axyDYpp5sSc882X8zECtWNgbRYHwT2gcjBAcYH6oSkqdDnYEiUP2xPGPwPo/Jh8+Y6PYpikfr4gZXfZKuqspsthl8CbcHzFcMi9ZYgkW9eucwsQfILOBOwgk8vBFFyTPi9z7Afc6Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w27hfbM1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uQN2FlFD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w27hfbM1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uQN2FlFD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w27hfbM1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uQN2FlFD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w27hfbM1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uQN2FlFD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B62211FC05;
	Wed,  7 Feb 2024 15:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gAH6w+jueA1aMMi9kxElZuC5v/K2lcpicg/es/nZfLc=;
	b=w27hfbM1qW+05IQIk3Xq7BeF5OK4060+TvWNcTSYLG3Q0y0E6S764NgASz52l3ZZvH41Fv
	7sgATGtnI1168lF21rwa0F5Uc6fbRKBtv8fUo7PEK5GDarihztd/aqNpZNBkqqjniyAGd8
	7YrLclNkyRK0B+bNWy2/I/vIP76fodE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gAH6w+jueA1aMMi9kxElZuC5v/K2lcpicg/es/nZfLc=;
	b=uQN2FlFDw/lK15HTT8xQq8i6Q+mRM64AmFyPZMYZ+RZzb270VsBFQ/KRFts9LbJQYMo7xg
	t1G24+1MKqa+FwAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gAH6w+jueA1aMMi9kxElZuC5v/K2lcpicg/es/nZfLc=;
	b=w27hfbM1qW+05IQIk3Xq7BeF5OK4060+TvWNcTSYLG3Q0y0E6S764NgASz52l3ZZvH41Fv
	7sgATGtnI1168lF21rwa0F5Uc6fbRKBtv8fUo7PEK5GDarihztd/aqNpZNBkqqjniyAGd8
	7YrLclNkyRK0B+bNWy2/I/vIP76fodE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gAH6w+jueA1aMMi9kxElZuC5v/K2lcpicg/es/nZfLc=;
	b=uQN2FlFDw/lK15HTT8xQq8i6Q+mRM64AmFyPZMYZ+RZzb270VsBFQ/KRFts9LbJQYMo7xg
	t1G24+1MKqa+FwAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8B8BE139B9;
	Wed,  7 Feb 2024 15:51:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qBaFIB+nw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:51:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 11/29] ALSA: aaci: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:22 +0100
Message-Id: <20240207155140.18238-12-tiwai@suse.de>
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
X-Spamd-Result: default: False [4.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[38.94%]
X-Spam-Level: ****
X-Spam-Score: 4.90
X-Spam-Flag: NO

Use the new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for code-simplification.  We need no longer CONFIG_PM_SLEEP ifdefs.
Just a cleanup, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/arm/aaci.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/arm/aaci.c b/sound/arm/aaci.c
index 0817ad21af74..f64896564728 100644
--- a/sound/arm/aaci.c
+++ b/sound/arm/aaci.c
@@ -737,7 +737,6 @@ static const struct snd_pcm_ops aaci_capture_ops = {
 /*
  * Power Management.
  */
-#ifdef CONFIG_PM
 static int aaci_do_suspend(struct snd_card *card)
 {
 	struct aaci *aaci = card->private_data;
@@ -763,12 +762,7 @@ static int aaci_resume(struct device *dev)
 	return card ? aaci_do_resume(card) : 0;
 }
 
-static SIMPLE_DEV_PM_OPS(aaci_dev_pm_ops, aaci_suspend, aaci_resume);
-#define AACI_DEV_PM_OPS (&aaci_dev_pm_ops)
-#else
-#define AACI_DEV_PM_OPS NULL
-#endif
-
+static DEFINE_SIMPLE_DEV_PM_OPS(aaci_dev_pm_ops, aaci_suspend, aaci_resume);
 
 static const struct ac97_pcm ac97_defs[] = {
 	[0] = {	/* Front PCM */
@@ -1081,7 +1075,7 @@ MODULE_DEVICE_TABLE(amba, aaci_ids);
 static struct amba_driver aaci_driver = {
 	.drv		= {
 		.name	= DRIVER_NAME,
-		.pm	= AACI_DEV_PM_OPS,
+		.pm	= &aaci_dev_pm_ops,
 	},
 	.probe		= aaci_probe,
 	.remove		= aaci_remove,
-- 
2.35.3

