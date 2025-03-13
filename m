Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A261B3F3D
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887833; cv=none; b=dn9//U4FbpTXdjIO3F7MMofQGeonjrlwiOx6ApSv1R2kAZr63+gRQ5XpPYuMTucc+SECCW6PnMBbx9i2JzXbeLQ129va/kBi28l1NcgqiAGjpCnhzjZFSKZlgKuug0XpxWjpKwB8PR+MS1wp5bM0R1yMaeKydHzbjY6bUzwMhYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887833; c=relaxed/simple;
	bh=hl3DQYv8akAeMMKV6k1sODDMPSVyM+GR4yJeOo97pY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NKpNC56uoBs6utAUnGmOyNA5ivc6+q7V3zbDKKc2XXF9AHoSRBeJzOMXf+J5JvDFJu+V+a6Al93BLW/aBB/dHeDnKY87stgRGMegnZlUMvIdUVxZQQfAelhvo8bipsRXL45SDDbL9C7W90lB/+ct/c7+tY+LlkD849bIAqignlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rSoWIHiu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tVaOMuIS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rSoWIHiu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tVaOMuIS; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rSoWIHiu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tVaOMuIS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rSoWIHiu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tVaOMuIS"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B362A1F7A0;
	Thu, 13 Mar 2025 17:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fDXtIRUFJqY1bq8gmNzVbZ27Xh1So3jy7aceCTnasZk=;
	b=rSoWIHiu2AapBNpuiBWucThec8+bv6vyYv/ArDrYFGb9HvStHH8iaipaJtRx3Gx+NG0PKK
	hyhcaUNvePhXfFSxgMOa49wUvXU6yuQjgzy/W8E9VTQFp6hhkV7wSDF9WMjz1vpolHxTdE
	L/fbA0Qxjy8YpDp0jDjLEcd+2lq579M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887720;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fDXtIRUFJqY1bq8gmNzVbZ27Xh1So3jy7aceCTnasZk=;
	b=tVaOMuISXPyNR6uV3d6nNHLtvKU1jeAR5DsIpmWLtzXsFV2jNFfZ0ZQ50IVOYU5Y/P4uj3
	Wg2p6oumqmTwBaBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rSoWIHiu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tVaOMuIS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fDXtIRUFJqY1bq8gmNzVbZ27Xh1So3jy7aceCTnasZk=;
	b=rSoWIHiu2AapBNpuiBWucThec8+bv6vyYv/ArDrYFGb9HvStHH8iaipaJtRx3Gx+NG0PKK
	hyhcaUNvePhXfFSxgMOa49wUvXU6yuQjgzy/W8E9VTQFp6hhkV7wSDF9WMjz1vpolHxTdE
	L/fbA0Qxjy8YpDp0jDjLEcd+2lq579M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887720;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fDXtIRUFJqY1bq8gmNzVbZ27Xh1So3jy7aceCTnasZk=;
	b=tVaOMuISXPyNR6uV3d6nNHLtvKU1jeAR5DsIpmWLtzXsFV2jNFfZ0ZQ50IVOYU5Y/P4uj3
	Wg2p6oumqmTwBaBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8D3CF137BA;
	Thu, 13 Mar 2025 17:42:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QJIMIegY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 39/89] ASoC: rt711: Convert to RUNTIME_PM_OPS() & co
Date: Thu, 13 Mar 2025 18:40:44 +0100
Message-ID: <20250313174139.29942-40-tiwai@suse.de>
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
X-Rspamd-Queue-Id: B362A1F7A0
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
 sound/soc/codecs/rt711-sdca-sdw.c | 12 ++++++------
 sound/soc/codecs/rt711-sdw.c      | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index f5933d2e085e..adf05f64259b 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -380,7 +380,7 @@ static const struct sdw_device_id rt711_sdca_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt711_sdca_id);
 
-static int __maybe_unused rt711_sdca_dev_suspend(struct device *dev)
+static int rt711_sdca_dev_suspend(struct device *dev)
 {
 	struct rt711_sdca_priv *rt711 = dev_get_drvdata(dev);
 
@@ -396,7 +396,7 @@ static int __maybe_unused rt711_sdca_dev_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rt711_sdca_dev_system_suspend(struct device *dev)
+static int rt711_sdca_dev_system_suspend(struct device *dev)
 {
 	struct rt711_sdca_priv *rt711_sdca = dev_get_drvdata(dev);
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
@@ -428,7 +428,7 @@ static int __maybe_unused rt711_sdca_dev_system_suspend(struct device *dev)
 
 #define RT711_PROBE_TIMEOUT 5000
 
-static int __maybe_unused rt711_sdca_dev_resume(struct device *dev)
+static int rt711_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt711_sdca_priv *rt711 = dev_get_drvdata(dev);
@@ -467,14 +467,14 @@ static int __maybe_unused rt711_sdca_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt711_sdca_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt711_sdca_dev_system_suspend, rt711_sdca_dev_resume)
-	SET_RUNTIME_PM_OPS(rt711_sdca_dev_suspend, rt711_sdca_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt711_sdca_dev_system_suspend, rt711_sdca_dev_resume)
+	RUNTIME_PM_OPS(rt711_sdca_dev_suspend, rt711_sdca_dev_resume, NULL)
 };
 
 static struct sdw_driver rt711_sdca_sdw_driver = {
 	.driver = {
 		.name = "rt711-sdca",
-		.pm = &rt711_sdca_pm,
+		.pm = pm_ptr(&rt711_sdca_pm),
 	},
 	.probe = rt711_sdca_sdw_probe,
 	.remove = rt711_sdca_sdw_remove,
diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index dfda6bb5c6f8..93a5a89a96b1 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -482,7 +482,7 @@ static const struct sdw_device_id rt711_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt711_id);
 
-static int __maybe_unused rt711_dev_suspend(struct device *dev)
+static int rt711_dev_suspend(struct device *dev)
 {
 	struct rt711_priv *rt711 = dev_get_drvdata(dev);
 
@@ -498,7 +498,7 @@ static int __maybe_unused rt711_dev_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rt711_dev_system_suspend(struct device *dev)
+static int rt711_dev_system_suspend(struct device *dev)
 {
 	struct rt711_priv *rt711 = dev_get_drvdata(dev);
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
@@ -528,7 +528,7 @@ static int __maybe_unused rt711_dev_system_suspend(struct device *dev)
 
 #define RT711_PROBE_TIMEOUT 5000
 
-static int __maybe_unused rt711_dev_resume(struct device *dev)
+static int rt711_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt711_priv *rt711 = dev_get_drvdata(dev);
@@ -564,14 +564,14 @@ static int __maybe_unused rt711_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt711_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt711_dev_system_suspend, rt711_dev_resume)
-	SET_RUNTIME_PM_OPS(rt711_dev_suspend, rt711_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt711_dev_system_suspend, rt711_dev_resume)
+	RUNTIME_PM_OPS(rt711_dev_suspend, rt711_dev_resume, NULL)
 };
 
 static struct sdw_driver rt711_sdw_driver = {
 	.driver = {
 		.name = "rt711",
-		.pm = &rt711_pm,
+		.pm = pm_ptr(&rt711_pm),
 	},
 	.probe = rt711_sdw_probe,
 	.remove = rt711_sdw_remove,
-- 
2.43.0

