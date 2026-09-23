Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A50A42E417
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 05:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790141335; cv=none; b=TWHQdlg5fe+H9SxKSrQGeupRvfY855YgzZ9L/TLJUwqq6HfkQuRPWXapTtwHsV6L429PORR3T7eaMvWnvLpmOwF5Ay4QUHpmViUzYylJ1ynlNemaPKCSQvUmXcMTWmffbdpm0xrOzIvL5I488lb7UPwATRpYOvSGFuZI6EWG1dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790141335; c=relaxed/simple;
	bh=3RADGWt7hQmgnAI2tVIG0z+9LN1ShH1vCGfRSX1n6a0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E+DcYkK52CsfTjH5Q/70OfJowo+1CpTj9OnApLc/XCgPoiJleTtcXvBqiJ9V74Oetgj92c9vMOVYl7UxAE6lyJnu0MPpf+DL8mrV3LTEdRaEzrCYrGGN0PJDz+devvtC7C/1sxMvB144KJFOu1/xB8WWg9bKxT/5rKAkLXCbzyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gzMjOHKq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gzMjOHKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790141335; x=1821677335;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3RADGWt7hQmgnAI2tVIG0z+9LN1ShH1vCGfRSX1n6a0=;
  b=gzMjOHKqIwZaYY3bPbF4HvRNEhNI+W9SWcW3Gcez91vz8Xy8t0ZepdaU
   AKpYX5gOUlbytDDGtWE354tH8VlkknuvptcanxJ1dsjALxsLxFPUhpC2n
   6c7kvSTGfSKTBMpKpRlGZAVE36jE31LVdytn8phmX7YKqxu0OGs0jzfSD
   gBM2k8aV40pV5XxKuIwPvvWdx5OXZoLoQevhlsA8jj5g0mZ5Q1+t+Bp2K
   lrfvClVxmsd1yKAGGOwyqEo/qLEViL4CDrLFd+taugWCyXDs6yCrFnMSZ
   IgYi/HF9T5DNBeq8H3Wk3ego8q5YEXg76qI0sp+P+NapI8cA0RnqMi0Hf
   g==;
X-CSE-ConnectionGUID: dPVeNAmyT5aQmCWUGtuuEw==
X-CSE-MsgGUID: 4IO2AAjvSU63pPUHr32Avw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90821728"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="90821728"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 22:28:54 -0700
X-CSE-ConnectionGUID: tKDRzMF3QIS03IIt2tgS5g==
X-CSE-MsgGUID: DtKxnxf+SiiDU4gK5aeYUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="272938536"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 22:28:53 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 4/7] ASoC: Intel: sof-function-topology-lib: skip non-exist file in best_effort mode
Date: Wed, 23 Sep 2026 13:28:29 +0800
Message-ID: <20260923052832.2392758-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923052832.2392758-1-yung-chuan.liao@linux.intel.com>
References: <20260923052832.2392758-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently we will fallback to the monolithic topology if any function
topology is missing. But the monolithic topology may not exist if
best_effort is set. We should load the existing function topologies in
the case.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 .../intel/common/sof-function-topology-lib.c  | 30 +++++++++++--------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/sound/soc/intel/common/sof-function-topology-lib.c b/sound/soc/intel/common/sof-function-topology-lib.c
index 657c7b8e06e8..e1049bb85a13 100644
--- a/sound/soc/intel/common/sof-function-topology-lib.c
+++ b/sound/soc/intel/common/sof-function-topology-lib.c
@@ -121,6 +121,7 @@ int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
 	char platform[SOF_INTEL_PLATFORM_NAME_MAX];
 	unsigned long tplg_mask = 0;
 	int tplg_num = 0;
+	char *tplg_file;
 	int tplg_dev;
 	int ret;
 	int i;
@@ -174,25 +175,28 @@ int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
 		if (tplg_mask & BIT(tplg_dev))
 			continue;
 
-		tplg_mask |= BIT(tplg_dev);
-
-		(*tplg_files)[tplg_num] = get_tplg_filename(card->dev, prefix, platform,
-							    tplg_dev_name, dai_link->id,
-							    tplg_dev);
-		if (!(*tplg_files)[tplg_num])
+		tplg_file = get_tplg_filename(card->dev, prefix, platform, tplg_dev_name,
+					      dai_link->id, tplg_dev);
+		if (!tplg_file)
 			return -ENOMEM;
+
+		/* Check presence of sub-topologies */
+		if (!tplg_files_exist(card->dev, tplg_file)) {
+			devm_kfree(card->dev, tplg_file);
+			if (best_effort)
+				continue;
+
+			return 0;
+		}
+
+		tplg_mask |= BIT(tplg_dev);
+
+		(*tplg_files)[tplg_num] = tplg_file;
 		tplg_num++;
 	}
 
 	dev_dbg(card->dev, "tplg_mask %#lx tplg_num %d\n", tplg_mask, tplg_num);
 
-	/* Check presence of sub-topologies */
-	for (i = 0; i < tplg_num; i++) {
-		if (!tplg_files_exist(card->dev, (*tplg_files)[i]))
-			/* return 0 to use monolithic topology */
-			return 0;
-	}
-
 	return tplg_num;
 }
 EXPORT_SYMBOL_GPL(sof_sdw_get_tplg_files);
-- 
2.43.0

