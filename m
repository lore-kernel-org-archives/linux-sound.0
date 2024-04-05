Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4873215F30D
	for <linux-sound@vger.kernel.org>; Fri,  5 Apr 2024 09:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712308090; cv=none; b=uiIa/cq1lsy5PCduFbAWxsSbfWdnEqQHHN0OIfoHBQzJShTvIpGL7WJ8no0U1zc1/lLz2cpiF1Ktm8FO0vO99QNcqltSxHj4Eu1IKxshu7ED7ACXfqHOM1VUBn6NW2ZwVM5JiKw83ZBD4phd8rfsrl4J5Eg/PI/jXBI1BgYwiIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712308090; c=relaxed/simple;
	bh=ZgplaqLEKcHbdbGlQoIaQOYnXMm8Ux7CECBvT2X2vUw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KhqkgdHzEmdUabW59XbHka25YYEJKxyf974EPq5QfZKYRpHaO7QGcvyOF7K2tzPDSTqB7X3ApWR/EmZcioHGQZQ45KTe7Zi99znE7P5ceCt8Gl5R6ObqqtP3sjeMzPk9tqazBlRUzl0Z/8m9PQHCZV2bZLRcP9dAq14gR3eA8Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gpyNBjzW; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gpyNBjzW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712308090; x=1743844090;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZgplaqLEKcHbdbGlQoIaQOYnXMm8Ux7CECBvT2X2vUw=;
  b=gpyNBjzWv2snsXPeEGtsUXVKhyQgHq99q62otK+fWtdqaH21QM0jJKh/
   ayQrdqVvmkmpS4M8sM+kPHzkSdjzw+AnxILCgJ4sXpL6wokFn7nq5zcs2
   Ma6PDe/7MvnkihcGhNdmCnBcWPl/Pn9W0aaIBNov0E7Cy29pwpQfBFs3T
   Twvviep8qvkZd04LsWYtf+F9LFA1dI8yuqonU/7DAcO9vvPO/5gC395n4
   ZOQITSqHkB8cLkDHKUBOhqNza8Q2W/hFb7lo/TSwz3RySJpah+04RsXu9
   BulsO8B3S2Ewf6EIzZrGShos/6x8JQ3feI+etiNDptazulnf2TU1ZWYfW
   g==;
X-CSE-ConnectionGUID: XZzBu8mjRRKJklgwT0bb9w==
X-CSE-MsgGUID: 8OQOZ+MgT9aQSNGH2EDlZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7787413"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7787413"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 02:08:10 -0700
X-CSE-ConnectionGUID: 7wtEnBnqSO+hGljq1HrA+g==
X-CSE-MsgGUID: nZVPK7doQn+TTQ1mUsHP8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19042415"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 02:08:08 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 02/13] ASoC: Intel: avs: Fix debug-slot offset calculation
Date: Fri,  5 Apr 2024 11:09:18 +0200
Message-Id: <20240405090929.1184068-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405090929.1184068-1-cezary.rojewski@intel.com>
References: <20240405090929.1184068-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For resources with ID other than 0 the current calculus is incorrect.

Fixes: 275b583d047a ("ASoC: Intel: avs: ICL-based platforms support")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/icl.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/icl.c b/sound/soc/intel/avs/icl.c
index 9d9921e1cd4d..3e0716160f5a 100644
--- a/sound/soc/intel/avs/icl.c
+++ b/sound/soc/intel/avs/icl.c
@@ -66,7 +66,7 @@ struct avs_icl_memwnd2 {
 		struct avs_icl_memwnd2_desc slot_desc[AVS_ICL_MEMWND2_SLOTS_COUNT];
 		u8 rsvd[PAGE_SIZE];
 	};
-	u8 slot_array[AVS_ICL_MEMWND2_SLOTS_COUNT][PAGE_SIZE];
+	u8 slot_array[AVS_ICL_MEMWND2_SLOTS_COUNT][SZ_4K];
 } __packed;
 
 #define AVS_ICL_SLOT_UNUSED \
@@ -89,8 +89,7 @@ static int avs_icl_slot_offset(struct avs_dev *adev, union avs_icl_memwnd2_slot_
 
 	for (i = 0; i < AVS_ICL_MEMWND2_SLOTS_COUNT; i++)
 		if (desc[i].slot_id.val == slot_type.val)
-			return offsetof(struct avs_icl_memwnd2, slot_array) +
-			       avs_skl_log_buffer_offset(adev, i);
+			return offsetof(struct avs_icl_memwnd2, slot_array) + i * SZ_4K;
 	return -ENXIO;
 }
 
-- 
2.25.1

