Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771022EA73C
	for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 08:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752654167; cv=none; b=eJSYxUgSeiGCI0EqNcLjBC7naZxp/b6sDWiiZMFE/faxWwQoW72h0gmCF4d5mn6+mATAGexrYDpf6Ywg3MKlZI3/Rll5XCZ6Jxmi/kwGYuF4zQEQcxVXufXcyn4cUEXEa7vCE6Zy99HmqlkjpX24KqkMC8lCsJBitcVvOTq/1D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752654167; c=relaxed/simple;
	bh=z6M+yNOvaz1AWuyneZt3S6fpUnc0Pj/9TUsrF7yd4zo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S/lS31Uc2QlD3iX3rSya/CcMSGOEfRDjxHjfshC53EVG60VgbSnk5lMiIEKhsS4HTA+6zixJ0wuRT+tsRl+rdx5AdQtwvCg2TS3VYzfni0EOArhVBzQPucf0iRfUEwmhnBQybT1SGVTlT8VDqnTXs/lmMMRdylWjC4rmulj3U5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jop+W9gl; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jop+W9gl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752654165; x=1784190165;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=z6M+yNOvaz1AWuyneZt3S6fpUnc0Pj/9TUsrF7yd4zo=;
  b=Jop+W9glAxWBt//acSNML0AUJOYG4gqV9kz9FSOfPSGtSIFBWulXlB4e
   eu6nrTOTGiL0tcGxDcHswSnJdSdup66RwJMWvGUj5B42pKTWMgoR66owC
   XdQfHzKxRymd1+A/au0YN8pNkyhFjtARMq5HnPuNQf+sMUG6IqtOd9UUB
   Fpj50O9hiigCKT8C+s3d07/bFdK7IBNweOZplj+AIOixqZB+dhM/n7i5C
   RkOM+qI1M+MivCEpVoACryGIhS6oSUHjpymPiHlCPt9QrzvMgJ+kPhOGq
   cHnHDunQeoMjaICvGErcJmLPqA1NQQ6ZhiAgUoHaV1kyeL05p+g+hf7mH
   Q==;
X-CSE-ConnectionGUID: hpBXlwMrTdKu1W1yikHxBQ==
X-CSE-MsgGUID: p3xPR4gATNeylEHCICgZXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65152966"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="65152966"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 01:22:44 -0700
X-CSE-ConnectionGUID: P4RxIvzdQEiI5VbdvMmLEA==
X-CSE-MsgGUID: yuXC4KKaTb6GPr3Ub0qj2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="188448371"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 01:22:43 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com
Subject: [PATCH] ASoC: Intel: soc-acpi: add support for HP Omen14 ARL
Date: Wed, 16 Jul 2025 16:22:33 +0800
Message-ID: <20250716082233.1810334-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This platform has an RT711-sdca on link0 and RT1316 on link3.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-arl-match.c   | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index 1ad704ca2c5f..6bf7a6250ddc 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -238,6 +238,15 @@ static const struct snd_soc_acpi_adr_device rt722_0_single_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1316_3_single_adr[] = {
+	{
+		.adr = 0x000330025D131601ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt1316-1"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1320_2_single_adr[] = {
 	{
 		.adr = 0x000230025D132001ull,
@@ -368,6 +377,20 @@ static const struct snd_soc_acpi_link_adr arl_sdca_rvp[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr arl_rt711_l0_rt1316_l3[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_sdca_0_adr),
+		.adr_d = rt711_sdca_0_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt1316_3_single_adr),
+		.adr_d = rt1316_3_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr arl_rt722_l0_rt1320_l2[] = {
 	{
 		.mask = BIT(0),
@@ -481,6 +504,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-arl-cs42l43-l2.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
+	{
+		.link_mask = BIT(0) | BIT(3),
+		.links = arl_rt711_l0_rt1316_l3,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-arl-rt711-l0-rt1316-l3.tplg",
+	},
 	{
 		.link_mask = 0x1, /* link0 required */
 		.links = arl_rvp,
-- 
2.43.0

