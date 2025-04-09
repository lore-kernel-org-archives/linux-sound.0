Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01ED25DB0F
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 10:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195878; cv=none; b=hrj8Scfs1og71FqKR60zVBW33MLFqPW55rBzmX4V7SKOJ+713YqzLyctOC9Sl4l9rQR9mVXkfAPDoD0tnqtX3Ugybd4fpVjf+5e/1wWVpVJ8uivxSifUbO6oZj5Sg2OWlvDN7H+HYnkkswkTKE8sx6jtOrW3Z0rGGO16sr3crbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195878; c=relaxed/simple;
	bh=W2wZjTHSGDkn6hahtiKEQLpFMYjPEQsk1hEJklz/eHU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YTLQNHi+P2CwzlczY3Vl+60xQHxapWVGoClQO/k3MLp8kmw6JkE+7yS2Fh9os+pqGtb6RhWf/Z/Ri2KHA7JBNiCR6qkJprBGr1fEXaO+AqPvTxonnrelWrlEUYWu8pw8W/8bY7YeYBqoAwFymtddo9HzQdXr1R7MvycWthZ/0tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aloMUvqc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aloMUvqc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744195877; x=1775731877;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W2wZjTHSGDkn6hahtiKEQLpFMYjPEQsk1hEJklz/eHU=;
  b=aloMUvqcDavECHehHFgNhzuILZ1enXv2otfi7togJHDO16tMK3eLDF9e
   qK5bFn/sq4AHpyyPDrc0et4MZZ6mkg41sjhVsp5E9QWtuwIxCJaUDHhl8
   peYjANZqB5ZIk0LFJbd0eS9SR2YvJyPYtjfqMpwKc0Y1tCZ4aCkK6GHD4
   9QECQRHU4w4K5ARCMbBTU4cRiOLQp/95fleTaH64R+avePtBDjQ/U7Pqz
   oryFEGSjL64QpXaH4L7056C3+qiTvO7Kj0EMU/cjYj9icbLWE4yaQIUke
   qSROzDGHkC6Gp8KhDEqCdtVG0ZY6yUInsBR3ZFJm6TYXj6r07kopcyvnY
   A==;
X-CSE-ConnectionGUID: JfKx3oswRNi5ZBL5a1G0gg==
X-CSE-MsgGUID: yXTqC/7YRr+AzLrO3oA3Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45380081"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45380081"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 03:51:17 -0700
X-CSE-ConnectionGUID: NdX5UzbrTfKTFNIiEuXBmA==
X-CSE-MsgGUID: Whkw/dzaSJmS5vxmXZrUAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="133426231"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 03:51:14 -0700
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
Subject: [RFC 08/15] ALSA: usb: Switch to the two-stage stream creation
Date: Wed,  9 Apr 2025 13:07:23 +0200
Message-Id: <20250409110731.3752332-9-cezary.rojewski@intel.com>
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

Utilize newly added functions and update existing stream craetion
procedure for USB Audio-Class (AC) device from one-stage into
two-stage process. In consequence, snd_usb_create_stream() and
__snd_usb_add_audio_stream().

To complete the process, update snd_usb_create_streams() so that it
performs correct operation: parse pcms -or- create non-pcms based on
the SubClass value of the USB interface.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/usb/card.c   | 119 ++++++++++-----------------------------------
 sound/usb/stream.c |  97 +-----------------------------------
 2 files changed, 29 insertions(+), 187 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 4af69a69b5ce..354bf76988ab 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -138,87 +138,6 @@ static void snd_usb_stream_disconnect(struct snd_usb_stream *as)
 	}
 }
 
-static int snd_usb_create_stream(struct snd_usb_audio *chip, int ctrlif, int interface)
-{
-	struct usb_device *dev = chip->dev;
-	struct usb_host_interface *alts;
-	struct usb_interface_descriptor *altsd;
-	struct usb_interface *iface = usb_ifnum_to_if(dev, interface);
-
-	if (!iface) {
-		dev_err(&dev->dev, "%u:%d : does not exist\n",
-			ctrlif, interface);
-		return -EINVAL;
-	}
-
-	alts = &iface->altsetting[0];
-	altsd = get_iface_desc(alts);
-
-	/*
-	 * Android with both accessory and audio interfaces enabled gets the
-	 * interface numbers wrong.
-	 */
-	if ((chip->usb_id == USB_ID(0x18d1, 0x2d04) ||
-	     chip->usb_id == USB_ID(0x18d1, 0x2d05)) &&
-	    interface == 0 &&
-	    altsd->bInterfaceClass == USB_CLASS_VENDOR_SPEC &&
-	    altsd->bInterfaceSubClass == USB_SUBCLASS_VENDOR_SPEC) {
-		interface = 2;
-		iface = usb_ifnum_to_if(dev, interface);
-		if (!iface)
-			return -EINVAL;
-		alts = &iface->altsetting[0];
-		altsd = get_iface_desc(alts);
-	}
-
-	if (usb_interface_claimed(iface)) {
-		dev_dbg(&dev->dev, "%d:%d: skipping, already claimed\n",
-			ctrlif, interface);
-		return -EINVAL;
-	}
-
-	if ((altsd->bInterfaceClass == USB_CLASS_AUDIO ||
-	     altsd->bInterfaceClass == USB_CLASS_VENDOR_SPEC) &&
-	    altsd->bInterfaceSubClass == USB_SUBCLASS_MIDISTREAMING) {
-		int err = snd_usb_midi_v2_create(chip, iface, NULL,
-						 chip->usb_id);
-		if (err < 0) {
-			dev_err(&dev->dev,
-				"%u:%d: cannot create sequencer device\n",
-				ctrlif, interface);
-			return -EINVAL;
-		}
-		return usb_driver_claim_interface(&usb_audio_driver, iface,
-						  USB_AUDIO_IFACE_UNUSED);
-	}
-
-	if ((altsd->bInterfaceClass != USB_CLASS_AUDIO &&
-	     altsd->bInterfaceClass != USB_CLASS_VENDOR_SPEC) ||
-	    altsd->bInterfaceSubClass != USB_SUBCLASS_AUDIOSTREAMING) {
-		dev_dbg(&dev->dev,
-			"%u:%d: skipping non-supported interface %d\n",
-			ctrlif, interface, altsd->bInterfaceClass);
-		/* skip non-supported classes */
-		return -EINVAL;
-	}
-
-	if (snd_usb_get_speed(dev) == USB_SPEED_LOW) {
-		dev_err(&dev->dev, "low speed audio streaming not supported\n");
-		return -EINVAL;
-	}
-
-	snd_usb_add_ctrl_interface_link(chip, interface, ctrlif);
-
-	if (! snd_usb_parse_audio_interface(chip, interface)) {
-		usb_set_interface(dev, interface, 0); /* reset the current interface */
-		return usb_driver_claim_interface(&usb_audio_driver, iface,
-						  USB_AUDIO_IFACE_UNUSED);
-	}
-
-	return 0;
-}
-
-__maybe_unused
 static struct usb_interface *snd_usb_streaming_iface(struct snd_usb_audio *chip, int ctrlif,
 						     int interface, u8 subclass)
 {
@@ -274,7 +193,6 @@ static struct usb_interface *snd_usb_streaming_iface(struct snd_usb_audio *chip,
 	return NULL;
 }
 
-__maybe_unused
 static int snd_usb_parse_claim_pcm(struct snd_usb_audio *chip, int ctrlif,
 				   struct usb_interface *iface,
 				   struct usb_driver *iface_driver)
@@ -301,7 +219,6 @@ static int snd_usb_parse_claim_pcm(struct snd_usb_audio *chip, int ctrlif,
 	return 0;
 }
 
-__maybe_unused
 static int snd_usb_create_claim_midi(struct snd_usb_audio *chip, int ctrlif,
 				     struct usb_interface *iface,
 				     struct usb_driver *iface_driver)
@@ -325,18 +242,30 @@ static int snd_usb_create_claim_midi(struct snd_usb_audio *chip, int ctrlif,
 /*
  * parse audio control descriptor and create pcm/midi streams
  */
-static int snd_usb_create_streams(struct snd_usb_audio *chip, int ctrlif)
+static int snd_usb_create_streams(struct snd_usb_audio *chip, int ctrlif,
+				  struct usb_driver *iface_driver, u8 subclass)
 {
+	int (*create_stream)(struct snd_usb_audio *, int,
+			     struct usb_interface *, struct usb_driver *);
 	struct usb_device *dev = chip->dev;
 	struct usb_host_interface *host_iface;
 	struct usb_interface_descriptor *altsd;
+	struct usb_interface *iface;
 	int i, protocol;
+	int ifnum;
 
 	/* find audiocontrol interface */
 	host_iface = &usb_ifnum_to_if(dev, ctrlif)->altsetting[0];
 	altsd = get_iface_desc(host_iface);
 	protocol = altsd->bInterfaceProtocol;
 
+	if (subclass == USB_SUBCLASS_AUDIOSTREAMING)
+		create_stream = snd_usb_parse_claim_pcm;
+	else if (subclass == USB_SUBCLASS_MIDISTREAMING)
+		create_stream = snd_usb_create_claim_midi;
+	else
+		return -EINVAL;
+
 	switch (protocol) {
 	default:
 		dev_warn(&dev->dev,
@@ -385,8 +314,12 @@ static int snd_usb_create_streams(struct snd_usb_audio *chip, int ctrlif)
 			return -EINVAL;
 		}
 
-		for (i = 0; i < h1->bInCollection; i++)
-			snd_usb_create_stream(chip, ctrlif, h1->baInterfaceNr[i]);
+		for (i = 0; i < h1->bInCollection; i++) {
+			ifnum = h1->baInterfaceNr[i];
+			iface = snd_usb_streaming_iface(chip, ctrlif, ifnum, subclass);
+			if (!IS_ERR_OR_NULL(iface))
+				create_stream(chip, ctrlif, iface, iface_driver);
+		}
 
 		break;
 	}
@@ -431,10 +364,12 @@ static int snd_usb_create_streams(struct snd_usb_audio *chip, int ctrlif)
 		}
 
 		for (i = 0; i < assoc->bInterfaceCount; i++) {
-			int intf = assoc->bFirstInterface + i;
-
-			if (intf != ctrlif)
-				snd_usb_create_stream(chip, ctrlif, intf);
+			ifnum = assoc->bFirstInterface + i;
+			if (ifnum == ctrlif)
+				continue;
+			iface = snd_usb_streaming_iface(chip, ctrlif, ifnum, subclass);
+			if (!IS_ERR_OR_NULL(iface))
+				create_stream(chip, ctrlif, iface, iface_driver);
 		}
 
 		break;
@@ -784,7 +719,7 @@ static int snd_usb_parse_pcms(struct snd_usb_audio *chip, struct usb_interface *
 	}
 
 	/* Parse pcm interfaces in generic fashion. */
-	ret = snd_usb_create_streams(chip, ifnum);
+	ret = snd_usb_create_streams(chip, ifnum, driver, USB_SUBCLASS_AUDIOSTREAMING);
 	if (ret < 0)
 		return ret;
 
@@ -813,7 +748,7 @@ static int snd_usb_create_nonpcms(struct snd_usb_audio *chip, struct usb_interfa
 	}
 
 	/* Create midi/mixer interfaces in generic fashion. */
-	ret = snd_usb_create_streams(chip, ifnum);
+	ret = snd_usb_create_streams(chip, ifnum, driver, USB_SUBCLASS_MIDISTREAMING);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index 1cf59e6d8ce6..601dc9ed020a 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -94,8 +94,6 @@ static void snd_usb_init_substream(struct snd_usb_stream *as,
 	subs->pkt_offset_adj = 0;
 	subs->stream_offset_adj = 0;
 
-	snd_usb_set_pcm_ops(as->pcm, stream);
-
 	list_add_tail(&fp->list, &subs->fmt_list);
 	subs->formats |= fp->formats;
 	subs->num_formats++;
@@ -110,8 +108,6 @@ static void snd_usb_init_substream(struct snd_usb_stream *as,
 		snd_usb_power_domain_set(subs->stream->chip, pd,
 					 UAC3_PD_STATE_D1);
 	}
-
-	snd_usb_preallocate_buffer(subs);
 }
 
 /* kctl callbacks for usb-audio channel maps */
@@ -468,96 +464,7 @@ snd_pcm_chmap_elem *convert_chmap_v3(struct uac3_cluster_header_descriptor
 	return chmap;
 }
 
-/*
- * add this endpoint to the chip instance.
- * if a stream with the same endpoint already exists, append to it.
- * if not, create a new pcm stream. note, fp is added to the substream
- * fmt_list and will be freed on the chip instance release. do not free
- * fp or do remove it from the substream fmt_list to avoid double-free.
- */
-static int __snd_usb_add_audio_stream(struct snd_usb_audio *chip,
-				      int stream,
-				      struct audioformat *fp,
-				      struct snd_usb_power_domain *pd)
-
-{
-	struct snd_usb_stream *as;
-	struct snd_usb_substream *subs;
-	struct snd_pcm *pcm;
-	int err;
-
-	list_for_each_entry(as, &chip->pcm_list, list) {
-		if (as->fmt_type != fp->fmt_type)
-			continue;
-		subs = &as->substream[stream];
-		if (subs->ep_num == fp->endpoint) {
-			list_add_tail(&fp->list, &subs->fmt_list);
-			subs->num_formats++;
-			subs->formats |= fp->formats;
-			return 0;
-		}
-	}
-
-	if (chip->card->registered)
-		chip->need_delayed_register = true;
-
-	/* look for an empty stream */
-	list_for_each_entry(as, &chip->pcm_list, list) {
-		if (as->fmt_type != fp->fmt_type)
-			continue;
-		subs = &as->substream[stream];
-		if (subs->ep_num)
-			continue;
-		err = snd_pcm_new_stream(as->pcm, stream, 1);
-		if (err < 0)
-			return err;
-		snd_usb_init_substream(as, stream, fp, pd);
-		return add_chmap(as->pcm, stream, subs);
-	}
-
-	/* create a new pcm */
-	as = kzalloc(sizeof(*as), GFP_KERNEL);
-	if (!as)
-		return -ENOMEM;
-	as->pcm_index = chip->pcm_devs;
-	as->chip = chip;
-	as->fmt_type = fp->fmt_type;
-	err = snd_pcm_new(chip->card, "USB Audio", chip->pcm_devs,
-			  stream == SNDRV_PCM_STREAM_PLAYBACK ? 1 : 0,
-			  stream == SNDRV_PCM_STREAM_PLAYBACK ? 0 : 1,
-			  &pcm);
-	if (err < 0) {
-		kfree(as);
-		return err;
-	}
-	as->pcm = pcm;
-	pcm->private_data = as;
-	pcm->info_flags = 0;
-	if (chip->pcm_devs > 0)
-		sprintf(pcm->name, "USB Audio #%d", chip->pcm_devs);
-	else
-		strcpy(pcm->name, "USB Audio");
-
-	snd_usb_init_substream(as, stream, fp, pd);
-
-	/*
-	 * Keep using head insertion for M-Audio Audiophile USB (tm) which has a
-	 * fix to swap capture stream order in conf/cards/USB-audio.conf
-	 */
-	if (chip->usb_id == USB_ID(0x0763, 0x2003))
-		list_add(&as->list, &chip->pcm_list);
-	else
-		list_add_tail(&as->list, &chip->pcm_list);
-
-	chip->pcm_devs++;
-
-	snd_usb_proc_pcm_format_add(as);
-
-	return add_chmap(pcm, stream, &as->substream[stream]);
-}
-
 /* Parse and build ->pcm_list but do not create PCMs yet. */
-__maybe_unused
 static int snd_usb_parse_pcm(struct snd_usb_audio *chip, int stream, struct audioformat *fp,
 			     struct snd_usb_power_domain *pd)
 {
@@ -705,7 +612,7 @@ int snd_usb_add_audio_stream(struct snd_usb_audio *chip,
 			     int stream,
 			     struct audioformat *fp)
 {
-	return __snd_usb_add_audio_stream(chip, stream, fp, NULL);
+	return snd_usb_parse_pcm(chip, stream, fp, NULL);
 }
 
 static int snd_usb_add_audio_stream_v3(struct snd_usb_audio *chip,
@@ -713,7 +620,7 @@ static int snd_usb_add_audio_stream_v3(struct snd_usb_audio *chip,
 				       struct audioformat *fp,
 				       struct snd_usb_power_domain *pd)
 {
-	return __snd_usb_add_audio_stream(chip, stream, fp, pd);
+	return snd_usb_parse_pcm(chip, stream, fp, pd);
 }
 
 static int parse_uac_endpoint_attributes(struct snd_usb_audio *chip,
-- 
2.25.1

