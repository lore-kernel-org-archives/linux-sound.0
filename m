Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7823D1F8908
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 11:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568243; cv=none; b=J8dddyGf8P8gWViU1fCWubg1QqENY3OF/uWrBASOpSK7z1OiEOEEGBy7vXFgWOnsFIsmdxtGcAWDLXHDXJl9pdpYqtG/QiAQmoG07IYMV5RjLvjKkr94DQ4OCHuAKkIOHrlcSzJFU2e6Lmqzom8k4AG0BycQKWAsNaEuah+zLl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568243; c=relaxed/simple;
	bh=UpzeydvYq7LiO4BlVm4/e1ymDJZjORQyEKrmlQITxgI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uOEk/1wOgB6LnSwlahKztK8OzuKn8Pm4Uix8SEwWYGAX+dDaC2W2jDF2JaCHn8pe17eNT+VB8dTzSmGis54yP35VFtDz++MJm1095C8VOeS5CaZJEXcaGT8T85yoTBmIfzM+YQF49a/OJRX2jEBSpyxxNxypsjqDy7QssbdswCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hkd13dMq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hkd13dMq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740568243; x=1772104243;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UpzeydvYq7LiO4BlVm4/e1ymDJZjORQyEKrmlQITxgI=;
  b=hkd13dMqcvfWLFADRpJmD7hr5hfKtWwLRp4DGDG/4LLZLApbSk1Ztx35
   i9rGnc5qvch0YRlPosS1Ws7sp9qT/UKHvNmqtO3e+Ef8ItUs90bZkBfDP
   X7FVSkJ8RnEFvJNWeTk2H54Zkbr7NLzwqNu9XQdO1DlbJhmADzRqYrr9g
   OEuBxdXIsPE7LdcEakDVgCT+pdfPadyDPRmBUIMI7JfKTjVWEEmJzCC7R
   rupN4vH+pG6Av8cUi0G+ao4w7Rb7xCve/XP6RWdbc3eWGREjaIDNre0vY
   DJoggELRG97eeZ4c1n+eyMpmNxgJf8OJ55qSfX17odSdTtpjxDFRRuGx/
   Q==;
X-CSE-ConnectionGUID: KXkF83tgQxus5EU44UJYnA==
X-CSE-MsgGUID: RMbIdHpZQXe7JB/KfUB82w==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41111183"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41111183"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:10:43 -0800
X-CSE-ConnectionGUID: dsliu+u0SvWQkv/hEaGUBw==
X-CSE-MsgGUID: oppznwmJRsK0QTZuudRFOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116685188"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 03:10:40 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	flove@realtek.com,
	oder_chiou@realtek.com,
	shumingf@realtek.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 18/22] ASoC: codecs: rt5670: Fix definition of device_id tables
Date: Wed, 26 Feb 2025 12:26:08 +0100
Message-Id: <20250226112612.166989-19-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226112612.166989-1-cezary.rojewski@intel.com>
References: <20250226112612.166989-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There shall be no comma after the terminator entry and initializing
fields with 0 for statically defined structs is redundant.

While at it, sort the IDs alphabetically.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt5670.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5670.c b/sound/soc/codecs/rt5670.c
index 30bf96c35b58..c18fc86a2513 100644
--- a/sound/soc/codecs/rt5670.c
+++ b/sound/soc/codecs/rt5670.c
@@ -2880,10 +2880,10 @@ MODULE_DEVICE_TABLE(i2c, rt5670_i2c_id);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt5670_acpi_match[] = {
-	{ "10EC5670", 0},
-	{ "10EC5672", 0},
-	{ "10EC5640", 0}, /* quirk */
-	{ },
+	{ "10EC5640" }, /* quirk */
+	{ "10EC5670" },
+	{ "10EC5672" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, rt5670_acpi_match);
 #endif
-- 
2.25.1

