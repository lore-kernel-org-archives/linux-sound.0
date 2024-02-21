Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900738005D
	for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 15:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708529034; cv=none; b=VDZLRilmRVTrtbD5LoehhYu1z47Y4BrhuL873oua5QT4+hJJoIbFhcY48o8LE0yS4WUeavC0EhahLRcS18ZI9pJYOXzQF1XBKu0hlIunX0u3rmr72xcCo3DV3QqVOlkqO882GLxbhnFzV+F/0JmifPZziOLmSCx3bARKZJbUkgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708529034; c=relaxed/simple;
	bh=8gAZLk1t2SE3VLe9M+fDd8kW9V6hhS05RvORX1PQ8q8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=miOOJ0XJbk3iia/Fd3SqKqxkcYaQ5nj9F//R1M9KwnFvIenattPnHznCBwiX4yrnHWS+VgcTkyoBto1GrTWQTqB4IvNC4EHPE563lRODHKtgk9nTQeqAOOd2EObZiXJSnd1dLvcVk1dTrpdTgWBUu9eNmInpT+xB+6rYx2OgTCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5ooRKuj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5ooRKuj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708529032; x=1740065032;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8gAZLk1t2SE3VLe9M+fDd8kW9V6hhS05RvORX1PQ8q8=;
  b=g5ooRKujhc9zny2CFWgQFtG0G+Hj/Qnlx3nVH+NL30S/ykSNvVabRSis
   CzhpRViMWLDIHNnx7zNtPXvEoyX9F7XzByU2uX9pY3ni0vxFDp4MeDvLb
   nHkkZK5AwWsWCeylPUFGtuDucsJWrnecNuSSbUB5msyuvVH2w0xdmjf1d
   Z/lIXAUaLdneWuCTOPEjHCAFu76ybp+KCdyQddOoa98i/WyHsiOOExy0G
   2+Jn0oXc4yjlVglrvkzJPsX9fZES08JA4M8inlj79kOvyK0fRzXg6NBuo
   AFUxcbF7PRJZhshgkA75kXAA8RSghkByDoPaRXaRaJL7r3w+UdxCSd46g
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="14104800"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="14104800"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 07:23:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5374265"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 21 Feb 2024 07:23:48 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 3/6] ASoC: codecs: rt5514: Simplify mclk initialization
Date: Wed, 21 Feb 2024 16:25:13 +0100
Message-Id: <20240221152516.852353-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240221152516.852353-1-cezary.rojewski@intel.com>
References: <20240221152516.852353-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Most of clk_xxx() functions do check if provided clk-pointer is
non-NULL. These do not check if the pointer is an error-pointer.
Providing such to a clk_xxx() results in a panic.

By utilizing _optional() variant of devm_clk_get() the driver code is
both simplified and more robust. There is no need to remember about
IS_ERR(clk) checks each time mclk is accessed.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt5514.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt5514.c b/sound/soc/codecs/rt5514.c
index 43fc7814fdde..a8cdc3d6994d 100644
--- a/sound/soc/codecs/rt5514.c
+++ b/sound/soc/codecs/rt5514.c
@@ -1054,9 +1054,6 @@ static int rt5514_set_bias_level(struct snd_soc_component *component,
 
 	switch (level) {
 	case SND_SOC_BIAS_PREPARE:
-		if (IS_ERR(rt5514->mclk))
-			break;
-
 		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_ON) {
 			clk_disable_unprepare(rt5514->mclk);
 		} else {
@@ -1097,9 +1094,9 @@ static int rt5514_probe(struct snd_soc_component *component)
 	struct platform_device *pdev = container_of(component->dev,
 						   struct platform_device, dev);
 
-	rt5514->mclk = devm_clk_get(component->dev, "mclk");
-	if (PTR_ERR(rt5514->mclk) == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
+	rt5514->mclk = devm_clk_get_optional(component->dev, "mclk");
+	if (IS_ERR(rt5514->mclk))
+		return PTR_ERR(rt5514->mclk);
 
 	if (rt5514->pdata.dsp_calib_clk_name) {
 		rt5514->dsp_calib_clk = devm_clk_get(&pdev->dev,
-- 
2.25.1

