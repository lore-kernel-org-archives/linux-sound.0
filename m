Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6E91F3B98
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906939; cv=none; b=Je8okTfZk0PVjHhpItUrV5yIVP6YZJ/c/VGXVq9+AljjgCRaDw7N5Ja/PjBNiJfXEmPdvQxOj+l0+PBAig0PTIOdW65MY27wBNeUHL9mggjcjfL+5+wm/TtbQYS4HZPTu2ActDttsTtQlJPurD1QMaOmy5WxGSCIDd7vBGE6RSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906939; c=relaxed/simple;
	bh=iVez0k6QpPSG4I8W8In4LzoxZ6tPiyFL+iJm1FR/c50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B3Dx7qmvCjQpq9iyWtQl2i6Fr3BtnWqcvhDiEHItTrc83r3EWbRLewBmVHy8SQ+gqsWM2GYnUI6XuGkdsrS8Dh5XHseVtdw41n9/81fU5nuYxa3o7+Zdq7sENByyDwYS/sBgv7VDImfo3chNkAwqrFZ6Z8/cC4eUz62Xe3GFWyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fV25ML/k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f6REGzSf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fV25ML/k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f6REGzSf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fV25ML/k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f6REGzSf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fV25ML/k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f6REGzSf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2E6465BE21;
	Mon, 11 Aug 2025 10:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E70EDB4qlWheNm8otsLWFcGbtClm1PVsM+8mzh+izmY=;
	b=fV25ML/kSopJOw041TLSt3/3Y15BWn8nMWQzxU+4NZ0sMQOJCpmQ++LuVTXSDaCaSfO/cJ
	LEMRLkJKRgqh5oS0RKkAMMn0RuNl0c7OnIJ5XFChFCW6oT09qkf9hMInU+rP75EW+pzPl7
	yN/gMFsGXOcHvQpdUVkqbRMWCMAtnjA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906895;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E70EDB4qlWheNm8otsLWFcGbtClm1PVsM+8mzh+izmY=;
	b=f6REGzSfqzN+mimui/7O6uGdkaOHIz5FBmhaMpea8SkpQxZfnWPcBP0aS/CfmOtnpCRsg3
	EMcq6YwQXhKXklAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="fV25ML/k";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=f6REGzSf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E70EDB4qlWheNm8otsLWFcGbtClm1PVsM+8mzh+izmY=;
	b=fV25ML/kSopJOw041TLSt3/3Y15BWn8nMWQzxU+4NZ0sMQOJCpmQ++LuVTXSDaCaSfO/cJ
	LEMRLkJKRgqh5oS0RKkAMMn0RuNl0c7OnIJ5XFChFCW6oT09qkf9hMInU+rP75EW+pzPl7
	yN/gMFsGXOcHvQpdUVkqbRMWCMAtnjA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906895;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E70EDB4qlWheNm8otsLWFcGbtClm1PVsM+8mzh+izmY=;
	b=f6REGzSfqzN+mimui/7O6uGdkaOHIz5FBmhaMpea8SkpQxZfnWPcBP0aS/CfmOtnpCRsg3
	EMcq6YwQXhKXklAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EB94E13A7E;
	Mon, 11 Aug 2025 10:08:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mNPPNw7BmWiVBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:08:14 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 09/25] ALSA: hda/ca0132: Use guard() for mutex locks
Date: Mon, 11 Aug 2025 12:07:43 +0200
Message-ID: <20250811100807.7962-10-tiwai@suse.de>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_RATELIMIT(0.00)[to_ip_from(RLs9qncch5cpanyka9neihc978)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 2E6465BE21
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard().

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/ca0132.c | 170 ++++++++++++++------------------------
 1 file changed, 60 insertions(+), 110 deletions(-)

diff --git a/sound/hda/codecs/ca0132.c b/sound/hda/codecs/ca0132.c
index f5ad8a5777b4..197365901fef 100644
--- a/sound/hda/codecs/ca0132.c
+++ b/sound/hda/codecs/ca0132.c
@@ -1684,20 +1684,14 @@ static int chipio_write(struct hda_codec *codec,
 	struct ca0132_spec *spec = codec->spec;
 	int err;
 
-	mutex_lock(&spec->chipio_mutex);
+	guard(mutex)(&spec->chipio_mutex);
 
 	/* write the address, and if successful proceed to write data */
 	err = chipio_write_address(codec, chip_addx);
 	if (err < 0)
-		goto exit;
+		return err;
 
-	err = chipio_write_data(codec, data);
-	if (err < 0)
-		goto exit;
-
-exit:
-	mutex_unlock(&spec->chipio_mutex);
-	return err;
+	return chipio_write_data(codec, data);
 }
 
 /*
@@ -1735,16 +1729,12 @@ static int chipio_write_multiple(struct hda_codec *codec,
 	struct ca0132_spec *spec = codec->spec;
 	int status;
 
-	mutex_lock(&spec->chipio_mutex);
+	guard(mutex)(&spec->chipio_mutex);
 	status = chipio_write_address(codec, chip_addx);
 	if (status < 0)
-		goto error;
+		return status;
 
-	status = chipio_write_data_multiple(codec, data, count);
-error:
-	mutex_unlock(&spec->chipio_mutex);
-
-	return status;
+	return chipio_write_data_multiple(codec, data, count);
 }
 
 /*
@@ -1757,20 +1747,14 @@ static int chipio_read(struct hda_codec *codec,
 	struct ca0132_spec *spec = codec->spec;
 	int err;
 
-	mutex_lock(&spec->chipio_mutex);
+	guard(mutex)(&spec->chipio_mutex);
 
 	/* write the address, and if successful proceed to write data */
 	err = chipio_write_address(codec, chip_addx);
 	if (err < 0)
-		goto exit;
+		return err;
 
-	err = chipio_read_data(codec, data);
-	if (err < 0)
-		goto exit;
-
-exit:
-	mutex_unlock(&spec->chipio_mutex);
-	return err;
+	return chipio_read_data(codec, data);
 }
 
 /*
@@ -1803,7 +1787,7 @@ static void chipio_set_control_param(struct hda_codec *codec,
 		snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
 				    VENDOR_CHIPIO_PARAM_SET, val);
 	} else {
-		mutex_lock(&spec->chipio_mutex);
+		guard(mutex)(&spec->chipio_mutex);
 		if (chipio_send(codec, VENDOR_CHIPIO_STATUS, 0) == 0) {
 			snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
 					    VENDOR_CHIPIO_PARAM_EX_ID_SET,
@@ -1812,7 +1796,6 @@ static void chipio_set_control_param(struct hda_codec *codec,
 					    VENDOR_CHIPIO_PARAM_EX_VALUE_SET,
 					    param_val);
 		}
-		mutex_unlock(&spec->chipio_mutex);
 	}
 }
 
@@ -1977,12 +1960,10 @@ static void chipio_8051_write_exram(struct hda_codec *codec,
 {
 	struct ca0132_spec *spec = codec->spec;
 
-	mutex_lock(&spec->chipio_mutex);
+	guard(mutex)(&spec->chipio_mutex);
 
 	chipio_8051_set_address(codec, addr);
 	chipio_8051_set_data(codec, data);
-
-	mutex_unlock(&spec->chipio_mutex);
 }
 
 static void chipio_8051_write_exram_no_mutex(struct hda_codec *codec,
@@ -2005,12 +1986,10 @@ static void chipio_8051_write_pll_pmu(struct hda_codec *codec,
 {
 	struct ca0132_spec *spec = codec->spec;
 
-	mutex_lock(&spec->chipio_mutex);
+	guard(mutex)(&spec->chipio_mutex);
 
 	chipio_8051_set_address(codec, addr & 0xff);
 	chipio_8051_set_data_pll(codec, data);
-
-	mutex_unlock(&spec->chipio_mutex);
 }
 
 static void chipio_8051_write_pll_pmu_no_mutex(struct hda_codec *codec,
@@ -2027,13 +2006,11 @@ static void chipio_enable_clocks(struct hda_codec *codec)
 {
 	struct ca0132_spec *spec = codec->spec;
 
-	mutex_lock(&spec->chipio_mutex);
+	guard(mutex)(&spec->chipio_mutex);
 
 	chipio_8051_write_pll_pmu_no_mutex(codec, 0x00, 0xff);
 	chipio_8051_write_pll_pmu_no_mutex(codec, 0x05, 0x0b);
 	chipio_8051_write_pll_pmu_no_mutex(codec, 0x06, 0xff);
-
-	mutex_unlock(&spec->chipio_mutex);
 }
 
 /*
@@ -2084,22 +2061,20 @@ static int dspio_write(struct hda_codec *codec, unsigned int scp_data)
 
 	dspio_write_wait(codec);
 
-	mutex_lock(&spec->chipio_mutex);
+	guard(mutex)(&spec->chipio_mutex);
 	status = dspio_send(codec, VENDOR_DSPIO_SCP_WRITE_DATA_LOW,
 			    scp_data & 0xffff);
 	if (status < 0)
-		goto error;
+		return status;
 
 	status = dspio_send(codec, VENDOR_DSPIO_SCP_WRITE_DATA_HIGH,
 				    scp_data >> 16);
 	if (status < 0)
-		goto error;
+		return status;
 
 	/* OK, now check if the write itself has executed*/
 	status = snd_hda_codec_read(codec, WIDGET_DSP_CTRL, 0,
 				    VENDOR_DSPIO_STATUS, 0);
-error:
-	mutex_unlock(&spec->chipio_mutex);
 
 	return (status == VENDOR_STATUS_DSPIO_SCP_COMMAND_QUEUE_FULL) ?
 			-EIO : 0;
@@ -5585,13 +5560,12 @@ static int ca0132_vnode_switch_set(struct snd_kcontrol *kcontrol,
 		int ch = get_amp_channels(kcontrol);
 		unsigned long pval;
 
-		mutex_lock(&codec->control_mutex);
+		guard(mutex)(&codec->control_mutex);
 		pval = kcontrol->private_value;
 		kcontrol->private_value = HDA_COMPOSE_AMP_VAL(shared_nid, ch,
 								0, dir);
 		ret = snd_hda_mixer_amp_switch_put(kcontrol, ucontrol);
 		kcontrol->private_value = pval;
-		mutex_unlock(&codec->control_mutex);
 	}
 
 	return ret;
@@ -6460,22 +6434,22 @@ static int ca0132_volume_info(struct snd_kcontrol *kcontrol,
 	case VNID_SPK:
 		/* follow shared_out info */
 		nid = spec->shared_out_nid;
-		mutex_lock(&codec->control_mutex);
-		pval = kcontrol->private_value;
-		kcontrol->private_value = HDA_COMPOSE_AMP_VAL(nid, ch, 0, dir);
-		err = snd_hda_mixer_amp_volume_info(kcontrol, uinfo);
-		kcontrol->private_value = pval;
-		mutex_unlock(&codec->control_mutex);
+		scoped_guard(mutex, &codec->control_mutex) {
+			pval = kcontrol->private_value;
+			kcontrol->private_value = HDA_COMPOSE_AMP_VAL(nid, ch, 0, dir);
+			err = snd_hda_mixer_amp_volume_info(kcontrol, uinfo);
+			kcontrol->private_value = pval;
+		}
 		break;
 	case VNID_MIC:
 		/* follow shared_mic info */
 		nid = spec->shared_mic_nid;
-		mutex_lock(&codec->control_mutex);
-		pval = kcontrol->private_value;
-		kcontrol->private_value = HDA_COMPOSE_AMP_VAL(nid, ch, 0, dir);
-		err = snd_hda_mixer_amp_volume_info(kcontrol, uinfo);
-		kcontrol->private_value = pval;
-		mutex_unlock(&codec->control_mutex);
+		scoped_guard(mutex, &codec->control_mutex) {
+			pval = kcontrol->private_value;
+			kcontrol->private_value = HDA_COMPOSE_AMP_VAL(nid, ch, 0, dir);
+			err = snd_hda_mixer_amp_volume_info(kcontrol, uinfo);
+			kcontrol->private_value = pval;
+		}
 		break;
 	default:
 		err = snd_hda_mixer_amp_volume_info(kcontrol, uinfo);
@@ -6533,13 +6507,12 @@ static int ca0132_volume_put(struct snd_kcontrol *kcontrol,
 		unsigned long pval;
 
 		CLASS(snd_hda_power, pm)(codec);
-		mutex_lock(&codec->control_mutex);
+		guard(mutex)(&codec->control_mutex);
 		pval = kcontrol->private_value;
 		kcontrol->private_value = HDA_COMPOSE_AMP_VAL(shared_nid, ch,
 								0, dir);
 		changed = snd_hda_mixer_amp_volume_put(kcontrol, ucontrol);
 		kcontrol->private_value = pval;
-		mutex_unlock(&codec->control_mutex);
 	}
 
 	return changed;
@@ -6559,7 +6532,6 @@ static int ca0132_alt_volume_put(struct snd_kcontrol *kcontrol,
 	int ch = get_amp_channels(kcontrol);
 	long *valp = ucontrol->value.integer.value;
 	hda_nid_t vnid = 0;
-	int changed;
 
 	switch (nid) {
 	case 0x02:
@@ -6582,11 +6554,8 @@ static int ca0132_alt_volume_put(struct snd_kcontrol *kcontrol,
 
 	CLASS(snd_hda_power, pm)(codec);
 	ca0132_alt_dsp_volume_put(codec, vnid);
-	mutex_lock(&codec->control_mutex);
-	changed = snd_hda_mixer_amp_volume_put(kcontrol, ucontrol);
-	mutex_unlock(&codec->control_mutex);
-
-	return changed;
+	guard(mutex)(&codec->control_mutex);
+	return snd_hda_mixer_amp_volume_put(kcontrol, ucontrol);
 }
 
 static int ca0132_volume_tlv(struct snd_kcontrol *kcontrol, int op_flag,
@@ -6604,22 +6573,22 @@ static int ca0132_volume_tlv(struct snd_kcontrol *kcontrol, int op_flag,
 	case VNID_SPK:
 		/* follow shared_out tlv */
 		nid = spec->shared_out_nid;
-		mutex_lock(&codec->control_mutex);
-		pval = kcontrol->private_value;
-		kcontrol->private_value = HDA_COMPOSE_AMP_VAL(nid, ch, 0, dir);
-		err = snd_hda_mixer_amp_tlv(kcontrol, op_flag, size, tlv);
-		kcontrol->private_value = pval;
-		mutex_unlock(&codec->control_mutex);
+		scoped_guard(mutex, &codec->control_mutex) {
+			pval = kcontrol->private_value;
+			kcontrol->private_value = HDA_COMPOSE_AMP_VAL(nid, ch, 0, dir);
+			err = snd_hda_mixer_amp_tlv(kcontrol, op_flag, size, tlv);
+			kcontrol->private_value = pval;
+		}
 		break;
 	case VNID_MIC:
 		/* follow shared_mic tlv */
 		nid = spec->shared_mic_nid;
-		mutex_lock(&codec->control_mutex);
-		pval = kcontrol->private_value;
-		kcontrol->private_value = HDA_COMPOSE_AMP_VAL(nid, ch, 0, dir);
-		err = snd_hda_mixer_amp_tlv(kcontrol, op_flag, size, tlv);
-		kcontrol->private_value = pval;
-		mutex_unlock(&codec->control_mutex);
+		scoped_guard(mutex, &codec->control_mutex) {
+			pval = kcontrol->private_value;
+			kcontrol->private_value = HDA_COMPOSE_AMP_VAL(nid, ch, 0, dir);
+			err = snd_hda_mixer_amp_tlv(kcontrol, op_flag, size, tlv);
+			kcontrol->private_value = pval;
+		}
 		break;
 	default:
 		err = snd_hda_mixer_amp_tlv(kcontrol, op_flag, size, tlv);
@@ -7501,12 +7470,10 @@ static void ca0132_init_analog_mic2(struct hda_codec *codec)
 {
 	struct ca0132_spec *spec = codec->spec;
 
-	mutex_lock(&spec->chipio_mutex);
+	guard(mutex)(&spec->chipio_mutex);
 
 	chipio_8051_write_exram_no_mutex(codec, 0x1920, 0x00);
 	chipio_8051_write_exram_no_mutex(codec, 0x192d, 0x00);
-
-	mutex_unlock(&spec->chipio_mutex);
 }
 
 static void ca0132_refresh_widget_caps(struct hda_codec *codec)
@@ -7596,19 +7563,17 @@ static void ca0132_alt_start_dsp_audio_streams(struct hda_codec *codec)
 	 * Check if any of the default streams are active, and if they are,
 	 * stop them.
 	 */
-	mutex_lock(&spec->chipio_mutex);
+	scoped_guard(mutex, &spec->chipio_mutex) {
+		for (i = 0; i < ARRAY_SIZE(dsp_dma_stream_ids); i++) {
+			chipio_get_stream_control(codec, dsp_dma_stream_ids[i], &tmp);
 
-	for (i = 0; i < ARRAY_SIZE(dsp_dma_stream_ids); i++) {
-		chipio_get_stream_control(codec, dsp_dma_stream_ids[i], &tmp);
-
-		if (tmp) {
-			chipio_set_stream_control(codec,
-					dsp_dma_stream_ids[i], 0);
+			if (tmp) {
+				chipio_set_stream_control(codec,
+							  dsp_dma_stream_ids[i], 0);
+			}
 		}
 	}
 
-	mutex_unlock(&spec->chipio_mutex);
-
 	/*
 	 * If all DSP streams are inactive, there should be no active DSP DMA
 	 * channels. Check and make sure this is the case, and if it isn't,
@@ -7616,7 +7581,7 @@ static void ca0132_alt_start_dsp_audio_streams(struct hda_codec *codec)
 	 */
 	ca0132_alt_free_active_dma_channels(codec);
 
-	mutex_lock(&spec->chipio_mutex);
+	guard(mutex)(&spec->chipio_mutex);
 
 	/* Make sure stream 0x0c is six channels. */
 	chipio_set_stream_channels(codec, 0x0c, 6);
@@ -7628,8 +7593,6 @@ static void ca0132_alt_start_dsp_audio_streams(struct hda_codec *codec)
 		/* Give the DSP some time to setup the DMA channel. */
 		msleep(75);
 	}
-
-	mutex_unlock(&spec->chipio_mutex);
 }
 
 /*
@@ -7821,7 +7784,7 @@ static void sbz_connect_streams(struct hda_codec *codec)
 {
 	struct ca0132_spec *spec = codec->spec;
 
-	mutex_lock(&spec->chipio_mutex);
+	guard(mutex)(&spec->chipio_mutex);
 
 	codec_dbg(codec, "Connect Streams entered, mutex locked and loaded.\n");
 
@@ -7836,8 +7799,6 @@ static void sbz_connect_streams(struct hda_codec *codec)
 	chipio_set_stream_control(codec, 0x14, 1);
 
 	codec_dbg(codec, "Connect Streams exited, mutex released.\n");
-
-	mutex_unlock(&spec->chipio_mutex);
 }
 
 /*
@@ -7851,7 +7812,7 @@ static void sbz_chipio_startup_data(struct hda_codec *codec)
 	const struct chipio_stream_remap_data *dsp_out_remap_data;
 	struct ca0132_spec *spec = codec->spec;
 
-	mutex_lock(&spec->chipio_mutex);
+	guard(mutex)(&spec->chipio_mutex);
 	codec_dbg(codec, "Startup Data entered, mutex locked and loaded.\n");
 
 	/* Remap DAC0's output ports. */
@@ -7876,7 +7837,6 @@ static void sbz_chipio_startup_data(struct hda_codec *codec)
 		chipio_remap_stream(codec, dsp_out_remap_data);
 
 	codec_dbg(codec, "Startup Data exited, mutex released.\n");
-	mutex_unlock(&spec->chipio_mutex);
 }
 
 static void ca0132_alt_dsp_initial_mic_setup(struct hda_codec *codec)
@@ -7968,7 +7928,7 @@ static void ae5_post_dsp_stream_setup(struct hda_codec *codec)
 {
 	struct ca0132_spec *spec = codec->spec;
 
-	mutex_lock(&spec->chipio_mutex);
+	guard(mutex)(&spec->chipio_mutex);
 
 	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0, 0x725, 0x81);
 
@@ -7986,15 +7946,13 @@ static void ae5_post_dsp_stream_setup(struct hda_codec *codec)
 	chipio_8051_write_pll_pmu_no_mutex(codec, 0x43, 0xc7);
 
 	ca0113_mmio_command_set(codec, 0x48, 0x01, 0x80);
-
-	mutex_unlock(&spec->chipio_mutex);
 }
 
 static void ae5_post_dsp_startup_data(struct hda_codec *codec)
 {
 	struct ca0132_spec *spec = codec->spec;
 
-	mutex_lock(&spec->chipio_mutex);
+	guard(mutex)(&spec->chipio_mutex);
 
 	chipio_write_no_mutex(codec, 0x189000, 0x0001f101);
 	chipio_write_no_mutex(codec, 0x189004, 0x0001f101);
@@ -8018,15 +7976,13 @@ static void ae5_post_dsp_startup_data(struct hda_codec *codec)
 
 	ca0113_mmio_command_set(codec, 0x48, 0x0f, 0x00);
 	ca0113_mmio_command_set(codec, 0x48, 0x10, 0x00);
-
-	mutex_unlock(&spec->chipio_mutex);
 }
 
 static void ae7_post_dsp_setup_ports(struct hda_codec *codec)
 {
 	struct ca0132_spec *spec = codec->spec;
 
-	mutex_lock(&spec->chipio_mutex);
+	guard(mutex)(&spec->chipio_mutex);
 
 	/* Seems to share the same port remapping as the SBZ. */
 	chipio_remap_stream(codec, &stream_remap_data[1]);
@@ -8039,15 +7995,13 @@ static void ae7_post_dsp_setup_ports(struct hda_codec *codec)
 	ca0113_mmio_command_set(codec, 0x48, 0x12, 0xff);
 	ca0113_mmio_command_set(codec, 0x48, 0x13, 0xff);
 	ca0113_mmio_command_set(codec, 0x48, 0x14, 0x7f);
-
-	mutex_unlock(&spec->chipio_mutex);
 }
 
 static void ae7_post_dsp_asi_stream_setup(struct hda_codec *codec)
 {
 	struct ca0132_spec *spec = codec->spec;
 
-	mutex_lock(&spec->chipio_mutex);
+	guard(mutex)(&spec->chipio_mutex);
 
 	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0, 0x725, 0x81);
 	ca0113_mmio_command_set(codec, 0x30, 0x2b, 0x00);
@@ -8062,8 +8016,6 @@ static void ae7_post_dsp_asi_stream_setup(struct hda_codec *codec)
 	chipio_set_stream_control(codec, 0x18, 1);
 
 	chipio_set_control_param_no_mutex(codec, CONTROL_PARAM_ASI, 4);
-
-	mutex_unlock(&spec->chipio_mutex);
 }
 
 static void ae7_post_dsp_pll_setup(struct hda_codec *codec)
@@ -8091,7 +8043,7 @@ static void ae7_post_dsp_asi_setup_ports(struct hda_codec *codec)
 	};
 	unsigned int i;
 
-	mutex_lock(&spec->chipio_mutex);
+	guard(mutex)(&spec->chipio_mutex);
 
 	chipio_8051_write_pll_pmu_no_mutex(codec, 0x43, 0xc7);
 
@@ -8153,8 +8105,6 @@ static void ae7_post_dsp_asi_setup_ports(struct hda_codec *codec)
 	 */
 	ae7_post_dsp_pll_setup(codec);
 	chipio_set_control_param_no_mutex(codec, CONTROL_PARAM_ASI, 7);
-
-	mutex_unlock(&spec->chipio_mutex);
 }
 
 /*
-- 
2.50.1

