Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BC03AFCF2;
	Tue, 28 Jul 2026 11:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785237208; cv=none; b=gWawGzv3G6W/rXC98y/ormpSCG9J17HVJFhllQhyHzELzeLD1TP+XYmj/xSmt5KDuGuVXOMu9e2JRNFB2NsEVDFEk9fWBTtTlm6G3JUbz4bg72RMaOIxU/qK7YfCs5/Llzovw7kfvk8KZ4hq+2jfRoAbr0HGgUH/8sY2dHVy1EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785237208; c=relaxed/simple;
	bh=lxOUkPO0fq5kxVLwj3IV8lysqT8tedERYiUjZuxCadQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=kaBKwj7i6XkRS7/6U/FA4PEjZ0KJ57qCGiuWJ8CiXQFsmeFLCXECYdcccR3f0b5NGkQfV8xnqkq8z9tNaevimkPR/NwKfcs1HYD4ebcsQsPGoXA1QQi5Xj+wJi1akppkrXv/dtym8m5y/IGq/PKCitllmhi98WDLid/Krq071bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 54ad23388a7511f1aa26b74ffac11d73-20260728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:65e48d34-2607-43f8-88e2-e17efd427165,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:4b42a763543144a1a4041ec5f099e43c,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 54ad23388a7511f1aa26b74ffac11d73-20260728
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1939808054; Tue, 28 Jul 2026 19:13:16 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com,
	kees@kernel.org,
	chengordon326@gmail.com,
	jussi@sonarnerd.net,
	hulianqin@vivo.com,
	i@rong.moe,
	g@b4.vu,
	cryolitia@uniontech.com,
	pav@iki.fi
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH v3] ALSA: usb-audio: Fix boot-time audio stuttering for USB Audio device
Date: Tue, 28 Jul 2026 19:13:09 +0800
Message-Id: <20260728111309.1271834-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This USB Audio device (0x1e0b:0xd01e) exhibits audio stuttering
during boot when playing audio. Once the system is fully booted,
playback is normal.

The device reports its isochronous endpoints with the Asynchronous
sync type (bmAttributes = 0x03), which causes the driver to
calculate nurbs = min(max_urbs, ...) = 3, providing only ~16ms
of buffering. During boot, the higher system scheduling jitter
(e.g., from init scripts, device enumeration, and driver probing)
can exceed this buffer depth, causing audible stuttering.

This patch adds a device-specific quirk (QUIRK_FLAG_PLAYBACK_URB_FIXUP)
that applies two changes for this device:
1. Forces nurbs to MAX_URBS (12), providing sufficient buffering
2. Sets URB_ISO_ASAP flag for more consistent xHCI scheduling

Both changes are required together for stable boot-time playback:
- The larger buffer absorbs scheduling jitter during boot
- URB_ISO_ASAP ensures consistent URB submission timing, preventing
  the xHCI scheduler from introducing variable delays

Test methodology:
- Without patch: reboot and play audio → stuttering audible in all
  tests (reproduced consistently across multiple attempts)
- With nurbs=8 only: occasional minor stuttering observed after
  multiple tests (insufficient buffer depth)
- With full patch (nurbs=12 + URB_ISO_ASAP): reboot and play audio
  → no stuttering observed (tested in 10+ reboot cycles without
  reproducing the issue)

Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/usb/endpoint.c | 7 ++++++-
 sound/usb/quirks.c   | 3 +++
 sound/usb/usbaudio.h | 8 ++++++++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 24cd7692bd01..54aeac7d087b 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1232,7 +1232,10 @@ static int data_ep_set_params(struct snd_usb_endpoint *ep)
 		/* try to use enough URBs to contain an entire ALSA buffer */
 		max_urbs = min((unsigned) MAX_URBS,
 				MAX_QUEUE * packs_per_ms / urb_packs);
-		ep->nurbs = min(max_urbs, urbs_per_period * ep->cur_buffer_periods);
+		if (chip->quirk_flags & QUIRK_FLAG_PLAYBACK_URB_FIXUP)
+			ep->nurbs = MAX_URBS;
+		else
+			ep->nurbs = min(max_urbs, urbs_per_period * ep->cur_buffer_periods);
 	}
 
 	/* allocate and initialize data urbs */
@@ -1256,6 +1259,8 @@ static int data_ep_set_params(struct snd_usb_endpoint *ep)
 			goto out_of_memory;
 		u->urb->pipe = ep->pipe;
 		u->urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP;
+		if (chip->quirk_flags & QUIRK_FLAG_PLAYBACK_URB_FIXUP)
+			u->urb->transfer_flags |= URB_ISO_ASAP;
 		u->urb->interval = 1 << ep->datainterval;
 		u->urb->context = u;
 		u->urb->complete = snd_complete_urb;
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 40aa40fccb46..2b4e665564d2 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2422,6 +2422,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
 	DEVICE_FLG(0x1bcf, 0x2283, /* NexiGo N930AF FHD Webcam */
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
+	DEVICE_FLG(0x1e0b, 0xd01e, /* Generic USB Audio Device */
+		   QUIRK_FLAG_PLAYBACK_URB_FIXUP),
 	DEVICE_FLG(0x1ff7, 0x0f81, /* SC13A Webcam */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x2040, 0x7200, /* Hauppauge HVR-950Q */
@@ -2631,6 +2633,7 @@ static const char *const snd_usb_audio_quirk_flag_names[] = {
 	QUIRK_STRING_ENTRY(MIXER_CAPTURE_LINEAR_VOL),
 	QUIRK_STRING_ENTRY(IFB_SILENCE_ON_EMPTY),
 	QUIRK_STRING_ENTRY(MIXER_GET_CUR_BROKEN),
+	QUIRK_STRING_ENTRY(PLAYBACK_URB_FIXUP),
 	NULL
 };
 
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index e26f9092417e..dc1d0c8c9c80 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -254,6 +254,12 @@ extern bool snd_usb_skip_validation;
  *  check being non-fatal and only disabling GET_CUR instead of the whole mixer.
  *  The current volume will then be provided by the internal cache that stores
  *  the last set volume
+ * QUIRK_FLAG_PLAYBACK_URB_FIXUP
+ *  Set URB_ISO_ASAP flag for isochronous URBs and force nurbs to MAX_URBS.
+ *  This is needed for devices that exhibit boot-time audio stuttering due
+ *  to insufficient buffer depth combined with xHCI scheduling variability.
+ *  The larger buffer (MAX_URBS = 12, ~64ms) absorbs system scheduling
+ *  jitter during boot, while URB_ISO_ASAP ensures consistent xHCI scheduling.
  */
 
 enum {
@@ -288,6 +294,7 @@ enum {
 	QUIRK_TYPE_MIXER_CAPTURE_LINEAR_VOL	= 28,
 	QUIRK_TYPE_IFB_SILENCE_ON_EMPTY		= 29,
 	QUIRK_TYPE_MIXER_GET_CUR_BROKEN		= 30,
+	QUIRK_TYPE_PLAYBACK_URB_FIXUP		= 31,
 /* Please also edit snd_usb_audio_quirk_flag_names */
 };
 
@@ -324,5 +331,6 @@ enum {
 #define QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL	QUIRK_FLAG(MIXER_CAPTURE_LINEAR_VOL)
 #define QUIRK_FLAG_IFB_SILENCE_ON_EMPTY		QUIRK_FLAG(IFB_SILENCE_ON_EMPTY)
 #define QUIRK_FLAG_MIXER_GET_CUR_BROKEN		QUIRK_FLAG(MIXER_GET_CUR_BROKEN)
+#define QUIRK_FLAG_PLAYBACK_URB_FIXUP		QUIRK_FLAG(PLAYBACK_URB_FIXUP)
 
 #endif /* __USBAUDIO_H */
-- 
2.25.1

