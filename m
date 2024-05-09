Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C251A2C0A
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 16:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715272469; cv=none; b=huFkof3bzPcOvPOBBMb1vsE2buzYqetZHf1bMTE+R8ZYLpYhXi/CQQCsAd941/h2HgmsTph+R0C5Z5tmvTdtLOKNvHdbAMe+yaeIRvFx1UwMDb34+mPA1yiUSqCwP5PNzUE5yX/l/o0HkgGleMi6XSp0uazfkXG6hSlCsg6SVTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715272469; c=relaxed/simple;
	bh=X3iPFhHwtJ8qI46Vi0iGYgNWN3iJMpwLBgwPSrm5E3M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SOpFglLEIn+xkULXFj+RM1xAsDOeh/KxZbjBGfb18puSTBgipR+GcHgx28Lsc/EpmtBt6HfbBA9wlNBXLJFofidwVpW4P+6HKq6tqizkm8ICehk82EUUpSlj4DwdLxLyJn04Aew5Ph2MJo4CoqjoUVnpxlxEs7EWU7Pxw98NHCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hF8/gJ0a; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hF8/gJ0a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272468; x=1746808468;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X3iPFhHwtJ8qI46Vi0iGYgNWN3iJMpwLBgwPSrm5E3M=;
  b=hF8/gJ0aMwRz5eh6iq7iIVr3inhXsnnSWxKAL0R9WHghzlQqlnACjGrZ
   NxItLM7dpO+IEyQM8XoFe9K68hQ2Pf3SRcZvU99ojTx47HzXNVr8mqsE4
   UecuJOpNiDd8oaIdQpMsnLWgRQCfFWkoR82kyRiaPNb8o4guWpQfprpLQ
   ZNcDQvl+9HQJC2EmI9Qv3afpKDBkkqO1qFDk0yUrbm1c3Uj2chzgtJK+A
   IxUc4vwJqZhM7ugI+Ql/ctQx7AON1SloehTqae9mKXMSYDlZA4GS2JhXC
   ft9D+Ege085koqeoQ011umnC4fd526QnLlNiMhiwgIALLquYJQnlVnHlg
   w==;
X-CSE-ConnectionGUID: tL7RHLMOQnqZn4Gk2OaJ/w==
X-CSE-MsgGUID: 8WlIwjryRJa3NRuQjVJOWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017518"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="15017518"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:26 -0700
X-CSE-ConnectionGUID: ZxgXETYZQMGnLG0xoOh/3g==
X-CSE-MsgGUID: Kc741M+OQ0yLQsFZ3ADVWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="33760977"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 02/18] ASoC: Intel: sof-rt5682: remove DMI quirk for hatch
Date: Thu,  9 May 2024 11:34:02 -0500
Message-Id: <20240509163418.67746-3-pierre-louis.bossart@linux.intel.com>
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

From: Brent Lu <brent.lu@intel.com>

The quirk for cml chromebook hatch could be removed since we have
cml_rt5682_def board id now.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index e3a2ec6b4c7c..5a189c165e2d 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -67,15 +67,6 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
 					SOF_SSP_PORT_CODEC(1)),
 	},
-	{
-		.callback = sof_rt5682_quirk_cb,
-		.matches = {
-			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Hatch"),
-		},
-		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
-					SOF_SSP_PORT_CODEC(0) |
-					SOF_SSP_PORT_AMP(1)),
-	},
 	{
 		.callback = sof_rt5682_quirk_cb,
 		.matches = {
-- 
2.40.1

