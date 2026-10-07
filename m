Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA29A44AB73
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 08:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363062; cv=none; b=kWzB/bH3oDN+bkP5iT0Vbhav8EP6h2S04hfH+blBee9gD8RX1HpGAUlVXv8G3LE0VhBbKDoCzNRkPcWl8UDq+Jk3kl6S0MB3do/wixoqdCNxCMNu0fH2PfJF+/F9KYjZGGHpkiJ92kFs2BRNQNt3/OJzUX1GtINT9QmmPTPnS4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363062; c=relaxed/simple;
	bh=2B9qJPPbtuJh1BwQ99qew7xb2KO7bBovudbN8wPvV/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m32xoqbmdT8cfPZyryQ2ENKL3fKZCpSDWOe+rH+YFGeXQR4IPOSsLCJpcz2+68y0y0LNYHg83ARzKJMTRdZgJ97S+6XWG5KZIYt/LKj9BIidnZBWgsdpMLI71ONTJ4Q37KezNhNqk4luiylk9xHJO57uvGLpx6AaJNtEd24ld+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aou7dsq0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aou7dsq0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791363062; x=1822899062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2B9qJPPbtuJh1BwQ99qew7xb2KO7bBovudbN8wPvV/U=;
  b=Aou7dsq0JIxusXhYPnxdfxkHV3Z0dZV7raX8A8PLPyx3ilCnk2y3XGpx
   g25ElWDY1cqxhGm+owT6LVJX+bUZNYbEaHKsF+sHpZpoWmuBDfVSEn6Vq
   ZQY+0QJoxjpYfHeAE2aJiWTEW6YJYh2BgT2W/E2gyCMCvFMYpwKXVO9/a
   yp1j7xognZTo7an8T5lGnCgUhXxSkTamonZFdM/IOLhh9yxSBKchlNuzz
   Whtc+lGjoxxioySYoOKxXK1kpnixcMd/qsLRIJEAYjIbV01ncoxwo6rs0
   cq0C/6a84Rru4nmoMLtMaxYdaD/A1CInGZR9hd1WsUVwpK8Rx8skdiq+l
   w==;
X-CSE-ConnectionGUID: gwG3gf1JSh+m4I2X1mGavA==
X-CSE-MsgGUID: 3+x7cPA6Q0aMzeeLqWqwcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="114110"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="114110"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:51:02 -0700
X-CSE-ConnectionGUID: fVdHUQmHQ06vqOifEng4QQ==
X-CSE-MsgGUID: w/MOe+g1RsSXMJZa9DqsNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280670866"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:59 -0700
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
	daniel.baluta@nxp.com
Subject: [PATCH v5 28/28] ASoC: SOF: topology: Add support for decoder and encoder widgets
Date: Wed,  7 Oct 2026 11:49:55 +0300
Message-ID: <20261007084955.1256-29-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
References: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
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
index ebe58d9d9442..092287a4e1f1 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -3604,6 +3604,8 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 		msg = &asrc->msg;
 		break;
 	}
+	case snd_soc_dapm_decoder:
+	case snd_soc_dapm_encoder:
 	case snd_soc_dapm_effect:
 	{
 		struct sof_ipc4_process *process = swidget->private;
@@ -4384,6 +4386,15 @@ static const struct sof_ipc_tplg_widget_ops tplg_ipc4_widget_ops[SND_SOC_DAPM_TY
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
index 4ef72e680390..672879371d14 100644
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
index 145bad472118..750916b57def 100644
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
2.56.0

