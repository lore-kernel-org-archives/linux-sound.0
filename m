Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA2A286D77
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 08:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756456117; cv=none; b=FZ9LgUeBqnKn1VnPJUwMIbaPsqsTS/D3DYhpBhPIpiNv1NF5Kh6zv1tdyhVhTcvgqWJ16zJlnUIS0FTfTJg4rekqB8bERySkhjfAdCeOgyjJr79lEBbGQsWlIWtDOKVepaHycccx7JW2/M7aBd2B2kHqox5rYfcGgdAAgssMZL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756456117; c=relaxed/simple;
	bh=HDJvQ36VseszJOkHdIbvYJI34MM7s67ca+rq6Q64JF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iAZA9mtffdN5SrGOAYp3X+E1euPLnH/aY1tAFukjNWvYnvvMC0IYot/ZWDmqvNRgVEUUcrGBXxgRTj/mYd2zwPWGy06MijYB3uOU0rcLwkYdFd7KmxZSbXDMzy+6PP3V6vsOQAIoElpveRXvuzDdXWeB9lCnf8+3HYZNT+5Z1co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D5k+Eg6F; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D5k+Eg6F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756456116; x=1787992116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HDJvQ36VseszJOkHdIbvYJI34MM7s67ca+rq6Q64JF8=;
  b=D5k+Eg6FKYTc/ybNpcC5o3PMSYTmE6w+5u/eSF2dhlPkw+2gq5IyoD0o
   iooJHS9hcHVCdsb9MtokZZy19EwKww0/DmiGhSaYRESGLrQRoaf6HQ4H9
   s7VdChodrULeiv2nonAqpN/5BoUoMbZYbYY0Z08tevr7VsRMZUsyQhfFS
   Z6m4dIFTUd6Y7w/H+00gILNJ7JIDFKdtgdwGiXSTxt1HzHhyUrmoHL5TK
   kKVffV6z79DTBgGDhv0MyAQ/D2dNaxFz5iW3mcbC4tRRW7UmZiK8QNu5e
   XBxs4G3Udfr5ZbLQOzcQMVrcjzHeEr5PN1gfvoW4xe+fxaVGqnEi+jRK6
   w==;
X-CSE-ConnectionGUID: Q2CdunPqTNS7aZn1PwJORg==
X-CSE-MsgGUID: 4MZzJ6G8TtqTu3upj899MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="61373566"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="61373566"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 01:28:35 -0700
X-CSE-ConnectionGUID: SzaYypRUQL20qCcpHC1X0g==
X-CSE-MsgGUID: ggFfPlKgTVG/tA/u18h/qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="170494515"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.56])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 01:28:32 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 2/2] ASoC: SOF: Intel: only detect codecs when HDA DSP probe
Date: Fri, 29 Aug 2025 11:29:08 +0300
Message-ID: <20250829082908.2693-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829082908.2693-1-peter.ujfalusi@linux.intel.com>
References: <20250829082908.2693-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

SDW codecs use the global HDaudio WAKEEN/STS to detect wakes since LNL.
But the wake event is handled in the SDW driver. We should only clear
WAKESTS for the HDA and IDISP codecs that was detected when HDA DSP
probe. The SoundWire codec will be included in the codec_mask if we read
the STATESTS register when a SoundWire codec wake event happens.
The commit avoid updating bus->codec_mask in resume to not clear WAKESTS
of SoundWire codecs.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-ctrl.c | 5 +++--
 sound/soc/sof/intel/hda-dsp.c  | 2 +-
 sound/soc/sof/intel/hda.c      | 2 +-
 sound/soc/sof/intel/hda.h      | 2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index f43eb2a21f48..8332d4bda558 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -183,7 +183,7 @@ int hda_dsp_ctrl_clock_power_gating(struct snd_sof_dev *sdev, bool enable)
 }
 EXPORT_SYMBOL_NS(hda_dsp_ctrl_clock_power_gating, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
-int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev)
+int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool detect_codec)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct hdac_stream *stream;
@@ -223,7 +223,8 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev)
 	/* Accept unsolicited responses */
 	snd_hdac_chip_updatel(bus, GCTL, AZX_GCTL_UNSOL, AZX_GCTL_UNSOL);
 
-	hda_codec_detect_mask(sdev);
+	if (detect_codec)
+		hda_codec_detect_mask(sdev);
 
 	/* clear stream status */
 	list_for_each_entry(stream, &bus->stream_list, list) {
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index f64e8a6a9a33..3ab6d5ce6329 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -870,7 +870,7 @@ static int hda_resume(struct snd_sof_dev *sdev, bool runtime_resume)
 	snd_sof_pci_update_bits(sdev, PCI_TCSEL, 0x07, 0);
 
 	/* reset and start hda controller */
-	ret = hda_dsp_ctrl_init_chip(sdev);
+	ret = hda_dsp_ctrl_init_chip(sdev, false);
 	if (ret < 0) {
 		dev_err(sdev->dev,
 			"error: failed to start controller after resume\n");
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index c387efec41e9..52e86fa60077 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -616,7 +616,7 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 		dev_dbg(sdev->dev, "PP capability, will probe DSP later.\n");
 
 	/* Init HDA controller after i915 init */
-	ret = hda_dsp_ctrl_init_chip(sdev);
+	ret = hda_dsp_ctrl_init_chip(sdev, true);
 	if (ret < 0) {
 		dev_err(bus->dev, "error: init chip failed with ret: %d\n",
 			ret);
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index e14f82c0831f..28daf0a3b984 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -757,7 +757,7 @@ void hda_dsp_ctrl_ppcap_int_enable(struct snd_sof_dev *sdev, bool enable);
 int hda_dsp_ctrl_link_reset(struct snd_sof_dev *sdev, bool reset);
 void hda_dsp_ctrl_misc_clock_gating(struct snd_sof_dev *sdev, bool enable);
 int hda_dsp_ctrl_clock_power_gating(struct snd_sof_dev *sdev, bool enable);
-int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev);
+int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool detect_codec);
 void hda_dsp_ctrl_stop_chip(struct snd_sof_dev *sdev);
 /*
  * HDA bus operations.
-- 
2.50.1

