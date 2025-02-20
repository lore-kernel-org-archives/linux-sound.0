Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA061F2377
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 11:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050102; cv=none; b=pU1zCqwV/sk1oLEVhYQAARuJhc3j7bydxQlI7r23g6ZtEuHJrddpwNpLYC4jqdBw9H2BG2f88KCzcx+Spb87ns7jp7FBWaqwE47Q+1iHbEN63uYB+KyRPIiBjBMLNALZAMbTEMHEWviuTJs1CUpwOKn6Dhx2MgXzqpqgEmjHMpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050102; c=relaxed/simple;
	bh=UlUgJSClFVT0+ncp/Pr2BOJwnmeccPDqrWeife+xx58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WqKqDz4ggSUza/w1MSmDMwoZDPnRLFxbmjb7maoAUd1YapeIO+/hulZr9ERkMb5nG325SLfj23TJEVN5AvB71zLrj4GA1LNi1Fwe3nMzAXwj/oy/rrFBpFY7T16ENnKmB06Ww+H/CIjgnFyZlFtp1DpBIgIjONZMhpORhC1ocTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U3HyHCeU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U3HyHCeU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740050101; x=1771586101;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UlUgJSClFVT0+ncp/Pr2BOJwnmeccPDqrWeife+xx58=;
  b=U3HyHCeU2xzTBiuqQ5Vk+QNDxHUHOfyQqLagCsZyJz68GRr1TVKB+i6o
   1G2x/WLwGUb9tGtDDWPHh4myxSCvhntqRK201+JSzDit3of3QdCYCZkYN
   yXy4GGARiQxTpl7CmEdV3khZyBZNkpCA6s7Y6v0m5aOAZ2kRURhIQecFZ
   FtGwPloRfIzGLRu3uR89TXpiENhF13Vi877Ivi5wERFJPn9Rmie968d81
   CZOb8DcfQOP7ku1SLGL2WzGhAz7Ng1qZqqHn34NDJqxLH5KreAleJW/VV
   jveeEq1K0upIDq80poHUvk3eC6OyOZ8pBs7UmuIZ2D+oXjKe2B5qVSgCP
   w==;
X-CSE-ConnectionGUID: WPGcW/r4SV2uoO9Nagy7Dw==
X-CSE-MsgGUID: ZUbCKZ2BR4ad0+7KARkD6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51808345"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51808345"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 03:15:01 -0800
X-CSE-ConnectionGUID: C7Bx72zFRlm7GSZhsnjErg==
X-CSE-MsgGUID: UAMEe608RE2/IoA2Nm8oDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114865429"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2025 03:14:58 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	oder_chiou@realtek.com,
	flove@realtek.com,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 20/24] ASoC: codecs: rt1015p: Update definition of device_id tables
Date: Thu, 20 Feb 2025 12:26:39 +0100
Message-Id: <20250220112643.3813295-21-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250220112643.3813295-1-cezary.rojewski@intel.com>
References: <20250220112643.3813295-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow PCI-based format (10ECxxxx) for ACPI IDs by adding relevant
entries to the existing table.

While at it, there shall be no comma after the terminator entry and
initializing fields with 0 for statically defined structs is redundant.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt1015p.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt1015p.c b/sound/soc/codecs/rt1015p.c
index 44e7fe3c32da..33917438196f 100644
--- a/sound/soc/codecs/rt1015p.c
+++ b/sound/soc/codecs/rt1015p.c
@@ -133,9 +133,11 @@ MODULE_DEVICE_TABLE(of, rt1015p_device_id);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt1015p_acpi_match[] = {
-	{ "RTL1015", 0},
-	{ "RTL1019", 0},
-	{ },
+	{ "RTL1015" },
+	{ "RTL1019" },
+	{ "10EC1015" },
+	{ "10EC1019" },
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, rt1015p_acpi_match);
 #endif
-- 
2.25.1

