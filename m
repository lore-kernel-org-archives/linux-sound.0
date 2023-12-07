Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4oYiqOM"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 950A4DD
	for <linux-sound@vger.kernel.org>; Thu,  7 Dec 2023 01:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701942830; x=1733478830;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vEv88awcgP4p1zwJ87gdFFJARMPgtST7HHH5tWt/ESw=;
  b=A4oYiqOMfTl/0bH0i6N8eqrrFMKsyB0Bw3L5DYcLgSOvlc/R2sVlvD0u
   3YB488goLFzJZFIBFyr/1iQafFIiP13BWNcf5J4vGtj4TRK9q0UR91k5K
   CKf2+JXrro7cmPd2iHccfGSeJIzFfe5hSV7PwMAqrcjaRb7XjQJYGtcvI
   5YJNdcw4wnWYG5oz0EuFULjBRJ/1twGF+FiXPKDgXZoiBynVhfqbhugKc
   D7no7Ss9sW7xCJlY3IK7RxNBNZ0nvRMe4ctRy7b95ltpUBAvHk7zBJi94
   MiRM0ZwWIxmaJD34wUe3Boc5Z/z3128DYT/WvfbQWA0iJN/kTbh2rWXOG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="384611531"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="384611531"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 01:53:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="842153410"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="842153410"
Received: from lalexand-mobl.ccr.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.34.229])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 01:53:47 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH] ASoC: SOF: Intel: hda-codec: Delay the codec device registration
Date: Thu,  7 Dec 2023 11:54:25 +0200
Message-ID: <20231207095425.19597-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current code flow is:
1. snd_hdac_device_register()
2. set parameters needed by the hdac driver
3. request_codec_module()
   the hdac driver is probed at this point

During boot the codec drivers are not loaded when the hdac device is
registered, it is going to be probed later when loading the codec module,
which point the parameters are set.

On module remove/insert
rmmod snd_sof_pci_intel_tgl
modprobe snd_sof_pci_intel_tgl

The codec module remains loaded and the driver will be probed when the
hdac device is created right away, before the parameters for the driver
has been configured:

1. snd_hdac_device_register()
   the hdac driver is probed at this point
2. set parameters needed by the hdac driver
3. request_codec_module()
   will be a NOP as the module is already loaded

Move the snd_hdac_device_register() later, to be done right before
requesting the codec module to make sure that the parameters are all set
before the device is created:

1. set parameters needed by the hdac driver
2. snd_hdac_device_register()
3. request_codec_module()

This way at the hdac driver probe all parameters will be set in all cases.

Link: https://github.com/thesofproject/linux/issues/4731
Fixes: a0575b4add21 ("ASoC: hdac_hda: Conditionally register dais for HDMI and Analog")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
Hi,

The conditional DAI registering ended up using the need_display_power
parameter of hda_priv which worked fine in testing when all modules were
removed then re-loaded.
It failed when only the snd_sof_pci_intel_tgl is removed/loaded for example,
because at next module loading the hdac_hda_dev_probe() got called before
the hda_priv was prepared for it.
This has been an 'issue' prior to that patch as well, but the hda_priv was
not used, so it went unnoticed.

Regards,
Peter

 sound/soc/sof/intel/hda-codec.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 28ecbebb4b84..9f84b0d287a5 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -54,8 +54,16 @@ static int request_codec_module(struct hda_codec *codec)
 
 static int hda_codec_load_module(struct hda_codec *codec)
 {
-	int ret = request_codec_module(codec);
+	int ret;
+
+	ret = snd_hdac_device_register(&codec->core);
+	if (ret) {
+		dev_err(&codec->core.dev, "failed to register hdac device\n");
+		put_device(&codec->core.dev);
+		return ret;
+	}
 
+	ret = request_codec_module(codec);
 	if (ret <= 0) {
 		codec->probe_id = HDA_CODEC_ID_GENERIC;
 		ret = request_codec_module(codec);
@@ -116,7 +124,6 @@ EXPORT_SYMBOL_NS_GPL(hda_codec_jack_check, SND_SOC_SOF_HDA_AUDIO_CODEC);
 static struct hda_codec *hda_codec_device_init(struct hdac_bus *bus, int addr, int type)
 {
 	struct hda_codec *codec;
-	int ret;
 
 	codec = snd_hda_codec_device_init(to_hda_bus(bus), addr, "ehdaudio%dD%d", bus->idx, addr);
 	if (IS_ERR(codec)) {
@@ -126,13 +133,6 @@ static struct hda_codec *hda_codec_device_init(struct hdac_bus *bus, int addr, i
 
 	codec->core.type = type;
 
-	ret = snd_hdac_device_register(&codec->core);
-	if (ret) {
-		dev_err(bus->dev, "failed to register hdac device\n");
-		put_device(&codec->core.dev);
-		return ERR_PTR(ret);
-	}
-
 	return codec;
 }
 
-- 
2.43.0

