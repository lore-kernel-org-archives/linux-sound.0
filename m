Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6E21ADC86
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887821; cv=none; b=LKu3i80vzrt8O8Lx/6Cdu5UQnFVzIntrbRoGmmgFb6B1QwN5ccY63chKc+yrcXAbM9Km2qeErBceAWhkjuXG7F+bgO0XugwEbuj4TyOiVHhFQTfEWMEg50Vq/QLQwbgEqe4cuxSunHrVrD2zCo1mT7Af9J0L7oW4CWZrdj0Frek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887821; c=relaxed/simple;
	bh=FUfII2VSdR3k36KnNQ3CvRAWLnhKmUZhB9WtFgWeaGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ow2KIsTCEHWzUekdp34m/+fSw57/g5ILktr62vbCAkdo9o5kdoAhc7sKtov0nK7/cEVKh7S13vBq6lX4hx+UsaArCRe8FhYL9QyIpoQa2vv74nmMOfuDAcLrZYFdXcVWFMppladKsmpLb6wrlujskWmWXYf8UlLEFoWjvnmOa/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EjjMYKHn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QSfSYcOo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EjjMYKHn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QSfSYcOo; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EjjMYKHn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QSfSYcOo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EjjMYKHn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QSfSYcOo"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C2EFA1F79D;
	Thu, 13 Mar 2025 17:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Aa9U0ADXZ4ygTdEfqiE/J8IwIMFwgOntb0zE8Ssc4Q=;
	b=EjjMYKHnDA02iwRJiLz1IyEbxukkj3Ox66HbXFsQMVsvws4+Wda5KK8yUCDUVfpTzuLYgG
	XFVM4kIfqGHMShMcXr9niYnkE92iyC3nfQ7swRt5DEhT+iS6ZyFzWl19w6GjAppvN/iSJn
	51aDSDmaQalLQcCqV4V/Tt6LDQqGjiU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887719;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Aa9U0ADXZ4ygTdEfqiE/J8IwIMFwgOntb0zE8Ssc4Q=;
	b=QSfSYcOoMocQG3dWwXppYHvN7LoFkF6uVVQ9sFWI28ZbgwDHBZA/RPkKNrLCp4f6FO7Khn
	VDxoPuz41hLL/fDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Aa9U0ADXZ4ygTdEfqiE/J8IwIMFwgOntb0zE8Ssc4Q=;
	b=EjjMYKHnDA02iwRJiLz1IyEbxukkj3Ox66HbXFsQMVsvws4+Wda5KK8yUCDUVfpTzuLYgG
	XFVM4kIfqGHMShMcXr9niYnkE92iyC3nfQ7swRt5DEhT+iS6ZyFzWl19w6GjAppvN/iSJn
	51aDSDmaQalLQcCqV4V/Tt6LDQqGjiU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887719;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Aa9U0ADXZ4ygTdEfqiE/J8IwIMFwgOntb0zE8Ssc4Q=;
	b=QSfSYcOoMocQG3dWwXppYHvN7LoFkF6uVVQ9sFWI28ZbgwDHBZA/RPkKNrLCp4f6FO7Khn
	VDxoPuz41hLL/fDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9C5B6139D2;
	Thu, 13 Mar 2025 17:41:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KD3uJOcY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 34/89] ASoC: rt1320-sdw: Convert to RUNTIME_PM_OPS() & co
Date: Thu, 13 Mar 2025 18:40:39 +0100
Message-ID: <20250313174139.29942-35-tiwai@suse.de>
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
 sound/soc/codecs/rt1320-sdw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index d83b236a0450..f51ba345a16e 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -1458,7 +1458,7 @@ static const struct sdw_device_id rt1320_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt1320_id);
 
-static int __maybe_unused rt1320_dev_suspend(struct device *dev)
+static int rt1320_dev_suspend(struct device *dev)
 {
 	struct rt1320_sdw_priv *rt1320 = dev_get_drvdata(dev);
 
@@ -1472,7 +1472,7 @@ static int __maybe_unused rt1320_dev_suspend(struct device *dev)
 
 #define RT1320_PROBE_TIMEOUT 5000
 
-static int __maybe_unused rt1320_dev_resume(struct device *dev)
+static int rt1320_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1320_sdw_priv *rt1320 = dev_get_drvdata(dev);
@@ -1501,14 +1501,14 @@ static int __maybe_unused rt1320_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt1320_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt1320_dev_suspend, rt1320_dev_resume)
-	SET_RUNTIME_PM_OPS(rt1320_dev_suspend, rt1320_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt1320_dev_suspend, rt1320_dev_resume)
+	RUNTIME_PM_OPS(rt1320_dev_suspend, rt1320_dev_resume, NULL)
 };
 
 static struct sdw_driver rt1320_sdw_driver = {
 	.driver = {
 		.name = "rt1320-sdca",
-		.pm = &rt1320_pm,
+		.pm = pm_ptr(&rt1320_pm),
 	},
 	.probe = rt1320_sdw_probe,
 	.remove = rt1320_sdw_remove,
-- 
2.43.0

