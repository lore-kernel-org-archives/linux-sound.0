Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8207D1D7E37
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887894; cv=none; b=koMWbb41lyQzv0Pg93DkMJkBKqqgpq8SRUiZWyXude9DBiHODNI7ssnerrYy/A0ISK00v0RRVwJD/cu77s+K4cCxJDX4CVsoDYbvT5KDOPfNY23BLRNO/4kWvN4F/AFUJfvjgWWaKdyTar1+tFFTh2gQV9BRC6canm7KT35ELf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887894; c=relaxed/simple;
	bh=STIbrtp2nG3qXZNm6ZM0v8HSeDX/bPE89LchKFpldiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oOpQDit/Ad4n9BqxRoBIydHjtZsgbTjVcfkpKo8o/O+bfsrNXWy8qY1JN9ui47uqtbW+Pmp56h3ZZaqG3YYFRANkpZ8sGLjTDm1MOLjMKC2vpkfj2w45p51HOPe6Lrkx6/Fb1ol/Z4ExJ5FFf9Amc1qRik6dsp/b14Gg0PSLliU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Im1yC9jf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kKIn3lUb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Im1yC9jf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kKIn3lUb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Im1yC9jf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kKIn3lUb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Im1yC9jf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kKIn3lUb"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3E4A2211EC;
	Thu, 13 Mar 2025 17:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ia8H6xE/qx4oNBPu+T7XWMEbIuLOOlNcF1HrWIIhOBA=;
	b=Im1yC9jfYlhzzE3PuJWZjW5axBZ2fuOeCvvSMyTpBSjgsvRknWSOelJRMcMcqxnWPqo5lx
	AM+ksF4BUCcY4/a3nIhqyNMv9ERbbZ8GR8DQ53+Wu7Ci7ZLRVhWzDmbA9AcCr/q2PFce6y
	yA2TGWPsW4IsC3R3MJPZ7wpi1KJrBQ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887724;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ia8H6xE/qx4oNBPu+T7XWMEbIuLOOlNcF1HrWIIhOBA=;
	b=kKIn3lUbm6pVK+FtVpkOKqtp5IBoO6fzhfmGdzysRiXezj2DNa3ygB4ykmt3G0Tc2SXinw
	iXr3hhRARFyYhGDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Im1yC9jf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kKIn3lUb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ia8H6xE/qx4oNBPu+T7XWMEbIuLOOlNcF1HrWIIhOBA=;
	b=Im1yC9jfYlhzzE3PuJWZjW5axBZ2fuOeCvvSMyTpBSjgsvRknWSOelJRMcMcqxnWPqo5lx
	AM+ksF4BUCcY4/a3nIhqyNMv9ERbbZ8GR8DQ53+Wu7Ci7ZLRVhWzDmbA9AcCr/q2PFce6y
	yA2TGWPsW4IsC3R3MJPZ7wpi1KJrBQ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887724;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ia8H6xE/qx4oNBPu+T7XWMEbIuLOOlNcF1HrWIIhOBA=;
	b=kKIn3lUbm6pVK+FtVpkOKqtp5IBoO6fzhfmGdzysRiXezj2DNa3ygB4ykmt3G0Tc2SXinw
	iXr3hhRARFyYhGDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1821B137BA;
	Thu, 13 Mar 2025 17:42:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wOmhBOwY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 58/89] ASoC: wsa884x: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:41:03 +0100
Message-ID: <20250313174139.29942-59-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 3E4A2211EC
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RLi691ga9brjh6qjnnbs1osk4o)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/wsa884x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 560a2c04b695..8051483aa1ac 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -2136,7 +2136,7 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 					       ARRAY_SIZE(wsa884x_dais));
 }
 
-static int __maybe_unused wsa884x_runtime_suspend(struct device *dev)
+static int wsa884x_runtime_suspend(struct device *dev)
 {
 	struct regmap *regmap = dev_get_regmap(dev, NULL);
 
@@ -2146,7 +2146,7 @@ static int __maybe_unused wsa884x_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused wsa884x_runtime_resume(struct device *dev)
+static int wsa884x_runtime_resume(struct device *dev)
 {
 	struct regmap *regmap = dev_get_regmap(dev, NULL);
 
@@ -2157,7 +2157,7 @@ static int __maybe_unused wsa884x_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops wsa884x_pm_ops = {
-	SET_RUNTIME_PM_OPS(wsa884x_runtime_suspend, wsa884x_runtime_resume, NULL)
+	RUNTIME_PM_OPS(wsa884x_runtime_suspend, wsa884x_runtime_resume, NULL)
 };
 
 static const struct sdw_device_id wsa884x_swr_id[] = {
@@ -2169,7 +2169,7 @@ MODULE_DEVICE_TABLE(sdw, wsa884x_swr_id);
 static struct sdw_driver wsa884x_codec_driver = {
 	.driver = {
 		.name = "wsa884x-codec",
-		.pm = &wsa884x_pm_ops,
+		.pm = pm_ptr(&wsa884x_pm_ops),
 	},
 	.probe = wsa884x_probe,
 	.ops = &wsa884x_slave_ops,
-- 
2.43.0

