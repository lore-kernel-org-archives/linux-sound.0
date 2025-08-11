Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B211121CC63
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906945; cv=none; b=VNNxhneqmxFceLWMO83WWNzCMUR/bkNuJZzmVhv7zuE79ddInQuhv68AAlRc2kJiZ+rnujsY3SP3Lm8aJe2CqLk8UDhIXX2Uil2h5kZjf9Ecyyoig6t28V9TizeNagJp3zhlJ7pQaMY/LFwuzzukGXD++WoxirBE0UiW+w/3UE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906945; c=relaxed/simple;
	bh=RkQZSn3arcTa6YftfAzljP1tlI8VSwE3PRdqKshNcsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TPgeqHOcpUnjF/PNSRIOAr4pUUaFhUqx7WOOPYJVqwidyTenSEj2r74S0IibgrnVanbLJbfhXVTzJWVCxp1tVZ8VKtTZ6ZPtchMhHnXoN+8U27p83uhzXgpecB+eLp5FPkdtgOjOtj7XocKUh6xqYxA8FFhMw0B3wzYIlCk/BnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TDkT0JvK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JspVBM/G; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OHs00d4C; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GMVNjB84; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TDkT0JvK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JspVBM/G";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OHs00d4C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GMVNjB84"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F131333E67;
	Mon, 11 Aug 2025 10:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=by8BMnujWzotcTRXQcVTDwUx4ohkSxIoqeS1sQlHvFs=;
	b=TDkT0JvKdBBPAaa1fZ7KiMJKDoKEiGNL8btARUJ81hab8V7P4rXgUtw8TJVKm4BA9sWUJQ
	S8rL4RLZoDBLzjra3iIkoIeMVDhJ47w+5K52y6NRW1ELg0M0zAQazqIsXkf4IvGnWwLO4X
	XFavuiSZ0wUxwmBDIk6Ro2vRJ3MGOVs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906897;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=by8BMnujWzotcTRXQcVTDwUx4ohkSxIoqeS1sQlHvFs=;
	b=JspVBM/Ggz4h3f04axHKOP+DD4PAK2t2y3M9QHrm24XbQ+XX3V9NQgxcPDYQwdWeTfEgh3
	9+4IavwhuA3LfBDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=by8BMnujWzotcTRXQcVTDwUx4ohkSxIoqeS1sQlHvFs=;
	b=OHs00d4CmLUtgw4Aw1P6jhGTH3Ae7ZioVPpirzj50bjnXO4qMYJ+flgtOLpNyIcmxY+ETD
	O3h0wXUZ7rybfge0339/KrH7FbMOec1xbpy82W2xncxxMnyjwzV8NByzHt57VEZtWEK6yE
	lu2cDx0XZxVvicZqv6NYazAaNvcjD74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906896;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=by8BMnujWzotcTRXQcVTDwUx4ohkSxIoqeS1sQlHvFs=;
	b=GMVNjB846riWLWpnWMq/NXzh+Tgv+9LE+lKOv/t1URAYKKyAwbi2L6DDTm0cg2uv8DDQ4J
	icHXRlIUhg5jW9BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B05E613479;
	Mon, 11 Aug 2025 10:08:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AA7SKRDBmWiVBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:08:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 16/25] ALSA: hda/generic: Use guard() for mutex locks
Date: Mon, 11 Aug 2025 12:07:50 +0200
Message-ID: <20250811100807.7962-17-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RLf66hkhxcz6y1w5afddqk81z3)];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Replace the manual mutex lock/unlock pairs with guard().

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/generic.c | 69 +++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 39 deletions(-)

diff --git a/sound/hda/codecs/generic.c b/sound/hda/codecs/generic.c
index a44beefe3e97..e1324f9671dd 100644
--- a/sound/hda/codecs/generic.c
+++ b/sound/hda/codecs/generic.c
@@ -1118,12 +1118,11 @@ static int hda_gen_bind_mute_get(struct snd_kcontrol *kcontrol,
 	unsigned long pval;
 	int err;
 
-	mutex_lock(&codec->control_mutex);
+	guard(mutex)(&codec->control_mutex);
 	pval = kcontrol->private_value;
 	kcontrol->private_value = pval & ~AMP_VAL_IDX_MASK; /* index 0 */
 	err = snd_hda_mixer_amp_switch_get(kcontrol, ucontrol);
 	kcontrol->private_value = pval;
-	mutex_unlock(&codec->control_mutex);
 	return err;
 }
 
@@ -1136,7 +1135,7 @@ static int hda_gen_bind_mute_put(struct snd_kcontrol *kcontrol,
 
 	sync_auto_mute_bits(kcontrol, ucontrol);
 
-	mutex_lock(&codec->control_mutex);
+	guard(mutex)(&codec->control_mutex);
 	pval = kcontrol->private_value;
 	indices = (pval & AMP_VAL_IDX_MASK) >> AMP_VAL_IDX_SHIFT;
 	for (i = 0; i < indices; i++) {
@@ -1148,7 +1147,6 @@ static int hda_gen_bind_mute_put(struct snd_kcontrol *kcontrol,
 		change |= err;
 	}
 	kcontrol->private_value = pval;
-	mutex_unlock(&codec->control_mutex);
 	return err < 0 ? err : change;
 }
 
@@ -2249,11 +2247,9 @@ static int indep_hp_put(struct snd_kcontrol *kcontrol,
 	unsigned int select = ucontrol->value.enumerated.item[0];
 	int ret = 0;
 
-	mutex_lock(&spec->pcm_mutex);
-	if (spec->active_streams) {
-		ret = -EBUSY;
-		goto unlock;
-	}
+	guard(mutex)(&spec->pcm_mutex);
+	if (spec->active_streams)
+		return -EBUSY;
 
 	if (spec->indep_hp_enabled != select) {
 		hda_nid_t *dacp;
@@ -2285,8 +2281,6 @@ static int indep_hp_put(struct snd_kcontrol *kcontrol,
 		call_hp_automute(codec, NULL);
 		ret = 1;
 	}
- unlock:
-	mutex_unlock(&spec->pcm_mutex);
 	return ret;
 }
 
@@ -3475,22 +3469,20 @@ static int cap_put_caller(struct snd_kcontrol *kcontrol,
 
 	imux = &spec->input_mux;
 	adc_idx = kcontrol->id.index;
-	mutex_lock(&codec->control_mutex);
-	for (i = 0; i < imux->num_items; i++) {
-		path = get_input_path(codec, adc_idx, i);
-		if (!path || !path->ctls[type])
-			continue;
-		kcontrol->private_value = path->ctls[type];
-		ret = func(kcontrol, ucontrol);
-		if (ret < 0) {
-			err = ret;
-			break;
+	scoped_guard(mutex, &codec->control_mutex) {
+		for (i = 0; i < imux->num_items; i++) {
+			path = get_input_path(codec, adc_idx, i);
+			if (!path || !path->ctls[type])
+				continue;
+			kcontrol->private_value = path->ctls[type];
+			ret = func(kcontrol, ucontrol);
+			if (ret < 0)
+				return ret;
+			if (ret > 0)
+				err = 1;
 		}
-		if (ret > 0)
-			err = 1;
 	}
-	mutex_unlock(&codec->control_mutex);
-	if (err >= 0 && spec->cap_sync_hook)
+	if (spec->cap_sync_hook)
 		spec->cap_sync_hook(codec, kcontrol, ucontrol);
 	return err;
 }
@@ -5332,17 +5324,17 @@ static int playback_pcm_open(struct hda_pcm_stream *hinfo,
 	struct hda_gen_spec *spec = codec->spec;
 	int err;
 
-	mutex_lock(&spec->pcm_mutex);
+	guard(mutex)(&spec->pcm_mutex);
 	err = snd_hda_multi_out_analog_open(codec,
 					    &spec->multiout, substream,
 					     hinfo);
-	if (!err) {
-		spec->active_streams |= 1 << STREAM_MULTI_OUT;
-		call_pcm_playback_hook(hinfo, codec, substream,
-				       HDA_GEN_PCM_ACT_OPEN);
-	}
-	mutex_unlock(&spec->pcm_mutex);
-	return err;
+	if (err < 0)
+		return err;
+
+	spec->active_streams |= 1 << STREAM_MULTI_OUT;
+	call_pcm_playback_hook(hinfo, codec, substream,
+			       HDA_GEN_PCM_ACT_OPEN);
+	return 0;
 }
 
 static int playback_pcm_prepare(struct hda_pcm_stream *hinfo,
@@ -5381,11 +5373,11 @@ static int playback_pcm_close(struct hda_pcm_stream *hinfo,
 			      struct snd_pcm_substream *substream)
 {
 	struct hda_gen_spec *spec = codec->spec;
-	mutex_lock(&spec->pcm_mutex);
+
+	guard(mutex)(&spec->pcm_mutex);
 	spec->active_streams &= ~(1 << STREAM_MULTI_OUT);
 	call_pcm_playback_hook(hinfo, codec, substream,
 			       HDA_GEN_PCM_ACT_CLOSE);
-	mutex_unlock(&spec->pcm_mutex);
 	return 0;
 }
 
@@ -5434,14 +5426,13 @@ static int alt_playback_pcm_open(struct hda_pcm_stream *hinfo,
 	struct hda_gen_spec *spec = codec->spec;
 	int err = 0;
 
-	mutex_lock(&spec->pcm_mutex);
+	guard(mutex)(&spec->pcm_mutex);
 	if (spec->indep_hp && !spec->indep_hp_enabled)
 		err = -EBUSY;
 	else
 		spec->active_streams |= 1 << STREAM_INDEP_HP;
 	call_pcm_playback_hook(hinfo, codec, substream,
 			       HDA_GEN_PCM_ACT_OPEN);
-	mutex_unlock(&spec->pcm_mutex);
 	return err;
 }
 
@@ -5450,11 +5441,11 @@ static int alt_playback_pcm_close(struct hda_pcm_stream *hinfo,
 				  struct snd_pcm_substream *substream)
 {
 	struct hda_gen_spec *spec = codec->spec;
-	mutex_lock(&spec->pcm_mutex);
+
+	guard(mutex)(&spec->pcm_mutex);
 	spec->active_streams &= ~(1 << STREAM_INDEP_HP);
 	call_pcm_playback_hook(hinfo, codec, substream,
 			       HDA_GEN_PCM_ACT_CLOSE);
-	mutex_unlock(&spec->pcm_mutex);
 	return 0;
 }
 
-- 
2.50.1

