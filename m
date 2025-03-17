Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00827221567
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205376; cv=none; b=Di143uaQW4s61HaAU80N+Yt325ZStm8HG4xUgAmptY29/oxavWqv9g9iTzGUDLPh6O5FzInSHCtc1KN0BGL6xrg+Pt0BVtUY2rTNRDEGoULexkky/Qi8/kY+hNSbupXBLgdG0Yudf3N6/iH1p/IUFik7+5/GCkBObWUXUMOLO0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205376; c=relaxed/simple;
	bh=UdMuwhA46qTKKaS0evDG6m8We4e5nqSpXg8SfHeGpME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jvoLn3F2J9Y9x1nMR7Qjwq3hGWGWJDWxzRA9a5YXs9pZAkn6wl/rqxCDgPZt9insls1C5IJbcWsGBohxci5MQJNf8qgHB/6rELMXwwVPSvT1++TeSLJZxMbOzNJBF8wSKG2jyKlRf3jVW81raKAu2PSFCPBmswtS1s8XTlrXZ9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WSnSIJ7l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cCxcbihJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WSnSIJ7l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cCxcbihJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WSnSIJ7l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cCxcbihJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WSnSIJ7l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cCxcbihJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 386A021D2D;
	Mon, 17 Mar 2025 09:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205373; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dH+N2q0ld2KvaQQV1RZHtG4yI2DsTV8upd/E0wqEHV8=;
	b=WSnSIJ7l9EPynlVqntq+/y3NFXBU1sLSU1y+9p7QgCgYK7ls9nxZHT6W7T0D9hozVeoFZK
	xEK0FSBwp/fpYqTjH/rAvu1mSj+HZpYiwr9AAAL6ArNdMb7yck2XqdBo/emXiBlxO3RsEO
	S7ins/piPZvLT3C10fCI+dchWWTdOYs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205373;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dH+N2q0ld2KvaQQV1RZHtG4yI2DsTV8upd/E0wqEHV8=;
	b=cCxcbihJ95hMToI4mI13MW0FeC1S3SdH3Zl4GQvG9OsVTzwApt/RsSw3jyOkcuKHeQYtLI
	agOD/ZPNHbFSBRCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205373; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dH+N2q0ld2KvaQQV1RZHtG4yI2DsTV8upd/E0wqEHV8=;
	b=WSnSIJ7l9EPynlVqntq+/y3NFXBU1sLSU1y+9p7QgCgYK7ls9nxZHT6W7T0D9hozVeoFZK
	xEK0FSBwp/fpYqTjH/rAvu1mSj+HZpYiwr9AAAL6ArNdMb7yck2XqdBo/emXiBlxO3RsEO
	S7ins/piPZvLT3C10fCI+dchWWTdOYs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205373;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dH+N2q0ld2KvaQQV1RZHtG4yI2DsTV8upd/E0wqEHV8=;
	b=cCxcbihJ95hMToI4mI13MW0FeC1S3SdH3Zl4GQvG9OsVTzwApt/RsSw3jyOkcuKHeQYtLI
	agOD/ZPNHbFSBRCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1554A132CF;
	Mon, 17 Mar 2025 09:56:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YHnmA73x12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 02/88] ASoC: ak4375: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:54:24 +0100
Message-ID: <20250317095603.20073-3-tiwai@suse.de>
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
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS () and SET_SYSTEM_SLEEP_PM_OPS()
together with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/ak4375.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/ak4375.c b/sound/soc/codecs/ak4375.c
index 3ee5a5c3c5fe..452559d8c97b 100644
--- a/sound/soc/codecs/ak4375.c
+++ b/sound/soc/codecs/ak4375.c
@@ -438,7 +438,7 @@ static int ak4375_power_on(struct ak4375_priv *ak4375)
 	return 0;
 }
 
-static int __maybe_unused ak4375_runtime_suspend(struct device *dev)
+static int ak4375_runtime_suspend(struct device *dev)
 {
 	struct ak4375_priv *ak4375 = dev_get_drvdata(dev);
 
@@ -448,7 +448,7 @@ static int __maybe_unused ak4375_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused ak4375_runtime_resume(struct device *dev)
+static int ak4375_runtime_resume(struct device *dev)
 {
 	struct ak4375_priv *ak4375 = dev_get_drvdata(dev);
 	int ret;
@@ -490,9 +490,8 @@ static const struct ak4375_drvdata ak4375_drvdata = {
 };
 
 static const struct dev_pm_ops ak4375_pm = {
-	SET_RUNTIME_PM_OPS(ak4375_runtime_suspend, ak4375_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(ak4375_runtime_suspend, ak4375_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static int ak4375_i2c_probe(struct i2c_client *i2c)
@@ -594,7 +593,7 @@ MODULE_DEVICE_TABLE(of, ak4375_of_match);
 static struct i2c_driver ak4375_i2c_driver = {
 	.driver = {
 		.name = "ak4375",
-		.pm = &ak4375_pm,
+		.pm = pm_ptr(&ak4375_pm),
 		.of_match_table = ak4375_of_match,
 	},
 	.probe = ak4375_i2c_probe,
-- 
2.43.0

