Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8341DC985
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887974; cv=none; b=RZ4tpBxMfZvQN/porAZGv+n8+a4W3yBTukuoBustortAPtxtCHJpGChUJ5gq++r7l+NJZle+rojGs4PdXhIeHoNDb5sQS5IjkLtYyHJDMkSM6oFf0Iq/k78h5e+Mg2b13NdmBq/b0zS10MPHjOzJiIGox6Uzou9YQzPcGljxF68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887974; c=relaxed/simple;
	bh=lvWXI61rYqAZ89vtzD9kIJVTlRtM+P1et1ciWjSHOIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WqZHQdlZV0SVWVdUPdealZ6U6b39PV54Ve6OncwjXLqXs82ewYD3oSZ185U+HKEynETNzbCiYxLnf/bybBCsdETRmmVJlrMV4u0wZ2WQ3KdZMyhEC6BdJQZ+fppQ5k7vFtatLH8eRNGUNWEs+FbNOOU8FSgNT45gOXMD3XeKIIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R5qTzF0q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Bc49dErP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eeD77Iyo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CVHv8UwO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R5qTzF0q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Bc49dErP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eeD77Iyo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CVHv8UwO"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CF3FE1F7B6;
	Thu, 13 Mar 2025 17:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RUXO8KyxOMobs9DG6C+QDFkgUWUReomXF4XyrDgPPCg=;
	b=R5qTzF0qRD12Q3wEpI1nxOWcYePHAjkR823xFXynxnGWXK+NvgeKcEvw6OZMSXWQsYTMjf
	LZQPf/p5iuoh12qqWqiZ1NJuQe+/llvU2GkmIyhwSarS205R3bntaVTzyIJ3Sj8+FMErQ4
	8dgLHAkgC4FPxUi84phsIxrThXMhmo4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887730;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RUXO8KyxOMobs9DG6C+QDFkgUWUReomXF4XyrDgPPCg=;
	b=Bc49dErPusU2XBtXC2RVKqKYbDlISDxZLJP2SDCQCgv422+/9vsAC+spl0qg6N7t1iRMoa
	tnLMint7d1zbdPAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eeD77Iyo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CVHv8UwO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RUXO8KyxOMobs9DG6C+QDFkgUWUReomXF4XyrDgPPCg=;
	b=eeD77Iyo+bNs8HKs/1vlQSbnibUJC9+ZtpIOV4e36NrrElLLHbkvpRNW/VVtwqjAKROq8X
	RybSQztgiJoTKCpwipgktQ5keppF4cTJ7YwiWjrIp3QeEVdNOkObzBjzNfrrshwNZwOgYo
	UBbLjJLkrau/IXZ5FGmPLeh03DHDIrg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887729;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RUXO8KyxOMobs9DG6C+QDFkgUWUReomXF4XyrDgPPCg=;
	b=CVHv8UwO6PznhIN0BUG8zy3JbtQ8mxW3YV0X2LIpBjGrda5ypo6NoQYlCUK9UBV4fPbr0e
	39eqoblo1Mc5owBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F096139D2;
	Thu, 13 Mar 2025 17:42:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UEndJPEY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:09 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 89/89] ASoC: pcm3168a: Convert to EXPORT_GPL_DEV_PM_OPS()
Date: Thu, 13 Mar 2025 18:41:34 +0100
Message-ID: <20250313174139.29942-90-tiwai@suse.de>
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
X-Rspamd-Queue-Id: CF3FE1F7B6
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLi691ga9brjh6qjnnbs1osk4o)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer EXPORT_GPL_DEV_PM_OPS() macro together with pm_ptr().
This allows us to drop superfluous CONFIG_PM ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Shenghao Ding <shenghao-ding@ti.com>
Cc: Kevin Lu <kevin-lu@ti.com>
Cc: Baojun Xu <baojun.xu@ti.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/pcm3168a-i2c.c | 2 +-
 sound/soc/codecs/pcm3168a-spi.c | 2 +-
 sound/soc/codecs/pcm3168a.c     | 7 ++-----
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a-i2c.c b/sound/soc/codecs/pcm3168a-i2c.c
index 4da608ba514d..ff18c74b616c 100644
--- a/sound/soc/codecs/pcm3168a-i2c.c
+++ b/sound/soc/codecs/pcm3168a-i2c.c
@@ -59,7 +59,7 @@ static struct i2c_driver pcm3168a_i2c_driver = {
 		.name	= "pcm3168a",
 		.acpi_match_table = pcm3168a_acpi_match,
 		.of_match_table = pcm3168a_of_match,
-		.pm		= &pcm3168a_pm_ops,
+		.pm		= pm_ptr(&pcm3168a_pm_ops),
 	},
 };
 module_i2c_driver(pcm3168a_i2c_driver);
diff --git a/sound/soc/codecs/pcm3168a-spi.c b/sound/soc/codecs/pcm3168a-spi.c
index b5b08046f545..0871338eacba 100644
--- a/sound/soc/codecs/pcm3168a-spi.c
+++ b/sound/soc/codecs/pcm3168a-spi.c
@@ -50,7 +50,7 @@ static struct spi_driver pcm3168a_spi_driver = {
 	.driver = {
 		.name	= "pcm3168a",
 		.of_match_table = pcm3168a_of_match,
-		.pm		= &pcm3168a_pm_ops,
+		.pm		= pm_ptr(&pcm3168a_pm_ops),
 	},
 };
 module_spi_driver(pcm3168a_spi_driver);
diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index df6836a652ef..c8617a488b11 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -849,7 +849,6 @@ void pcm3168a_remove(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(pcm3168a_remove);
 
-#ifdef CONFIG_PM
 static int pcm3168a_rt_resume(struct device *dev)
 {
 	struct pcm3168a_priv *pcm3168a = dev_get_drvdata(dev);
@@ -905,12 +904,10 @@ static int pcm3168a_rt_suspend(struct device *dev)
 
 	return 0;
 }
-#endif
 
-const struct dev_pm_ops pcm3168a_pm_ops = {
-	SET_RUNTIME_PM_OPS(pcm3168a_rt_suspend, pcm3168a_rt_resume, NULL)
+EXPORT_GPL_DEV_PM_OPS(pcm3168a_pm_ops) = {
+	RUNTIME_PM_OPS(pcm3168a_rt_suspend, pcm3168a_rt_resume, NULL)
 };
-EXPORT_SYMBOL_GPL(pcm3168a_pm_ops);
 
 MODULE_DESCRIPTION("PCM3168A codec driver");
 MODULE_AUTHOR("Damien Horsley <Damien.Horsley@imgtec.com>");
-- 
2.43.0

