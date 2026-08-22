Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050E42D5436;
	Sat, 22 Aug 2026 18:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787424905; cv=pass; b=PFk5IOdXftk4vzthLkWmhRTyOkGRtM53n3q2Dmyb6OqITWJw5rGWFwoWiliQV7eMzCDsNKC81GiBAdNVSl6o7NhfMQ1aV2soENYqa7LCqFr5ZToKqW0iP3jHfPR+CXVUusHpwDAGFpFfkTCeNO3V0cfPaRSbmjxYg/Cvif4WG1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787424905; c=relaxed/simple;
	bh=dUo0bKFmk9T2t/O6uSmMJoI5/LWEx1j/ZExt8pOkB7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kffMzSB6ya1SivVO/ZGO1cpQ41cyf1NWWE8Vodh4VqZX0UoS+fCPRcc5Q+GJAIou2xKJCq3PmZ6L9L1ocaZvs0aC/f59z0ShEXb4m8zykXVAKJcsLrkfxwg3D//035o5FKXDa8ndakwWgujGmzJquEdD7RD5D9B5nS3fHxTyqvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=NwL1zEXq; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="NwL1zEXq"
ARC-Seal: i=1; a=rsa-sha256; t=1787424789; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Jzuwjg3A/HMIOVRVdm4mB887kKtR9XvA2nuoUadGzmcsMahud0ba3U7usOU4cZEGiDmF3PzSpy1Nt+E2+5E/9Vyitg/O3rty1Wu2h3WdWUgeSXIK3GQPDQe5y97OO/dWYKbb6gkUtUwEH7BOY33pTg55P8RGtiK9rceMHGgOSPs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787424789; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0zqcpQXWOqNgq/eBKT5QR2wE1cQscPmDLlSWPN4tOps=; 
	b=AfK02XePLUlncWQXNFw5eszqiIxU22jH5ZPx6WuCAzPUyCzo1bS6HELIw6V3aSvxnpKQRVLh90GwoAPWuaNC0Xb0EJIuCQ+AG2abm++O5QvJoyfMMxeW1bUZQDcWeymMkMbz3HpL0l+VrOMVtL+A7F7FxC6lWXxOxq2Jc2I/Uxo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787424789;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=0zqcpQXWOqNgq/eBKT5QR2wE1cQscPmDLlSWPN4tOps=;
	b=NwL1zEXq/cTp2JoGQTH1coH/E37dHsO+tDz5nrVkdUdVBNbZFTBeg61mfdSx3LGG
	w6nLE6/LlQOEXxvTKYwCVtb4TPRtQ4VhYd2KKlMN+Nvsa4/I0ovIueAf4WvCjO//h+O
	XUS9FWOYU5Wqoh0VDiN0boopZZOQ2mKJKGgylTBkycb+FBrmijyhPNtMfwGtsSVHNdr
	Z3Iak9T/7041Q6U1aeclrnOgoaNpmcoVq6sY3ydThpeFkG7ApFgBSJge4hFtMZ27Q9z
	P05nmC1muWwSG0N851sXJBMIN3ISH51HDAWUcuP2lFnisidxfx43qI5BDtfblarsRHW
	1/FDwsuWOA==
Received: by mx.zohomail.com with SMTPS id 1787424787616699.4801107926021;
	Sat, 22 Aug 2026 11:53:07 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 23 Aug 2026 02:52:30 +0800
Subject: [PATCH 3/4] ALSA: usb-audio: Reverse MIXER_GET_CUR_BROKEN as
 MIXER_GET_CUR_OK
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260823-uac-demote-sticky-check-v1-3-a8cbe572edff@rong.moe>
References: <20260823-uac-demote-sticky-check-v1-0-a8cbe572edff@rong.moe>
In-Reply-To: <20260823-uac-demote-sticky-check-v1-0-a8cbe572edff@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexander Niemeyer <adventureFAN@gmx.de>, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-1f2f7
X-ZohoMailClient: External

The default behavior of sticky check now becomes what
QUIRK_FLAG_MIXER_GET_CUR_BROKEN originally does, so the quirk flag is no
longer needed.

On some devices, whether their GET_CUR being sticky depends on whether
hotpluggable components are present. When the hotpluggable components
are missing on probe, their GET_CUR behavior is classified as broken.
Therefore, reverse QUIRK_FLAG_MIXER_GET_CUR_BROKEN as
QUIRK_FLAG_MIXER_GET_CUR_OK, so that it can be set to prevent the
heuristics from gating GET_CUR.

Note that even if the quirk flag is set, init_cur_mix_raw() should still
initialize the mixer value to cval->min, otherwise restoring the bogus
saved value on the first channel could lead to unbalanced channels.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 Documentation/sound/alsa-configuration.rst | 20 ++++++++------------
 sound/usb/mixer.c                          |  8 ++++++++
 sound/usb/quirks.c                         | 16 +++-------------
 sound/usb/usbaudio.h                       | 20 +++++++-------------
 4 files changed, 26 insertions(+), 38 deletions(-)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index 71733e807a7c..e500ec84e3ef 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2316,6 +2316,9 @@ quirk_flags
     applies the ``mixer_playback_min_mute`` flag and clears the
     ``ignore_ctl_error`` flag for the device 1234:abcd, and applies the
     ``skip_sample_rate`` flag for all devices.
+    New quirk flags may replace old ones by reusing the latter's bits, so the
+    new usage is preferred. Despite that, depending on the order of probing is
+    fragile, so it'd better migrate to the new usage anyway.
 
         * bit 0: ``get_sample_rate``
           Skip reading sample rate for devices
@@ -2389,18 +2392,11 @@ quirk_flags
           from snd_usb_handle_sync_urb. Instead fall through and enqueue a
           packet_info containing only size-0 packets, so the OUT ring keeps
           moving (emits silence). Needed by Behringer Flow 8 (1397:050c).
-        * bit 30: ``mixer_get_cur_broken``
-          Some mixers are sticky, which means that setting their current volume
-          is a no-op, and reading the current volume returns a constant value.
-          The sticky check disables these mixers to prevent confusing userspace.
-          However, some devices do have a tunable volume despite the reported
-          current volume being constant. As the sticky check can't distinguish
-          between the two categories, setting this flag tells that the device
-          should fall into the second category when GET_CUR returns a constant
-          value, resulting in the sticky check being non-fatal and only
-          disabling GET_CUR instead of the whole mixer. The current volume will
-          then be provided by the internal cache that stores the last set
-          volume
+        * bit 30: ``mixer_get_cur_ok``
+          On some devices, whether their GET_CUR being sticky depends on whether
+          hotpluggable components are present. When the hotpluggable components
+          are missing on probe, their GET_CUR behavior is classified as broken.
+          Set the flag to prevent the heuristics from gating GET_CUR.
         * bit 31: ``playback_urb_fixup``
           Some devices show the stuttering at playback, and this quirk
           works around it by enforcing the fixed max URBs (12) instead of
diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 3aa9a9c12557..ecaa8bc08d7c 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1447,6 +1447,14 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 		}
 	}
 
+	/*
+	 * When GET_CUR is sticky, the saved value is bogus, so mixer values set
+	 * by the sanity checks must be discarded through init_cur_mix_raw().
+	 * After that, we can clear the flag as per QUIRK_FLAG_MIXER_GET_CUR_OK.
+	 */
+	if (cval->head.mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_GET_CUR_OK)
+		cval->get_cur_broken = 0;
+
 	return 0;
 }
 
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index eb1750def067..b62168a11e32 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2215,8 +2215,6 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
 	DEVICE_FLG(0x03f0, 0x654a, /* HP 320 FHD Webcam */
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
-	DEVICE_FLG(0x040b, 0x0897, /* Weltrend Semiconductor, sold as Redragon H510-PRO Wireless headset */
-		   QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
 	DEVICE_FLG(0x041e, 0x3000, /* Creative SB Extigy */
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x041e, 0x4080, /* Creative Live Cam VF0610 */
@@ -2256,8 +2254,6 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	DEVICE_FLG(0x046d, 0x0a8f, /* Logitech H390 headset */
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M |
 		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
-	DEVICE_FLG(0x046d, 0x0af7, /* Logitech PRO X 2 LIGHTSPEED */
-		   QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
 	DEVICE_FLG(0x0499, 0x1506, /* Yamaha THR5 */
 		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x0499, 0x1509, /* Steinberg UR22 */
@@ -2329,9 +2325,9 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	DEVICE_FLG(0x0763, 0x2031, /* M-Audio Fast Track C600 */
 		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x0763, 0x2080, /* M-Audio Fast Track Ultra */
-		   QUIRK_FLAG_MIXER_GET_CUR_BROKEN | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
+		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x0763, 0x2081, /* M-Audio Fast Track Ultra */
-		   QUIRK_FLAG_MIXER_GET_CUR_BROKEN | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
+		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x07fd, 0x000b, /* MOTU M Series 2nd hardware revision */
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
 	DEVICE_FLG(0x08bb, 0x2702, /* LineX FM Transmitter */
@@ -2370,8 +2366,6 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x1038, 0x1294, /* SteelSeries Arctis Pro Wireless */
 		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
-	DEVICE_FLG(0x1038, 0x2232, /* SteelSeries Arctis Nova 5 */
-		   QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
 	DEVICE_FLG(0x1101, 0x0003, /* Audioengine D1 */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x12d1, 0x3a07, /* HUAWEI USB-C HEADSET */
@@ -2379,8 +2373,6 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
 	DEVICE_FLG(0x1224, 0x2a25, /* Jieli Technology USB PHY 2.0 */
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
-	DEVICE_FLG(0x1377, 0x6004, /* Sennheiser MOMENTUM 3 */
-		   QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
 	DEVICE_FLG(0x1395, 0x740a, /* Sennheiser DECT */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x1397, 0x0507, /* Behringer UMC202HD */
@@ -2505,8 +2497,6 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
 	DEVICE_FLG(0x2d99, 0x0026, /* HECATE G2 GAMING HEADSET */
 		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
-	DEVICE_FLG(0x2d99, 0xa024, /* Edifier MF200 */
-		   QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
 	DEVICE_FLG(0x2fc6, 0xf06b, /* MOONDROP Moonriver2 Ti */
 		   QUIRK_FLAG_CTL_MSG_DELAY),
 	DEVICE_FLG(0x2fc6, 0xf0b5, /* iBasso DC-Elite */
@@ -2647,7 +2637,7 @@ static const char *const snd_usb_audio_quirk_flag_names[] = {
 	QUIRK_STRING_ENTRY(MIXER_PLAYBACK_LINEAR_VOL),
 	QUIRK_STRING_ENTRY(MIXER_CAPTURE_LINEAR_VOL),
 	QUIRK_STRING_ENTRY(IFB_SILENCE_ON_EMPTY),
-	QUIRK_STRING_ENTRY(MIXER_GET_CUR_BROKEN),
+	QUIRK_STRING_ENTRY(MIXER_GET_CUR_OK),
 	QUIRK_STRING_ENTRY(PLAYBACK_URB_FIXUP),
 	QUIRK_STRING_ENTRY(ALWAYS_SET_RATE),
 	NULL
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index abc2d7e579de..24436473931d 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -243,17 +243,11 @@ extern bool snd_usb_skip_validation;
  *  from snd_usb_handle_sync_urb. Instead fall through and enqueue a
  *  packet_info containing only size-0 packets, so the OUT ring keeps
  *  moving (emits silence). Needed by Behringer Flow 8 (1397:050c).
- * QUIRK_FLAG_MIXER_GET_CUR_BROKEN
- *  Some mixers are sticky, which means that setting their current volume is a
- *  no-op, and reading the current volume returns a constant value. The sticky
- *  check disables these mixers to prevent confusing userspace. However, some
- *  devices do have a tunable volume despite the reported current volume being
- *  constant. As the sticky check can't distinguish between the two categories,
- *  setting this flag tells that the device should fall into the second
- *  category when GET_CUR returns a constant value, resulting in the sticky
- *  check being non-fatal and only disabling GET_CUR instead of the whole mixer.
- *  The current volume will then be provided by the internal cache that stores
- *  the last set volume
+ * QUIRK_FLAG_MIXER_GET_CUR_OK
+ *  On some devices, whether their GET_CUR being sticky depends on whether
+ *  hotpluggable components are present. When the hotpluggable components are
+ *  missing on probe, their GET_CUR behavior is classified as broken. Set the
+ *  flag to prevent the heuristics from gating GET_CUR.
  * QUIRK_FLAG_PLAYBACK_URB_FIXUP
  *  Set URB_ISO_ASAP flag for isochronous URBs and force nurbs to MAX_URBS.
  *  This is needed for devices that exhibit boot-time audio stuttering due
@@ -297,7 +291,7 @@ enum {
 	QUIRK_TYPE_MIXER_PLAYBACK_LINEAR_VOL	= 27,
 	QUIRK_TYPE_MIXER_CAPTURE_LINEAR_VOL	= 28,
 	QUIRK_TYPE_IFB_SILENCE_ON_EMPTY		= 29,
-	QUIRK_TYPE_MIXER_GET_CUR_BROKEN		= 30,
+	QUIRK_TYPE_MIXER_GET_CUR_OK		= 30,
 	QUIRK_TYPE_PLAYBACK_URB_FIXUP		= 31,
 	QUIRK_TYPE_ALWAYS_SET_RATE		= 32,
 /* Please also edit snd_usb_audio_quirk_flag_names and alsa-configuration.rst */
@@ -335,7 +329,7 @@ enum {
 #define QUIRK_FLAG_MIXER_PLAYBACK_LINEAR_VOL	QUIRK_FLAG(MIXER_PLAYBACK_LINEAR_VOL)
 #define QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL	QUIRK_FLAG(MIXER_CAPTURE_LINEAR_VOL)
 #define QUIRK_FLAG_IFB_SILENCE_ON_EMPTY		QUIRK_FLAG(IFB_SILENCE_ON_EMPTY)
-#define QUIRK_FLAG_MIXER_GET_CUR_BROKEN		QUIRK_FLAG(MIXER_GET_CUR_BROKEN)
+#define QUIRK_FLAG_MIXER_GET_CUR_OK		QUIRK_FLAG(MIXER_GET_CUR_OK)
 #define QUIRK_FLAG_PLAYBACK_URB_FIXUP		QUIRK_FLAG(PLAYBACK_URB_FIXUP)
 #define QUIRK_FLAG_ALWAYS_SET_RATE		QUIRK_FLAG(ALWAYS_SET_RATE)
 

-- 
2.55.0

