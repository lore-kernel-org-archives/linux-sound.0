Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4931DC1AB
	for <linux-sound@vger.kernel.org>; Mon, 15 Sep 2025 02:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757904908; cv=none; b=e0gSY8cF7uvBL5jrc2h8RCkhwPQ1pWJYBYI9WJGSfjzP2W7s9v7UthIjNk4j+7lW7iOJU3e3hSnFcI7zy5CuAWO4gQcrnM9OQLJunD61IoPFd154Id/V3zm0NSmZWB/656W5i7nTi1kYygJ69qCSySFJu8HPjyAND1mE9itG0Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757904908; c=relaxed/simple;
	bh=pu/LeYnNWQyn4OwquQj2kQo61/ylo/yK0GWMfguGQp4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u+ZrS2Pw7b+0oK3Qi78Cmy7wbV40ISinlYdesg6XTTuz6eAO7TegPOpNzOKVUot8w8uvMwwq7pzJ5gPKd6S2t9LW4B0RIeKrxmNij1J2usrRxCvqKOu/T9+FblexS4DDJK4L/f5jQmxZjdR02AmP367tg/cgQ3XD5xjsd5gTR44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JcgTGbNs; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JcgTGbNs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757904907; x=1789440907;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pu/LeYnNWQyn4OwquQj2kQo61/ylo/yK0GWMfguGQp4=;
  b=JcgTGbNs+O6XsFx43Uhjrwtozl7IQFd5r1IwflBd427hLQbDvUE8ZCov
   ZPBbUCsO1w+t0r/xqvmp/fe/+4ajIYFJM/fVCqDc0TgnpCpT2BiLPaZjc
   KVegdMVNIGdq5UnLSL+r98y2owJ1dGWAlxscOP6q0qKEcaalTSDnVBvXF
   O8Y1HeLMsjmD5nNca4R69JR3wO7Uy3TPiAh5fq8iLm6G52bLDGOghTzx8
   +4C1WlVdKJ+zBOXvV4IDWL6gH1lmFmRtZGaeSwKs8LzgbxlvchGLGd4Nq
   D/Hg4AHewMoclcGayj1tukSAGbSPlYUlDpwWo3bFby7bw+KpozCjNJkpc
   g==;
X-CSE-ConnectionGUID: CacGdB0YSlm06o/QiqLxew==
X-CSE-MsgGUID: lIMD/cD4SVKSGgj49q6RUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="71575203"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="71575203"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 19:55:07 -0700
X-CSE-ConnectionGUID: QycVMYEqSUW5mqZ0ViiRIA==
X-CSE-MsgGUID: UF8ebv6NSICzyLSq7lFhYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="198207015"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 19:55:04 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com
Subject: [PATCH] ASoC: Intel: sof_sdw: use PRODUCT_FAMILY for Fatcat series
Date: Mon, 15 Sep 2025 10:54:56 +0800
Message-ID: <20250915025456.1154200-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mac Chiang <mac.chiang@intel.com>

PRODUCT_NAME is machine-specific. Use PRODUCT_FAMILY to ensure
the machine quirk is applied with consistent audio configurations
across Fatcat series products.

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index f997b2dc221b..28f03a5f29f7 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -761,7 +761,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Fatcat"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Fatcat"),
 		},
 		.driver_data = (void *)(SOC_SDW_PCH_DMIC |
 					SOF_BT_OFFLOAD_SSP(2) |
-- 
2.43.0

