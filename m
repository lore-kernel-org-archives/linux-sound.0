Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C676515A863
	for <linux-sound@vger.kernel.org>; Mon, 16 Dec 2024 03:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734319932; cv=none; b=Tfe+FU/GrRlxZR5ZFsUBmIad1/H0LconMBVv0QcsWDXUZrVneIUrb7vMwmGPHL6ER8DytmGlcJmAn4eJi7hbdxgzrmAQQ+ydEMtz5EiVf6IZt/BLG4iPmg/pWDaEbK5Ck6ohEgszeBC2TVrUX7NBK8D90/iNhe3aNqOtA04P5UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734319932; c=relaxed/simple;
	bh=R5Bp6QL4cWjEDqo8Z5L0amoqYrduxeWZBtC5J22QYSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QBZcnXdBRx4/FPLcS8o0gwYzfBZMDDwF99AE8rVVm6OZ0lXwDU3V15RzBFaTwivuNhWu+KlpGq73IsN4yn3Ssrb1e1g3i9+ETi8Bhyc1wPlQFkvFdygPQPh0wnSvTjU4mlXzA1Ygs3yH5emoykdJC7/85sT5ayp48spNozB7MZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YbYlaVnO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YbYlaVnO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734319931; x=1765855931;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R5Bp6QL4cWjEDqo8Z5L0amoqYrduxeWZBtC5J22QYSE=;
  b=YbYlaVnOcwaKchJ1VcBx1RXGkTCwiCQn70xbt2TENmDqyhUIv3YwW38y
   i7DN8ZmwGnHsZobviSZ0334vHvkWGojRJbNgajHBEIA04YQqzuDhDdihk
   2ygeEcD1EazUVykZIxSFaSUbtYvWzxYwPJhSNd8RD/f9XEgovcA2sjkTH
   1pyfZW1hhTyTG6ah6TpLGwHkM6jg85E5jF3Lyas5t+hmrXNmf4kYE35uT
   ZkemgCBh7njY0P57m95e2QaJdPX8WFWQ3Ff/uIgUEMhXwCIG2kLp8AZ5b
   UOcvB3T2SzBP22z7J6Dm7tnVMwq0j/Xtc5TOhz4se08KKX9lqd0a/BPi4
   w==;
X-CSE-ConnectionGUID: V90wlxxbQriozz67PI+mgA==
X-CSE-MsgGUID: cV0R+DIwRIioNT6+2Ri8Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="38468378"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="38468378"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 19:32:11 -0800
X-CSE-ConnectionGUID: m182FaBjR2CZcNcsKbF/qQ==
X-CSE-MsgGUID: v0XFDqwBQImNtigh6eeouA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="96978245"
Received: from spandruv-mobl4.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.238])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 19:32:10 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 2/2] ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 21QA and 21QB
Date: Mon, 16 Dec 2024 11:31:59 +0800
Message-ID: <20241216033200.131362-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241216033200.131362-1-yung-chuan.liao@linux.intel.com>
References: <20241216033200.131362-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Fitzgerald <rf@opensource.cirrus.com>

Update the DMI match for a Lenovo laptop to the new DMI identifier.

This laptop ships with a different DMI identifier to what was expected,
and now has two identifiers.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: eea00cd603b6 ("ASoC: Intel: sof_sdw: Add quirk for cs42l43 system using host DMICs")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 139f4306dc87..9f721b88e606 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -637,7 +637,16 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "233C")
+			DMI_MATCH(DMI_PRODUCT_NAME, "21QB")
+		},
+		/* Note this quirk excludes the CODEC mic */
+		.driver_data = (void *)(SOC_SDW_CODEC_MIC),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21QA")
 		},
 		/* Note this quirk excludes the CODEC mic */
 		.driver_data = (void *)(SOC_SDW_CODEC_MIC),
-- 
2.43.0

