Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F001970CC2
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 22:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711405177; cv=none; b=SHgz9/xZziV9Z3tTY5CUl1RIrFE0GFxdE4t5JuuOoF5C9XlOt9mb8gaWP4BbqpiloxXUV1JNS5Pa9Hc/Y5Wh9BVofWDsCNF8TWAc6JFJ75xWKSOHYqXEqruAnzXW/YibWF3zx7VWNVSEqeROfpyNIKoX9M1vkNSCcdiP5lfiyuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711405177; c=relaxed/simple;
	bh=F5xeQ4td7SO4wmvJXZDw6F6IWvj10XXOp3w00j0UwLM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=FyPLywRIKnMGkkn7xC784ALIb7huELJgBZ+I3BUfAwk4pZcEGbgA3S9ag7PmrZQxj6VrZQTGTGw+sp9yRJSbkJA26+WrCa0zBi1tleM04Mfre/MMw551jh+5LkD5qwwzT1kgGiNbbLAm3gZuuJB7OdbIEZTnSJw4s0t6aKSxpgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HzZJ1YUE; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HzZJ1YUE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711405176; x=1742941176;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=F5xeQ4td7SO4wmvJXZDw6F6IWvj10XXOp3w00j0UwLM=;
  b=HzZJ1YUEHUN48YwgaRi/mmEnkXIxkFA8cMxtaVifSOGJ4fdu6IMmFUzZ
   v2HoIqAuv6VsQjyKueNXou4PRuICqL+t/wRd6nSNlm2V57Ucf8XB2FaYb
   ow+5yeWzswpGglLHUEq+A9PudAdEzcLbPGRzDu9K6n174tpMZad9JpHfH
   gIhlWEDdkv16Jo7Qy3xyJAY1XqAVvSnxBhZgoe8HZQSb4hsBRIrKA6+LF
   Gegt2RoYblgJTiRrYKwsLa/6B9GDZWhiz4BhDmCmWAubqmoyfWGEZM6pZ
   T8d1cl4ZDJbl1WSEtjjEYbAUxcsnJHJEgF3h7tItfZf7jv7ACohgSjmlc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="23916832"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="23916832"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:19:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="46753039"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.212.98.109])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:19:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH] ASoC: hdac_hda: improve error logs
Date: Mon, 25 Mar 2024 17:19:25 -0500
Message-Id: <20240325221925.206507-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We have a couple of duplicate logs and missing information, add
__func__ consistently and make sure useful error codes are logged.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/codecs/hdac_hda.c | 44 ++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index 6aa3223985be..29c88de5508b 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -230,7 +230,8 @@ static int hdac_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	format_val = snd_hdac_stream_format(params_channels(params), bits, params_rate(params));
 	if (!format_val) {
 		dev_err(dai->dev,
-			"invalid format_val, rate=%d, ch=%d, format=%d, maxbps=%d\n",
+			"%s: invalid format_val, rate=%d, ch=%d, format=%d, maxbps=%d\n",
+			__func__,
 			params_rate(params), params_channels(params),
 			params_format(params), maxbps);
 
@@ -266,14 +267,12 @@ static int hdac_hda_dai_prepare(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct hda_pcm_stream *hda_stream;
 	struct hdac_hda_priv *hda_pvt;
-	struct hdac_device *hdev;
 	unsigned int format_val;
 	struct hda_pcm *pcm;
 	unsigned int stream;
 	int ret = 0;
 
 	hda_pvt = snd_soc_component_get_drvdata(component);
-	hdev = &hda_pvt->codec->core;
 	pcm = snd_soc_find_pcm_from_dai(hda_pvt, dai);
 	if (!pcm)
 		return -EINVAL;
@@ -286,7 +285,7 @@ static int hdac_hda_dai_prepare(struct snd_pcm_substream *substream,
 	ret = snd_hda_codec_prepare(hda_pvt->codec, hda_stream,
 				    stream, format_val, substream);
 	if (ret < 0)
-		dev_err(&hdev->dev, "codec prepare failed %d\n", ret);
+		dev_err(dai->dev, "%s: failed %d\n", __func__, ret);
 
 	return ret;
 }
@@ -298,6 +297,7 @@ static int hdac_hda_dai_open(struct snd_pcm_substream *substream,
 	struct hdac_hda_priv *hda_pvt;
 	struct hda_pcm_stream *hda_stream;
 	struct hda_pcm *pcm;
+	int ret;
 
 	hda_pvt = snd_soc_component_get_drvdata(component);
 	pcm = snd_soc_find_pcm_from_dai(hda_pvt, dai);
@@ -308,7 +308,11 @@ static int hdac_hda_dai_open(struct snd_pcm_substream *substream,
 
 	hda_stream = &pcm->stream[substream->stream];
 
-	return hda_stream->ops.open(hda_stream, hda_pvt->codec, substream);
+	ret = hda_stream->ops.open(hda_stream, hda_pvt->codec, substream);
+	if (ret < 0)
+		dev_err(dai->dev, "%s: failed %d\n", __func__, ret);
+
+	return ret;
 }
 
 static void hdac_hda_dai_close(struct snd_pcm_substream *substream,
@@ -367,7 +371,7 @@ static struct hda_pcm *snd_soc_find_pcm_from_dai(struct hdac_hda_priv *hda_pvt,
 		pcm_name = "HDMI 3";
 		break;
 	default:
-		dev_err(&hcodec->core.dev, "invalid dai id %d\n", dai->id);
+		dev_err(dai->dev, "%s: invalid dai id %d\n", __func__, dai->id);
 		return NULL;
 	}
 
@@ -381,7 +385,7 @@ static struct hda_pcm *snd_soc_find_pcm_from_dai(struct hdac_hda_priv *hda_pvt,
 		}
 	}
 
-	dev_err(&hcodec->core.dev, "didn't find PCM for DAI %s\n", dai->name);
+	dev_err(dai->dev, "%s: didn't find PCM for DAI %s\n", __func__, dai->name);
 	return NULL;
 }
 
@@ -411,7 +415,7 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 
 	hlink = snd_hdac_ext_bus_get_hlink_by_name(hdev->bus, dev_name(&hdev->dev));
 	if (!hlink) {
-		dev_err(&hdev->dev, "hdac link not found\n");
+		dev_err(&hdev->dev, "%s: hdac link not found\n", __func__);
 		return -EIO;
 	}
 
@@ -429,7 +433,7 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 	ret = snd_hda_codec_device_new(hcodec->bus, component->card->snd_card,
 				       hdev->addr, hcodec, true);
 	if (ret < 0) {
-		dev_err(&hdev->dev, "failed to create hda codec %d\n", ret);
+		dev_err(&hdev->dev, "%s: failed to create hda codec %d\n", __func__, ret);
 		goto error_no_pm;
 	}
 
@@ -446,7 +450,7 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 		if (fw) {
 			ret = snd_hda_load_patch(hcodec->bus, fw->size, fw->data);
 			if (ret < 0) {
-				dev_err(&hdev->dev, "failed to load hda patch %d\n", ret);
+				dev_err(&hdev->dev, "%s: failed to load hda patch %d\n", __func__, ret);
 				goto error_no_pm;
 			}
 			release_firmware(fw);
@@ -470,13 +474,13 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 
 	ret = snd_hda_codec_set_name(hcodec, hcodec->preset->name);
 	if (ret < 0) {
-		dev_err(&hdev->dev, "name failed %s\n", hcodec->preset->name);
+		dev_err(&hdev->dev, "%s: name failed %s\n", __func__, hcodec->preset->name);
 		goto error_pm;
 	}
 
 	ret = snd_hdac_regmap_init(&hcodec->core);
 	if (ret < 0) {
-		dev_err(&hdev->dev, "regmap init failed\n");
+		dev_err(&hdev->dev, "%s: regmap init failed\n", __func__);
 		goto error_pm;
 	}
 
@@ -484,16 +488,16 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 	if (patch) {
 		ret = patch(hcodec);
 		if (ret < 0) {
-			dev_err(&hdev->dev, "patch failed %d\n", ret);
+			dev_err(&hdev->dev, "%s: patch failed %d\n", __func__, ret);
 			goto error_regmap;
 		}
 	} else {
-		dev_dbg(&hdev->dev, "no patch file found\n");
+		dev_dbg(&hdev->dev, "%s: no patch file found\n", __func__);
 	}
 
 	ret = snd_hda_codec_parse_pcms(hcodec);
 	if (ret < 0) {
-		dev_err(&hdev->dev, "unable to map pcms to dai %d\n", ret);
+		dev_err(&hdev->dev, "%s: unable to map pcms to dai %d\n", __func__, ret);
 		goto error_patch;
 	}
 
@@ -501,8 +505,8 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 	if (!is_hdmi_codec(hcodec)) {
 		ret = snd_hda_codec_build_controls(hcodec);
 		if (ret < 0) {
-			dev_err(&hdev->dev, "unable to create controls %d\n",
-				ret);
+			dev_err(&hdev->dev, "%s: unable to create controls %d\n",
+				__func__, ret);
 			goto error_patch;
 		}
 	}
@@ -548,7 +552,7 @@ static void hdac_hda_codec_remove(struct snd_soc_component *component)
 
 	hlink = snd_hdac_ext_bus_get_hlink_by_name(hdev->bus, dev_name(&hdev->dev));
 	if (!hlink) {
-		dev_err(&hdev->dev, "hdac link not found\n");
+		dev_err(&hdev->dev, "%s: hdac link not found\n", __func__);
 		return;
 	}
 
@@ -624,7 +628,7 @@ static int hdac_hda_dev_probe(struct hdac_device *hdev)
 	/* hold the ref while we probe */
 	hlink = snd_hdac_ext_bus_get_hlink_by_name(hdev->bus, dev_name(&hdev->dev));
 	if (!hlink) {
-		dev_err(&hdev->dev, "hdac link not found\n");
+		dev_err(&hdev->dev, "%s: hdac link not found\n", __func__);
 		return -EIO;
 	}
 	snd_hdac_ext_bus_link_get(hdev->bus, hlink);
@@ -640,7 +644,7 @@ static int hdac_hda_dev_probe(struct hdac_device *hdev)
 						ARRAY_SIZE(hdac_hda_dais));
 
 	if (ret < 0) {
-		dev_err(&hdev->dev, "failed to register HDA codec %d\n", ret);
+		dev_err(&hdev->dev, "%s: failed to register HDA codec %d\n", __func__, ret);
 		return ret;
 	}
 
-- 
2.40.1

