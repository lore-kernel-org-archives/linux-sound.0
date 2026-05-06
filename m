Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB1B20CCDC;
	Wed,  6 May 2026 06:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778047248; cv=none; b=sLGNcsXQavNIXE8T967T3F4LshTCVAO0XBg/JKVJuDK7mRrIDo5V3WveDz3624tsgJhbaUJZdrMsqpm2V9r0ml1BMrY1JY2LXDfuzJdBw5bCsgfOZ8K9YsP18bvY5xbW9AB4+zH2l0Mkzhnpc+VRDyYXGsKyRbprhKbuKtPveg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778047248; c=relaxed/simple;
	bh=lUjjwbH/5N/xS84fn3wDg8Ez/aqdZhfJ7OXoQIAouoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MHbnK9KAspD+8OUQLEtOmIPVxx3DZSvuJqv4rjbhjTZm8+vEyobggVLuIIIiaeTvyad1Up6peAJa4omzNKjmBfxq2hp/tuQonMs37seQrh5H/x8kVCjeAzcmba9Ox1UqQkfL/eQI6gsxB+7OWgrunPTmOkmzeEJj6DcJHFKRV80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J1wUaYxq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J1wUaYxq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778047247; x=1809583247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lUjjwbH/5N/xS84fn3wDg8Ez/aqdZhfJ7OXoQIAouoA=;
  b=J1wUaYxqfZrr4zos4gdomDNyhGC2BntmQEB6G98nOVse+ng0QiltJrC2
   FN8mOsFH4PFLztfeX0HqeUM8DUVQFDw6kz3i2Ediwhzk0yliDdnFMdjyr
   m7GTP2SqIOo96/99PSTpDAHPoq43cqrOPo87+1fHHUnSUI3GX3wH4lgg/
   qJLT6JtSQ7dnQ8IO6VO7g+FPJvaQZVr4o8o4qeAPBUAEpWNi0mlfcaCZD
   /3rbmrIGP+MWBfUuFeUcRzPSK172sMt6YI/IT2vbyyvsX2g5in3xDj0bP
   5WjWkvbyiViSN5YA4tJI1Vg4j/7lktWx7cqEhpDIHw15Yp5Cj+7i5TZZ8
   w==;
X-CSE-ConnectionGUID: lF2uRp8gS/Ki4/8xFU//lg==
X-CSE-MsgGUID: QZm7RwoDT22W3UGftQAwtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78984343"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="78984343"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 23:00:47 -0700
X-CSE-ConnectionGUID: PEeeXOnESquVaGvPnrLO0w==
X-CSE-MsgGUID: cf2GKVQ6S2KeK6CZ/do6Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="240011136"
Received: from emr-371.sh.intel.com ([10.67.116.174])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 23:00:44 -0700
From: Baoli Zhang <baoli.zhang@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: "Baoli.Zhang" <baoli.zhang@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v1 3/3] soundwire: use krealloc_array to prevent integer overflow
Date: Wed,  6 May 2026 13:50:37 +0800
Message-ID: <20260506055039.3751028-4-baoli.zhang@linux.intel.com>
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

Replace the use of krealloc() with krealloc_array() in
sdw_add_element_group_count to mitigate the risk of integer overflow during
memory allocation size calculation.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Baoli.Zhang <baoli.zhang@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/soundwire/generic_bandwidth_allocation.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index cd9ccbaf0e46f..3575d69ce1c50 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -308,17 +308,15 @@ static int sdw_add_element_group_count(struct sdw_group *group,
 		unsigned int *rates;
 		unsigned int *lanes;
 
-		rates = krealloc(group->rates,
-				 sizeof(int) * (group->max_size + 1),
-				 GFP_KERNEL);
+		rates = krealloc_array(group->rates, group->max_size + 1,
+				       sizeof(*group->rates), GFP_KERNEL);
 		if (!rates)
 			return -ENOMEM;
 
 		group->rates = rates;
 
-		lanes = krealloc(group->lanes,
-				 sizeof(int) * (group->max_size + 1),
-				 GFP_KERNEL);
+		lanes = krealloc_array(group->lanes, group->max_size + 1,
+				       sizeof(*group->lanes), GFP_KERNEL);
 		if (!lanes)
 			return -ENOMEM;
 
-- 
2.43.0

