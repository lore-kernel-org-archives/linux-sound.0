Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1094D1DDA37
	for <linux-sound@vger.kernel.org>; Tue,  3 Dec 2024 10:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733222944; cv=none; b=eKEXfH16sdVr0mz3IdrpGZFF/ACnyCf6W+09HoRiPZZYZfDKuZK0cEUmLiOI6dSOe0vy3pUbw/Cg/ewlZ7Q94FI9U+BP2+hqLaUaNc/on0S0gHQ1C3+uhbFvPh2CuW8yEesDgSluj4vEuCaGHYzcAEWGQwo+GCIglNBH2nQbYC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733222944; c=relaxed/simple;
	bh=ez7q/384kweZQ7tgITZfNHIwzvcxxI0WszoP5l9SPAk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Xzdu6gwClkG3rbYhQOy+Nj0MkpDrtkCzmASEAccO0tAayTdAmEOs2evWXZHTI+IW/QUU67sbcB1AhvZ1oK1HeOBKg23S3xli2QUyckR4u1oqB8LbSbSSksZi2BtHvdQRZMpthZ65WLvkcnjofd7cyIAaQ9v0JL5Sq5ghIJA6Yxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J8Mzu9ny; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J8Mzu9ny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733222943; x=1764758943;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ez7q/384kweZQ7tgITZfNHIwzvcxxI0WszoP5l9SPAk=;
  b=J8Mzu9nymM3/08ouxtKL84oxR7/dqhqYglUvquWZMBrtik3GvgQ76i5j
   IdfrSygAovAbDaoosORuFe1fBR1GmHQXdpvLEOiHay6cKIK2FM/4gMadd
   8HBhp5Butns34nSQrscYLf0JBgH2oHuVQsOub8WSq9g+3jbahM2awPXJw
   WYpv2ls8HXXlTq4+RElYrkecDyX7DGPaT2UQw6KugTd5Wn5gmYsiw4IrF
   mbcBTzh/zTJ3w4Qnhy8n1YAggnFOiiaKxufTqub2R219ZjX3NnzCsLjHW
   gIuVtmM6Xvp0pchxgkLPCf7DsGDLKE2PU0rD9WzlRLN9IwHAkviMhn17h
   w==;
X-CSE-ConnectionGUID: +k5q0iVmSoG2gv75mKus+g==
X-CSE-MsgGUID: HBjolrfaQLK6Es057+hdQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33681086"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="33681086"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 02:49:02 -0800
X-CSE-ConnectionGUID: 3nMM2JzzS/OnXuj6Kz/hlg==
X-CSE-MsgGUID: mJGnqiG3RsGZ4AQxqoepWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="93599428"
Received: from ccbilbre-mobl3.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.75])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 02:49:00 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH] ASoC: SOF: Intel: hda-dai: Ensure DAI widget is valid during params
Date: Tue,  3 Dec 2024 18:48:53 +0800
Message-ID: <20241203104853.56956-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Each cpu DAI should associate with a widget. However, the topology might
not create the right number of DAI widgets for aggregated amps. And it
will cause NULL pointer deference.
Check that the DAI widget associated with the CPU DAI is valid to prevent
NULL pointer deference due to missing DAI widgets in topologies with
aggregated amps.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 12 ++++++++++++
 sound/soc/sof/intel/hda.c     |  5 +++++
 2 files changed, 17 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index ee274d445515..2a6f821c9e14 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -489,6 +489,12 @@ int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	int ret;
 	int i;
 
+	if (!w) {
+		dev_err(cpu_dai->dev, "%s widget not found, check amp link num in the topology\n",
+			cpu_dai->name);
+		return -EINVAL;
+	}
+
 	ops = hda_dai_get_ops(substream, cpu_dai);
 	if (!ops) {
 		dev_err(cpu_dai->dev, "DAI widget ops not set\n");
@@ -568,6 +574,12 @@ int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	 */
 	for_each_rtd_cpu_dais(rtd, i, dai) {
 		w = snd_soc_dai_get_widget(dai, substream->stream);
+		if (!w) {
+			dev_err(cpu_dai->dev,
+				"%s widget not found, check amp link num in the topology\n",
+				dai->name);
+			return -EINVAL;
+		}
 		ipc4_copier = widget_to_copier(w);
 		memcpy(&ipc4_copier->dma_config_tlv[cpu_dai_id], dma_config_tlv,
 		       sizeof(*dma_config_tlv));
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 01b135068b1f..0a481575bc54 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -63,6 +63,11 @@ static int sdw_params_stream(struct device *dev,
 	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(d, params_data->substream->stream);
 	struct snd_sof_dai_config_data data = { 0 };
 
+	if (!w) {
+		dev_err(dev, "%s widget not found, check amp link num in the topology\n",
+			d->name);
+		return -EINVAL;
+	}
 	data.dai_index = (params_data->link_id << 8) | d->id;
 	data.dai_data = params_data->alh_stream_id;
 	data.dai_node_id = data.dai_data;
-- 
2.43.0

