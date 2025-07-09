Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F354C28F955
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 16:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077605; cv=none; b=Nm+5MKIpgC+m3gK6Y9oFJrqA1E/fG7D//DajiTvLj1fNR2oufSN3A/jnS14OIY+ZnXFRjCgDUWKBGhH/SPWXFL+ctr+Vz0QZ6pUns2U9r3g+achUUk6h7xISeOC4Xs19I9KlHcm0ANfnrSKuU71FaxS1/fs5xcoIHQL6VlOzaC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077605; c=relaxed/simple;
	bh=YNUWZUtbTzw78MR3amoqr+SCxJRoxoTUXPJ6eg/H29g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WxKdxYvg5M3/RtUP35R7FaOIhHtm2zEdgjhzQeVUUjpeZOix0L4SxZeJoMNkC6NUuoXfwJBl/yaTxpmbKWped8Ooe/QJ4duGWoMqTI+AEy9iKLlAeD+5Krd37Iuf8Yl1Wv4iFkyd0s+YYed/ACPHc/k9X8UEb/wS6aAh7BK07/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KTZwjbG2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3Td0SPrr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KTZwjbG2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3Td0SPrr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KTZwjbG2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3Td0SPrr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KTZwjbG2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3Td0SPrr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0EA6B2118A;
	Wed,  9 Jul 2025 16:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077102; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aYbJbjf+Ron5mRCwy6bgfPYbh3JJayvKm6Hghd/d31Y=;
	b=KTZwjbG2y/QDu/qRXegHW32PRcdzWpQEm1P1blmiZnm7RJPdgbe0983zKs418SkUTHqdMb
	zI4i8rgkqkevKV8soG2B3+/zE41CgpF/xD9JOY0aL3dMGfeCPPnQgPGjABibDz1v5ycq7C
	WweN/LnT96EFkqFDhVCHW3dqjlFqydg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077102;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aYbJbjf+Ron5mRCwy6bgfPYbh3JJayvKm6Hghd/d31Y=;
	b=3Td0SPrrHV7TQL5YxkAT9W7l63rB4PRJ868xYklmEz+5Bll1RB2qYXsoryMeYoyQ75BJYf
	kAXxtrRWYdQQKbCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077102; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aYbJbjf+Ron5mRCwy6bgfPYbh3JJayvKm6Hghd/d31Y=;
	b=KTZwjbG2y/QDu/qRXegHW32PRcdzWpQEm1P1blmiZnm7RJPdgbe0983zKs418SkUTHqdMb
	zI4i8rgkqkevKV8soG2B3+/zE41CgpF/xD9JOY0aL3dMGfeCPPnQgPGjABibDz1v5ycq7C
	WweN/LnT96EFkqFDhVCHW3dqjlFqydg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077102;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aYbJbjf+Ron5mRCwy6bgfPYbh3JJayvKm6Hghd/d31Y=;
	b=3Td0SPrrHV7TQL5YxkAT9W7l63rB4PRJ868xYklmEz+5Bll1RB2qYXsoryMeYoyQ75BJYf
	kAXxtrRWYdQQKbCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BE474136DC;
	Wed,  9 Jul 2025 16:05:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WBFBLS2TbmhDEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Jul 2025 16:05:01 +0000
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
Subject: [PATCH 25/27] ALSA: hda: Drop superfluous driver->ops NULL checks
Date: Wed,  9 Jul 2025 18:04:28 +0200
Message-ID: <20250709160434.1859-26-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RL7bz5f8woybp4997xe1n6ecoy)];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

After all conversions, driver->ops became a must in most places
(except for the codec power setup which might be called before binding
to the codec driver), hence we can get rid of the superfluous
driver->ops NULL checks, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/common/bind.c      |  6 +++---
 sound/hda/common/codec.c     | 15 +++++++--------
 sound/hda/common/hda_local.h |  2 +-
 sound/soc/codecs/hda.c       |  4 ++--
 sound/soc/codecs/hdac_hda.c  |  4 ++--
 5 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/sound/hda/common/bind.c b/sound/hda/common/bind.c
index f85c640dd54f..bb1090b65699 100644
--- a/sound/hda/common/bind.c
+++ b/sound/hda/common/bind.c
@@ -52,7 +52,7 @@ static void hda_codec_unsol_event(struct hdac_device *dev, unsigned int ev)
 	if (codec->core.dev.power.power_state.event != PM_EVENT_ON)
 		return;
 
-	if (driver->ops && driver->ops->unsol_event)
+	if (driver->ops->unsol_event)
 		driver->ops->unsol_event(codec, ev);
 }
 
@@ -138,7 +138,7 @@ static int hda_codec_driver_probe(struct device *dev)
 	return 0;
 
  error_module:
-	if (driver->ops && driver->ops->remove)
+	if (driver->ops->remove)
 		driver->ops->remove(codec);
  error_module_put:
 	module_put(owner);
@@ -166,7 +166,7 @@ static int hda_codec_driver_remove(struct device *dev)
 		wait_event(codec->remove_sleep, !refcount_read(&codec->pcm_ref));
 	snd_power_sync_ref(codec->bus->card);
 
-	if (driver->ops && driver->ops->remove)
+	if (driver->ops->remove)
 		driver->ops->remove(codec);
 	snd_hda_codec_cleanup_for_unbind(codec);
 	codec->preset = NULL;
diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index 33121d002087..fa07a296abe8 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -1129,7 +1129,7 @@ void snd_hda_codec_setup_stream(struct hda_codec *codec, hda_nid_t nid,
 	if (!p)
 		return;
 
-	if (driver->ops && driver->ops->stream_pm)
+	if (driver->ops->stream_pm)
 		driver->ops->stream_pm(codec, nid, true);
 	if (codec->pcm_format_first)
 		update_pcm_format(codec, p, nid, format);
@@ -1200,7 +1200,7 @@ static void really_cleanup_stream(struct hda_codec *codec,
 );
 	memset(q, 0, sizeof(*q));
 	q->nid = nid;
-	if (driver->ops && driver->ops->stream_pm)
+	if (driver->ops->stream_pm)
 		driver->ops->stream_pm(codec, nid, false);
 }
 
@@ -2849,7 +2849,7 @@ static unsigned int hda_call_codec_suspend(struct hda_codec *codec)
 	unsigned int state;
 
 	snd_hdac_enter_pm(&codec->core);
-	if (driver->ops && driver->ops->suspend)
+	if (driver->ops->suspend)
 		driver->ops->suspend(codec);
 	if (!codec->no_stream_clean_at_suspend)
 		hda_cleanup_all_streams(codec);
@@ -2876,7 +2876,7 @@ static void hda_call_codec_resume(struct hda_codec *codec)
 	restore_shutup_pins(codec);
 	hda_exec_init_verbs(codec);
 	snd_hda_jack_set_dirty_all(codec);
-	if (driver->ops && driver->ops->resume)
+	if (driver->ops->resume)
 		driver->ops->resume(codec);
 	else {
 		snd_hda_codec_init(codec);
@@ -3071,7 +3071,7 @@ int snd_hda_codec_build_controls(struct hda_codec *codec)
 	/* continue to initialize... */
 	err = snd_hda_codec_init(codec);
 	if (!err) {
-		if (driver->ops && driver->ops->build_controls)
+		if (driver->ops->build_controls)
 			err = driver->ops->build_controls(codec);
 		if (err < 0)
 			return err;
@@ -3268,11 +3268,10 @@ int snd_hda_codec_parse_pcms(struct hda_codec *codec)
 	if (!list_empty(&codec->pcm_list_head))
 		return 0; /* already parsed */
 
-	if (driver->ops && driver->ops->build_pcms)
-		err = driver->ops->build_pcms(codec);
-	else
+	if (!driver->ops->build_pcms)
 		return 0;
 
+	err = driver->ops->build_pcms(codec);
 	if (err < 0) {
 		codec_err(codec, "cannot build PCMs for #%d (error %d)\n",
 			  codec->core.addr, err);
diff --git a/sound/hda/common/hda_local.h b/sound/hda/common/hda_local.h
index e56bea4c9357..a7e53277a0fe 100644
--- a/sound/hda/common/hda_local.h
+++ b/sound/hda/common/hda_local.h
@@ -656,7 +656,7 @@ static inline int snd_hda_codec_init(struct hda_codec *codec)
 {
 	struct hda_codec_driver *driver = hda_codec_to_driver(codec);
 
-	if (driver->ops && driver->ops->init)
+	if (driver->ops->init)
 		return driver->ops->init(codec);
 	return 0;
 }
diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
index 126270ffd418..c8344e28df3d 100644
--- a/sound/soc/codecs/hda.c
+++ b/sound/soc/codecs/hda.c
@@ -250,7 +250,7 @@ static int hda_codec_probe(struct snd_soc_component *component)
 complete_err:
 	hda_codec_unregister_dais(codec, component);
 parse_pcms_err:
-	if (driver->ops && driver->ops->remove)
+	if (driver->ops->remove)
 		driver->ops->remove(codec);
 err:
 	snd_hda_codec_cleanup_for_unbind(codec);
@@ -280,7 +280,7 @@ static void hda_codec_remove(struct snd_soc_component *component)
 
 	hda_codec_unregister_dais(codec, component);
 
-	if (driver->ops && driver->ops->remove)
+	if (driver->ops->remove)
 		driver->ops->remove(codec);
 
 	snd_hda_codec_cleanup_for_unbind(codec);
diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index 191cb8427664..afd8edf10fdc 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -531,7 +531,7 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 	return 0;
 
 error_patch:
-	if (driver->ops && driver->ops->remove)
+	if (driver->ops->remove)
 		driver->ops->remove(hcodec);
 error_regmap:
 	snd_hdac_regmap_exit(hdev);
@@ -560,7 +560,7 @@ static void hdac_hda_codec_remove(struct snd_soc_component *component)
 	pm_runtime_disable(&hdev->dev);
 	snd_hdac_ext_bus_link_put(hdev->bus, hlink);
 
-	if (driver->ops && driver->ops->remove)
+	if (driver->ops->remove)
 		driver->ops->remove(codec);
 
 	snd_hda_codec_cleanup_for_unbind(codec);
-- 
2.50.0

