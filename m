Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C58180609
	for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 15:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708529037; cv=none; b=LFfmDEj8BLswmZdsDX08gkIBWmpin2+E08tbs+m32m8Z9747fAvcHGmYTvRACELTJAPBG+0DwmUej7LY/AWbg6g5bPbdz+KaZ59JSwPIX+nf19c3QYPfKtds9cWBoI4QM/ECKd0do546Gd7g480XdcS0RBiuecBOw1VhkMe/wq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708529037; c=relaxed/simple;
	bh=v2OUrfB05ibruSdwef5/iHstmtFCVpEQra9U5EyAw3w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k+8hom9+RzynnOrKDNnkLIgeo8furgVVCyuWz9yPIXD36LXio0DnX7uk7IY6XrG0k5cAhrwrE0GShwXjcKmpTc6ra1V+V3PKg42bFRBG+MAv7vPm3TqLgu36Bv7qt0dwsZPMJNNOxHgoX12H4tKWqhuB0o5ASsMpRCUcDxpL3z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=efnBtRZo; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="efnBtRZo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708529036; x=1740065036;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v2OUrfB05ibruSdwef5/iHstmtFCVpEQra9U5EyAw3w=;
  b=efnBtRZoqjRJDWGmEhB5hLfk8HZrKA+O5xLp8c7ihM6wCrMcj0SXHLlx
   1w7Ox4NMYZKgt1WuGtkv3rYOXwD3cVAkkkfxtt2fRtHhWD06Uu4dD0d+U
   oM27UU2wVBEOrL1LLQlAgorKZgzAr7bXD3leOTxKVH/ZY/FSnEQvVyT2D
   kK+C2vkYpNPEYQAINnd2c4eiM4wAWgELdnFKnMGJhzi7G8yWfZ+HNc9pz
   q+gKDujml6C0scdVjAKJJ0t5yNYkgb/coZ4dK4L8Xl5kjnPCQd2UR+ryM
   LEUGGEx1ffeuOCZKAw6G6/BgVig1rMS9fECO2Kziq2qy5/ifHz/7SPGS+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="14104824"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="14104824"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 07:23:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5374285"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 21 Feb 2024 07:23:53 -0800
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
Subject: [PATCH 5/6] ASoC: codecs: rt5640: Simplify mclk initialization
Date: Wed, 21 Feb 2024 16:25:15 +0100
Message-Id: <20240221152516.852353-6-cezary.rojewski@intel.com>
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

rt5640_set_dai_sysclk() is an example of that - clk_set_rate() is not
guarded by IS_ERR().

By utilizing _optional() variant of devm_clk_get() the driver code is
both simplified and more robust. There is no need to remember about
IS_ERR(clk) checks each time mclk is accessed.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt5640.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index c60894327296..c579ead0deec 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -1949,9 +1949,6 @@ static int rt5640_set_bias_level(struct snd_soc_component *component,
 		 * away from ON. Disable the clock in that case, otherwise
 		 * enable it.
 		 */
-		if (IS_ERR(rt5640->mclk))
-			break;
-
 		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_ON) {
 			clk_disable_unprepare(rt5640->mclk);
 		} else {
@@ -2661,9 +2658,9 @@ static int rt5640_probe(struct snd_soc_component *component)
 	u32 val;
 
 	/* Check if MCLK provided */
-	rt5640->mclk = devm_clk_get(component->dev, "mclk");
-	if (PTR_ERR(rt5640->mclk) == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
+	rt5640->mclk = devm_clk_get_optional(component->dev, "mclk");
+	if (IS_ERR(rt5640->mclk))
+		return PTR_ERR(rt5640->mclk);
 
 	rt5640->component = component;
 
-- 
2.25.1

