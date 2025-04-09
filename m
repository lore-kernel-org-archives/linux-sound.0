Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C2225DAF8
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 10:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195873; cv=none; b=mE3TC1bTwezwhUHL4UPHIrt2atpVg+xJDQ1CNfPUEY7nML8nqnktxdHBTWRw7lxMzJkHf2IQJkr/ODC2kvYCgJ4IFU0BN3aFFCNX/fa8P0AbNhNlVB8STPlzlxAgKjqUfKn0ZouBG1nBW20aevDjp+B11qGC4LnLRjK4RZuf88k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195873; c=relaxed/simple;
	bh=2h+mbAr2po2eTpLJlihR/AbRMGHhU+8myptAZ6qwy5U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GmWwQKh814jdZOxYtHwE2kL5jy9/8jbPlKUL6n27A4+GWFHNRsEF+P8QRDPERdBy8lXvgItWW8ltGKuvro+KBFBSgQqY5CSLxMB2OND+WCZ41MtTZ1UyMwV+kXnph/RCYKmVhqScppEUzDETVQbmIgviIu1Go0tsxDIQJ9gguNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bfK8MCtL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bfK8MCtL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744195871; x=1775731871;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2h+mbAr2po2eTpLJlihR/AbRMGHhU+8myptAZ6qwy5U=;
  b=bfK8MCtLcNjtmaG0/UDUxeiexAZ7lJY2GLswDfLCNuMGMLPyMYLzpegQ
   XV3JaGIQ74fm7bgI/ix3+U8FtTuyyYe3LY/z5x1X6YB5UD2mlHuBK0iaA
   lVPNc8MSEAsKZxmjCwIbpRxvyTqd86iao9pxuY4KzHd51KyErcwTH+a0J
   sEdGE0KeMNoTPWXN0/qdiquJOKUETx9Nl5O8as7E3ac+R1uhNqiUUugW8
   gEwth37C5XiYnz6QD5QXcgLsBMVwjfsuiCHdt6PcC3NyhhkLwLYYjlk+5
   eRLV/mJyoTBtTPXeIBv9Kd77oU278SssBnECU4QIbRn+vU+u9qNohPCeK
   w==;
X-CSE-ConnectionGUID: msP7T8XGQPCwXsjMMmPnRA==
X-CSE-MsgGUID: 5lpcc4PETNqMAZKjIx8r/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45380065"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45380065"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 03:51:11 -0700
X-CSE-ConnectionGUID: I8S1BIFFS6eUjLMz7NDUlQ==
X-CSE-MsgGUID: tvNkM+odTq6+4mNnc1SCQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="133426216"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 03:51:09 -0700
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
Subject: [RFC 06/15] ALSA: usb: Implement two-stage chip probing mechanism
Date: Wed,  9 Apr 2025 13:07:21 +0200
Message-Id: <20250409110731.3752332-7-cezary.rojewski@intel.com>
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

As number of changes is large, the process is not part of a single
patch. The switch is done in follow ups.

Existing usb_audio_probe() is a non-atomic function that performs a
large number of operations. These can be represented with:

	snd_usb_request_chip()
		snd_usb_find_chip()
		snd_usb_alloc_slot()
		snd_usb_new_chip()
		snd_usb_chip_init()
	snd_usb_chip_release()
	snd_usb_sanity_check()
	snd_usb_create_card()

All the steps done before stream creation are performed in first-stage
probing function - snd_usb_probe_unlocked(). As ASoC is responsible for
calling snd_card_new(), the component driver has to bind the card to USB
device manually. Helper snd_usb_bind_card() addresses that need.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/linux/usb.h     |  15 +++
 include/linux/usb/ch9.h |  11 ++
 include/sound/usb.h     |   2 +
 sound/usb/card.c        | 289 +++++++++++++++++++++++++++++++++++++++-
 4 files changed, 316 insertions(+), 1 deletion(-)

diff --git a/include/linux/usb.h b/include/linux/usb.h
index cfa8005e24f9..8e2f9eb93823 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -749,6 +749,21 @@ static inline const struct usb_device *__intf_to_usbdev_const(const struct usb_i
 		 const struct usb_interface *: __intf_to_usbdev_const,	\
 		 struct usb_interface *: __intf_to_usbdev)(intf)
 
+static inline u16 usb_device_vid(struct usb_device *udev)
+{
+	return le16_to_cpu(udev->descriptor.idVendor);
+}
+
+static inline u16 usb_device_pid(struct usb_device *udev)
+{
+	return le16_to_cpu(udev->descriptor.idProduct);
+}
+
+static inline u32 usb_device_vpid(struct usb_device *udev)
+{
+	return ((u32)usb_device_vid(udev) << 16) | usb_device_pid(udev);
+}
+
 extern struct usb_device *usb_get_dev(struct usb_device *dev);
 extern void usb_put_dev(struct usb_device *dev);
 extern struct usb_device *usb_hub_find_child(struct usb_device *hdev,
diff --git a/include/linux/usb/ch9.h b/include/linux/usb/ch9.h
index c93b410b314a..e0f4d9bbc8fa 100644
--- a/include/linux/usb/ch9.h
+++ b/include/linux/usb/ch9.h
@@ -57,4 +57,15 @@ extern const char *usb_decode_ctrl(char *str, size_t size, __u8 bRequestType,
 				   __u16 wLength);
 #endif
 
+/**
+ * usb_epaddr_num - extract endpoint's number from its address
+ * @epaddr: bEndpointAddress of the USB endpoint
+ *
+ * Returns endpoint number: 0 to 15.
+ */
+static inline int usb_epaddr_num(unsigned char epaddr)
+{
+	return epaddr & USB_ENDPOINT_NUMBER_MASK;
+}
+
 #endif /* __LINUX_USB_CH9_H */
diff --git a/include/sound/usb.h b/include/sound/usb.h
index c50fc61f357c..f30a8a96c49e 100644
--- a/include/sound/usb.h
+++ b/include/sound/usb.h
@@ -90,6 +90,8 @@ struct snd_usb_audio {
 	struct snd_intf_to_ctrl intf_to_ctrl[MAX_CARD_INTERFACES];
 };
 
+int snd_usb_bind_card(struct snd_usb_audio *chip, struct snd_card *card,
+		      struct usb_driver *driver);
 int snd_usb_bind_pcm(struct list_head *stream_entry, struct snd_pcm *pcm);
 
 #define USB_AUDIO_IFACE_UNUSED	((void *)-1L)
diff --git a/sound/usb/card.c b/sound/usb/card.c
index 4121ad03acd1..a9e37fe0d29e 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -841,7 +841,6 @@ get_alias_quirk(struct usb_device *dev, unsigned int id)
 	return NULL;
 }
 
-__maybe_unused
 static int snd_usb_parse_pcms(struct snd_usb_audio *chip, struct usb_interface *iface,
 			      struct usb_driver *driver)
 {
@@ -918,6 +917,294 @@ static void snd_usb_chip_free(struct snd_usb_audio *chip)
 	kfree(chip);
 }
 
+/* Must be called under register_mutex due to usb_chip[] manipulation. */
+static void snd_usb_chip_release(struct snd_usb_audio *chip, struct usb_interface *iface)
+{
+	chip->num_interfaces--;
+	chip->intf[chip->num_interfaces] = NULL;
+	usb_set_intfdata(iface, NULL);
+
+	if (!chip->num_interfaces) {
+		usb_chip[chip->index] = NULL;
+		if (chip->card)
+			snd_card_free(chip->card);
+		snd_usb_chip_free(chip);
+	}
+}
+
+/*
+ * Search usb_chip[] for a chip instance matching the specified @udev.
+ * If found, increase chip->active before returning to block autosuspend.
+ */
+static struct snd_usb_audio *snd_usb_find_chip(struct usb_device *udev)
+{
+	struct snd_usb_audio *chip;
+	int i;
+
+	for (i = 0; i < SNDRV_CARDS; i++) {
+		chip = usb_chip[i];
+
+		if (!chip || chip->dev != udev)
+			continue;
+		if (atomic_read(&chip->shutdown)) {
+			dev_err(&udev->dev, "USB device is in the shutdown state, cannot create a card instance\n");
+			return ERR_PTR(-EIO);
+		}
+
+		/* Avoid autosuspend during probe. */
+		atomic_inc(&chip->active);
+		return chip;
+	}
+
+	return NULL;
+}
+
+static int snd_usb_alloc_slot(struct usb_device *udev)
+{
+	u16 product = usb_device_pid(udev);
+	u16 vendor = usb_device_vid(udev);
+	int i;
+
+	for (i = 0; i < SNDRV_CARDS; i++) {
+		if (usb_chip[i])
+			continue;
+		if ((vid[i] == -1 || vid[i] == vendor) &&
+		    (pid[i] == -1 || pid[i] == product)) {
+			if (enable[i])
+				return i;
+			if (vid[i] == vendor || pid[i] == product) {
+				dev_info(&udev->dev, "device (%04x:%04x) is disabled\n",
+					 vendor, product);
+				return -ENOENT;
+			}
+		}
+	}
+
+	return -EBUSY;
+}
+
+static void snd_usb_chip_init(struct snd_usb_audio *chip, struct usb_interface *iface, int idx,
+			      const struct snd_usb_audio_quirk *quirk, u32 id)
+{
+	struct usb_device *udev = interface_to_usbdev(iface);
+
+	chip->index = idx;
+	chip->dev = udev;
+	chip->setup = device_setup[idx];
+	chip->generic_implicit_fb = implicit_fb[idx];
+	chip->autoclock = autoclock;
+	chip->lowlatency = lowlatency;
+	chip->usb_id = id;
+	mutex_init(&chip->mutex);
+	init_waitqueue_head(&chip->shutdown_wait);
+
+	/* Avoid autosuspend during probe. */
+	atomic_set(&chip->active, 1);
+	atomic_set(&chip->usage_count, 0);
+	atomic_set(&chip->shutdown, 0);
+	INIT_LIST_HEAD(&chip->pcm_list);
+	INIT_LIST_HEAD(&chip->ep_list);
+	INIT_LIST_HEAD(&chip->iface_ref_list);
+	INIT_LIST_HEAD(&chip->clock_ref_list);
+	INIT_LIST_HEAD(&chip->midi_list);
+	INIT_LIST_HEAD(&chip->midi_v2_list);
+	INIT_LIST_HEAD(&chip->mixer_list);
+
+	/* Assign quirk-related information. */
+	chip->quirk = quirk;
+	if (quirk)
+		chip->quirk_type = quirk->type;
+	if (quirk_flags[idx])
+		chip->quirk_flags = quirk_flags[idx];
+	else
+		snd_usb_init_quirk_flags(chip);
+	if (ignore_ctl_error)
+		chip->quirk_flags |= QUIRK_FLAG_IGNORE_CTL_ERROR;
+
+	find_last_interface(chip);
+}
+
+/* Leaves chip->active at 1. */
+static struct snd_usb_audio *snd_usb_new_chip(struct usb_interface *iface, int idx,
+					      const struct snd_usb_audio_quirk *quirk, u32 id)
+{
+	struct snd_usb_audio *chip;
+
+	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return NULL;
+
+	snd_usb_chip_init(chip, iface, idx, quirk, id);
+	return chip;
+}
+
+/*
+ * Must be called under register_mutex due to usb_chip[] manipulation.
+ *
+ * Regardless if existing chip is found or new one is created, chip->active
+ * is updated to avoid autosuspend.
+ */
+static struct snd_usb_audio *snd_usb_request_chip(struct usb_interface *iface,
+						  const struct snd_usb_audio_quirk *quirk, u32 id)
+{
+	struct usb_device *udev = interface_to_usbdev(iface);
+	struct snd_usb_audio *chip;
+	int slot, ret;
+
+	chip = snd_usb_find_chip(udev);
+	if (IS_ERR(chip))
+		return chip;
+
+	/* If not registered yet, create new chip. */
+	if (!chip) {
+		ret = snd_usb_apply_boot_quirk_once(udev, iface, quirk, id);
+		if (ret < 0)
+			return ERR_PTR(ret);
+
+		slot = snd_usb_alloc_slot(udev);
+		if (slot < 0) {
+			dev_err(&udev->dev, "no available usb audio device\n");
+			return ERR_PTR(slot);
+		}
+
+		chip = snd_usb_new_chip(iface, slot, quirk, id);
+		if (!chip)
+			return ERR_PTR(-ENOMEM);
+
+		usb_chip[slot] = chip;
+		dev_set_drvdata(&udev->dev, chip);
+	} else if (chip->num_interfaces >= MAX_CARD_INTERFACES) {
+		dev_info(&udev->dev, "Too many interfaces assigned to the single USB-audio card\n");
+
+		atomic_dec(&chip->active);
+		return ERR_PTR(-EINVAL);
+	}
+
+	chip->intf[chip->num_interfaces] = iface;
+	chip->num_interfaces++;
+	usb_set_intfdata(iface, chip);
+
+	return chip;
+}
+
+static int snd_usb_sanity_check(struct usb_interface *iface,
+				const struct snd_usb_audio_quirk *quirk)
+{
+	struct usb_host_interface *alts;
+	struct usb_device *udev;
+	int ifnum;
+
+	udev = interface_to_usbdev(iface);
+	alts = &iface->altsetting[0];
+	ifnum = get_iface_desc(alts)->bInterfaceNumber;
+
+	if (quirk && quirk->ifnum >= 0 && ifnum != quirk->ifnum)
+		return -ENXIO;
+	if (quirk && quirk->ifnum == QUIRK_NODEV_INTERFACE)
+		return -ENODEV;
+
+	switch (snd_usb_get_speed(udev)) {
+	case USB_SPEED_LOW:
+	case USB_SPEED_FULL:
+	case USB_SPEED_HIGH:
+	case USB_SPEED_SUPER:
+	case USB_SPEED_SUPER_PLUS:
+		break;
+	default:
+		dev_err(&udev->dev, "unknown device speed %d\n", snd_usb_get_speed(udev));
+		return -ENXIO;
+	}
+
+	return 0;
+}
+
+__maybe_unused
+static int snd_usb_probe_unlocked(struct usb_interface *iface, const struct usb_device_id *usb_id,
+				  struct usb_driver *driver)
+{
+	const struct snd_usb_audio_quirk *quirk;
+	struct usb_host_interface *alts;
+	struct snd_usb_audio *chip;
+	struct usb_device *udev;
+	int ret;
+	u32 id;
+
+	quirk = (const struct snd_usb_audio_quirk *)usb_id->driver_info;
+	alts = &iface->altsetting[0];
+	udev = interface_to_usbdev(iface);
+	id = usb_device_vpid(udev);
+	if (get_alias_id(udev, &id))
+		quirk = get_alias_quirk(udev, id);
+
+	ret = snd_usb_sanity_check(iface, quirk);
+	if (ret)
+		return ret;
+
+	ret = snd_usb_apply_boot_quirk(udev, iface, quirk, id);
+	if (ret < 0)
+		return ret;
+
+	chip = snd_usb_request_chip(iface, quirk, id);
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+
+	if (chip->quirk_flags & QUIRK_FLAG_DISABLE_AUTOSUSPEND)
+		usb_disable_autosuspend(interface_to_usbdev(iface));
+
+	/*
+	 * For devices with more than one control interface, we assume the
+	 * first contains the audio controls. We might need a more specific
+	 * check here in the future.
+	 */
+	if (!chip->ctrl_intf)
+		chip->ctrl_intf = alts;
+
+	ret = snd_usb_parse_pcms(chip, iface, driver);
+	if (ret)
+		goto err;
+	return 0;
+err:
+	snd_usb_chip_release(chip, iface);
+	return ret;
+}
+
+int snd_usb_bind_card(struct snd_usb_audio *chip, struct snd_card *card,
+		      struct usb_driver *driver)
+{
+	chip->card = card;
+	snd_usb_audio_create_proc(chip);
+
+	atomic_sub(chip->num_interfaces, &chip->active);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_usb_bind_card);
+
+__maybe_unused
+static int snd_usb_create_card(struct snd_usb_audio *chip, struct usb_interface *iface)
+{
+	struct usb_device *udev = chip->dev;
+	struct snd_card *card;
+	int idx = chip->index;
+	char component[14];
+	int ret;
+
+	ret = snd_card_new(&iface->dev, index[idx], id[idx], THIS_MODULE, 0, &card);
+	if (ret) {
+		dev_err(&udev->dev, "cannot create card instance %d\n", idx);
+		return ret;
+	}
+
+	chip->card = card;
+	strscpy(card->driver, "USB-Audio", sizeof(card->driver));
+	usb_audio_make_shortname(udev, chip, chip->quirk);
+	usb_audio_make_longname(udev, chip, chip->quirk);
+	sprintf(component, "USB%04x:%04x", usb_device_vid(udev), usb_device_pid(udev));
+	snd_component_add(card, component);
+	snd_usb_audio_create_proc(chip);
+
+	return 0;
+}
+
 /* register card if we reach to the last interface or to the specified
  * one given via option
  */
-- 
2.25.1

