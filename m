Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03FF30E855
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 07:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756279783; cv=none; b=lmizR+4ULRuuTesrw/7u86EKiON00jKIT6/tvRqtjNu2J5WybcRg4fWNDRMIgeMutt4UAzmOGNYF+lHA7HDtFSxROd3XrUGIdliFEm6neG9E0rOSHgtnO37Nq5YjWTdPZ8QIqPHj0F61B5lYjusdf/Hfo7nftTB/bSos7Oru5Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756279783; c=relaxed/simple;
	bh=WG0GwESq09r1vnUhRNDlYN7RgpJ3k0XXuntbp6q0fQY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQiwqY3AiW693/KlpO6DOez9iSKp+hOMyMyGxVKA/LRpRogGoutNShp4C/2gc9BABxlbDoGqulhvGnBI6uEpCtU7j3Y5Ar3JiNom6SZJD9DWk3UunjHSEWXWYuOV7SxqL6IDd7pLJlSSQiX7+NSzL1vHsQFrP9NBM096efG5O5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2RG444Dx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=p4LUzW2D; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2RG444Dx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=p4LUzW2D; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2RG444Dx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p4LUzW2D";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2RG444Dx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p4LUzW2D"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A33CE1FEE4;
	Wed, 27 Aug 2025 07:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8wNQ83d27F6PvUm5tqiS+mrNRbjHwOtWTpyZ/7nxVGQ=;
	b=2RG444DxxA3v5whmp0zsYOtyOPptHoUWiEfyerpMduMoKVlTbF2e72Y/jxRwXMsgwf7oTU
	I2nOwSkLkT+vs0uPOvdwY27/OLPNXEiOxek75yEFkHOgPKHGncmZE+pdM4T8cAA7ZABsMV
	Q6aFSUlDtmn+bUOG/sLSktpABjI4hfY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279760;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8wNQ83d27F6PvUm5tqiS+mrNRbjHwOtWTpyZ/7nxVGQ=;
	b=p4LUzW2DMxKKChrXuOsuNagbDkjd6NLU2w3SrQeH5Y/1yCeJqOn6Ucp4kOVsiJnRxRQa9T
	N3ZrH07dq54vnjCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8wNQ83d27F6PvUm5tqiS+mrNRbjHwOtWTpyZ/7nxVGQ=;
	b=2RG444DxxA3v5whmp0zsYOtyOPptHoUWiEfyerpMduMoKVlTbF2e72Y/jxRwXMsgwf7oTU
	I2nOwSkLkT+vs0uPOvdwY27/OLPNXEiOxek75yEFkHOgPKHGncmZE+pdM4T8cAA7ZABsMV
	Q6aFSUlDtmn+bUOG/sLSktpABjI4hfY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279760;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8wNQ83d27F6PvUm5tqiS+mrNRbjHwOtWTpyZ/7nxVGQ=;
	b=p4LUzW2DMxKKChrXuOsuNagbDkjd6NLU2w3SrQeH5Y/1yCeJqOn6Ucp4kOVsiJnRxRQa9T
	N3ZrH07dq54vnjCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8843F13867;
	Wed, 27 Aug 2025 07:29:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UJAEINCzrmjoagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 07:29:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 08/25] ALSA: hda/core: Use guard() for mutex locks
Date: Wed, 27 Aug 2025 09:28:48 +0200
Message-ID: <20250827072916.31933-9-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827072916.31933-1-tiwai@suse.de>
References: <20250827072916.31933-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Replace the manual mutex lock/unlock pairs with guard().

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/core/bus.c            |  8 ++------
 sound/hda/core/component.c      |  6 ++----
 sound/hda/core/device.c         | 23 ++++++++++------------
 sound/hda/core/ext/controller.c |  6 ++----
 sound/hda/core/regmap.c         | 35 +++++++++++----------------------
 5 files changed, 27 insertions(+), 51 deletions(-)

diff --git a/sound/hda/core/bus.c b/sound/hda/core/bus.c
index d497414a5538..9b196c915f37 100644
--- a/sound/hda/core/bus.c
+++ b/sound/hda/core/bus.c
@@ -87,12 +87,8 @@ EXPORT_SYMBOL_GPL(snd_hdac_bus_exit);
 int snd_hdac_bus_exec_verb(struct hdac_bus *bus, unsigned int addr,
 			   unsigned int cmd, unsigned int *res)
 {
-	int err;
-
-	mutex_lock(&bus->cmd_mutex);
-	err = snd_hdac_bus_exec_verb_unlocked(bus, addr, cmd, res);
-	mutex_unlock(&bus->cmd_mutex);
-	return err;
+	guard(mutex)(&bus->cmd_mutex);
+	return snd_hdac_bus_exec_verb_unlocked(bus, addr, cmd, res);
 }
 
 /**
diff --git a/sound/hda/core/component.c b/sound/hda/core/component.c
index 9c82a2864a2f..04755903880e 100644
--- a/sound/hda/core/component.c
+++ b/sound/hda/core/component.c
@@ -69,14 +69,14 @@ void snd_hdac_display_power(struct hdac_bus *bus, unsigned int idx, bool enable)
 
 	dev_dbg(bus->dev, "display power %s\n", str_enable_disable(enable));
 
-	mutex_lock(&bus->lock);
+	guard(mutex)(&bus->lock);
 	if (enable)
 		set_bit(idx, &bus->display_power_status);
 	else
 		clear_bit(idx, &bus->display_power_status);
 
 	if (!acomp || !acomp->ops)
-		goto unlock;
+		return;
 
 	if (bus->display_power_status) {
 		if (!bus->display_power_active) {
@@ -99,8 +99,6 @@ void snd_hdac_display_power(struct hdac_bus *bus, unsigned int idx, bool enable)
 			bus->display_power_active = 0;
 		}
 	}
- unlock:
-	mutex_unlock(&bus->lock);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_display_power);
 
diff --git a/sound/hda/core/device.c b/sound/hda/core/device.c
index 018f9e176b1b..160c8d0453b0 100644
--- a/sound/hda/core/device.c
+++ b/sound/hda/core/device.c
@@ -147,9 +147,9 @@ int snd_hdac_device_register(struct hdac_device *codec)
 	err = device_add(&codec->dev);
 	if (err < 0)
 		return err;
-	mutex_lock(&codec->widget_lock);
-	err = hda_widget_sysfs_init(codec);
-	mutex_unlock(&codec->widget_lock);
+	scoped_guard(mutex, &codec->widget_lock) {
+		err = hda_widget_sysfs_init(codec);
+	}
 	if (err < 0) {
 		device_del(&codec->dev);
 		return err;
@@ -166,9 +166,9 @@ EXPORT_SYMBOL_GPL(snd_hdac_device_register);
 void snd_hdac_device_unregister(struct hdac_device *codec)
 {
 	if (device_is_registered(&codec->dev)) {
-		mutex_lock(&codec->widget_lock);
-		hda_widget_sysfs_exit(codec);
-		mutex_unlock(&codec->widget_lock);
+		scoped_guard(mutex, &codec->widget_lock) {
+			hda_widget_sysfs_exit(codec);
+		}
 		device_del(&codec->dev);
 		snd_hdac_bus_remove_device(codec->bus, codec);
 	}
@@ -411,25 +411,22 @@ int snd_hdac_refresh_widgets(struct hdac_device *codec)
 	 * Serialize against multiple threads trying to update the sysfs
 	 * widgets array.
 	 */
-	mutex_lock(&codec->widget_lock);
+	guard(mutex)(&codec->widget_lock);
 	nums = snd_hdac_get_sub_nodes(codec, codec->afg, &start_nid);
 	if (!start_nid || nums <= 0 || nums >= 0xff) {
 		dev_err(&codec->dev, "cannot read sub nodes for FG 0x%02x\n",
 			codec->afg);
-		err = -EINVAL;
-		goto unlock;
+		return -EINVAL;
 	}
 
 	err = hda_widget_sysfs_reinit(codec, start_nid, nums);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	codec->num_nodes = nums;
 	codec->start_nid = start_nid;
 	codec->end_nid = start_nid + nums;
-unlock:
-	mutex_unlock(&codec->widget_lock);
-	return err;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_hdac_refresh_widgets);
 
diff --git a/sound/hda/core/ext/controller.c b/sound/hda/core/ext/controller.c
index c84754434d16..9eea3ea2dae0 100644
--- a/sound/hda/core/ext/controller.c
+++ b/sound/hda/core/ext/controller.c
@@ -300,7 +300,7 @@ int snd_hdac_ext_bus_link_get(struct hdac_bus *bus,
 	unsigned long codec_mask;
 	int ret = 0;
 
-	mutex_lock(&bus->lock);
+	guard(mutex)(&bus->lock);
 
 	/*
 	 * if we move from 0 to 1, count will be 1 so power up this link
@@ -331,7 +331,6 @@ int snd_hdac_ext_bus_link_get(struct hdac_bus *bus,
 			bus->codec_mask = codec_mask;
 	}
 
-	mutex_unlock(&bus->lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_link_get);
@@ -343,7 +342,7 @@ int snd_hdac_ext_bus_link_put(struct hdac_bus *bus,
 	struct hdac_ext_link *hlink_tmp;
 	bool link_up = false;
 
-	mutex_lock(&bus->lock);
+	guard(mutex)(&bus->lock);
 
 	/*
 	 * if we move from 1 to 0, count will be 0
@@ -369,7 +368,6 @@ int snd_hdac_ext_bus_link_put(struct hdac_bus *bus,
 		}
 	}
 
-	mutex_unlock(&bus->lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_link_put);
diff --git a/sound/hda/core/regmap.c b/sound/hda/core/regmap.c
index 97cee096a286..e7b866fc52c1 100644
--- a/sound/hda/core/regmap.c
+++ b/sound/hda/core/regmap.c
@@ -425,15 +425,11 @@ EXPORT_SYMBOL_GPL(snd_hdac_regmap_add_vendor_verb);
 static int reg_raw_write(struct hdac_device *codec, unsigned int reg,
 			 unsigned int val)
 {
-	int err;
-
-	mutex_lock(&codec->regmap_lock);
+	guard(mutex)(&codec->regmap_lock);
 	if (!codec->regmap)
-		err = hda_reg_write(codec, reg, val);
+		return hda_reg_write(codec, reg, val);
 	else
-		err = regmap_write(codec->regmap, reg, val);
-	mutex_unlock(&codec->regmap_lock);
-	return err;
+		return regmap_write(codec->regmap, reg, val);
 }
 
 /* a helper macro to call @func_call; retry with power-up if failed */
@@ -466,15 +462,11 @@ EXPORT_SYMBOL_GPL(snd_hdac_regmap_write_raw);
 static int reg_raw_read(struct hdac_device *codec, unsigned int reg,
 			unsigned int *val, bool uncached)
 {
-	int err;
-
-	mutex_lock(&codec->regmap_lock);
+	guard(mutex)(&codec->regmap_lock);
 	if (uncached || !codec->regmap)
-		err = hda_reg_read(codec, reg, val);
+		return hda_reg_read(codec, reg, val);
 	else
-		err = regmap_read(codec->regmap, reg, val);
-	mutex_unlock(&codec->regmap_lock);
-	return err;
+		return regmap_read(codec->regmap, reg, val);
 }
 
 static int __snd_hdac_regmap_read_raw(struct hdac_device *codec,
@@ -515,7 +507,7 @@ static int reg_raw_update(struct hdac_device *codec, unsigned int reg,
 	bool change;
 	int err;
 
-	mutex_lock(&codec->regmap_lock);
+	guard(mutex)(&codec->regmap_lock);
 	if (codec->regmap) {
 		err = regmap_update_bits_check(codec->regmap, reg, mask, val,
 					       &change);
@@ -533,7 +525,6 @@ static int reg_raw_update(struct hdac_device *codec, unsigned int reg,
 			}
 		}
 	}
-	mutex_unlock(&codec->regmap_lock);
 	return err;
 }
 
@@ -556,17 +547,14 @@ EXPORT_SYMBOL_GPL(snd_hdac_regmap_update_raw);
 static int reg_raw_update_once(struct hdac_device *codec, unsigned int reg,
 			       unsigned int mask, unsigned int val)
 {
-	int err = 0;
-
 	if (!codec->regmap)
 		return reg_raw_update(codec, reg, mask, val);
 
-	mutex_lock(&codec->regmap_lock);
+	guard(mutex)(&codec->regmap_lock);
 	/* Discard any updates to already initialised registers. */
 	if (!regcache_reg_cached(codec->regmap, reg))
-		err = regmap_update_bits(codec->regmap, reg, mask, val);
-	mutex_unlock(&codec->regmap_lock);
-	return err;
+		return regmap_update_bits(codec->regmap, reg, mask, val);
+	return 0;
 }
 
 /**
@@ -593,9 +581,8 @@ EXPORT_SYMBOL_GPL(snd_hdac_regmap_update_raw_once);
  */
 void snd_hdac_regmap_sync(struct hdac_device *codec)
 {
-	mutex_lock(&codec->regmap_lock);
+	guard(mutex)(&codec->regmap_lock);
 	if (codec->regmap)
 		regcache_sync(codec->regmap);
-	mutex_unlock(&codec->regmap_lock);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_regmap_sync);
-- 
2.50.1

