Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBEC25D911
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 10:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195903; cv=none; b=O5ZVfzqOs1skcbdxygoLagidnPwB48XqxNhTMOqiDZYRHOGrVi8X8u8JGgLCPlbXExufTcISPgYkUoxcGnXVcvji5RECpQXV+8io7qwK8AUfx+8T7clxmhVqDwIn+x0xQhJGfinTR+zzjsjMyCHjkBBzCdVdjWrGEArLAUAB14c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195903; c=relaxed/simple;
	bh=c1khOfXuuo4V16BQRyB2YzmAnkjoflB5TM7TMkaF2/8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NPgTVHs/tuwmGPdlRSMyFsMwG3j3315tNvhaRtDyzr8GQ/cNPt7K8x7dciOC/azhnLAJTQDj1jW9zV4T/2arHQGa62NhpXQBewJVtDVAJLAkwiMy6ygChZn6nkcMYNPjEZYjGSzeqxt5bR3Cs2UaT8x41dpYEtcYgBIjCD3t3mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eVIsfd+v; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eVIsfd+v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744195902; x=1775731902;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c1khOfXuuo4V16BQRyB2YzmAnkjoflB5TM7TMkaF2/8=;
  b=eVIsfd+v7QgLKuNA9ZrAuMaJwX1JKLIrOHxaDkMcf8AlZQpaUhtnc08R
   97ummEX4DIx1+g7Oy2MU5gwx/Xrbtw4YF3J5IIkiKmhncyAiYZPfbHMMw
   SNumBQpTzIopIybcjPKXNjotn2EUi1mt3cwDaYuYzhf8xeAqTYRhw1TCo
   f17eiHATCus7DWVgcj2z5k3BVJnrMKEd9f/GjYaUm17njQM4kiCgJAXCC
   xph5J1G2soxb6lY3IKvOXWFQbH7i8RHXQC6hq7Y8xZE+LsSXNWdN17DDk
   IUSf1fCC4RGK6LaEdcLPY5nEV7nzwmGxrOoimOOzvUs1EAEPI2wvbQu7V
   w==;
X-CSE-ConnectionGUID: rZnJTtS/QR+H1qBx2j71/A==
X-CSE-MsgGUID: 063rTMN+TMmbzr7/8zZ60A==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45380147"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45380147"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 03:51:34 -0700
X-CSE-ConnectionGUID: YYGfXlmlQ1Occ85RkqI7Wg==
X-CSE-MsgGUID: Js74u3szRomiq+frocqS5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="133426274"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 03:51:32 -0700
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
Subject: [RFC 15/15] ASoC: Intel: avs: Add USB machine board
Date: Wed,  9 Apr 2025 13:07:30 +0200
Message-Id: <20250409110731.3752332-16-cezary.rojewski@intel.com>
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

Provide machine board driver that represents USB Audio sound card. The
card connects ASoC USB codec driver with Intel AudioDSP avs-driver
driver so that user can enjoy streaming over USB device without engaging
their CPU - transfer is offloaded onto DSP instead.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/Kconfig  |   8 ++
 sound/soc/intel/avs/boards/Makefile |   2 +
 sound/soc/intel/avs/boards/usb.c    | 115 ++++++++++++++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 sound/soc/intel/avs/boards/usb.c

diff --git a/sound/soc/intel/avs/boards/Kconfig b/sound/soc/intel/avs/boards/Kconfig
index 7938e6d6e44d..f036cb96c48f 100644
--- a/sound/soc/intel/avs/boards/Kconfig
+++ b/sound/soc/intel/avs/boards/Kconfig
@@ -244,4 +244,12 @@ config SND_SOC_INTEL_AVS_MACH_TDF8532
 	  Say Y or m if you have such a device. This is a recommended option.
 	  If unsure select "N".
 
+config SND_SOC_INTEL_AVS_MACH_USB
+	tristate "USB-Audio board"
+	depends on USB_XHCI_PCI || COMPILE_TEST
+	select SND_SOC_USB_CODEC
+	help
+	  This allows Intel AVS driver to pair with xHCI Audio Sideband.
+	  If unsure select "N".
+
 endmenu
diff --git a/sound/soc/intel/avs/boards/Makefile b/sound/soc/intel/avs/boards/Makefile
index 7c718c0ce120..4fdea026a216 100644
--- a/sound/soc/intel/avs/boards/Makefile
+++ b/sound/soc/intel/avs/boards/Makefile
@@ -24,6 +24,7 @@ snd-soc-avs-rt5663-y := rt5663.o
 snd-soc-avs-rt5682-y := rt5682.o
 snd-soc-avs-ssm4567-y := ssm4567.o
 snd-soc-avs-tdf8532-y := tdf8532.o
+snd-soc-avs-usb-y := usb.o
 
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_DA7219) += snd-soc-avs-da7219.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_DMIC) += snd-soc-avs-dmic.o
@@ -49,3 +50,4 @@ obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT5663) += snd-soc-avs-rt5663.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT5682) += snd-soc-avs-rt5682.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_SSM4567) += snd-soc-avs-ssm4567.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_TDF8532) += snd-soc-avs-tdf8532.o
+obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_USB) += snd-soc-avs-usb.o
diff --git a/sound/soc/intel/avs/boards/usb.c b/sound/soc/intel/avs/boards/usb.c
new file mode 100644
index 000000000000..d103a8a5474b
--- /dev/null
+++ b/sound/soc/intel/avs/boards/usb.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright(c) 2025 Intel Corporation
+//
+// Author: Cezary Rojewski <cezary.rojewski@intel.com>
+//
+
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/usb.h>
+#include <sound/soc.h>
+#include <sound/soc-card.h>
+#include <sound/usb.h>
+
+static int uao_create_dai_links(struct device *dev, struct snd_usb_audio *chip,
+				struct snd_soc_dai_link **links, int *num_links)
+{
+	struct snd_soc_dai_link *dl;
+	int i;
+
+	dl = devm_kcalloc(dev, chip->pcm_devs, sizeof(*dl), GFP_KERNEL);
+	if (!dl)
+		return -ENOMEM;
+
+	for (i = 0; i < chip->pcm_devs; i++) {
+		dl[i].name = devm_kasprintf(dev, GFP_KERNEL, "uao-be-link%d", i);
+		if (!dl[i].name)
+			return -ENOMEM;
+		dl[i].stream_name = dl[i].name;
+
+		dl[i].no_pcm = 1;
+		dl[i].num_cpus = 1;
+		dl[i].num_codecs = 1;
+		dl[i].nonatomic = 1;
+		dl[i].codecs = devm_kzalloc(dev, sizeof(*dl[i].codecs), GFP_KERNEL);
+		dl[i].cpus = devm_kzalloc(dev, sizeof(*dl[i].cpus), GFP_KERNEL);
+		if (!dl[i].codecs || !dl[i].cpus)
+			return -ENOMEM;
+		dl[i].codecs->name = "usb-codec";
+		dl[i].codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, "usb-codec-dai%d", i);
+		if (!dl[i].codecs->dai_name)
+			return -ENOMEM;
+		dl[i].cpus->dai_name = "uaol-cpu0";
+	}
+
+	*links = dl;
+	*num_links = chip->pcm_devs;
+	return 0;
+}
+
+static int uao_board_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct snd_usb_audio *chip;
+	struct snd_soc_card *card;
+	struct usb_device *udev;
+	char shortname[32];
+	char longname[80];
+	int ret;
+
+	chip = dev_get_drvdata(dev->parent);
+	udev = chip->dev;
+
+	switch (udev->speed) {
+	case USB_SPEED_FULL:
+	case USB_SPEED_HIGH:
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
+	if (!card)
+		return -ENOMEM;
+
+	ret = uao_create_dai_links(dev, chip, &card->dai_link, &card->num_links);
+	if (ret)
+		return ret;
+
+	card->dev = dev;
+	card->owner = THIS_MODULE;
+	card->fully_routed = true;
+	card->driver_name = "USB-Audio";
+
+	snd_usb_make_card_names(chip, shortname, longname);
+	/* card->driver/shortname/longname set by ASoC. */
+	/* card->private_data/free redundant for ASoC-based. */
+	card->name = devm_kstrdup(dev, shortname, GFP_KERNEL);
+	card->long_name = devm_kstrdup(dev, longname, GFP_KERNEL);
+	card->components = devm_kasprintf(dev, GFP_KERNEL, "USB%04x:%04x",
+					  usb_device_vid(udev), usb_device_pid(udev));
+	if (!card->name || !card->long_name || !card->components)
+		return -ENOMEM;
+
+	return devm_snd_soc_register_card(dev, card);
+}
+
+static const struct platform_device_id uao_board_driver_ids[] = {
+	{ .name = "uao_board", },
+	{ },
+};
+
+static struct platform_driver uao_board_driver = {
+	.probe = uao_board_probe,
+	.driver = {
+		.name = "uao_board",
+		.pm = &snd_soc_pm_ops,
+	},
+	.id_table = uao_board_driver_ids,
+};
+
+module_platform_driver(uao_board_driver);
+
+MODULE_DESCRIPTION("USB Audio Offload machine driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

