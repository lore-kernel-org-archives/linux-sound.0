Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EA82032D
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 20:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740199; cv=none; b=KHsZj+Dg6QryOLKkXvhHl7TnbKdLPaXRXh4+2rhUQ9KzWH7kt2ifTuBGmRAU1fAaUjYSKA7i79XXRAutf90PkXZaQugOVc7dpFm/RC+jDCfEUAPDehnfJkmv6ITjOse+KcQfAfrmt2I7TmvPw+ywpGjKdJkRS4WwnrWqGMJb3cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740199; c=relaxed/simple;
	bh=c0/JKtSECKVLTOcJeSdGLCN5OptQ2LL+lmF4XkSVCX4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IhozIYUkTAhL8Hw5PlfYhiu2HYGfvZIg0if3Z/G7SZMhbj/rSjfw/PeK/xYIb/j45PY4V82YCy4cRFo3Ab7xm0FNI+o9tJ4wNTbIwA2pjpCuzby9wFmBdEpFJ/Y8DqHaYizCJkNx5ilo0O2S5OxeBNwUnYUmWALq0SCtmlTkIMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d57E+fCX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d57E+fCX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779740197; x=1811276197;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c0/JKtSECKVLTOcJeSdGLCN5OptQ2LL+lmF4XkSVCX4=;
  b=d57E+fCX4PPm1LgPION8mX6k7VpMNwVFtbwcaomVewBYw+yH03Wgdk1E
   ixOjzXl2JP/1vrpHQ0jZhm97jfZcIN2rU6redDLQvJcS5hypTgBjAabjO
   olAdvbS8OFHcT6fh7wgPYpdBydBf4glfdMieKHOpfJ2/EaptQ+7yUCUUM
   se7SFHquMJJQFFh4DSA6DSlXA8vJqZtL8bCy9muR1iELSPRdVXAASKhiv
   9Ad/5EFQ9MDMDiDjp4JohhWp2ECfKPfpqzx/bMdthp+J5XjgQj4p4t5UZ
   iZWneZe1EQvNna4iSOOZoGFWWwpuCBW6MN5KQGkOYARj6TZ80qT3lKxch
   g==;
X-CSE-ConnectionGUID: Y9T9wUyEQEKm9DAam7HLLg==
X-CSE-MsgGUID: aXec7LOFR9CkzwuU839iSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80745453"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80745453"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 13:16:37 -0700
X-CSE-ConnectionGUID: M//+hf6NR66Dc22VUe7puA==
X-CSE-MsgGUID: mglWbPNKSgexJilQwqlcAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="245981199"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa004.jf.intel.com with ESMTP; 25 May 2026 13:16:36 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	jiada_wang@mentor.com,
	linux-sound@vger.kernel.org,
	peter.ujfalusi@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 3/3] ASoC: codecs: pcm3168a: Drop CONFIG_PM-conditional preproc directive
Date: Mon, 25 May 2026 22:18:01 +0200
Message-Id: <20260525201801.1336936-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260525201801.1336936-1-cezary.rojewski@intel.com>
References: <20260525201801.1336936-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Revert changes done in commit 489db5d94150 ("ASoC: pcm3168a:
Don't disable pcm3168a when CONFIG_PM defined") and add
pm_runtime_status_suspended() check.

The suspended-check addresses regulator's "unbalanced disables"
warning during driver removal even when CONFIG_PM is enabled.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/pcm3168a.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 977b8ed45f2e..4503f2f0724e 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -821,15 +821,6 @@ int pcm3168a_probe(struct device *dev, struct regmap *regmap)
 }
 EXPORT_SYMBOL_GPL(pcm3168a_probe);
 
-static void pcm3168a_disable(struct device *dev)
-{
-	struct pcm3168a_priv *pcm3168a = dev_get_drvdata(dev);
-
-	regulator_bulk_disable(ARRAY_SIZE(pcm3168a->supplies),
-			       pcm3168a->supplies);
-	clk_disable_unprepare(pcm3168a->scki);
-}
-
 void pcm3168a_remove(struct device *dev)
 {
 	struct pcm3168a_priv *pcm3168a = dev_get_drvdata(dev);
@@ -841,10 +832,12 @@ void pcm3168a_remove(struct device *dev)
 	 * The asserted level of GPIO_ACTIVE_LOW is LOW.
 	 */
 	gpiod_set_value_cansleep(pcm3168a->gpio_rst, 1);
+
 	pm_runtime_disable(dev);
-#ifndef CONFIG_PM
-	pcm3168a_disable(dev);
-#endif
+	if (!pm_runtime_status_suspended(dev)) {
+		regulator_bulk_disable(ARRAY_SIZE(pcm3168a->supplies), pcm3168a->supplies);
+		clk_disable_unprepare(pcm3168a->scki);
+	}
 }
 EXPORT_SYMBOL_GPL(pcm3168a_remove);
 
@@ -899,7 +892,8 @@ static int pcm3168a_rt_suspend(struct device *dev)
 
 	regcache_cache_only(pcm3168a->regmap, true);
 
-	pcm3168a_disable(dev);
+	regulator_bulk_disable(ARRAY_SIZE(pcm3168a->supplies), pcm3168a->supplies);
+	clk_disable_unprepare(pcm3168a->scki);
 
 	return 0;
 }
-- 
2.34.1

