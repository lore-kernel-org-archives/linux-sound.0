Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F04F1327F3
	for <linux-sound@vger.kernel.org>; Tue,  9 Apr 2024 11:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712662443; cv=none; b=W6hwc8eY3Eev8ZnZ6MICuio+TSWS1LhaFzO1ys7+7qaLECEnWJENd1joUBxOdk4GDmAhXfSDhQ35jgKLyAJCz00JdzqK+ny6H3WtLUCN6a34Jke576vbtT6zpU6EpCATq/3KjCD7TxBMDI+3PdQvyZJCbri6Qy0qrFiGaCU+MRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712662443; c=relaxed/simple;
	bh=+7dFJArZGLBTWLHXvF+QfUzTm8KCSomXTR7DgJEDMtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hedYX1OoUwdml/IDF0RAL6ypgvueWevQU14iiwF3eVOIPD+Ks57sfv4Mo7Xhjl0VNFh2slbFqczLS8buDFtnWy8oo+2xQSHYJunm7Qqtzu7r/1Af/lGCFcba/6Q6CK7rQhB8AzJYzHHCJ7NAKsILP14b/E+RyvVYImdoG4dYlJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQnk3fhU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQnk3fhU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712662442; x=1744198442;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+7dFJArZGLBTWLHXvF+QfUzTm8KCSomXTR7DgJEDMtQ=;
  b=HQnk3fhUqjHMt4OWX6MuwyKT2eYyWyMm2eU5r1ue2gM/ybE/UFTqRaUA
   RYlliKLHkawLTZ1MAp9W+pXmenMyleM9DD3PHZTMJZTUdKdF5K23KT5tx
   Nt1/zxOcmlXKzR5LoYJw7xPv5mmKAumULzhtY/UtH5OwMY16DM4AqIdlp
   tv2zQWqcs39e10K3dqKAdHrAEfm5Npaz8v5ECcroa0BfvI3kGCOFJy9fp
   HBqVEXDkvOz3htmzA6QjA9ZtsgLIV/+5YrqTznGShEHid29WU8GqOTXVA
   rNhUpKEWbjV3zI2IWvau/O89/UeWz50uZYNViopkeZPtcMNpVzaeOasH3
   w==;
X-CSE-ConnectionGUID: EwyOs+slR6SrTD5X3PXZ3g==
X-CSE-MsgGUID: 8nRLrqZpSjqpV6FpfR0EDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="18687801"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="18687801"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 04:34:01 -0700
X-CSE-ConnectionGUID: 7DjKWAbNT2y6kGj69i9vyA==
X-CSE-MsgGUID: qIkpdU8RTjaUrrcq7EJmEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="20241711"
Received: from dpotapen-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.59.81])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 04:33:59 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 3/3] ASoC: SOF: Intel: lnl: Add fw_regs area to debugfs map
Date: Tue,  9 Apr 2024 14:33:49 +0300
Message-ID: <20240409113349.21623-4-peter.ujfalusi@linux.intel.com>
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
 sound/soc/sof/intel/lnl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/lnl.c b/sound/soc/sof/intel/lnl.c
index c3ee507e2e21..82c975823ab3 100644
--- a/sound/soc/sof/intel/lnl.c
+++ b/sound/soc/sof/intel/lnl.c
@@ -28,6 +28,7 @@ static const struct snd_sof_debugfs_map lnl_dsp_debugfs[] = {
 	{"hda", HDA_DSP_HDA_BAR, 0, 0x4000, SOF_DEBUGFS_ACCESS_ALWAYS},
 	{"pp", HDA_DSP_PP_BAR,  0, 0x1000, SOF_DEBUGFS_ACCESS_ALWAYS},
 	{"dsp", HDA_DSP_BAR,  0, 0x10000, SOF_DEBUGFS_ACCESS_ALWAYS},
+	{"fw_regs", HDA_DSP_BAR,  MTL_SRAM_WINDOW_OFFSET(0), 0x1000, SOF_DEBUGFS_ACCESS_D0_ONLY},
 };
 
 /* this helps allows the DSP to setup DMIC/SSP */
-- 
2.44.0

