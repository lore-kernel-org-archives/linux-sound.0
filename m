Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A306322FDEA
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 10:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205608; cv=none; b=PqRsi2opiir29qjj76dTC9TqesXreIvqT8M02LI/jyek/rGJUmOC2rFvBUwSQUDsTK/nPs5LqmDTnkMOASaPSrFMs2fyGFHtoFF+pQYTJx5hnXyTNt70FP4sZ9qro4IL8qajhw8zQqQkhf2dLiP1TfnpXkW1THRDRrfIG4WoS6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205608; c=relaxed/simple;
	bh=6b51cI3zloE/Mad0wdGaKdDyQwzaTh5HnqJeIZTnkiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sCYO4arsD/HOmRPHf4Wfe98ZdwO7D8ZXPABg+0eDiFnnlEmXwtugaL0aSel0aPWVKxabN0yLxaR9ztoLDPONOaewERWIg0F3ZrYD4PI8bIZkSDHTgraHw8RbdG3I4bq3d+30zge7g9zej0Fqw0FAO2qbTbDdzxGw0Dz3HXFqe6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PQpw0n2W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4zqYZ7NC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PQpw0n2W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4zqYZ7NC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PQpw0n2W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4zqYZ7NC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PQpw0n2W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4zqYZ7NC"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3286B20240;
	Mon, 17 Mar 2025 09:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ya/RAB5RvHjOuNGYHnxoKibkHL73yVzql64uhtGOTmY=;
	b=PQpw0n2WGPI5D5stTDUeaLl7tK1aXXwsAynxfAqai9SRechgegOGdpyTDI0u/BXa2GP3mb
	XrThpkL0GnP1fOrvG5q2MaBWe2WhX5RapYtN7oLDo0UGtb9VGXSZT70FwabDd64LE/Aia4
	VJPynGE2EHWVI3jnt/jH+dpfIC1sB38=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205386;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ya/RAB5RvHjOuNGYHnxoKibkHL73yVzql64uhtGOTmY=;
	b=4zqYZ7NCqfhpgCPzm8IN3mE/8t+wCb3RjWFEKl2eXIW9zlgj6Klf3BCM054SrTA6ZdRE/c
	9T9TlzcAHV6yYSDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ya/RAB5RvHjOuNGYHnxoKibkHL73yVzql64uhtGOTmY=;
	b=PQpw0n2WGPI5D5stTDUeaLl7tK1aXXwsAynxfAqai9SRechgegOGdpyTDI0u/BXa2GP3mb
	XrThpkL0GnP1fOrvG5q2MaBWe2WhX5RapYtN7oLDo0UGtb9VGXSZT70FwabDd64LE/Aia4
	VJPynGE2EHWVI3jnt/jH+dpfIC1sB38=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205386;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ya/RAB5RvHjOuNGYHnxoKibkHL73yVzql64uhtGOTmY=;
	b=4zqYZ7NCqfhpgCPzm8IN3mE/8t+wCb3RjWFEKl2eXIW9zlgj6Klf3BCM054SrTA6ZdRE/c
	9T9TlzcAHV6yYSDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 07F55132CF;
	Mon, 17 Mar 2025 09:56:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AOeVAMrx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 73/88] ASoC: qcom: Convert to SYSTEM_SLEEP_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:35 +0100
Message-ID: <20250317095603.20073-74-tiwai@suse.de>
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
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_RATELIMIT(0.00)[to_ip_from(RL5j9wc7mf8ens4usejdmaiz8d)];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
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

