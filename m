Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D538C25DAFB
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 10:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195870; cv=none; b=DmWhEz0vca/aKSfgzX3I/lYHDQHmc8xq6rnOJZ7oa7ZyrMlnYfULzR3P/ilsg914van9WfAXjlRqp5U0Ha1anxE0DQT2V0wKx6P8QCrZFF1BmDd/A2cjvyr4b9SziQGYnG1byjD21jbhSRUhFGzn7gAZcZB21DyuG+aETR4Ret4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195870; c=relaxed/simple;
	bh=Aar8iCZEtXLBuKdUvVNF4NhEj8Ra64yf6DSThIwfkHw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BfQ2OokMBx/hVr5u7IjRspYwa9ZWGmH4D3szBN0iW4nK3bonnOl7OgiKWxd0wwja0O9/+lZMGDWt/ePwsOVZBOxLgeYGCOd6dPci4tMssB41Y4X3owD8HOGswBFtL34l1gGwNczpFXtsP9ABDjpf0atuJFy2Z6t4UaTPQbFWI4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MB8s0Ae7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MB8s0Ae7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744195869; x=1775731869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Aar8iCZEtXLBuKdUvVNF4NhEj8Ra64yf6DSThIwfkHw=;
  b=MB8s0Ae7r5t8axkrmaixMp1fuNi/z2NsVEDLgtcP9OhO0Rx1F1CoAW8/
   xCyHJkOKPrza/azSTdNlcgnujTQMQIdJI+ztWGFE5U9ao+KRJychWTYjX
   DcrF/8q/4pX9tXPmw4BsKKGAK9qpTlq58i2f3dAtvq5rWwvhv0DGLBbDS
   +8GI5Yghcg3hTPAvAhIkj3/Zmq7DBY+T7iM3ks7loWIpo9lPJefZ+wAE2
   7/M9RtjrUcLE6DujS/ghbBXTglXs+D/NFajaaTY16iydu/E9rrz0DTTNC
   GrfPDeICmsZwEBo7s5RaDF/RK9CBumg4eL6PAj0EUl8B7/HMvV/H46luz
   A==;
X-CSE-ConnectionGUID: 6MIPeCk8RCqAWD1oasaV8A==
X-CSE-MsgGUID: NJ659pSgRJCXOimD1GzWCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45380058"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45380058"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 03:51:08 -0700
X-CSE-ConnectionGUID: ZS4pZXDnTNaJ0mI163ivhA==
X-CSE-MsgGUID: MqM3yASwQ9qY3iwFlffsXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="133426210"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 03:51:06 -0700
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
Subject: [RFC 05/15] ALSA: usb: Implement two-stage stream creation mechanism
Date: Wed,  9 Apr 2025 13:07:20 +0200
Message-Id: <20250409110731.3752332-6-cezary.rojewski@intel.com>
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

The USB Audio-Class (AC) device driver on ASoC side needs to know the
number of available PCM streams when creating list of DAI and DAI Links
before these objects are actually probed. To achieve that split existing
USB stream enumeration procedure from one-stage to two-stage process:

1) parse the descriptors and obtain information about PCMs but do not
   create them yet
2) create all PCMs based on the previously obtained information and
   follow that up with MIDIs, mixers and Media resources

On the streaming side, this translates to replacing existing functions
that do:
	create_all()
with new ones that:
	parse_pcms()
	create_nonpcms()

As number of changes is large, the process is not part of a single
patch. The switch is done in follow ups.

The implementation does try to align with existing equivalent as closely
as possible - no quirks and magic if-statements are skipped. Any kind of
cleanup in that area is outside of the scope of this change.

Existing snd_usb_create_stream() is represented by:
	snd_usb_streaming_iface()
	snd_usb_create_claim_pcm()
	snd_usb_create_claim_midi()

Part of existing usb_audio_probe(), responsible for stream creation is
represented by:
	snd_usb_parse_pcms()
	snd_usb_create_nonpcms()

Existing __snd_usb_add_audio_stream() is represented by:
	snd_usb_parse_pcms()
	snd_usb_pcm_add()
	snd_usb_add_pcms()

As ASoC is responsible for calling snd_pcm_new(), the component driver
has to bind the PCMs to USB streams manually. Helper snd_usb_bind_pcm()
addresses that need.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/usb.h |   5 ++
 sound/usb/card.c    | 168 ++++++++++++++++++++++++++++++++++++++++++++
 sound/usb/stream.c  | 145 ++++++++++++++++++++++++++++++++++++++
 sound/usb/stream.h  |   1 +
 4 files changed, 319 insertions(+)

diff --git a/include/sound/usb.h b/include/sound/usb.h
index 7e7a86b5c9c4..c50fc61f357c 100644
--- a/include/sound/usb.h
+++ b/include/sound/usb.h
@@ -8,6 +8,9 @@
  *   Copyright (c) 2002 by Takashi Iwai <tiwai@suse.de>
  */
 
+#include <linux/list.h>
+#include <sound/pcm.h>
+
 /* handling of USB vendor/product ID pairs as 32-bit numbers */
 #define USB_ID(vendor, product) (((unsigned int)(vendor) << 16) | (product))
 #define USB_ID_VENDOR(id) ((id) >> 16)
@@ -87,6 +90,8 @@ struct snd_usb_audio {
 	struct snd_intf_to_ctrl intf_to_ctrl[MAX_CARD_INTERFACES];
 };
 
+int snd_usb_bind_pcm(struct list_head *stream_entry, struct snd_pcm *pcm);
+
 #define USB_AUDIO_IFACE_UNUSED	((void *)-1L)
 
 #define usb_audio_err(chip, fmt, args...) \
diff --git a/sound/usb/card.c b/sound/usb/card.c
index d8794adb7a88..4121ad03acd1 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -217,6 +217,110 @@ static int snd_usb_create_stream(struct snd_usb_audio *chip, int ctrlif, int int
 	return 0;
 }
 
+__maybe_unused
+static struct usb_interface *snd_usb_streaming_iface(struct snd_usb_audio *chip, int ctrlif,
+						     int interface, u8 subclass)
+{
+	struct usb_interface_descriptor *altsd;
+	struct usb_device *udev = chip->dev;
+	struct usb_host_interface *alts;
+	struct usb_interface *iface;
+
+	iface = usb_ifnum_to_if(udev, interface);
+	if (!iface) {
+		dev_err(&udev->dev, "%u:%d : does not exist\n", ctrlif, interface);
+		return ERR_PTR(-EINVAL);
+	}
+
+	alts = &iface->altsetting[0];
+	altsd = get_iface_desc(alts);
+
+	/*
+	 * Android with both accessory and audio interfaces enabled gets the
+	 * interface numbers wrong.
+	 */
+	if ((chip->usb_id == USB_ID(0x18d1, 0x2d04) ||
+	     chip->usb_id == USB_ID(0x18d1, 0x2d05)) &&
+	    interface == 0 &&
+	    altsd->bInterfaceClass == USB_CLASS_VENDOR_SPEC &&
+	    altsd->bInterfaceSubClass == USB_SUBCLASS_VENDOR_SPEC) {
+		interface = 2;
+		iface = usb_ifnum_to_if(udev, interface);
+		if (!iface)
+			return ERR_PTR(-EINVAL);
+
+		alts = &iface->altsetting[0];
+		altsd = get_iface_desc(alts);
+	}
+
+	if (usb_interface_claimed(iface)) {
+		dev_dbg(&udev->dev, "%d:%d: skipping, already claimed\n", ctrlif, interface);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if ((altsd->bInterfaceClass != USB_CLASS_AUDIO &&
+	     altsd->bInterfaceClass != USB_CLASS_VENDOR_SPEC) ||
+	    (altsd->bInterfaceSubClass != USB_SUBCLASS_AUDIOSTREAMING &&
+	     altsd->bInterfaceSubClass != USB_SUBCLASS_MIDISTREAMING)) {
+		dev_dbg(&udev->dev, "%u:%d: skipping non-supported interface %d\n",
+			ctrlif, interface, altsd->bInterfaceClass);
+		/* skip non-supported classes */
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (altsd->bInterfaceSubClass == subclass)
+		return iface;
+	return NULL;
+}
+
+__maybe_unused
+static int snd_usb_parse_claim_pcm(struct snd_usb_audio *chip, int ctrlif,
+				   struct usb_interface *iface,
+				   struct usb_driver *iface_driver)
+{
+	struct usb_device *udev = chip->dev;
+	struct usb_host_interface *alt;
+	int ifnum;
+
+	alt = &iface->altsetting[0];
+	ifnum = alt->desc.bInterfaceNumber;
+
+	if (snd_usb_get_speed(udev) == USB_SPEED_LOW) {
+		dev_err(&udev->dev, "low speed audio streaming not supported\n");
+		return -EINVAL;
+	}
+
+	snd_usb_add_ctrl_interface_link(chip, ifnum, ctrlif);
+
+	if (!snd_usb_parse_audio_interface(chip, ifnum)) {
+		usb_set_interface(udev, ifnum, 0); /* reset the current interface */
+		return usb_driver_claim_interface(iface_driver, iface, USB_AUDIO_IFACE_UNUSED);
+	}
+
+	return 0;
+}
+
+__maybe_unused
+static int snd_usb_create_claim_midi(struct snd_usb_audio *chip, int ctrlif,
+				     struct usb_interface *iface,
+				     struct usb_driver *iface_driver)
+{
+	struct usb_device *udev = chip->dev;
+	struct usb_host_interface *alt;
+	int ifnum, ret;
+
+	alt = &iface->altsetting[0];
+	ifnum = alt->desc.bInterfaceNumber;
+
+	ret = snd_usb_midi_v2_create(chip, iface, NULL, chip->usb_id);
+	if (ret < 0) {
+		dev_err(&udev->dev, "%u:%d: cannot create sequencer device\n", ctrlif, ifnum);
+		return -EINVAL;
+	}
+
+	return usb_driver_claim_interface(iface_driver, iface, USB_AUDIO_IFACE_UNUSED);
+}
+
 /*
  * parse audio control descriptor and create pcm/midi streams
  */
@@ -737,6 +841,70 @@ get_alias_quirk(struct usb_device *dev, unsigned int id)
 	return NULL;
 }
 
+__maybe_unused
+static int snd_usb_parse_pcms(struct snd_usb_audio *chip, struct usb_interface *iface,
+			      struct usb_driver *driver)
+{
+	const struct snd_usb_audio_quirk *quirk = chip->quirk;
+	struct usb_host_interface *alt;
+	int ifnum, ret;
+
+	alt = &iface->altsetting[0];
+	ifnum = alt->desc.bInterfaceNumber;
+
+	/* Check for custom parsing behavior, favor it over the generic one. */
+	if (quirk && quirk->ifnum != QUIRK_NO_INTERFACE) {
+		ret = snd_usb_parse_pcms_quirk(chip, iface, driver, quirk);
+
+		/* Were custom pcm interfaces parsed? */
+		if (ret == 1)
+			return 0;
+		if (ret)
+			return ret;
+	}
+
+	/* Parse pcm interfaces in generic fashion. */
+	ret = snd_usb_create_streams(chip, ifnum);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+__maybe_unused
+static int snd_usb_create_nonpcms(struct snd_usb_audio *chip, struct usb_interface *iface,
+				  struct usb_driver *driver)
+{
+	const struct snd_usb_audio_quirk *quirk = chip->quirk;
+	struct usb_host_interface *alt;
+	int ifnum, ret;
+
+	alt = &iface->altsetting[0];
+	ifnum = alt->desc.bInterfaceNumber;
+
+	/* Check for custom create behavior, favor it over the generic one. */
+	if (quirk && quirk->ifnum != QUIRK_NO_INTERFACE) {
+		ret = snd_usb_create_quirk(chip, iface, driver, quirk);
+
+		/* Were custom midi/mixer interfaces created? */
+		if (ret == 1)
+			return 0;
+		if (ret)
+			return ret;
+	}
+
+	/* Create midi/mixer interfaces in generic fashion. */
+	ret = snd_usb_create_streams(chip, ifnum);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_usb_create_mixer(chip, ifnum);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static void snd_usb_chip_free(struct snd_usb_audio *chip)
 {
 	snd_usb_free_pcms(chip);
diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index 6beeff03d711..1cf59e6d8ce6 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -556,6 +556,151 @@ static int __snd_usb_add_audio_stream(struct snd_usb_audio *chip,
 	return add_chmap(pcm, stream, &as->substream[stream]);
 }
 
+/* Parse and build ->pcm_list but do not create PCMs yet. */
+__maybe_unused
+static int snd_usb_parse_pcm(struct snd_usb_audio *chip, int stream, struct audioformat *fp,
+			     struct snd_usb_power_domain *pd)
+{
+	struct snd_usb_substream *subs;
+	struct snd_usb_stream *as;
+
+	/* Is there anything to do? */
+	list_for_each_entry(as, &chip->pcm_list, list) {
+		if (as->fmt_type != fp->fmt_type)
+			continue;
+		subs = &as->substream[stream];
+		if (subs->ep_num == fp->endpoint) {
+			list_add_tail(&fp->list, &subs->fmt_list);
+			subs->num_formats++;
+			subs->formats |= fp->formats;
+			return 0;
+		}
+	}
+
+	if (chip->card && chip->card->registered)
+		chip->need_delayed_register = true;
+
+	/*
+	 * Check for empty substreams (holes in the list) to minimize
+	 * the number of new snd_pcms created.
+	 */
+	list_for_each_entry(as, &chip->pcm_list, list) {
+		if (as->fmt_type != fp->fmt_type)
+			continue;
+		subs = &as->substream[stream];
+		if (!subs->num_formats) {
+			snd_usb_init_substream(as, stream, fp, pd);
+			return 0;
+		}
+	}
+
+	/* Otherwise create a new stream. */
+	as = kzalloc(sizeof(*as), GFP_KERNEL);
+	if (!as)
+		return -ENOMEM;
+
+	as->pcm_index = chip->pcm_devs;
+	as->chip = chip;
+	as->fmt_type = fp->fmt_type;
+	chip->pcm_devs++;
+	snd_usb_init_substream(as, stream, fp, pd);
+
+	/*
+	 * Keep using head insertion for M-Audio Audiophile USB (tm) which has a
+	 * fix to swap capture stream order in conf/cards/USB-audio.conf
+	 */
+	if (chip->usb_id == USB_ID(0x0763, 0x2003))
+		list_add(&as->list, &chip->pcm_list);
+	else
+		list_add_tail(&as->list, &chip->pcm_list);
+	return 0;
+}
+
+static int snd_usb_pcm_add(struct snd_usb_audio *chip, struct snd_usb_stream *as)
+{
+	struct snd_pcm *pcm;
+	unsigned int stream;
+	int ret;
+
+	ret = snd_pcm_new(chip->card, "USB Audio", as->pcm_index,
+			  as->substream[SNDRV_PCM_STREAM_PLAYBACK].ep_num ? 1 : 0,
+			  as->substream[SNDRV_PCM_STREAM_CAPTURE].ep_num ? 1 : 0,
+			  &pcm);
+	if (ret < 0)
+		return ret;
+
+	as->pcm = pcm;
+	/* ->private_data taken for 'rtd' on ASoC side. */
+	pcm->private_data = as;
+	pcm->info_flags = 0;
+
+	if (as->pcm_index)
+		sprintf(pcm->name, "USB Audio #%d", as->pcm_index);
+	else
+		strscpy(pcm->name, "USB Audio", sizeof(pcm->name));
+
+	snd_usb_proc_pcm_format_add(as);
+
+	for_each_pcm_streams(stream) {
+		if (as->substream[stream].num_formats) {
+			snd_usb_set_pcm_ops(pcm, stream);
+			snd_usb_preallocate_buffer(&as->substream[stream]);
+
+			ret = add_chmap(pcm, stream, &as->substream[stream]);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * snd_usb_bind_pcm - Bind USB stream with a PCM object.
+ *
+ * @stream_entry: USB stream, one of chip->pcm_list.
+ * @pcm: the PCM given USB stream shall be attached to.
+ *
+ * Note: Designed for ASoC users where snd_pcm_new() and pcm->private_data
+ * is owned by the framework.
+ */
+int snd_usb_bind_pcm(struct list_head *stream_entry, struct snd_pcm *pcm)
+{
+	struct snd_usb_stream *as;
+	unsigned int dir;
+	int ret;
+
+	as = list_entry(stream_entry, struct snd_usb_stream, list);
+	as->pcm = pcm;
+
+	snd_usb_proc_pcm_format_add(as);
+
+	for_each_pcm_streams(dir) {
+		if (as->substream[dir].num_formats) {
+			/* Buffer preallocation and PCM ops controlled by ASoC component. */
+			ret = add_chmap(pcm, dir, &as->substream[dir]);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_usb_bind_pcm);
+
+int snd_usb_add_pcms(struct snd_usb_audio *chip)
+{
+	struct snd_usb_stream *as;
+	int ret;
+
+	list_for_each_entry(as, &chip->pcm_list, list) {
+		ret = snd_usb_pcm_add(chip, as);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
 int snd_usb_add_audio_stream(struct snd_usb_audio *chip,
 			     int stream,
 			     struct audioformat *fp)
diff --git a/sound/usb/stream.h b/sound/usb/stream.h
index f70693502281..98cff9922cf1 100644
--- a/sound/usb/stream.h
+++ b/sound/usb/stream.h
@@ -9,6 +9,7 @@ int snd_usb_add_audio_stream(struct snd_usb_audio *chip,
 			     int stream,
 			     struct audioformat *fp);
 void snd_usb_free_pcms(struct snd_usb_audio *chip);
+int snd_usb_add_pcms(struct snd_usb_audio *chip);
 
 #endif /* __USBAUDIO_STREAM_H */
 
-- 
2.25.1

