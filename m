Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBA5198A2F
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887846; cv=none; b=Jx+3fgl4eGd+FPsNOn1oR3geTDXk0c4GW8F44lwKC2NC+hSlx8QmQF01Q3Rn5DkiqtB3Imzm89OLCPggDNszEsr+qCB5+D357TGTZ9HS8xlVPPcOUY67usrXYOJW3EGLjV37/IaH4xKsE6suz+7eGF9+rWpTq76y6aleOfHHOsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887846; c=relaxed/simple;
	bh=z5KsK4ddGY051UCFN23kFfmy2cy/fqwvAT7ioyKJk7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lBlqANiBJmBY99EaWf47uXHmrsPmz1QsPVF4xhjcfb0o9Gfbqq6Ct+mpIooWwTGb5if30Redoy6RuyXcRQzUPa6Frog3fyA3YJYqiYcFLuxUejf/VH+r8cCzrLvNK3ML2LMp6avnHITZT+J4g70mWfdcyzKDD84o1H8PuV73gXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u5KhHini; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NaPl1J/A; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u5KhHini; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NaPl1J/A; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u5KhHini";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NaPl1J/A";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u5KhHini";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NaPl1J/A"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 19CF81F7A1;
	Thu, 13 Mar 2025 17:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZaALWPuLTHjwdVRxmpr9e75142YieH+vRKKSIlnxcf0=;
	b=u5KhHini5jMKboEeBl69gPbFmqDRAnnGuV1rdWU2xMN37f2o3BxhaK9gq7ifZBmri0ZfQy
	Ct+EqI5gnSg8B81dJ54Nn/u6PoOyxMWQ02n1Yraj/+wG89F4ho2pfSk+JHpMM+nyFmtp35
	70v/u3YcWnboVyzrlEUN4yVVHQLWQsE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887721;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZaALWPuLTHjwdVRxmpr9e75142YieH+vRKKSIlnxcf0=;
	b=NaPl1J/AJMh4niNaNZsRlXwrI4bLkeuDaKBAHVaFNCp30UcLKH8arv/l8JT5CvDfYSOWB2
	1O6i7THMjT+5yVAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZaALWPuLTHjwdVRxmpr9e75142YieH+vRKKSIlnxcf0=;
	b=u5KhHini5jMKboEeBl69gPbFmqDRAnnGuV1rdWU2xMN37f2o3BxhaK9gq7ifZBmri0ZfQy
	Ct+EqI5gnSg8B81dJ54Nn/u6PoOyxMWQ02n1Yraj/+wG89F4ho2pfSk+JHpMM+nyFmtp35
	70v/u3YcWnboVyzrlEUN4yVVHQLWQsE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887721;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZaALWPuLTHjwdVRxmpr9e75142YieH+vRKKSIlnxcf0=;
	b=NaPl1J/AJMh4niNaNZsRlXwrI4bLkeuDaKBAHVaFNCp30UcLKH8arv/l8JT5CvDfYSOWB2
	1O6i7THMjT+5yVAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E89E9137BA;
	Thu, 13 Mar 2025 17:42:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AN9wN+gY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 41/89] ASoC: rt715: Convert to RUNTIME_PM_OPS() & co
Date: Thu, 13 Mar 2025 18:40:46 +0100
Message-ID: <20250313174139.29942-42-tiwai@suse.de>
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
 sound/soc/codecs/rt715-sdca-sdw.c | 10 +++++-----
 sound/soc/codecs/rt715-sdw.c      | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdca-sdw.c b/sound/soc/codecs/rt715-sdca-sdw.c
index c8dabb9b16b5..ce7d8955efc3 100644
--- a/sound/soc/codecs/rt715-sdca-sdw.c
+++ b/sound/soc/codecs/rt715-sdca-sdw.c
@@ -205,7 +205,7 @@ static const struct sdw_device_id rt715_sdca_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt715_sdca_id);
 
-static int __maybe_unused rt715_dev_suspend(struct device *dev)
+static int rt715_dev_suspend(struct device *dev)
 {
 	struct rt715_sdca_priv *rt715 = dev_get_drvdata(dev);
 
@@ -222,7 +222,7 @@ static int __maybe_unused rt715_dev_suspend(struct device *dev)
 
 #define RT715_PROBE_TIMEOUT 5000
 
-static int __maybe_unused rt715_dev_resume(struct device *dev)
+static int rt715_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt715_sdca_priv *rt715 = dev_get_drvdata(dev);
@@ -263,14 +263,14 @@ static int __maybe_unused rt715_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt715_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt715_dev_suspend, rt715_dev_resume)
-	SET_RUNTIME_PM_OPS(rt715_dev_suspend, rt715_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt715_dev_suspend, rt715_dev_resume)
+	RUNTIME_PM_OPS(rt715_dev_suspend, rt715_dev_resume, NULL)
 };
 
 static struct sdw_driver rt715_sdw_driver = {
 	.driver = {
 		.name = "rt715-sdca",
-		.pm = &rt715_pm,
+		.pm = pm_ptr(&rt715_pm),
 	},
 	.probe = rt715_sdca_sdw_probe,
 	.remove = rt715_sdca_sdw_remove,
diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index cd702574c84b..a3df4bbedf86 100644
--- a/sound/soc/codecs/rt715-sdw.c
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -485,7 +485,7 @@ static const struct sdw_device_id rt715_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt715_id);
 
-static int __maybe_unused rt715_dev_suspend(struct device *dev)
+static int rt715_dev_suspend(struct device *dev)
 {
 	struct rt715_priv *rt715 = dev_get_drvdata(dev);
 
@@ -499,7 +499,7 @@ static int __maybe_unused rt715_dev_suspend(struct device *dev)
 
 #define RT715_PROBE_TIMEOUT 5000
 
-static int __maybe_unused rt715_dev_resume(struct device *dev)
+static int rt715_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt715_priv *rt715 = dev_get_drvdata(dev);
@@ -530,14 +530,14 @@ static int __maybe_unused rt715_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt715_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt715_dev_suspend, rt715_dev_resume)
-	SET_RUNTIME_PM_OPS(rt715_dev_suspend, rt715_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt715_dev_suspend, rt715_dev_resume)
+	RUNTIME_PM_OPS(rt715_dev_suspend, rt715_dev_resume, NULL)
 };
 
 static struct sdw_driver rt715_sdw_driver = {
 	.driver = {
 		   .name = "rt715",
-		   .pm = &rt715_pm,
+		   .pm = pm_ptr(&rt715_pm),
 		   },
 	.probe = rt715_sdw_probe,
 	.remove = rt715_sdw_remove,
-- 
2.43.0

