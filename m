Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD3025DB10
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 10:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195875; cv=none; b=neD1wgE1lEUi4/IraVVQvwsD7lncUTxQWk7AwtqWMLKZ8ZXOp762mAFcDFST32Kr15K3f58gKKAhl9BCq6ezMaceD21Og/9sAkciNsbs+IuaKUgphbhsSK3fNsFu225wAyXB0UbkCpGiAP2G+3Uql0Y+marRi3cV14qs5Bw66HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195875; c=relaxed/simple;
	bh=mQlPnCSJSEKphVGT8JzCUXd35BzymHfEWVg8bShwmj0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C1TZuGweTnwK6JH2UcFTMOZPWNEaNYzm5glgHNePMfKjU+hB3oCgjqhpJ7Vyvg7m9HCBe9HtTLyEBfBnyiD09JIGphK2QbxGNMwItzWpmSqaF0+iUT8TJeS6HFrqJlRdYj5UaGzEu4OFCO/iqV8yuTsUnZ8H+Lhy4GrQNRr5t88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LoT5JhHF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LoT5JhHF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744195874; x=1775731874;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mQlPnCSJSEKphVGT8JzCUXd35BzymHfEWVg8bShwmj0=;
  b=LoT5JhHFQ1Y7JOUSE60C7QRbgJcLkpmafXE80KHfzZuHwO5nr4s1Vj+B
   QIuLMOr230PGbT4RmeWIdA445ym/JdR8HSR13IjX8f4ZaLGheD0bs5tL5
   Boa4aooeidMF8AsxoshzvFmJddkaj4dQhpwxlc8om2SiAudRWYXGgSXbf
   623PZaHLO2pecTCBOz9WiaXgcZJ78jymZ3ZO9mlBy2r63Gae3RnCSptp9
   TjvQ/WUZ6egq9jrO4Z0jUoYEfB3V/D3NCAHP763LguAFsQCrcdzAIZWXB
   t9cUUMO2aQpByDTMfBbfvU4Y+klg8BuQ/BZ/RtjIu2xx2fhz2EpQg3tj5
   Q==;
X-CSE-ConnectionGUID: kTqjklgMQHq2CLQ+TINVdA==
X-CSE-MsgGUID: YzUsbn8xRMGFn45/6s2a9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45380073"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45380073"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 03:51:14 -0700
X-CSE-ConnectionGUID: 2BIqQ2NPTkCbOe/EyhKgJA==
X-CSE-MsgGUID: VAHrH5UsR9SW9OOtpXcfbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="133426222"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 03:51:11 -0700
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
Subject: [RFC 07/15] ALSA: usb: Switch to the two-stage chip probing
Date: Wed,  9 Apr 2025 13:07:22 +0200
Message-Id: <20250409110731.3752332-8-cezary.rojewski@intel.com>
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

Utilize newly added functions and update existing probing procedure of
USB Audio-Class (AC) device from one-stage into two-stage process. In
consequence, drop snd_usb_audio_create() and rewrite usb_audio_probe()
to first do snd_usb_probe_unlocked() which is intended to be shared by
both ALSA and ASoC driver before continuing with creating all the
streams.

While at it, do not forget about snd_audio_disconnect(). Use
snd_usb_chip_release() to keep both probe() and disconnect()
synchronized.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/usb/card.c | 281 ++++++++---------------------------------------
 1 file changed, 45 insertions(+), 236 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index a9e37fe0d29e..4af69a69b5ce 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -21,6 +21,7 @@
 
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/init.h>
 #include <linux/list.h>
 #include <linux/slab.h>
@@ -687,86 +688,6 @@ static void usb_audio_make_longname(struct usb_device *dev,
 	}
 }
 
-/*
- * create a chip instance and set its names.
- */
-static int snd_usb_audio_create(struct usb_interface *intf,
-				struct usb_device *dev, int idx,
-				const struct snd_usb_audio_quirk *quirk,
-				unsigned int usb_id,
-				struct snd_usb_audio **rchip)
-{
-	struct snd_card *card;
-	struct snd_usb_audio *chip;
-	int err;
-	char component[14];
-
-	*rchip = NULL;
-
-	switch (snd_usb_get_speed(dev)) {
-	case USB_SPEED_LOW:
-	case USB_SPEED_FULL:
-	case USB_SPEED_HIGH:
-	case USB_SPEED_SUPER:
-	case USB_SPEED_SUPER_PLUS:
-		break;
-	default:
-		dev_err(&dev->dev, "unknown device speed %d\n", snd_usb_get_speed(dev));
-		return -ENXIO;
-	}
-
-	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
-	if (!chip)
-		return -ENOMEM;
-
-	err = snd_card_new(&intf->dev, index[idx], id[idx], THIS_MODULE, 0, &card);
-	if (err < 0) {
-		dev_err(&dev->dev, "cannot create card instance %d\n", idx);
-		kfree(chip);
-		return err;
-	}
-
-	mutex_init(&chip->mutex);
-	init_waitqueue_head(&chip->shutdown_wait);
-	chip->index = idx;
-	chip->dev = dev;
-	chip->card = card;
-	chip->setup = device_setup[idx];
-	chip->generic_implicit_fb = implicit_fb[idx];
-	chip->autoclock = autoclock;
-	chip->lowlatency = lowlatency;
-	atomic_set(&chip->active, 1); /* avoid autopm during probing */
-	atomic_set(&chip->usage_count, 0);
-	atomic_set(&chip->shutdown, 0);
-
-	chip->usb_id = usb_id;
-	INIT_LIST_HEAD(&chip->pcm_list);
-	INIT_LIST_HEAD(&chip->ep_list);
-	INIT_LIST_HEAD(&chip->iface_ref_list);
-	INIT_LIST_HEAD(&chip->clock_ref_list);
-	INIT_LIST_HEAD(&chip->midi_list);
-	INIT_LIST_HEAD(&chip->midi_v2_list);
-	INIT_LIST_HEAD(&chip->mixer_list);
-
-	if (quirk_flags[idx])
-		chip->quirk_flags = quirk_flags[idx];
-	else
-		snd_usb_init_quirk_flags(chip);
-
-	strcpy(card->driver, "USB-Audio");
-	sprintf(component, "USB%04x:%04x",
-		USB_ID_VENDOR(chip->usb_id), USB_ID_PRODUCT(chip->usb_id));
-	snd_component_add(card, component);
-
-	usb_audio_make_shortname(dev, chip, quirk);
-	usb_audio_make_longname(dev, chip, quirk);
-
-	snd_usb_audio_create_proc(chip);
-
-	*rchip = chip;
-	return 0;
-}
-
 /* look for a matching quirk alias id */
 static bool get_alias_id(struct usb_device *dev, unsigned int *id)
 {
@@ -870,7 +791,6 @@ static int snd_usb_parse_pcms(struct snd_usb_audio *chip, struct usb_interface *
 	return 0;
 }
 
-__maybe_unused
 static int snd_usb_create_nonpcms(struct snd_usb_audio *chip, struct usb_interface *iface,
 				  struct usb_driver *driver)
 {
@@ -1118,7 +1038,6 @@ static int snd_usb_sanity_check(struct usb_interface *iface,
 	return 0;
 }
 
-__maybe_unused
 static int snd_usb_probe_unlocked(struct usb_interface *iface, const struct usb_device_id *usb_id,
 				  struct usb_driver *driver)
 {
@@ -1179,7 +1098,6 @@ int snd_usb_bind_card(struct snd_usb_audio *chip, struct snd_card *card,
 }
 EXPORT_SYMBOL_GPL(snd_usb_bind_card);
 
-__maybe_unused
 static int snd_usb_create_card(struct snd_usb_audio *chip, struct usb_interface *iface)
 {
 	struct usb_device *udev = chip->dev;
@@ -1227,170 +1145,68 @@ static int try_to_register_card(struct snd_usb_audio *chip, int ifnum)
  * only at the first time.  the successive calls of this function will
  * append the pcm interface to the corresponding card.
  */
-static int usb_audio_probe(struct usb_interface *intf,
-			   const struct usb_device_id *usb_id)
+static int usb_audio_probe(struct usb_interface *iface, const struct usb_device_id *usb_id)
 {
-	struct usb_device *dev = interface_to_usbdev(intf);
-	const struct snd_usb_audio_quirk *quirk =
-		(const struct snd_usb_audio_quirk *)usb_id->driver_info;
-	struct snd_usb_audio *chip;
-	int i, err;
 	struct usb_host_interface *alts;
-	int ifnum;
-	u32 id;
+	struct snd_usb_audio *chip;
+	struct usb_device *udev;
+	int ifnum, ret;
 
-	alts = &intf->altsetting[0];
-	ifnum = get_iface_desc(alts)->bInterfaceNumber;
-	id = USB_ID(le16_to_cpu(dev->descriptor.idVendor),
-		    le16_to_cpu(dev->descriptor.idProduct));
-	if (get_alias_id(dev, &id))
-		quirk = get_alias_quirk(dev, id);
-	if (quirk && quirk->ifnum >= 0 && ifnum != quirk->ifnum)
-		return -ENXIO;
-	if (quirk && quirk->ifnum == QUIRK_NODEV_INTERFACE)
+	alts = &iface->altsetting[0];
+	ifnum = alts->desc.bInterfaceNumber;
+	udev = interface_to_usbdev(iface);
+
+	udev = interface_to_usbdev(iface);
+	if (udev->audsb_capable)
 		return -ENODEV;
 
-	err = snd_usb_apply_boot_quirk(dev, intf, quirk, id);
-	if (err < 0)
-		return err;
-
-	/*
-	 * found a config.  now register to ALSA
-	 */
-
-	/* check whether it's already registered */
-	chip = NULL;
-	mutex_lock(&register_mutex);
-	for (i = 0; i < SNDRV_CARDS; i++) {
-		if (usb_chip[i] && usb_chip[i]->dev == dev) {
-			if (atomic_read(&usb_chip[i]->shutdown)) {
-				dev_err(&dev->dev, "USB device is in the shutdown state, cannot create a card instance\n");
-				err = -EIO;
-				goto __error;
-			}
-			chip = usb_chip[i];
-			atomic_inc(&chip->active); /* avoid autopm */
-			break;
-		}
-	}
-	if (! chip) {
-		err = snd_usb_apply_boot_quirk_once(dev, intf, quirk, id);
-		if (err < 0)
-			goto __error;
-
-		/* it's a fresh one.
-		 * now look for an empty slot and create a new card instance
-		 */
-		for (i = 0; i < SNDRV_CARDS; i++)
-			if (!usb_chip[i] &&
-			    (vid[i] == -1 || vid[i] == USB_ID_VENDOR(id)) &&
-			    (pid[i] == -1 || pid[i] == USB_ID_PRODUCT(id))) {
-				if (enable[i]) {
-					err = snd_usb_audio_create(intf, dev, i, quirk,
-								   id, &chip);
-					if (err < 0)
-						goto __error;
-					break;
-				} else if (vid[i] != -1 || pid[i] != -1) {
-					dev_info(&dev->dev,
-						 "device (%04x:%04x) is disabled\n",
-						 USB_ID_VENDOR(id),
-						 USB_ID_PRODUCT(id));
-					err = -ENOENT;
-					goto __error;
-				}
-			}
-		if (!chip) {
-			dev_err(&dev->dev, "no available usb audio device\n");
-			err = -ENODEV;
-			goto __error;
-		}
-		find_last_interface(chip);
-	}
-
-	if (chip->num_interfaces >= MAX_CARD_INTERFACES) {
-		dev_info(&dev->dev, "Too many interfaces assigned to the single USB-audio card\n");
-		err = -EINVAL;
-		goto __error;
+	guard(mutex)(&register_mutex);
+
+	ret = snd_usb_probe_unlocked(iface, usb_id, &usb_audio_driver);
+	chip = dev_get_drvdata(&udev->dev);
+	/* If chip isn't there, probe failed at the first interface. */
+	if (!chip)
+		return ret;
+	if (ret)
+		goto err_try_register;
+	if (!chip->card) {
+		ret = snd_usb_create_card(chip, iface);
+		if (ret)
+			goto err_no_register;
 	}
 
-	dev_set_drvdata(&dev->dev, chip);
+	ret = snd_usb_add_pcms(chip);
+	if (ret)
+		goto err_try_register;
 
-	if (ignore_ctl_error)
-		chip->quirk_flags |= QUIRK_FLAG_IGNORE_CTL_ERROR;
-
-	if (chip->quirk_flags & QUIRK_FLAG_DISABLE_AUTOSUSPEND)
-		usb_disable_autosuspend(interface_to_usbdev(intf));
-
-	/*
-	 * For devices with more than one control interface, we assume the
-	 * first contains the audio controls. We might need a more specific
-	 * check here in the future.
-	 */
-	if (!chip->ctrl_intf)
-		chip->ctrl_intf = alts;
-
-	err = 1; /* continue */
-	if (quirk && quirk->ifnum != QUIRK_NO_INTERFACE) {
-		/* need some special handlings */
-		err = snd_usb_create_quirk(chip, intf, &usb_audio_driver, quirk);
-		if (err < 0)
-			goto __error;
-	}
-
-	if (err > 0) {
-		/* create normal USB audio interfaces */
-		err = snd_usb_create_streams(chip, ifnum);
-		if (err < 0)
-			goto __error;
-		err = snd_usb_create_mixer(chip, ifnum);
-		if (err < 0)
-			goto __error;
-	}
+	ret = snd_usb_create_nonpcms(chip, iface, &usb_audio_driver);
+	if (ret)
+		goto err_try_register;
 
 	if (chip->need_delayed_register) {
-		dev_info(&dev->dev,
-			 "Found post-registration device assignment: %08x:%02x\n",
+		dev_info(&udev->dev, "Found post-registration device assignment: %08x:%02x\n",
 			 chip->usb_id, ifnum);
 		chip->need_delayed_register = false; /* clear again */
 	}
 
-	err = try_to_register_card(chip, ifnum);
-	if (err < 0)
-		goto __error_no_register;
+	ret = try_to_register_card(chip, ifnum);
+	if (ret < 0)
+		goto err_no_register;
 
-	/* don't want to fail when snd_media_device_create() fails */
-	snd_media_device_create(chip, intf);
+	/* Media device is optional, ignore error checks. */
+	snd_media_device_create(chip, iface);
 
-	if (quirk)
-		chip->quirk_type = quirk->type;
-
-	usb_chip[chip->index] = chip;
-	chip->intf[chip->num_interfaces] = intf;
-	chip->num_interfaces++;
-	usb_set_intfdata(intf, chip);
 	atomic_dec(&chip->active);
-	mutex_unlock(&register_mutex);
 	return 0;
 
- __error:
-	/* in the case of error in secondary interface, still try to register */
-	if (chip)
-		try_to_register_card(chip, ifnum);
+err_try_register:
+	/* In the case of error in secondary interface, still try to register. */
+	try_to_register_card(chip, ifnum);
 
- __error_no_register:
-	if (chip) {
-		/* chip->active is inside the chip->card object,
-		 * decrement before memory is possibly returned.
-		 */
-		atomic_dec(&chip->active);
-		if (!chip->num_interfaces) {
-			snd_card_free(chip->card);
-			snd_usb_chip_free(chip);
-		}
-	}
-	mutex_unlock(&register_mutex);
-	return err;
+err_no_register:
+	atomic_dec(&chip->active);
+	snd_usb_chip_release(chip, iface);
+	return ret;
 }
 
 /*
@@ -1445,15 +1261,8 @@ static void usb_audio_disconnect(struct usb_interface *intf)
 	if (chip->quirk_flags & QUIRK_FLAG_DISABLE_AUTOSUSPEND)
 		usb_enable_autosuspend(interface_to_usbdev(intf));
 
-	chip->num_interfaces--;
-	if (chip->num_interfaces <= 0) {
-		usb_chip[chip->index] = NULL;
-		mutex_unlock(&register_mutex);
-		snd_card_free(card);
-		snd_usb_chip_free(chip);
-	} else {
-		mutex_unlock(&register_mutex);
-	}
+	snd_usb_chip_release(chip, intf);
+	mutex_unlock(&register_mutex);
 }
 
 /* lock the shutdown (disconnect) task and autoresume */
-- 
2.25.1

