Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEC6225A3E
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205388; cv=none; b=s+qzDmsHIi2g1QsEb5/A4xmXBFJdPkEC15LEnExX9PPEFMGqBPMe7c1zqFjkedncjFucr58ntRIGOESkIP8ZcWBB9PNAH74BbvoXfkQfuIOwurl/ZBjFpLnPJtPJQxw6MkYaYeVUmxTRZR2/WLo7dP5SI/FWOWyz0as2dFsFbFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205388; c=relaxed/simple;
	bh=wqVEAeoE0XLPDk4kPaoSvayfoNjbz4/sk5D9YegPlIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uSH7ZllPggzemVaywaP2Eq4zcwEeDlUWS/Oh1P6+dzS7VfDGGw4kABqOK8pMt6InWTaoOmws1ZUN9jDfYS6o+aXN5A8qMfEeHPP1/mKyt3/RpmAhwIEP6R35uaKj4vy7PguwWpVAmJS+ab26Hh+YbhwhfCsMLs48G/V/os00rfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AXhYkyq0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GW/s5GKH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hOJcl9zx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ga6P1I2e; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AXhYkyq0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GW/s5GKH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hOJcl9zx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ga6P1I2e"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F286C21D35;
	Mon, 17 Mar 2025 09:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wsVI1gGgsQjun51596FKvZkPeNkji76KcR+jgmBTPsI=;
	b=AXhYkyq0XOJwwKrsbaxRgT0RNHye5T57wWzfZAvpfHgjJ02DPekemo09z6AM1SQdT27W1W
	5rikNpfBI4h8ujmKJ6f9Wk02Da3RsidNItEYBbFkAZCmVxssJ5NoLoI05mTxcA5jfRQ0ja
	suhlSu3rw0NowhUwyKp6IJN4/yLDS8c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205375;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wsVI1gGgsQjun51596FKvZkPeNkji76KcR+jgmBTPsI=;
	b=GW/s5GKHhMOAg492aeiodgyiJMeQi/et8WIP0N7msWXiWquu2MxLQbwj/DiE/apDgn6X+e
	aOhYkwbyH0KOiFDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wsVI1gGgsQjun51596FKvZkPeNkji76KcR+jgmBTPsI=;
	b=hOJcl9zxUtOYXfuQ5cUv/sPjr7kfl4nu8svLfouUMhIhwarhLi9jX5mKeULk78ZZBBOFjL
	keKIt+zlf6PQspK+6kKQkIbzwhOCtJ899aGFPCOiJGK5Rg3vN9K8l9KQqGf5amymACrgWk
	2mw8meh6MXiAEMlfVBpWjiZvO2jOCKw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205374;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wsVI1gGgsQjun51596FKvZkPeNkji76KcR+jgmBTPsI=;
	b=ga6P1I2eEpjlgz8dr4kgvnRPTTocBE7GUoPRoIEE9O5bvlS4i9kgPl3ng1V+r2ikqFWjIr
	Sf/D6eolPsr/wwCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C839A132CF;
	Mon, 17 Mar 2025 09:56:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EOVnL73x12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 06/88] ASoC: cs35l33: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:54:28 +0100
Message-ID: <20250317095603.20073-7-tiwai@suse.de>
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
X-Spam-Level: 
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
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
X-Spam-Flag: NO

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/cs35l33.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs35l33.c b/sound/soc/codecs/cs35l33.c
index 02a420659a33..c927592f90c9 100644
--- a/sound/soc/codecs/cs35l33.c
+++ b/sound/soc/codecs/cs35l33.c
@@ -853,7 +853,7 @@ static const struct regmap_config cs35l33_regmap = {
 	.use_single_write = true,
 };
 
-static int __maybe_unused cs35l33_runtime_resume(struct device *dev)
+static int cs35l33_runtime_resume(struct device *dev)
 {
 	struct cs35l33_private *cs35l33 = dev_get_drvdata(dev);
 	int ret;
@@ -891,7 +891,7 @@ static int __maybe_unused cs35l33_runtime_resume(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused cs35l33_runtime_suspend(struct device *dev)
+static int cs35l33_runtime_suspend(struct device *dev)
 {
 	struct cs35l33_private *cs35l33 = dev_get_drvdata(dev);
 
@@ -909,9 +909,7 @@ static int __maybe_unused cs35l33_runtime_suspend(struct device *dev)
 }
 
 static const struct dev_pm_ops cs35l33_pm_ops = {
-	SET_RUNTIME_PM_OPS(cs35l33_runtime_suspend,
-			   cs35l33_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(cs35l33_runtime_suspend, cs35l33_runtime_resume, NULL)
 };
 
 static int cs35l33_get_hg_data(const struct device_node *np,
@@ -1273,7 +1271,7 @@ MODULE_DEVICE_TABLE(i2c, cs35l33_id);
 static struct i2c_driver cs35l33_i2c_driver = {
 	.driver = {
 		.name = "cs35l33",
-		.pm = &cs35l33_pm_ops,
+		.pm = pm_ptr(&cs35l33_pm_ops),
 		.of_match_table = cs35l33_of_match,
 
 		},
-- 
2.43.0

