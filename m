Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71722032D
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 20:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740197; cv=none; b=ftukU8P9l9dtZlk2QWU475bf+TryILtQ++KKitKIDbAF4TtabO+ad0oga3WUgGF8ippni8UNEiOYsEOA7+GvHNEYkUYFEqBM4fJRjCQaD7MAKNXPsB41sq9Z9N1gCtZPwRE8CfZc9z08uJ7s8qvH9DUlhKfDjCYN+6I6O2ZTmy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740197; c=relaxed/simple;
	bh=ZTxoMKDZZjHpZdJlCgXiveh1iAXREynkV21jf7td9Yk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lug5k8HDysdcjzPCFbyopP88e2WDl6cEJbNDMo0u8FVZBGhk7rwcHYel/qq1olE0b3i3VRyY0mA2bAT67gyaYac4aMDh6L7/fTR6IdUW43qDMrMSSXlkG5PeYYiBfrOQ9LRwAYyG2wyS6ABZcF+waw+yw0x7zZjMqnjp/dvSLlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d0qBN/Be; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d0qBN/Be"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779740196; x=1811276196;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZTxoMKDZZjHpZdJlCgXiveh1iAXREynkV21jf7td9Yk=;
  b=d0qBN/Be0uAmOTumDEJhhBm5IOHPAPsiYtrqoSbWk1eqsiJBj4afDvOb
   g0wvFzEPbAwPfC0qLG1xmh8FjQQHrg653YrJra9/nQx3mEA0cOgqV1vnR
   /epmbymFPnVicC974QiOmuwfMJfcdymJwphzbZZv53iaCJVbh8Rxv3SWx
   GCGOKvn58ucyfXqehICuUyzdQ4viACfHTw1sbocmAgl38Lf8yIvB+SQdm
   nm9qWoMNQhvCW4vO2TPvb0IlPel29WknkWwatppGGxNt5LcGXXtuRkOwQ
   eFFtu1YDeoQvr25xusdXU5V7GbMDKaHKxP8VNcZvet+FDxt23vR9ewsi4
   w==;
X-CSE-ConnectionGUID: 4pLRMl2hSbqKLC1u2ZBsdA==
X-CSE-MsgGUID: H7961RehQfC0HtjtonN5fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80745444"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80745444"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 13:16:35 -0700
X-CSE-ConnectionGUID: YLLmjYc5RAK1Qhy3TMb4eA==
X-CSE-MsgGUID: OMTy+kFaR5y6Oteuzm6oLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="245981191"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa004.jf.intel.com with ESMTP; 25 May 2026 13:16:34 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	jiada_wang@mentor.com,
	linux-sound@vger.kernel.org,
	peter.ujfalusi@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/3] ASoC: codecs: pcm3168a: Drop redundant pm_runtime_idle()
Date: Mon, 25 May 2026 22:18:00 +0200
Message-Id: <20260525201801.1336936-3-cezary.rojewski@intel.com>
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

Device-driver core runs pm_request_idle() right after the probing
sequence already, see __driver_probe_device().

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/pcm3168a.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 7f8d64fb0e57..977b8ed45f2e 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -799,7 +799,6 @@ int pcm3168a_probe(struct device *dev, struct regmap *regmap)
 
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
-	pm_runtime_idle(dev);
 
 	memcpy(pcm3168a->dai_drv, pcm3168a_dais, sizeof(pcm3168a->dai_drv));
 	ret = devm_snd_soc_register_component(dev, &pcm3168a_driver,
-- 
2.34.1

