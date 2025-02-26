Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AEA212FB4
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 11:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568238; cv=none; b=BKMqWXBT0gYZrcopBMQU5ci+1zdVFBV7Xea+d8/Y+FASMOs9Kuh9nSeHVGDstvFP6pFIoAECl9mthJy3pCDAGTKAPJJbAMuNbTF2/n7VPP5/MK4OlZMQOV9eSsfoiffC5Exuuu5tObAZYvRXIw8UYMI8vAL3T78apH5CDFHqAI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568238; c=relaxed/simple;
	bh=ql0K1RKCNCmrWFIrlN1E0TvX2pVWPfy2bMI/K0lZfBs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SYCaPlj+khSmo6MvegD1IJTVc916/QPWZRB6ffsSwAgZ/xkPHPFffftIi+yI3BYPAUiYYdpenahn3TLIviTFA1VSSCosi45x6cmeN8IWn4a9XK3guiIaz0YSY5ewPqmNL5U+tEh912Cr7JE2uddt6WIp0makMUfYXMVgA7BO0RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k5j6F7yq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k5j6F7yq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740568238; x=1772104238;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ql0K1RKCNCmrWFIrlN1E0TvX2pVWPfy2bMI/K0lZfBs=;
  b=k5j6F7yqFxx0rmRwYO0DZfItsxzN9/fkzV1+6r5iJN+cEz3RD/b0Re3j
   mN7Z0M+ukTzetH49Qsi7KXGL7G1KxSYvPJQajQ9RYi2YHQvfoLPY0jpa3
   98Os3Djmw2Hwl6aCzl0wy61VG5HHgSItEdIPQoo1Vbe70Zt8scaoRfUGT
   pzf/Evl6jfHj4OtYJYi1Z/0JVMOFi1aTBZ21XnpjgrPTNpFdgoKMBwuGA
   F9UwN7eH1O3k2grK08YhiG3rVrz2PCnHiKgGDNndg8Cuaxm0YCXaqJhJw
   6tki3sGjMRpOsxOlz8Z1hZ2A5PCi44Hg6xpLNZ6XsRDQ4mWvdDs/8/OqG
   w==;
X-CSE-ConnectionGUID: t3PDSaZ0Tm2r0z718IDK5g==
X-CSE-MsgGUID: KneEzU11QFO8KPp5LcCcPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41111159"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41111159"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:10:37 -0800
X-CSE-ConnectionGUID: ZAHNCmGPRP2aX5D/WQiLYQ==
X-CSE-MsgGUID: 9Ag7Q7PbSJiEW1KjENj3+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116685161"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 03:10:35 -0800
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
Subject: [PATCH v2 16/22] ASoC: codecs: rt5665: Fix definition of device_id tables
Date: Wed, 26 Feb 2025 12:26:06 +0100
Message-Id: <20250226112612.166989-17-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt5665.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 47df14ba5278..be5ddb4be6df 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -4949,16 +4949,16 @@ static void rt5665_i2c_shutdown(struct i2c_client *client)
 static const struct of_device_id rt5665_of_match[] = {
 	{.compatible = "realtek,rt5665"},
 	{.compatible = "realtek,rt5666"},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, rt5665_of_match);
 #endif
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt5665_acpi_match[] = {
-	{"10EC5665", 0,},
-	{"10EC5666", 0,},
-	{},
+	{ "10EC5665" },
+	{ "10EC5666" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, rt5665_acpi_match);
 #endif
-- 
2.25.1

