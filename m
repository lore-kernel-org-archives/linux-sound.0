Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30BD2580CA
	for <linux-sound@vger.kernel.org>; Wed, 23 Apr 2025 05:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745387858; cv=none; b=c3wig8AteYzZ6f2qcelvpUJeqC57HIHL/+v9Ip2r10wRUMsvIjQtvWk/YZsPx/dWzTw9xipzEwTulIlPxmRCWlRx13CKBYzmm8mBMlIJBQ5mwJ9RKB0KdF/F8tFsh/KAyJhcb3vDS6ZiOases3cKnwUI/gXBpmnWOf59cwqR2SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745387858; c=relaxed/simple;
	bh=so1kJQ8qLJg8V5eA8HjfkEilAjUNYLvdWwM2O9DjRGA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XKmbUZUSS5BgQXG1NdSpQz9aShFpOQwK5yd1yBeI81XRRWjrr+Xi5juvRGUKZMPMg/ZkwImkXdGsKSrwXQVSrqZw6O229cMLYqYvlVTa+4UM3bINUY1tpscYLo2GnfA+NBznfAdW3yG68nQ2q94UISGEEzVd0ZskZx0raPdwB3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KCTaNiXy; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KCTaNiXy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745387857; x=1776923857;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=so1kJQ8qLJg8V5eA8HjfkEilAjUNYLvdWwM2O9DjRGA=;
  b=KCTaNiXyIbmCna7IQArjlci17+QbKMvOkQ8JrG2hZJRyU2ZPp5zAzVVa
   mRGdfT2eG7N991/5etuK81yrnJHh8Nkv/iZ4E8cx4WUp5pUP+zMEaqAXY
   9kbJxjpr5coC/3I2Ej4tEAS6c7oWqBSBsQ8CvieQUTmCtAD8nRpQOxaN0
   TthdUnWAe3uBvsIDGXoRWQrav9fW25tTssBTD3yAFaygmTURso1uf2G2c
   ClfzRlFUOPGNowK+FxnszW4rbKE7fBOzjGj7FbdhjW2iJrXRdxPFfXoR+
   6j5tn5iWAGRb8KZ9oP6O7SrxaPJii5+9g2rnDiCaM+dQAoIjz1y5aIymu
   A==;
X-CSE-ConnectionGUID: FGmMPsPMRfGyE/Kflfk33w==
X-CSE-MsgGUID: lBY5kcu1SROG6BWII9xgfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="47094278"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="47094278"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 22:57:36 -0700
X-CSE-ConnectionGUID: 5vWUTZ3STAOgpILT2q9zAg==
X-CSE-MsgGUID: uauaJaPeTeCmQl3n98y99w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132206375"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.162])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 22:57:34 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com
Subject: [PATCH] ASoC: soc-acpi-intel-ptl-match: add empty item to ptl_cs42l43_l3[]
Date: Wed, 23 Apr 2025 13:57:22 +0800
Message-ID: <20250423055722.6920-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An empty item is required to terminate the look up loop.

Fixes: ac5b4a24f16f ("ASoC: Intel: soc-acpi-intel-ptl-match: Add cs42l43 support")

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Naveen Manohar <naveen.m@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index 992729582562..a62cb6d47e4c 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -432,7 +432,8 @@ static const struct snd_soc_acpi_link_adr ptl_cs42l43_l3[] = {
 		.mask = BIT(3),
 		.num_adr = ARRAY_SIZE(cs42l43_3_adr),
 		.adr_d = cs42l43_3_adr,
-	}
+	},
+	{}
 };
 
 static const struct snd_soc_acpi_link_adr ptl_rt722_only[] = {
-- 
2.43.0

