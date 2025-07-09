Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B87292B24
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 16:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077176; cv=none; b=kU9YFhTat2b7JTsdzG/Am+2eKKB5uVy32tV2/q2CQVLkGGKjIyQ/qVsFVyOcq1VVsHwcq1oxc0USFTyBqveiDn5N4GsRmNjCCsO2P2r38axufTFWDhxiETM8SLmPccqXWWXzUeIqhZwZEeAr04T9IKAK45Ns+VpDsxRwLtd+XKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077176; c=relaxed/simple;
	bh=pN39YiOZmXZXo47lL9+EyO3aDzoaj6qjdohT5t/vehA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l8MUJjgY5v5QlwRNGdu5EFfuU3VwDI+JWSHEq7AUii4rFGtFmF4ka4RZEVZWmyCOfwlI6nVcKNQ9YE2n5raJgnDk6UHStdWuhipPSH+QKJjcu7RFk3zRO1Ze+Q+xq2hOa4a1QA7a6S1jKQg2xxR0cCPUYAEJLVZG7yKD0f+sTKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gjFzRYVK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wGtQlb84; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WPl0VEb/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yQ4rPhb+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gjFzRYVK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wGtQlb84";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WPl0VEb/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yQ4rPhb+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E4AAB1F452;
	Wed,  9 Jul 2025 16:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RgpkaKW05p1ZaFqMV1yi8WHm4KrzSz++np4rGgnoJQU=;
	b=gjFzRYVKDcP/CFGqbpdWoWubS4cxDjTlQkwCiriRKsQAaYxH3BrncQIln9BOWW5EG+YKu2
	eIHyEVLUQhcVEsKgDpbLKuKptXItVVrmoFv1fZ03l/8F/lLqfWH4DP7SuFgrX1EfWzTgKg
	QFJot6vSFDx+4rpFoT4wzBQRO7p2JyI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077091;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RgpkaKW05p1ZaFqMV1yi8WHm4KrzSz++np4rGgnoJQU=;
	b=wGtQlb84RV8ZtguPv4O/Go16f9F8VhVJq139L70Du1J0Ue6vTpkUvOnbplezspcXjwC7Yt
	S9lkPxAlPPsJUKAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="WPl0VEb/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yQ4rPhb+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RgpkaKW05p1ZaFqMV1yi8WHm4KrzSz++np4rGgnoJQU=;
	b=WPl0VEb/5CpLysa5NyibeHsbEwEy1+oGtXAIAdKIHwa/3Z90+rxvhI2wtN650EgjWPCBIl
	17nxJlj70Y9hQWMZ20zgo6YDGGRGPzvSFUAIOZCLeuWmTlP+YvuncrxgHiTb9iAeNnbEHn
	oDMNkwNuGR9QDknE3/hAWZ9GCZ6O71c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077090;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RgpkaKW05p1ZaFqMV1yi8WHm4KrzSz++np4rGgnoJQU=;
	b=yQ4rPhb+t+UoOXGO6N15/tLepiwYv6D5RufhKEf0mjtARZAr2o9W87YSVbCpgcqCZvssg7
	uBLX54WFJ37lU0CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A2C38136DC;
	Wed,  9 Jul 2025 16:04:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aNGQJiKTbmhDEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Jul 2025 16:04:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Kailang <kailang@realtek.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	patches@opensource.cirrus.com,
	Baojun Xu <baojun.xu@ti.com>,
	bo liu <bo.liu@senarytech.com>
Subject: [PATCH 09/27] ALSA: hda: Introduce hda_codec_driver ops
Date: Wed,  9 Jul 2025 18:04:12 +0200
Message-ID: <20250709160434.1859-10-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250709160434.1859-1-tiwai@suse.de>
References: <20250709160434.1859-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL53w3f6h5bdz1qypc3i64rty7)];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: E4AAB1F452
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Until now, we use "patch_ops" embedded in hda_codec object for
defining the callbacks that are used in various places to manage
HD-audio codec.  But from the device driver POV, this should have been
rather the driver ops, instead of the callbacks in the codec object.

This patch defines the driver ops for HD-audio codec driver as the
replacement.  We reuse the same struct hda_codec_ops, and this is put
as hda_codec_driver.ops.  When the driver->ops callbacks are defined,
they are called primarily instead of codec->patch_ops callbacks.

With converting to the driver ops, there is no need to pass the ugly
patch_ops handling in hda_device_id tables.  That is, driver_data
field of hda_device_id becomes really optional and it can be used for
passing the codec-specific data (e.g. specifying a model).

The codec entries after the conversion should be with HDA_CODEC_ID()
and co, instead of the former HDA_CODEC_ENTRY().

Once after converting all codec drivers to use driver ops, we can get
rid of codec patch_ops.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/hda_codec.h    | 26 +++++++++++++++--
 sound/hda/common/bind.c      | 27 +++++++++++++----
 sound/hda/common/codec.c     | 56 ++++++++++++++++++++++++++----------
 sound/hda/common/hda_local.h | 11 +++++++
 sound/soc/codecs/hda.c       | 27 +++++++++++------
 sound/soc/codecs/hdac_hda.c  | 28 +++++++++++++-----
 6 files changed, 137 insertions(+), 38 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index c1fe6290d04d..a725ac48c20c 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -27,6 +27,7 @@ struct hda_beep;
 struct hda_codec;
 struct hda_pcm;
 struct hda_pcm_stream;
+struct hda_codec_ops;
 
 /*
  * codec bus
@@ -79,6 +80,17 @@ typedef int (*hda_codec_patch_t)(struct hda_codec *);
 #define HDA_CODEC_ID_GENERIC_HDMI	0x00000101
 #define HDA_CODEC_ID_GENERIC		0x00000201
 
+#define HDA_CODEC_ID_REV_MODEL(_vid, _rev, _name, _model)	  \
+	{ .vendor_id = (_vid), .rev_id = (_rev), .name = (_name), \
+	  .api_version = HDA_DEV_LEGACY, .driver_data = (_model) }
+#define HDA_CODEC_ID_MODEL(_vid, _name, _model)	  \
+	HDA_CODEC_ID_REV_MODEL(_vid, 0, _name, _model)
+#define HDA_CODEC_ID_REV(_vid, _rev, _name) \
+	HDA_CODEC_ID_REV_MODEL(_vid, _rev, _name, 0)
+#define HDA_CODEC_ID(_vid, _name) \
+	HDA_CODEC_ID_REV(_vid, 0, _name)
+
+/* old macros for patch_ops -- to be deprecated */
 #define HDA_CODEC_REV_ENTRY(_vid, _rev, _name, _patch) \
 	{ .vendor_id = (_vid), .rev_id = (_rev), .name = (_name), \
 	  .api_version = HDA_DEV_LEGACY, \
@@ -89,8 +101,12 @@ typedef int (*hda_codec_patch_t)(struct hda_codec *);
 struct hda_codec_driver {
 	struct hdac_driver core;
 	const struct hda_device_id *id;
+	const struct hda_codec_ops *ops;
 };
 
+#define hda_codec_to_driver(codec) \
+	container_of((codec)->core.dev.driver, struct hda_codec_driver, core.driver)
+
 int __hda_codec_driver_register(struct hda_codec_driver *drv, const char *name,
 			       struct module *owner);
 #define hda_codec_driver_register(drv) \
@@ -102,6 +118,8 @@ void hda_codec_driver_unregister(struct hda_codec_driver *drv);
 
 /* ops set by the preset patch */
 struct hda_codec_ops {
+	int (*probe)(struct hda_codec *codec, const struct hda_device_id *id);
+	void (*remove)(struct hda_codec *codec);
 	int (*build_controls)(struct hda_codec *codec);
 	int (*build_pcms)(struct hda_codec *codec);
 	int (*init)(struct hda_codec *codec);
@@ -184,7 +202,7 @@ struct hda_codec {
 	/* set by patch */
 	struct hda_codec_ops patch_ops;
 
-	/* PCM to create, set by patch_ops.build_pcms callback */
+	/* PCM to create, set by hda_codec_ops.build_pcms callback */
 	struct list_head pcm_list_head;
 	refcount_t pcm_ref;
 	wait_queue_head_t remove_sleep;
@@ -478,7 +496,11 @@ extern const struct dev_pm_ops hda_codec_driver_pm;
 static inline
 int hda_call_check_power_status(struct hda_codec *codec, hda_nid_t nid)
 {
-	if (codec->patch_ops.check_power_status)
+	struct hda_codec_driver *driver = hda_codec_to_driver(codec);
+
+	if (driver->ops && driver->ops->check_power_status)
+		return driver->ops->check_power_status(codec, nid);
+	else if (codec->patch_ops.check_power_status)
 		return codec->patch_ops.check_power_status(codec, nid);
 	return 0;
 }
diff --git a/sound/hda/common/bind.c b/sound/hda/common/bind.c
index df8f88beddd0..56975178f533 100644
--- a/sound/hda/common/bind.c
+++ b/sound/hda/common/bind.c
@@ -42,6 +42,7 @@ static int hda_codec_match(struct hdac_device *dev, const struct hdac_driver *dr
 static void hda_codec_unsol_event(struct hdac_device *dev, unsigned int ev)
 {
 	struct hda_codec *codec = container_of(dev, struct hda_codec, core);
+	struct hda_codec_driver *driver = hda_codec_to_driver(codec);
 
 	/* ignore unsol events during shutdown */
 	if (codec->card->shutdown || codec->bus->shutdown)
@@ -51,7 +52,9 @@ static void hda_codec_unsol_event(struct hdac_device *dev, unsigned int ev)
 	if (codec->core.dev.power.power_state.event != PM_EVENT_ON)
 		return;
 
-	if (codec->patch_ops.unsol_event)
+	if (driver->ops && driver->ops->unsol_event)
+		driver->ops->unsol_event(codec, ev);
+	else if (codec->patch_ops.unsol_event)
 		codec->patch_ops.unsol_event(codec, ev);
 }
 
@@ -87,6 +90,7 @@ static int hda_codec_driver_probe(struct device *dev)
 {
 	struct hda_codec *codec = dev_to_hda_codec(dev);
 	struct module *owner = dev->driver->owner;
+	struct hda_codec_driver *driver = hda_codec_to_driver(codec);
 	hda_codec_patch_t patch;
 	int err;
 
@@ -111,11 +115,17 @@ static int hda_codec_driver_probe(struct device *dev)
 		goto error;
 	}
 
-	patch = (hda_codec_patch_t)codec->preset->driver_data;
-	if (patch) {
-		err = patch(codec);
+	if (driver->ops && driver->ops->probe) {
+		err = driver->ops->probe(codec, codec->preset);
 		if (err < 0)
 			goto error_module_put;
+	} else {
+		patch = (hda_codec_patch_t)codec->preset->driver_data;
+		if (patch) {
+			err = patch(codec);
+			if (err < 0)
+				goto error_module_put;
+		}
 	}
 
 	err = snd_hda_codec_build_pcms(codec);
@@ -136,7 +146,9 @@ static int hda_codec_driver_probe(struct device *dev)
 	return 0;
 
  error_module:
-	if (codec->patch_ops.free)
+	if (driver->ops && driver->ops->remove)
+		driver->ops->remove(codec);
+	else if (codec->patch_ops.free)
 		codec->patch_ops.free(codec);
  error_module_put:
 	module_put(owner);
@@ -150,6 +162,7 @@ static int hda_codec_driver_probe(struct device *dev)
 static int hda_codec_driver_remove(struct device *dev)
 {
 	struct hda_codec *codec = dev_to_hda_codec(dev);
+	struct hda_codec_driver *driver = hda_codec_to_driver(codec);
 
 	if (codec->bus->core.ext_ops) {
 		if (WARN_ON(!codec->bus->core.ext_ops->hdev_detach))
@@ -163,7 +176,9 @@ static int hda_codec_driver_remove(struct device *dev)
 		wait_event(codec->remove_sleep, !refcount_read(&codec->pcm_ref));
 	snd_power_sync_ref(codec->bus->card);
 
-	if (codec->patch_ops.free)
+	if (driver->ops && driver->ops->remove)
+		driver->ops->remove(codec);
+	else if (codec->patch_ops.free)
 		codec->patch_ops.free(codec);
 	snd_hda_codec_cleanup_for_unbind(codec);
 	codec->preset = NULL;
diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index cb72e9655c8a..8899be764d68 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -1114,6 +1114,7 @@ void snd_hda_codec_setup_stream(struct hda_codec *codec, hda_nid_t nid,
 				u32 stream_tag,
 				int channel_id, int format)
 {
+	struct hda_codec_driver *driver = hda_codec_to_driver(codec);
 	struct hda_codec *c;
 	struct hda_cvt_setup *p;
 	int type;
@@ -1129,7 +1130,9 @@ void snd_hda_codec_setup_stream(struct hda_codec *codec, hda_nid_t nid,
 	if (!p)
 		return;
 
-	if (codec->patch_ops.stream_pm)
+	if (driver->ops && driver->ops->stream_pm)
+		driver->ops->stream_pm(codec, nid, true);
+	else if (codec->patch_ops.stream_pm)
 		codec->patch_ops.stream_pm(codec, nid, true);
 	if (codec->pcm_format_first)
 		update_pcm_format(codec, p, nid, format);
@@ -1190,7 +1193,9 @@ EXPORT_SYMBOL_GPL(__snd_hda_codec_cleanup_stream);
 static void really_cleanup_stream(struct hda_codec *codec,
 				  struct hda_cvt_setup *q)
 {
+	struct hda_codec_driver *driver = hda_codec_to_driver(codec);
 	hda_nid_t nid = q->nid;
+
 	if (q->stream_tag || q->channel_id)
 		snd_hda_codec_write(codec, nid, 0, AC_VERB_SET_CHANNEL_STREAMID, 0);
 	if (q->format_id)
@@ -1198,7 +1203,9 @@ static void really_cleanup_stream(struct hda_codec *codec,
 );
 	memset(q, 0, sizeof(*q));
 	q->nid = nid;
-	if (codec->patch_ops.stream_pm)
+	if (driver->ops && driver->ops->stream_pm)
+		driver->ops->stream_pm(codec, nid, false);
+	else if (codec->patch_ops.stream_pm)
 		codec->patch_ops.stream_pm(codec, nid, false);
 }
 
@@ -2746,6 +2753,7 @@ EXPORT_SYMBOL_GPL(snd_hda_codec_eapd_power_filter);
 static unsigned int hda_set_power_state(struct hda_codec *codec,
 					unsigned int power_state)
 {
+	struct hda_codec_driver *driver = hda_codec_to_driver(codec);
 	hda_nid_t fg = codec->core.afg ? codec->core.afg : codec->core.mfg;
 	int count;
 	unsigned int state;
@@ -2762,7 +2770,10 @@ static unsigned int hda_set_power_state(struct hda_codec *codec,
 
 	/* repeat power states setting at most 10 times*/
 	for (count = 0; count < 10; count++) {
-		if (codec->patch_ops.set_power_state)
+		/* might be called before binding to driver, too */
+		if (driver && driver->ops && driver->ops->set_power_state)
+			driver->ops->set_power_state(codec, fg, power_state);
+		else if (codec->patch_ops.set_power_state)
 			codec->patch_ops.set_power_state(codec, fg,
 							 power_state);
 		else {
@@ -2842,10 +2853,13 @@ void snd_hda_update_power_acct(struct hda_codec *codec)
  */
 static unsigned int hda_call_codec_suspend(struct hda_codec *codec)
 {
+	struct hda_codec_driver *driver = hda_codec_to_driver(codec);
 	unsigned int state;
 
 	snd_hdac_enter_pm(&codec->core);
-	if (codec->patch_ops.suspend)
+	if (driver->ops && driver->ops->suspend)
+		driver->ops->suspend(codec);
+	else if (codec->patch_ops.suspend)
 		codec->patch_ops.suspend(codec);
 	if (!codec->no_stream_clean_at_suspend)
 		hda_cleanup_all_streams(codec);
@@ -2860,6 +2874,8 @@ static unsigned int hda_call_codec_suspend(struct hda_codec *codec)
  */
 static void hda_call_codec_resume(struct hda_codec *codec)
 {
+	struct hda_codec_driver *driver = hda_codec_to_driver(codec);
+
 	snd_hdac_enter_pm(&codec->core);
 	if (codec->core.regmap)
 		regcache_mark_dirty(codec->core.regmap);
@@ -2870,11 +2886,12 @@ static void hda_call_codec_resume(struct hda_codec *codec)
 	restore_shutup_pins(codec);
 	hda_exec_init_verbs(codec);
 	snd_hda_jack_set_dirty_all(codec);
-	if (codec->patch_ops.resume)
+	if (driver->ops && driver->ops->resume)
+		driver->ops->resume(codec);
+	else if (codec->patch_ops.resume)
 		codec->patch_ops.resume(codec);
 	else {
-		if (codec->patch_ops.init)
-			codec->patch_ops.init(codec);
+		snd_hda_codec_init(codec);
 		snd_hda_regmap_sync(codec);
 	}
 
@@ -3059,15 +3076,20 @@ EXPORT_SYMBOL_GPL(snd_pcm_2_1_chmaps);
 
 int snd_hda_codec_build_controls(struct hda_codec *codec)
 {
+	struct hda_codec_driver *driver = hda_codec_to_driver(codec);
 	int err = 0;
+
 	hda_exec_init_verbs(codec);
 	/* continue to initialize... */
-	if (codec->patch_ops.init)
-		err = codec->patch_ops.init(codec);
-	if (!err && codec->patch_ops.build_controls)
-		err = codec->patch_ops.build_controls(codec);
-	if (err < 0)
-		return err;
+	err = snd_hda_codec_init(codec);
+	if (!err) {
+		if (driver->ops && driver->ops->build_controls)
+			err = driver->ops->build_controls(codec);
+		else if (codec->patch_ops.build_controls)
+			err = codec->patch_ops.build_controls(codec);
+		if (err < 0)
+			return err;
+	}
 
 	/* we create chmaps here instead of build_pcms */
 	err = add_std_chmaps(codec);
@@ -3253,16 +3275,20 @@ static int get_empty_pcm_device(struct hda_bus *bus, unsigned int type)
 /* call build_pcms ops of the given codec and set up the default parameters */
 int snd_hda_codec_parse_pcms(struct hda_codec *codec)
 {
+	struct hda_codec_driver *driver = hda_codec_to_driver(codec);
 	struct hda_pcm *cpcm;
 	int err;
 
 	if (!list_empty(&codec->pcm_list_head))
 		return 0; /* already parsed */
 
-	if (!codec->patch_ops.build_pcms)
+	if (driver->ops && driver->ops->build_pcms)
+		err = driver->ops->build_pcms(codec);
+	else if (codec->patch_ops.build_pcms)
+		err = codec->patch_ops.build_pcms(codec);
+	else
 		return 0;
 
-	err = codec->patch_ops.build_pcms(codec);
 	if (err < 0) {
 		codec_err(codec, "cannot build PCMs for #%d (error %d)\n",
 			  codec->core.addr, err);
diff --git a/sound/hda/common/hda_local.h b/sound/hda/common/hda_local.h
index 428aa5a06ead..654fe1156d56 100644
--- a/sound/hda/common/hda_local.h
+++ b/sound/hda/common/hda_local.h
@@ -652,6 +652,17 @@ unsigned int snd_hda_codec_eapd_power_filter(struct hda_codec *codec,
 
 void snd_hda_codec_shutdown(struct hda_codec *codec);
 
+static inline int snd_hda_codec_init(struct hda_codec *codec)
+{
+	struct hda_codec_driver *driver = hda_codec_to_driver(codec);
+
+	if (driver->ops && driver->ops->init)
+		return driver->ops->init(codec);
+	else if (codec->patch_ops.init)
+		return codec->patch_ops.init(codec);
+	return 0;
+}
+
 /*
  * AMP control callbacks
  */
diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
index dc7794c9ac44..ddb31001657e 100644
--- a/sound/soc/codecs/hda.c
+++ b/sound/soc/codecs/hda.c
@@ -173,6 +173,7 @@ EXPORT_SYMBOL_GPL(hda_codec_probe_complete);
 static int hda_codec_probe(struct snd_soc_component *component)
 {
 	struct hda_codec *codec = dev_to_hda_codec(component->dev);
+	struct hda_codec_driver *driver = hda_codec_to_driver(codec);
 	struct hdac_device *hdev = &codec->core;
 	struct hdac_bus *bus = hdev->bus;
 	struct hdac_ext_link *hlink;
@@ -214,14 +215,19 @@ static int hda_codec_probe(struct snd_soc_component *component)
 		goto err;
 	}
 
-	patch = (hda_codec_patch_t)codec->preset->driver_data;
-	if (!patch) {
-		dev_err(&hdev->dev, "no patch specified\n");
-		ret = -EINVAL;
-		goto err;
+	if (driver->ops && driver->ops->probe) {
+		ret = driver->ops->probe(codec, codec->preset);
+	} else {
+		patch = (hda_codec_patch_t)codec->preset->driver_data;
+		if (!patch) {
+			dev_err(&hdev->dev, "no patch specified\n");
+			ret = -EINVAL;
+			goto err;
+		}
+
+		ret = patch(codec);
 	}
 
-	ret = patch(codec);
 	if (ret < 0) {
 		dev_err(&hdev->dev, "codec init failed: %d\n", ret);
 		goto err;
@@ -252,7 +258,9 @@ static int hda_codec_probe(struct snd_soc_component *component)
 complete_err:
 	hda_codec_unregister_dais(codec, component);
 parse_pcms_err:
-	if (codec->patch_ops.free)
+	if (driver->ops && driver->ops->remove)
+		driver->ops->remove(codec);
+	else if (codec->patch_ops.free)
 		codec->patch_ops.free(codec);
 err:
 	snd_hda_codec_cleanup_for_unbind(codec);
@@ -271,6 +279,7 @@ static int hda_codec_probe(struct snd_soc_component *component)
 static void hda_codec_remove(struct snd_soc_component *component)
 {
 	struct hda_codec *codec = dev_to_hda_codec(component->dev);
+	struct hda_codec_driver *driver = hda_codec_to_driver(codec);
 	struct hdac_device *hdev = &codec->core;
 	struct hdac_bus *bus = hdev->bus;
 	struct hdac_ext_link *hlink;
@@ -281,7 +290,9 @@ static void hda_codec_remove(struct snd_soc_component *component)
 
 	hda_codec_unregister_dais(codec, component);
 
-	if (codec->patch_ops.free)
+	if (driver->ops && driver->ops->remove)
+		driver->ops->remove(codec);
+	else if (codec->patch_ops.free)
 		codec->patch_ops.free(codec);
 
 	snd_hda_codec_cleanup_for_unbind(codec);
diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index 29c88de5508b..7bb7845d5e43 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -409,6 +409,7 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 			snd_soc_component_get_dapm(component);
 	struct hdac_device *hdev = &hda_pvt->codec->core;
 	struct hda_codec *hcodec = hda_pvt->codec;
+	struct hda_codec_driver *driver = hda_codec_to_driver(hcodec);
 	struct hdac_ext_link *hlink;
 	hda_codec_patch_t patch;
 	int ret;
@@ -484,15 +485,23 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 		goto error_pm;
 	}
 
-	patch = (hda_codec_patch_t)hcodec->preset->driver_data;
-	if (patch) {
-		ret = patch(hcodec);
+	if (driver->ops && driver->ops->probe) {
+		ret = driver->ops->probe(hcodec, hcodec->preset);
 		if (ret < 0) {
-			dev_err(&hdev->dev, "%s: patch failed %d\n", __func__, ret);
+			dev_err(&hdev->dev, "%s: probe failed %d\n", __func__, ret);
 			goto error_regmap;
 		}
 	} else {
-		dev_dbg(&hdev->dev, "%s: no patch file found\n", __func__);
+		patch = (hda_codec_patch_t)hcodec->preset->driver_data;
+		if (patch) {
+			ret = patch(hcodec);
+			if (ret < 0) {
+				dev_err(&hdev->dev, "%s: patch failed %d\n", __func__, ret);
+				goto error_regmap;
+			}
+		} else {
+			dev_dbg(&hdev->dev, "%s: no patch file found\n", __func__);
+		}
 	}
 
 	ret = snd_hda_codec_parse_pcms(hcodec);
@@ -531,7 +540,9 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 	return 0;
 
 error_patch:
-	if (hcodec->patch_ops.free)
+	if (driver->ops && driver->ops->remove)
+		driver->ops->remove(hcodec);
+	else if (hcodec->patch_ops.free)
 		hcodec->patch_ops.free(hcodec);
 error_regmap:
 	snd_hdac_regmap_exit(hdev);
@@ -548,6 +559,7 @@ static void hdac_hda_codec_remove(struct snd_soc_component *component)
 		      snd_soc_component_get_drvdata(component);
 	struct hdac_device *hdev = &hda_pvt->codec->core;
 	struct hda_codec *codec = hda_pvt->codec;
+	struct hda_codec_driver *driver = hda_codec_to_driver(codec);
 	struct hdac_ext_link *hlink = NULL;
 
 	hlink = snd_hdac_ext_bus_get_hlink_by_name(hdev->bus, dev_name(&hdev->dev));
@@ -559,7 +571,9 @@ static void hdac_hda_codec_remove(struct snd_soc_component *component)
 	pm_runtime_disable(&hdev->dev);
 	snd_hdac_ext_bus_link_put(hdev->bus, hlink);
 
-	if (codec->patch_ops.free)
+	if (driver->ops && driver->ops->remove)
+		driver->ops->remove(codec);
+	else if (codec->patch_ops.free)
 		codec->patch_ops.free(codec);
 
 	snd_hda_codec_cleanup_for_unbind(codec);
-- 
2.50.0

