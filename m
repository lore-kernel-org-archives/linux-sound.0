Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBC238E5DC
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 08:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770193097; cv=none; b=KdosLYbzQzEeh1vA6p4fOvTc7EOh0/4eDPwLvVTRdX0OHuj3uEJRuMQGbi4IZt8x2Srut50p7ZPmv7QH7Cc67FFBXs4/zW1ySKuAi5N637Iu4ePqXREWPB68N11ljPkhrdL/GeJkGfAALpe5brzPD8HBXHvgfmrdgmcaEqx2hxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770193097; c=relaxed/simple;
	bh=uPiEvQ03bEwZnGqioiZ/nhDSDh7a5V2XqtmFUTfkO8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hbh02t5rnCSaPB3gOzTUps7XYz6EeRyknEMLQrOj0A+nR0N2DrHNH+MjmbWW/Tbpos4kYSJh/lQVFll4nKG9BjLL+tgEfjGgi+UI5QimW7wgnGBqhD4joiCNzzWVmGXB6ZHPHcvvAhFlkiLpgCPZJy/GmJ73EAFunfMDkW876xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARyQY5eH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARyQY5eH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770193097; x=1801729097;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uPiEvQ03bEwZnGqioiZ/nhDSDh7a5V2XqtmFUTfkO8o=;
  b=ARyQY5eHHqjkXsZYYMXj/CWOqizxnWIB8V8tYLQvZM/Py0J66lvJ439r
   aY04GE7vI/QguXLBl8mRyDQjn2bu4NSps98ZNSRYwpGAYzmDqDc9PPc2V
   Sf4AB0jd8YD5dkZsT13ecvQV5pF0i135URv4/YGIHnUXizMatOs0WEOCe
   Dz+3s6DeMivEyYB9DC+okQkT97pGfaTPGmL3wbX0Rc9yFdHT4X/RZ1E+l
   ICpbitPoNUP0R9oNo1gT+ldEFd/CmqB6ZpmLIv5oPa57UwHcrJnfwPaQh
   ek6b080ybplnrmBtFNBiQqFAyWxP7ngOM2+S/RzRZZ0FoksBoLH849Ifp
   A==;
X-CSE-ConnectionGUID: toDDzOkTSkCSKRipz522Fg==
X-CSE-MsgGUID: GAkmguG+TYupaBGYdCrx5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="94028500"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="94028500"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:18:12 -0800
X-CSE-ConnectionGUID: ibBM02dXRD+vkcMt+IHpbA==
X-CSE-MsgGUID: DtNWlMfMQZ+Y7EOorEGeaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209893313"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.245])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:18:09 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com,
	mateuszx.redzynia@intel.com
Subject: [PATCH 06/10] ASoC: SOF: ipc4-topology: Add support for process modules with no input pins
Date: Wed,  4 Feb 2026 10:18:29 +0200
Message-ID: <20260204081833.16630-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204081833.16630-1-peter.ujfalusi@linux.intel.com>
References: <20260204081833.16630-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

A tone generator module can be a type of processing module with no input
pins. Adjust the logic to set the reference params for selecting output
format and the basecfg format based on the output format.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 50 +++++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 09aca52e020a..622bffb50a1c 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2753,12 +2753,14 @@ static int sof_ipc4_prepare_process_module(struct snd_sof_widget *swidget,
 	int input_fmt_index = 0;
 	int ret;
 
-	input_fmt_index = sof_ipc4_init_input_audio_fmt(sdev, swidget,
-							&process->base_config,
-							pipeline_params,
-							available_fmt);
-	if (input_fmt_index < 0)
-		return input_fmt_index;
+	if (available_fmt->num_input_formats) {
+		input_fmt_index = sof_ipc4_init_input_audio_fmt(sdev, swidget,
+								&process->base_config,
+								pipeline_params,
+								available_fmt);
+		if (input_fmt_index < 0)
+			return input_fmt_index;
+	}
 
 	/* Configure output audio format only if the module supports output */
 	if (available_fmt->num_output_formats) {
@@ -2767,12 +2769,28 @@ static int sof_ipc4_prepare_process_module(struct snd_sof_widget *swidget,
 		u32 out_ref_rate, out_ref_channels;
 		int out_ref_valid_bits, out_ref_type;
 
-		in_fmt = &available_fmt->input_pin_fmts[input_fmt_index].audio_fmt;
+		if (available_fmt->num_input_formats) {
+			in_fmt = &available_fmt->input_pin_fmts[input_fmt_index].audio_fmt;
 
-		out_ref_rate = in_fmt->sampling_frequency;
-		out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
-		out_ref_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
-		out_ref_type = sof_ipc4_fmt_cfg_to_type(in_fmt->fmt_cfg);
+			out_ref_rate = in_fmt->sampling_frequency;
+			out_ref_channels =
+				SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
+			out_ref_valid_bits =
+				SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
+			out_ref_type = sof_ipc4_fmt_cfg_to_type(in_fmt->fmt_cfg);
+		} else {
+			/* for modules without input formats, use FE params as reference */
+			out_ref_rate = params_rate(fe_params);
+			out_ref_channels = params_channels(fe_params);
+			ret = sof_ipc4_get_sample_type(sdev, fe_params);
+			if (ret < 0)
+				return ret;
+			out_ref_type = (u32)ret;
+
+			out_ref_valid_bits = sof_ipc4_get_valid_bits(sdev, fe_params);
+			if (out_ref_valid_bits < 0)
+				return out_ref_valid_bits;
+		}
 
 		output_fmt_index = sof_ipc4_init_output_audio_fmt(sdev, swidget,
 								  &process->base_config,
@@ -2800,6 +2818,16 @@ static int sof_ipc4_prepare_process_module(struct snd_sof_widget *swidget,
 			if (ret)
 				return ret;
 		}
+
+		/* set base cfg to match the first output format if there are no input formats */
+		if (!available_fmt->num_input_formats) {
+			struct sof_ipc4_audio_format *out_fmt;
+
+			out_fmt = &available_fmt->output_pin_fmts[0].audio_fmt;
+
+			/* copy output format */
+			memcpy(&process->base_config.audio_fmt, out_fmt, sizeof(*out_fmt));
+		}
 	}
 
 	sof_ipc4_dbg_module_audio_format(sdev->dev, swidget, available_fmt,
-- 
2.52.0

