Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0179D22F155
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205599; cv=none; b=LqBy03ibPybjrjX/3cR3ydbB8hgPuPOSUlNt90z1E8PGGANvJXVMK8rCgR8ykUPyIxbVRo67puYqlv3GxTWM6XuMmm78/0Wr62b/SPY4IakSrm8eCGfWksqGlcivDK12bJGdpvMQtipIvJ10uBaGXu8KvtSnqlEe2f6GRYBU7ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205599; c=relaxed/simple;
	bh=bJY+BZgfA88QEsuUCKd26MJc2UYEN3lM8+nh5pkAscg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uWnsJM6aC0WYZZO45g/8l7sQZucNv0ZY0flqNhrB+sEzix5+jAKCRXGiXBvu5nYYc0v0qWnRB8TUJHkVu/23wnNejZRUVz/tnyugX7tdsLGROMRrGMKgqzQif1t0AHVcqXAERVdE0XwC/D2IJ4YQzLZseIjxFXHZpSuedkyoooo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Nv0+CZ49; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WXvx63M6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Nv0+CZ49; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WXvx63M6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Nv0+CZ49";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WXvx63M6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Nv0+CZ49";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WXvx63M6"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C3D902210F;
	Mon, 17 Mar 2025 09:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YT2wAINHSOaIqEStkry1dChBhTUOydaRH0wA8jeOv0s=;
	b=Nv0+CZ49m3Th8PxjL965z9bx8/FsaZZOaLonRJ96ibBZcMYe2MYpKX50oCQ3gmd+4s3txb
	ML7Z3fjoiBgkSvMvFgh1xIfnbYfbf4FJGLG7XiSZf2aNiJkN2GJvPutUybvhFbsEEXjJQA
	kJyhA/RKnqLpiBy18QTnhgHCEZycyBg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205386;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YT2wAINHSOaIqEStkry1dChBhTUOydaRH0wA8jeOv0s=;
	b=WXvx63M68I+CVNXBSzNuDmM+8zhiSzxJdnnZbTT7/Fhexlil461felwLCu8zTcIp96ZPHX
	ZHp3kJKr/ArHiFBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YT2wAINHSOaIqEStkry1dChBhTUOydaRH0wA8jeOv0s=;
	b=Nv0+CZ49m3Th8PxjL965z9bx8/FsaZZOaLonRJ96ibBZcMYe2MYpKX50oCQ3gmd+4s3txb
	ML7Z3fjoiBgkSvMvFgh1xIfnbYfbf4FJGLG7XiSZf2aNiJkN2GJvPutUybvhFbsEEXjJQA
	kJyhA/RKnqLpiBy18QTnhgHCEZycyBg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205386;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YT2wAINHSOaIqEStkry1dChBhTUOydaRH0wA8jeOv0s=;
	b=WXvx63M68I+CVNXBSzNuDmM+8zhiSzxJdnnZbTT7/Fhexlil461felwLCu8zTcIp96ZPHX
	ZHp3kJKr/ArHiFBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 98146132CF;
	Mon, 17 Mar 2025 09:56:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gMC5I8rx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 76/88] ASoC: samsung: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:55:38 +0100
Message-ID: <20250317095603.20073-77-tiwai@suse.de>
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
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us to drop superfluous CONFIG_PM ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/samsung/i2s.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 8f6deb06e234..e9964f0e010a 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1216,7 +1216,6 @@ static int i2s_alloc_dais(struct samsung_i2s_priv *priv,
 	return 0;
 }
 
-#ifdef CONFIG_PM
 static int i2s_runtime_suspend(struct device *dev)
 {
 	struct samsung_i2s_priv *priv = dev_get_drvdata(dev);
@@ -1254,7 +1253,6 @@ static int i2s_runtime_resume(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM */
 
 static void i2s_unregister_clocks(struct samsung_i2s_priv *priv)
 {
@@ -1733,10 +1731,8 @@ MODULE_DEVICE_TABLE(of, exynos_i2s_match);
 #endif
 
 static const struct dev_pm_ops samsung_i2s_pm = {
-	SET_RUNTIME_PM_OPS(i2s_runtime_suspend,
-				i2s_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				     pm_runtime_force_resume)
+	RUNTIME_PM_OPS(i2s_runtime_suspend, i2s_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver samsung_i2s_driver = {
@@ -1746,7 +1742,7 @@ static struct platform_driver samsung_i2s_driver = {
 	.driver = {
 		.name = "samsung-i2s",
 		.of_match_table = of_match_ptr(exynos_i2s_match),
-		.pm = &samsung_i2s_pm,
+		.pm = pm_ptr(&samsung_i2s_pm),
 	},
 };
 
-- 
2.43.0

