Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A02E1B3F3D
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887819; cv=none; b=qut0XfTUN7MtfdQptsn9lyoqjO6QVZsF1h8ZaHS0qLLlzGg2ZtSVZPBWbH/WF8PlBMlIOqVWRw6Nb3H2riYGo3dmeXoSG8QRQ3MiG5klkNRYLDNQnKJznkRHf0KJaFQIyv4ZhmKrUf0oDmPkUQcGwQKqcSE9wnYGRP65qDyMWcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887819; c=relaxed/simple;
	bh=85keOgujEBv92/5CRX/rEBG7hTMsHaDiHAFvMR/VI7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pN5ZN/L0+7tqAynBKqQhURGBc7tmspLVxlUQqNeNF0pgpX0qWosbmSOXcLN6rBOvqDCm+OQ0CtfIywLELoSV+xGXsoFiqktUzdKHnKIYEsBr3vqdiSyT53uak7BsD9VHPScrl8atEmdq/Yr4u2EUMDxJQFr6eaxDeFEuC8c9UyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1OP1wHHV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9X1mYwRq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1OP1wHHV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9X1mYwRq; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1OP1wHHV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9X1mYwRq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1OP1wHHV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9X1mYwRq"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 70D62211DD;
	Thu, 13 Mar 2025 17:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U/PUlQ7Z/vG6UH0nMkXibl9zs/O5DgckhE90p5OAbeI=;
	b=1OP1wHHVMULmY8mPTX6WET6YYpcTw4J854RV6e+kXabfWnBQ8RqBDcqtCCnK8Aatmrb/gt
	2PTbGsXP8p1EOkbQdrm3hyXar+g6X2SmPKQTDbgS0nytQTYpdL1AABX5/xvNGWQMO1GZbT
	qJEyfVnya7sBArZBy/wDdg09A7Dwctg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887719;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U/PUlQ7Z/vG6UH0nMkXibl9zs/O5DgckhE90p5OAbeI=;
	b=9X1mYwRq8p+2ql9/s4EqIbrcgorhtcfhddBZhmLU7394R4ZZFnAnvXyN/pqaeCyxljpFsL
	MZWjutyNS+enA3Aw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U/PUlQ7Z/vG6UH0nMkXibl9zs/O5DgckhE90p5OAbeI=;
	b=1OP1wHHVMULmY8mPTX6WET6YYpcTw4J854RV6e+kXabfWnBQ8RqBDcqtCCnK8Aatmrb/gt
	2PTbGsXP8p1EOkbQdrm3hyXar+g6X2SmPKQTDbgS0nytQTYpdL1AABX5/xvNGWQMO1GZbT
	qJEyfVnya7sBArZBy/wDdg09A7Dwctg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887719;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U/PUlQ7Z/vG6UH0nMkXibl9zs/O5DgckhE90p5OAbeI=;
	b=9X1mYwRq8p+2ql9/s4EqIbrcgorhtcfhddBZhmLU7394R4ZZFnAnvXyN/pqaeCyxljpFsL
	MZWjutyNS+enA3Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3FB13139D2;
	Thu, 13 Mar 2025 17:41:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4KyXDecY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 32/89] ASoC: rt1316-sdw: Convert to RUNTIME_PM_OPS() & co
Date: Thu, 13 Mar 2025 18:40:37 +0100
Message-ID: <20250313174139.29942-33-tiwai@suse.de>
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

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/rt1316-sdw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index 22f1ed4e03f1..960b6c4f5a66 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -730,7 +730,7 @@ static const struct sdw_device_id rt1316_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt1316_id);
 
-static int __maybe_unused rt1316_dev_suspend(struct device *dev)
+static int rt1316_dev_suspend(struct device *dev)
 {
 	struct rt1316_sdw_priv *rt1316 = dev_get_drvdata(dev);
 
@@ -744,7 +744,7 @@ static int __maybe_unused rt1316_dev_suspend(struct device *dev)
 
 #define RT1316_PROBE_TIMEOUT 5000
 
-static int __maybe_unused rt1316_dev_resume(struct device *dev)
+static int rt1316_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1316_sdw_priv *rt1316 = dev_get_drvdata(dev);
@@ -774,14 +774,14 @@ static int __maybe_unused rt1316_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt1316_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt1316_dev_suspend, rt1316_dev_resume)
-	SET_RUNTIME_PM_OPS(rt1316_dev_suspend, rt1316_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt1316_dev_suspend, rt1316_dev_resume)
+	RUNTIME_PM_OPS(rt1316_dev_suspend, rt1316_dev_resume, NULL)
 };
 
 static struct sdw_driver rt1316_sdw_driver = {
 	.driver = {
 		.name = "rt1316-sdca",
-		.pm = &rt1316_pm,
+		.pm = pm_ptr(&rt1316_pm),
 	},
 	.probe = rt1316_sdw_probe,
 	.remove = rt1316_sdw_remove,
-- 
2.43.0

