Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CEB22ACD3
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205457; cv=none; b=TR2XRQR3erHv8z1nsTzCQEDEOmwZmxaxT8vNjlxGkhqkLW7H6UbJbYM9S/jocpQ51SX4AHhai/lXNl1BIQsH33oB7Gjx9ibSUGo2uRtO/3P+yl35mDhIeGQMdYo0TXlQ2jwnNCxuqjVoGsaizjB9GaHEx6J5oHfQeJtEQqcLu1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205457; c=relaxed/simple;
	bh=7HXfGINL74HYCKzi1NIrPZ3FvK5pYGxdhP2FtOQ3tCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eO/QRKRIDdItzk7EUp+3q+HpmO9yiIHp8e6i3ssPGVX5y98y6Xdf6EFX9KI8EtFJW+DNY+TYIiWJ7pHlWB4hLQUdF7Pxb0WYwuzq2wzLD/HqD3+/YfSDY10pbwyR3ZfOlj05JiOQtdJKJYAkBLyq/q3xt6zt6e1HCjG+SiovSiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PoVivPgu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=W++Oe38Q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PoVivPgu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=W++Oe38Q; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PoVivPgu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="W++Oe38Q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PoVivPgu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="W++Oe38Q"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AE2CC20228;
	Mon, 17 Mar 2025 09:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tNFw0ffHJiQUi1TtbBHOmkfkZ/JaOIQeBcrSdait7TA=;
	b=PoVivPguxL3p6UPJhi/frgEZh7yF8m1TA8xJ+H2+bkB1sf59yWSFuq4rZx8TW0xCznsrnT
	PJWzKo0zb2uut7nI3vGdEhe6mnh6rrer2GIl82yRNyhJuZxaLcB4j3Mbl6UEu63RwiTXJ9
	P7pyDJHw+fFk/KbbUZ8INsCi8wHL5Ys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205376;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tNFw0ffHJiQUi1TtbBHOmkfkZ/JaOIQeBcrSdait7TA=;
	b=W++Oe38Qn/dxpqy+l1qL03m6sRJ+GLzt2fU0XuBiFaOiOvNh4GJvc+drvfC7NztPmAeMAI
	adG6JhcR6yDYdYBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tNFw0ffHJiQUi1TtbBHOmkfkZ/JaOIQeBcrSdait7TA=;
	b=PoVivPguxL3p6UPJhi/frgEZh7yF8m1TA8xJ+H2+bkB1sf59yWSFuq4rZx8TW0xCznsrnT
	PJWzKo0zb2uut7nI3vGdEhe6mnh6rrer2GIl82yRNyhJuZxaLcB4j3Mbl6UEu63RwiTXJ9
	P7pyDJHw+fFk/KbbUZ8INsCi8wHL5Ys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205376;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tNFw0ffHJiQUi1TtbBHOmkfkZ/JaOIQeBcrSdait7TA=;
	b=W++Oe38Qn/dxpqy+l1qL03m6sRJ+GLzt2fU0XuBiFaOiOvNh4GJvc+drvfC7NztPmAeMAI
	adG6JhcR6yDYdYBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F009132CF;
	Mon, 17 Mar 2025 09:56:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GMl6IcDx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 20/88] ASoC: max98090: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:54:42 +0100
Message-ID: <20250317095603.20073-21-tiwai@suse.de>
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
X-Spam-Score: -6.80
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us dropping superfluous CONFIG_PM and
CONFIG_PM_SLEEP ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/max98090.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 790e2ae6dc18..22177c1ce160 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2604,7 +2604,6 @@ static void max98090_i2c_remove(struct i2c_client *client)
 	max98090_i2c_shutdown(client);
 }
 
-#ifdef CONFIG_PM
 static int max98090_runtime_resume(struct device *dev)
 {
 	struct max98090_priv *max98090 = dev_get_drvdata(dev);
@@ -2626,9 +2625,7 @@ static int max98090_runtime_suspend(struct device *dev)
 
 	return 0;
 }
-#endif
 
-#ifdef CONFIG_PM_SLEEP
 static int max98090_resume(struct device *dev)
 {
 	struct max98090_priv *max98090 = dev_get_drvdata(dev);
@@ -2645,12 +2642,10 @@ static int max98090_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops max98090_pm = {
-	SET_RUNTIME_PM_OPS(max98090_runtime_suspend,
-		max98090_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(NULL, max98090_resume)
+	RUNTIME_PM_OPS(max98090_runtime_suspend, max98090_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(NULL, max98090_resume)
 };
 
 #ifdef CONFIG_OF
@@ -2673,7 +2668,7 @@ MODULE_DEVICE_TABLE(acpi, max98090_acpi_match);
 static struct i2c_driver max98090_i2c_driver = {
 	.driver = {
 		.name = "max98090",
-		.pm = &max98090_pm,
+		.pm = pm_ptr(&max98090_pm),
 		.of_match_table = of_match_ptr(max98090_of_match),
 		.acpi_match_table = ACPI_PTR(max98090_acpi_match),
 	},
-- 
2.43.0

