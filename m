Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF8D1DE4C1
	for <linux-sound@vger.kernel.org>; Tue,  4 Feb 2025 05:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738647596; cv=none; b=XxzsEFmyYqNQhckEipqUVf3TRixkMa+GrDGHYmnI2ffwTWrBTj+lFabcleqLFSIqMPcvVNkcHYoFfm/ML0OrvPXH+D5ZQ6IqupMD3Gmg4aXlnXnGZiijGlMGxbccbKtwZyErSNxnOztCwq541GYCR+TMOtiB2Ap94XiXKIrzAL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738647596; c=relaxed/simple;
	bh=X/cukQYC2KXWyOMbu7T3qboOnWBd0qUfGHJVJlYE0vw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XIhxZ1fhx4R/bQJu8NSZOu13IfPYkhyzpsa3pBou4TMeOh11DZfHN8wfIDTFw8tyoiEue22MReF5ENm0OfaUrhaiX/o0fNIoNH5FEmkoTWWuAFGxF1ZLaxuNFwTP9CQYUzeQEr6SNzKQHv3aEfRkyEBgN5auQcHofo4sWihY6SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TiwNhp5O; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TiwNhp5O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738647595; x=1770183595;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X/cukQYC2KXWyOMbu7T3qboOnWBd0qUfGHJVJlYE0vw=;
  b=TiwNhp5OKc9p03o4VUJbpH+cd1BXsM5H/GyQBnf1WJ438LRYB3mEeolo
   xP9Ip3lGoQjgl/49lTdgXdNh+7j+PXqJhWIB4FYQYzXHrD3cXRGmnSPtH
   ZJa2qasDiteQqWlp5G9MctsMiiS22MMnKcO+P9s+evKRcHYLyi7Buw3N7
   QItMDTkVriBM1cxWAuClo4jB+6zorpRNk1oEGkn84XnPhHnv40cdYShsM
   rTuAlgVulfLkC4ISpVAZbVi/25l1eQVmsBU77ChTqRc+gvTAKXp+uo3eD
   PsNEDqZQhuzSgbBf7OWWEmI0oQItdd8edrAUBNZjghAuuK2gCGEs6USp+
   Q==;
X-CSE-ConnectionGUID: BR5g/PN9SOmmAI5BgFdChw==
X-CSE-MsgGUID: LPoB2Th5SsSc6f58Lx0sKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56590580"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="56590580"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 21:39:54 -0800
X-CSE-ConnectionGUID: nFdU4xdFRwK3rLYzci3AWA==
X-CSE-MsgGUID: on/NUoF9SoqTn2YZdZixbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="115492011"
Received: from iweiny-desk3.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.111])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 21:39:53 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 2/3] ASoC: Intel: sof_sdw: Add quirk for Asus Zenbook S14
Date: Tue,  4 Feb 2025 13:39:42 +0800
Message-ID: <20250204053943.93596-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204053943.93596-1-yung-chuan.liao@linux.intel.com>
References: <20250204053943.93596-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Fitzgerald <rf@opensource.cirrus.com>

Asus laptops with sound PCI subsystem ID 1043:1e13 have the DMICs
connected to the host instead of the CS42L43 so need the
SOC_SDW_CODEC_MIC quirk.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 381fae5943fe..683e15b459a1 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -753,6 +753,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 };
 
 static const struct snd_pci_quirk sof_sdw_ssid_quirk_table[] = {
+	SND_PCI_QUIRK(0x1043, 0x1e13, "ASUS Zenbook S14", SOC_SDW_CODEC_MIC),
 	{}
 };
 
-- 
2.43.0

