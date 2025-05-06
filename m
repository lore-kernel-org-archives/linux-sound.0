Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A50872600
	for <linux-sound@vger.kernel.org>; Tue,  6 May 2025 11:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746531207; cv=none; b=JfyDUqCcyDmCM/IGSxc73jS7BrYiOsfhQbkmfLybqV5hNjOcajdMf22InVxXdZzlwROgogvvMdhFzuScjIozWTZ/gXcQl3lIphyEY0mjwAu9jnY78zsV+pYqy9NLldrINxjgqQ8LK6XndYyR/utmkQdcSTa28n0NpVUB3mrI2AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746531207; c=relaxed/simple;
	bh=kfd1CYNrLEG3HUdAwQ8bD+0Q7TOhQHi6+/hIvsIOqv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U5hqL563qQyR50SP2gboho1mjpaS9wV6ST+bhpXLfBM9Nm59fFR0sHTSv5e/Eo3hv+nYhMzytQMyMKvEDN5R8aTURpmah4kBcOxK9hFdC42fFMbBdzwqQ0yyiE5a/zfbuRF+FOBpiCRczeYfNuZbnMdvafH9i9JfvvO+jTzOYp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LinG7wQJ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LinG7wQJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746531207; x=1778067207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kfd1CYNrLEG3HUdAwQ8bD+0Q7TOhQHi6+/hIvsIOqv4=;
  b=LinG7wQJ3LJ3+bwpHEYVSldUaBc0a11rZo+meLeJ1YK8akIfodEGpzKf
   fvksnbqHUdMkoJLNth9UdSko1Tpg6KtEO8I38WpRJ6zsWyFsEtGp6s/lh
   4QSkKWwtZKu/vDWhg2r1P/Batqa6Eg5XhGog8BYnrO5TUoKFTc5kfbuEA
   C2Kpuvt5G2e+ZkcMg6GSLRAKR5NWYpKDaEUzbI1dknfyee8xNXhVC4uUW
   /AR+6urX2jBjnIEAS2RUFgbMiUIqjpdP/hxB3KhjfU4l4maHRPAUxqePG
   2Y2jH9FCm4IOq0RrOOJIZfK/viOuAqCLO9OhoV3xYgdxdTFBAvCgx2628
   w==;
X-CSE-ConnectionGUID: eInj3TTmRcio1d0hfNwrtw==
X-CSE-MsgGUID: 7D1NG5WESJOPD5J5lFJdjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48101887"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="48101887"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 04:33:27 -0700
X-CSE-ConnectionGUID: KcrV605DTBmPgGIxiCW1wA==
X-CSE-MsgGUID: 927L+VNeSP+1NcNMCIFjAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="135478491"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.119.31])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 04:33:25 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 1/3] ASoC: SOF: add disable_function_topology flag
Date: Tue,  6 May 2025 19:33:08 +0800
Message-ID: <20250506113311.45487-2-yung-chuan.liao@linux.intel.com>
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

SOF driver will load required function topologies dynamically. However,
we prefer using the monolithic topology. Add a flag to allow user not
using the function topologies.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 include/sound/sof.h      | 1 +
 sound/soc/sof/topology.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 64fd5504cb2b..eddea82c7b5a 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -106,6 +106,7 @@ struct snd_sof_pdata {
 	const char *fw_filename;
 	const char *tplg_filename_prefix;
 	const char *tplg_filename;
+	bool disable_function_topology;
 
 	/* loadable external libraries available under this directory */
 	const char *fw_lib_prefix;
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 5d3ee3a86392..fd80451cb4c0 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2481,7 +2481,8 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 	if (!tplg_files)
 		return -ENOMEM;
 
-	if (sof_pdata->machine && sof_pdata->machine->get_function_tplg_files) {
+	if (!sof_pdata->disable_function_topology && sof_pdata->machine &&
+	    sof_pdata->machine->get_function_tplg_files) {
 		tplg_cnt = sof_pdata->machine->get_function_tplg_files(scomp->card,
 								       sof_pdata->machine,
 								       tplg_filename_prefix,
-- 
2.43.0

