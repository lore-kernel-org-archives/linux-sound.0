Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA9C25D8F6
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 10:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195865; cv=none; b=m2FdysfG6IcHCvs+8Vr882XbhaQom2IVukOYeA0kkPC/epi1wPuTqN2m3lhwi/mtpXQ2+hgtHuQGEX+0dhV/FShnZHTPR5cjGZq0JfXoxvPGqQ7HttYcGOB8cs+ACE2q5n0yIr4Xzac4WzS1kCJcP4VjvXwJ+VzeN90i4AFj5z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195865; c=relaxed/simple;
	bh=y3D+xY5AicFp52/KRIcFbt0Ng3QFmhpvHu4leKLRReQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MUqVYwEgKidVrbTCUQifQI44B/pIxOyDQe7kmMRaBBHt0qBai08gj8GFUgKIxT+E8y1E/er7B9ntgy3l4J8MsA+QZ0cmVmHPPJq7PfUScc6egN4qeeZ3ZlDImjuruFC2zbCV8DY5cOOIMpMZ6artq8qTrRo6l3PUYY4WMR88ebE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=icyxISyC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="icyxISyC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744195863; x=1775731863;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y3D+xY5AicFp52/KRIcFbt0Ng3QFmhpvHu4leKLRReQ=;
  b=icyxISyCPT2OJT2RJfn6ZgPX55OSeWWRMWjMP4KxkG049J7Opy6lcH6j
   U5RPamyXLCdNUYIzAF39UJ+jOVr2R+raB0Kei4WtUDGY2XuTbJB03mrUN
   jXAGxQVmB5g4O17twRmg7WiIxx6Hzu34BIpxlxoybPC1+NLmhriYv2OgW
   JtoPr3o7/mcJfyq7EApnlRFweGezGXEwTjNoLjHy+2jP4PbrARsBtOw6x
   F2HmpTCKg+D4etireIZzGj+9G43sGStCHqEwzQMfdrelUclxu8xJidhes
   6Bt7QiYciptLn9LeUghv7QPAXt0VRGf/Q+zElNJ2t5jyq1XH6LETdhHC/
   w==;
X-CSE-ConnectionGUID: awU5u3uQQh612DXP8EPJcQ==
X-CSE-MsgGUID: e5IlSC9DQLufxKZm6UR04A==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45380040"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45380040"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 03:51:03 -0700
X-CSE-ConnectionGUID: /mEr5S69T1KgdMbrvnFwfQ==
X-CSE-MsgGUID: TJsWCBu+TLenmatsyb0gIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="133426193"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 03:51:01 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	gregkh@linuxfoundation.org,
	quic_wcheng@quicinc.com,
	mathias.nyman@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [RFC 03/15] ALSA: usb: Relocate the usbaudio header file
Date: Wed,  9 Apr 2025 13:07:18 +0200
Message-Id: <20250409110731.3752332-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250409110731.3752332-1-cezary.rojewski@intel.com>
References: <20250409110731.3752332-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For ALSA and ASoC to share the symbols, common header shall be defined.
Existing usbaudio.h holds most of important stuff, with few adjustments
it can be simply relocated to include/ to satisfy needs of both
frameworks. The adjstments are:

- rename quirk_type enumeration to snd_usb_quirk_type to avoid naming
  conflits
- add quirk pointer so that quirks applied for a USB device can later be
  referred to

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/usb/usbaudio.h => include/sound/usb.h | 24 +++++++++++----------
 sound/usb/caiaq/device.h                    |  2 +-
 sound/usb/card.c                            |  2 +-
 sound/usb/clock.c                           |  2 +-
 sound/usb/endpoint.c                        |  2 +-
 sound/usb/format.c                          |  2 +-
 sound/usb/helper.c                          |  2 +-
 sound/usb/implicit.c                        |  2 +-
 sound/usb/media.c                           |  2 +-
 sound/usb/midi.c                            |  2 +-
 sound/usb/midi.h                            |  2 ++
 sound/usb/midi2.c                           |  2 +-
 sound/usb/midi2.h                           |  1 +
 sound/usb/misc/ua101.c                      |  2 +-
 sound/usb/mixer.c                           |  2 +-
 sound/usb/mixer_quirks.c                    |  2 +-
 sound/usb/mixer_s1810c.c                    |  2 +-
 sound/usb/mixer_scarlett.c                  |  2 +-
 sound/usb/mixer_scarlett2.c                 |  2 +-
 sound/usb/mixer_us16x08.c                   |  2 +-
 sound/usb/pcm.c                             |  2 +-
 sound/usb/power.c                           |  2 +-
 sound/usb/proc.c                            |  2 +-
 sound/usb/quirks.c                          |  2 +-
 sound/usb/quirks.h                          |  2 ++
 sound/usb/stream.c                          |  2 +-
 sound/usb/usx2y/us122l.c                    |  2 +-
 sound/usb/usx2y/usX2Yhwdep.c                |  1 +
 sound/usb/usx2y/usbusx2y.h                  |  2 +-
 sound/usb/validate.c                        |  2 +-
 30 files changed, 44 insertions(+), 36 deletions(-)
 rename sound/usb/usbaudio.h => include/sound/usb.h (98%)

diff --git a/sound/usb/usbaudio.h b/include/sound/usb.h
similarity index 98%
rename from sound/usb/usbaudio.h
rename to include/sound/usb.h
index 158ec053dc44..7e7a86b5c9c4 100644
--- a/sound/usb/usbaudio.h
+++ b/include/sound/usb.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
-#ifndef __USBAUDIO_H
-#define __USBAUDIO_H
+#ifndef __SOUND_USB_H
+#define __SOUND_USB_H
+
 /*
  *   (Tentative) USB Audio Driver for ALSA
  *
@@ -21,6 +22,14 @@ struct media_intf_devnode;
 
 #define MAX_CARD_INTERFACES	16
 
+struct snd_usb_audio_quirk {
+	const char *vendor_name;
+	const char *product_name;
+	int16_t ifnum;
+	uint16_t type;
+	const void *data;
+};
+
 /*
  * Structure holding assosiation between Audio Control Interface
  * and given Streaming or Midi Interface.
@@ -37,6 +46,7 @@ struct snd_usb_audio {
 	struct usb_interface *intf[MAX_CARD_INTERFACES];
 	u32 usb_id;
 	uint16_t quirk_type;
+	const struct snd_usb_audio_quirk *quirk;
 	struct mutex mutex;
 	unsigned int system_suspend;
 	atomic_t active;
@@ -99,7 +109,7 @@ struct snd_usb_audio {
 #define QUIRK_NO_INTERFACE		-2
 #define QUIRK_ANY_INTERFACE		-1
 
-enum quirk_type {
+enum snd_usb_quirk_type {
 	QUIRK_IGNORE_INTERFACE,
 	QUIRK_COMPOSITE,
 	QUIRK_AUTODETECT,
@@ -124,14 +134,6 @@ enum quirk_type {
 	QUIRK_TYPE_COUNT
 };
 
-struct snd_usb_audio_quirk {
-	const char *vendor_name;
-	const char *product_name;
-	int16_t ifnum;
-	uint16_t type;
-	const void *data;
-};
-
 #define combine_word(s)    ((*(s)) | ((unsigned int)(s)[1] << 8))
 #define combine_triple(s)  (combine_word(s) | ((unsigned int)(s)[2] << 16))
 #define combine_quad(s)    (combine_triple(s) | ((unsigned int)(s)[3] << 24))
diff --git a/sound/usb/caiaq/device.h b/sound/usb/caiaq/device.h
index 743eb0387b5f..2346dc8209c9 100644
--- a/sound/usb/caiaq/device.h
+++ b/sound/usb/caiaq/device.h
@@ -2,7 +2,7 @@
 #ifndef CAIAQ_DEVICE_H
 #define CAIAQ_DEVICE_H
 
-#include "../usbaudio.h"
+#include <sound/usb.h>
 
 #define USB_VID_NATIVEINSTRUMENTS 0x17cc
 
diff --git a/sound/usb/card.c b/sound/usb/card.c
index 65de8e7854b6..d8794adb7a88 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -40,8 +40,8 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/initval.h>
+#include <sound/usb.h>
 
-#include "usbaudio.h"
 #include "card.h"
 #include "midi.h"
 #include "midi2.h"
diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 842ba5b801ea..fa5bc7b8c79c 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -14,8 +14,8 @@
 #include <sound/core.h>
 #include <sound/info.h>
 #include <sound/pcm.h>
+#include <sound/usb.h>
 
-#include "usbaudio.h"
 #include "card.h"
 #include "helper.h"
 #include "clock.h"
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index a29f28eb7d0c..bdd2b75ebfed 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -12,8 +12,8 @@
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
+#include <sound/usb.h>
 
-#include "usbaudio.h"
 #include "helper.h"
 #include "card.h"
 #include "endpoint.h"
diff --git a/sound/usb/format.c b/sound/usb/format.c
index 6049d957694c..1fa1711980ad 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -11,8 +11,8 @@
 
 #include <sound/core.h>
 #include <sound/pcm.h>
+#include <sound/usb.h>
 
-#include "usbaudio.h"
 #include "card.h"
 #include "quirks.h"
 #include "helper.h"
diff --git a/sound/usb/helper.c b/sound/usb/helper.c
index 72b671fb2c84..2e4da52f8d8e 100644
--- a/sound/usb/helper.c
+++ b/sound/usb/helper.c
@@ -5,8 +5,8 @@
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/usb.h>
+#include <sound/usb.h>
 
-#include "usbaudio.h"
 #include "helper.h"
 #include "quirks.h"
 
diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
index 4727043fd745..fd0b23e7d92e 100644
--- a/sound/usb/implicit.c
+++ b/sound/usb/implicit.c
@@ -11,8 +11,8 @@
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
+#include <sound/usb.h>
 
-#include "usbaudio.h"
 #include "card.h"
 #include "helper.h"
 #include "pcm.h"
diff --git a/sound/usb/media.c b/sound/usb/media.c
index b175fa820345..7060410fd1c6 100644
--- a/sound/usb/media.c
+++ b/sound/usb/media.c
@@ -24,8 +24,8 @@
 
 #include <sound/pcm.h>
 #include <sound/core.h>
+#include <sound/usb.h>
 
-#include "usbaudio.h"
 #include "card.h"
 #include "mixer.h"
 #include "media.h"
diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index 767f1948cc5a..53d327ee8014 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -54,7 +54,7 @@
 #include <sound/control.h>
 #include <sound/rawmidi.h>
 #include <sound/asequencer.h>
-#include "usbaudio.h"
+#include <sound/usb.h>
 #include "midi.h"
 #include "power.h"
 #include "helper.h"
diff --git a/sound/usb/midi.h b/sound/usb/midi.h
index 2100f1486b03..bf3561652ba8 100644
--- a/sound/usb/midi.h
+++ b/sound/usb/midi.h
@@ -2,6 +2,8 @@
 #ifndef __USBMIDI_H
 #define __USBMIDI_H
 
+#include <sound/usb.h>
+
 /* maximum number of endpoints per interface */
 #define MIDI_MAX_ENDPOINTS 2
 
diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
index 692dfc3c182f..f1d925b74692 100644
--- a/sound/usb/midi2.c
+++ b/sound/usb/midi2.c
@@ -18,7 +18,7 @@
 #include <sound/core.h>
 #include <sound/control.h>
 #include <sound/ump.h>
-#include "usbaudio.h"
+#include <sound/usb.h>
 #include "midi.h"
 #include "midi2.h"
 #include "helper.h"
diff --git a/sound/usb/midi2.h b/sound/usb/midi2.h
index 94a65fcbd58b..3e66531d5e80 100644
--- a/sound/usb/midi2.h
+++ b/sound/usb/midi2.h
@@ -2,6 +2,7 @@
 #ifndef __USB_AUDIO_MIDI2_H
 #define __USB_AUDIO_MIDI2_H
 
+#include <sound/usb.h>
 #include "midi.h"
 
 #if IS_ENABLED(CONFIG_SND_USB_AUDIO_MIDI_V2)
diff --git a/sound/usb/misc/ua101.c b/sound/usb/misc/ua101.c
index 4f6b20ed29dd..454587cdcad7 100644
--- a/sound/usb/misc/ua101.c
+++ b/sound/usb/misc/ua101.c
@@ -13,7 +13,7 @@
 #include <sound/initval.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
-#include "../usbaudio.h"
+#include <sound/usb.h>
 #include "../midi.h"
 
 MODULE_DESCRIPTION("Edirol UA-101/1000 driver");
diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index e2e0ddf1957d..f95da9368921 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -43,8 +43,8 @@
 #include <sound/hwdep.h>
 #include <sound/info.h>
 #include <sound/tlv.h>
+#include <sound/usb.h>
 
-#include "usbaudio.h"
 #include "mixer.h"
 #include "helper.h"
 #include "mixer_quirks.h"
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 23fcd680167d..54d16e0f8ac4 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -29,8 +29,8 @@
 #include <sound/hwdep.h>
 #include <sound/info.h>
 #include <sound/tlv.h>
+#include <sound/usb.h>
 
-#include "usbaudio.h"
 #include "mixer.h"
 #include "mixer_quirks.h"
 #include "mixer_scarlett.h"
diff --git a/sound/usb/mixer_s1810c.c b/sound/usb/mixer_s1810c.c
index fac4bbc6b275..d95edb1dc4d0 100644
--- a/sound/usb/mixer_s1810c.c
+++ b/sound/usb/mixer_s1810c.c
@@ -18,8 +18,8 @@
 #include <linux/slab.h>
 #include <sound/core.h>
 #include <sound/control.h>
+#include <sound/usb.h>
 
-#include "usbaudio.h"
 #include "mixer.h"
 #include "mixer_quirks.h"
 #include "helper.h"
diff --git a/sound/usb/mixer_scarlett.c b/sound/usb/mixer_scarlett.c
index ff548041679b..f31718caa679 100644
--- a/sound/usb/mixer_scarlett.c
+++ b/sound/usb/mixer_scarlett.c
@@ -124,8 +124,8 @@
 #include <sound/core.h>
 #include <sound/control.h>
 #include <sound/tlv.h>
+#include <sound/usb.h>
 
-#include "usbaudio.h"
 #include "mixer.h"
 #include "helper.h"
 #include "power.h"
diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 7f595c1752a5..a3866e9dd1ac 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -158,10 +158,10 @@
 #include <sound/control.h>
 #include <sound/tlv.h>
 #include <sound/hwdep.h>
+#include <sound/usb.h>
 
 #include <uapi/sound/scarlett2.h>
 
-#include "usbaudio.h"
 #include "mixer.h"
 #include "helper.h"
 
diff --git a/sound/usb/mixer_us16x08.c b/sound/usb/mixer_us16x08.c
index 20ac32635f1f..bdceb3b38689 100644
--- a/sound/usb/mixer_us16x08.c
+++ b/sound/usb/mixer_us16x08.c
@@ -11,8 +11,8 @@
 
 #include <sound/core.h>
 #include <sound/control.h>
+#include <sound/usb.h>
 
-#include "usbaudio.h"
 #include "mixer.h"
 #include "helper.h"
 
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 08bf535ed163..ea698f061af9 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -13,8 +13,8 @@
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
+#include <sound/usb.h>
 
-#include "usbaudio.h"
 #include "card.h"
 #include "quirks.h"
 #include "endpoint.h"
diff --git a/sound/usb/power.c b/sound/usb/power.c
index 66bd4daa68fd..ad847aadb4fb 100644
--- a/sound/usb/power.c
+++ b/sound/usb/power.c
@@ -8,8 +8,8 @@
 #include <linux/usb/audio.h>
 #include <linux/usb/audio-v2.h>
 #include <linux/usb/audio-v3.h>
+#include <sound/usb.h>
 
-#include "usbaudio.h"
 #include "helper.h"
 #include "power.h"
 
diff --git a/sound/usb/proc.c b/sound/usb/proc.c
index e9bbaea7b2fa..b7e898722ff4 100644
--- a/sound/usb/proc.c
+++ b/sound/usb/proc.c
@@ -8,8 +8,8 @@
 #include <sound/core.h>
 #include <sound/info.h>
 #include <sound/pcm.h>
+#include <sound/usb.h>
 
-#include "usbaudio.h"
 #include "helper.h"
 #include "card.h"
 #include "endpoint.h"
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 8ba0aff8be2e..2a9470ef8b5f 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -13,8 +13,8 @@
 #include <sound/core.h>
 #include <sound/info.h>
 #include <sound/pcm.h>
+#include <sound/usb.h>
 
-#include "usbaudio.h"
 #include "card.h"
 #include "mixer.h"
 #include "mixer_quirks.h"
diff --git a/sound/usb/quirks.h b/sound/usb/quirks.h
index f9bfd5ac7bab..0ea079688261 100644
--- a/sound/usb/quirks.h
+++ b/sound/usb/quirks.h
@@ -2,6 +2,8 @@
 #ifndef __USBAUDIO_QUIRKS_H
 #define __USBAUDIO_QUIRKS_H
 
+#include <sound/usb.h>
+
 struct audioformat;
 struct snd_usb_endpoint;
 struct snd_usb_substream;
diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index 4d83c95bd9a8..6beeff03d711 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -14,8 +14,8 @@
 #include <sound/pcm.h>
 #include <sound/control.h>
 #include <sound/tlv.h>
+#include <sound/usb.h>
 
-#include "usbaudio.h"
 #include "card.h"
 #include "proc.h"
 #include "quirks.h"
diff --git a/sound/usb/usx2y/us122l.c b/sound/usb/usx2y/us122l.c
index 6bcf8b859ebb..3d00541a602c 100644
--- a/sound/usb/usx2y/us122l.c
+++ b/sound/usb/usx2y/us122l.c
@@ -11,9 +11,9 @@
 #include <sound/hwdep.h>
 #include <sound/pcm.h>
 #include <sound/initval.h>
+#include <sound/usb.h>
 #define MODNAME "US122L"
 #include "usb_stream.c"
-#include "../usbaudio.h"
 #include "../midi.h"
 #include "us122l.h"
 
diff --git a/sound/usb/usx2y/usX2Yhwdep.c b/sound/usb/usx2y/usX2Yhwdep.c
index 9fd6a86cc08e..2d6a9c80e5bf 100644
--- a/sound/usb/usx2y/usX2Yhwdep.c
+++ b/sound/usb/usx2y/usX2Yhwdep.c
@@ -14,6 +14,7 @@
 #include <sound/memalloc.h>
 #include <sound/pcm.h>
 #include <sound/hwdep.h>
+#include <sound/usb.h>
 #include "usx2y.h"
 #include "usbusx2y.h"
 #include "usX2Yhwdep.h"
diff --git a/sound/usb/usx2y/usbusx2y.h b/sound/usb/usx2y/usbusx2y.h
index 391fd7b4ed5e..689b565fb225 100644
--- a/sound/usb/usx2y/usbusx2y.h
+++ b/sound/usb/usx2y/usbusx2y.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifndef USBUSX2Y_H
 #define USBUSX2Y_H
-#include "../usbaudio.h"
+#include <sound/usb.h>
 #include "../midi.h"
 #include "usbus428ctldefs.h"
 
diff --git a/sound/usb/validate.c b/sound/usb/validate.c
index 6fe206f6e911..8a7e8fc8197e 100644
--- a/sound/usb/validate.c
+++ b/sound/usb/validate.c
@@ -9,7 +9,7 @@
 #include <linux/usb/audio-v2.h>
 #include <linux/usb/audio-v3.h>
 #include <linux/usb/midi.h>
-#include "usbaudio.h"
+#include <sound/usb.h>
 #include "helper.h"
 
 struct usb_desc_validator {
-- 
2.25.1

