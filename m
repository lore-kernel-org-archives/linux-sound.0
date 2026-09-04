Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFDE3803DB
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 07:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507161; cv=none; b=PcO1K/u/k2FaOEWdRpAE5YHFjEU/8ViXwjkNBSYbo9i5rn8XRBqeptk8MImrKG7XLBrvc2Xwg2GsUWcYUDlZsn+6tr3Ml6hytlxHUw5BjxzaHwZyJu3eAnjxvzkHKhk0oeQBNuCqGfBhSFnAPH+reFV9IVcuvTH6E4P7ZlpM5c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507161; c=relaxed/simple;
	bh=i5tEUZ49J/v+xI360H0wqZVG7XM2k2VA6VS81ZDxzCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fNyrcRg+k3kCNC3L+g1pkglw4dR2jqdZYyRJmvLi9TOJWmzlhaVXeaIAA8p+YZeAzz8pClKEt14cu9oJv40lKKYxY8/NVEIS1gpvAWjZyxGUXjtZbh7QFrQL7ZHI8QNJJkl7iY1zXW6+mNgGswpYvfHEAoeN1Qi9ABlRVKy1XrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FiMqyyFt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FiMqyyFt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788507160; x=1820043160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i5tEUZ49J/v+xI360H0wqZVG7XM2k2VA6VS81ZDxzCs=;
  b=FiMqyyFtXBjvAq9XotylR/HaPmF11Zdahm0mf8Pu+oN/96rlgppy7KAO
   xqjUR4FcWnUDm6KvMuCQtHf9MMfEn4w18w4BNm3n8UWpPJ+VK+8DB9RcU
   1XFwIWtamdNsNlT9eyW5IBCG9tzChtUv0Z5XaWjWC2wmABPZkV4IoDYCT
   aUKvfoP1m9uFCVp+LTGY5JVArWR8DmPlxLiDpDH5mSX2RwpeHoEIyq0us
   lstVC2Xe574o3oP5JW2lqUnSaXpjsVLPeZnLdsGQibxnf9W2wl2Fn4nnf
   mxsRSiA+xX0VH/jF78GazD/3FaUx2mQZ+Q45rFF0+cKZdVaSbDeoKHfzK
   A==;
X-CSE-ConnectionGUID: Rqr+7/hUQIGxGLNupmLIuA==
X-CSE-MsgGUID: hi+9I5tYTE2v1vbD8I+jXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="111778134"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="111778134"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:32:40 -0700
X-CSE-ConnectionGUID: ApG8HCesQJKIRUYflFgUDw==
X-CSE-MsgGUID: pz17lTGUQtWdg5YISdCCNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="293480747"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.213])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:32:36 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com,
	Vijendar.Mukunda@amd.com
Subject: [PATCH 23/23] ASoC: SOF: topology: Add support for decoder and encoder widgets
Date: Fri,  4 Sep 2026 10:31:34 +0300
Message-ID: <20260904073134.29648-24-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Decoder and encoder modules fall under process modules in SOF.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Co-developed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/ipc4-topology.c | 11 +++++++++++
 sound/soc/sof/sof-audio.h     |  4 +++-
 sound/soc/sof/topology.c      |  2 ++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 566913025cc7..74a6da9705da 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -3589,6 +3589,8 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 		msg = &asrc->msg;
 		break;
 	}
+	case snd_soc_dapm_decoder:
+	case snd_soc_dapm_encoder:
 	case snd_soc_dapm_effect:
 	{
 		struct sof_ipc4_process *process = swidget->private;
@@ -4361,6 +4363,15 @@ static const struct sof_ipc_tplg_widget_ops tplg_ipc4_widget_ops[SND_SOC_DAPM_TY
 				process_token_list, ARRAY_SIZE(process_token_list),
 				NULL, sof_ipc4_prepare_process_module,
 				NULL},
+	/* for all practical purposes a decoder is like an effect type widget */
+	[snd_soc_dapm_decoder] = {sof_ipc4_widget_setup_comp_process,
+				  sof_ipc4_widget_free_comp_process,
+				  process_token_list, ARRAY_SIZE(process_token_list),
+				  NULL, sof_ipc4_prepare_process_module, NULL},
+	[snd_soc_dapm_encoder] = {sof_ipc4_widget_setup_comp_process,
+				  sof_ipc4_widget_free_comp_process,
+				  process_token_list, ARRAY_SIZE(process_token_list),
+				  NULL, sof_ipc4_prepare_process_module, NULL},
 };
 
 const struct sof_ipc_tplg_ops ipc4_tplg_ops = {
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 9dff4fea628e..b60246fd5869 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -43,7 +43,9 @@
 #define WIDGET_IS_AIF(id) ((id) == snd_soc_dapm_aif_in || (id) == snd_soc_dapm_aif_out)
 #define WIDGET_IS_AIF_OR_DAI(id) (WIDGET_IS_DAI(id) || WIDGET_IS_AIF(id))
 #define WIDGET_IS_COPIER(id) (WIDGET_IS_AIF_OR_DAI(id) || (id) == snd_soc_dapm_buffer)
-#define WIDGET_IS_PROCESS(id) ((id) == snd_soc_dapm_effect)
+#define WIDGET_IS_PROCESS(id) ((id) == snd_soc_dapm_effect ||	\
+			       (id) == snd_soc_dapm_decoder ||	\
+			       (id) == snd_soc_dapm_encoder)
 
 #define SOF_DAI_PARAM_INTEL_SSP_MCLK		0
 #define SOF_DAI_PARAM_INTEL_SSP_BCLK		1
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 8338133899ab..e2cb90133650 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1530,6 +1530,8 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 		list_add(&dai->list, &sdev->dai_list);
 		swidget->private = dai;
 		break;
+	case snd_soc_dapm_decoder:
+	case snd_soc_dapm_encoder:
 	case snd_soc_dapm_effect:
 		/* check we have some tokens - we need at least process type */
 		if (le32_to_cpu(tw->priv.size) == 0) {
-- 
2.55.0

