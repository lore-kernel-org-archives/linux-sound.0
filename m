Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A3425DAE3
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 10:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195886; cv=none; b=NRTjNjECoDtjapg1s0/2ONAbPSmivAaBy9uYqgP/ziMDRAJPhGFZJzMN2Thz4a/ajRFECPo8aZ6Rz4t/jG0fbsQwb1/skfuynwcDV4JEF0+aLdo644+DAgZ9EHgRWdi8cIx7ZOU4uxKGM519pyRanHAKulUjGmV1nhi7GyIBfCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195886; c=relaxed/simple;
	bh=zCc1I/rsU18c5TSxaIaapvgK+iNm2ZW99PbX2aByn6k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XimIsyJl3UpLZeAsp/K9RBg0JhdL9AEiY+wLUZd0v0X8BcGf7JghHZEutocQXppLUZKdNaLRrDUvXfigXQFl9KWAmOJC95BuW98apkRHSDLw07gByqwmlXAK/xcmLgbXYJzFvEE4xJpLASWv+qZNv+1PfGJZmGW/brz9QAIn7q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UStQwVx/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UStQwVx/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744195884; x=1775731884;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zCc1I/rsU18c5TSxaIaapvgK+iNm2ZW99PbX2aByn6k=;
  b=UStQwVx/d7YkM8I9TxQ03YkcfprYGdJU4EUwZXFmmSeXdy9EA1BR8Ret
   ToS0jIvR/FSbyb+/HcUVT3g7TuWi2/zkol6sQhtIzQBywq20B+XmEjHdj
   N2cehPeQYXrPwX7KJLMcjSb0kHFX3Z2mYmPH/VGuXDRc033TjNpTMgLya
   EPyYD4A9gcNdPlKQNs6h106uWx/EIk2Q6Qe8G/YpOcsP+32u+K/NJnF6V
   ZRBxZLKHZ6Mf8pdt/9Tr38TrtpOwv8VQcOa+mu7ZyWx3lkpBY7yp6PVjm
   2I+gMj+Fjt1A8U0B5dIwNzxOROHxtoocdmqYDr9qAs/ziedQodN2YzQ/8
   A==;
X-CSE-ConnectionGUID: d/iEP9zWTaCLrDRWokBfkA==
X-CSE-MsgGUID: 3PkzllXVR4WKRsgoTGaB2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45380107"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45380107"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 03:51:24 -0700
X-CSE-ConnectionGUID: YG/ZEH1CRLWeu1920aSLkQ==
X-CSE-MsgGUID: HIt+Fuv0QGG+SdipEavfPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="133426248"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 03:51:22 -0700
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
Subject: [RFC 11/15] ALSA: usb: Export usb_interface driver operations
Date: Wed,  9 Apr 2025 13:07:26 +0200
Message-Id: <20250409110731.3752332-12-cezary.rojewski@intel.com>
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

Existing usb_driver operations can be reused by component-drivers on the
ASoC side.

ASoC embraces modular approach and it is entirely acceptable for
component to be unbound while the USB device is still plugged in. In
such case, PCM list built when scanning USB interfaces can be kept
intact to avoid scanning the device a second time when the component is
probed again. Add snd_usb_release_resources() to cover that scenario.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/usb.h |  8 +++++
 sound/usb/card.c    | 88 +++++++++++++++++++++++++++++++++++++++------
 2 files changed, 85 insertions(+), 11 deletions(-)

diff --git a/include/sound/usb.h b/include/sound/usb.h
index daba868fb6e0..fbcfa2b985f7 100644
--- a/include/sound/usb.h
+++ b/include/sound/usb.h
@@ -90,11 +90,19 @@ struct snd_usb_audio {
 	struct snd_intf_to_ctrl intf_to_ctrl[MAX_CARD_INTERFACES];
 };
 
+void snd_usb_release_resources(struct snd_usb_audio *chip);
 int snd_usb_bind_card(struct snd_usb_audio *chip, struct snd_card *card,
 		      struct usb_driver *driver);
 int snd_usb_bind_pcm(struct list_head *stream_entry, struct snd_pcm *pcm);
 void snd_usb_pcm_hw_init(struct list_head *stream_entry, int dir, struct snd_pcm_hardware *hw);
 
+/* USB interface operations, see struct usb_driver. */
+int snd_usb_probe(struct usb_interface *iface, const struct usb_device_id *usb_id,
+		  struct usb_driver *driver);
+void snd_usb_disconnect(struct usb_interface *iface);
+int snd_usb_suspend(struct usb_interface *intf, pm_message_t message);
+int snd_usb_resume(struct usb_interface *intf);
+
 /* PCM operations, see struct snd_pcm_ops. */
 int snd_usb_pcm_open(struct snd_pcm_substream *substream);
 int snd_usb_pcm_close(struct snd_pcm_substream *substream);
diff --git a/sound/usb/card.c b/sound/usb/card.c
index 354bf76988ab..a4bd8ba6a26c 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -773,7 +773,8 @@ static void snd_usb_chip_free(struct snd_usb_audio *chip)
 }
 
 /* Must be called under register_mutex due to usb_chip[] manipulation. */
-static void snd_usb_chip_release(struct snd_usb_audio *chip, struct usb_interface *iface)
+static void snd_usb_chip_release(struct snd_usb_audio *chip, struct usb_interface *iface,
+				 bool free_card)
 {
 	chip->num_interfaces--;
 	chip->intf[chip->num_interfaces] = NULL;
@@ -781,7 +782,7 @@ static void snd_usb_chip_release(struct snd_usb_audio *chip, struct usb_interfac
 
 	if (!chip->num_interfaces) {
 		usb_chip[chip->index] = NULL;
-		if (chip->card)
+		if (free_card && chip->card)
 			snd_card_free(chip->card);
 		snd_usb_chip_free(chip);
 	}
@@ -1018,10 +1019,18 @@ static int snd_usb_probe_unlocked(struct usb_interface *iface, const struct usb_
 		goto err;
 	return 0;
 err:
-	snd_usb_chip_release(chip, iface);
+	snd_usb_chip_release(chip, iface, false);
 	return ret;
 }
 
+int snd_usb_probe(struct usb_interface *iface, const struct usb_device_id *usb_id,
+		  struct usb_driver *driver)
+{
+	guard(mutex)(&register_mutex);
+	return snd_usb_probe_unlocked(iface, usb_id, driver);
+}
+EXPORT_SYMBOL_GPL(snd_usb_probe);
+
 int snd_usb_bind_card(struct snd_usb_audio *chip, struct snd_card *card,
 		      struct usb_driver *driver)
 {
@@ -1140,15 +1149,59 @@ static int usb_audio_probe(struct usb_interface *iface, const struct usb_device_
 
 err_no_register:
 	atomic_dec(&chip->active);
-	snd_usb_chip_release(chip, iface);
+	snd_usb_chip_release(chip, iface, true);
 	return ret;
 }
 
+/**
+ * snd_usb_release_resources - Release resources occupied by USB AC device
+ *
+ * @chip: Driver context for the USB AC device
+ *
+ * Note: PCMs and endpoints created when scanning USB interface descriptors
+ * are not freed here.  That information is static and can be used to re-create
+ * PCMs without the need to scan the interfaces again.
+ *
+ * Compared to usb_disconnect(), this does free midi2.0 resources.
+ */
+void snd_usb_release_resources(struct snd_usb_audio *chip)
+{
+	struct usb_mixer_interface *mixer;
+	struct list_head *midi_entry;
+	struct snd_usb_endpoint *ep;
+	struct snd_usb_stream *as;
+
+	/* release the pcm resources */
+	list_for_each_entry(as, &chip->pcm_list, list)
+		snd_usb_stream_disconnect(as);
+
+	/* release the endpoint resources */
+	list_for_each_entry(ep, &chip->ep_list, list)
+		snd_usb_endpoint_release(ep);
+
+	/* release the midi resources */
+	list_for_each(midi_entry, &chip->midi_list)
+		snd_usbmidi_disconnect(midi_entry);
+
+	snd_usb_midi_v2_disconnect_all(chip);
+	snd_usb_midi_v2_free_all(chip);
+	/*
+	 * snd_media_device_delete() accesses mixer_list, do it
+	 * before releasing mixers.
+	 */
+	snd_media_device_delete(chip);
+
+	/* release mixer resources */
+	list_for_each_entry(mixer, &chip->mixer_list, list)
+		snd_usb_mixer_disconnect(mixer);
+}
+EXPORT_SYMBOL_GPL(snd_usb_release_resources);
+
 /*
  * we need to take care of counter, since disconnection can be called also
  * many times as well as usb_audio_probe().
  */
-static void usb_audio_disconnect(struct usb_interface *intf)
+static void usb_disconnect(struct usb_interface *intf, bool free_card)
 {
 	struct snd_usb_audio *chip = usb_get_intfdata(intf);
 	struct snd_card *card;
@@ -1196,10 +1249,21 @@ static void usb_audio_disconnect(struct usb_interface *intf)
 	if (chip->quirk_flags & QUIRK_FLAG_DISABLE_AUTOSUSPEND)
 		usb_enable_autosuspend(interface_to_usbdev(intf));
 
-	snd_usb_chip_release(chip, intf);
+	snd_usb_chip_release(chip, intf, free_card);
 	mutex_unlock(&register_mutex);
 }
 
+static void usb_audio_disconnect(struct usb_interface *iface)
+{
+	usb_disconnect(iface, true);
+}
+
+void snd_usb_disconnect(struct usb_interface *iface)
+{
+	usb_disconnect(iface, false);
+}
+EXPORT_SYMBOL_GPL(snd_usb_disconnect);
+
 /* lock the shutdown (disconnect) task and autoresume */
 int snd_usb_lock_shutdown(struct snd_usb_audio *chip)
 {
@@ -1264,7 +1328,7 @@ void snd_usb_autosuspend(struct snd_usb_audio *chip)
 		usb_autopm_put_interface(chip->intf[i]);
 }
 
-static int usb_audio_suspend(struct usb_interface *intf, pm_message_t message)
+int snd_usb_suspend(struct usb_interface *intf, pm_message_t message)
 {
 	struct snd_usb_audio *chip = usb_get_intfdata(intf);
 	struct snd_usb_stream *as;
@@ -1294,8 +1358,9 @@ static int usb_audio_suspend(struct usb_interface *intf, pm_message_t message)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(snd_usb_suspend);
 
-static int usb_audio_resume(struct usb_interface *intf)
+int snd_usb_resume(struct usb_interface *intf)
 {
 	struct snd_usb_audio *chip = usb_get_intfdata(intf);
 	struct snd_usb_stream *as;
@@ -1343,6 +1408,7 @@ static int usb_audio_resume(struct usb_interface *intf)
 	atomic_dec(&chip->active); /* allow autopm after this point */
 	return err;
 }
+EXPORT_SYMBOL_GPL(snd_usb_resume);
 
 static const struct usb_device_id usb_audio_ids [] = {
 #include "quirks-table.h"
@@ -1361,9 +1427,9 @@ static struct usb_driver usb_audio_driver = {
 	.name =		"snd-usb-audio",
 	.probe =	usb_audio_probe,
 	.disconnect =	usb_audio_disconnect,
-	.suspend =	usb_audio_suspend,
-	.resume =	usb_audio_resume,
-	.reset_resume =	usb_audio_resume,
+	.suspend =	snd_usb_suspend,
+	.resume =	snd_usb_resume,
+	.reset_resume =	snd_usb_resume,
 	.id_table =	usb_audio_ids,
 	.supports_autosuspend = 1,
 };
-- 
2.25.1

