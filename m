Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D3E4C8E
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 16:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715272471; cv=none; b=dF+ktoqvVD4a+RVDKI6uumcsO1jxULMn4n3PW5qt3VuJR+OsLbz+bduwLsnHDdlVyQsEpBZDmfdCpOq1SQzDXiUGJCpJ2pqir2l8tp6lnMYksBsVXO0imU3RXrprbNodlBvNwxTHj65hI+xQyuq6TY0PQRcJCNkjXIzBCPBUD5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715272471; c=relaxed/simple;
	bh=EXu9QcKEMn/CqZbqLu+eep+NrrtdHmA8M7Xs+D0jXjM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TqfYZl8PbFyIUfME1iVc9NCt/idalTVJMgd1BSdwavHDEcKCIrrPMXP9RjAwiTEmnGlizSP0U3ZK56NJj6o9x5pusjsVM57SCL8L3V558NazDF2hzhcygxAheQn4jigM28vwNrr/QIo8kppj9sjWq8A7CwzNQxZUG1sr1bBx/CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nK2gCn4m; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nK2gCn4m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272470; x=1746808470;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EXu9QcKEMn/CqZbqLu+eep+NrrtdHmA8M7Xs+D0jXjM=;
  b=nK2gCn4m5r5+KVeiAyz7usYv9tNb2I5qJIuBi2u23cQaZM6GnmaFFeNc
   cRgOcydh00bHloYmTYG5F1qkwoVeJftnWpDka8DChLX2iLAJEovLxmLBe
   Tnufrh1e6eqoO3eanSmmV8mm/cOHGfvUHoCkCZN8WqEuHiGDMmb4JmtEi
   KI9vBoyqcZfbUrBeuU8Bq7Sbfe/0wP/9Wxm4gCihFvUV8D2wpV1evUzNw
   OU4fQR3cEF+fwYoSMy2MrVUkyE3UfsblKK4cG4OfqiWoHJbfswG4MFp9W
   94nc0L+8npo2K56TVSAzr3yUQKJ3UrokNKcaBt/Wxb55YmweCYXl9Zd7p
   w==;
X-CSE-ConnectionGUID: YyPKLE82Q1a8/VC/nk7slg==
X-CSE-MsgGUID: NLmvyZN/QeKLRvtVqLj5tg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017539"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="15017539"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:28 -0700
X-CSE-ConnectionGUID: wMEklsq8TPeOGYq3SOOfrg==
X-CSE-MsgGUID: WuRWkeVITH60ZlVRfCzrPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="33760991"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:27 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 05/18] ASoC: Intel: soc-acpi-intel-mtl-match: add cs42l43 only support
Date: Thu,  9 May 2024 11:34:05 -0500
Message-Id: <20240509163418.67746-6-pierre-louis.bossart@linux.intel.com>
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
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 0bff91317768..48252fa9e39e 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -668,6 +668,14 @@ static const struct snd_soc_acpi_link_adr cs42l42_link0_max98363_link2[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr mtl_cs42l43_l0[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l43_0_adr),
+		.adr_d = cs42l43_0_adr,
+	},
+};
+
 static const struct snd_soc_acpi_link_adr mtl_cs42l43_cs35l56[] = {
 	{
 		.mask = BIT(0),
@@ -782,6 +790,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-cs42l43-l0-cs35l56-l12.tplg",
 	},
+	{
+		.link_mask = BIT(0),
+		.links = mtl_cs42l43_l0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-cs42l43-l0.tplg",
+	},
 	{
 		.link_mask = GENMASK(3, 0),
 		.links = mtl_3_in_1_sdca,
-- 
2.40.1

