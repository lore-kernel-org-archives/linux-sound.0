Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E1B261B8A
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 12:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762864677; cv=none; b=PTAb4x2MjyRo1Dh1ExwejTnAKkxJBGrjvS3z9JHcfdwys5YhjPf5J2vUBJJM7hDFazUY7ZdjITtUUGMZCsn9NkO7mlMGzqQY874LZLsppoxRsgI0yHGAmVQykb/B8+Ou6bPwLtAYXsL+fphU5sz0mDqE1RFqz9jhdGoF+48+6pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762864677; c=relaxed/simple;
	bh=0zN64rI1oG75ew1Cs3i+78XSp2dEUoLo+WfeOhtimew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LdXXPVluS9Pz+amMDBUbg18LSSEqbgLYPUCxSztjgNcU1uyWiw5ywV6f22DNUtfa68sI4jZ/9Fjns50Us/K0JzU9471MwEkdRM1xTJ+QqvTi6uY8V8RhilOogJHlAPaxcD9vnwi+S5iUiKsZ826ZW+nd3bqvqiuOmZba2ZM7Fyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m0yReLW6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m0yReLW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762864676; x=1794400676;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0zN64rI1oG75ew1Cs3i+78XSp2dEUoLo+WfeOhtimew=;
  b=m0yReLW6sNWnZRm3bQx8H2BeqGye644PZxzUipVqt8o39PZloy1+WAf4
   cRpKKHNsrFq4+g8rHO6z77Jp5FIwyvhEqRhD2aQiZV4KJRIaaOJ1q5Led
   TbWUM0db8oKZi5Vz+LKQVofYJ+r/JX4aHf4ug+VwMYvoH5ZRHtQK6TRMq
   SVzyp4riPxJgaX5XSjiB9L78AJy4GlTUEuEyvLKkJbpSBlR6okMLFrrGx
   VCEZy0eoUyj3y1ns9oKXFTj0k2IspEai/rip9elnvpQ1OJOgyV/a1d1sS
   0JexqpQce3ARYunFW9ncMeC8QZHeWUCJo7JUWoXPrpoLa0Fu/Iho8hg4O
   A==;
X-CSE-ConnectionGUID: 34Oq08ZSRkyAfRxQ87D4gQ==
X-CSE-MsgGUID: Cz2Z7TDvQd2UQBjwyxWTRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64129474"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="64129474"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 04:37:55 -0800
X-CSE-ConnectionGUID: ihaVaxeMR/Wfjd5YeB3vAA==
X-CSE-MsgGUID: MSzE3X7mTteOtOP/35JVsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="189217536"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 04:37:54 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com
Subject: [PATCH 2/6] ASoC: Intel: sof_sdw: Add quirk to exclude RT722 speaker
Date: Tue, 11 Nov 2025 20:37:33 +0800
Message-ID: <20251111123737.246626-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111123737.246626-1-yung-chuan.liao@linux.intel.com>
References: <20251111123737.246626-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mac Chiang <mac.chiang@intel.com>

This SKU does not use the RT722 internal speaker. Add
SOC_SDW_CODEC_SPKR to prevent DAI being created via
codec_info_list.dais.quirk_exclude.

Other SKUs continue to check higher-priority sdca_functions
when the BIOS SDCA property is present.

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index c013e31d098e..70955ca60a31 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -757,6 +757,17 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOC_SDW_PCH_DMIC),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Francka"),
+		},
+		.driver_data = (void *)(SOC_SDW_CODEC_SPKR |
+					SOC_SDW_PCH_DMIC |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
+	},
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
-- 
2.43.0

