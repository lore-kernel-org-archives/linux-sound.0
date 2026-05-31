Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB14E390CAA;
	Sun, 31 May 2026 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780242349; cv=pass; b=QD5HCRlaAkxCvZUcnIEg2AjHmI8xOf6lWbSvp8+OSH5GbGt2X62CwmqG7PxkR/mqN8wqmJ6zcR9Xp/MfR5bFpeFz6oiEXoqyHvJ9qW3vM/BqN11KKFZLjThV0Vpiy4V4ZYfnbTHCHgQ8wAlzRThOCHRBOt8Rm3swma5P9JpddsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780242349; c=relaxed/simple;
	bh=Wm8oPqT6fUpO1btWZ0z38k1ZxXqRRuR1iXIoVvTBtSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=etEIZ2o3cdan/FBE72tRGHO/zML8Zed8Yb/y4rv35jKxGItjhRLkg22kdvGboBcqWbZ0Voet88io92DMgZ/7i21DLuaB5kE6LuBTkYgsA0XgMAJ5xhd0yhk2LOVZYRFC+sV6RHredKUSPVsEg95lFExEBbSa2augubjnxjQhiTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=ebMOOTOn; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="ebMOOTOn"
ARC-Seal: i=1; a=rsa-sha256; t=1780242340; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S0nAXF1oO62dz9ttmJhyhTbeg40eJQSDG2zMxYiITiZXlvf2jaRxebqNpuewU0s52+BTG9GLz91f0s2TdzoyxT76g3DO2kZT0e54h67UnO7LDEMvpBZhVb2bq/IRQCSKOu6XlpTnZ87HlFldhuzpkBT1OG15ieu9ooLlpyn1qNE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780242340; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YO+PcA8YhwvAv1GPjfnyFQJCsMUZOiD+Q42rQZRxTS4=; 
	b=CoO0sZETUfT5drvXuDdVAP13inKRVMITEEJCc8xDL+i6dtwXUPB+sFFIuGQpB01OS1jmtnjokMUG61HBQwaLFqW6ZP0jq8G4dTXMz4DQEb/cXHX9oENkiyWR6slbAbz3ZpW3mlL11R0IwsQftTFZsOAVwuS0MOKOQmUB+VEYCkA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780242340;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=YO+PcA8YhwvAv1GPjfnyFQJCsMUZOiD+Q42rQZRxTS4=;
	b=ebMOOTOnQNp2Y8SKLG46/q0D+XCad+hH6S2H69b0qrk4S0V1owLz1DOHbN0xXFLz
	wzKkoiQpytHWt1yjDRJFWn8in7unMmtQDP6wA39yTzPA8xt92kGp6AIJS4YgxsoxdxP
	0+t9VHZuuBGNlL/bImkXBo7MCtFdgMHndS2Mby8EG82P/sVvMtGfQCCEUuhJ3nMMmJO
	tvFKR4HKonPJ8Qj42kzU3T59hWHstcSCP3onrrhgM5JSBbYlo25up6EH6Otqqo5Y29A
	J/q9wTaJneXo4NiKXziLvyMcl8jNcQQKb177hMzgrIrPMCnAVsmxUvMCFYB4MV0oDTt
	Hdgamk5Cow==
Received: by mx.zohomail.com with SMTPS id 1780242338497438.26380018282407;
	Sun, 31 May 2026 08:45:38 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 31 May 2026 23:45:20 +0800
Subject: [PATCH v4 1/3] ALSA: usb-audio: Add
 QUIRK_FLAG_MIXER_GET_CUR_BROKEN
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-uac-quirk-get-cur-vol-v4-1-ede643dca151@rong.moe>
References: <20260531-uac-quirk-get-cur-vol-v4-0-ede643dca151@rong.moe>
In-Reply-To: <20260531-uac-quirk-get-cur-vol-v4-0-ede643dca151@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Takashi Iwai <tiwai@suse.de>, Steve Smith <tarkasteve@gmail.com>, 
 linux-sound@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-d5d98
X-ZohoMailClient: External

Since commit 86aa1ea1f15c ("ALSA: usb-audio: Do not expose sticky
mixers"), the UAC mixer core utilizes volume SET_CUR and GET_CUR to
identify devices with sticky mixers. Unfortunately, even though most
devices with sticky GET_CUR also have corresponding sticky SET_CUR,
which I actually met more since the commit had been merged, there is
also a rare case that some devices may have volume mixers that responds
to SET_CUR properly but with its GET_CUR stubbed. This cause the sticky
check to consider the mixer to be sticky and unnecessarily disable it.

As the sticky check can't distinguish between sticky mixers and working
SET_CUR but broken GET_CUR, add QUIRK_FLAG_MIXER_GET_CUR_BROKEN to tell
that the device should fall into the second category when GET_CUR
returns a constant value. In this case, the sticky check becomes
non-fatal and only disables GET_CUR instead of the whole mixer. The
current volume will then be provided by the internal cache that stores
the last set volume.

An info message prompting users to check MIXER_GET_CUR_BROKEN for
potential sticky mixers is also added, so that users can learn how to do
some experiments to determine what's going on. If the mixer surprisingly
turns out to be non-sticky, they can submit a patch for a new quirk
table entry.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 Documentation/sound/alsa-configuration.rst | 12 ++++++
 sound/usb/mixer.c                          | 60 +++++++++++++++++++++++++-----
 sound/usb/mixer.h                          |  1 +
 sound/usb/quirks.c                         |  1 +
 sound/usb/usbaudio.h                       | 13 +++++++
 5 files changed, 77 insertions(+), 10 deletions(-)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index 4b30cd63c5a5..78fb484e8b04 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2389,6 +2389,18 @@ quirk_flags
           from snd_usb_handle_sync_urb. Instead fall through and enqueue a
           packet_info containing only size-0 packets, so the OUT ring keeps
           moving (emits silence). Needed by Behringer Flow 8 (1397:050c).
+        * bit 30: ``mixer_get_cur_broken``
+          Some mixers are sticky, which means that setting their current volume
+          is a no-op, and reading the current volume returns a constant value.
+          The sticky check disables these mixers to prevent confusing userspace.
+          However, some devices do have a tunable volume despite the reported
+          current volume being constant. As the sticky check can't distinguish
+          between the two categories, setting this flag tells that the device
+          should fall into the second category when GET_CUR returns a constant
+          value, resulting in the sticky check being non-fatal and only
+          disabling GET_CUR instead of the whole mixer. The current volume will
+          then be provided by the internal cache that stores the last set
+          volume
 
 This module supports multiple devices, autoprobe and hotplugging.
 
diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index b30af79f716c..b4c855c25eef 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -434,6 +434,11 @@ int snd_usb_get_cur_mix_value(struct usb_mixer_elem_info *cval,
 		*value = cval->cache_val[index];
 		return 0;
 	}
+
+	/* The current value is always provided by the cache after initialization. */
+	if (cval->get_cur_broken)
+		return -ENXIO;
+
 	err = get_cur_mix_raw(cval, channel, value);
 	if (err < 0) {
 		if (!cval->head.mixer->ignore_ctl_error)
@@ -1223,7 +1228,7 @@ static void init_cur_mix_raw(struct usb_mixer_elem_info *cval, int ch, int idx)
 	err = snd_usb_get_cur_mix_value(cval, ch, idx, &val);
 	if (!err)
 		return;
-	if (!cval->head.mixer->ignore_ctl_error)
+	if (!cval->head.mixer->ignore_ctl_error && !cval->get_cur_broken)
 		usb_audio_warn(cval->head.mixer->chip,
 			       "%d:%d: failed to get current value for ch %d (%d)\n",
 			       cval->head.id, mixer_ctrl_intf(cval->head.mixer),
@@ -1237,8 +1242,16 @@ static void init_cur_mix_raw(struct usb_mixer_elem_info *cval, int ch, int idx)
  * Some devices' volume control mixers are sticky, which accept SET_CUR but
  * do absolutely nothing.
  *
- * Prevent sticky mixers from being registered, otherwise they confuses
- * userspace and results in ineffective volume control.
+ * Check the return values of GET_CUR with different SET_CUR values. Consider
+ * the mixer as sticky if GET_CUR always returns a constant value.
+ *
+ * Some devices have effective SET_CUR despite GET_CUR being constant. Do not
+ * consider the mixer as sticky if a quirk flag indicates that.
+ *
+ * Gate the registration of sticky mixers to prevent confusing userspace, so
+ * that they won't cause ineffective volume control. However, for mixers with
+ * effective SET_CUR but broken GET_CUR, the registration can continue normally
+ * but further GET_CUR requests will be gated.
  */
 static int check_sticky_volume_control(struct usb_mixer_elem_info *cval,
 				       int channel, int saved)
@@ -1258,10 +1271,22 @@ static int check_sticky_volume_control(struct usb_mixer_elem_info *cval,
 			return 0;
 	}
 
+	if (cval->head.mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_GET_CUR_BROKEN) {
+		usb_audio_info(cval->head.mixer->chip,
+			       "%d:%d: broken mixer GET_CUR (%d/%d/%d => %d)\n",
+			       cval->head.id, mixer_ctrl_intf(cval->head.mixer),
+			       cval->min, cval->max, cval->res, saved);
+
+		cval->get_cur_broken = 1;
+		return -ENXIO;
+	}
+
 	usb_audio_err(cval->head.mixer->chip,
 		      "%d:%d: sticky mixer values (%d/%d/%d => %d), disabling\n",
 		      cval->head.id, mixer_ctrl_intf(cval->head.mixer),
 		      cval->min, cval->max, cval->res, saved);
+	usb_audio_info(cval->head.mixer->chip,
+		       "check MIXER_GET_CUR_BROKEN if you believe the mixer is non-sticky");
 
 	return -ENODEV;
 }
@@ -1304,7 +1329,7 @@ static void check_volume_control_res(struct usb_mixer_elem_info *cval,
 static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 				   int default_min, struct snd_kcontrol *kctl)
 {
-	int i, idx, ret;
+	int i, idx, ret = 0;
 
 	/* for failsafe */
 	cval->min = default_min;
@@ -1360,8 +1385,10 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 				goto no_checks;
 
 			ret = check_sticky_volume_control(cval, minchn, saved);
-			if (ret < 0)
+			if (ret == -ENODEV)
 				goto sticky;
+			if (ret)
+				goto no_checks;
 
 			if (cval->min + cval->res < cval->max)
 				check_volume_control_res(cval, minchn, saved);
@@ -1370,6 +1397,16 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 		}
 
 no_checks:
+		/*
+		 * Got a non-fatal failure during sanity checks.
+		 *
+		 * Do not propagate mixer values written by sanity checks.
+		 * Instead, rely on init_cur_mix_raw() to initialize the mixer
+		 * properly.
+		 */
+		if (ret)
+			cval->cached = 0;
+
 		cval->initialized = 1;
 	}
 
@@ -3538,7 +3575,8 @@ void snd_usb_mixer_notify_id(struct usb_mixer_interface *mixer, int unitid)
 			continue;
 		info = mixer_elem_list_to_info(list);
 		/* invalidate cache, so the value is read from the device */
-		info->cached = 0;
+		if (!info->get_cur_broken)
+			info->cached = 0;
 		snd_ctl_notify(mixer->chip->card, SNDRV_CTL_EVENT_MASK_VALUE,
 			       &list->kctl->id);
 	}
@@ -3635,10 +3673,12 @@ static void snd_usb_mixer_interrupt_v2(struct usb_mixer_interface *mixer,
 		switch (attribute) {
 		case UAC2_CS_CUR:
 			/* invalidate cache, so the value is read from the device */
-			if (channel)
-				info->cached &= ~BIT(channel);
-			else /* master channel */
-				info->cached = 0;
+			if (!info->get_cur_broken) {
+				if (channel)
+					info->cached &= ~BIT(channel);
+				else /* master channel */
+					info->cached = 0;
+			}
 
 			snd_ctl_notify(mixer->chip->card, SNDRV_CTL_EVENT_MASK_VALUE,
 				       &info->head.kctl->id);
diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
index afbb3dd9f177..3fa1bd96f858 100644
--- a/sound/usb/mixer.h
+++ b/sound/usb/mixer.h
@@ -94,6 +94,7 @@ struct usb_mixer_elem_info {
 	int cache_val[MAX_CHANNELS];
 	u8 initialized;
 	u8 min_mute;
+	u8 get_cur_broken;
 	void *private_data;
 };
 
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 410f5a92c0cf..10c32e633786 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2607,6 +2607,7 @@ static const char *const snd_usb_audio_quirk_flag_names[] = {
 	QUIRK_STRING_ENTRY(MIXER_PLAYBACK_LINEAR_VOL),
 	QUIRK_STRING_ENTRY(MIXER_CAPTURE_LINEAR_VOL),
 	QUIRK_STRING_ENTRY(IFB_SILENCE_ON_EMPTY),
+	QUIRK_STRING_ENTRY(MIXER_GET_CUR_BROKEN),
 	NULL
 };
 
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 9afcad8f143a..e472aef6eb87 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -242,6 +242,17 @@ extern bool snd_usb_skip_validation;
  *  from snd_usb_handle_sync_urb. Instead fall through and enqueue a
  *  packet_info containing only size-0 packets, so the OUT ring keeps
  *  moving (emits silence). Needed by Behringer Flow 8 (1397:050c).
+ * QUIRK_FLAG_MIXER_GET_CUR_BROKEN
+ *  Some mixers are sticky, which means that setting their current volume is a
+ *  no-op, and reading the current volume returns a constant value. The sticky
+ *  check disables these mixers to prevent confusing userspace. However, some
+ *  devices do have a tunable volume despite the reported current volume being
+ *  constant. As the sticky check can't distinguish between the two categories,
+ *  setting this flag tells that the device should fall into the second
+ *  category when GET_CUR returns a constant value, resulting in the sticky
+ *  check being non-fatal and only disabling GET_CUR instead of the whole mixer.
+ *  The current volume will then be provided by the internal cache that stores
+ *  the last set volume
  */
 
 enum {
@@ -275,6 +286,7 @@ enum {
 	QUIRK_TYPE_MIXER_PLAYBACK_LINEAR_VOL	= 27,
 	QUIRK_TYPE_MIXER_CAPTURE_LINEAR_VOL	= 28,
 	QUIRK_TYPE_IFB_SILENCE_ON_EMPTY		= 29,
+	QUIRK_TYPE_MIXER_GET_CUR_BROKEN		= 30,
 /* Please also edit snd_usb_audio_quirk_flag_names */
 };
 
@@ -310,5 +322,6 @@ enum {
 #define QUIRK_FLAG_MIXER_PLAYBACK_LINEAR_VOL	QUIRK_FLAG(MIXER_PLAYBACK_LINEAR_VOL)
 #define QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL	QUIRK_FLAG(MIXER_CAPTURE_LINEAR_VOL)
 #define QUIRK_FLAG_IFB_SILENCE_ON_EMPTY		QUIRK_FLAG(IFB_SILENCE_ON_EMPTY)
+#define QUIRK_FLAG_MIXER_GET_CUR_BROKEN		QUIRK_FLAG(MIXER_GET_CUR_BROKEN)
 
 #endif /* __USBAUDIO_H */

-- 
2.53.0

