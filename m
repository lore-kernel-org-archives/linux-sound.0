Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AC3318122
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 10:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755512439; cv=none; b=iHkp2f1lnM8hysk9BXn2LD8afxsiX0kkLjH8B3ePkcd7WowPgrlwUQ8TJbXCUG6k3dLf/kks4R/V6vxEGVN/JnYlMGZpciDUiBV/memTiEfECe2hqLjI/7YCziagB0SaOX+JAHVLXx7YpuV4I5kkeulk+KLwtRw75Oy9eu0dsbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755512439; c=relaxed/simple;
	bh=6PSsvuBvYzhtvIK7XNXzswBJENwrAc0JnugDg8VVV9c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OgzvgdcigQQmirU+ZE1+fFfdY91xu03eVrd2bO6Chn8Ik4JV/I32NtVvXRMyy7Pq+zIE85VT+Quzq4j8pBdtTwA9qpvDuKJ1ECzwuRPFxEyGi4oumbResO3ySsmT3BkUkr8Qd8W3shyKC3N7ZgUrAiIwT5MTJgi0ae/+ThZyVZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lnSrUNJY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lnSrUNJY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755512439; x=1787048439;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6PSsvuBvYzhtvIK7XNXzswBJENwrAc0JnugDg8VVV9c=;
  b=lnSrUNJY1X/AfOv7gTPggtBxtFFj0g8xXWFtnlfV9DMffb1l/XL5ozaL
   9dbYIuOQSfGWpZR6LPBa6X+MB6CRGS0Dr2AG8iGbQdie0hPPYT1AfSEsE
   EMcVSl16cYkFV+6qfScUQG1jTfoCoc5lyP9a/tp3MMRAYd7huMjXR7dds
   oSLPZQijugkS9hfmUigIppR8kl63AKMGHxAqRSpl6QzBQMvTJf4Q0qkBQ
   IMTtSWK2/FtSNqLLuCI2G+QKuQOhSoi2Ehn9HL3rB8JqeuvcVETmKOYzX
   gCcaaKBy5MJzUU9NvovWc/WoMyu2bu/ielNBhbAUlxiNMFdSsQClQciVz
   w==;
X-CSE-ConnectionGUID: DXqAfolSRROEqapPwXpetg==
X-CSE-MsgGUID: gNIS0EvaS9qsRZ3Blno+/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="68825915"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68825915"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 03:20:38 -0700
X-CSE-ConnectionGUID: H1ZHNkWHSOGjx9Qk7hCt0g==
X-CSE-MsgGUID: n8CeZjLMQyOLLyBsUcXs1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166717215"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa006.jf.intel.com with ESMTP; 18 Aug 2025 03:20:37 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 3/4] ASoC: Intel: avs: Do not share the name pointer between components
Date: Mon, 18 Aug 2025 12:41:25 +0200
Message-Id: <20250818104126.526442-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250818104126.526442-1-cezary.rojewski@intel.com>
References: <20250818104126.526442-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

By sharing 'name' directly, tearing down components may lead to
use-after-free errors. Duplicate the name to avoid that.

At the same time, update the order of operations - since commit
cee28113db17 ("ASoC: dmaengine_pcm: Allow passing component name via
config") the framework does not override component->name if set before
invoking the initializer.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 67ce6675eea7..e738deb2d314 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1390,16 +1390,18 @@ int avs_soc_component_register(struct device *dev, const char *name,
 	if (!acomp)
 		return -ENOMEM;
 
-	ret = snd_soc_component_initialize(&acomp->base, drv, dev);
-	if (ret < 0)
-		return ret;
+	acomp->base.name = devm_kstrdup(dev, name, GFP_KERNEL);
+	if (!acomp->base.name)
+		return -ENOMEM;
 
-	/* force name change after ASoC is done with its init */
-	acomp->base.name = name;
 	INIT_LIST_HEAD(&acomp->node);
 
 	drv->use_dai_pcm_id = !obsolete_card_names;
 
+	ret = snd_soc_component_initialize(&acomp->base, drv, dev);
+	if (ret < 0)
+		return ret;
+
 	return snd_soc_add_component(&acomp->base, cpu_dais, num_cpu_dais);
 }
 
-- 
2.25.1

