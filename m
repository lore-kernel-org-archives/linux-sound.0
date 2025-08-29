Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8E830F952
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 10:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756464756; cv=none; b=rMOHSmD5cHBAwoxNji5re9KsExnLPUhcxd3WtlWVaWxswkVuuDCQQgpHD2t9KtsVK0Pd94YhccetRsyEOWs5JM1g6n3rwOtedokuIb6b9m2INbV41xas4kuRueV4q8rBfhRDkwJ5jNPzv/5vXSqr0sjgJ2cWNgl8jfekF6S93tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756464756; c=relaxed/simple;
	bh=KYwtJJam8Jyu332GlLqcSeAXRicpkuqAMLZBEeKiHJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=am1EotEZVL+yPZ4WmVurGmhfoknBPsPl0WKnQWijIfsq7ZpRD7mOGAEsNVXCTf3tzzXmKR62l1mgR0u7LnLF8Wiy8K40i85nTDM9tpxvUZIavwqqdsRmgmRsbHGo0qLcFog1THQkx6Of0iJzjZonaET6mpKMQYb0gI51iNW0MLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/Q3fKAO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/Q3fKAO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756464755; x=1788000755;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KYwtJJam8Jyu332GlLqcSeAXRicpkuqAMLZBEeKiHJU=;
  b=L/Q3fKAOHYpIJGMH4hethw3g4dD18fB1VpwrXfzBytEogiapghB2eDPB
   AqPTj6kx0ByDPyam2T7XnCPw0YxDA4YcHl3UhtSRddsqOre4qS4WsBDPg
   ucJBQ2ctkWID0hAW4W9BE8p+8Pf9muCtwUcQYksowy6LKWEaVRetZXp9Z
   qMxv0rR8XqXzYCS75ew19DEaMAog/0E4jdjzpQPkXZlUo045I2G5y7a5C
   AnQ13YHXvrNBKXL6An9L50tiQwPXpyjtZYMRt1S4pGqbTHB5ikcN6tdbn
   KgKip0KQNQxK2oiBJWOQDsABWnLc5mNjKVrao0SC/qK5bakKiEGcD/KCY
   A==;
X-CSE-ConnectionGUID: TZGCyBgSTRi1m1CighWrjw==
X-CSE-MsgGUID: b5aSWOiSQCmdYwDjWlfKbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="61383253"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="61383253"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 03:52:35 -0700
X-CSE-ConnectionGUID: fphtAKWfQQSr/MLoFYFMyQ==
X-CSE-MsgGUID: f57lQMbpSZmo1QSdi2yiJw==
X-ExtLoop1: 1
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.56])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 03:52:32 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	seppo.ingalsuo@linux.intel.com,
	liam.r.girdwood@intel.com
Subject: [PATCH 3/3] ASoC: SOF: ipc4-topology: Add support for float sample type
Date: Fri, 29 Aug 2025 13:53:05 +0300
Message-ID: <20250829105305.31818-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829105305.31818-1-peter.ujfalusi@linux.intel.com>
References: <20250829105305.31818-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>

This patch adds support for FLOAT_LE ALSA type for playback and
capture for IPC4 systems. Functions sof_ipc4_update_hw_params(),
sof_ipc4_get_valid_bits() and sof_ipc4_get_sample_type()
are updated to handle SOF_IPC4_TYPE_FLOAT and
SNDRV_PCM_FORMAT_FLOAT_LE.

Signed-off-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 47cc76328c23..d934165fda11 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1345,7 +1345,17 @@ static int sof_ipc4_update_hw_params(struct snd_sof_dev *sdev, struct snd_pcm_hw
 			snd_fmt = SNDRV_PCM_FORMAT_S24_LE;
 			break;
 		case 32:
-			snd_fmt = SNDRV_PCM_FORMAT_S32_LE;
+			switch (type) {
+			case SOF_IPC4_TYPE_LSB_INTEGER:
+				snd_fmt = SNDRV_PCM_FORMAT_S32_LE;
+				break;
+			case SOF_IPC4_TYPE_FLOAT:
+				snd_fmt = SNDRV_PCM_FORMAT_FLOAT_LE;
+				break;
+			default:
+				dev_err(sdev->dev, "Unsupported PCM 32-bit IPC4 type %d\n", type);
+				return -EINVAL;
+			}
 			break;
 		default:
 			dev_err(sdev->dev, "invalid PCM valid_bits %d\n", valid_bits);
@@ -1473,6 +1483,8 @@ static int sof_ipc4_get_valid_bits(struct snd_sof_dev *sdev, struct snd_pcm_hw_p
 		return 24;
 	case SNDRV_PCM_FORMAT_S32_LE:
 		return 32;
+	case SNDRV_PCM_FORMAT_FLOAT_LE:
+		return 32;
 	default:
 		dev_err(sdev->dev, "invalid pcm frame format %d\n", params_format(params));
 		return -EINVAL;
@@ -1493,6 +1505,8 @@ static int sof_ipc4_get_sample_type(struct snd_sof_dev *sdev, struct snd_pcm_hw_
 	case SNDRV_PCM_FORMAT_S32_LE:
 	case SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE:
 		return SOF_IPC4_TYPE_LSB_INTEGER;
+	case SNDRV_PCM_FORMAT_FLOAT_LE:
+		return SOF_IPC4_TYPE_FLOAT;
 	default:
 		dev_err(sdev->dev, "invalid pcm sample type %d\n", params_format(params));
 		return -EINVAL;
-- 
2.50.1

