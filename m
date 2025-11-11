Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D638933120A
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 12:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762864682; cv=none; b=jIpI25FTbpnEaCOBbKdh44faWbB6graAItdz5nKMwP30whPPBDypzfZRGtJ+YFQ4/gB8magg0+482pPOGavbKy9sMuNHPpQwzKG13If6SF4ai8ZAhWu66TY5m523/2wpkyyGgj6TZm0IZdECBZv7OXgzGXWpXAA9pnLgFRv/soM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762864682; c=relaxed/simple;
	bh=Cw4qXBZO374NG5Tsznt9SfbyO0jANUdJ7ZYecmehC9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dP6WyGwb/hJhhjVNbNPq+SruH926VfiLe0GAqo8Tz7z3K0V8bmOe0LVNEEri444UShuqQohFV9eZbKbobaU/Lfaek8K5ZslIbT/6s4dGR0KOzgc4MqBxN+NIlxBIfnwgIf032B9p+avzuq8c8q21tGF8mnGvWIxW896JGM6bu0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZaAuflOg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZaAuflOg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762864681; x=1794400681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Cw4qXBZO374NG5Tsznt9SfbyO0jANUdJ7ZYecmehC9k=;
  b=ZaAuflOgmTOEBxNiZxTjH+fRVE76b27kLZq79R61PgvBUg7rQNiQW13h
   3Iuyz9WB+HJW2t9ConZnYW7HiA3fZsoHgMF9DxfIuu4KzW4Bh05niIGUK
   GrBaYv5YJAuNFKeyJUDPJhSXwMzb0aWQ4ejaLbn7rryKUREfYJBezjU9l
   uA7uLDj5Xh1To0apJxt3ZRwbmP8fGDa0c8P5fvqVo5FwZxpcqZugAmOuO
   gCIqtsekdBgBDr8xp27j+3p3bv7EmAzpKy6Mp7rEwoV5mEml9Nbw0D4th
   DzBNgmwF1dp6adZ5qpjjTxtLJ6BacsbESdmWPAATpIz1WspcjSmJBiVNO
   g==;
X-CSE-ConnectionGUID: +dZpkMc9Sh+xGxl2SSv3wA==
X-CSE-MsgGUID: v+Hg4NXZQpuDbhjv6Tj9JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64129491"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="64129491"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 04:38:01 -0800
X-CSE-ConnectionGUID: H+8GOOh/Rryi+vydgvPVPw==
X-CSE-MsgGUID: xXGo/YqbR2aYn7u56Z5cPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="189217550"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 04:37:59 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com
Subject: [PATCH 6/6] ASoC: Intel: sof_sdw: add codec speaker support for the SKU
Date: Tue, 11 Nov 2025 20:37:37 +0800
Message-ID: <20251111123737.246626-7-yung-chuan.liao@linux.intel.com>
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

This patch adds Cirrus codec internal speaker configuration
to support the cs42l43_l3_cs35l56_l2 machine.

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Reviewed-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index cb57c5b3a2dc..6c86a79e8c24 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -771,6 +771,17 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOC_SDW_PCH_DMIC),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Lapis"),
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

