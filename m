Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70F61A2C0A
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 16:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715272472; cv=none; b=hIsCyQdfcUf2Sqx1ROmzwoN2lR5KUgz9DAapyz2es/jdH6GI0aX1ethp2Xpy0NRdMqPyEVkTBMJj9MLhFsTBjZC5WMlT9OIi0FrF8zGQrSNApln3S+WQQOB/BPRS1fMt++CjMzg74LG50oEJRigYZoJWbOHVAay9m8Hhk86MYGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715272472; c=relaxed/simple;
	bh=2px2Wzf56eRVtaKJPSE24LU0S3uwjbw6aMfiaJmBZSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qrDzl0OljP/B1mzIjJchE1vPI9TzZCFygco4l/hmZwfnTMV5TEkso7wovgfNHBjNSuuJaJ7zWb2h6foznhJgF55CZ2bK6x3+23L9P9exHqmHtC5BEiTIB2evLdclIgcOuxs1T7QUN+WDGYscXPLvQZrrKyM4WvowhQzwLWexZ1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJKYVdsR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJKYVdsR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272471; x=1746808471;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2px2Wzf56eRVtaKJPSE24LU0S3uwjbw6aMfiaJmBZSE=;
  b=NJKYVdsRVWUo5fI+dQMNsyoFitzx0qYlMU4zfu6MqqGuKO83VzwbE5Qh
   /qsp6A8i5jkLCt97lbwT8oj7BnxrVlDkiVaiO7X58DUvnvNM3ZAwo3cVB
   zdjRKRuWa35jIUF1ByAUJiaTrQCMV8iPMbfeIXMWuO85yY8Qo+z0YCizR
   qX8HoRNcuL6JHD046idHFEUU5rACNEJ7DV0kq7EsWQMJOvAS23N/KA1v3
   S7lmSjzFMjhW7T3wt9pMFMj1Wlqee3OJMyAnLJDNyxrOcKK0bI7+Vxsky
   jkeER/RAjrOOSI/afg9US6dE9DGqR8lzAZGpQBwXfSJI8fqOl8FpNWD6S
   w==;
X-CSE-ConnectionGUID: /876Q4eERIu2zbPdtPVRLg==
X-CSE-MsgGUID: TFdTCIg1S7mMoJRc1g7gbg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017547"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="15017547"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:28 -0700
X-CSE-ConnectionGUID: D2pjHDFzRqelt6XKhDkIQw==
X-CSE-MsgGUID: hcJzjymSRUmXuc7WzNrQgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="33761001"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 06/18] ASoC: Intel: soc-acpi-intel-lnl-match: add cs42l43 only support
Date: Thu,  9 May 2024 11:34:06 -0500
Message-Id: <20240509163418.67746-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

cs42l43 is on link 0. No amp in this configuration, will use cs42l43
speaker or bridge.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-lnl-match.c   | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
index 0c08859c4773..e6ffcd5be6c5 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -76,6 +76,42 @@ static const struct snd_soc_acpi_endpoint rt722_endpoints[] = {
 	},
 };
 
+static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
+	{ /* Jack Playback Endpoint */
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* DMIC Capture Endpoint */
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* Jack Capture Endpoint */
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* Speaker Playback Endpoint */
+		.num = 3,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs42l43_0_adr[] = {
+	{
+		.adr = 0x00003001FA424301ull,
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l43"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	{
 		.adr = 0x000030025D071101ull,
@@ -166,6 +202,14 @@ static const struct snd_soc_acpi_adr_device rt714_1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_link_adr lnl_cs42l43_l0[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l43_0_adr),
+		.adr_d = cs42l43_0_adr,
+	},
+};
+
 static const struct snd_soc_acpi_link_adr lnl_rvp[] = {
 	{
 		.mask = BIT(0),
@@ -268,6 +312,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-lnl-rt711-l0-rt1316-l23-rt714-l1.tplg",
 	},
+	{
+		.link_mask = BIT(0),
+		.links = lnl_cs42l43_l0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-lnl-cs42l43-l0.tplg",
+	},
 	{
 		.link_mask = BIT(0),
 		.links = lnl_rvp,
-- 
2.40.1

