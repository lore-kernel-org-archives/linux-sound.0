Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886AD2E414;
	Fri,  3 Jul 2026 01:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783041429; cv=none; b=QDAoUZJkCL5+b8brhlH4rTN8z/KITyEerTCx5pjo/0PqbofFumB3hBKwl+iwDVBMkdeTZhghEGQ4pay8z3GtPn6+GoZuVHnvoa2+GT7TT7QrbIPpyb7uPjb5mYHT9m44eTWXQRtVYRY5/+ClVYoPGe0JR1HegRJ5W9kpwcyEckI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783041429; c=relaxed/simple;
	bh=Ds1vpIXZnI1VuWmrVN41mhNHgVZz4avuxvhEk8AOtbA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G4c6jFjaood+whjkEyEsOBGs/SrOJ98uJWdnw5zHJh0uQq2+tpsGWx2+dopjq7SJ8eVK3pFh1rReovL1RuSNmHjXkNkhO6F0HbJX8dIsuOcvO+4v8Ys0P/6Ui/8Kg4zbxt4Cq1CWMPZlT4yc6EJJupQbdAc2uu4tccDIkatwvLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hklCNQmh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hklCNQmh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783041427; x=1814577427;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ds1vpIXZnI1VuWmrVN41mhNHgVZz4avuxvhEk8AOtbA=;
  b=hklCNQmhAKSk9dJYWc5zMkuFl4XRbquIth9iPJTKv/hUW9OjVv2rppZX
   wPj5aRhhs2WG+dYoObdAsCwtC00VPSEAaIjglcO5OZc8FOYy0/07e+6Gb
   GthhEaUe9oOvBEMcrIHuK4tnnmTde2pU/JM+YccKePsotAWF+3Ej1MBZT
   hQYMmSWCj/fjSVSjW2jzE7VFMFlLm4b8kEqMWTljSHYabKNLCogo2KU+/
   8dCgybkHCm0nBIjnJnxuRlWi5J6S2lJq4zSSjYNfYyyafKuPZobpN1de/
   b/zVKzze4L3IgQJmMOTpgt+iW7Wy0p3T5bM3hBtpGFhJaqRW+O/GLkx6R
   g==;
X-CSE-ConnectionGUID: oEbq0/w2TdGGSIp6iWI0oQ==
X-CSE-MsgGUID: LLuRDPc7Siy6gjk3tEkc2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83848660"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="83848660"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 18:17:07 -0700
X-CSE-ConnectionGUID: SXrlGJbAQhi/ZUqD0oGbZA==
X-CSE-MsgGUID: NIAtub8gRM6W7RtP0O7xDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="249641835"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 18:17:05 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH] soundwire: dmi-quirks: add a global ghost list
Date: Fri,  3 Jul 2026 09:16:56 +0800
Message-ID: <20260703011656.2572959-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Not like other ghost devices, the 0x000000D010010500 ADR doesn't belong
to any codec. We should disable it in all devices.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/dmi-quirks.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index 2a98fc8c104d..62cee6e2179d 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -15,6 +15,14 @@ struct adr_remap {
 	u64 remapped_adr;
 };
 
+static const struct adr_remap global_ghost_adr[] = {
+	{
+		0x000000D010010500ull,
+		0x0000000000000000ull
+	},
+	{}
+};
+
 /*
  * Some TigerLake devices based on an initial Intel BIOS do not expose
  * the correct _ADR in the DSDT.
@@ -212,6 +220,7 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
 u64 sdw_dmi_override_adr(struct sdw_bus *bus, u64 addr)
 {
 	const struct dmi_system_id *dmi_id;
+	int i;
 
 	/* check if any address remap quirk applies */
 	dmi_id = dmi_first_match(adr_remap_quirk_table);
@@ -223,10 +232,20 @@ u64 sdw_dmi_override_adr(struct sdw_bus *bus, u64 addr)
 				dev_dbg(bus->dev, "remapped _ADR 0x%llx as 0x%llx\n",
 					addr, map->remapped_adr);
 				addr = map->remapped_adr;
-				break;
+				goto out;
 			}
 		}
 	}
 
+	/* remap the ghost ADRs */
+	for (i = 0; i < ARRAY_SIZE(global_ghost_adr); i++) {
+		if (global_ghost_adr[i].adr == addr) {
+			dev_dbg(bus->dev, "remapped _ADR 0x%llx as 0x%llx\n",
+				addr, global_ghost_adr[i].remapped_adr);
+			addr = global_ghost_adr[i].remapped_adr;
+			break;
+		}
+	}
+out:
 	return addr;
 }
-- 
2.43.0

