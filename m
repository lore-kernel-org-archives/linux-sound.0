Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25E22E62D9
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 12:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762864678; cv=none; b=pROxg46kZNhGRa9QZ0bJnW/9vEjftb1nC1tebGKIY/15MQW1k8h5zaFbnS7csRJjluM1M8Jnvq90XQBhNB6Yksjpl6FmppcekFgL6mKULQfol26MneRAtZJjn8Dv8zQiKJ9pZi6Pii3arHwy5eNyb5xHRE5jJvuPO0VQU1+wLwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762864678; c=relaxed/simple;
	bh=K4oRdMZ9mQyiCno2zWg3M7uyNlrMkoY/Xjfbadffka0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1FEBDQ9JA2BlS1/r6wixc/LMhLSFDWIC3KD91Xo1V3OTJ2QfG8NgqRS96Ftmw482i7CE0xT2Sm2usJMdXi5TBeR5mGjFesq5/mYrmbe7U8j1jcNzuYMLxioyxs0vaE7UNnFv8X6gEP0PdhPtLgvuGkzk3umg3x+xJpGVHliP50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gqALt+du; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gqALt+du"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762864677; x=1794400677;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K4oRdMZ9mQyiCno2zWg3M7uyNlrMkoY/Xjfbadffka0=;
  b=gqALt+duEhIKC5zbUWBk4gud2dFbFQSyrMyVIBkYbrbIzF3c86XjhEFr
   qFCFNXTYdIHBWU9mJTme73ro+9ymKhhzd+mZ/kkyPfPXiuspmMGot5MnX
   v7YvDS5APkzO3xgeXEGd53si4Q5hwaswhwQBn4DsF8gU6ZmnNHwHmDE+F
   JNqQyUfTA299GUj1Sqxm72f/26+7Gn6IuO1j66LxCiKirBeZyxeI2nOV+
   9glJbpopoZresDsuEqufXxDf0u0ksFPnF7xX7ZJoGM0YJuaEhsmvMa1W4
   TQjOoH1VcVhyaAWHtI/daLmaYnbi0I71O+taXimHWZyhfY33QuRTz0kcP
   w==;
X-CSE-ConnectionGUID: TkZlP+LaTd+smWWAC0Hc9g==
X-CSE-MsgGUID: WYEqgrhnRaK894WcmI1DmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64129479"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="64129479"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 04:37:57 -0800
X-CSE-ConnectionGUID: qXZKp5CCShSnru4nx5NFLw==
X-CSE-MsgGUID: 07N1fFDaSBKY64GRswJ8YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="189217540"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 04:37:55 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com
Subject: [PATCH 3/6] ASOC: Intel: sof_sdw: add quirk for Avell B.ON (OEM rebranded NUC15)
Date: Tue, 11 Nov 2025 20:37:34 +0800
Message-ID: <20251111123737.246626-4-yung-chuan.liao@linux.intel.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Avell B.ON is an OEM re-branded NUC15 'Bishop County' LAPBC510 and
LAPBC710.

Link: https://github.com/thesofproject/linux/issues/5529
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 70955ca60a31..a7f39b83bef7 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -230,6 +230,20 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					SOC_SDW_PCH_DMIC |
 					RT711_JD1),
 	},
+	{
+		/*
+		 * Avell B.ON (OEM rebrand of NUC15 'Bishop County' LAPBC510 and
+		 * LAPBC710)
+		 */
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Avell High Performance"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "B.ON"),
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					SOC_SDW_PCH_DMIC |
+					RT711_JD1),
+	},
 	{
 		/* NUC15 'Rooks County' LAPRC510 and LAPRC710 skews */
 		.callback = sof_sdw_quirk_cb,
-- 
2.43.0

