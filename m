Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44707149018
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714144903; cv=none; b=PHZIKZTd6ZNaJ02NZzoc14k3v6vcD9/Z+7IE5q+dVQOreCBl8ycm4+67NbhLCUS5xlX05y4Ko52p6YJdZakFHU5La4d1QuUBqhWBcnfAD8oBoLRP4RF0VnyQz3Z76ZHEd3Xu/rYZiFb1PWCsEI6maf9rxAvS/Gr2DygTm+KazVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714144903; c=relaxed/simple;
	bh=WAkH3Y7OhBZNoUz6Z4EeiC+ZSwLVt3vDR6DBrDXdPXU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZspCFldrTtViQ8MbTkZaZu2Ohc3IdATftBMH/im31u+gCx92r7HfS8wlYkwJ4tit3WeMrJugZk/d4L2GfjXbzXaFFhgEPESXvO0FuOQtN5xHvsAu+D8mCAEQtaETuKBZTlJP2dyB6g5aJJY4QQZOg9K1TCQZjfuw5rZJLgK+FMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HnorRxel; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HnorRxel"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714144902; x=1745680902;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WAkH3Y7OhBZNoUz6Z4EeiC+ZSwLVt3vDR6DBrDXdPXU=;
  b=HnorRxelG8c2NZkweumu9j1tnRVAOeZH7i8BSTsUXIRwdjuSu642w/g9
   mMmUNLHQbycJYCE3y+Z7N24BZI08r7dOmZtTocNk5aPBII4lGgqD89hjy
   Q/mN1tksftJMBT5dWwZGhUqDpUi24HgtpushXwX7ZtCQeT7k9Sgi6/UkH
   Ha3Xr7gwgd7eGhAb2ctUM7ZJGOpBHB6d66cx2nThhhaKcjohZjypPsFkT
   LlB7k3c4JL6NmZkvEgYoGkPGVdLJ4IIuIQMK7D1GedetpkWnhLWlwDKZJ
   1X1AwvnNCc84BezIhgIb210GwE+QXPZDHd7VuqHYSKgTtvUvXrbrvRAuJ
   A==;
X-CSE-ConnectionGUID: NFPHOoB1SMyH9MVEd1PrtQ==
X-CSE-MsgGUID: 6bxbiPvdRW6yM9r+6SJbrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21290605"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21290605"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:21:41 -0700
X-CSE-ConnectionGUID: xWcTo9aQQEKG8IJruxCmow==
X-CSE-MsgGUID: lMOG/s+wS8itmVGZTmk2bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259026"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:21:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 04/12] ASoC: Intel: soc-acpi: mtl: add support for Acer Swift Go 14
Date: Fri, 26 Apr 2024 10:21:15 -0500
Message-Id: <20240426152123.36284-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This device has an RT712 on link0, but does not rely on RT1712 for the
DMIC. PCH-attached DMICs are used instead.

Closes: https://github.com/thesofproject/linux/issues/4923
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 8c1c430f5482..4eeec0bc92dc 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -357,7 +357,7 @@ static const struct snd_soc_acpi_adr_device rt714_1_adr[] = {
 	}
 };
 
-static const struct snd_soc_acpi_link_adr mtl_712_only[] = {
+static const struct snd_soc_acpi_link_adr mtl_712_l0_1712_l3[] = {
 	{
 		.mask = BIT(0),
 		.num_adr = ARRAY_SIZE(rt712_0_single_adr),
@@ -371,6 +371,15 @@ static const struct snd_soc_acpi_link_adr mtl_712_only[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr mtl_712_l0[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt712_0_single_adr),
+		.adr_d = rt712_0_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
 	{ /* Jack Playback Endpoint */
 		.num = 0,
@@ -769,10 +778,16 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 	},
 	{
 		.link_mask = BIT(3) | BIT(0),
-		.links = mtl_712_only,
+		.links = mtl_712_l0_1712_l3,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt712-l0-rt1712-l3.tplg",
 	},
+	{
+		.link_mask = BIT(0),
+		.links = mtl_712_l0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-rt712-l0.tplg",
+	},
 	{
 		.link_mask = GENMASK(2, 0),
 		.links = mtl_sdw_rt1318_l12_rt714_l0,
-- 
2.40.1

