Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8B6131E38
	for <linux-sound@vger.kernel.org>; Tue,  9 Apr 2024 11:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712662440; cv=none; b=lHjY69Mj14fHw/tBV752lHkHn4xXbhDb3tQIpTRwSBNctcGjU4aUYls3Qw1/PskYjgChEdA3tm8m+WYBJn2vR7mU+zw5e6PEdooOgQS4lwWTea62jrGtxqd4lp0/ZEGhQBx+FYv/irk3hIwo7+8CetdKCZklNETAkauWIeFwSco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712662440; c=relaxed/simple;
	bh=gz6aH2zV8D/7qH/+yiT9hDM8b8QmUJiIeZB/IyjgDnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D8r0YeZ4XpSVzuxHn881N8ooFp9if8/vi9Mqlx5rjwuZJvff1nX4ka/JTKqVxyZpqauqdGPoyKOpnIk0o4laOp5qab0PqzDj2Ol+GaiYpKeNLzP9TWZS0t8RduviNVzVKusHTopipJfaTBa6BrZa/09irQIK0/7SVTMKDkOPTEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IGvxopTR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGvxopTR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712662439; x=1744198439;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gz6aH2zV8D/7qH/+yiT9hDM8b8QmUJiIeZB/IyjgDnc=;
  b=IGvxopTRT7qJoHyIIYWGJv/4njIRVl/kAB9q9QkUFXAHtYHjhV0KJH6p
   jAEoEzku64m8ts1yiFHp25o3xz1qDD57gkqQ9QDjTIt0XnKot8xRi5cZg
   OY3VviAcxRE/6M57SPs49j8Q12239lCyc/Whcr/jAMnIc1O01u8dba/fs
   YcOe4G+yZEsSEn+zJ87wpMqOEUZpymaMwEzJvxNYzxG7vpPttRbAfqPhK
   y/UrW8nhlDWeFfU1CnGU7bEcaM6ZNCsR3ynRjvDpMP+i9b6N2HGSEckRC
   wxndIFd2jsA8xMrvOlQ5U8kGM0CTimmelqLslRLXc3TgHemaOJcCZ9GX4
   w==;
X-CSE-ConnectionGUID: 3BmYS9OfQWKj29NkYdkp0g==
X-CSE-MsgGUID: jR5f9w2GS4yO2yVcSPGW1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="18687797"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="18687797"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 04:33:59 -0700
X-CSE-ConnectionGUID: EcJiUmBvTza0tvUEwL1MCg==
X-CSE-MsgGUID: 62Ukr5nSQj+YxxnKS+ud2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="20241705"
Received: from dpotapen-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.59.81])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 04:33:56 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 2/3] ASoC: SOF: Intel: mtl: Add fw_regs area to debugfs map
Date: Tue,  9 Apr 2024 14:33:48 +0300
Message-ID: <20240409113349.21623-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409113349.21623-1-peter.ujfalusi@linux.intel.com>
References: <20240409113349.21623-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose the firmware registers via debugfs. it can be of great help while
debugging complex issues.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/mtl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index dc203505536c..5d3b2d4be78a 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -25,6 +25,7 @@ static const struct snd_sof_debugfs_map mtl_dsp_debugfs[] = {
 	{"hda", HDA_DSP_HDA_BAR, 0, 0x4000, SOF_DEBUGFS_ACCESS_ALWAYS},
 	{"pp", HDA_DSP_PP_BAR,  0, 0x1000, SOF_DEBUGFS_ACCESS_ALWAYS},
 	{"dsp", HDA_DSP_BAR,  0, 0x10000, SOF_DEBUGFS_ACCESS_ALWAYS},
+	{"fw_regs", HDA_DSP_BAR,  MTL_SRAM_WINDOW_OFFSET(0), 0x1000, SOF_DEBUGFS_ACCESS_D0_ONLY},
 };
 
 static void mtl_ipc_host_done(struct snd_sof_dev *sdev)
-- 
2.44.0

