Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D4722E3F3
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205527; cv=none; b=T5dyoZNmP+rU79nxh7ArCpKiyYFpWOZkyjN+JUS1/i1Cj4Xk5f8SivZYNI9/B3BHKigi5G9bNRejv9uVjv7cPFoNO5b2huZgqIwqHe6itovnNcyva/wLg9JYaWmi4YgPiRbvgBZxujUFZw95XR2K+ve0qbTMHngoK4CmiSfYeDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205527; c=relaxed/simple;
	bh=j6nH6Jv0JXEOizVvqypljjekO/dUBs6ijYs9yYFP5Nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LBqGPglfGNAfh/nJGh+IFmtt8pX1h9Kh1fn4xb4GMIxi+c++FTLY1/IoC5c+tT9gTmYP97iL90571oTLNUCyN+9TGZWaaquPqGu8fSt04R/gEWU083ewa/Kn7QkCSY+pV5mKRELKoySDEQm73Vz1nyadCCGNFkUWAaVDdBAwROE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=j8tcQvp+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0Z6GAktM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=j8tcQvp+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0Z6GAktM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j8tcQvp+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0Z6GAktM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j8tcQvp+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0Z6GAktM"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 894542205D;
	Mon, 17 Mar 2025 09:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TRq7OLYlH0PP9xWf9ZaQJSjfVwcUNQYVHJ6xxpGaUD0=;
	b=j8tcQvp+aDpDZ/g02/vSdad5KLbej/QSI15XYNCKEajDOVHqqyPx6C4fnk+CLl45uaEatJ
	LqBsc5sY10sZjhP8MvzYqbNfitdh9CFUX9saOw7J2HPIzvU5mnmZyuFwsTJTu5rN67O/4P
	F3/aMldFVfy3clGK56xpJnL3HAx5CCY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205382;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TRq7OLYlH0PP9xWf9ZaQJSjfVwcUNQYVHJ6xxpGaUD0=;
	b=0Z6GAktMsmKwqB4xLNgNi99rPpuqcjtsc9CKKTE6Pb/mkYp21wDQZc+RxDQFAc9Fp9KdOA
	mGKrInoTgMZbVkAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TRq7OLYlH0PP9xWf9ZaQJSjfVwcUNQYVHJ6xxpGaUD0=;
	b=j8tcQvp+aDpDZ/g02/vSdad5KLbej/QSI15XYNCKEajDOVHqqyPx6C4fnk+CLl45uaEatJ
	LqBsc5sY10sZjhP8MvzYqbNfitdh9CFUX9saOw7J2HPIzvU5mnmZyuFwsTJTu5rN67O/4P
	F3/aMldFVfy3clGK56xpJnL3HAx5CCY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205382;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TRq7OLYlH0PP9xWf9ZaQJSjfVwcUNQYVHJ6xxpGaUD0=;
	b=0Z6GAktMsmKwqB4xLNgNi99rPpuqcjtsc9CKKTE6Pb/mkYp21wDQZc+RxDQFAc9Fp9KdOA
	mGKrInoTgMZbVkAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 55FE413A2C;
	Mon, 17 Mar 2025 09:56:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UEucE8bx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 53/88] ASoC: wm8962: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:55:15 +0100
Message-ID: <20250317095603.20073-54-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us dropping superfluous CONFIG_PM ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/wm8962.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 0aaac24eeb5a..68f746626c33 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3850,7 +3850,6 @@ static void wm8962_i2c_remove(struct i2c_client *client)
 	pm_runtime_disable(&client->dev);
 }
 
-#ifdef CONFIG_PM
 static int wm8962_runtime_resume(struct device *dev)
 {
 	struct wm8962_priv *wm8962 = dev_get_drvdata(dev);
@@ -3930,11 +3929,10 @@ static int wm8962_runtime_suspend(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops wm8962_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(wm8962_runtime_suspend, wm8962_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+	RUNTIME_PM_OPS(wm8962_runtime_suspend, wm8962_runtime_resume, NULL)
 };
 
 static const struct i2c_device_id wm8962_i2c_id[] = {
@@ -3953,7 +3951,7 @@ static struct i2c_driver wm8962_i2c_driver = {
 	.driver = {
 		.name = "wm8962",
 		.of_match_table = wm8962_of_match,
-		.pm = &wm8962_pm,
+		.pm = pm_ptr(&wm8962_pm),
 	},
 	.probe =    wm8962_i2c_probe,
 	.remove =   wm8962_i2c_remove,
-- 
2.43.0

