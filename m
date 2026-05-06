Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3BF309EE9;
	Wed,  6 May 2026 05:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778047176; cv=none; b=IlxwMyLFm1ZdfKLM5KYzB1IRLQUoT9WJE90B7ppx6550zV9tFrfoGQNrDTezdT3rzSSxcQQE4dfiN55RUFh40NYUBkeeUixajq5hbUWGdWGZT3SdYYRUuGjTyhkLOHCO8rgJyIW1beXEJsI+sShmahIVWN02JCtDCS4Iv0r+rLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778047176; c=relaxed/simple;
	bh=VL4DmH3jsiXoPHucbRmxsRNDkiojV3PEV5otulB4XEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OlRQJgg13rEZHBCaCn4Lw7VzZVHXiS727/x3o9437B7sGCWXCH7hOtMLz7dCkfN8C2WIZR8ZhA7G2DuC2wER9Qj6aZpc4tJOu4pq0hCriusVWqy6/aCCZYqKSYl/ZJ4QJNDJ+7ZzD7BrIKzc52HAm9ukVBZ3cV13qS0vCpKPbaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B8TSfxi+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B8TSfxi+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778047176; x=1809583176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VL4DmH3jsiXoPHucbRmxsRNDkiojV3PEV5otulB4XEQ=;
  b=B8TSfxi+/Rs/MeXNZmfr7H2LUGzN9bSXSvwqgwxcs5sgrDWu43GRKsu/
   5JWM0oTZcnkX6FIzcGmHf3/WmwiDnaWZipcfin9DalysQqJcNtUWQdMq3
   d6aq/G3orQgMoWMmK4ALZnYATqLAcYo3XKQpLnGUVK/NH4a3darpzCjSR
   1+FkYPoJwxvg4Ld3f38bYcMu3beeZ8zUPBuYDxfB7oTBInW14pWHMmJV5
   L6GNvm6OdVN+gTOn/3uSq+VFJ0794L+bQrfCmYGerI2WgZZ0uamtfi2AS
   m0Mc/KAV41tmANSCqFBm0AGa2XovggRBLnl1XU46rDJLhy39w5nAJBzOw
   w==;
X-CSE-ConnectionGUID: Am/uwMQlSz27jlxCJkXNMg==
X-CSE-MsgGUID: /xU/F4AiTTG/fObwuMWWQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78983757"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="78983757"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 22:59:35 -0700
X-CSE-ConnectionGUID: ds9m7ps/RsCZmJdbW7L8NA==
X-CSE-MsgGUID: /l4J5SoyR6mg5eTMz5CU4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="240010677"
Received: from emr-371.sh.intel.com ([10.67.116.174])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 22:59:33 -0700
From: Baoli Zhang <baoli.zhang@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: "Baoli.Zhang" <baoli.zhang@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v1 2/3] soundwire: increase group->max_size after allocation
Date: Wed,  6 May 2026 13:50:36 +0800
Message-ID: <20260506055039.3751028-3-baoli.zhang@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260506055039.3751028-1-baoli.zhang@linux.intel.com>
References: <20260506055039.3751028-1-baoli.zhang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Baoli.Zhang" <baoli.zhang@linux.intel.com>

Only update `group->max_size` after both allocations succeed to avoid
leaving the group's state inconsistent if one allocation fails.

Signed-off-by: Baoli.Zhang <baoli.zhang@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/soundwire/generic_bandwidth_allocation.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index f016ad088a1db..cd9ccbaf0e46f 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -308,9 +308,8 @@ static int sdw_add_element_group_count(struct sdw_group *group,
 		unsigned int *rates;
 		unsigned int *lanes;
 
-		group->max_size += 1;
 		rates = krealloc(group->rates,
-				 (sizeof(int) * group->max_size),
+				 sizeof(int) * (group->max_size + 1),
 				 GFP_KERNEL);
 		if (!rates)
 			return -ENOMEM;
@@ -318,12 +317,14 @@ static int sdw_add_element_group_count(struct sdw_group *group,
 		group->rates = rates;
 
 		lanes = krealloc(group->lanes,
-				 (sizeof(int) * group->max_size),
+				 sizeof(int) * (group->max_size + 1),
 				 GFP_KERNEL);
 		if (!lanes)
 			return -ENOMEM;
 
 		group->lanes = lanes;
+
+		group->max_size += 1;
 	}
 
 	group->rates[group->count] = rate;
-- 
2.43.0

