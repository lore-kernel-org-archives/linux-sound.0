Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E64622A7F6
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205439; cv=none; b=Sny+raOlptcCP2MAm2ZI3waIsOOK8WN8RCamVtYxhgmYEopjMapOGZs5aD4ea/8u7jmMCaWnOQxWHYdiZQwwUXyB5nLIXQXFaewGZwLHeqe9KusZ88U96Csmi6do2PC/cumn4+yKYkHNDpzq9PY2BVVlL9odCDnU0KzFaN7QNlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205439; c=relaxed/simple;
	bh=X+Ri6eRRwxfuy8eHwg2qOt4C1EQoRVknxX9aavbPV0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E0etmCBXqChYT2CFTVk+v5RxLDpyaEubvgyeNDt0eiQJWs8OgIcFfA2b5yMVPWfwfixXNC0YiDlSA8KtyeXtDzXQ1a+f7WvG56lfZHjq4K1VFbhXKsebsSn3UhlmoVMHFmJlUHPJXob8gK9WP+64D6/JPvizgNh5slcuyl6dhF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OBilZn8q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2ZhSqOnd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OBilZn8q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2ZhSqOnd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OBilZn8q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2ZhSqOnd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OBilZn8q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2ZhSqOnd"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0A4FA20128;
	Mon, 17 Mar 2025 09:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4rma3L8nAXDGjO0013kzJGlisS097AO6IpWq2+ZLQ0c=;
	b=OBilZn8qbU6315pWDnqQCgitxf0Z0IIL0sbckLY0CSHZ+rHzgDUCcR+dFySBnQxJc+u/D9
	I6S+r1YlzOXffSafr2yM3Tr40kiEvIwGaojeKxS2bIgoHGQjHzScWuPfl9+aDnCk3h+AsW
	KPa1IVQWlfPMBkbAcM4re6yEm9pTNns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205376;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4rma3L8nAXDGjO0013kzJGlisS097AO6IpWq2+ZLQ0c=;
	b=2ZhSqOndJ+ZjbIqLHAHBM/vI5kGyvMHGhqtrWNSJtjx7ljX9LUby/psVJFeTghvMfwpx3V
	iU/qzn26TmzbuTDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4rma3L8nAXDGjO0013kzJGlisS097AO6IpWq2+ZLQ0c=;
	b=OBilZn8qbU6315pWDnqQCgitxf0Z0IIL0sbckLY0CSHZ+rHzgDUCcR+dFySBnQxJc+u/D9
	I6S+r1YlzOXffSafr2yM3Tr40kiEvIwGaojeKxS2bIgoHGQjHzScWuPfl9+aDnCk3h+AsW
	KPa1IVQWlfPMBkbAcM4re6yEm9pTNns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205376;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4rma3L8nAXDGjO0013kzJGlisS097AO6IpWq2+ZLQ0c=;
	b=2ZhSqOndJ+ZjbIqLHAHBM/vI5kGyvMHGhqtrWNSJtjx7ljX9LUby/psVJFeTghvMfwpx3V
	iU/qzn26TmzbuTDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D8556132CF;
	Mon, 17 Mar 2025 09:56:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uKKUM7/x12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 16/88] ASoC: cx2072x: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:54:38 +0100
Message-ID: <20250317095603.20073-17-tiwai@suse.de>
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
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
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

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/cx2072x.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index 8cfec8dcf839..934526f8f292 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -1611,7 +1611,7 @@ static const struct regmap_config cx2072x_regmap = {
 	.reg_write = cx2072x_reg_write,
 };
 
-static int __maybe_unused cx2072x_runtime_suspend(struct device *dev)
+static int cx2072x_runtime_suspend(struct device *dev)
 {
 	struct cx2072x_priv *cx2072x = dev_get_drvdata(dev);
 
@@ -1619,7 +1619,7 @@ static int __maybe_unused cx2072x_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused cx2072x_runtime_resume(struct device *dev)
+static int cx2072x_runtime_resume(struct device *dev)
 {
 	struct cx2072x_priv *cx2072x = dev_get_drvdata(dev);
 
@@ -1696,17 +1696,15 @@ MODULE_DEVICE_TABLE(acpi, cx2072x_acpi_match);
 #endif
 
 static const struct dev_pm_ops cx2072x_runtime_pm = {
-	SET_RUNTIME_PM_OPS(cx2072x_runtime_suspend, cx2072x_runtime_resume,
-			   NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(cx2072x_runtime_suspend, cx2072x_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct i2c_driver cx2072x_i2c_driver = {
 	.driver = {
 		.name = "cx2072x",
 		.acpi_match_table = ACPI_PTR(cx2072x_acpi_match),
-		.pm = &cx2072x_runtime_pm,
+		.pm = pm_ptr(&cx2072x_runtime_pm),
 	},
 	.probe = cx2072x_i2c_probe,
 	.remove = cx2072x_i2c_remove,
-- 
2.43.0

