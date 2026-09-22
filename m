Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4304432F2
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069016; cv=none; b=hJcVlKlJCD88225kyLI8CdPyAVX+OtcK5DKzfCW3YJAB+02GkkIGTWF3xcveDviiNNuOmDDxuf9cCoivixT+kYjSfttRrcE50KSqhFyXd0OIRFjqRb+jJbTO13yXZE1HUKXBHWApHJIH+bBC8/TIG/5XTmQ989rRYlMfyhdx+1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069016; c=relaxed/simple;
	bh=YzjuefNe9hcX49mgRPGxIBxs9KL1+AZzILRa4MAgT7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y4UDHl/aEsCDrPDFlIi1/29Mv0zdyQJ58aTQhFaklrB71xCk900s28uV4CknR/BFQpOmGswq5Ugp2+hMxUHgccfk3Gw1+uW2fzZMWmONvM9AEFm7BWVF2dhNKxa6rzHec0jm9KQCPbedK94wXImXdBxP0MFgGh5krKHtW6yro8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V61dVFbM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V61dVFbM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790069015; x=1821605015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YzjuefNe9hcX49mgRPGxIBxs9KL1+AZzILRa4MAgT7M=;
  b=V61dVFbMAefpkmWKKSemt9prVfv4zGmdINOubEFj4S6wNaaN4sbLlNjC
   +a61zLd5kL9VjCKSsSp41cgKdvGuZs1mlNL22hawcq4TfIUFIfUJlGE1J
   pguM3oSXgmKHU3nUd1NXL5Jzc/bLwbBNsrMotBYO8+IMEvvXImxKN3MLG
   xfMIJPJ86skiOSK1SqMLI9Gn7szQ4+Vu+JEgEdxqydtKQaFVOurKVb8E7
   +njHzuWnzLybaYs7wP080hvNR+T25ZRLM2gYJWytPNdpJ0Vlau9rimP+u
   Ds4PaZI2kLqpxPZdVFyi5tfGCSUB/7x2J1vCzEFstNZ2C2ZPYy4MwFo+4
   w==;
X-CSE-ConnectionGUID: NhcD0PyTS5CxuS157v/+Zw==
X-CSE-MsgGUID: mU05X4RiTneLT9yQFiVEXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89576756"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="89576756"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 02:23:35 -0700
X-CSE-ConnectionGUID: XvLWSynmTtitN0Yrzd3tRA==
X-CSE-MsgGUID: akS6Jjk8T62Y78fZXMGNEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="277837562"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 02:23:33 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 6/7] ASoC: Intel: sof-function-topology-lib: add get_function_topology for I2S machines
Date: Tue, 22 Sep 2026 17:23:15 +0800
Message-ID: <20260922092316.2296039-7-yung-chuan.liao@linux.intel.com>
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

Add sof_i2s_get_tplg_files() callback for Intel SOF I2S machines.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 .../intel/common/sof-function-topology-lib.c  | 72 +++++++++++++++++++
 .../intel/common/sof-function-topology-lib.h  |  3 +
 2 files changed, 75 insertions(+)

diff --git a/sound/soc/intel/common/sof-function-topology-lib.c b/sound/soc/intel/common/sof-function-topology-lib.c
index eddccbebb5f4..8f4fdf82d00f 100644
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

