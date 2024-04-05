Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD4C15FA9C
	for <linux-sound@vger.kernel.org>; Fri,  5 Apr 2024 09:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712308114; cv=none; b=dY4mVBYtx4An4Tp9GOb2axbyIrZMD63VqOY8aKC9/0saI6i+LyU6Xh/U9WAKhHrvdpWy0byKZQa+D+ziCU8pSNInYZhaZfF8Z6jgwb9j3OPtp0phb7N9QJ82gwQfJLyUORerM6FWuspN409F2dqC/6CiXzstMMETg+pXU5qvmGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712308114; c=relaxed/simple;
	bh=nu1C7rngL8VEfilTEnqoMiTpOUoFjJN8vPw+PIeQe88=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mQ9dzzWT79RSJZsyIxxjarAlPHYVTFPlu8FErDDF8CcxmBGcBmSb9YKswkwY1TwEIHo3Xq2OMl1EX0f54VRAAezNg91kR/680sMvvfFDq2wfsNflhVE+utknyHtmKg8lzdT7LAlkWkXS9idgBNDkujcthBl5vsVhLB4ZPBHH5qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A475mYJP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A475mYJP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712308113; x=1743844113;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nu1C7rngL8VEfilTEnqoMiTpOUoFjJN8vPw+PIeQe88=;
  b=A475mYJP+IfkROh3WHAO/r8DFU+CAhZQy+hiPNv6ArcraZtBiKpbXGGf
   VN1D5Rd6p1aObQ2nkak8qrAevHNBvq85tmrIhfieuhb++QLcDapXQdcir
   5FYefqY8bbookVG1VqEtVbj82vZT/Xd5Ox7Vtof6YzYyi1NrqBNi6BO/+
   7/T1RVUOvSYBsLQU0X7EEvsFVDfaIpSVvCSNG+hGWTJwxBbNlIEaT/Iig
   9TntXjExrzZ2LuYExXC1+5tLP62Y2lb4XvYjs2nYYiGACqNRvz4zQTaUS
   GbWgEL36h7YCyEDWnaKvTghG2daoTWF4XTRO9gF4JDtwDccY3RXaW6/Nm
   Q==;
X-CSE-ConnectionGUID: OA9VMTTSTPiFUxsaUJEHoA==
X-CSE-MsgGUID: iGB1wOt4RBqoTltSpXYF3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7787496"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7787496"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 02:08:33 -0700
X-CSE-ConnectionGUID: wJrbcTmtSC62zFon9zUb0g==
X-CSE-MsgGUID: 0vISobsHTRuHu26OpjfAvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19042463"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 02:08:31 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 13/13] ASoC: Intel: avs: Rule invalid buffer and period sizes out
Date: Fri,  5 Apr 2024 11:09:29 +0200
Message-Id: <20240405090929.1184068-14-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405090929.1184068-1-cezary.rojewski@intel.com>
References: <20240405090929.1184068-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While HDAudio controller supports buffer packets up to 128 bytes low,
audio format shall be taken into consideration when calculating buffer
and period sizes to avoid undesired xruns.

As *_size in ALSA terms means frames (channels times bit-depth-bytes),
hw_rules can calculate minimal buffer and period sizes solely from
sample rate and the number of milliseconds commonly used on the
AudioDSP firmware side.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 405de1d58178..77a7e8f93951 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -457,6 +457,26 @@ static const struct snd_pcm_hw_constraint_list hw_rates = {
 
 const struct snd_soc_dai_ops avs_dai_fe_ops;
 
+static int hw_rule_param_size(struct snd_pcm_hw_params *params, struct snd_pcm_hw_rule *rule)
+{
+	struct snd_interval *interval = hw_param_interval(params, rule->var);
+	struct snd_interval to;
+
+	snd_interval_any(&to);
+	to.integer = interval->integer;
+	to.max = interval->max;
+	/*
+	 * Commonly 2ms buffer size is used in HDA scenarios whereas 4ms is used
+	 * when streaming through GPDMA. Align to the latter to account for both.
+	 */
+	to.min = params_rate(params) / 1000 * 4;
+
+	if (rule->var == SNDRV_PCM_HW_PARAM_PERIOD_SIZE)
+		to.min /= params_periods(params);
+
+	return snd_interval_refine(interval, &to);
+}
+
 static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -492,6 +512,14 @@ static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_so
 	if (ret < 0)
 		goto err;
 
+	/* Adjust buffer and period size based on the audio format. */
+	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, hw_rule_param_size, NULL,
+			    SNDRV_PCM_HW_PARAM_FORMAT, SNDRV_PCM_HW_PARAM_CHANNELS,
+			    SNDRV_PCM_HW_PARAM_RATE, -1);
+	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, hw_rule_param_size, NULL,
+			    SNDRV_PCM_HW_PARAM_FORMAT, SNDRV_PCM_HW_PARAM_CHANNELS,
+			    SNDRV_PCM_HW_PARAM_RATE, -1);
+
 	snd_pcm_set_sync(substream);
 
 	dev_dbg(dai->dev, "%s fe STARTUP tag %d str %p",
-- 
2.25.1

