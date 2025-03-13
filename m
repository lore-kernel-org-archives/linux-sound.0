Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED93194080
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887753; cv=none; b=n/PbwSsb7z5UP2ht/vE/ZrKT/86wkYpJHhLPe9U0OpvK5LQJLJoOhQWcK6emB/VEm7P1sBI45MuVJRWBTRz7DPy3E5enfoQWPLVH43NKPM0+TcQdJUWMbS1bQBx/83nMCfaresqd/iATSZpSo/rr9DehMpK42iLEMzuLAaZqAFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887753; c=relaxed/simple;
	bh=WF84afmpOcrQpmFykMwCWGe3MFpgYRJInREtE3hj7w0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UeR6Bq3Wy3y9u3n2fM4SFJ8mXtExncrKC+b+70yCx+BM3CCL8pPWIHQEKMVL2dUQLDaTjrvmhMofsZdFLtPctaWCw1xOb3xySpN8rWItKzqR5cIQoe8UXPXBPYZS+m0a9OO31SsBzrhG36TYirZAVud3JeEPjrj6D6R5sYPjyAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Wyz0d7IM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hrcSV/Oo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Wyz0d7IM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hrcSV/Oo; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Wyz0d7IM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hrcSV/Oo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Wyz0d7IM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hrcSV/Oo"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BDCB11F79A;
	Thu, 13 Mar 2025 17:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cHp6mE+ISOMXCIWy8A29+LC7JaVIMCe88LZFn5NkzQo=;
	b=Wyz0d7IMaZwRTcHMtfoW5VWPEwyxX9UbZPwEwRkbccSgYu4ixT04q8AIMBx198wyvamcKv
	Yn/aBV1JQMzYVgonvUETbUlDSCuc6sO7IQM9KP9jXd3ztABPtOsh2nYO5LRzlVQUmqGOs2
	eMGlGNL6bErEo6dZoXS1G8ixIidKR8U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887714;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cHp6mE+ISOMXCIWy8A29+LC7JaVIMCe88LZFn5NkzQo=;
	b=hrcSV/Oo/3BCurhMR+ofemAkLqjmr44XxuVoQkFWrIp4tzl1X1Vd3GZKAvZ9VYzazs2VYH
	5B+CnNoip2BOgIBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Wyz0d7IM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="hrcSV/Oo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cHp6mE+ISOMXCIWy8A29+LC7JaVIMCe88LZFn5NkzQo=;
	b=Wyz0d7IMaZwRTcHMtfoW5VWPEwyxX9UbZPwEwRkbccSgYu4ixT04q8AIMBx198wyvamcKv
	Yn/aBV1JQMzYVgonvUETbUlDSCuc6sO7IQM9KP9jXd3ztABPtOsh2nYO5LRzlVQUmqGOs2
	eMGlGNL6bErEo6dZoXS1G8ixIidKR8U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887714;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cHp6mE+ISOMXCIWy8A29+LC7JaVIMCe88LZFn5NkzQo=;
	b=hrcSV/Oo/3BCurhMR+ofemAkLqjmr44XxuVoQkFWrIp4tzl1X1Vd3GZKAvZ9VYzazs2VYH
	5B+CnNoip2BOgIBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 945E413A24;
	Thu, 13 Mar 2025 17:41:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IBXzIuIY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 07/89] ASoC: cs35l34: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:12 +0100
Message-ID: <20250313174139.29942-8-tiwai@suse.de>
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
X-Rspamd-Queue-Id: BDCB11F79A
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Use the newer RUNTIE_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly	when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/cs35l34.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs35l34.c b/sound/soc/codecs/cs35l34.c
index 6d098bfd38f6..a5a8075598ff 100644
--- a/sound/soc/codecs/cs35l34.c
+++ b/sound/soc/codecs/cs35l34.c
@@ -1116,7 +1116,7 @@ static void cs35l34_i2c_remove(struct i2c_client *client)
 		cs35l34->core_supplies);
 }
 
-static int __maybe_unused cs35l34_runtime_resume(struct device *dev)
+static int cs35l34_runtime_resume(struct device *dev)
 {
 	struct cs35l34_private *cs35l34 = dev_get_drvdata(dev);
 	int ret;
@@ -1149,7 +1149,7 @@ static int __maybe_unused cs35l34_runtime_resume(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused cs35l34_runtime_suspend(struct device *dev)
+static int cs35l34_runtime_suspend(struct device *dev)
 {
 	struct cs35l34_private *cs35l34 = dev_get_drvdata(dev);
 
@@ -1165,9 +1165,7 @@ static int __maybe_unused cs35l34_runtime_suspend(struct device *dev)
 }
 
 static const struct dev_pm_ops cs35l34_pm_ops = {
-	SET_RUNTIME_PM_OPS(cs35l34_runtime_suspend,
-			   cs35l34_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(cs35l34_runtime_suspend, cs35l34_runtime_resume, NULL)
 };
 
 static const struct of_device_id cs35l34_of_match[] = {
@@ -1185,7 +1183,7 @@ MODULE_DEVICE_TABLE(i2c, cs35l34_id);
 static struct i2c_driver cs35l34_i2c_driver = {
 	.driver = {
 		.name = "cs35l34",
-		.pm = &cs35l34_pm_ops,
+		.pm = pm_ptr(&cs35l34_pm_ops),
 		.of_match_table = cs35l34_of_match,
 
 		},
-- 
2.43.0

