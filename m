Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8523C448BA1
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069014; cv=none; b=TKEUbT+KfaIR4o06jHiuUKltFoWVsXQr80LqSjc7+tKM0zSCtTQQjyg6T1gK2kUAIuCI5aSejlo5asijjM+r57GQosJa2lj7ZM1Dlvs0IyxoyDmgAIyWmYOK4l4jQESIbRMUvSPgagfmqEgGgonaapTwBuXv4l1JZo4dQQGx0PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069014; c=relaxed/simple;
	bh=3RADGWt7hQmgnAI2tVIG0z+9LN1ShH1vCGfRSX1n6a0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HRqrxAqEmOZakP+RHd8PPtm1JB7GrAlP2HQaY4tGgCsb8h1PHS3VHUsa36LURbVYYDMMg4GptU22t+hI7FYyukZnDnvGej5FmZksHp5ejLqnIQ7hbrZRiIyNexCXiDU+e9MhCO25jSnbWcHKG8a6ezuN/s6gBFS4iZXqAIxGlRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UEU0+vJ1; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UEU0+vJ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790069012; x=1821605012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3RADGWt7hQmgnAI2tVIG0z+9LN1ShH1vCGfRSX1n6a0=;
  b=UEU0+vJ1YaTEBsdGqbEcm1R1qx3FsJXIEmFmH16NvbFWzNDrZUV9Kl86
   TxiVYPyljetLYa/m1X3I2PJpFl+XNw83dtaaM9nRp4H5nnaEmcgvwBfMu
   TyJ54U+aachZY3TQ+ZeXSZvhjtCp99TF9U8hvu8jz9mN4gq7rQk1Xf8yc
   9zVSQdx4U5sJbjEmI12++QD5gmdAv+SuLsm05Audq/C3aedhTkLIzIxYE
   VyXKPUm9ZrXYmDgf3WNo/zVT+FnOKo9qmcChV/DHNU9Ku23yAGFUdAv44
   QYd33sYjqqKYxdqOI1CDu5W6cQt79obDY4zUzKIm9z8uLw7xoB8YPHaa+
   w==;
X-CSE-ConnectionGUID: kyfnBiQJSX+nNU685ZXhLw==
X-CSE-MsgGUID: mnIBir2gS3G/oO2yGdFK2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89576748"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="89576748"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 02:23:32 -0700
X-CSE-ConnectionGUID: VDhfurZORP+n87hTHYawPA==
X-CSE-MsgGUID: Fh6TOACsR+aj+SbmOPRq7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="277837546"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 02:23:30 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 4/7] ASoC: Intel: sof-function-topology-lib: skip non-exist file in best_effort mode
Date: Tue, 22 Sep 2026 17:23:13 +0800
Message-ID: <20260922092316.2296039-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922092316.2296039-1-yung-chuan.liao@linux.intel.com>
References: <20260922092316.2296039-1-yung-chuan.liao@linux.intel.com>
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

