Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1293AEF59
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 14:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775141129; cv=none; b=u9JNdloM8w8TP4P55zCNyENDyif9XI6vi/wUCJzj8DgXwpbPh3tt+TIHTGtfEcpixBf8rS1gT1qXTizd4Nj+Z9JQbvsLdmrsJAJ1lNqPGCkXoqvwYVcOtmu0xCbRcKF/RvwrlFgVwc9NovK0UMjKhYl+AmreEpiu66jd0onZj/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775141129; c=relaxed/simple;
	bh=g8JAC6BSLChGNHkt6cn4WUEj8jJIPs2Kb/3zn2v9Uu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=C5Mgrm2O7oJ7aVLL1Y1D+DTLqFLLu9l6+zrpFbUZ/fuHu/Ei5nl/oRQPu2Sa9pUTmSMonGkIO8ip4Fy3Ud9YnhOylc9rt9OHTaZoHkTBhJ3U94JwTj2rJcM72CihgurzqMHuA2rjutNE3l3XIdrppTUOAIMhWr+Im20cJu9W+Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ovBE4cSb; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ovBE4cSb"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c56aa62931so2101530eec.0
        for <linux-sound@vger.kernel.org>; Thu, 02 Apr 2026 07:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775141126; x=1775745926; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ilI3/se0eNWB3LAafrjSlhG9sR6mQT2nndyVtmfkrdQ=;
        b=ovBE4cSbf4A7vipPVGptxiWYjkVPIXsvd9zwq8KthPeubWvX3DcL68mSb8zVGA+ewr
         DUpyjOxCGOPQFlxnYQ1fnpimJvmvcwTJmdRO8PsGRkf0KwWoU4ApDJFvnZ72zqcywfBA
         6hMAd9ePjUq5BKjZDOGA7l+NT1o9WWHAZAGxUPGd/T+6y9+3DBgWxHH3srtUKhhUTocB
         lCVuzmNF55JVHFXH6LLMvfnFuR1kY+n0d8HmKcgwUptab+cM5DV5jXB56ziHjwTzffQp
         XbjZe5G95OoqnNOeLzxffwH7e/xLaPhC/EYMRUhq2Y+fg6lbk4mSNLZNN/jaxY7qqJDs
         bbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141126; x=1775745926;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilI3/se0eNWB3LAafrjSlhG9sR6mQT2nndyVtmfkrdQ=;
        b=RM2xlsRhlJSpMrbyvr911hrHzY4tjwWy/XIlC1yvma6de6ftTC4yAwHPOSNTX/yqoJ
         4KVYPH+3ByO8A7qPHeymsF1kOlXRMO2t8tA+KlN9oW/iNDQ1vOVmAtJ3yjkVlAbRr6C+
         b5yPOWfoNEYbsLoxqgC3tIwYIzq7m3MBdjJrxlBldWhLMcpuX8q8wWamP5XCGRzqU8RO
         g3i4F/lNk7f66fnkfnMoTeQVZu4fh6tzffPjWXNFnMwZqU5RlwRwsLZBvHFWwEORsqAV
         WMk0DJTDCA55pjv9AgwKQiOP7LaBf4ZuLN6gZQKIX6np7ej04sGDIa3n2qOEeBn4wCb9
         AqpA==
X-Gm-Message-State: AOJu0YzZLqZddkeKG6ThjXust1b3i2978W0g+xxq8s0VmKrpDCmUS0cI
	NrVJpcM2MDypgvP4OY/kTcEY2XFFlPDbPo2/mESvhdOjPv0VIFrZF7YP7fZ9ISei
X-Gm-Gg: AeBDieuSav3j1MfAwziCiYLqxzY5vkiTCcHQ7VZEahfMr9TuwcEixTfu+onvJB8kNrD
	KTavhn8GuhNFcB/vxnJhTWWKnSlCcqvSsh6PILfixH9nNoD4lSMGHoi/PVs4CWACXewPZQm8+G4
	oDD3JM0JDZE9d8i3sFAw966hTdH77xxXPWY8SLwW3I6RNKSP3oU4cITNp3lL8FLfm8ODGZsFwK9
	BrMH3eieiPtfL5i6n9QhS/kN1rZOZvO4KtWZ0ASNe3jqAUjVJsZhV9Nx4ukfjwjtsOfUZ2qgVcp
	ijwStEiMVHnggYtbLv6GyFBiyIIXa6pHtTpi+ODOpb8qC0sVa3PXh6OgxbwPlGuQI1vtRNzFHZ8
	g/WTuBhDeJsEWcOmtZisGRV/X7SBdjnBlDnP26OTmrk8w2kjx7+shq7S/xxnkLYm6yPjO209RK4
	L1nXVyQfehxNnn5urca+STLDUIiBmmgxaJk1zdg8au2MBlw9uiSVmIPMREviRfDKO6EtcfIwvbN
	5No
X-Received: by 2002:a05:693c:3018:b0:2c7:2c0b:f33b with SMTP id 5a478bee46e88-2ca8fd4ca35mr2082702eec.20.1775141125771;
        Thu, 02 Apr 2026 07:45:25 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-218.user3p.v-tal.net.br. [177.4.161.218])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cba5df5c24sm369340eec.27.2026.04.02.07.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:45:25 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 02 Apr 2026 11:45:13 -0300
Subject: [PATCH v2] ALSA: hda: Notify IEC958 Default PCM switch state
 changes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260402-hda-spdif-share-notify-v2-1-7c6584ecaa21@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBBFf4V07Zi2NBJd+R+GxdhO6RihpEUiI
 fy7PNYuT3LvObPIlJiyuBWzSDRy5titoE+FsAG7hoDdykJLfZFlKSE4hNw79pADJoIuDuwn0Nq
 jQSslKiPWc5/I83cXP+qD8+f5Ijtstm0ROA8xTXt5VNvuiBip/kVGBQoqWZHRmtzVqXvTIr/PN
 raiXpblB6FwrGLOAAAA
X-Change-ID: 20260330-hda-spdif-share-notify-22fa4ac00a14
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Takashi Iwai <tiwai@suse.de>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6381;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=g8JAC6BSLChGNHkt6cn4WUEj8jJIPs2Kb/3zn2v9Uu0=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJnnGpnVYnUjszn6HALXbkjYeaLovqi4/AddQ52q9oRgU
 791cw93lLIwiHExyIopsqxOWmS5p+vB1fq4FR4wc1iZQIYwcHEKwERa3zEyvJqwZlP3g++eKh91
 F3voB7DfDn6y4u0KhhMvVhi0fNhRU8PIcGd/6n/7q6kVGxw0cpPnWz6sdDR29Ob9+zp2hcbVvng
 xfgA=
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
and notify the cached control when the open path forcibly disables
shared SPDIF mode after dropping spdif_mutex.

This keeps the existing auto-disable behavior while making switch state
changes visible to userspace.

Fixes: 9a08160bdbe3 ("[ALSA] hda-codec - Add "IEC958 Default PCM" switch")
Fixes: 022b466fc353 ("ALSA: hda - Avoid invalid formats and rates with shared SPDIF")
Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Changes in v2:
- Reworked the share-switch callbacks to use codec in private_data and
mout in private_value.
- Replaced the mixer-list lookup helper with a cached shared SPDIF
kcontrol pointer for forced-disable notifications.
- Kept the functional change otherwise unchanged.
- Link to v1: https://patch.msgid.link/20260401-hda-spdif-share-notify-v1-1-707e422ed9d1@gmail.com
---
 sound/hda/common/codec.c     | 46 ++++++++++++++++++++++++++++++++++++--------
 sound/hda/common/hda_local.h |  3 +++
 2 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index 09b1329bb8f3..5123df32ad89 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -2529,7 +2529,10 @@ EXPORT_SYMBOL_GPL(snd_hda_spdif_ctls_assign);
 static int spdif_share_sw_get(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct hda_multi_out *mout = snd_kcontrol_chip(kcontrol);
+	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
+	struct hda_multi_out *mout = (void *)kcontrol->private_value;
+
+	guard(mutex)(&codec->spdif_mutex);
 	ucontrol->value.integer.value[0] = mout->share_spdif;
 	return 0;
 }
@@ -2537,9 +2540,15 @@ static int spdif_share_sw_get(struct snd_kcontrol *kcontrol,
 static int spdif_share_sw_put(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct hda_multi_out *mout = snd_kcontrol_chip(kcontrol);
-	mout->share_spdif = !!ucontrol->value.integer.value[0];
-	return 0;
+	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
+	struct hda_multi_out *mout = (void *)kcontrol->private_value;
+	bool val = !!ucontrol->value.integer.value[0];
+	int change;
+
+	guard(mutex)(&codec->spdif_mutex);
+	change = mout->share_spdif != val;
+	mout->share_spdif = val;
+	return change;
 }
 
 static const struct snd_kcontrol_new spdif_share_sw = {
@@ -2550,6 +2559,14 @@ static const struct snd_kcontrol_new spdif_share_sw = {
 	.put = spdif_share_sw_put,
 };
 
+static void notify_spdif_share_sw(struct hda_codec *codec,
+				  struct hda_multi_out *mout)
+{
+	if (mout->share_spdif_kctl)
+		snd_ctl_notify_one(codec->card, SNDRV_CTL_EVENT_MASK_VALUE,
+				   mout->share_spdif_kctl, 0);
+}
+
 /**
  * snd_hda_create_spdif_share_sw - create Default PCM switch
  * @codec: the HDA codec
@@ -2559,15 +2576,24 @@ int snd_hda_create_spdif_share_sw(struct hda_codec *codec,
 				  struct hda_multi_out *mout)
 {
 	struct snd_kcontrol *kctl;
+	int err;
 
 	if (!mout->dig_out_nid)
 		return 0;
 
-	kctl = snd_ctl_new1(&spdif_share_sw, mout);
+	kctl = snd_ctl_new1(&spdif_share_sw, codec);
 	if (!kctl)
 		return -ENOMEM;
-	/* ATTENTION: here mout is passed as private_data, instead of codec */
-	return snd_hda_ctl_add(codec, mout->dig_out_nid, kctl);
+	/* snd_ctl_new1() stores @codec in private_data; stash @mout in
+	 * private_value for the share-switch callbacks and cache the
+	 * assigned control for forced-disable notifications.
+	 */
+	kctl->private_value = (unsigned long)mout;
+	err = snd_hda_ctl_add(codec, mout->dig_out_nid, kctl);
+	if (err < 0)
+		return err;
+	mout->share_spdif_kctl = kctl;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_hda_create_spdif_share_sw);
 
@@ -3701,6 +3727,8 @@ int snd_hda_multi_out_analog_open(struct hda_codec *codec,
 				  struct hda_pcm_stream *hinfo)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+	bool notify_share_sw = false;
+
 	runtime->hw.channels_max = mout->max_channels;
 	if (mout->dig_out_nid) {
 		if (!mout->analog_rates) {
@@ -3729,10 +3757,12 @@ int snd_hda_multi_out_analog_open(struct hda_codec *codec,
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
diff --git a/sound/hda/common/hda_local.h b/sound/hda/common/hda_local.h
index ab423f1cef54..490bed97cbda 100644
--- a/sound/hda/common/hda_local.h
+++ b/sound/hda/common/hda_local.h
@@ -12,6 +12,8 @@
 
 #include <sound/pcm_drm_eld.h>
 
+struct snd_kcontrol;
+
 /* We abuse kcontrol_new.subdev field to pass the NID corresponding to
  * the given new control.  If id.subdev has a bit flag HDA_SUBDEV_NID_FLAG,
  * snd_hda_ctl_add() takes the lower-bit subdev value as a valid NID.
@@ -203,6 +205,7 @@ enum { HDA_DIG_NONE, HDA_DIG_EXCLUSIVE, HDA_DIG_ANALOG_DUP }; /* dig_out_used */
 #define HDA_MAX_OUTS	5
 
 struct hda_multi_out {
+	struct snd_kcontrol *share_spdif_kctl; /* cached shared SPDIF switch */
 	int num_dacs;		/* # of DACs, must be more than 1 */
 	const hda_nid_t *dac_nids;	/* DAC list */
 	hda_nid_t hp_nid;	/* optional DAC for HP, 0 when not exists */

---
base-commit: f16695c0dc9db64f0a5a9871a10b70daee2653e3
change-id: 20260330-hda-spdif-share-notify-22fa4ac00a14

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

