Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C781C19ABCE
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 10:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205619; cv=none; b=kaH35G2cTLlPYqIjRmpvWSeZt1ccJ5ku5PCAr64oZK6E80If4mSugIjtVO9EC+T0hKdOuz3u6hD7XBe0G+DrhqBDWiD9PXcTO7T9m/Z8WWqlY4iABQxz9VP/GxeEVcC/3wD6i8M0N3BZzRDWwENvAJghm/5DSOLpcZZKaqzmwaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205619; c=relaxed/simple;
	bh=14C6wShO9M44owh0o60E1hVQxaB8S5CPzWbRqvQc62Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i+n1IPRKK7nCGln8jcTWkh8PQy6oUaMFSkIoZfCWKooBcCdh6Q8T1j+ldIxIW4FB11UrusX/s+f1I9visnWqnkCKhEUJf7/o8nBp2VBTwUyzT/XoTq/Ykd/FdzhQG18DLu65/iIxrYcglBQ//pEGAc5bQLyXMzWczSq3OteNPaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sqPqzulI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rlFXYs+f; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sqPqzulI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rlFXYs+f; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sqPqzulI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rlFXYs+f";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sqPqzulI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rlFXYs+f"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B43D52213B;
	Mon, 17 Mar 2025 09:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0eIKP/AW5utm/JaodAKRHMP4Y6bghTMaIa/+l3f45Q0=;
	b=sqPqzulIAl5/NdI2JD5VYqeydkh/simpjskabEzLyWzQ9nxZJbYFOF6rymqSahJtl1B7/R
	EeN7azNoo+eme3bW1eVERUmi5J1lNFe7weNmtz1UJftXCHhFmOEyxAPk8KLbuWlYrQsfKn
	dcBvnlitfXtlgf60f/K8WwEIhqzI1BY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205387;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0eIKP/AW5utm/JaodAKRHMP4Y6bghTMaIa/+l3f45Q0=;
	b=rlFXYs+fTn5Yx55XzQG64wf2em84cL0LTWySXojbAP4+l6w+IDAj+ZxTwNIIDxSgiHj1At
	vLyNgy3hiGcM+FCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0eIKP/AW5utm/JaodAKRHMP4Y6bghTMaIa/+l3f45Q0=;
	b=sqPqzulIAl5/NdI2JD5VYqeydkh/simpjskabEzLyWzQ9nxZJbYFOF6rymqSahJtl1B7/R
	EeN7azNoo+eme3bW1eVERUmi5J1lNFe7weNmtz1UJftXCHhFmOEyxAPk8KLbuWlYrQsfKn
	dcBvnlitfXtlgf60f/K8WwEIhqzI1BY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205387;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0eIKP/AW5utm/JaodAKRHMP4Y6bghTMaIa/+l3f45Q0=;
	b=rlFXYs+fTn5Yx55XzQG64wf2em84cL0LTWySXojbAP4+l6w+IDAj+ZxTwNIIDxSgiHj1At
	vLyNgy3hiGcM+FCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 953CE132CF;
	Mon, 17 Mar 2025 09:56:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WDMkI8vx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:27 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 81/88] ASoC: sunxi: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:43 +0100
Message-ID: <20250317095603.20073-82-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317095603.20073-1-tiwai@suse.de>
References: <20250317095603.20073-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_RATELIMIT(0.00)[to_ip_from(RL5j9wc7mf8ens4usejdmaiz8d)];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
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

