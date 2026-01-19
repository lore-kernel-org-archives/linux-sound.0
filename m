Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51357355027
	for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 09:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768814285; cv=none; b=h491bFMQPxuhTwqCD0L69VmRjyO8DO3vdI0Ss63VJyLiBjgHSKo4W3w9I51xgQzmGOCBD8l2J4je0cFt4ImLMA2N1InQlOUnJrgSHuESJCIb/+KCzFblhcgsapo/7VKmAsQXLSVYmgDmm7bAtvcd5m4eTwTDPWXjSdUrUejwzTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768814285; c=relaxed/simple;
	bh=cKc64y5JrCnTai/poAKqG6SeR9sFjWqdWapBDiwdX3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hcojoKDh+SGwKuugtDmQ7joAky+86fX+7D7FPrOgG3eul5Bxq6KKQ0CNEPhvZhqxStBgjSCgH1tl3krxuRkzWEh3t8fXtMO59TWDffAbNqMIZCLdzWn7wRI14iK5EhtcQ9AoSZY4kJC0cRF+HbwKQnwMD/BWAFJ8fw6n4vfTi2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h3ftpzl5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h3ftpzl5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768814284; x=1800350284;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cKc64y5JrCnTai/poAKqG6SeR9sFjWqdWapBDiwdX3s=;
  b=h3ftpzl5+xFx4Dp/+Cd7oKqfRNC/LjFYbsbkVone1UEkb4HXLHnbqeWu
   vyI+VlsNPaPyanlmOmp91xilgDR8L5bD/NCHTb8pFe716oVVumlrY4+gH
   2KNxOFkTmxEM9aNxOf2ya3F/CUg6iIwW9kys7DcxdCSlGNv+NeY5tpGGp
   hzGTUtZ6I+VCYQQJ2VMoeTpDjdifWEptbOIEuWVNhrbenSjGuQOI86Hog
   pjNKzllFB4DoYQpBlHBX5J1Ny2PU5iiBTbOS3BybnP7UovRraA2Dh6omn
   YdIdjB0rNxGpttF0j8WwxN7nh2ABPOqol2IGvEj8uFVlB0/y/MXZNcY9n
   A==;
X-CSE-ConnectionGUID: mngrBnjHQnyGIkdC9f880A==
X-CSE-MsgGUID: WtNkRyb7SRGiqZCs1WgO7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="72613229"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="72613229"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 01:18:04 -0800
X-CSE-ConnectionGUID: jWJl+Gc4Q5G1bi7Crxk85A==
X-CSE-MsgGUID: EPynNpGkQQ6R7rtx+XM+GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="209958960"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 01:18:03 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 1/2] ASoC: soc-acpi-intel-arl-match: change rt722 amp endpoint to aggregated
Date: Mon, 19 Jan 2026 17:17:48 +0800
Message-ID: <20260119091749.1752088-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119091749.1752088-1-yung-chuan.liao@linux.intel.com>
References: <20260119091749.1752088-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rt722 is aggregated with rt1320 amp in arl_rt722_l0_rt1320_l2 and it is
the only audio configuration in the ARL platform. Set .aggregated = 1 to
represent the fact and avoid unexpected issue.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-arl-match.c   | 23 +++++++++----------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index 6bf7a6250ddc..c952f7d2b2c0 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -45,23 +45,22 @@ static const struct snd_soc_acpi_endpoint spk_3_endpoint = {
 	.group_id = 1,
 };
 
-/*
- * RT722 is a multi-function codec, three endpoints are created for
- * its headset, amp and dmic functions.
- */
-static const struct snd_soc_acpi_endpoint rt722_endpoints[] = {
+static const struct snd_soc_acpi_endpoint jack_amp_g1_dmic_endpoints[] = {
+	/* Jack Endpoint */
 	{
 		.num = 0,
 		.aggregated = 0,
 		.group_position = 0,
 		.group_id = 0,
 	},
+	/* Amp Endpoint, work as spk_l_endpoint */
 	{
 		.num = 1,
-		.aggregated = 0,
+		.aggregated = 1,
 		.group_position = 0,
-		.group_id = 0,
+		.group_id = 1,
 	},
+	/* DMIC Endpoint */
 	{
 		.num = 2,
 		.aggregated = 0,
@@ -229,11 +228,11 @@ static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	}
 };
 
-static const struct snd_soc_acpi_adr_device rt722_0_single_adr[] = {
+static const struct snd_soc_acpi_adr_device rt722_0_agg_adr[] = {
 	{
 		.adr = 0x000030025D072201ull,
-		.num_endpoints = ARRAY_SIZE(rt722_endpoints),
-		.endpoints = rt722_endpoints,
+		.num_endpoints = ARRAY_SIZE(jack_amp_g1_dmic_endpoints),
+		.endpoints = jack_amp_g1_dmic_endpoints,
 		.name_prefix = "rt722"
 	}
 };
@@ -394,8 +393,8 @@ static const struct snd_soc_acpi_link_adr arl_rt711_l0_rt1316_l3[] = {
 static const struct snd_soc_acpi_link_adr arl_rt722_l0_rt1320_l2[] = {
 	{
 		.mask = BIT(0),
-		.num_adr = ARRAY_SIZE(rt722_0_single_adr),
-		.adr_d = rt722_0_single_adr,
+		.num_adr = ARRAY_SIZE(rt722_0_agg_adr),
+		.adr_d = rt722_0_agg_adr,
 	},
 	{
 		.mask = BIT(2),
-- 
2.43.0

