Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D22A1DE4C7
	for <linux-sound@vger.kernel.org>; Fri,  6 Dec 2024 07:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733471969; cv=none; b=HvHmdh3NyRD+uYs9tLzzQgRiH+TjKA4yrLAaNyvzjG1DURWdRWjINgkPj5YvCjVJXKVcVcpTGLQ5abHoitW7QJvVXr7DBKDRTl0rJLamZ9rGZ4JCBrzPlojwJ9M51LkVG1iTUzoQ/nKx7ASfUkwklH7phKfn6sy67tX97I5n/08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733471969; c=relaxed/simple;
	bh=NQlOQCmZyfSUGMAGVnPqEb0LMuivFMfkmw/wY6hJVI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GMZwbSZfsDdfiQhNLW7tM9f/ebTIWrH96Kakca0Op6m9ZlOq9in/HOG3BzP6+gufSLaMnQgcbsXBKnfYGdPu8T4CG3RRw4z9RZlV0wXfpxHWLVZh2mU+dS+jFzvb8q+Zf7fYIGjv2wted6QabF7Y9Veq4WAuMKbnWm5VdkhC82A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X9r9UEIi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X9r9UEIi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733471968; x=1765007968;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NQlOQCmZyfSUGMAGVnPqEb0LMuivFMfkmw/wY6hJVI4=;
  b=X9r9UEIiwaEbpZgMxkkABhG6Cv3tPS8jIGl7cL3YVknSMbsPlXsAbnmn
   dhKylurwYXRM36Un/n8xeEdXBCleTYrgDweM0oMfsXbnlmcj7SiklbZLs
   tE5h3XateXbHrBI3585dkbh3g+86OZATjJrdb6v1B+KolB9JvZhDkgayF
   ynyzI2w1xxFGQfLEGaz9RLBrwDz/pGw4iQMjKOns3W3RgLvyDh4GzwzPK
   igXarrMgQZLLm7aRCp1B6W8Fm9c1WBcRR2OV63neInYnUXzC0v/z0BIyY
   LCwa5cHX8/t86m73qMHbo3ol99XB0xjgz0OLxmnvC05FLjp8sT3Pi9P02
   A==;
X-CSE-ConnectionGUID: DGbc1GYFSvqi0WZfHE7xjw==
X-CSE-MsgGUID: sTcsxTJpRLSfYN9Om4oeqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="45192813"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="45192813"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:59:28 -0800
X-CSE-ConnectionGUID: 7m9yN0jWQNS1aTlx5aTd1g==
X-CSE-MsgGUID: L9+ok9H8Qy2NyjEo7uIJ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="94144494"
Received: from ssimmeri-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.179])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:59:26 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 10/10] ASoC: Intel: soc-acpi: arl: Add match entries for new cs42l43 laptops
Date: Fri,  6 Dec 2024 15:59:03 +0800
Message-ID: <20241206075903.195730-11-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241206075903.195730-1-yung-chuan.liao@linux.intel.com>
References: <20241206075903.195730-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Simon Trimmer <simont@opensource.cirrus.com>

Add some new match table entries on Arrowlake for some coming cs42l43
laptops.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-arl-match.c   | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index d7dfb23277d0..32147dc9d2d6 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -147,6 +147,24 @@ static const struct snd_soc_acpi_adr_device cs35l56_3_l3_adr[] = {
 	},
 };
 
+static const struct snd_soc_acpi_adr_device cs35l56_2_r3_adr[] = {
+	{
+		.adr = 0x00023301fa355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP2"
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs35l56_3_l1_adr[] = {
+	{
+		.adr = 0x00033101fa355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+};
+
 static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
 	{ /* Jack Playback Endpoint */
 		.num = 0,
@@ -312,6 +330,25 @@ static const struct snd_soc_acpi_link_adr arl_cs42l43_l0_cs35l56_2_l23[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr arl_cs42l43_l0_cs35l56_3_l23[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l43_0_adr),
+		.adr_d = cs42l43_0_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(cs35l56_2_r3_adr),
+		.adr_d = cs35l56_2_r3_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(cs35l56_3_l1_adr),
+		.adr_d = cs35l56_3_l1_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr arl_rvp[] = {
 	{
 		.mask = BIT(0),
@@ -406,6 +443,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-arl-cs42l43-l0-cs35l56-l23.tplg",
 	},
+	{
+		.link_mask = BIT(0) | BIT(2) | BIT(3),
+		.links = arl_cs42l43_l0_cs35l56_3_l23,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-arl-cs42l43-l0-cs35l56-l23.tplg",
+	},
 	{
 		.link_mask = BIT(0) | BIT(2),
 		.links = arl_cs42l43_l0_cs35l56_l2,
-- 
2.43.0

