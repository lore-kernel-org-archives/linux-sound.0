Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68F41A08A4
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 11:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568212; cv=none; b=bl8HAjIISd+adKhQSL8NrGdZ2icVXp4TQpCVQmcL2WMtykJFx6cJuOzFCsmt6ktLZjZH4Twud176wgAYKFB5kIDedwQRHfvDEEl67xWTZmubU4kk8FJm9s1gOAFndrziZy/Sl31fJEe0YPB52mAR4Zy/QgChfIsgx+kNOXfBIKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568212; c=relaxed/simple;
	bh=L2g7sWipP4x5MM83sDiVIwxWSjNUx40E1e7+CF9nSoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KjsQe11j9TiydzsKvuVtUhiPIv6v/pB+FVQVgyytVvaL303vN1t1D/xn2tcteQ3+fboYS+Add+JZuOqDVf0a+JpDp72Xy3Bi8zlPEJkEOMQB5A+WlFERNWUNBggos1yfbwWGj5YAO+7tJaDhB9q+4GJwyFMZER68F/T3WNmBbRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YWbMO+TY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YWbMO+TY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740568211; x=1772104211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L2g7sWipP4x5MM83sDiVIwxWSjNUx40E1e7+CF9nSoQ=;
  b=YWbMO+TYw7h+xs4bSNEmJsm/7UKSrBkpMupoxG9Sga1mwHTd93uDdMzg
   W291p5i64tt+ULts9Cph+AIWYaEgLPGA7DcTrFLygnlvhyJoi1Pp3Mji6
   N4ZSxQnuQUINjZZllytcHJIuVEXmrf4o3ehWbWwG6gNALh9VfRHjvAgYW
   ZHO7o0aVGGAnJao7gJVqEo5ZBtNnNJSscr9X0Ye2uXUf8CZfUsfS9+NXY
   Ms6iKxECFAnyF3S5z3b/yAPjITdOIBqlNhn2Ao6ALDqaq18ZE6Q5N3kmX
   DuTPtPo5dUBP4NluTt6eeFtC4nJeGUATQSnQo+QACOzjrDSwx/5sQgRla
   g==;
X-CSE-ConnectionGUID: WAjyxtOPTI6xfCrpM36LFA==
X-CSE-MsgGUID: rWMMP/rCQTmjGeqqg5mJHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41111075"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41111075"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:10:11 -0800
X-CSE-ConnectionGUID: xaKEgfYiRIOcm1KHvuBMdA==
X-CSE-MsgGUID: 1oK5Oj6UT2Gz6d2fnyrm5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116685044"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 03:10:08 -0800
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
Subject: [PATCH v2 06/22] ASoC: codecs: rt1308: Fix definition of device_id tables
Date: Wed, 26 Feb 2025 12:25:56 +0100
Message-Id: <20250226112612.166989-7-cezary.rojewski@intel.com>
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

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt1308.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt1308.c b/sound/soc/codecs/rt1308.c
index b366338cea71..90d14e2d62f1 100644
--- a/sound/soc/codecs/rt1308.c
+++ b/sound/soc/codecs/rt1308.c
@@ -781,15 +781,15 @@ static const struct regmap_config rt1308_regmap = {
 #ifdef CONFIG_OF
 static const struct of_device_id rt1308_of_match[] = {
 	{ .compatible = "realtek,rt1308", },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, rt1308_of_match);
 #endif
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt1308_acpi_match[] = {
-	{ "10EC1308", 0, },
-	{ },
+	{ "10EC1308" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, rt1308_acpi_match);
 #endif
-- 
2.25.1

