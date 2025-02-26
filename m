Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB511A08A4
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 11:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568202; cv=none; b=IgoOnDvS9ZpczF2wsE40Jk+KWkjP7GsbMQJe+RXekQTSmJQzPu1em0PoJ0/KO9oUSImaJ0rC9SsoCEFfK7ArNsv5BeBRAGhg5sxIY8eGZY6PiU1Q2y66n+9LKJSReYwc+aUbd3o/QNKHb6cqR3RXx7wIMGQkSHCwVcLZ3k0Q3ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568202; c=relaxed/simple;
	bh=7+bSoBZnzgpdm55aME2ycV6w09vK4ACETKJw7crYuac=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NC2VxF5y3Hdjd10vQoyefRp7IG5lCtonSO5RyQ1UHbtD4ONhl3d72qec3y69kltvizvxIPCc2U/Xn+sNp2j/WIA/BrMaYxibvTuClzQpdm8VnPR/XvYF/uB7737c4kEeOYsq4828XmHDXSRar1A5WC+gTfDcl/iQjXPddza5fj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nfh9XEUP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nfh9XEUP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740568201; x=1772104201;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7+bSoBZnzgpdm55aME2ycV6w09vK4ACETKJw7crYuac=;
  b=nfh9XEUPuIzJcyScLdm+K+jqh4GewOOw2CKV8IQp1gWyRz9y0RuPBmSZ
   TZxQVENf8hvz6t/gXtK9rlNJnM6GBiZmnVJer7K1nrBdcxwARfapWPsjW
   7ix7QTs5GswlB3U2MLwiJFg9Ppe8uKjkxSeFY4Clv2PxFmIJxh8i7emcQ
   j5KzNNsueLx7Bx14rUIe+x+OkujU+A53+mBsEtXtBINnq0tTiN2jrDHm9
   v0fARUEv53yBz1m3HtuqwMlsdcGmvRtlvx78hL1gmLi+Rx8mQwcJ1+ZSZ
   1T/f4+rMSno3f/qsLFg26joe70wkaIiSCqsc3BYyb1hhmqLoSRhkg89H5
   w==;
X-CSE-ConnectionGUID: gOoAc3YcSVKbkc51lGwzyg==
X-CSE-MsgGUID: lpY07lpUQFe8GjF0IgCmKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41111014"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41111014"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:10:00 -0800
X-CSE-ConnectionGUID: 2W1/StEnR/CPYJ7CalJkDA==
X-CSE-MsgGUID: nt+LgK4ASuC8PJUokeQyyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116684952"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 03:09:58 -0800
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
Subject: [PATCH v2 02/22] ASoC: codecs: rt1015: Fix definition of device_id tables
Date: Wed, 26 Feb 2025 12:25:52 +0100
Message-Id: <20250226112612.166989-3-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt1015.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 0f806dde9c39..ea8037117d42 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -1105,15 +1105,15 @@ MODULE_DEVICE_TABLE(i2c, rt1015_i2c_id);
 #if defined(CONFIG_OF)
 static const struct of_device_id rt1015_of_match[] = {
 	{ .compatible = "realtek,rt1015", },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, rt1015_of_match);
 #endif
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt1015_acpi_match[] = {
-	{"10EC1015", 0,},
-	{},
+	{ "10EC1015" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, rt1015_acpi_match);
 #endif
-- 
2.25.1

