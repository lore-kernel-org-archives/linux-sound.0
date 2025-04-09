Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD6C25DAF2
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 10:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195895; cv=none; b=UEM/pgT9KgnLGsHyAaiVIFCi8t1QLAd3My/m77v2GrGnlzRhTaoFv5bC38HyZ9KtNIZ2lQDo+RHw4rO4589TI5dUPQQK/NI6JwrVDiRiW18QNwTr160XzIVCI2FI/7NbsYUGeUthKwnLcJaDDAjhBNWWNs5kkUWXEp8njPGQh5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195895; c=relaxed/simple;
	bh=0BTa3c6CTQMXmyxTjtIbHgajzaRHg7CFdalM7EuOnzI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WAWoXzJNnu/AQlZCN0ETkaaGtjxK4ur+Capjwgbf5aEoD+uCknuIaT8JphnOOD/2vL0XQ2w3DgpLgv6RdKjfxYcDwX1r89y/DA/75wgm3gHevQq4ftTbdJREdvkehmN6yE2XMZ3n9D7V/SLAQsPAKU+hHtpgybxHFJfcYhlJYd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EVuOT9yz; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EVuOT9yz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744195894; x=1775731894;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0BTa3c6CTQMXmyxTjtIbHgajzaRHg7CFdalM7EuOnzI=;
  b=EVuOT9yz8c2AuMznRvEb1JJpTOoLTBMy1fKuBruu1TQORnrUPIYhGNe5
   F+bExLzC4P7tKcisO/R31pVuz2/kNLarijMsy+8LJWWPsYfMKL3fhNsGi
   9uB67LJ3Ol3po0/O1H1799CAaE7vbm4WlozFMjINDcWT9GzGJ6R3uMBiA
   YQVkRwUCJ2zHc3Iqt1Sz8IWZtfiR32ZnzA9+EcDeJV7ptOgbA6uwqLrcJ
   EqT1UqeRSyP1mw2e/sYUOOfd7yffIuCqW8koBT/5s7BpcATr27eud2LIn
   BitufnBntsZd2HqxqBi1Zcf8YC6XikGezsyb8UmtEbuRK1zRolAHngrDZ
   g==;
X-CSE-ConnectionGUID: qadScKNYS2i60M4BHZQJWQ==
X-CSE-MsgGUID: nVZElz9URAyUhrGVoWQs7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45380141"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45380141"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 03:51:33 -0700
X-CSE-ConnectionGUID: GUz+kxYvRS2ubiSHguWQag==
X-CSE-MsgGUID: jZoeu7C9R3yah3izB1kRpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="133426261"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 03:51:30 -0700
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
Subject: [RFC 14/15] ASoC: codecs: Add USB-Audio driver
Date: Wed,  9 Apr 2025 13:07:29 +0200
Message-Id: <20250409110731.3752332-15-cezary.rojewski@intel.com>
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

Sound card on the ASoC side is typically a marriage of two major
components: codec and platform. Platform usually covers DSP subject so
the USB Audio-Class (AC) driver fits the codec role better.

The driver takes heavily from the 'classic' driver defined in
sound/usb/card.c. The difference worth noting is lack of tolerance for
quirks - given the limited number of Audio Link Hub (ALH) streams, only
candidates (USB devices) we can be sure of have green light for
offloading.

There are two important responsibilities of the driver on top of
PCM/component operations:

- register platform device for machine-board driver to hook onto
- allocation and free of Audio Sideband resources and storing up-to-date
  information about USB endpoints engaged in the streaming.

The platform component can leverage the latter to configure their
hardware accordingly to what is present on xHCI side.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/usb_offload.h |  46 ++++
 sound/soc/codecs/Kconfig    |   6 +
 sound/soc/codecs/Makefile   |   2 +
 sound/soc/codecs/usb.c      | 441 ++++++++++++++++++++++++++++++++++++
 4 files changed, 495 insertions(+)
 create mode 100644 include/sound/usb_offload.h
 create mode 100644 sound/soc/codecs/usb.c

diff --git a/include/sound/usb_offload.h b/include/sound/usb_offload.h
new file mode 100644
index 000000000000..029a8f22d32f
--- /dev/null
+++ b/include/sound/usb_offload.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * USB Audio Offload(ed) stream information
+ *
+ * Copyright(c) 2025 Intel Corporation
+ */
+#ifndef __SOUND_USB_OFFLOAD_H
+#define __SOUND_USB_OFFLOAD_H
+
+#include <uapi/linux/usb/ch9.h> /* enum usb_device_speed */
+
+/**
+ * struct uao_stream_info - USB Audio Offload stream information
+ *
+ * @bus_devid: Device ID of the owning xHCI controller, see pci_dev_id().
+ * @slot_id: slot_id of the USB device.
+ * @tt: true if behind USB2.0 Transaction Translator (TT)
+ * @speed: USB_SPEED_XXX of the USB device.
+ *
+ * @data_epaddr: bEndpointAddress of the data endpoint.
+ * @data_audsb_res: Audio Sideband resource assigned by xHCI.
+ * @data_maxp: wMaxPacketSize of the data endpoint.
+ * @fb_epaddr: bEndpointAddress of the feedback endpoint.
+ * @fb_audsb_res: Audio Sideband resource assigned by xHCI.
+ * @fb_maxp: wMaxPacketSize of the feedback endpoint.
+ * @fb_interval: Synchornization interval of the feedback endpoint.
+ *
+ * If the owning xHCI controller is not a PCI device, @bus_devid is 0.
+ * If no feedback endpoint exists for a given stream, all fb_xxx are 0.
+ */
+struct uao_stream_info {
+	u16 bus_devid;
+	u8 slot_id;
+	u8 tt;
+	enum usb_device_speed speed;
+
+	u8 data_epaddr;
+	u8 data_audsb_res;
+	u16 data_maxp;
+	u8 fb_epaddr;
+	u8 fb_audsb_res;
+	u16 fb_maxp;
+	u8 fb_syncinterval;
+};
+
+#endif
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index f8a21c4b74c2..eda9268cf0b4 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2177,6 +2177,12 @@ config SND_SOC_UDA1380
 	tristate
 	depends on I2C
 
+config SND_SOC_USB_CODEC
+	tristate "USB \"codec\" representative in ASoC"
+	depends on SND_USB_AUDIO
+	help
+	  TODO
+
 config SND_SOC_WCD_CLASSH
 	tristate
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 578d6aedc69a..cc1206057aae 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -331,6 +331,7 @@ snd-soc-twl6040-y := twl6040.o
 snd-soc-uda1334-y := uda1334.o
 snd-soc-uda1342-y := uda1342.o
 snd-soc-uda1380-y := uda1380.o
+snd-soc-usb-codec-y := usb.o
 snd-soc-wcd-classh-y := wcd-clsh-v2.o
 snd-soc-wcd-mbhc-y := wcd-mbhc-v2.o
 snd-soc-wcd9335-y := wcd9335.o
@@ -746,6 +747,7 @@ obj-$(CONFIG_SND_SOC_TWL6040)	+= snd-soc-twl6040.o
 obj-$(CONFIG_SND_SOC_UDA1334)	+= snd-soc-uda1334.o
 obj-$(CONFIG_SND_SOC_UDA1342)	+= snd-soc-uda1342.o
 obj-$(CONFIG_SND_SOC_UDA1380)	+= snd-soc-uda1380.o
+obj-$(CONFIG_SND_SOC_USB_CODEC)	+= snd-soc-usb-codec.o
 obj-$(CONFIG_SND_SOC_WCD_CLASSH)	+= snd-soc-wcd-classh.o
 obj-$(CONFIG_SND_SOC_WCD_MBHC)	+= snd-soc-wcd-mbhc.o
 obj-$(CONFIG_SND_SOC_WCD9335)	+= snd-soc-wcd9335.o
diff --git a/sound/soc/codecs/usb.c b/sound/soc/codecs/usb.c
new file mode 100644
index 000000000000..1013147d66b4
--- /dev/null
+++ b/sound/soc/codecs/usb.c
@@ -0,0 +1,441 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright(c) 2025 Intel Corporation
+//
+// Author: Cezary Rojewski <cezary.rojewski@intel.com>
+//
+
+#include <linux/list.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/pci.h>
+#include <linux/pm.h> /* pm_message_t */
+#include <linux/usb.h>
+
+#include <sound/pcm.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-component.h>
+#include <sound/soc-dai.h>
+#include <sound/soc-dapm.h>
+#include <sound/usb.h>
+#include <sound/usb_offload.h>
+#include <uapi/linux/usb/audio.h>
+
+#define UAO_COMPONENT_NAME "usb-codec"
+
+static struct usb_driver uaol_driver;
+
+struct uao_dai_data {
+	struct uao_stream_info uao;
+	struct list_head *stream_entry; /* see struct snd_usb_stream. */
+};
+
+static int uaol_dai_pcm_new(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+{
+	struct uao_dai_data *data = snd_soc_dai_dma_data_get(dai, 0);
+
+	/* Complete a USB stream initialization by binding it with a PCM. */
+	return snd_usb_bind_pcm(data->stream_entry, rtd->pcm);
+}
+
+static int uaol_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct snd_usb_audio *chip = dev_get_drvdata(dai->component->dev);
+	struct usb_device *udev = chip->dev;
+	struct uao_dai_data *data;
+	u8 data_res, fb_res;
+	int ret;
+
+	fb_res = 0;
+	data = snd_soc_dai_get_dma_data(dai, substream);
+
+	ret = usb_alloc_audsb_resource(udev, data->uao.data_epaddr, &data_res);
+	if (ret)
+		return ret;
+	if (data->uao.fb_epaddr) {
+		ret = usb_alloc_audsb_resource(udev, data->uao.fb_epaddr, &fb_res);
+		if (ret)
+			goto err_alloc_fb;
+	}
+
+	/* sound/usb/pcm.c operations expect valid USB stream in ->private_data. */
+	substream->runtime->private_data = data->stream_entry;
+
+	ret = snd_usb_pcm_open(substream);
+	if (ret)
+		goto err_pcm_open;
+
+	data->uao.data_audsb_res = data_res;
+	data->uao.fb_audsb_res = fb_res;
+	return 0;
+
+err_pcm_open:
+	substream->runtime->private_data = NULL;
+	if (data->uao.fb_epaddr)
+		usb_free_audsb_resource(udev, data->uao.fb_epaddr);
+err_alloc_fb:
+	usb_free_audsb_resource(udev, data->uao.data_epaddr);
+	return ret;
+}
+
+static void uaol_dai_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct snd_usb_audio *chip = dev_get_drvdata(dai->component->dev);
+	struct usb_device *udev = chip->dev;
+	struct uao_dai_data *data;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	data->uao.data_audsb_res = 0;
+	data->uao.fb_audsb_res = 0;
+
+	snd_usb_pcm_close(substream);
+	substream->runtime->private_data = NULL;
+
+	if (data->uao.fb_epaddr)
+		usb_free_audsb_resource(udev, data->uao.fb_epaddr);
+	usb_free_audsb_resource(udev, data->uao.data_epaddr);
+}
+
+static int uaol_dai_hw_params(struct snd_pcm_substream *substream,
+			      struct snd_pcm_hw_params *hw_params, struct snd_soc_dai *dai)
+{
+	struct uao_dai_data *data = snd_soc_dai_get_dma_data(dai, substream);
+	int ret;
+
+	ret = snd_usb_pcm_hw_params(substream, hw_params);
+	if (ret)
+		return ret;
+
+	/* With USB endpoints configured, assign the dynamic information. */
+	snd_usb_pcm_get_epinfo(data->stream_entry, substream->stream, &data->uao.data_maxp,
+			       &data->uao.fb_maxp, &data->uao.fb_syncinterval);
+	return 0;
+}
+
+static int uaol_dai_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct uao_dai_data *data;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	data->uao.data_maxp = 0;
+	data->uao.fb_maxp = 0;
+	data->uao.fb_syncinterval = 0;
+
+	return snd_usb_pcm_hw_free(substream);
+}
+
+static int uaol_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	return snd_usb_pcm_prepare(substream);
+}
+
+static const struct snd_soc_dai_ops uaol_dai_ops = {
+	.pcm_new =	uaol_dai_pcm_new,
+	.startup =	uaol_dai_startup,
+	.shutdown =	uaol_dai_shutdown,
+	.hw_params =	uaol_dai_hw_params,
+	.hw_free =	uaol_dai_hw_free,
+	.prepare =	uaol_dai_prepare,
+};
+
+static const struct snd_soc_dapm_route dapm_routes[] = {
+	{ "AIF1TX", NULL, "Codec Input Pin1" },
+	{ "Codec Output Pin1", NULL, "AIF1RX" },
+};
+
+static const struct snd_soc_dapm_widget dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("AIF1RX", "Analog Codec Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("AIF1TX", "Analog Codec Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_INPUT("Codec Input Pin1"),
+	SND_SOC_DAPM_OUTPUT("Codec Output Pin1"),
+};
+
+static int uaol_init_dai_driver(struct snd_usb_audio *chip, struct snd_soc_dai_driver *driver,
+				struct list_head *stream_entry, int idx)
+{
+	struct device *dev = &chip->dev->dev;
+	struct snd_soc_pcm_stream *stream;
+	struct snd_pcm_hardware hw;
+	int dir;
+
+	driver->id = idx;
+	driver->ops = &uaol_dai_ops;
+	driver->name = devm_kasprintf(dev, GFP_KERNEL, "usb-codec-dai%d", idx);
+	if (!driver->name)
+		return -ENOMEM;
+
+	for_each_pcm_streams(dir) {
+		if (dir)
+			stream = &driver->capture;
+		else
+			stream = &driver->playback;
+
+		/* If the direction is not supported, skip it. */
+		memset(&hw, 0, sizeof(hw));
+		snd_usb_pcm_hw_init(stream_entry, dir, &hw);
+		if (!hw.formats)
+			continue;
+
+		stream->stream_name = devm_kasprintf(dev, GFP_KERNEL, "UAO Audio #%i %s",
+						     idx, snd_pcm_direction_name(dir));
+		if (!stream->stream_name)
+			return -ENOMEM;
+		stream->rates = hw.rates;
+		stream->rate_min = hw.rate_min;
+		stream->rate_max = hw.rate_max;
+		stream->channels_min = hw.channels_min;
+		stream->channels_max = hw.channels_max;
+		stream->formats = hw.formats;
+	}
+
+	if (!driver->playback.formats && !driver->capture.formats)
+		return -EINVAL;
+	return 0;
+}
+
+static int uaol_init_dai_dma_data(struct snd_usb_audio *chip, struct snd_soc_dai *dai,
+				  struct list_head *stream_entry, u16 bus_devid)
+{
+	struct usb_device *udev = chip->dev;
+	struct uao_dai_data *data;
+	int dir;
+
+	for_each_pcm_streams(dir) {
+		if (!snd_soc_dai_get_pcm_stream(dai, dir)->formats)
+			continue;
+
+		data = devm_kzalloc(&udev->dev, sizeof(*data), GFP_KERNEL);
+		if (!data)
+			return -ENOMEM;
+
+		/* The dynamic information is assigned in hw_params(). */
+		data->stream_entry = stream_entry;
+		data->uao.bus_devid = bus_devid;
+		data->uao.slot_id = udev->slot_id;
+		if (udev->tt)
+			data->uao.tt = true;
+		data->uao.speed = udev->speed;
+		snd_usb_pcm_get_epaddr(stream_entry, dir, &data->uao.data_epaddr,
+				       &data->uao.fb_epaddr);
+
+		snd_soc_dai_dma_data_set(dai, dir, data);
+	}
+
+	return 0;
+}
+
+static void uaol_unregister_dais(struct snd_soc_component *component)
+{
+	struct snd_soc_dai *dai, *save;
+
+	for_each_component_dais_safe(component, dai, save)
+		if (strstr(dai->driver->name, UAO_COMPONENT_NAME))
+			snd_soc_unregister_dai(dai);
+}
+
+static int uaol_register_dais(struct snd_soc_component *component)
+{
+	struct snd_usb_audio *chip = dev_get_drvdata(component->dev);
+	struct usb_device *udev = chip->dev;
+	struct snd_soc_dai_driver *drivers;
+	struct list_head *stream_entry;
+	struct snd_soc_dai *dai;
+	u16 bus_devid = 0;
+	int ret, i = 0;
+
+	if (list_empty(&chip->pcm_list))
+		return -EINVAL;
+
+	drivers = devm_kcalloc(&udev->dev, chip->pcm_devs, sizeof(*drivers), GFP_KERNEL);
+	if (!drivers)
+		return -ENOMEM;
+
+	if (dev_is_pci(udev->bus->controller)) {
+		struct pci_dev *pci = to_pci_dev(udev->bus->controller);
+
+		bus_devid = pci_dev_id(pci);
+	}
+
+	list_for_each(stream_entry, &chip->pcm_list) {
+		ret = uaol_init_dai_driver(chip, &drivers[i], stream_entry, i);
+		if (ret)
+			goto err;
+
+		dai = snd_soc_register_dai(component, &drivers[i], false);
+		if (!dai) {
+			ret = -EINVAL;
+			goto err;
+		}
+
+		ret = uaol_init_dai_dma_data(chip, dai, stream_entry, bus_devid);
+		if (ret)
+			goto err;
+		i++;
+	}
+
+	return 0;
+err:
+	uaol_unregister_dais(component);
+	return ret;
+}
+
+static int uaol_component_probe(struct snd_soc_component *component)
+{
+	struct snd_usb_audio *chip = dev_get_drvdata(component->dev);
+
+	return snd_usb_bind_card(chip, component->card->snd_card, &uaol_driver);
+}
+
+static void uaol_component_remove(struct snd_soc_component *component)
+{
+	struct snd_usb_audio *chip = dev_get_drvdata(component->dev);
+
+	/* Prevent autosuspend of the chip. */
+	atomic_add(chip->num_interfaces, &chip->active);
+
+	/*
+	 * Unregister DAIs that were created manually in uaol_register_dais()
+	 * and release all (audio) resources attached tt the chip.  The parsed
+	 * information about PCMs (chip->pcm_list) remains intact so the card
+	 * can be re-bound without the need to re-parse USB interface again.
+	 *
+	 * Nothing for proc as ASoC did snd_card_disconnect() already, it is gone.
+	 */
+	snd_usb_release_resources(chip);
+	chip->card = NULL;
+}
+
+static const struct snd_soc_component_driver uaol_codec_driver = {
+	.name = "usb-codec-driver",
+	.probe = uaol_component_probe,
+	.remove = uaol_component_remove,
+	.dapm_widgets = dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(dapm_widgets),
+	.dapm_routes = dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(dapm_routes),
+};
+
+static int uaol_register_component(struct snd_usb_audio *chip)
+{
+	struct snd_soc_component *component;
+	struct usb_device *udev = chip->dev;
+	int ret;
+
+	component = devm_kzalloc(&udev->dev, sizeof(*component), GFP_KERNEL);
+	if (!component)
+		return -ENOMEM;
+
+	component->name = UAO_COMPONENT_NAME;
+
+	ret = snd_soc_component_initialize(component, &uaol_codec_driver, &udev->dev);
+	if (ret)
+		return ret;
+
+	ret = uaol_register_dais(component);
+	if (ret)
+		return ret;
+
+	return snd_soc_add_component(component, NULL, 0);
+}
+
+static void uaol_unregister_board(void *pdev)
+{
+	platform_device_unregister(pdev);
+}
+
+static int uaol_register_chip(struct snd_usb_audio *chip)
+{
+	struct snd_soc_acpi_mach mach = {{0}};
+	struct device *dev = &chip->dev->dev;
+	struct platform_device *pdev;
+	int ret;
+
+	mach.tplg_filename = "uao-tplg.bin";
+
+	ret = uaol_register_component(chip);
+	if (ret)
+		return ret;
+
+	pdev = platform_device_register_data(dev, "uao_board", PLATFORM_DEVID_AUTO,
+					     &mach, sizeof(mach));
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	ret = devm_add_action(dev, uaol_unregister_board, pdev);
+	if (ret) {
+		platform_device_unregister(pdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int uaol_probe(struct usb_interface *iface, const struct usb_device_id *usb_id)
+{
+	struct snd_usb_audio *chip;
+	struct usb_device *udev;
+	int ret;
+
+	udev = interface_to_usbdev(iface);
+	if (!udev->audsb_capable)
+		return -ENODEV;
+
+	/* UAO is optional, leave the device to the classic driver if probe fails. */
+	ret = snd_usb_probe(iface, usb_id, &uaol_driver);
+	if (ret) {
+		dev_warn(&udev->dev, "USB Audio Offload driver probe failed: %d\n", ret);
+		udev->audsb_capable = false;
+		return -EPROBE_DEFER;
+	}
+
+	chip = usb_get_intfdata(iface);
+	return uaol_register_chip(chip);
+}
+
+static void uaol_disconnect(struct usb_interface *iface)
+{
+	struct snd_usb_audio *chip = usb_get_intfdata(iface);
+
+	if (chip == USB_AUDIO_IFACE_UNUSED)
+		return;
+
+	snd_soc_unregister_component(&chip->dev->dev);
+	return snd_usb_disconnect(iface);
+}
+
+static int uaol_suspend(struct usb_interface *iface, pm_message_t message)
+{
+	return snd_usb_suspend(iface, message);
+}
+
+static int uaol_resume(struct usb_interface *iface)
+{
+	return snd_usb_resume(iface);
+}
+
+static const struct usb_device_id uaol_device_ids[] = {
+	{
+		.match_flags = USB_DEVICE_ID_MATCH_INT_CLASS | USB_DEVICE_ID_MATCH_INT_SUBCLASS,
+		.bInterfaceClass = USB_CLASS_AUDIO,
+		.bInterfaceSubClass = USB_SUBCLASS_AUDIOCONTROL
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(usb, uaol_device_ids);
+
+static struct usb_driver uaol_driver = {
+	.name =		"snd-soc-usb-codec",
+	.probe =	uaol_probe,
+	.disconnect =	uaol_disconnect,
+	.suspend =	uaol_suspend,
+	.resume =	uaol_resume,
+	.reset_resume =	uaol_resume,
+	.id_table =	uaol_device_ids,
+	.supports_autosuspend = 1,
+};
+
+module_usb_driver(uaol_driver);
+
+MODULE_DESCRIPTION("USB Audio driver for ASoC");
+MODULE_LICENSE("GPL");
-- 
2.25.1

