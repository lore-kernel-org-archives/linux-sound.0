Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0201213CAB0
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469142; cv=none; b=gCZLSg2VI54kxWVCUOjeDgzOy86/QmfCqjctlupPGKOtGYx2OEsNyphnT3H1+shMHvNVORGx5YAbJ80JtMqx7+U1Za0/dqi7E0oTeRbPU6VkeycosO1wxWLlT02OURZNJql4HISEqqiedKgv5c6xsKhtExhCwzhaDQdNSuMWFaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469142; c=relaxed/simple;
	bh=O+Ky+A2ECkzCjjUcmHynmaUbtkzO/Mm/j1upGJTjpl4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=km3gpZE6k5xhctXXSECinylkhFTmRho++CBwYPsnxFqzCuz0bTsGQmkPoe8BlrUWnPs6rjqobxq/UduzeqtMzcmwRgWGyyhordj2aZ1UGiX9LpewSLvL82pvg7+fejEXjczCTohi5/C+zONJRaXhN5L3028o46YvAGm/nBRAn3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AxkX7TtX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AxkX7TtX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469141; x=1743005141;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O+Ky+A2ECkzCjjUcmHynmaUbtkzO/Mm/j1upGJTjpl4=;
  b=AxkX7TtXbiVHBMTfVtkGE6GfYqrMvLm59DPH6iw1zGSz6xzF7ilmxT4C
   Wba1KLIKS/7OC3Q4qVTCy3GFIy51CWhU4+HzRICAqP50uFmWl28RY/TOO
   9qopMpzjFQAiMj5Zbo14V169Q1M2RJEyH3v88/KaP9OKMqDAHpG8UhU2Y
   Kwrxyu9RVvpr4ITXY9823HJBey7zfRXEVR/S9emCTXJr0xBt1Zsi3OA9i
   llvdJntmN1jrmeWrteCG9yMd8l8rQzIdMfE/bG3t9pDFzcfuXjSt/alGt
   qnwA5Alr4exEy8MChn7Zy9878kjaiR5JC/zvUbdduZt/RP+FLioXAAUpK
   w==;
X-CSE-ConnectionGUID: U51vsnqxTBmeVs1Z4DCUfw==
X-CSE-MsgGUID: O0ZSCuFdQD+6qfKBD2kXBw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260547"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260547"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:05:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482479"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:05:04 -0700
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
	Chao Song <chao.song@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 30/34] ASoC: Intel: change cs35l56 name_prefix
Date: Tue, 26 Mar 2024 11:04:25 -0500
Message-Id: <20240326160429.13560-31-pierre-louis.bossart@linux.intel.com>
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

To use sequential amp numbers. I,e, AMP1, AMP2, AMP3, AMP4

Reviewed-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 4 ++--
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index e06efc5b1457..7e53266d831d 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -373,13 +373,13 @@ static const struct snd_soc_acpi_adr_device cs35l56_1_adr[] = {
 		.adr = 0x00013701FA355601ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
-		.name_prefix = "AMP8"
+		.name_prefix = "AMP3"
 	},
 	{
 		.adr = 0x00013601FA355601ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_3_endpoint,
-		.name_prefix = "AMP7"
+		.name_prefix = "AMP4"
 	}
 };
 
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 007f1ac2327a..0cef3d788a5b 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -464,13 +464,13 @@ static const struct snd_soc_acpi_adr_device cs35l56_1_adr[] = {
 		.adr = 0x00013701FA355601ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_l_endpoint,
-		.name_prefix = "AMP8"
+		.name_prefix = "AMP3"
 	},
 	{
 		.adr = 0x00013601FA355601ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_2_endpoint,
-		.name_prefix = "AMP7"
+		.name_prefix = "AMP4"
 	}
 };
 
-- 
2.40.1

