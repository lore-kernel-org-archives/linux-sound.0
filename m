Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04091E32D6;
	Wed, 27 May 2026 18:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779908231; cv=pass; b=u/+sN95tLneTXVCtx/altquuf8yxn6RJccRBBYPfdNGdSKvZRcftLegAw5P2ab23C6+xgM9kyefP4KqqCzhVZC1YlWwmEhubBxS26LPaIC6JZIQ/B6bODaQMjN//ZdyZLcKayiWQFGQ7VMbuIqL3pkOvMILxdPQphaStcZNHhIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779908231; c=relaxed/simple;
	bh=TwGY9EUCgVUpudxd47mpIfAy54t39yjD/6/xHxWCcN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pYQqIk3k+GxtDQOTQluk5juASvgL05KiaDam7DfXW6v6w6t0xCTt2GZCReO9z2vhZ4Mlg2i6UKeCUHhFGD7G88s8shlyBxcJbvdIRxnJ+bpotluiuHnlQ7dAmuFwZ6+dGGe/Z7RhRlRhHJK6WG/Tmq8TKirxF4sDQmTEfyxDkF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=RPnX101X; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="RPnX101X"
ARC-Seal: i=1; a=rsa-sha256; t=1779908226; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=b0PMW1WfhG1v4FtnIDcrTv8l8v7N/5273UBAq7XZF7jtHtGUBrJvKgaxnG5k+T9nO7otzt1FKRKEIFvIdGpNX/p4JGJuGxm/aYkZvS1Ww9+5gYmIENmnQsKSbJO1FCiJAff83gH3rLFJGNenCUKGqPXLOl1zV79rdlOLTD1I3lM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779908226; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=k6jJHAGWv2lFTgCAtiC2RZxGb/W2yw+XcbRpOAYffwM=; 
	b=QQ6k/MdqkAkJRPi9MBoFkltnzvhPy10Jp1jrgtLs4X9jjYC7aYDB1oM2UoWmQqsuEd9xoHqhWA1pdjqezB0qfl1JoW7Foj/XaO5N+dr88PFDNVDbe8LRP0ZtPdUdMnNN8Zp+I1moIO12/AO3S3uFShrQqp5LhZPV7ZaND444utc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779908226;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=k6jJHAGWv2lFTgCAtiC2RZxGb/W2yw+XcbRpOAYffwM=;
	b=RPnX101XkquQnOk7FhycLom+TW9ktbHdDdf9uZ/3ycGlw2ZwdBsvC6Iqv08vDWyo
	dEjGUuvkKVoz4ZhfoYLsH9JFvGNNvHM5T+hgNh+0e1irIv3GyB7zwlI06Y7dwa8nSNY
	KB1fudMrRgWEH+a7jKIvBe+7tchvebnem4HhUlff6/lqFYbt2XZKhROW34iiZjq5V8Y
	LS6l12T7dsAhyHAZ0qcYStue9uueBQzH6H74vNS44rgwX3WuiOBwuOA90687LMdSTTY
	rdz2bUwxDCWUnJE9PfKmGz7mhFErYbUGjJ0jbd/YmqYmubX4xQBJ2CLX0cMCL62S3hx
	FGeTgQF1RQ==
Received: by mx.zohomail.com with SMTPS id 1779908225320473.38762429553503;
	Wed, 27 May 2026 11:57:05 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Thu, 28 May 2026 02:56:27 +0800
Subject: [PATCH v2 1/2] ALSA: usb-audio: Add
 QUIRK_FLAG_MIXER_GET_CUR_BROKEN
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-uac-quirk-get-cur-vol-v2-1-84d3c8f48150@rong.moe>
References: <20260528-uac-quirk-get-cur-vol-v2-0-84d3c8f48150@rong.moe>
In-Reply-To: <20260528-uac-quirk-get-cur-vol-v2-0-84d3c8f48150@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Rong Zhang <i@rong.moe>, linux-sound@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
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

Signed-off-by: Rong Zhang <i@rong.moe>
---
 Documentation/sound/alsa-configuration.rst | 12 ++++++++++++
 sound/usb/mixer.c                          | 17 +++++++++++++++--
 sound/usb/mixer.h                          |  1 +
 sound/usb/quirks.c                         |  1 +
 sound/usb/usbaudio.h                       | 13 +++++++++++++
 5 files changed, 42 insertions(+), 2 deletions(-)

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
index d61bde654219..27d6445cc319 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -420,6 +420,9 @@ static int get_cur_ctl_value(struct usb_mixer_elem_info *cval,
 static inline int get_cur_mix_raw(struct usb_mixer_elem_info *cval,
 				  int channel, int *value)
 {
+	if (cval->get_cur_broken)
+		return -ENXIO;
+
 	return get_ctl_value(cval, UAC_GET_CUR,
 			     (cval->control << 8) | channel,
 			     value);
@@ -1258,6 +1261,16 @@ static int check_sticky_volume_control(struct usb_mixer_elem_info *cval,
 			return 0;
 	}
 
+	if (cval->head.mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_GET_CUR_BROKEN) {
+		usb_audio_warn(cval->head.mixer->chip,
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
@@ -1360,12 +1373,12 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 				goto no_checks;
 
 			ret = check_sticky_volume_control(cval, minchn, saved);
-			if (ret < 0) {
+			if (ret == -ENODEV) {
 				snd_usb_set_cur_mix_value(cval, minchn, 0, saved);
 				return ret;
 			}
 
-			if (cval->min + cval->res < cval->max)
+			if (!ret && cval->min + cval->res < cval->max)
 				check_volume_control_res(cval, minchn, saved);
 
 			snd_usb_set_cur_mix_value(cval, minchn, 0, saved);
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
index e2c95be38aca..ac2f0f6039be 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2605,6 +2605,7 @@ static const char *const snd_usb_audio_quirk_flag_names[] = {
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

