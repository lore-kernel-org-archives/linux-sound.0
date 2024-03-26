Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9922D13C9A9
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469135; cv=none; b=YAQuNJKa/wztdxKc2n3t5mtNa0MSyul3o/p+PyK3Kg+VXmto2wPgSOzgzByvVGBg2GLHZVhORLC4dC19zUsn5O4S/wrQzeIXa8a8EhtN2tcII7d2WDf9N6DRo5tsCoearT4iwCs3JkDqBVbULeLLZhMF8YvkAIi1YKkNqmhDxPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469135; c=relaxed/simple;
	bh=NdCG1hXCdJ2Yk3G4mstPgE3sClduDXEn2se54Xajods=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i8bWpl9m1OCGzKcy48EPWBcDlzzNpVuJ/BLS9IJAbxYSLesdfGHKOyFGMmb+lhblw5tkgz6T0WaqAYK6OR+SwCPmJKFQZZQZ4B7/+59SsiWlkO0KKRe77F1AE2m2t6lpETVuBrflnqABjL4tzItWCouhPKK0a0TGJEv1njSSffE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MJ8OvZrN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MJ8OvZrN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469133; x=1743005133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NdCG1hXCdJ2Yk3G4mstPgE3sClduDXEn2se54Xajods=;
  b=MJ8OvZrNCiiBDqYexN8vkpbZQXTN+uNZ0HP5JS2c9ZjmemXhZj9oYeqm
   TR/eFx0V3EqgUhjbJQL5xBtk0TpxmhIOEaqwamRP50bNDZXtu9QbJABPP
   FVWI4ZYX4sf8K3AGl51+Sf1JBchIj+Ria1uNqPnMW0ymGLfIT7FCaxcU/
   8sxRulou/yc12G8aE+aD9ro1T/E46wh7gQDJ5ZWGAcSulDqLzh/1RFxAi
   wkeLjzN2u8wQuzHnK3SOuTmdIZjhSSvqjzVfVepvLm4ijk/OvxlP8/jM5
   O30RTKFbBXxjv8XQnrZ6K9UGPzpiNYAvVcib33d9a6t5kp77AJm2GJPmc
   g==;
X-CSE-ConnectionGUID: +i9HqUrtTX2xKkQFApLXSw==
X-CSE-MsgGUID: QY1bFc9mQW2A7MgQPnIMiw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260426"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260426"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482274"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Balamurugan C <balamurugan.c@intel.com>,
	Chao Song <chao.song@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 15/34] ASoC: Intel: soc-acpi-intel-arl-match: Add rt711 sdca codec support
Date: Tue, 26 Mar 2024 11:04:10 -0500
Message-Id: <20240326160429.13560-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Balamurugan C <balamurugan.c@intel.com>

Adding rt711 sdca codec support for arl boards.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Balamurugan C <balamurugan.c@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-arl-match.c   | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index e52797aae6e6..79d26e0f2c28 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -24,6 +24,15 @@ static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
+	{
+		.adr = 0x000030025D071101ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt711"
+	}
+};
+
 static const struct snd_soc_acpi_link_adr arl_rvp[] = {
 	{
 		.mask = BIT(0),
@@ -33,6 +42,15 @@ static const struct snd_soc_acpi_link_adr arl_rvp[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr arl_sdca_rvp[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_sdca_0_adr),
+		.adr_d = rt711_sdca_0_adr,
+	},
+	{}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_machines[] = {
 	{},
 };
@@ -46,6 +64,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-arl-rt711.tplg",
 	},
+	{
+		.link_mask = 0x1, /* link0 required */
+		.links = arl_sdca_rvp,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-arl-rt711-l0.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_arl_sdw_machines);
-- 
2.40.1

