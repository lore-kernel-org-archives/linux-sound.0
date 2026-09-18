Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E231543A81A
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 11:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729882; cv=none; b=QPcCmvBN7Jraz9a9CxrsesSD4uMsYmujUtV4qr+SMhVD1wIOLoMFBa7K9Bv9oHbtt4wBMG7Rfv11IpE/O6FPoLa5bd230wtiLmOqiOCpuQ6ExCNPxQvZg9ZAO4JvP0oF8z0n3J92SgHIu2ezeNk1QrQkqP9PAPSwS8M+oHqJdl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729882; c=relaxed/simple;
	bh=iYY7WaxE6Ml/re9Qna2pQjibt+yQeaeHdX/vUWyCqAU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hZ4lHJHIBmZ6ahciyZqTVwgRGXKIUIymHbArZz0HqeIizZ85iTLX4YntQaCvZl0rDkwbn4dGMkC89VZc0Xhk8iG2iMBnzEoHbh6UjVmg8gPbQ6qfrkI5EviY+jOrbwjgJqVhsIx5qhADhJf4INpud/2A4d+YjovRkCeklDqe85Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AN9A+L7h; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AN9A+L7h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789729879; x=1821265879;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iYY7WaxE6Ml/re9Qna2pQjibt+yQeaeHdX/vUWyCqAU=;
  b=AN9A+L7huX1iAN0g+q0FqNcs99gLKbhOQ84hrWJolu3uVgyRGqGrJz1T
   hcc4Xit/ZLW5MGbH29XVszeH6Y8g5voRNAHnmMlQRTa6MMKeHwf7pxxAa
   Y+AQhlpKjZI5JYF9Dh3qkAbfrp7YH3KKJC6d1/8R/xLraNajZCf+sGh1J
   ft69wLZNP9XxyouAJZUQXVXStGLeUvBGHecVGmccN8wMJ3YG8Orfqt6vI
   yFtJT/mMhLS29R4Uwnnng1gSdjCa9jl7ZRA9hRJnWW2Di00q0XA1O1guE
   yPfN74lwlXc2pJeEbYDzpA8kg8n6+FA+l2GoL7Qkq1N6YrSZybBvwz5AF
   A==;
X-CSE-ConnectionGUID: N91RZU5pSPqMfhsGvvis5g==
X-CSE-MsgGUID: +ByhFhqRTDm3CHPSnzx7Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="90095327"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="90095327"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:11:14 -0700
X-CSE-ConnectionGUID: tTyLwItbR4yUGw8TQ4an3Q==
X-CSE-MsgGUID: gZuvIhWgR5C2h9hbwOq2VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="297824460"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa002.fm.intel.com with ESMTP; 18 Sep 2026 04:11:12 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH] ASoC: codecs: rt5514: Fix the pm_ops constant name
Date: Fri, 18 Sep 2026 13:15:30 +0200
Message-Id: <20260918111530.3589280-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To improve readability.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt5514.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5514.c b/sound/soc/codecs/rt5514.c
index 8dad8ba0fe0f..753143e2d11f 100644
--- a/sound/soc/codecs/rt5514.c
+++ b/sound/soc/codecs/rt5514.c
@@ -1332,7 +1332,7 @@ static int rt5514_i2c_probe(struct i2c_client *i2c)
 			rt5514_dai, ARRAY_SIZE(rt5514_dai));
 }
 
-static const struct dev_pm_ops rt5514_i2_pm_ops = {
+static const struct dev_pm_ops rt5514_i2c_pm_ops = {
 	SYSTEM_SLEEP_PM_OPS(NULL, rt5514_i2c_resume)
 };
 
@@ -1341,7 +1341,7 @@ static struct i2c_driver rt5514_i2c_driver = {
 		.name = "rt5514",
 		.acpi_match_table = ACPI_PTR(rt5514_acpi_match),
 		.of_match_table = of_match_ptr(rt5514_of_match),
-		.pm = pm_ptr(&rt5514_i2_pm_ops),
+		.pm = pm_ptr(&rt5514_i2c_pm_ops),
 	},
 	.probe = rt5514_i2c_probe,
 	.id_table = rt5514_i2c_id,
-- 
2.34.1

