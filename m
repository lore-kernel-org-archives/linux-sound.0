Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7075325FA10
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 14:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894343; cv=none; b=U89embl5QaEiH3ug0YmQwCDyaoF5TII+KVi+PUi+75n7I/9A9RFoTmKCDpK5YifT4PEExCnQaZf37krEeVhuWp0ymwOnxyTn2JrIVuuspAa2SAKhCKon6iHGmOqakn5kEwEeEbwXes/JLoSIiaI7EjQieO22pFWi7HTIWVtXDkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894343; c=relaxed/simple;
	bh=gUoiFVz7/LGADazDPCqJPdGSs63S7aazp1meK1YUNX8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o55VJlyLbvTqMuVX7myWEGgMAm/ie4afnjPA4rj/wgMOG+NlzzYK8GONboxSOTEa2S0g8GdBxz6BDKgIxvVAa6DZmHl7AhXBbl0Ldt6VlRlkXAqTxHOahtsKa1aNTmD6uVxEJ50fsvN0rIDBcaiH82mWG4gZwVvDIX7IjtcA0XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vqgJ7uK0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=J92TerU9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vqgJ7uK0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=J92TerU9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vqgJ7uK0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J92TerU9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vqgJ7uK0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J92TerU9"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6322B5BCE2;
	Tue, 16 Dec 2025 14:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aB5WszLRYCoppqrF5XpbfDOPVxbYca7AInre/KuKFOM=;
	b=vqgJ7uK0Xr4eEEyWqI2kHu+xV8qrRY4zJASp1MKl4MSTX1oSFrK0C2nci9fGa/NqzU6NVE
	zOJ74bMUHKSjf8vwG8NAYNYrki2QapiKvJhTeJQEa2dD8wh6bio8NK/JYT7mcow1PZY9Jt
	cdmO2OwI+tE49sBaHngIvQ18WJaFWPQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aB5WszLRYCoppqrF5XpbfDOPVxbYca7AInre/KuKFOM=;
	b=J92TerU9wfMGFajUrxX2GiklEeEt1sKECEP34dbyaO77EYE6kvWOWE8EF0H6G8G28ddyVX
	s65oDncPUwsMSFBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765894326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aB5WszLRYCoppqrF5XpbfDOPVxbYca7AInre/KuKFOM=;
	b=vqgJ7uK0Xr4eEEyWqI2kHu+xV8qrRY4zJASp1MKl4MSTX1oSFrK0C2nci9fGa/NqzU6NVE
	zOJ74bMUHKSjf8vwG8NAYNYrki2QapiKvJhTeJQEa2dD8wh6bio8NK/JYT7mcow1PZY9Jt
	cdmO2OwI+tE49sBaHngIvQ18WJaFWPQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765894326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aB5WszLRYCoppqrF5XpbfDOPVxbYca7AInre/KuKFOM=;
	b=J92TerU9wfMGFajUrxX2GiklEeEt1sKECEP34dbyaO77EYE6kvWOWE8EF0H6G8G28ddyVX
	s65oDncPUwsMSFBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 563983EA63;
	Tue, 16 Dec 2025 14:12:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GEOLFLZoQWk7OwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 16 Dec 2025 14:12:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 3/5] ALSA: hda/tas2781: Clean up runtime PM with guard()
Date: Tue, 16 Dec 2025 15:11:48 +0100
Message-ID: <20251216141154.172218-4-tiwai@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216141154.172218-1-tiwai@suse.de>
References: <20251216141154.172218-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.78 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.18)[-0.887];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.78

Use guard(pm_runtime_active_auto) for replacing the manual calls of
pm_runtime_get_sync() and pm_runtime_put_autosuspend().

Along with this, we can use guard() for the tas_priv->codec_lock mutex
in tasdev_fw_ready(), too (that aligns both i2c and spi codes).

Merely code cleanups and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 10 +++-------
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c |  7 ++-----
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index c8619995b1d7..c74f83d4ec7f 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -500,8 +500,8 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	struct hda_codec *codec = tas_priv->codec;
 	int ret;
 
-	pm_runtime_get_sync(tas_priv->dev);
-	mutex_lock(&tas_priv->codec_lock);
+	guard(pm_runtime_active_auto)(tas_priv->dev);
+	guard(mutex)(&tas_priv->codec_lock);
 
 	ret = tasdevice_rca_parser(tas_priv, fmw);
 	if (ret)
@@ -537,9 +537,7 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	}
 
 out:
-	mutex_unlock(&tas_hda->priv->codec_lock);
 	release_firmware(fmw);
-	pm_runtime_put_autosuspend(tas_hda->dev);
 }
 
 static int tas2781_hda_bind(struct device *dev, struct device *master,
@@ -571,7 +569,7 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
 		break;
 	}
 
-	pm_runtime_get_sync(dev);
+	guard(pm_runtime_active_auto)(dev);
 
 	comp->dev = dev;
 
@@ -581,8 +579,6 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
 	if (!ret)
 		comp->playback_hook = tas2781_hda_playback_hook;
 
-	pm_runtime_put_autosuspend(dev);
-
 	return ret;
 }
 
diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
index b9a55672bf15..f8412c5df919 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
@@ -636,7 +636,7 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	struct hda_codec *codec = tas_priv->codec;
 	int ret, val;
 
-	pm_runtime_get_sync(tas_priv->dev);
+	guard(pm_runtime_active_auto)(tas_priv->dev);
 	guard(mutex)(&tas_priv->codec_lock);
 
 	ret = tasdevice_rca_parser(tas_priv, fmw);
@@ -699,7 +699,6 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	tas2781_save_calibration(tas_hda);
 out:
 	release_firmware(fmw);
-	pm_runtime_put_autosuspend(tas_hda->priv->dev);
 }
 
 static int tas2781_hda_bind(struct device *dev, struct device *master,
@@ -720,7 +719,7 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
 
 	codec = parent->codec;
 
-	pm_runtime_get_sync(dev);
+	guard(pm_runtime_active_auto)(dev);
 
 	comp->dev = dev;
 
@@ -731,8 +730,6 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
 	if (!ret)
 		comp->playback_hook = tas2781_hda_playback_hook;
 
-	pm_runtime_put_autosuspend(dev);
-
 	return ret;
 }
 
-- 
2.52.0

