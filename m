Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DEA1CD215
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887887; cv=none; b=LCDnoz2DPCCX4Nt8QjXw+8jTDfLcFmux3snTFBPyJ7Q5wZKnckKyOILxPMx1n4um43c1z70gbUiEprzBTU3V9dkxrjlVyFADtyzIJekcBtfhwOrKVi4V+zVIzxWGl4v68lfNqL9bOoK9XTa7BBTaA738d7fdaRQ9vw5Ir4fs4rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887887; c=relaxed/simple;
	bh=uF1BxHuwmghaFEziZfN9TuXIHk98gn9NF+btJKtLtDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CeWFMwKZtyu41QoEcg8j+kpd/oZI8DMd7OV0miyLPxjUw5ZgN4K+7IDfM0bN1WZKb7BRQLmxcNEsZwvUHr6F+FldsjnmV1Z5pqcGl4MxdfvXJ/8ANGH80GMjUJQhGU+Sgpk9K8780eqSb5CNXO5FdAX9Ogev1arbASrCx2ugiEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OY7DcMUa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Bq74QoYv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OY7DcMUa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Bq74QoYv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OY7DcMUa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Bq74QoYv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OY7DcMUa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Bq74QoYv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DA7A1211E9;
	Thu, 13 Mar 2025 17:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kyz48yFE8jM3WTzHesrNVg/2fCoZk+apeucYJc8C03g=;
	b=OY7DcMUamrrzHC0zOAj6ZwTlBI4VjRI7AJosv76YgAWE6JHLQFreZQHA7cAwcB9vEAsMCj
	iMetDGs60X1jjDTBkTqrp87FPgUX6g4QymJBcJzaydIOqxhmHxz5ehLEwpYvscJwZOnlZJ
	dhzlgMBWYwdLXxAXnNlFQfDyI7TsaaM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887723;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kyz48yFE8jM3WTzHesrNVg/2fCoZk+apeucYJc8C03g=;
	b=Bq74QoYvmJRjI9V9FI9wCgbRUgwT5O+sNMt+XllzfpglIjMZafu7QK/C8fklB/F9x2C8Sh
	LZTxhkV2cTdkknCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kyz48yFE8jM3WTzHesrNVg/2fCoZk+apeucYJc8C03g=;
	b=OY7DcMUamrrzHC0zOAj6ZwTlBI4VjRI7AJosv76YgAWE6JHLQFreZQHA7cAwcB9vEAsMCj
	iMetDGs60X1jjDTBkTqrp87FPgUX6g4QymJBcJzaydIOqxhmHxz5ehLEwpYvscJwZOnlZJ
	dhzlgMBWYwdLXxAXnNlFQfDyI7TsaaM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887723;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kyz48yFE8jM3WTzHesrNVg/2fCoZk+apeucYJc8C03g=;
	b=Bq74QoYvmJRjI9V9FI9wCgbRUgwT5O+sNMt+XllzfpglIjMZafu7QK/C8fklB/F9x2C8Sh
	LZTxhkV2cTdkknCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B4E4F137BA;
	Thu, 13 Mar 2025 17:42:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YDPYKusY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 56/89] ASoC: wsa881x: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:41:01 +0100
Message-ID: <20250313174139.29942-57-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_RATELIMIT(0.00)[to_ip_from(RL5j9wc7mf8ens4usejdmaiz8d)];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/wsa881x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index a3999bb6d5e2..6627d2da3722 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1169,7 +1169,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 					       ARRAY_SIZE(wsa881x_dais));
 }
 
-static int __maybe_unused wsa881x_runtime_suspend(struct device *dev)
+static int wsa881x_runtime_suspend(struct device *dev)
 {
 	struct regmap *regmap = dev_get_regmap(dev, NULL);
 	struct wsa881x_priv *wsa881x = dev_get_drvdata(dev);
@@ -1182,7 +1182,7 @@ static int __maybe_unused wsa881x_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused wsa881x_runtime_resume(struct device *dev)
+static int wsa881x_runtime_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct regmap *regmap = dev_get_regmap(dev, NULL);
@@ -1206,7 +1206,7 @@ static int __maybe_unused wsa881x_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops wsa881x_pm_ops = {
-	SET_RUNTIME_PM_OPS(wsa881x_runtime_suspend, wsa881x_runtime_resume, NULL)
+	RUNTIME_PM_OPS(wsa881x_runtime_suspend, wsa881x_runtime_resume, NULL)
 };
 
 static const struct sdw_device_id wsa881x_slave_id[] = {
@@ -1222,7 +1222,7 @@ static struct sdw_driver wsa881x_codec_driver = {
 	.id_table = wsa881x_slave_id,
 	.driver = {
 		.name	= "wsa881x-codec",
-		.pm = &wsa881x_pm_ops,
+		.pm = pm_ptr(&wsa881x_pm_ops),
 	}
 };
 module_sdw_driver(wsa881x_codec_driver);
-- 
2.43.0

