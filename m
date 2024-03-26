Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE9413C9B0
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469135; cv=none; b=WJirXSpeVM3VKTC2I8M4rOO9dPgq84HB1p7URRpLbmLnz2LQRp7UgMsg4Sw7JzRHvwHKxUCT/h0IR6NhLDTlyO8DtVvK/AbzsNeUOZ/V4TPQK7UZL4hBS+KS/th+hWej/BaAqV361ZUKBEYaxlBYA5uPR3zI7l2VoAXuCiuJ650=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469135; c=relaxed/simple;
	bh=sTf7iewjShTLIpZ76HtMb1ZNJ2Egbdu079zsrWu6ef0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PYpG3aeYWCE2RSPf5dz4xgVN/J3KZGN6bEJg3TXImYkJF7MIqAQJwQArJM/3mA43csBAPI10QyU9VfxpHS5NAqa8eQLiuMmiZP/6ui5UQQ9zT/1ujUGVGYmmZoazMDsrRDo+afFxKc1Tb6bidGf0mhl6CjXpWwUKfO0Wo8urcfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kxENwxrv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kxENwxrv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469134; x=1743005134;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sTf7iewjShTLIpZ76HtMb1ZNJ2Egbdu079zsrWu6ef0=;
  b=kxENwxrvq65VPmiwJMzMemX+ErB+v8PWsihrbd8HIy1Q/pc9oOHKhPnq
   BQ0Oc8eu359UY/ro/mioUjT3/ZvXPAr1Nzsic92zNqXqwaFEnJ/TMpnz5
   lpCWyyr6t5Y6Rrs3XGnoWkWOSgzGKb9geSQiWGJe8qcILfi784MP4q9IV
   1yB379d0upxZO4/Q6D68coNuu856Wff/nE+VT2vu8F99DmZa0AQpNOCUo
   50YX5UJHf5TcQNtO4Vd8rrp2sNNwfM+hIkPXI+5TeiLgt/yyCUr0m3I+a
   WFT3r1TNigjuQTlbUSTQKG8AGTLK2GTv51RM4SZzD2g8gOj83eBarg6C2
   w==;
X-CSE-ConnectionGUID: 5pmw8lRrRDmOEdQ8bpguPA==
X-CSE-MsgGUID: cLJ3imq5RIeeGAKjec64RQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260444"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260444"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482289"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:54 -0700
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
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 17/34] ASoC: intel: soc-acpi: Add missing cs42l43 endpoints
Date: Tue, 26 Mar 2024 11:04:12 -0500
Message-Id: <20240326160429.13560-18-pierre-louis.bossart@linux.intel.com>
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

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Currently the cs42l43 just specifies a single endpoint, as the current
machine driver only looks at the first endpoint specified. Future
refactoring will process all endpoints, as such proper specification
should be added for all the cs42l43 endpoints.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 25 +++++++++++++++++--
 .../intel/common/soc-acpi-intel-tgl-match.c   | 25 +++++++++++++++++--
 2 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index e9a5da079089..e06efc5b1457 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -338,11 +338,32 @@ static const struct snd_soc_acpi_link_adr mtl_712_only[] = {
 	{}
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
+};
+
 static const struct snd_soc_acpi_adr_device cs42l43_0_adr[] = {
 	{
 		.adr = 0x00003001FA424301ull,
-		.num_endpoints = 1,
-		.endpoints = &single_endpoint,
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
+		.endpoints = cs42l43_endpoints,
 		.name_prefix = "cs42l43"
 	}
 };
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 0fba0a60d9c7..007f1ac2327a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -414,11 +414,32 @@ static const struct snd_soc_acpi_link_adr tgl_712_only[] = {
 	{}
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
+};
+
 static const struct snd_soc_acpi_adr_device cs42l43_3_adr[] = {
 	{
 		.adr = 0x00033001FA424301ull,
-		.num_endpoints = 1,
-		.endpoints = &single_endpoint,
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
+		.endpoints = cs42l43_endpoints,
 		.name_prefix = "cs42l43"
 	}
 };
-- 
2.40.1

