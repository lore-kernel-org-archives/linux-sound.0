Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183681BDA85
	for <linux-sound@vger.kernel.org>; Tue,  1 Oct 2024 07:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727766396; cv=none; b=PffY6tWImHj7GWzrMdVixoC0Ngm8hpUUd9f+jJpl3y8xvjGmmdBJEJ6UitmEfCsWJlsTYBVRFe9IJq+u02q6ggltE2fz96uuNHwTt+PRBmGASZ3hM+Q2AYVfOfQDVqSirbPFYmMYkScEXpu1wfp9pmepl4iTAzGguGdm7s6cdCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727766396; c=relaxed/simple;
	bh=3sL6IgCE1ws9iA6hRFiFBk19JDaySIROpKkdZNwYThk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kdDknBffeMkYhOUz+3x88DemFzw5RmRk4ejF8276flMS4qs0c2eWtQ023QVuat5Sj29TWrvGqhMC26/GhyDM/3vCa4Zo4ZubRjHQha3s2EVHJ8lFnv3GrULZ7z7RhX7kiiyfQMdezwbhSmkYx3GKob5tm2J/NPXvicyprPfNWbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VcLx2w1U; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VcLx2w1U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727766395; x=1759302395;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3sL6IgCE1ws9iA6hRFiFBk19JDaySIROpKkdZNwYThk=;
  b=VcLx2w1U6DGe/tGO27ue34jWyU4bhYN2jOHdgx4iLZycym3GOVwEFCV6
   c/Mdy05c4Rzj0thm8EMfQ33OMIKHNBF0xEXtiXLnkL0h9/VJiTVJne05b
   BFjSIkrV8Qly8CbiPzuNHbCZF9x7RgXqmiB8oKmBzaonyKDPK5D50Rx0S
   6WXV5+z+1oIm2kL18BwYQ8F+GDaut4+pJYhaY6NEu50Dd31eGDQFnBno7
   BGOP/So7KF9VauAK8uxiFbbzq9sgFisvxz2XxxwOYOJOx0MEuUknGrOhz
   llMmr30kqRNLb9owzCu1vlCCmPXbk9AxFe/GZ8EGXM+mNGJyXari825KR
   A==;
X-CSE-ConnectionGUID: RTD/wrUvR5WgrfrBobEwZg==
X-CSE-MsgGUID: b0GsVvqGQEKKJKVjUVTmKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="37556052"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="37556052"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 00:06:35 -0700
X-CSE-ConnectionGUID: FKxc1agQTauoSf5XxkuRqA==
X-CSE-MsgGUID: Zadqj8l4TZGfpKjtlyLy7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="78096819"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.119.243])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 00:06:32 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH RESEND 3/4] ALSA/hda: intel-sdw-acpi: simplify sdw-master-count property read
Date: Tue,  1 Oct 2024 15:06:10 +0800
Message-ID: <20241001070611.63288-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241001070611.63288-1-yung-chuan.liao@linux.intel.com>
References: <20241001070611.63288-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

For some reason we used an array of one u8 when the specification
requires a u32.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/hda/intel-sdw-acpi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/hda/intel-sdw-acpi.c b/sound/hda/intel-sdw-acpi.c
index 7a3735e94545..582e761e7b9f 100644
--- a/sound/hda/intel-sdw-acpi.c
+++ b/sound/hda/intel-sdw-acpi.c
@@ -57,7 +57,8 @@ sdw_intel_scan_controller(struct sdw_intel_acpi_info *info)
 {
 	struct acpi_device *adev = acpi_fetch_acpi_dev(info->handle);
 	struct fwnode_handle *fwnode;
-	u8 count, i;
+	unsigned int i;
+	u32 count;
 	int ret;
 
 	if (!adev)
@@ -66,7 +67,7 @@ sdw_intel_scan_controller(struct sdw_intel_acpi_info *info)
 	fwnode = acpi_fwnode_handle(adev);
 
 	/* Found controller, find links supported */
-	ret = fwnode_property_read_u8_array(fwnode, "mipi-sdw-master-count", &count, 1);
+	ret = fwnode_property_read_u32(fwnode, "mipi-sdw-master-count", &count);
 
 	/*
 	 * In theory we could check the number of links supported in
-- 
2.43.0

