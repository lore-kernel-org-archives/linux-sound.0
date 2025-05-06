Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9DC182B4
	for <linux-sound@vger.kernel.org>; Tue,  6 May 2025 11:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746531232; cv=none; b=aZC+++5JjVlONj9jVGf4JCXCQBAisyaY16okk1/RZy2KHSHf8udmK7pCOnbTRLjd5UxT6EntPBo9y3eV5xy59Z7gTZO+Z3zSGaBzS8icw/Bu+h0/O2hWH5yAA0DCTtMUTnc+L+RZv+7MdW1/K7CFV3AWcL7uejQkygmubLsvPoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746531232; c=relaxed/simple;
	bh=EoTVqSBSvlkMuSA9Kb1jEnW8BtyM4ME9lf15d/TqwZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rlf3HwKaMGvBnenDQGhlWqUCAR5NQbec3uubNgT149Nj+z4zyM/afM0Upmtxcrtza8GcrtTVAxkSc8wXpnpyOvCoeSaGW6N7aWsDS5o/T5Mp2nfXx83epdB0ukB2H6AldKgCxOrkJXcUpBw59EZwjcQ+w0oBx47RU/Eahs7iKPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WSEMnoTo; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WSEMnoTo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746531231; x=1778067231;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EoTVqSBSvlkMuSA9Kb1jEnW8BtyM4ME9lf15d/TqwZE=;
  b=WSEMnoTobR+3hFzMlhYJVNcegbxMVfDz4LO2F9dVEDHLfuXckiTiLvZL
   xET3xgaviId7X6jvIo3pl91zPRnTz42wfwHXb6AZYPIk+ulM3kxG8qbNk
   EMopoLBgy1S75bKVJzRyJwnFfh4w51Q8p2yikk5PiSeOML5Q7P0uKZ+kI
   49vFt7Pkbj/9d4B+LVHMp9QEc6+JQGDw/OZtjtsX5c4wsP5TiTouPjI4x
   Az5CzPpQLys0vUBAl01t471EtAixCQk1mMHnrL1XN5UUS5BrlkedibZMh
   BIkngJ2jrZqBmX5ecweHAT7ZUhzi0pyLe0UG1z4vc/Ct4riprtfzb7Izl
   g==;
X-CSE-ConnectionGUID: ymdkWxAETUmugPOb28qzXg==
X-CSE-MsgGUID: oczWx1hIQn+KhQ5DapYTyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48101940"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="48101940"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 04:33:35 -0700
X-CSE-ConnectionGUID: xBHV638iRv+fY3iRKENdFQ==
X-CSE-MsgGUID: uShsLxtsQQ+x86ilZcBIBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="135478532"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.119.31])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 04:33:30 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 3/3] ASoC: SOF: add disable_function_topology module parameter
Date: Tue,  6 May 2025 19:33:10 +0800
Message-ID: <20250506113311.45487-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250506113311.45487-1-yung-chuan.liao@linux.intel.com>
References: <20250506113311.45487-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

User can disable the loading function topology feature.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/topology.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index fd80451cb4c0..2d4e660b19d5 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -19,6 +19,10 @@
 #include "sof-audio.h"
 #include "ops.h"
 
+static bool disable_function_topology;
+module_param(disable_function_topology, bool, 0444);
+MODULE_PARM_DESC(disable_function_topology, "Disable function topology loading");
+
 #define COMP_ID_UNASSIGNED		0xffffffff
 /*
  * Constants used in the computation of linear volume gain
@@ -2481,8 +2485,8 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 	if (!tplg_files)
 		return -ENOMEM;
 
-	if (!sof_pdata->disable_function_topology && sof_pdata->machine &&
-	    sof_pdata->machine->get_function_tplg_files) {
+	if (!sof_pdata->disable_function_topology && !disable_function_topology &&
+	    sof_pdata->machine && sof_pdata->machine->get_function_tplg_files) {
 		tplg_cnt = sof_pdata->machine->get_function_tplg_files(scomp->card,
 								       sof_pdata->machine,
 								       tplg_filename_prefix,
-- 
2.43.0

