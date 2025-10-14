Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C84130CDA8
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 07:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426040; cv=none; b=GG/5mvZcRi+EimE+xvRfsdmCWh8vO9S0Aq0x6+FP6pG4SIt8GzhKG6A8re4XSIaslGZiRWToLkWNfo3Bg8mxoKXkZ5f99FJWAOMaJq37XO99pV1l3kYfhKbCNi6POwdsR2JZVzmN9KYZrrIMiFQ2WrFsZdkZA6ZQKzHFkRl7hqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426040; c=relaxed/simple;
	bh=0soeWk+380Jn852hWFcK5qQ49qwx2u7SgSaXL/r2MuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IGzc3V37/hhVk2v837/8w9xtT1M1R0Jk8WfZz5QFwJqRH2J9A31jdy4XmWmfG3jccac6HcLLqVmgIF/wNMgneQy2PTX4SUUnQ2V0n8djJw/r066uwPsf7hWHVlg264FVakDV6JqHhUWPcuXgB/+BV0HsFosMoxNaIn6yp79l8vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gIGbvmER; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gIGbvmER"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760426038; x=1791962038;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0soeWk+380Jn852hWFcK5qQ49qwx2u7SgSaXL/r2MuE=;
  b=gIGbvmERnyNGAiNGGU2A/ZfjF7RXxvTkH8UqDBtC6qhW2Pq8kbh/NjB8
   ew9J8neAu16TuckOSB5FrpphrmxLSj5PfDAAMv5vWoMpy6jlQzLrCYJgq
   l3UtAQ6fGQURq3ujuUdB2Khh2mHvD9Nb/HppcjWk1U9CZYv1iw0XUXpr/
   33U+aAvhJq2P5FhcMrVuYo3+ZvbodYwcp73niHoKVRhb8lVQep90GZouq
   XYb+nosnevor5QUzcweon7U5lAEq0FJQ78PWgTIBOTu/Dx8YF7TvNe99u
   TSnEGtRYkC+oxmpN8F9u4J25DjqGQ6z1l9dFTUMLWq3sDg1j5b7Z8utRh
   A==;
X-CSE-ConnectionGUID: qo8SEL4+QJ2mP5Fhq/4p+g==
X-CSE-MsgGUID: AcqJQEDTSlmDvO47mmfw6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66233680"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="66233680"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:13:58 -0700
X-CSE-ConnectionGUID: 9+18Xu3xSYu7dunEqUcPLA==
X-CSE-MsgGUID: lI6FyPiPSZKRUvcIEJ70yQ==
X-ExtLoop1: 1
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:13:56 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	niranjan.hy@ti.com,
	sbinding@opensource.cirrus.com
Subject: [PATCH v2 4/9] ASoC: Intel: export sof_sdw_get_tplg_files
Date: Tue, 14 Oct 2025 15:13:30 +0800
Message-ID: <20251014071335.3844631-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014071335.3844631-1-yung-chuan.liao@linux.intel.com>
References: <20251014071335.3844631-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sof_sdw_get_tplg_files function is a callback of snd_soc_acpi_mach.
Export it to allow other modules to use it.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Simon Trimmer <simont@opensource.cirrus.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/intel/common/sof-function-topology-lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/sof-function-topology-lib.c b/sound/soc/intel/common/sof-function-topology-lib.c
index 3cc81dcf047e..f685c1c5c6f0 100644
--- a/sound/soc/intel/common/sof-function-topology-lib.c
+++ b/sound/soc/intel/common/sof-function-topology-lib.c
@@ -133,4 +133,4 @@ int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
 
 	return tplg_num;
 }
-
+EXPORT_SYMBOL_GPL(sof_sdw_get_tplg_files);
-- 
2.43.0

