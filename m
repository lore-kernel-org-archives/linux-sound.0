Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8AC2EFD9B;
	Fri, 20 Mar 2026 05:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773985312; cv=none; b=ABVsWi9TyyYcuIYOb34wrns21leVyuO6ihKn70Ad4P6TDKslHfiJMQb8kHWqe4uRueAxDmNlHits1SMvrpwd62GMPSL32KznnhSFiMBJ967gsIGWcaIER0viRlLjHQeTTNTvyxQdB8H34Ti41OBLWsvpLhJehc6TPzfJKj92ZS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773985312; c=relaxed/simple;
	bh=3IAZC9RjujDWWizlWlb5fytLxzNcU5RznP5JQz9VVQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PXLxKIMiTMQxDMndjHEmAfxa2A43kzvssISR2MymADq5xfBqP9VNLxyKVKw2JueN+C5o9JDxeP2ur2hZAtD4VX/m7t0qEk+8YaNRMG7ni54WLKdN+rtKCOhPgK079WDtyBFuoqtjNpN/tIOxPlsyrfzEmfV8jKF28qdaxaRQ0Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ktkU0LYT; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ktkU0LYT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773985311; x=1805521311;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3IAZC9RjujDWWizlWlb5fytLxzNcU5RznP5JQz9VVQU=;
  b=ktkU0LYTFox+jpGCojK2ggk8MzcYHFvONzxCIEkrq5Rsy2x+JsUpTrv4
   i9k48EATURpyGVblZp9B05nQTMb1/2IAKvdfIOTCNYNstDBGAIUxKyMx9
   ptMXdYIi5IbIjdVF0CtYXS1uZG6JPdxvFlmvmomG05obscEHKcutD5+oG
   ptJHcDC4ytiwYCErxe7VvYYrSewo7BNfTZHUn/CG3SLmMWYjwUrLdd3cz
   Cuk5Z/nfysauu7pPSvo2lM8WbctihOujHYYQQXrWkM+xPmS+MasP3zUQT
   cm+ZCsDOvU739FCfnibnDPY6nk0zxvsErUuw+jX/AW/bQuyUjed7qm/Lb
   g==;
X-CSE-ConnectionGUID: v2JR1RFxTM2OMaqIXSVmRA==
X-CSE-MsgGUID: Qv2P+jA0RWSkVAX5JP7qZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="62629458"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="62629458"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 22:41:51 -0700
X-CSE-ConnectionGUID: nkVdoFzmQIC/w5XpA7oOAg==
X-CSE-MsgGUID: I8yN47diR8+nGKpaYeoO2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="223404412"
Received: from emr-371.sh.intel.com ([10.67.116.154])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 22:41:48 -0700
From: "Baoli.Zhang" <baoli.zhang@linux.intel.com>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: "Baoli.Zhang" <baoli.zhang@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/3] soundwire: fix bug in sdw_add_element_group_count found by syzkaller
Date: Fri, 20 Mar 2026 13:33:22 +0800
Message-ID: <20260320053324.738100-2-baoli.zhang@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320053324.738100-1-baoli.zhang@linux.intel.com>
References: <20260320053324.738100-1-baoli.zhang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original implementation caused an out-of-bounds memory access
in the sdw_add_element_group_count for-loop when i == num.

for (i = 0; i <= num; i++) {
    if (rate == group->rates[i] && lane == group->lanes[i])
        ...

To fix this error, the function now checks for existing rate/lane
entries in the group(a function parameter) using a for-loop before
adding them.

No functional changes apart from this fix.

Fixes: 9026118f20e2 ("soundwire: Add generic bandwidth allocation algorithm")
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Baoli.Zhang <baoli.zhang@linux.intel.com>
---
 .../soundwire/generic_bandwidth_allocation.c  | 47 +++++++++----------
 1 file changed, 22 insertions(+), 25 deletions(-)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index fb3970e12dac9..f016ad088a1db 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -299,39 +299,36 @@ static int sdw_add_element_group_count(struct sdw_group *group,
 	int num = group->count;
 	int i;
 
-	for (i = 0; i <= num; i++) {
+	for (i = 0; i < num; i++) {
 		if (rate == group->rates[i] && lane == group->lanes[i])
-			break;
-
-		if (i != num)
-			continue;
-
-		if (group->count >= group->max_size) {
-			unsigned int *rates;
-			unsigned int *lanes;
+			return 0;
+	}
 
-			group->max_size += 1;
-			rates = krealloc(group->rates,
-					 (sizeof(int) * group->max_size),
-					 GFP_KERNEL);
-			if (!rates)
-				return -ENOMEM;
+	if (group->count >= group->max_size) {
+		unsigned int *rates;
+		unsigned int *lanes;
 
-			group->rates = rates;
+		group->max_size += 1;
+		rates = krealloc(group->rates,
+				 (sizeof(int) * group->max_size),
+				 GFP_KERNEL);
+		if (!rates)
+			return -ENOMEM;
 
-			lanes = krealloc(group->lanes,
-					 (sizeof(int) * group->max_size),
-					 GFP_KERNEL);
-			if (!lanes)
-				return -ENOMEM;
+		group->rates = rates;
 
-			group->lanes = lanes;
-		}
+		lanes = krealloc(group->lanes,
+				 (sizeof(int) * group->max_size),
+				 GFP_KERNEL);
+		if (!lanes)
+			return -ENOMEM;
 
-		group->rates[group->count] = rate;
-		group->lanes[group->count++] = lane;
+		group->lanes = lanes;
 	}
 
+	group->rates[group->count] = rate;
+	group->lanes[group->count++] = lane;
+
 	return 0;
 }
 
-- 
2.43.0

