Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B82B18C006
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887959; cv=none; b=qfQ+8lOMxSTF8bF9KcxQt16Qthr7vo868EGue6SuIMTc/n7tgh2bki142ka+6wWleV5YBVMTmd0eVZM8eBykfhLP103rctZ2c8eUzKjghS9y8ogt/qLd2ZNEL1Ni6dUPZu6v7fsg1s6w7fyOinx8vGIFMivmbGOViWtAJ+IRLzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887959; c=relaxed/simple;
	bh=6b51cI3zloE/Mad0wdGaKdDyQwzaTh5HnqJeIZTnkiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VPr0U+twlO+y7HL3IFRDlPxChwkpI3lbyZosQAll+/f+FRbKN03xCdM3GFbiSiWeAdMqR71eigDHPQn1DOpjTTYc7SkKATvMSBvrBYEUU2uq4PMKmwU9sXmZfiBxXGEygAVZeI4gHWKerz+9mCEUZ+PUvKc5za6orYBagq8owNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KF84lCJF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MTcEY++6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KF84lCJF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MTcEY++6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KF84lCJF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MTcEY++6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KF84lCJF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MTcEY++6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1423C211FA;
	Thu, 13 Mar 2025 17:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ya/RAB5RvHjOuNGYHnxoKibkHL73yVzql64uhtGOTmY=;
	b=KF84lCJF/Qe2bH8PNCyyWhL8Z7CO/jrH8BegfppCyG00QU+IyRPGbUdyIYfnjSaOp/zrVP
	vW6uH8RKXwER6px61uIny7y2pIs9fpdKBqqTJ3CEIcAnRTG3+jyxJM5/bFBXK0eI87MrtP
	fmCjQEe7mmR47v5HqydYMA3t8T1pblQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887727;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ya/RAB5RvHjOuNGYHnxoKibkHL73yVzql64uhtGOTmY=;
	b=MTcEY++6uko4s7y+MldBxYLS7+MUOELc3Tjl+FqQPyONr0Mt/EmmdxR2tYl9+J5lZQEQ8M
	a4GmBE3+yYKlWfBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KF84lCJF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MTcEY++6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ya/RAB5RvHjOuNGYHnxoKibkHL73yVzql64uhtGOTmY=;
	b=KF84lCJF/Qe2bH8PNCyyWhL8Z7CO/jrH8BegfppCyG00QU+IyRPGbUdyIYfnjSaOp/zrVP
	vW6uH8RKXwER6px61uIny7y2pIs9fpdKBqqTJ3CEIcAnRTG3+jyxJM5/bFBXK0eI87MrtP
	fmCjQEe7mmR47v5HqydYMA3t8T1pblQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887727;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ya/RAB5RvHjOuNGYHnxoKibkHL73yVzql64uhtGOTmY=;
	b=MTcEY++6uko4s7y+MldBxYLS7+MUOELc3Tjl+FqQPyONr0Mt/EmmdxR2tYl9+J5lZQEQ8M
	a4GmBE3+yYKlWfBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D768A13A24;
	Thu, 13 Mar 2025 17:42:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yENXM+4Y02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 74/89] ASoC: qcom: Convert to SYSTEM_SLEEP_PM_OPS()
Date: Thu, 13 Mar 2025 18:41:19 +0100
Message-ID: <20250313174139.29942-75-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 1423C211FA
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Use the newer SYSTEM_SLEEP_PM_OPS() macro instead of
SET_SYSTEM_SLEEP_PM_OPS() together with pm_ptr(), which allows us to
drop ugly __maybe_unused attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/qcom/lpass-sc7180.c | 8 ++++----
 sound/soc/qcom/lpass-sc7280.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
index fbead6af3d95..7c6a9b0fda89 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -160,14 +160,14 @@ static int sc7180_lpass_exit(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused sc7180_lpass_dev_resume(struct device *dev)
+static int sc7180_lpass_dev_resume(struct device *dev)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
 
 	return clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
 }
 
-static int __maybe_unused sc7180_lpass_dev_suspend(struct device *dev)
+static int sc7180_lpass_dev_suspend(struct device *dev)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
 
@@ -176,7 +176,7 @@ static int __maybe_unused sc7180_lpass_dev_suspend(struct device *dev)
 }
 
 static const struct dev_pm_ops sc7180_lpass_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(sc7180_lpass_dev_suspend, sc7180_lpass_dev_resume)
+	SYSTEM_SLEEP_PM_OPS(sc7180_lpass_dev_suspend, sc7180_lpass_dev_resume)
 };
 
 static const struct lpass_variant sc7180_data = {
@@ -312,7 +312,7 @@ static struct platform_driver sc7180_lpass_cpu_platform_driver = {
 	.driver = {
 		.name = "sc7180-lpass-cpu",
 		.of_match_table = of_match_ptr(sc7180_lpass_cpu_device_id),
-		.pm = &sc7180_lpass_pm_ops,
+		.pm = pm_ptr(&sc7180_lpass_pm_ops),
 	},
 	.probe = asoc_qcom_lpass_cpu_platform_probe,
 	.remove = asoc_qcom_lpass_cpu_platform_remove,
diff --git a/sound/soc/qcom/lpass-sc7280.c b/sound/soc/qcom/lpass-sc7280.c
index 7cd3e291382a..817c824f9179 100644
--- a/sound/soc/qcom/lpass-sc7280.c
+++ b/sound/soc/qcom/lpass-sc7280.c
@@ -233,14 +233,14 @@ static int sc7280_lpass_exit(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused sc7280_lpass_dev_resume(struct device *dev)
+static int sc7280_lpass_dev_resume(struct device *dev)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
 
 	return clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
 }
 
-static int __maybe_unused sc7280_lpass_dev_suspend(struct device *dev)
+static int sc7280_lpass_dev_suspend(struct device *dev)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
 
@@ -249,7 +249,7 @@ static int __maybe_unused sc7280_lpass_dev_suspend(struct device *dev)
 }
 
 static const struct dev_pm_ops sc7280_lpass_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(sc7280_lpass_dev_suspend, sc7280_lpass_dev_resume)
+	SYSTEM_SLEEP_PM_OPS(sc7280_lpass_dev_suspend, sc7280_lpass_dev_resume)
 };
 
 static const struct lpass_variant sc7280_data = {
@@ -442,7 +442,7 @@ static struct platform_driver sc7280_lpass_cpu_platform_driver = {
 	.driver = {
 		.name = "sc7280-lpass-cpu",
 		.of_match_table = of_match_ptr(sc7280_lpass_cpu_device_id),
-		.pm = &sc7280_lpass_pm_ops,
+		.pm = pm_ptr(&sc7280_lpass_pm_ops),
 	},
 	.probe = asoc_qcom_lpass_cpu_platform_probe,
 	.remove = asoc_qcom_lpass_cpu_platform_remove,
-- 
2.43.0

