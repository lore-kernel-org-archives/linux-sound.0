Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59C11D63E4
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887900; cv=none; b=VQAtYpCZrUfUfOrfuE0aqVaoYA+mAmr1ai1JFSvdbOdo7apxfzwO60MW6LGjrVkk1ZZmbIAok/vSA+KB64kfsNeRVJP6K+dohNDVjOJZy0gnat1MGkF0kMn6Ynqbvcc1iJ27oE9DToF41k9jT0izYydl4ezprKTvkB+Aj15T710=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887900; c=relaxed/simple;
	bh=xCyKN9HjDiAG+dmWnuuVjDNS2OQOIsnp22WD/wi9734=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GlLn/NZWL9dTEsYm6k2R1x+eyOLuQjh5E4zuLhxESiO7tCtPyTnlq3FfVoawFkUO6fYo7xfz7aRL4YNTkZ7oee7D/WfDKKVIhsX/JDValRzNxCaxtonzYfW5gHloP8ot03s3CkOnSDCTA4D/hmP4jQEFKek4qEc9UdC+Wv2J+pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qp6QxNQU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RVkQoDbx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qp6QxNQU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RVkQoDbx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qp6QxNQU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RVkQoDbx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qp6QxNQU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RVkQoDbx"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 627E11F786;
	Thu, 13 Mar 2025 17:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CbskMNAp1mggn/2pEB9x/6Ybt+H1+pcyfrKmrIs7Vys=;
	b=qp6QxNQUoGoIXWke/xhIY3W2MIrnKfsz+9sH01IS1aV7il4jaz6XjdGm1dJW5cAJPtmVy0
	yRZOQ32qGt0BrtlFnCa7t4xyMuxssaVhabloTiQZzokoizpCI57fqA47YPwwyVgnFnZnTF
	+XULg9566wvjPWdoGh2083u/XOo5dHQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887724;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CbskMNAp1mggn/2pEB9x/6Ybt+H1+pcyfrKmrIs7Vys=;
	b=RVkQoDbxZqFTNxhD742rsRPq+nkuXCCU4mzAHs83DVKVZLYf6Umq+z09QC/9Q75TYzPtZL
	eG4jL0T5KfGFXODQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qp6QxNQU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RVkQoDbx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CbskMNAp1mggn/2pEB9x/6Ybt+H1+pcyfrKmrIs7Vys=;
	b=qp6QxNQUoGoIXWke/xhIY3W2MIrnKfsz+9sH01IS1aV7il4jaz6XjdGm1dJW5cAJPtmVy0
	yRZOQ32qGt0BrtlFnCa7t4xyMuxssaVhabloTiQZzokoizpCI57fqA47YPwwyVgnFnZnTF
	+XULg9566wvjPWdoGh2083u/XOo5dHQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887724;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CbskMNAp1mggn/2pEB9x/6Ybt+H1+pcyfrKmrIs7Vys=;
	b=RVkQoDbxZqFTNxhD742rsRPq+nkuXCCU4mzAHs83DVKVZLYf6Umq+z09QC/9Q75TYzPtZL
	eG4jL0T5KfGFXODQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 43D2D139D2;
	Thu, 13 Mar 2025 17:42:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AMNBD+wY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 59/89] ASoC: dwc: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:41:04 +0100
Message-ID: <20250313174139.29942-60-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 627E11F786
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLi691ga9brjh6qjnnbs1osk4o)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping superfluous CONFIG_PM
ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/dwc/dwc-i2s.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 57b789d7fbed..4c4171bb3fbb 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -478,7 +478,6 @@ static const struct snd_soc_dai_ops dw_i2s_dai_ops = {
 	.set_tdm_slot	= dw_i2s_set_tdm_slot,
 };
 
-#ifdef CONFIG_PM
 static int dw_i2s_runtime_suspend(struct device *dev)
 {
 	struct dw_i2s_dev *dw_dev = dev_get_drvdata(dev);
@@ -501,6 +500,7 @@ static int dw_i2s_runtime_resume(struct device *dev)
 	return 0;
 }
 
+#ifdef CONFIG_PM
 static int dw_i2s_suspend(struct snd_soc_component *component)
 {
 	struct dw_i2s_dev *dev = snd_soc_component_get_drvdata(component);
@@ -1084,7 +1084,7 @@ MODULE_DEVICE_TABLE(of, dw_i2s_of_match);
 #endif
 
 static const struct dev_pm_ops dwc_pm_ops = {
-	SET_RUNTIME_PM_OPS(dw_i2s_runtime_suspend, dw_i2s_runtime_resume, NULL)
+	RUNTIME_PM_OPS(dw_i2s_runtime_suspend, dw_i2s_runtime_resume, NULL)
 };
 
 static struct platform_driver dw_i2s_driver = {
@@ -1093,7 +1093,7 @@ static struct platform_driver dw_i2s_driver = {
 	.driver		= {
 		.name	= "designware-i2s",
 		.of_match_table = of_match_ptr(dw_i2s_of_match),
-		.pm = &dwc_pm_ops,
+		.pm = pm_ptr(&dwc_pm_ops),
 	},
 };
 
-- 
2.43.0

