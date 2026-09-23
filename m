Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57A942E41B
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 05:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790141339; cv=none; b=tAESV1KFqTaTgKLoZrDV4dgXlXgTVD8XDjxd0xB3q7+c+V9BYrA24tYO7enwJTEgsof3503rEmIRCw4O4DoFL42El90j0GI8SwvSgH2KnwluaT23z/wxEXOrD8wRL/kxMniSM7CKjljixOifuvVPzwYmHuB7OjKOORp3pWo0+wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790141339; c=relaxed/simple;
	bh=9T4oCM3fN8lfmUH5GQAGQ84+rgVYhvEiqrK3ZEwgLTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WO1+6PTF8zOqB1kgn8lJaxqd72Y3T1cVkCMXd7MFsifR4gj8IB/MFdL8ZFyuuzFVnpogQFj9YK1ScL6+pTmi6mgsrBHkql5UpsLNI073Y76ctQF+AJxtrzUOMS7ALIEY1B0p/0gliHa0OY4CAVHUc1GR5z7hHrf2CydYToi9W54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AeCgHG/q; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AeCgHG/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790141338; x=1821677338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9T4oCM3fN8lfmUH5GQAGQ84+rgVYhvEiqrK3ZEwgLTI=;
  b=AeCgHG/qp6JVjbAJz74hiu3qJSNUXJxeDYyVl0Cq4iU9QJA9N0jd35H5
   nRXFE1+3SdQSUWsFMkyKNAxcwkdbTvsfSSKgIxNfGz3nMWjHArcwM+FGM
   y2QCz5/d46zHcdy96It+2gXmHpI/ZYpXauWvaByjpPH5ie6TomQLTSNCM
   aTs7hfphyrh8j8m+dO2Ru3XHdE+Ab242vMd1SI/JYc1kHS7WxdR2U+w/h
   mmuDWN7dE4FQ4rBUKqbUFErOIwe5hfn4xiBVXLef3r99DzF4ADIQNijSX
   KoyyPnH29fYoSeNh0t2wEWS785lfxL17w1ERnqM4ccVIMtZj+fOoAL34L
   A==;
X-CSE-ConnectionGUID: gv3v7up/QD2ShpTcG1KHKA==
X-CSE-MsgGUID: 2sEbTIlUQ6CClf1isXRwKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90821742"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="90821742"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 22:28:57 -0700
X-CSE-ConnectionGUID: 1oVzY/PcTr6GevkE0YRi0Q==
X-CSE-MsgGUID: 8MrPpiHjSA6097NSW2fJmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="272938563"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 22:28:56 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 6/7] ASoC: Intel: sof-function-topology-lib: add get_function_topology for I2S machines
Date: Wed, 23 Sep 2026 13:28:31 +0800
Message-ID: <20260923052832.2392758-7-yung-chuan.liao@linux.intel.com>
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

Add sof_i2s_get_tplg_files() callback for Intel SOF I2S machines.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 .../intel/common/sof-function-topology-lib.c  | 72 +++++++++++++++++++
 .../intel/common/sof-function-topology-lib.h  |  3 +
 2 files changed, 75 insertions(+)

diff --git a/sound/soc/intel/common/sof-function-topology-lib.c b/sound/soc/intel/common/sof-function-topology-lib.c
index b53f9037feff..57e089f8e721 100644
--- a/sound/soc/intel/common/sof-function-topology-lib.c
+++ b/sound/soc/intel/common/sof-function-topology-lib.c
@@ -260,3 +260,75 @@ int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
 	return tplg_num;
 }
 EXPORT_SYMBOL_GPL(sof_sdw_get_tplg_files);
+
+int sof_i2s_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_mach *mach,
+			   const char *prefix, const char ***tplg_files, bool best_effort)
+{
+	struct snd_soc_acpi_mach_params mach_params = mach->mach_params;
+	struct snd_soc_dai_link *dai_link;
+	char platform[SOF_INTEL_PLATFORM_NAME_MAX];
+	unsigned long tplg_mask = 0;
+	u16 hdmi_in_mask = 0;
+	int tplg_num = 0;
+	char *tplg_file;
+	int tplg_dev;
+	int ret;
+	int i;
+
+	ret = get_platform_name(card, mach, platform);
+	if (ret < 0)
+		return ret;
+
+	for_each_card_prelinks(card, i, dai_link) {
+		char *tplg_dev_name;
+
+		dev_dbg(card->dev, "dai_link %s id %d\n", dai_link->name, dai_link->id);
+		if (strstr(dai_link->name, "SSP")) {
+			if (get_ssp_tplg_dev(card->dev, dai_link, &hdmi_in_mask,
+					     &tplg_dev, &tplg_dev_name) < 0)
+				continue;
+		} else if (strstr(dai_link->name, "dmic")) {
+			if (get_dmic_tplg_dev(card->dev, mach_params.dmic_num,
+					      &tplg_dev, &tplg_dev_name) < 0)
+				continue;
+		} else if (strstr(dai_link->name, "iDisp")) {
+			tplg_dev = TPLG_DEVICE_HDMI;
+			tplg_dev_name = "hdmi-pcm5";
+		} else {
+			/* The dai link is not supported by separated tplg yet */
+			dev_dbg(card->dev,
+				"dai_link %s is not supported by separated tplg yet\n",
+				dai_link->name);
+			if (best_effort)
+				continue;
+
+			return 0;
+		}
+		if (tplg_mask & BIT(tplg_dev))
+			continue;
+
+		tplg_file = get_tplg_filename(card->dev, prefix, platform, tplg_dev_name,
+					      dai_link->id, tplg_dev);
+		if (!tplg_file)
+			return -ENOMEM;
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
+		tplg_num++;
+	}
+
+	dev_dbg(card->dev, "tplg_mask %#lx tplg_num %d\n", tplg_mask, tplg_num);
+
+	return tplg_num;
+}
+EXPORT_SYMBOL_GPL(sof_i2s_get_tplg_files);
diff --git a/sound/soc/intel/common/sof-function-topology-lib.h b/sound/soc/intel/common/sof-function-topology-lib.h
index f358f8c52d78..9755e9770968 100644
--- a/sound/soc/intel/common/sof-function-topology-lib.h
+++ b/sound/soc/intel/common/sof-function-topology-lib.h
@@ -12,4 +12,7 @@
 int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_mach *mach,
 			   const char *prefix, const char ***tplg_files, bool best_effort);
 
+int sof_i2s_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_mach *mach,
+			   const char *prefix, const char ***tplg_files, bool best_effort);
+
 #endif
-- 
2.43.0

