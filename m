Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JzIbUmDk"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DADE5182
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 05:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701090169; x=1732626169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tdXAxvH7Hfxz56Ii672gQKi1RhYlx5nPdd2W5+fHr7s=;
  b=JzIbUmDkVDGc2VOleA/A/uMohWZ5Jk1nMxpjHHnvzZqUStpNB8htSTuX
   v7oS7+sGLvZsyvtlyD/hCb5dPTNW/P++JNiunz5FsFGsWXCCSRmH22Z0f
   eOXXiL3i8z0MCHZeRdnNCiE0heyfwrnyNTu5ugCDwv1oWuIW51p7PivFN
   jqOJwC2DiiYM7eA9cyrNuGCEuOHH1NuS2uURN2vzbuaARIDGnP/bI6LXO
   iqmrnQEGZp1192OjO0/syri5o1jncnw85b5rGR5isbj+25kmzksM3F++w
   y3gDcE1hL1CDE2T1/YZgT+uHyCzYKjWHvoaPNce8Li9RuQu63SoDprjZ0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391568082"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="391568082"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 05:02:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="797228729"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="797228729"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 05:02:16 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 2/2] ASoC: hdac_hda: Conditionally register dais for HDMI and Analog
Date: Mon, 27 Nov 2023 15:02:45 +0200
Message-ID: <20231127130245.24295-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127130245.24295-1-peter.ujfalusi@linux.intel.com>
References: <20231127130245.24295-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current driver is registering the same dais for each hdev found in the
system which results duplicated widgets to be registered and the kernel
log contains similar prints:
snd_hda_codec_realtek ehdaudio0D0: ASoC: sink widget AIF1TX overwritten
snd_hda_codec_realtek ehdaudio0D0: ASoC: source widget AIF1RX overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget hifi3 overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget hifi2 overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget hifi1 overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Codec Output Pin1 overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Codec Input Pin1 overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Analog Codec Playback overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Digital Codec Playback overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Alt Analog Codec Playback overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Analog Codec Capture overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Digital Codec Capture overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Alt Analog Codec Capture overwritten

To avoid such issue, split the dai array into HDMI and non HDMI array and
register them conditionally:
for HDMI hdev only register the dais needed for HDMI
for non HDMI hdev do not  register the HDMI dais.

Link: https://github.com/thesofproject/linux/issues/4509
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/codecs/hdac_hda.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index 355f30779a34..72916a387ad6 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -132,6 +132,9 @@ static struct snd_soc_dai_driver hdac_hda_dais[] = {
 		.sig_bits = 24,
 	},
 },
+};
+
+static struct snd_soc_dai_driver hdac_hda_hdmi_dais[] = {
 {
 	.id = HDAC_HDMI_0_DAI_ID,
 	.name = "intel-hdmi-hifi1",
@@ -607,6 +610,13 @@ static const struct snd_soc_component_driver hdac_hda_codec = {
 	.endianness		= 1,
 };
 
+static const struct snd_soc_component_driver hdac_hda_hdmi_codec = {
+	.probe			= hdac_hda_codec_probe,
+	.remove			= hdac_hda_codec_remove,
+	.idle_bias_on		= false,
+	.endianness		= 1,
+};
+
 static int hdac_hda_dev_probe(struct hdac_device *hdev)
 {
 	struct hdac_ext_link *hlink;
@@ -621,9 +631,15 @@ static int hdac_hda_dev_probe(struct hdac_device *hdev)
 	snd_hdac_ext_bus_link_get(hdev->bus, hlink);
 
 	/* ASoC specific initialization */
-	ret = devm_snd_soc_register_component(&hdev->dev,
-					 &hdac_hda_codec, hdac_hda_dais,
-					 ARRAY_SIZE(hdac_hda_dais));
+	if (snd_hda_device_is_hdmi(hdev))
+		ret = devm_snd_soc_register_component(&hdev->dev,
+						&hdac_hda_hdmi_codec, hdac_hda_hdmi_dais,
+						ARRAY_SIZE(hdac_hda_hdmi_dais));
+	else
+		ret = devm_snd_soc_register_component(&hdev->dev,
+						&hdac_hda_codec, hdac_hda_dais,
+						ARRAY_SIZE(hdac_hda_dais));
+
 	if (ret < 0) {
 		dev_err(&hdev->dev, "failed to register HDA codec %d\n", ret);
 		return ret;
-- 
2.43.0

