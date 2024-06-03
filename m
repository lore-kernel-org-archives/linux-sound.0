Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1CE81AC7
	for <linux-sound@vger.kernel.org>; Mon,  3 Jun 2024 10:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717410466; cv=none; b=SgmkB4A+UvO+JyboKOWXw4Vmig9dmaCigEd+RUsT50L4IBSkPRGCz3LfdU4UNxSRqP9VoioYWxUoqJHtpKebEEe9BsBjHDb2d1DxQjo8uaao9Bv/5Aiio+vpPSfdRGMb4OXwS7srmtifwp4jq0Rd0K/vsL7mn5vbyIsQF8Xdf10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717410466; c=relaxed/simple;
	bh=GFqX5r9hkOet5jHFaGDfztMJVt5pXGz34ax6hpUonoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eFSa7zYb+I0+061Ac8Km+Jlb4UMUdZJIZ9X68zskGQH8AqsDs3XZ8RESY+R8/aUhETLq3uGEAxFdGPdnQCHLbZMKcpLDwhrV1kUlYJPWQumgR/Gh0EEshthO+GhS+tJiADOZcvv1JA+ICBzsqj9jCAQBdVdPPGyA7jm0pH5z5WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O5nPzSUm; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O5nPzSUm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717410465; x=1748946465;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GFqX5r9hkOet5jHFaGDfztMJVt5pXGz34ax6hpUonoQ=;
  b=O5nPzSUm3Z0WvqfJzW2VTAVP2yCn6CaK4arKBmwJWrC7YulWdwBr4eZ0
   8Zl3Skh1lS4rguwRZt5zVT8Xa/CkkCGolDP5jzy2mqYk4CZeOcdfR17Uq
   1yiqVUlr2Q2EbG/XpZubVfvQSXxj0CPz7ioWlAHo3da8K2QOyXdV5ThVo
   sJ37cFgAtK+JVg9qJaqVZ5FTa9LD0D2Xi5nlQWb7s/ZasDevbW/j6DaDG
   PA7UH+pdRt6GRHbo/5I6Uvgy6ktK7hegl/fUbGM1qOCBdYWxElVcBIGL0
   LKurDDYmFC0elIK/HDmdQKHZPWLkZVVxURNropfwIkSGQs4JMKNAGUCuM
   g==;
X-CSE-ConnectionGUID: Eg8dRGCVRxu5UobglTGq1A==
X-CSE-MsgGUID: KTiu0PPFSl+mw9zVleQ+CQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="14017229"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="14017229"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 03:27:45 -0700
X-CSE-ConnectionGUID: FptEqLsIStuFGfizIt204Q==
X-CSE-MsgGUID: 1hlQtdrKTgqqzIUQECmNXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="37430047"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa008.jf.intel.com with ESMTP; 03 Jun 2024 03:27:42 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	Jason Montleon <jmontleo@redhat.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 3/4] ASoC: topology: Do not assign fields that are already set
Date: Mon,  3 Jun 2024 12:28:17 +0200
Message-Id: <20240603102818.36165-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240603102818.36165-1-amadeuszx.slawinski@linux.intel.com>
References: <20240603102818.36165-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The routes are allocated with kzalloc(), so all fields are zeroed by
default, skip unnecessary assignments.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 75d9395a18ed4..1db540aaad451 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1072,11 +1072,7 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 			break;
 		}
 
-		/* set to NULL atm for tplg users */
-		route->connected = NULL;
-		if (strnlen(elem->control, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == 0) {
-			route->control = NULL;
-		} else {
+		if (strnlen(elem->control, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) != 0) {
 			route->control = devm_kmemdup(tplg->dev, elem->control,
 						      min(strlen(elem->control),
 							  SNDRV_CTL_ELEM_ID_NAME_MAXLEN),
-- 
2.34.1

