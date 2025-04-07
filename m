Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153FF22D796
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 13:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031263; cv=none; b=tfjWabisKY6yY4/jXQPiZCfA/MWI5rvYYWgwQZdm3NyrphXmshPMfto2yvpY6a1P8H8hvzUhAPkhpGUZeE+KFZVX8LemlN2yg9C/duyS7B8GaWLk/gTOAmTeksi4SIrLGxlnO53Wdm1I5Fatf6TdpmHSp8pxvgYWDl02zRlrbTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031263; c=relaxed/simple;
	bh=rGT2WXPxYmNfZRnHWGu/X/OOhdrqkQssn7SRgxnP7a0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=DTKpBM6686YdJTmMB+9EvMwjd+rxdiHzrAiRK99Re+nOrZVZ3OwkSur7tXsOekkcBcBpq4bom8p9VDKmpZPJ9fuUlfjW6Six6vXj0eTywDnDLFsRvHIb00RfegSUMB4BhY4ksUTpe/aVHaXD7XC6McB4aBsq50ZRXAYPaqet2FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RgZrepm3; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RgZrepm3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744031262; x=1775567262;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rGT2WXPxYmNfZRnHWGu/X/OOhdrqkQssn7SRgxnP7a0=;
  b=RgZrepm38HOL0mNgKfxAWzYoHqVjMVbV2MuarJTu0BdAPeOwzllAES4s
   RyOyBaUH/C4RYQl8hu6mBVQAXSSB09NcwHNb3ffJjzCF8xA9STDwHpDhr
   BNoRkALg+9vQ3EXmA35tvXbiGzMB4cIYU5dgrCmKk2pAxvJwNbc8UcLEZ
   FI3yDI67wZubLkQXqTkFgRvUJKi5BbMHB9k8BTVgpI964uoIi+LfJfeON
   RwcGU3MoDqEa3v9uvyIHiTtrV90OPKC/GlCwenYVyolI9bXgol15FbNbD
   7tLM0zO075FbawHzNBOH4p2Pnafo7ri2w0TJtsLQUsenamLi4GPMQRIqO
   Q==;
X-CSE-ConnectionGUID: n5/MhWv7T+eZPhthqMb92g==
X-CSE-MsgGUID: AOScSmSNQQuNS+x3IgaYYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45305535"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45305535"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:07:40 -0700
X-CSE-ConnectionGUID: pHUaxuTIT3mr5y3z66esNA==
X-CSE-MsgGUID: EmreXK38SkG8ZwGfPxSXIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127707589"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by orviesa009.jf.intel.com with ESMTP; 07 Apr 2025 06:07:38 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH] ASoC: Intel: avs: Constrain path based on BE capabilities
Date: Mon,  7 Apr 2025 15:08:51 +0200
Message-Id: <20250407130851.1726800-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For i2s and DMIC copiers constraint stream capabilities based on
available NHLT configuration. This allows topology to provide generic
configuration that handles more hardware, while filtering unavailable
ones at runtime.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/path.c | 72 ++++++++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/path.h |  5 +++
 sound/soc/intel/avs/pcm.c  | 49 +++++++++++++++++++++++++-
 3 files changed, 125 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index ef0c1d125d66b..cafb8c6198bed 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -115,6 +115,78 @@ avs_path_find_variant(struct avs_dev *adev,
 	return NULL;
 }
 
+static struct acpi_nhlt_config *
+avs_nhlt_config_or_default(struct avs_dev *adev, struct avs_tplg_module *t);
+
+int avs_path_set_constraint(struct avs_dev *adev, struct avs_tplg_path_template *template,
+			    struct snd_pcm_hw_constraint_list *rate_list,
+			    struct snd_pcm_hw_constraint_list *channels_list,
+			    struct snd_pcm_hw_constraint_list *sample_bits_list)
+{
+	struct avs_tplg_path *path_template;
+	unsigned int *rlist, *clist, *slist;
+	size_t i;
+
+	i = 0;
+	list_for_each_entry(path_template, &template->path_list, node)
+		i++;
+
+	rlist = kcalloc(i, sizeof(rlist), GFP_KERNEL);
+	clist = kcalloc(i, sizeof(clist), GFP_KERNEL);
+	slist = kcalloc(i, sizeof(slist), GFP_KERNEL);
+
+	i = 0;
+	list_for_each_entry(path_template, &template->path_list, node) {
+		struct avs_tplg_pipeline *pipeline_template;
+
+		list_for_each_entry(pipeline_template, &path_template->ppl_list, node) {
+			struct avs_tplg_module *module_template;
+
+			list_for_each_entry(module_template, &pipeline_template->mod_list, node) {
+				const guid_t *type = &module_template->cfg_ext->type;
+				struct acpi_nhlt_config *blob;
+
+				if (!guid_equal(type, &AVS_COPIER_MOD_UUID) &&
+				    !guid_equal(type, &AVS_WOVHOSTM_MOD_UUID))
+					continue;
+
+				switch (module_template->cfg_ext->copier.dma_type) {
+				case AVS_DMA_DMIC_LINK_INPUT:
+				case AVS_DMA_I2S_LINK_OUTPUT:
+				case AVS_DMA_I2S_LINK_INPUT:
+					break;
+				default:
+					continue;
+				}
+
+				blob = avs_nhlt_config_or_default(adev, module_template);
+				if (IS_ERR(blob))
+					continue;
+
+				rlist[i] = path_template->fe_fmt->sampling_freq;
+				clist[i] = path_template->fe_fmt->num_channels;
+				slist[i] = path_template->fe_fmt->bit_depth;
+				i++;
+			}
+		}
+	}
+
+	if (i) {
+		rate_list->count = i;
+		rate_list->list = rlist;
+		channels_list->count = i;
+		channels_list->list = clist;
+		sample_bits_list->count = i;
+		sample_bits_list->list = slist;
+	} else {
+		kfree(rlist);
+		kfree(clist);
+		kfree(slist);
+	}
+
+	return i;
+}
+
 static void avs_init_node_id(union avs_connector_node_id *node_id,
 			     struct avs_tplg_modcfg_ext *te, u32 dma_id)
 {
diff --git a/sound/soc/intel/avs/path.h b/sound/soc/intel/avs/path.h
index 7ed7e94e0a566..c65ed84aa8530 100644
--- a/sound/soc/intel/avs/path.h
+++ b/sound/soc/intel/avs/path.h
@@ -69,6 +69,11 @@ int avs_path_reset(struct avs_path *path);
 int avs_path_pause(struct avs_path *path);
 int avs_path_run(struct avs_path *path, int trigger);
 
+int avs_path_set_constraint(struct avs_dev *adev, struct avs_tplg_path_template *template,
+			    struct snd_pcm_hw_constraint_list *rate_list,
+			    struct snd_pcm_hw_constraint_list *channels_list,
+			    struct snd_pcm_hw_constraint_list *sample_bits_list);
+
 int avs_peakvol_set_volume(struct avs_dev *adev, struct avs_path_module *mod,
 			   struct soc_mixer_control *mc, long *input);
 int avs_peakvol_set_mute(struct avs_dev *adev, struct avs_path_module *mod,
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index dac463390da13..b57db62d1b364 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -31,6 +31,10 @@ struct avs_dma_data {
 		struct hdac_ext_stream *host_stream;
 	};
 
+	struct snd_pcm_hw_constraint_list rate_list;
+	struct snd_pcm_hw_constraint_list channels_list;
+	struct snd_pcm_hw_constraint_list sample_bits_list;
+
 	struct work_struct period_elapsed_work;
 	struct snd_pcm_substream *substream;
 };
@@ -74,6 +78,45 @@ void avs_period_elapsed(struct snd_pcm_substream *substream)
 	schedule_work(&data->period_elapsed_work);
 }
 
+static int hw_rule_param_size(struct snd_pcm_hw_params *params, struct snd_pcm_hw_rule *rule);
+static int avs_hw_constraints_init(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_pcm_hw_constraint_list *r, *c, *s;
+	struct avs_tplg_path_template *template;
+	struct avs_dma_data *data;
+	int ret;
+
+	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0)
+		return ret;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	r = &(data->rate_list);
+	c = &(data->channels_list);
+	s = &(data->sample_bits_list);
+
+	template = avs_dai_find_path_template(dai, !rtd->dai_link->no_pcm, substream->stream);
+	ret = avs_path_set_constraint(data->adev, template, r, c, s);
+	if (ret <= 0)
+		return ret;
+
+	ret = snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, r);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS, c);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_SAMPLE_BITS, s);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
@@ -101,7 +144,7 @@ static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 	if (rtd->dai_link->ignore_suspend)
 		adev->num_lp_paths++;
 
-	return 0;
+	return avs_hw_constraints_init(substream, dai);
 }
 
 static void avs_dai_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
@@ -114,6 +157,10 @@ static void avs_dai_shutdown(struct snd_pcm_substream *substream, struct snd_soc
 	if (rtd->dai_link->ignore_suspend)
 		data->adev->num_lp_paths--;
 
+	kfree(data->rate_list.list);
+	kfree(data->channels_list.list);
+	kfree(data->sample_bits_list.list);
+
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
 	kfree(data);
 }

base-commit: 3a0f0a4355df0240485ed62b6bd6afa5b3e689c5
-- 
2.34.1

