Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132BE1940A1
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887741; cv=none; b=fFuFaBd5VUfEZrZsPQmh9I0dJIL20JKAQp0+eVXr5ZGh2tFe4rjoQQF/X/maHCGwxrBFpj+x37yraBiHQBuYcHenRIZaxJCaf7VUBrUx0dWrmAiuY3IJYXmVaCGbRALRlJoo5I1RuL53bNE57+4N2jQqyS6DAC/dxmp0Eb/Kc/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887741; c=relaxed/simple;
	bh=36GiCXDoAnFyQLdloqKvLJnee8MQ8x5pgVttv3uohZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=spCG2w/Zv5UBbNRqJJK3xzWpRKIDj3WvVWbfsmlN6ltes7bDeRrAfWsRnryh8Kt2jWe/WdfFYTtPZlINprgSZifBexgIbKwpIHUuhcozjIAcG1iPsdWiTwqUrnQYbs0wUQn/Wf9cL7nrLEhquIFWk/FmCQn53drbLqrIVV+4seE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VP5swRlv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Lp7CfvX+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VP5swRlv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Lp7CfvX+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VP5swRlv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Lp7CfvX+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VP5swRlv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Lp7CfvX+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5FD0B1F798;
	Thu, 13 Mar 2025 17:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZkKv3fij44mh8cOOULMWNMGDyn7I6sUPsckU4ns0zO4=;
	b=VP5swRlvY25NjbD4doZ+Xd+X1yti/6vm76jU2dHyiXCN/x457YS4MGtAktUm79Kh6tXzXT
	deVEdbxixjlzxvsn/N8H1dKQSD/XaiNOw1lwZpjdFi8Gmtim7uRGephmgw9KaAq98VP6MJ
	0tfUOavn3E8x0WAP1jV6tjKMI+Jp0mI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887714;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZkKv3fij44mh8cOOULMWNMGDyn7I6sUPsckU4ns0zO4=;
	b=Lp7CfvX+MhiPv+jL/VZJ8DdNjQLVeF1BBRL38o1X06sFRprUocQhf40gs3Enrz5h848SFW
	JFS8CXkyGaGWYcDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZkKv3fij44mh8cOOULMWNMGDyn7I6sUPsckU4ns0zO4=;
	b=VP5swRlvY25NjbD4doZ+Xd+X1yti/6vm76jU2dHyiXCN/x457YS4MGtAktUm79Kh6tXzXT
	deVEdbxixjlzxvsn/N8H1dKQSD/XaiNOw1lwZpjdFi8Gmtim7uRGephmgw9KaAq98VP6MJ
	0tfUOavn3E8x0WAP1jV6tjKMI+Jp0mI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887714;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZkKv3fij44mh8cOOULMWNMGDyn7I6sUPsckU4ns0zO4=;
	b=Lp7CfvX+MhiPv+jL/VZJ8DdNjQLVeF1BBRL38o1X06sFRprUocQhf40gs3Enrz5h848SFW
	JFS8CXkyGaGWYcDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 387F5139D2;
	Thu, 13 Mar 2025 17:41:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6MR9DOIY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 05/89] ASoC: cs35l32: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:10 +0100
Message-ID: <20250313174139.29942-6-tiwai@suse.de>
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
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
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

Use the newer RUNTIE_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping superfluous CONFIG_PM
ifdefs.

This optimizes slightly	when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/cs35l32.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs35l32.c b/sound/soc/codecs/cs35l32.c
index 6d78fa953c89..0bb4bdb3deec 100644
--- a/sound/soc/codecs/cs35l32.c
+++ b/sound/soc/codecs/cs35l32.c
@@ -504,7 +504,6 @@ static void cs35l32_i2c_remove(struct i2c_client *i2c_client)
 	gpiod_set_value_cansleep(cs35l32->reset_gpio, 0);
 }
 
-#ifdef CONFIG_PM
 static int cs35l32_runtime_suspend(struct device *dev)
 {
 	struct cs35l32_private *cs35l32 = dev_get_drvdata(dev);
@@ -543,11 +542,9 @@ static int cs35l32_runtime_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops cs35l32_runtime_pm = {
-	SET_RUNTIME_PM_OPS(cs35l32_runtime_suspend, cs35l32_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(cs35l32_runtime_suspend, cs35l32_runtime_resume, NULL)
 };
 
 static const struct of_device_id cs35l32_of_match[] = {
@@ -567,7 +564,7 @@ MODULE_DEVICE_TABLE(i2c, cs35l32_id);
 static struct i2c_driver cs35l32_i2c_driver = {
 	.driver = {
 		   .name = "cs35l32",
-		   .pm = &cs35l32_runtime_pm,
+		   .pm = pm_ptr(&cs35l32_runtime_pm),
 		   .of_match_table = cs35l32_of_match,
 		   },
 	.id_table = cs35l32_id,
-- 
2.43.0

