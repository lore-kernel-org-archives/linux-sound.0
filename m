Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EAF2FFDFC;
	Fri, 20 Mar 2026 05:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773985316; cv=none; b=rqXkNCBk8wHKg9bdEdwqI7GZh4/dWPsGMG6vnvwzLInleiPJHrmrzAtrCGhjcm0a/NDdNRRKmROj1mjnCKlatM/h6eRyf49Y8vpEXcEZQ0b2DmLI8UZbnPyk/99zU2vaS8/s2ShcVb92+fYWOaz6ijNavuTk9W3W4/JSyqmMgRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773985316; c=relaxed/simple;
	bh=XFhp6S1cAiqrXnJzQlhjP9WkWfNi2K0bhuJI93iqy4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WUi2YvOoCQEKaY/GP5RZjlCkV0l4VxPNZDcFXAN85YaRD7n7r6ernX++WD1RcXAx748+aCEhcAo+bNnz07THNh0+6nOzMQa3HNDELBKasv/BaaCozQT0dwfQ9qkemINH8BM8FhTKjZNeZbdLzwLwEPvsUFV7iiPlPMZyR0YNmLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lBi/zmtF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lBi/zmtF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773985315; x=1805521315;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XFhp6S1cAiqrXnJzQlhjP9WkWfNi2K0bhuJI93iqy4M=;
  b=lBi/zmtFt62aW2CcfVQuONruH21ySKPyHe+5EJe+urZ+lVFiADPE3KUS
   CYrQpZtrtXJZPl0q3f9Y8lEzSB74lG5eJy0IshfxIO2KEx540DWML5oV3
   JJytyMmcoTU7d70b4ofDX0DGiy2QOUze4QPAxy9mgQq/7JzR5XHY2E3P3
   Um0TlbD5JS2Xwi52OGUZtB5Xc56YNu/ReOPOc36LODIcS2fKrgo8SqkWc
   GbH6Aor14uiDxuCkAXS0Ej7pak0+8DWB5CHmmrW5zvlqzLSjqIk+oTA29
   itS64pv84JO9kTUaGKbXtjyQqLFYkiwkhPybGTzf5IXgDZIfmUuVd/jKS
   Q==;
X-CSE-ConnectionGUID: E8itpISJTNqv9LUpcdD9Vw==
X-CSE-MsgGUID: dg/C7LNbSRKXK29PL5whgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="62629463"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="62629463"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 22:41:54 -0700
X-CSE-ConnectionGUID: Fl1NrjuWRfywsEKwcns+DQ==
X-CSE-MsgGUID: AtPykEvdTTqCVSp2ILPdtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="223404415"
Received: from emr-371.sh.intel.com ([10.67.116.154])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 22:41:52 -0700
From: "Baoli.Zhang" <baoli.zhang@linux.intel.com>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: "Baoli.Zhang" <baoli.zhang@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/3] soundwire: increase group->max_size after allocation
Date: Fri, 20 Mar 2026 13:33:23 +0800
Message-ID: <20260320053324.738100-3-baoli.zhang@linux.intel.com>
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

