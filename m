Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694F518F2FC
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887815; cv=none; b=f3N7tIuskr37v663RQc1Y3Ia5bzfBfYBPp1EG0MGBsGC1ob5CwmeDQe+xGwbJszXyxgoAVrwB2owpy8SeG6XHXHBgcJYkAvN2W9ziMGEMNuwYK9NGKibd4HYwVCuMRq2eKsjQUfSKXybGmp+6dx2jAYJxJCLt4vqL57T5oIs1dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887815; c=relaxed/simple;
	bh=ICENAgvD+Uu/oArWNcOOcZiDB8Iu0giogIUuMKbWNps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lDPJMoZI5pWYPmZXWqygUSEWPsjfGKUULigJn8yjQhy3YU5my0lF1ZPQA1RwGFfZlLlRHU+19mP2/3Vy5N9P19cnGSdCPVjc/rEL86lrCGzZh1+p1+MFNjM50QLiwjHrNJI37zlWd5AfNPdDymIrJybl9XX/4pG84r3gPdLds8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OJLE1sL7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AHhOh8DL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OJLE1sL7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AHhOh8DL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OJLE1sL7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AHhOh8DL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OJLE1sL7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AHhOh8DL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 959BC1F788;
	Thu, 13 Mar 2025 17:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JWJDX1+2bHHgQb/2ibsdxbqplxn30jNeln4+TD72AXs=;
	b=OJLE1sL7HaFpPyXIP5Xz5gd1eJh57OQXg6ASmfCLcXfrHzRA0RifYBuilEgvDnNIEtkVgd
	fYlaFGNHZXBoTnvLty0n1Gg6cfWBlrNvsv4nGvs62cTBH2F+aVGn+UrwmxhYSrBMLLM3DA
	Hz2DmGFHw3UJYc82N+h/aDTJoZ6FBqc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887719;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JWJDX1+2bHHgQb/2ibsdxbqplxn30jNeln4+TD72AXs=;
	b=AHhOh8DLN89ZmPCT+bEr5hIzZawLzCuS/gK8EpK4Iva+H5DziD78eeSRURAmHk9Q9zAttZ
	V1vWtsoDPdO9vfDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OJLE1sL7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AHhOh8DL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JWJDX1+2bHHgQb/2ibsdxbqplxn30jNeln4+TD72AXs=;
	b=OJLE1sL7HaFpPyXIP5Xz5gd1eJh57OQXg6ASmfCLcXfrHzRA0RifYBuilEgvDnNIEtkVgd
	fYlaFGNHZXBoTnvLty0n1Gg6cfWBlrNvsv4nGvs62cTBH2F+aVGn+UrwmxhYSrBMLLM3DA
	Hz2DmGFHw3UJYc82N+h/aDTJoZ6FBqc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887719;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JWJDX1+2bHHgQb/2ibsdxbqplxn30jNeln4+TD72AXs=;
	b=AHhOh8DLN89ZmPCT+bEr5hIzZawLzCuS/gK8EpK4Iva+H5DziD78eeSRURAmHk9Q9zAttZ
	V1vWtsoDPdO9vfDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6DB38137BA;
	Thu, 13 Mar 2025 17:41:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WNKEGecY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 33/89] ASoC: rt1318-sdw: Convert to RUNTIME_PM_OPS() & co
Date: Thu, 13 Mar 2025 18:40:38 +0100
Message-ID: <20250313174139.29942-34-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 959BC1F788
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

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/rt1318-sdw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt1318-sdw.c b/sound/soc/codecs/rt1318-sdw.c
index 319f71f5e60d..4eb636e0c9ed 100644
--- a/sound/soc/codecs/rt1318-sdw.c
+++ b/sound/soc/codecs/rt1318-sdw.c
@@ -807,7 +807,7 @@ static const struct sdw_device_id rt1318_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt1318_id);
 
-static int __maybe_unused rt1318_dev_suspend(struct device *dev)
+static int rt1318_dev_suspend(struct device *dev)
 {
 	struct rt1318_sdw_priv *rt1318 = dev_get_drvdata(dev);
 
@@ -820,7 +820,7 @@ static int __maybe_unused rt1318_dev_suspend(struct device *dev)
 
 #define RT1318_PROBE_TIMEOUT 5000
 
-static int __maybe_unused rt1318_dev_resume(struct device *dev)
+static int rt1318_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1318_sdw_priv *rt1318 = dev_get_drvdata(dev);
@@ -848,14 +848,14 @@ static int __maybe_unused rt1318_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt1318_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt1318_dev_suspend, rt1318_dev_resume)
-	SET_RUNTIME_PM_OPS(rt1318_dev_suspend, rt1318_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt1318_dev_suspend, rt1318_dev_resume)
+	RUNTIME_PM_OPS(rt1318_dev_suspend, rt1318_dev_resume, NULL)
 };
 
 static struct sdw_driver rt1318_sdw_driver = {
 	.driver = {
 		.name = "rt1318-sdca",
-		.pm = &rt1318_pm,
+		.pm = pm_ptr(&rt1318_pm),
 	},
 	.probe = rt1318_sdw_probe,
 	.remove = rt1318_sdw_remove,
-- 
2.43.0

