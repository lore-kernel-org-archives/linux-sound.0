Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0DD1E1A17
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 00:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775089235; cv=none; b=Wx4HnES3qSRgqzSmcM7igKI49ogL5Qbxt8iCOmkhSedMsocTemUsEAmZoiPGtkC+k7yjHn0vPkzOZENDIT4tZcwFZLnY/3HDA5vJdoy9ydqevmeLrhUdfejYy1u/xDfUywZZKNMkdWmTv477G/CrpNPvpaJuG6W/fZpneSfj2UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775089235; c=relaxed/simple;
	bh=T/yW21uWgwThSJ3q/XO9IlViTDoB7m4P3V3VI/DLdi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UkyZsw3ry710dnGSpp2xOnZMS1LgD97/XxVMHp5uqOopBJBOwMZ2lZG181nvH1o+KMgqeKlbOy5UHDsL/83n0Mk40ynnbzYdxmSdpZc6qvXjsauU1YQ7JJNJ94aV4Mt1XrmmJpxzTiVt5xpPjMGtFdOuauN9z788T1o622GJM0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G13E5hfz; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G13E5hfz"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c66eafc1easo718876eec.1
        for <linux-sound@vger.kernel.org>; Wed, 01 Apr 2026 17:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775089233; x=1775694033; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7/uDI4r1aKHAAS9AZdsKf1B5Cq/o/kxHPNvRkLjnRs=;
        b=G13E5hfzh49+gcJXhroqVxZ4zsD1/0VDa4WWE6jHcGZwb4J1Fvc1yRs+/Lx/LFAl77
         h1jBvZt0Wv1rS6Bd6EPBvznoVNrtwQI4NcCarXAaCAQS/IvgP/EOs2rJcKHdW4v4kJ4B
         hvTDUZeEhUVklPMy5jpkE/ClzXUMigLuTNF+tLDdA6bbYuVm++f+xVMeZekrIa0KO3kB
         LO7e9x656leueFifRo1cPtUACHZ6sDJsAAkETl9G0YAQwrkGe/mkdzsZ/MDJIGX59AHC
         yZEisYzh4qVenV+ZtbSpUetuReBMfqB2/7CnTgdsuA6N09moFsGaK5bCACbHc+xnlv7j
         MC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775089233; x=1775694033;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7/uDI4r1aKHAAS9AZdsKf1B5Cq/o/kxHPNvRkLjnRs=;
        b=kDFmQRdwbnPZQMaccPQlM34kH2vIbJYcdCTPuWaq48zB3eK87isylZeD7r5ebBpzMT
         yoKczx855r5WAnQjx0eY8yo1Zn0cxDmoNvruUtSERQudsmT+NYJlTTEiIiPy70B+xru2
         g/uIWja4Lhur8w1hpYZ0eDQJGYAIFb2maJ+dhHHEhmfZElujfIEagC7lmdNfxDDh19sH
         aE0bdl/436Cm1wlTycLdh5mgSKWyYWKnIPTLC01olcX/GyM3el9Hzx43XEhy5o2nTqYu
         aG/Cra96+0ztbbjbX9mUGPfmhpaXRi/pIpXGTnLGmjAWmqPZavneWsE8MrpbdIDqcWBG
         V3sw==
X-Gm-Message-State: AOJu0Yx+kfaBO7Dn+m0jONbrLhAnq8foTjbUg/7k9lAEdK8FuYBshhfF
	ZkOKzKgdQUykOWqJyKOY+AHjTsNhBq9Wk7tqerZ/2vRKRFJGH7deBSH8phkYjg==
X-Gm-Gg: ATEYQzzMATS2UfAK6qjF8OoZyLK98H1UZ8sIRTNIke04kzDXFQ3SQt+OPXWjt7yuQrQ
	HLUoKOfXjRZlKoceowANbtWt1LVZ0444TR3pilpE8rzZVmZHynxQSJa2XtwsvYItbquUmY6ShDf
	bdzmfQO9S8dqLE4tsy2jE2m2xiuoQhl/4kJZ99Dx0KWxl0C6cUIcwfge9T9CdvDvyWVk3hk+Cbj
	sd9dL/irESSJJRmL5/rPa6CVtb1jE3T/S39TbhMtV2oV9IxxvLIgNKswyOjfKpKwx1iOntjjKkx
	2oDASzTo5kS+nzF8bw7f9L1kfNehS/5B9/TTxZIVMwzIgx+BJUbWv/29zmC7vWttmxC2/QBdBk5
	MHIDLvxPrP6VO4pePjJU19CKIkclXGxmIkJjgX45O6+Li+tasKBlEOmWB8praQ+xDrcLTg9ptZN
	dlQAab6kx3cQWyfl2+n0NTW8DaIlTeWuHCkhzKzj3O4bclIhTlBPIanvvhlf3+LmzL/A0j0tqgw
	hTY
X-Received: by 2002:a05:7300:c8cc:b0:2ca:f038:3d17 with SMTP id 5a478bee46e88-2caf038469cmr57410eec.4.1775089232574;
        Wed, 01 Apr 2026 17:20:32 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-218.user3p.v-tal.net.br. [177.4.161.218])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cafd073194sm10440eec.28.2026.04.01.17.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 17:20:32 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 01 Apr 2026 21:20:21 -0300
Subject: [PATCH] ALSA: hda: Notify IEC958 Default PCM switch state changes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260401-hda-spdif-share-notify-v1-1-707e422ed9d1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ6DMAxA0asgz7VkAmLoVaoOJnGIGQKKKWqFu
 HtTOr7h/wNMiorBvTmgyK6mS65obw34xHkS1FANjtxAXUeYAqOtQSNa4iKYl03jB52L3LMn4ra
 HGq9For6v8eP5t73GWfz2u8F5fgHso69legAAAA==
X-Change-ID: 20260330-hda-spdif-share-notify-22fa4ac00a14
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4964;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=T/yW21uWgwThSJ3q/XO9IlViTDoB7m4P3V3VI/DLdi4=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlnt/ltnzm1111pwu1JjvXnRbNjbGcFn3kWuFk9Uk54k
 8J35lvTO0pZGMS4GGTFFFlWJy2y3NP14Gp93AoPmDmsTCBDGLg4BWAiL8MYGXpmCxkXNbKmpFhJ
 vuMr8Hsftt3k3P+SA7eWPN3kfGnKxveMDAdLbwh/VnF8+HD++UDn10Lz9v78mBofmtrJXH9K8n3
 zU0YA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The "IEC958 Default PCM Playback Switch" control is backed directly by
mout->share_spdif. The share-switch callbacks currently access that state
without serialization, and spdif_share_sw_put() always returns 0, so
normal userspace writes never emit the standard ALSA control value
notification.

snd_hda_multi_out_analog_open() may also clear mout->share_spdif when the
analog PCM capabilities and the SPDIF capabilities no longer intersect.
That fallback is still needed to avoid creating an impossible hw
constraint set, but it changes the mixer backing value without notifying
subscribers.

Protect the share-switch callbacks with spdif_mutex like the other SPDIF
control handlers, return the actual change value from spdif_share_sw_put(),
and notify the matching control when the open path forcibly disables
shared SPDIF mode after dropping spdif_mutex.

This keeps the existing auto-disable behavior while making switch state
changes visible to userspace.

Fixes: 9a08160bdbe3 ("[ALSA] hda-codec - Add "IEC958 Default PCM" switch")
Fixes: 022b466fc353 ("ALSA: hda - Avoid invalid formats and rates with shared SPDIF")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/hda/common/codec.c | 51 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 47 insertions(+), 4 deletions(-)

diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index 09b1329bb8f3..5e74b02c45f6 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -2529,7 +2529,10 @@ EXPORT_SYMBOL_GPL(snd_hda_spdif_ctls_assign);
 static int spdif_share_sw_get(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
+	struct hda_codec *codec = (void *)kcontrol->private_value;
 	struct hda_multi_out *mout = snd_kcontrol_chip(kcontrol);
+
+	guard(mutex)(&codec->spdif_mutex);
 	ucontrol->value.integer.value[0] = mout->share_spdif;
 	return 0;
 }
@@ -2537,9 +2540,15 @@ static int spdif_share_sw_get(struct snd_kcontrol *kcontrol,
 static int spdif_share_sw_put(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
+	struct hda_codec *codec = (void *)kcontrol->private_value;
 	struct hda_multi_out *mout = snd_kcontrol_chip(kcontrol);
-	mout->share_spdif = !!ucontrol->value.integer.value[0];
-	return 0;
+	bool val = !!ucontrol->value.integer.value[0];
+	int change;
+
+	guard(mutex)(&codec->spdif_mutex);
+	change = mout->share_spdif != val;
+	mout->share_spdif = val;
+	return change;
 }
 
 static const struct snd_kcontrol_new spdif_share_sw = {
@@ -2550,6 +2559,33 @@ static const struct snd_kcontrol_new spdif_share_sw = {
 	.put = spdif_share_sw_put,
 };
 
+static struct snd_kcontrol *find_spdif_share_sw(struct hda_codec *codec,
+						struct hda_multi_out *mout)
+{
+	struct hda_nid_item *items = codec->mixers.list;
+	int i;
+
+	for (i = 0; i < codec->mixers.used; i++) {
+		struct snd_kcontrol *kctl = items[i].kctl;
+
+		if (snd_kcontrol_chip(kctl) == mout &&
+		    !strcmp(kctl->id.name, spdif_share_sw.name))
+			return kctl;
+	}
+
+	return NULL;
+}
+
+static void notify_spdif_share_sw(struct hda_codec *codec,
+				  struct hda_multi_out *mout)
+{
+	struct snd_kcontrol *kctl = find_spdif_share_sw(codec, mout);
+
+	if (kctl)
+		snd_ctl_notify_one(codec->card, SNDRV_CTL_EVENT_MASK_VALUE,
+				   kctl, 0);
+}
+
 /**
  * snd_hda_create_spdif_share_sw - create Default PCM switch
  * @codec: the HDA codec
@@ -2566,7 +2602,10 @@ int snd_hda_create_spdif_share_sw(struct hda_codec *codec,
 	kctl = snd_ctl_new1(&spdif_share_sw, mout);
 	if (!kctl)
 		return -ENOMEM;
-	/* ATTENTION: here mout is passed as private_data, instead of codec */
+	/* snd_ctl_new1() stores @mout in private_data; stash @codec in
+	 * private_value for the share-switch callbacks.
+	 */
+	kctl->private_value = (unsigned long)codec;
 	return snd_hda_ctl_add(codec, mout->dig_out_nid, kctl);
 }
 EXPORT_SYMBOL_GPL(snd_hda_create_spdif_share_sw);
@@ -3701,6 +3740,8 @@ int snd_hda_multi_out_analog_open(struct hda_codec *codec,
 				  struct hda_pcm_stream *hinfo)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+	bool notify_share_sw = false;
+
 	runtime->hw.channels_max = mout->max_channels;
 	if (mout->dig_out_nid) {
 		if (!mout->analog_rates) {
@@ -3729,10 +3770,12 @@ int snd_hda_multi_out_analog_open(struct hda_codec *codec,
 					hinfo->maxbps = mout->spdif_maxbps;
 			} else {
 				mout->share_spdif = 0;
-				/* FIXME: need notify? */
+				notify_share_sw = true;
 			}
 		}
 	}
+	if (notify_share_sw)
+		notify_spdif_share_sw(codec, mout);
 	return snd_pcm_hw_constraint_step(substream->runtime, 0,
 					  SNDRV_PCM_HW_PARAM_CHANNELS, 2);
 }

---
base-commit: 85d2c76df1f21fdd599cf2dbee29d59da47f8fa4
change-id: 20260330-hda-spdif-share-notify-22fa4ac00a14

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

