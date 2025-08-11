Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D431F3B98
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906924; cv=none; b=Ge2iHPtVSa9/R0oPMytWgpGtHWNFXRfRACo0UjNC38aMgoReLuu7fdGyjLrLmfceHRXrMwjQu8ybFrLxAB+hwIMxmSe4jv/jvSX+1ubIzWRejjxyIBkYLLyqOtLGBGle2JCVFgZyqKbqD5WT+nwRbE32pGANCdlGX25fSCcbCdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906924; c=relaxed/simple;
	bh=vSlerRy8IvMvmMs76q5RirINnC47edZr+/bjcjs9PZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SPiHGI3Cs6tyMxb34ve6LMyQ8VNkjN/3ydgTMwq+DXVUb/9Tb/ZqFhQAu7VZ3n8wCR1im144f1dh0gmJgixHErynYSjqWHEbu5JjQttpJxzwXLtKywRXG8SVmQSPlpmBA+ge3waxcpoHlzlkepcCixicArPcTEMYH9nvUBouNNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r3ryY1BQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wnGCJkF5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r3ryY1BQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wnGCJkF5; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r3ryY1BQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wnGCJkF5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r3ryY1BQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wnGCJkF5"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A88E95BE19;
	Mon, 11 Aug 2025 10:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2i0QPcpSjphRCdPTyLqxwHydktOzg/8Wf2/E2bjxs4I=;
	b=r3ryY1BQywx5MIDBKP/+dM6Q3AahemDUq7Ee7P7io4nJgL58T4pYJGUW7I2Xs1uvcmptR/
	IZrxFFd7sBI7xU0RPFOsiwNnEoA1wOW8m6ip+ijGWOKaVS55stJRZuFGQ7UQpRTVlwk+y6
	ExXBBCzWkWb/Ai2uhxIz558KdllWHuM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2i0QPcpSjphRCdPTyLqxwHydktOzg/8Wf2/E2bjxs4I=;
	b=wnGCJkF5QHnc7rsiUNU9mk+aXVfrzEGtKM1LpW2b1DXt/xyUdQzwi+a2d0xaHNpHZ6msXY
	SLOH7L/vBhPWRLDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2i0QPcpSjphRCdPTyLqxwHydktOzg/8Wf2/E2bjxs4I=;
	b=r3ryY1BQywx5MIDBKP/+dM6Q3AahemDUq7Ee7P7io4nJgL58T4pYJGUW7I2Xs1uvcmptR/
	IZrxFFd7sBI7xU0RPFOsiwNnEoA1wOW8m6ip+ijGWOKaVS55stJRZuFGQ7UQpRTVlwk+y6
	ExXBBCzWkWb/Ai2uhxIz558KdllWHuM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2i0QPcpSjphRCdPTyLqxwHydktOzg/8Wf2/E2bjxs4I=;
	b=wnGCJkF5QHnc7rsiUNU9mk+aXVfrzEGtKM1LpW2b1DXt/xyUdQzwi+a2d0xaHNpHZ6msXY
	SLOH7L/vBhPWRLDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6CD9913A7E;
	Mon, 11 Aug 2025 10:08:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wHR1GQ7BmWiVBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:08:14 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 07/25] ALSA: hda/common: Use guard() for mutex locks
Date: Mon, 11 Aug 2025 12:07:41 +0200
Message-ID: <20250811100807.7962-8-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811100807.7962-1-tiwai@suse.de>
References: <20250811100807.7962-1-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RLf66hkhxcz6y1w5afddqk81z3)];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Replace the manual mutex lock/unlock pairs with guard().

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/common/codec.c      | 89 +++++++++++++++--------------------
 sound/hda/common/controller.c | 24 +++++-----
 sound/hda/common/sysfs.c      | 66 ++++++++++----------------
 3 files changed, 74 insertions(+), 105 deletions(-)

diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index 28cdbf6dd98a..9bc3d260e20d 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -38,13 +38,12 @@ static int call_exec_verb(struct hda_bus *bus, struct hda_codec *codec,
 	int err;
 
 	CLASS(snd_hda_power_pm, pm)(codec);
-	mutex_lock(&bus->core.cmd_mutex);
+	guard(mutex)(&bus->core.cmd_mutex);
 	if (flags & HDA_RW_NO_RESPONSE_FALLBACK)
 		bus->no_response_fallback = 1;
 	err = snd_hdac_bus_exec_verb_unlocked(&bus->core, codec->core.addr,
 					      cmd, res);
 	bus->no_response_fallback = 0;
-	mutex_unlock(&bus->core.cmd_mutex);
 	return err;
 }
 
@@ -532,11 +531,11 @@ unsigned int snd_hda_codec_get_pincfg(struct hda_codec *codec, hda_nid_t nid)
 #ifdef CONFIG_SND_HDA_RECONFIG
 	{
 		unsigned int cfg = 0;
-		mutex_lock(&codec->user_mutex);
-		pin = look_up_pincfg(codec, &codec->user_pins, nid);
-		if (pin)
-			cfg = pin->cfg;
-		mutex_unlock(&codec->user_mutex);
+		scoped_guard(mutex, &codec->user_mutex) {
+			pin = look_up_pincfg(codec, &codec->user_pins, nid);
+			if (pin)
+				cfg = pin->cfg;
+		}
 		if (cfg)
 			return cfg;
 	}
@@ -2180,13 +2179,12 @@ static int snd_hda_spdif_default_get(struct snd_kcontrol *kcontrol,
 
 	if (WARN_ON(codec->spdif_out.used <= idx))
 		return -EINVAL;
-	mutex_lock(&codec->spdif_mutex);
+	guard(mutex)(&codec->spdif_mutex);
 	spdif = snd_array_elem(&codec->spdif_out, idx);
 	ucontrol->value.iec958.status[0] = spdif->status & 0xff;
 	ucontrol->value.iec958.status[1] = (spdif->status >> 8) & 0xff;
 	ucontrol->value.iec958.status[2] = (spdif->status >> 16) & 0xff;
 	ucontrol->value.iec958.status[3] = (spdif->status >> 24) & 0xff;
-	mutex_unlock(&codec->spdif_mutex);
 
 	return 0;
 }
@@ -2289,7 +2287,7 @@ static int snd_hda_spdif_default_put(struct snd_kcontrol *kcontrol,
 
 	if (WARN_ON(codec->spdif_out.used <= idx))
 		return -EINVAL;
-	mutex_lock(&codec->spdif_mutex);
+	guard(mutex)(&codec->spdif_mutex);
 	spdif = snd_array_elem(&codec->spdif_out, idx);
 	nid = spdif->nid;
 	spdif->status = ucontrol->value.iec958.status[0] |
@@ -2302,7 +2300,6 @@ static int snd_hda_spdif_default_put(struct snd_kcontrol *kcontrol,
 	spdif->ctls = val;
 	if (change && nid != (u16)-1)
 		set_dig_out_convert(codec, nid, val & 0xff, (val >> 8) & 0xff);
-	mutex_unlock(&codec->spdif_mutex);
 	return change;
 }
 
@@ -2317,10 +2314,9 @@ static int snd_hda_spdif_out_switch_get(struct snd_kcontrol *kcontrol,
 
 	if (WARN_ON(codec->spdif_out.used <= idx))
 		return -EINVAL;
-	mutex_lock(&codec->spdif_mutex);
+	guard(mutex)(&codec->spdif_mutex);
 	spdif = snd_array_elem(&codec->spdif_out, idx);
 	ucontrol->value.integer.value[0] = spdif->ctls & AC_DIG1_ENABLE;
-	mutex_unlock(&codec->spdif_mutex);
 	return 0;
 }
 
@@ -2347,7 +2343,7 @@ static int snd_hda_spdif_out_switch_put(struct snd_kcontrol *kcontrol,
 
 	if (WARN_ON(codec->spdif_out.used <= idx))
 		return -EINVAL;
-	mutex_lock(&codec->spdif_mutex);
+	guard(mutex)(&codec->spdif_mutex);
 	spdif = snd_array_elem(&codec->spdif_out, idx);
 	nid = spdif->nid;
 	val = spdif->ctls & ~AC_DIG1_ENABLE;
@@ -2357,7 +2353,6 @@ static int snd_hda_spdif_out_switch_put(struct snd_kcontrol *kcontrol,
 	spdif->ctls = val;
 	if (change && nid != (u16)-1)
 		set_spdif_ctls(codec, nid, val & 0xff, -1);
-	mutex_unlock(&codec->spdif_mutex);
 	return change;
 }
 
@@ -2502,10 +2497,9 @@ void snd_hda_spdif_ctls_unassign(struct hda_codec *codec, int idx)
 
 	if (WARN_ON(codec->spdif_out.used <= idx))
 		return;
-	mutex_lock(&codec->spdif_mutex);
+	guard(mutex)(&codec->spdif_mutex);
 	spdif = snd_array_elem(&codec->spdif_out, idx);
 	spdif->nid = (u16)-1;
-	mutex_unlock(&codec->spdif_mutex);
 }
 EXPORT_SYMBOL_GPL(snd_hda_spdif_ctls_unassign);
 
@@ -2524,14 +2518,13 @@ void snd_hda_spdif_ctls_assign(struct hda_codec *codec, int idx, hda_nid_t nid)
 
 	if (WARN_ON(codec->spdif_out.used <= idx))
 		return;
-	mutex_lock(&codec->spdif_mutex);
+	guard(mutex)(&codec->spdif_mutex);
 	spdif = snd_array_elem(&codec->spdif_out, idx);
 	if (spdif->nid != nid) {
 		spdif->nid = nid;
 		val = spdif->ctls;
 		set_spdif_ctls(codec, nid, val & 0xff, (val >> 8) & 0xff);
 	}
-	mutex_unlock(&codec->spdif_mutex);
 }
 EXPORT_SYMBOL_GPL(snd_hda_spdif_ctls_assign);
 
@@ -2606,14 +2599,13 @@ static int snd_hda_spdif_in_switch_put(struct snd_kcontrol *kcontrol,
 	unsigned int val = !!ucontrol->value.integer.value[0];
 	int change;
 
-	mutex_lock(&codec->spdif_mutex);
+	guard(mutex)(&codec->spdif_mutex);
 	change = codec->spdif_in_enable != val;
 	if (change) {
 		codec->spdif_in_enable = val;
 		snd_hdac_regmap_write(&codec->core, nid,
 				      AC_VERB_SET_DIGI_CONVERT_1, val);
 	}
-	mutex_unlock(&codec->spdif_mutex);
 	return change;
 }
 
@@ -3183,7 +3175,8 @@ int snd_hda_codec_prepare(struct hda_codec *codec,
 			  struct snd_pcm_substream *substream)
 {
 	int ret;
-	mutex_lock(&codec->bus->prepare_mutex);
+
+	guard(mutex)(&codec->bus->prepare_mutex);
 	if (hinfo->ops.prepare)
 		ret = hinfo->ops.prepare(hinfo, codec, stream, format,
 					 substream);
@@ -3191,7 +3184,6 @@ int snd_hda_codec_prepare(struct hda_codec *codec,
 		ret = -ENODEV;
 	if (ret >= 0)
 		purify_inactive_streams(codec);
-	mutex_unlock(&codec->bus->prepare_mutex);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_hda_codec_prepare);
@@ -3208,10 +3200,9 @@ void snd_hda_codec_cleanup(struct hda_codec *codec,
 			   struct hda_pcm_stream *hinfo,
 			   struct snd_pcm_substream *substream)
 {
-	mutex_lock(&codec->bus->prepare_mutex);
+	guard(mutex)(&codec->bus->prepare_mutex);
 	if (hinfo->ops.cleanup)
 		hinfo->ops.cleanup(hinfo, codec, substream);
-	mutex_unlock(&codec->bus->prepare_mutex);
 }
 EXPORT_SYMBOL_GPL(snd_hda_codec_cleanup);
 
@@ -3641,12 +3632,11 @@ static void cleanup_dig_out_stream(struct hda_codec *codec, hda_nid_t nid)
 int snd_hda_multi_out_dig_open(struct hda_codec *codec,
 			       struct hda_multi_out *mout)
 {
-	mutex_lock(&codec->spdif_mutex);
+	guard(mutex)(&codec->spdif_mutex);
 	if (mout->dig_out_used == HDA_DIG_ANALOG_DUP)
 		/* already opened as analog dup; reset it once */
 		cleanup_dig_out_stream(codec, mout->dig_out_nid);
 	mout->dig_out_used = HDA_DIG_EXCLUSIVE;
-	mutex_unlock(&codec->spdif_mutex);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_hda_multi_out_dig_open);
@@ -3665,9 +3655,8 @@ int snd_hda_multi_out_dig_prepare(struct hda_codec *codec,
 				  unsigned int format,
 				  struct snd_pcm_substream *substream)
 {
-	mutex_lock(&codec->spdif_mutex);
+	guard(mutex)(&codec->spdif_mutex);
 	setup_dig_out_stream(codec, mout->dig_out_nid, stream_tag, format);
-	mutex_unlock(&codec->spdif_mutex);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_hda_multi_out_dig_prepare);
@@ -3680,9 +3669,8 @@ EXPORT_SYMBOL_GPL(snd_hda_multi_out_dig_prepare);
 int snd_hda_multi_out_dig_cleanup(struct hda_codec *codec,
 				  struct hda_multi_out *mout)
 {
-	mutex_lock(&codec->spdif_mutex);
+	guard(mutex)(&codec->spdif_mutex);
 	cleanup_dig_out_stream(codec, mout->dig_out_nid);
-	mutex_unlock(&codec->spdif_mutex);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_hda_multi_out_dig_cleanup);
@@ -3695,9 +3683,8 @@ EXPORT_SYMBOL_GPL(snd_hda_multi_out_dig_cleanup);
 int snd_hda_multi_out_dig_close(struct hda_codec *codec,
 				struct hda_multi_out *mout)
 {
-	mutex_lock(&codec->spdif_mutex);
+	guard(mutex)(&codec->spdif_mutex);
 	mout->dig_out_used = 0;
-	mutex_unlock(&codec->spdif_mutex);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_hda_multi_out_dig_close);
@@ -3737,7 +3724,7 @@ int snd_hda_multi_out_analog_open(struct hda_codec *codec,
 						    NULL,
 						    &mout->spdif_maxbps);
 		}
-		mutex_lock(&codec->spdif_mutex);
+		guard(mutex)(&codec->spdif_mutex);
 		if (mout->share_spdif) {
 			if ((runtime->hw.rates & mout->spdif_rates) &&
 			    (runtime->hw.formats & mout->spdif_formats)) {
@@ -3750,7 +3737,6 @@ int snd_hda_multi_out_analog_open(struct hda_codec *codec,
 				/* FIXME: need notify? */
 			}
 		}
-		mutex_unlock(&codec->spdif_mutex);
 	}
 	return snd_pcm_hw_constraint_step(substream->runtime, 0,
 					  SNDRV_PCM_HW_PARAM_CHANNELS, 2);
@@ -3779,23 +3765,23 @@ int snd_hda_multi_out_analog_prepare(struct hda_codec *codec,
 	struct hda_spdif_out *spdif;
 	int i;
 
-	mutex_lock(&codec->spdif_mutex);
-	spdif = snd_hda_spdif_out_of_nid(codec, mout->dig_out_nid);
-	if (mout->dig_out_nid && mout->share_spdif &&
-	    mout->dig_out_used != HDA_DIG_EXCLUSIVE) {
-		if (chs == 2 && spdif != NULL &&
-		    snd_hda_is_supported_format(codec, mout->dig_out_nid,
-						format) &&
-		    !(spdif->status & IEC958_AES0_NONAUDIO)) {
-			mout->dig_out_used = HDA_DIG_ANALOG_DUP;
-			setup_dig_out_stream(codec, mout->dig_out_nid,
-					     stream_tag, format);
-		} else {
-			mout->dig_out_used = 0;
-			cleanup_dig_out_stream(codec, mout->dig_out_nid);
+	scoped_guard(mutex, &codec->spdif_mutex) {
+		spdif = snd_hda_spdif_out_of_nid(codec, mout->dig_out_nid);
+		if (mout->dig_out_nid && mout->share_spdif &&
+		    mout->dig_out_used != HDA_DIG_EXCLUSIVE) {
+			if (chs == 2 && spdif != NULL &&
+			    snd_hda_is_supported_format(codec, mout->dig_out_nid,
+							format) &&
+			    !(spdif->status & IEC958_AES0_NONAUDIO)) {
+				mout->dig_out_used = HDA_DIG_ANALOG_DUP;
+				setup_dig_out_stream(codec, mout->dig_out_nid,
+						     stream_tag, format);
+			} else {
+				mout->dig_out_used = 0;
+				cleanup_dig_out_stream(codec, mout->dig_out_nid);
+			}
 		}
 	}
-	mutex_unlock(&codec->spdif_mutex);
 
 	/* front */
 	snd_hda_codec_setup_stream(codec, nids[HDA_FRONT], stream_tag,
@@ -3862,12 +3848,11 @@ int snd_hda_multi_out_analog_cleanup(struct hda_codec *codec,
 		if (mout->extra_out_nid[i])
 			snd_hda_codec_cleanup_stream(codec,
 						     mout->extra_out_nid[i]);
-	mutex_lock(&codec->spdif_mutex);
+	guard(mutex)(&codec->spdif_mutex);
 	if (mout->dig_out_nid && mout->dig_out_used == HDA_DIG_ANALOG_DUP) {
 		cleanup_dig_out_stream(codec, mout->dig_out_nid);
 		mout->dig_out_used = 0;
 	}
-	mutex_unlock(&codec->spdif_mutex);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_hda_multi_out_analog_cleanup);
diff --git a/sound/hda/common/controller.c b/sound/hda/common/controller.c
index ceab8625bb1f..a5693c9ca400 100644
--- a/sound/hda/common/controller.c
+++ b/sound/hda/common/controller.c
@@ -96,12 +96,12 @@ static int azx_pcm_close(struct snd_pcm_substream *substream)
 	struct azx_dev *azx_dev = get_azx_dev(substream);
 
 	trace_azx_pcm_close(chip, azx_dev);
-	mutex_lock(&chip->open_mutex);
-	azx_release_device(azx_dev);
-	if (hinfo->ops.close)
-		hinfo->ops.close(hinfo, apcm->codec, substream);
-	snd_hda_power_down(apcm->codec);
-	mutex_unlock(&chip->open_mutex);
+	scoped_guard(mutex, &chip->open_mutex) {
+		azx_release_device(azx_dev);
+		if (hinfo->ops.close)
+			hinfo->ops.close(hinfo, apcm->codec, substream);
+		snd_hda_power_down(apcm->codec);
+	}
 	snd_hda_codec_pcm_put(apcm->info);
 	return 0;
 }
@@ -1129,12 +1129,12 @@ static int probe_codec(struct azx *chip, int addr)
 	int err;
 	unsigned int res = -1;
 
-	mutex_lock(&bus->cmd_mutex);
-	chip->probing = 1;
-	azx_send_cmd(bus, cmd);
-	err = azx_get_response(bus, addr, &res);
-	chip->probing = 0;
-	mutex_unlock(&bus->cmd_mutex);
+	scoped_guard(mutex, &bus->cmd_mutex) {
+		chip->probing = 1;
+		azx_send_cmd(bus, cmd);
+		err = azx_get_response(bus, addr, &res);
+		chip->probing = 0;
+	}
 	if (err < 0 || res == -1)
 		return -EIO;
 	dev_dbg(chip->card->dev, "codec #%d probed OK\n", addr);
diff --git a/sound/hda/common/sysfs.c b/sound/hda/common/sysfs.c
index 0d464d4dd7c9..555c16ea60a5 100644
--- a/sound/hda/common/sysfs.c
+++ b/sound/hda/common/sysfs.c
@@ -81,12 +81,12 @@ static ssize_t pin_configs_show(struct hda_codec *codec,
 {
 	const struct hda_pincfg *pin;
 	int i, len = 0;
-	mutex_lock(&codec->user_mutex);
+
+	guard(mutex)(&codec->user_mutex);
 	snd_array_for_each(list, i, pin) {
 		len += sysfs_emit_at(buf, len, "0x%02x 0x%08x\n",
 				     pin->nid, pin->cfg);
 	}
-	mutex_unlock(&codec->user_mutex);
 	return len;
 }
 
@@ -215,12 +215,12 @@ static ssize_t init_verbs_show(struct device *dev,
 	struct hda_codec *codec = dev_get_drvdata(dev);
 	const struct hda_verb *v;
 	int i, len = 0;
-	mutex_lock(&codec->user_mutex);
+
+	guard(mutex)(&codec->user_mutex);
 	snd_array_for_each(&codec->init_verbs, i, v) {
 		len += sysfs_emit_at(buf, len, "0x%02x 0x%03x 0x%04x\n",
 				     v->nid, v->verb, v->param);
 	}
-	mutex_unlock(&codec->user_mutex);
 	return len;
 }
 
@@ -233,16 +233,13 @@ static int parse_init_verbs(struct hda_codec *codec, const char *buf)
 		return -EINVAL;
 	if (!nid || !verb)
 		return -EINVAL;
-	mutex_lock(&codec->user_mutex);
+	guard(mutex)(&codec->user_mutex);
 	v = snd_array_new(&codec->init_verbs);
-	if (!v) {
-		mutex_unlock(&codec->user_mutex);
+	if (!v)
 		return -ENOMEM;
-	}
 	v->nid = nid;
 	v->verb = verb;
 	v->param = param;
-	mutex_unlock(&codec->user_mutex);
 	return 0;
 }
 
@@ -264,12 +261,12 @@ static ssize_t hints_show(struct device *dev,
 	struct hda_codec *codec = dev_get_drvdata(dev);
 	const struct hda_hint *hint;
 	int i, len = 0;
-	mutex_lock(&codec->user_mutex);
+
+	guard(mutex)(&codec->user_mutex);
 	snd_array_for_each(&codec->hints, i, hint) {
 		len += sysfs_emit_at(buf, len, "%s = %s\n",
 				     hint->key, hint->val);
 	}
-	mutex_unlock(&codec->user_mutex);
 	return len;
 }
 
@@ -324,7 +321,7 @@ static int parse_hints(struct hda_codec *codec, const char *buf)
 	val = skip_spaces(val);
 	remove_trail_spaces(key);
 	remove_trail_spaces(val);
-	mutex_lock(&codec->user_mutex);
+	guard(mutex)(&codec->user_mutex);
 	hint = get_hint(codec, key);
 	if (hint) {
 		/* replace */
@@ -345,7 +342,6 @@ static int parse_hints(struct hda_codec *codec, const char *buf)
 		err = -ENOMEM;
 	}
  unlock:
-	mutex_unlock(&codec->user_mutex);
 	if (err)
 		kfree(key);
 	return err;
@@ -372,16 +368,14 @@ static ssize_t user_pin_configs_show(struct device *dev,
 
 static int parse_user_pin_configs(struct hda_codec *codec, const char *buf)
 {
-	int nid, cfg, err;
+	int nid, cfg;
 
 	if (sscanf(buf, "%i %i", &nid, &cfg) != 2)
 		return -EINVAL;
 	if (!nid)
 		return -EINVAL;
-	mutex_lock(&codec->user_mutex);
-	err = snd_hda_add_pincfg(codec, &codec->user_pins, nid, cfg);
-	mutex_unlock(&codec->user_mutex);
-	return err;
+	guard(mutex)(&codec->user_mutex);
+	return snd_hda_add_pincfg(codec, &codec->user_pins, nid, cfg);
 }
 
 static ssize_t user_pin_configs_store(struct device *dev,
@@ -429,26 +423,19 @@ EXPORT_SYMBOL_GPL(snd_hda_get_hint);
 int snd_hda_get_bool_hint(struct hda_codec *codec, const char *key)
 {
 	const char *p;
-	int ret;
 
-	mutex_lock(&codec->user_mutex);
+	guard(mutex)(&codec->user_mutex);
 	p = snd_hda_get_hint(codec, key);
 	if (!p || !*p)
-		ret = -ENOENT;
-	else {
-		switch (toupper(*p)) {
-		case 'T': /* true */
-		case 'Y': /* yes */
-		case '1':
-			ret = 1;
-			break;
-		default:
-			ret = 0;
-			break;
-		}
+		return -ENOENT;
+	switch (toupper(*p)) {
+	case 'T': /* true */
+	case 'Y': /* yes */
+	case '1':
+		return 1;
+	default:
+		return 0;
 	}
-	mutex_unlock(&codec->user_mutex);
-	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_hda_get_bool_hint);
 
@@ -466,20 +453,17 @@ int snd_hda_get_int_hint(struct hda_codec *codec, const char *key, int *valp)
 {
 	const char *p;
 	unsigned long val;
-	int ret;
 
-	mutex_lock(&codec->user_mutex);
+	guard(mutex)(&codec->user_mutex);
 	p = snd_hda_get_hint(codec, key);
 	if (!p)
-		ret = -ENOENT;
+		return -ENOENT;
 	else if (kstrtoul(p, 0, &val))
-		ret = -EINVAL;
+		return -EINVAL;
 	else {
 		*valp = val;
-		ret = 0;
+		return 0;
 	}
-	mutex_unlock(&codec->user_mutex);
-	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_hda_get_int_hint);
 #endif /* CONFIG_SND_HDA_RECONFIG */
-- 
2.50.1

