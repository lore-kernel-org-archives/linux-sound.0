Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F159D1DC985
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887979; cv=none; b=Ixfy/kcVxUMwkRLghx2rgysfdMXmts2WwpFnkjkjfRPsVTmWGUFS3f14pQMZ7yCfoi07HevlCrlOKKIhPmZ4ipZDFvy6tRO7JjFjwnwfqwatKyLa5fCXnOdoPR3TahxjIQtNOwIe2/4lZTlJhaYrNcf58FuaXqtPfXwYd0668DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887979; c=relaxed/simple;
	bh=14C6wShO9M44owh0o60E1hVQxaB8S5CPzWbRqvQc62Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nG96pqYx81uwqQs6I5dVQfa7Pf9YsHeNV+PUOinP6eUewZDchpJpDz7PMIWhRP8WTQ3FWvb2e7za+8fvfWqYasBVbWID57touljDj/iAbm9K+KKNnKfCPPOeqkQ0RxMSgFHxHFBcu8sWAg+6LDGBJjazqR7/9zLUvv1isksOiLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h4o04zCz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2iMBJGB2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h4o04zCz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2iMBJGB2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h4o04zCz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2iMBJGB2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h4o04zCz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2iMBJGB2"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 82E79211FC;
	Thu, 13 Mar 2025 17:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0eIKP/AW5utm/JaodAKRHMP4Y6bghTMaIa/+l3f45Q0=;
	b=h4o04zCzmge+xk2THPbFsvXVCX5YkGdp7SY1OJNGyrS0ATqIqBblTS+N2hSmZaRmJEzgmT
	OrA0ghdtdmJfZ14M61xfQRK+XKzEOAgwO9uB0UF6TH94EayXb6JZIJjb1P6WppMb89o8MR
	Ci4ZxgTWIDqHBpTM6HHqeP9GhOfBvbw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887728;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0eIKP/AW5utm/JaodAKRHMP4Y6bghTMaIa/+l3f45Q0=;
	b=2iMBJGB2GCMZxX+d1xosW4ELEaqcbamjnEipjzeAwj1BvWjLWP7RrJjzziR6i3NcpCk7di
	4W0+ya/9R28hXqAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0eIKP/AW5utm/JaodAKRHMP4Y6bghTMaIa/+l3f45Q0=;
	b=h4o04zCzmge+xk2THPbFsvXVCX5YkGdp7SY1OJNGyrS0ATqIqBblTS+N2hSmZaRmJEzgmT
	OrA0ghdtdmJfZ14M61xfQRK+XKzEOAgwO9uB0UF6TH94EayXb6JZIJjb1P6WppMb89o8MR
	Ci4ZxgTWIDqHBpTM6HHqeP9GhOfBvbw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887728;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0eIKP/AW5utm/JaodAKRHMP4Y6bghTMaIa/+l3f45Q0=;
	b=2iMBJGB2GCMZxX+d1xosW4ELEaqcbamjnEipjzeAwj1BvWjLWP7RrJjzziR6i3NcpCk7di
	4W0+ya/9R28hXqAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 62CC5139D2;
	Thu, 13 Mar 2025 17:42:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sOrVFvAY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 82/89] ASoC: sunxi: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:41:27 +0100
Message-ID: <20250313174139.29942-83-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313174139.29942-1-tiwai@suse.de>
References: <20250313174139.29942-1-tiwai@suse.de>
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL5j9wc7mf8ens4usejdmaiz8d)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() instead of SET_RUNTIME_PM_OPS()
together with pm_ptr().

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sunxi/sun4i-spdif.c | 6 +++---
 sound/soc/sunxi/sun50i-dmic.c | 6 +++---
 sound/soc/sunxi/sun8i-codec.c | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index 41caf1795d09..34e5bd94e9af 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -727,15 +727,15 @@ static void sun4i_spdif_remove(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops sun4i_spdif_pm = {
-	SET_RUNTIME_PM_OPS(sun4i_spdif_runtime_suspend,
-			   sun4i_spdif_runtime_resume, NULL)
+	RUNTIME_PM_OPS(sun4i_spdif_runtime_suspend,
+		       sun4i_spdif_runtime_resume, NULL)
 };
 
 static struct platform_driver sun4i_spdif_driver = {
 	.driver		= {
 		.name	= "sun4i-spdif",
 		.of_match_table = sun4i_spdif_of_match,
-		.pm	= &sun4i_spdif_pm,
+		.pm	= pm_ptr(&sun4i_spdif_pm),
 	},
 	.probe		= sun4i_spdif_probe,
 	.remove		= sun4i_spdif_remove,
diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index 3e751b5694fe..bab1e29c9988 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -415,15 +415,15 @@ static void sun50i_dmic_remove(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops sun50i_dmic_pm = {
-	SET_RUNTIME_PM_OPS(sun50i_dmic_runtime_suspend,
-			   sun50i_dmic_runtime_resume, NULL)
+	RUNTIME_PM_OPS(sun50i_dmic_runtime_suspend,
+		       sun50i_dmic_runtime_resume, NULL)
 };
 
 static struct platform_driver sun50i_dmic_driver = {
 	.driver         = {
 		.name   = "sun50i-dmic",
 		.of_match_table = sun50i_dmic_of_match,
-		.pm     = &sun50i_dmic_pm,
+		.pm     = pm_ptr(&sun50i_dmic_pm),
 	},
 	.probe          = sun50i_dmic_probe,
 	.remove         = sun50i_dmic_remove,
diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 8c645e04d571..8b9eb1a202f7 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -1702,15 +1702,15 @@ static const struct of_device_id sun8i_codec_of_match[] = {
 MODULE_DEVICE_TABLE(of, sun8i_codec_of_match);
 
 static const struct dev_pm_ops sun8i_codec_pm_ops = {
-	SET_RUNTIME_PM_OPS(sun8i_codec_runtime_suspend,
-			   sun8i_codec_runtime_resume, NULL)
+	RUNTIME_PM_OPS(sun8i_codec_runtime_suspend,
+		       sun8i_codec_runtime_resume, NULL)
 };
 
 static struct platform_driver sun8i_codec_driver = {
 	.driver = {
 		.name = "sun8i-codec",
 		.of_match_table = sun8i_codec_of_match,
-		.pm = &sun8i_codec_pm_ops,
+		.pm = pm_ptr(&sun8i_codec_pm_ops),
 	},
 	.probe = sun8i_codec_probe,
 	.remove = sun8i_codec_remove,
-- 
2.43.0

