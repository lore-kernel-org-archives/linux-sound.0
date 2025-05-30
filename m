Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E0121C9E4
	for <linux-sound@vger.kernel.org>; Fri, 30 May 2025 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613247; cv=none; b=LdOgfUSBvDJkuGP/9vtzfVEByHwZDR12Dzfgn7j0qspjZrxQNmd/feN8QvCXA0Kn14GeHY/SiyA7IZqYWEXrwS51H+AYeS4r/DBunsXd1V9Mp5zegf1PmcNxoDWBTOaFNeOgeY9s4qimWLs9ytdt7nKEEjskgJRqnOfnoRzKG+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613247; c=relaxed/simple;
	bh=HyVpWR/kW2Il+i2nzp07oOb7F591FbHrmej3u55/gOs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LYUEa63C6jlyYVGkKSjiRNnC4/o55SrK2UkRZfHB9QMVBOYBrOdf2EkKBHCzCRRsKRu1mHvH+3hyt5Bcl4eoKWamHIJKxBi3OanjWhzKRWXZPVWL2Vmf5iiBR08v7UjGlIfrrbY8gfHd6ZV03JJHcSD/Z5e4SWSNNIKHAZsKSgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJdVZgWQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJdVZgWQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748613245; x=1780149245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HyVpWR/kW2Il+i2nzp07oOb7F591FbHrmej3u55/gOs=;
  b=LJdVZgWQrGq+4hDDGhSzSL4YoKWS7akcFReBuM3tnj4WhKx36Sd5wn8D
   TmjxU6PpdAfoYbWhtgvXcjSupIxD32K0UXb+QYoyoRA9UEdHV0L9gdaKL
   1F1srRiiZf/dnBjQGlwBkR8D1X5Xn6YTpMDdOo4hK8roMgTCal0I4mayd
   iiVei6LvDasG4401WTbxpwvynNWBSnD9jOsI1BQw9l6ZckGzoSazRRAR2
   dZKr2VTGYD8fjB/xrcje14CuUxYDxY29cuVGJ+AtdfZI5CHd6VN7KT/0x
   S5L7xNFG1kLdcr9zT1Hrj7/tGuQndrxRNVY9m3McId+QxSZQKvYXDAp8I
   g==;
X-CSE-ConnectionGUID: bf/r02WdRH2lqCPvbKz2Nw==
X-CSE-MsgGUID: nKQGQ2qJRy6f/94xtc3f9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="68256200"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="68256200"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 06:54:05 -0700
X-CSE-ConnectionGUID: ZO9gz1f4SLKKzse3t1D0jA==
X-CSE-MsgGUID: Ck6L7emDSeGFPXrfOoGvlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="174763437"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 30 May 2025 06:54:04 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 6/9] ASoC: Intel: avs: Verify kcalloc() status when setting constraints
Date: Fri, 30 May 2025 16:10:22 +0200
Message-Id: <20250530141025.2942936-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250530141025.2942936-1-cezary.rojewski@intel.com>
References: <20250530141025.2942936-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All memory operations shall be checked.

Fixes: f2f847461fb7 ("ASoC: Intel: avs: Constrain path based on BE capabilities")
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/path.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index ed8f0ea0e10d..e8e6b1c7fc90 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -134,6 +134,8 @@ int avs_path_set_constraint(struct avs_dev *adev, struct avs_tplg_path_template
 	rlist = kcalloc(i, sizeof(*rlist), GFP_KERNEL);
 	clist = kcalloc(i, sizeof(*clist), GFP_KERNEL);
 	slist = kcalloc(i, sizeof(*slist), GFP_KERNEL);
+	if (!rlist || !clist || !slist)
+		return -ENOMEM;
 
 	i = 0;
 	list_for_each_entry(path_template, &template->path_list, node) {
-- 
2.25.1

