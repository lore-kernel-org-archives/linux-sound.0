Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5831DD9AB
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887747; cv=none; b=t1LwDw5IFNbzkOHA/oCN19bIJKUOfTsp0V0kFLfYVyCgv3jl+5T3fneiHT2jLWK5CyhdDrZtp0D7dGtGQ2JFhEFMBD8OaYusuYevgNtxSIjJJYVYtyoK9DDfS4g8KUsWO+EJ5DSNJhaxmZMy1IVqTzXzSZEXAnjgStXAII8f97A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887747; c=relaxed/simple;
	bh=xaed3NjE0w7Pn7eurcj+mj0LOBW/0OpwZU94KAvvqMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nGR77c6VYm3EIPAzgO+8AyZYdzOudlu/ZuZMv8m6MvlsXQwEsXd2mk2RW+ujlazbm+rWqHHytoP/gTeL6qKviYCDJk8vJStEBp0/eONQ/mUIVCG6kMOk/cb45iNNhm40fXzkaCIKSe9ZO4hM6gBZzUPOyzB51ponywxLfEA2evU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RuQJosPq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=I/UFCirq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RuQJosPq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=I/UFCirq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RuQJosPq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="I/UFCirq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RuQJosPq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="I/UFCirq"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 914DF1F799;
	Thu, 13 Mar 2025 17:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0bnGaqDMKFe802MsjJfEwwiDkQM9DPaIc5TIKvCJKLI=;
	b=RuQJosPqJa/hvVkc6y7Cs3iqRog54AS4yJtCj1uEL1xAQJztgu+RJJZWfE4HA+DD32EjdN
	icluHSOgo49yqz+rVuFxjStJ57znG/gzPwAcjFdQOX79oDTbOHVd0C0/3aBZiXAWUCgyg7
	syois9pA37EbN1xAihmqCihav7UuL/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887714;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0bnGaqDMKFe802MsjJfEwwiDkQM9DPaIc5TIKvCJKLI=;
	b=I/UFCirqk23+2t58ig1E0/esYijPzm9SnqVz6tHsZpIgqk+28aOlnHIAOyTc00LNaamj4v
	t2ycJ5QOcLdA4aDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RuQJosPq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="I/UFCirq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0bnGaqDMKFe802MsjJfEwwiDkQM9DPaIc5TIKvCJKLI=;
	b=RuQJosPqJa/hvVkc6y7Cs3iqRog54AS4yJtCj1uEL1xAQJztgu+RJJZWfE4HA+DD32EjdN
	icluHSOgo49yqz+rVuFxjStJ57znG/gzPwAcjFdQOX79oDTbOHVd0C0/3aBZiXAWUCgyg7
	syois9pA37EbN1xAihmqCihav7UuL/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887714;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0bnGaqDMKFe802MsjJfEwwiDkQM9DPaIc5TIKvCJKLI=;
	b=I/UFCirqk23+2t58ig1E0/esYijPzm9SnqVz6tHsZpIgqk+28aOlnHIAOyTc00LNaamj4v
	t2ycJ5QOcLdA4aDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 66C08137BA;
	Thu, 13 Mar 2025 17:41:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OLHHF+IY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 06/89] ASoC: cs35l33: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:11 +0100
Message-ID: <20250313174139.29942-7-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 914DF1F799
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIE_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly	when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
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

