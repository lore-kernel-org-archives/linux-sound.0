Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB42550279
	for <linux-sound@vger.kernel.org>; Mon, 13 May 2024 14:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715609240; cv=none; b=kWc1aBewDDaS74RXpHxJKrv6UMYyy78aGqYadI6hgNrLEHLgk1+e9qaY3dQ/q7/6Pfg5UhnmxklI42udSTQ61dgv2e0C1Av6p0dSgzqcRzO1Wx4IaGJpLp6dFaHmd9vDPrQqbR9x7UuDonjyQRHwlfubyyVgPAbLbPJTKvgbrfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715609240; c=relaxed/simple;
	bh=3triDBjcN8cbygxSw7hUo01USZCeCqc6/i2EsF913Ns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VMXry7ZLmDuGUg9mX1O9D/kV4u55qqbvQ5rMEu3V24GaWDXpVLOBhXJ29zvyqcWoPB+8wgXMXJaq2kFhp8vKSVG+Hrf/RZZsd7/Rj2EQe9kiQfxouKsLhI8sNao+Nn35uImSY0OQlr2BNH3egivLIuWOkn2pO1PydIzwrZYt/P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MNIxA5Rv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MNIxA5Rv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715609239; x=1747145239;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3triDBjcN8cbygxSw7hUo01USZCeCqc6/i2EsF913Ns=;
  b=MNIxA5RvcQYpO6qwCg+aULifha8Zit5RwWSqw0nVYm7Aks+T4cmorabi
   zFdS3Scn2BBmQrUFEry7aWqiJcQzjrtSEMgpGpyKu2f851nojw7QEzuA6
   O478NaX51A0a5R/PUja9PDzITeHRgEfCZRxGZ9k58SQpAyAD/KymvaovU
   qBaETSrvqCLzVUZCUnI23ZKMVoLNEUR/gqXMSEadGohmQXz7rkfJCDHye
   AMJTgtfBWZhgPJRfH6EF+4PvRnBRt6vVhjVCb1IM0B/jr0JqJ5FuGmzYg
   FLoxZhBCJOLnlvF2C8n0ugeZdZyVYSIuFBgDx4dORW9ij6Mxe34mt7bQg
   w==;
X-CSE-ConnectionGUID: MNHdilj7Tc+B1LCEJsS8KA==
X-CSE-MsgGUID: rRCbecbhQwuvH5K/HsWfhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11677373"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="11677373"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 07:07:19 -0700
X-CSE-ConnectionGUID: FwhoacINTrqdxwlwo/Lt2A==
X-CSE-MsgGUID: 7jcrMqhrRtiun8l9k+nCkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="30918096"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.18])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 07:07:17 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH] ASoC: Intel: sof_sdw_rt_sdca_jack_common: Use name_prefix for `-sdca` detection
Date: Mon, 13 May 2024 17:07:30 +0300
Message-ID: <20240513140730.27048-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Match against the correct string to decide to add the '-sdca' postfix:
instead of codec_dai->name the correct one is component->name_prefix.

The component->name_prefix is added previously to the card->components as
hs.

Fixes: 9a9d31b149f3 ("ASoC: Intel: sof_sdw_rt_sdca_jack_common: remove -sdca for new codecs")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index 701b0372f59e..012195c50519 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -109,7 +109,7 @@ int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *d
 		return -ENOMEM;
 
 	for (i = 0; i < ARRAY_SIZE(need_sdca_suffix); i++) {
-		if (strstr(codec_dai->name, need_sdca_suffix[i])) {
+		if (strstr(component->name_prefix, need_sdca_suffix[i])) {
 			/* Add -sdca suffix for existing UCMs */
 			card->components = devm_kasprintf(card->dev, GFP_KERNEL,
 							  "%s-sdca", card->components);
-- 
2.45.0

