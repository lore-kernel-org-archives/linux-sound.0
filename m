Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984DB1D86F2
	for <linux-sound@vger.kernel.org>; Tue,  8 Oct 2024 11:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728385769; cv=none; b=kyaQI3++uChYQym7JyiTmsUObji1jYGhK8Ca4c5hxxvVlZgFQZCR0khcoFLckvJiuZTPldxZngpX3+zrwvLCqrzQeOWOMmJX2TlfVllbEoj8KnABbWtK7G8sfKvjnYrCVFT5EVK5LWd+KhkQJLWYmOr/Re66E9xj4VFYSalG82Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728385769; c=relaxed/simple;
	bh=V5zaArmAk44L94nMRzek+KslVLGOpPS/6drK08DiDjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PHi8FlC0acNpYZTR17SE7Y/T6kHs7yWXZTGvF8peEYoX/q3U0prQ5O7VMtqjnsFTUl7W3OPqOhI3sJXk7qQQa6BJfGoxVO5w+wbx3CvDTgVZoiJmysA0Qp2r9CBEBK7zrwYwaVSqMwmeSEvu0oKFE/qY30Sa6FW0HJ2xQ3rVX9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MepHH7wt; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MepHH7wt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728385768; x=1759921768;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V5zaArmAk44L94nMRzek+KslVLGOpPS/6drK08DiDjQ=;
  b=MepHH7wtSseKiwx70JnwDMYgYgwsDgqx4UtuxXSrWYOlfZMZKKFg4awF
   DJKaxGWxohmQ2G9SIgqOVAxpGE0zhDsv5aRUWz4soL9qwIvZktdJJi4do
   CSRZfyME8iAGGs+I7nGN3BkxS8iPXktCB+yx0D+3ES+/anV+BB+MrVG/n
   m3qnsPey4wVshAM893+2sHm3GmdTOiu5qYxUPSe6weip1hOehIicymv1c
   kHJgW9Kb8mnYIhCI1BsNPMPRANqDWOoalwTTkisOfJ2qnfLc58CnFN2XQ
   vO1GEzURU+FuZ4rxHA/h0+sP5ik0n+YrdZFvrAGajZP/ZPUqscnsoQ+EN
   Q==;
X-CSE-ConnectionGUID: NXAYbpotRMWwsh3CffoThg==
X-CSE-MsgGUID: YYLFzIz/RD+xgRt9rjqppw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="45037003"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="45037003"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 04:09:27 -0700
X-CSE-ConnectionGUID: y6NxwJs6S8SV+FVVw+U27w==
X-CSE-MsgGUID: fPMfMCgoQamsbmrBXWY1uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="80586758"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.49])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 04:09:25 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 5/8] ASoC: SOF: ipc4-topology: Use local variables in sof_ipc4_init_output_audio_fmt()
Date: Tue,  8 Oct 2024 14:09:33 +0300
Message-ID: <20241008110936.22534-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241008110936.22534-1-peter.ujfalusi@linux.intel.com>
References: <20241008110936.22534-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use local variables for available_fmt->output_pin_fmts and
available_fmt->num_output_formats similarly to the input format selection
to make the two functions easier to understand and help with readability.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 31cbb7f620fd..45727c4d5b7e 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1210,19 +1210,19 @@ static int sof_ipc4_init_output_audio_fmt(struct snd_sof_dev *sdev,
 					  u32 out_ref_rate, u32 out_ref_channels,
 					  u32 out_ref_valid_bits)
 {
-	struct sof_ipc4_audio_format *out_fmt;
+	struct sof_ipc4_pin_format *pin_fmts = available_fmt->output_pin_fmts;
+	u32 pin_fmts_size = available_fmt->num_output_formats;
 	bool single_format;
 	int i;
 
-	if (!available_fmt->num_output_formats)
+	if (!pin_fmts_size)
 		return -EINVAL;
 
-	single_format = sof_ipc4_is_single_format(sdev, available_fmt->output_pin_fmts,
-						  available_fmt->num_output_formats);
+	single_format = sof_ipc4_is_single_format(sdev, pin_fmts, pin_fmts_size);
 
 	/* pick the first format if there's only one available or if all formats are the same */
 	if (single_format) {
-		base_config->obs = available_fmt->output_pin_fmts[0].buffer_size;
+		base_config->obs = pin_fmts[0].buffer_size;
 		return 0;
 	}
 
@@ -1230,17 +1230,18 @@ static int sof_ipc4_init_output_audio_fmt(struct snd_sof_dev *sdev,
 	 * if there are multiple output formats, then choose the output format that matches
 	 * the reference params
 	 */
-	for (i = 0; i < available_fmt->num_output_formats; i++) {
+	for (i = 0; i < pin_fmts_size; i++) {
+		struct sof_ipc4_audio_format *fmt = &pin_fmts[i].audio_fmt;
+
 		u32 _out_rate, _out_channels, _out_valid_bits;
 
-		out_fmt = &available_fmt->output_pin_fmts[i].audio_fmt;
-		_out_rate = out_fmt->sampling_frequency;
-		_out_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(out_fmt->fmt_cfg);
-		_out_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(out_fmt->fmt_cfg);
+		_out_rate = fmt->sampling_frequency;
+		_out_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(fmt->fmt_cfg);
+		_out_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(fmt->fmt_cfg);
 
 		if (_out_rate == out_ref_rate && _out_channels == out_ref_channels &&
 		    _out_valid_bits == out_ref_valid_bits) {
-			base_config->obs = available_fmt->output_pin_fmts[i].buffer_size;
+			base_config->obs = pin_fmts[i].buffer_size;
 			return i;
 		}
 	}
-- 
2.47.0

