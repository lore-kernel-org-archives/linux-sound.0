Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C4F13CAB6
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469144; cv=none; b=ZHIERaHR2zqC0OEnlsNitk1tJCqC86MXus3J9raYfKDKKpc8KkilfLSTwoaDiViVWAN4gVKP8Fgm5nWPkq6HJRj4ONjftoiOn0ejMz2BCUJX6ImUJYW0aVZ8xtm1DgKOfin+6K2c61XbT65swlUFZkNtvh9hnV91aHWvCSoDZT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469144; c=relaxed/simple;
	bh=n0IrftS1xYbcXY1GHXbLYZmk8QtdkWZ1bDvJPlTyUtw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gpikxMfk5CgRr2FdRDPWK6XBSR0PtmAXPrYu1sjQwR/5gxiauTL8rsofgWHRiiyXiYRGDRC18GeoZK4U94QfxrGwJuvBfTAsVFOIpzWMKjp4fnGFkUweKEL90DrzUNZg7Ln8tuYPWuJ82XliI7VbZi3NmN4I4ZbNhCc7fg7tecg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bH5y2uQp; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bH5y2uQp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469142; x=1743005142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n0IrftS1xYbcXY1GHXbLYZmk8QtdkWZ1bDvJPlTyUtw=;
  b=bH5y2uQp7CqV4MRCx1zmXsKzrn/hbbAZlk7qK6/gIBZ8Ju3rwsfduIMg
   J+EZWlQS+C8oReYC9IvZbGFsMZKRcd+ScTYiJoAyB1vN8Dzxs3tfCg/0e
   4EJ4qVlvwbhro7of2DSZoUamJhutetE7qpJ7ZlggsH0DEO+F1cZ36VmjX
   M7RcxdJbqmKtVW2v1QqqHbjY6NAef4hCIghXWp4w+1phSTQlXr5VBZ+lI
   c7xr1gvqpBU9HS+CquW1tdGzlQBiMAfTNWQjrWQM9i7a9fIOEgfWL05hQ
   UmrGyLEpsXmkieH0yAofxeY1qVWKqHWjl3Z97W4++SUZn8kCG+z9n1MO9
   w==;
X-CSE-ConnectionGUID: U3Lw6tUfT1CUp77DLTeyTA==
X-CSE-MsgGUID: eHjAHWcRQRCcphO1hh2DMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260565"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260565"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:05:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482498"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:05:05 -0700
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
Subject: [PATCH 32/34] ASoC: Intel: sof_sdw: Remove redundant initialisations
Date: Tue, 26 Mar 2024 11:04:27 -0500
Message-Id: <20240326160429.13560-33-pierre-louis.bossart@linux.intel.com>
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

Unspecified fields are by default initialised to zero, remove redundant
init pointer initialisations.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index f3167e3498e0..5a7014d82d6c 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1026,7 +1026,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "sdw-mockup-aif1",
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
 				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
-				.init = NULL,
 			},
 		},
 		.dai_num = 1,
@@ -1040,7 +1039,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "sdw-mockup-aif1",
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
 				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
-				.init = NULL,
 			},
 		},
 		.dai_num = 1,
@@ -1054,7 +1052,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "sdw-mockup-aif1",
 				.dai_type = SOF_SDW_DAI_TYPE_AMP,
 				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_AMP_IN_DAI_ID},
-				.init = NULL,
 			},
 		},
 		.dai_num = 1,
@@ -1068,7 +1065,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.direction = {false, true},
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
-				.init = NULL,
 			},
 		},
 		.dai_num = 1,
-- 
2.40.1

