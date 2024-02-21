Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C9980609
	for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 15:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708529039; cv=none; b=YdQjKKdCQBQIUtU5f0TcA3qfqI+3sBisu/8VHZ8nePhGzzLUQQp+H2dta9ZWjrzXq2cWwZs6dgKzJZLqTIlIFsKXfPKbhjzqf93d08IxmRCAaUu7on/ADYTDEfF241WKVuZKmE7FTsek3h85pZpkHC80bIbjwUlrsuh5s4NEQNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708529039; c=relaxed/simple;
	bh=gzcWGNL38cfVL/MuMfhSxMmLpqdQ1ceJameavm9K4g8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PlXdrRIzIg4IcTB4VAQ/xt7PZ4pMd8G7aN62YchRH0gac6piPAjZyc4LvnqYaclYFyOMeapB6TSgOm2nwgSC+cTGxTPdZA0iUW/oSexzy0AJgoG94M9cyrsyRRGfT8f+NKXuw6rzQjjp8TO5e6X5pbXZpg2zapfMxUivaMID67Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bKi9YWlC; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKi9YWlC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708529038; x=1740065038;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gzcWGNL38cfVL/MuMfhSxMmLpqdQ1ceJameavm9K4g8=;
  b=bKi9YWlCTib0bfVpdW5FYTZUhvpsFaG4pU6UQ9w63o/W7e3nDFETh/lZ
   HXp0xr6qMG1R00QCld6qLKd0wOezgsOr4I1iJ4bCe5GmDmIseVBjJkX9f
   ko8a9WfUlQWU4vnTGWa4VgMnoP1zOCx/NEI9Q0hVhjtgKqE+U53fNUvQe
   NgUjJDCLHckxjQriTHyc4wXGI0s8jWirMM5D2xgah39VjFu2wK8Z4wVd5
   T/sGABN2PcRyk7vUz9GmwmUMrwzKP4RjwlXYMVJuB+kQs90gYt18BmECq
   D7OluIk+dfs+CvkfnJCbCDVsdq6AKwXBrRRTHFuicSKMImakXYtMDtrFc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="14104831"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="14104831"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 07:23:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5374293"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 21 Feb 2024 07:23:55 -0800
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
Subject: [PATCH 6/6] ASoC: codecs: rt5660: Simplify mclk initialization
Date: Wed, 21 Feb 2024 16:25:16 +0100
Message-Id: <20240221152516.852353-7-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt5660.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt5660.c b/sound/soc/codecs/rt5660.c
index 0cecfd602415..d5c2f0f2df98 100644
--- a/sound/soc/codecs/rt5660.c
+++ b/sound/soc/codecs/rt5660.c
@@ -1079,9 +1079,6 @@ static int rt5660_set_bias_level(struct snd_soc_component *component,
 		snd_soc_component_update_bits(component, RT5660_GEN_CTRL1,
 			RT5660_DIG_GATE_CTRL, RT5660_DIG_GATE_CTRL);
 
-		if (IS_ERR(rt5660->mclk))
-			break;
-
 		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_ON) {
 			clk_disable_unprepare(rt5660->mclk);
 		} else {
@@ -1277,9 +1274,9 @@ static int rt5660_i2c_probe(struct i2c_client *i2c)
 		return -ENOMEM;
 
 	/* Check if MCLK provided */
-	rt5660->mclk = devm_clk_get(&i2c->dev, "mclk");
-	if (PTR_ERR(rt5660->mclk) == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
+	rt5660->mclk = devm_clk_get_optional(&i2c->dev, "mclk");
+	if (IS_ERR(rt5660->mclk))
+		return PTR_ERR(rt5660->mclk);
 
 	i2c_set_clientdata(i2c, rt5660);
 
-- 
2.25.1

