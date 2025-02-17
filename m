Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8D4216E21
	for <linux-sound@vger.kernel.org>; Mon, 17 Feb 2025 10:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739786858; cv=none; b=U6Bh1vaxF05Da+g923ezi8eVBnV+vkDFTfGvwBMldi9SgDXaLgarXEeaDoGk7JeRJ60mcW4Z8T2v5djEo1AJyeLmFLcJbb547eJXaYU5/5EF2PEOj3Cn2Q6RJAIac1p6ynga2wKoNjENXYWafsRbXoBMTZ7QnJ8pOJQZ5XJ/V3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739786858; c=relaxed/simple;
	bh=KdM2CjudHfmca369zxucwqa0Nt7V9OY/skgNF2PekZU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L8QpDrxID4w/5G/nOtydyYJeERJ2Mjc8Onfj8RaUT+iGWyBgpbfI4uvbiVt5/DkBXxUAH7LTG3bBpDDuk0oNId9em59J/m8NIsj2Hl0xaN17fshtQI/icUFBQzOCgvbd3Jg4mVzVG47ATAg+ZP2fOFB3HH18exXbByxkqdMNcgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EpYtlGdp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EpYtlGdp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739786857; x=1771322857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KdM2CjudHfmca369zxucwqa0Nt7V9OY/skgNF2PekZU=;
  b=EpYtlGdpdPrXAvuFjr4uT4Kq/FjkfSZ07Wmef7JK9L7OsBJ+830va6og
   oKLHVAFNsDXkgUGSSg+ocIjbR3KdktVcCJaAhiTOd0WxMNvyt+H9f4kPN
   pNUjcXEDFkm/hfYXsnJsS9bzeXmUwAtwzUS1nDZz5Vt0JNxNf0f7qD6I5
   UT1/qtC9yZddm8tL7rvdatT0UDgNobCso04y1ZGE6ZtjPGjkoR2LLyoba
   Q7ZFKLT+t5qXBk6oLaChFU/Hntu4dqCvlgCvJFGLrceSSFS1q1q/5kdmv
   /jXN8HorVnW7TJT84zDmtlzuoZayUSDHELNSIupIUsZF5twOwYANWJQa9
   g==;
X-CSE-ConnectionGUID: S11FyjcpScmrJ1lL8VMluA==
X-CSE-MsgGUID: focuatIITrutlj+rYhXJ7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="65818337"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="65818337"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 02:07:37 -0800
X-CSE-ConnectionGUID: AdSZehEZSE2JkfmKjXmeOQ==
X-CSE-MsgGUID: IoM7+6KFSDe58dmM3By0BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118219075"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by fmviesa003.fm.intel.com with ESMTP; 17 Feb 2025 02:07:35 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 09/10] ASoC: Intel: avs: Honor the invert flag for mixer controls
Date: Mon, 17 Feb 2025 11:21:14 +0100
Message-Id: <20250217102115.3539427-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217102115.3539427-1-cezary.rojewski@intel.com>
References: <20250217102115.3539427-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Values for the mute flag represented on the AudioDSP side are inverted.
Check mixer control description and initialize default values
accordingly.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/topology.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 9ef1adb077f4..3c222c352701 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -1943,18 +1943,20 @@ avs_control_load(struct snd_soc_component *comp, int index, struct snd_kcontrol_
 	struct avs_control_data *ctl_data;
 	struct soc_mixer_control *mc;
 	size_t block_size;
-	int ret;
+	int ret, i;
 
 	switch (le32_to_cpu(hdr->type)) {
 	case SND_SOC_TPLG_TYPE_MIXER:
-		tmc = container_of(hdr, typeof(*tmc), hdr);
-		tuples = tmc->priv.array;
-		block_size = le32_to_cpu(tmc->priv.size);
 		break;
 	default:
 		return -EINVAL;
 	}
 
+	mc = (struct soc_mixer_control *)ctmpl->private_value;
+	tmc = container_of(hdr, typeof(*tmc), hdr);
+	tuples = tmc->priv.array;
+	block_size = le32_to_cpu(tmc->priv.size);
+
 	ctl_data = devm_kzalloc(comp->card->dev, sizeof(*ctl_data), GFP_KERNEL);
 	if (!ctl_data)
 		return -ENOMEM;
@@ -1965,8 +1967,13 @@ avs_control_load(struct snd_soc_component *comp, int index, struct snd_kcontrol_
 	if (ret)
 		return ret;
 
-	mc = (struct soc_mixer_control *)ctmpl->private_value;
 	mc->dobj.private = ctl_data;
+	if (tmc->invert) {
+		ctl_data->values[0] = mc->max;
+		for (i = 1; i < mc->num_channels; i++)
+			ctl_data->values[i] = mc->max;
+	}
+
 	return 0;
 }
 
-- 
2.25.1

