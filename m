Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D87513B586
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 12:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719231098; cv=none; b=LQFk2Fb/8KRGijXwkHGiZAdb6emB6jOGkwQ7lu0/QZB+pZfG+vSTcSiYoWMAcTlpdtsEaL2KxnUjvaF16Rc+lcHrHU93HVGJ7JfienoHLUtY4SFBXrYbHei2stoGrgvwMqtptUpywNQnw3VAABIUKaMPNPymrm+XK5U4lhKEcDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719231098; c=relaxed/simple;
	bh=eKR4UMvmeTLd+anS9f6YYfklV3EDalMCO5Nwb3ZoiP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rq858fGJ0pmuzeZGa104CB3/ov9xnd7Iv8Hu/VnKx3nbwM3gruIw5ic7bmc5X9rr2hc3kSZv43AzCUJAHwONcT7+xVSZGCn+XCu23luEKJNhCyjKp+Da5HQO6fTVOeU8428q/i6Hkg9jBQkJIzzdVeZ4/jeNtVrM8pIapfS9Lfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QnQ37w/F; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QnQ37w/F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719231096; x=1750767096;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eKR4UMvmeTLd+anS9f6YYfklV3EDalMCO5Nwb3ZoiP8=;
  b=QnQ37w/FCiP4DT5Rl12I8qALYfHBDRar8J2vb4MkUw7QNf0O6cyQSgEg
   1kKAfplWiUzEuE2M/WNePgAU1w86sxtVO3KnuZHopdXYC8ctG3FT727wc
   MEe9tFP2jZK6PtIpMdlQXQtZYsscyUdSPpFRNcGGzyjORUhuWL5rphHuG
   l6RQ3o6WNdn0NVXZ0Z6YyWhAMgOrQ4mQt3nGB1/TnG8UHO5ocwQjk0YtC
   HUnuiRTkKTNoTxvZer/gUX7/gZLE2qFX0pKQntHYC/f2ksV/F3mCJBfDQ
   zO8nEKLm4SQ4vnLEXhP4ZKUrKPVQ/GOqaqEiJ+3KqBOOG6Q3Pw8tHCagc
   w==;
X-CSE-ConnectionGUID: 0J/oGa47RJGtNFk1OuixYg==
X-CSE-MsgGUID: ItvcBYt9Qgi8yWN6/gZYOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="15887536"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="15887536"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 05:11:35 -0700
X-CSE-ConnectionGUID: emiwiWU7R6+8Vwj9YUQlFQ==
X-CSE-MsgGUID: qbks1TvfTx6vbjaMDC8leg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="43091208"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.245.246.230])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 05:11:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 1/4] ASoC: Intel: sof_sdw: fix jack detection on ADL-N variant RVP
Date: Mon, 24 Jun 2024 14:11:16 +0200
Message-ID: <20240624121119.91552-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240624121119.91552-1-pierre-louis.bossart@linux.intel.com>
References: <20240624121119.91552-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Experimental tests show that JD2_100K is required, otherwise the jack
is detected always even with nothing plugged-in.

To avoid matching with other known quirks the SKU information is used.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b646b32dd311..89b92a061489 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -277,6 +277,15 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					SOF_BT_OFFLOAD_SSP(2) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_PRODUCT_SKU, "0000000000070000"),
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					RT711_JD2_100K),
+	},
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
-- 
2.43.0

