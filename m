Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3205710A1F
	for <linux-sound@vger.kernel.org>; Tue,  8 Jul 2025 08:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751961647; cv=none; b=fX2eMnp8wSXeU9nXJMmlujwd9lqXvmGz8CtIpA0X7MW8IqG/BJK4xNCkINafsI7Dcyo1z4lUmVFEcC0lFdMM5mS2tu1jvAiz8mh9YfkUKoC3ydp+Mtewa6TE+BsigLGmksDRZz4PYxMqE0mI989bVQ0eqN0XonCfd8zFSs4XJMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751961647; c=relaxed/simple;
	bh=PcZO9JxHQH2R/D4oUlumOq0aTpd2hiZBgGpUNbgszd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=reloJBgjefTuHt80cJj8sooRovVFMV1tOHlY7A+0QlrXmUWhZWzbTjaSuC6UqnXUMQ6aouruzs9pxIB+5Sc9VCKApm90Y5JT9pDKaDio0jHoPDQ4lclRgDhrFqIifNiASNPQJxZfTI7Ouit4m8wdUhlbhgLoRdT24MYV3V2ZSqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dKzILW2m; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dKzILW2m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751961646; x=1783497646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PcZO9JxHQH2R/D4oUlumOq0aTpd2hiZBgGpUNbgszd8=;
  b=dKzILW2moJfCOdMjobjcznVuZp/71m2Oi0T/Yt8ye4GrlFIg/MvLJezg
   EDzZ0wYiEIcnDpO9CajBxe6qFEklUcr9QF1H/2W9dUNNG76kXHbZvq/VG
   YHrHAKB0Rbd7TxoIcCtAHGisiM2UMkJbW+OdEiB0C4PRxIRrA2kRfU1kv
   bOYhe0TJpN9dGzHndSgWgj1kwQOWwUch5/c8pBrIZ4NH2JFGLdLClr1Py
   i0gJ3K/CzROInbaI6XCHubILTH4DU70Moah1ZZ97r8kjlD4NiVhteicpS
   LBxblQcuKMLPTUx65jk0ZyHVhKRn0G2uQViur554p0pq4esGUCNEpRN2Z
   A==;
X-CSE-ConnectionGUID: ovOBHeBWR9GrJ9qzk8s36A==
X-CSE-MsgGUID: Wj+O4xZ8Q2OQGJV7/aKioQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65542035"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="65542035"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 01:00:46 -0700
X-CSE-ConnectionGUID: EKt2OZDdQqa12ZEWN6cyaQ==
X-CSE-MsgGUID: YT8rLn2+TA+91MQtg2I04Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="154832113"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 01:00:44 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 3/4] ASoC: Intel: soc-acpi-intel-ptl-match: add support ptl-rt721-l0
Date: Tue,  8 Jul 2025 16:00:28 +0800
Message-ID: <20250708080030.1257790-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708080030.1257790-1-yung-chuan.liao@linux.intel.com>
References: <20250708080030.1257790-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mac Chiang <mac.chiang@intel.com>

This patch adds support for rt721 on Soundwire Link 0.

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-ptl-match.c   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index 67f1091483dc..a8fee8cf4913 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -355,6 +355,15 @@ static const struct snd_soc_acpi_adr_device rt1320_3_group1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt721_0_single_adr[] = {
+	{
+		.adr = 0x000030025d072101ull,
+		.num_endpoints = ARRAY_SIZE(rt_mf_endpoints),
+		.endpoints = rt_mf_endpoints,
+		.name_prefix = "rt721"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt721_3_single_adr[] = {
 	{
 		.adr = 0x000330025d072101ull,
@@ -473,6 +482,15 @@ static const struct snd_soc_acpi_link_adr ptl_cs42l43_l3[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr ptl_rt721_l0[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt721_0_single_adr),
+		.adr_d = rt721_0_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr ptl_rt722_only[] = {
 	{
 		.mask = BIT(0),
@@ -660,6 +678,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-ptl-rt711.tplg",
 	},
+	{
+		.link_mask = BIT(0),
+		.links = ptl_rt721_l0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-rt721.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
 	{
 		.link_mask = BIT(0),
 		.links = ptl_rt722_only,
-- 
2.43.0

