Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57E322D4C8
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205445; cv=none; b=jOzmtLELzMwg+9zf5xv68FUmgpE/w6JYOukm5kPgq28HK5n78XWCKJZsIMKSe0dRUa2jwZz/xoOpUlJAMe/rRJCK6NbzSUc+TK9UWbDXU9vOqppE1nITO8J6nYQjSE1Q3rwIreSZ0ltnKr948vdR6ltQJrBnM5C7qnDV25IeMDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205445; c=relaxed/simple;
	bh=eRwrs1TCQtJJw1GGNfmnDIU+6DcUM2sg8rdZG3Hv8n8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RYw9KWUwPYxnwHi3EsmXfln+nUTpEKzbeg/noiXGlRTOSE0GqeBu4KmHizmp7TGcFeNILOhfKyKY/KvyxyY34kzxiIrg+YVkHyjsqi41dcpV+eYJoHPU5fQWq/MZI+seFJIO5qyy2o4csb6VlWZi7DhMc2xgMasktZQkJhRJqX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uiLEbPPN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1C6idKNO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uiLEbPPN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1C6idKNO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uiLEbPPN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1C6idKNO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uiLEbPPN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1C6idKNO"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 353772017A;
	Mon, 17 Mar 2025 09:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JBf3Wuu9+HW4ZVCiMuA/iIHy2LnxQaWLO/2sxigSlmw=;
	b=uiLEbPPNFi/szIXwAF9dlYvYdWY9FTiNzH36hob8iiuqk8fj2gvbMTepaX5kl4mwbEJsC+
	RiGDT0tpG4k2B+R3DDSaHeyQ3xZe9EYIRvci4uksl2WN/RIa+5iJhMXO5diRg8bk0wM9BS
	W6P/asJEf/0SeIRGOIzPt5uUojjH3zU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205376;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JBf3Wuu9+HW4ZVCiMuA/iIHy2LnxQaWLO/2sxigSlmw=;
	b=1C6idKNObBOf/QL/iog4TNmlUWAdFkYSEgayY0EaM5/E+tT4CnO+88aNYNzXNry0cqoTC8
	jltRTedLerU1sRAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JBf3Wuu9+HW4ZVCiMuA/iIHy2LnxQaWLO/2sxigSlmw=;
	b=uiLEbPPNFi/szIXwAF9dlYvYdWY9FTiNzH36hob8iiuqk8fj2gvbMTepaX5kl4mwbEJsC+
	RiGDT0tpG4k2B+R3DDSaHeyQ3xZe9EYIRvci4uksl2WN/RIa+5iJhMXO5diRg8bk0wM9BS
	W6P/asJEf/0SeIRGOIzPt5uUojjH3zU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205376;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JBf3Wuu9+HW4ZVCiMuA/iIHy2LnxQaWLO/2sxigSlmw=;
	b=1C6idKNObBOf/QL/iog4TNmlUWAdFkYSEgayY0EaM5/E+tT4CnO+88aNYNzXNry0cqoTC8
	jltRTedLerU1sRAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0F7D913A2C;
	Mon, 17 Mar 2025 09:56:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2FKHAsDx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	support.opensource@diasemi.com,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 17/88] ASoC: da7213: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:54:39 +0100
Message-ID: <20250317095603.20073-18-tiwai@suse.de>
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
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
X-Spam-Flag: NO

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: support.opensource@diasemi.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/da7213.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index eb97ac73ec06..a4496cc26902 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -2224,7 +2224,7 @@ static void da7213_i2c_remove(struct i2c_client *i2c)
 	pm_runtime_disable(&i2c->dev);
 }
 
-static int __maybe_unused da7213_runtime_suspend(struct device *dev)
+static int da7213_runtime_suspend(struct device *dev)
 {
 	struct da7213_priv *da7213 = dev_get_drvdata(dev);
 
@@ -2235,7 +2235,7 @@ static int __maybe_unused da7213_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused da7213_runtime_resume(struct device *dev)
+static int da7213_runtime_resume(struct device *dev)
 {
 	struct da7213_priv *da7213 = dev_get_drvdata(dev);
 	int ret;
@@ -2248,8 +2248,8 @@ static int __maybe_unused da7213_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops da7213_pm = {
-	SET_RUNTIME_PM_OPS(da7213_runtime_suspend, da7213_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+	RUNTIME_PM_OPS(da7213_runtime_suspend, da7213_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static const struct i2c_device_id da7213_i2c_id[] = {
@@ -2264,7 +2264,7 @@ static struct i2c_driver da7213_i2c_driver = {
 		.name = "da7213",
 		.of_match_table = of_match_ptr(da7213_of_match),
 		.acpi_match_table = ACPI_PTR(da7213_acpi_match),
-		.pm = &da7213_pm,
+		.pm = pm_ptr(&da7213_pm),
 	},
 	.probe		= da7213_i2c_probe,
 	.remove		= da7213_i2c_remove,
-- 
2.43.0

