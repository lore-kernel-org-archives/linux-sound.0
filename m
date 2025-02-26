Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633751A3169
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 11:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568222; cv=none; b=hzxBStTYmcRcs1uBhM7qLG6YybNFDi2D3p4/bC/soHPlx7FB1ND9EDnpdnwVR5qXW7n/p/r3fA4WC5C+poCIJTnwicv4uwzgTSd3t19lpzokDQJf4haciyt2H5qn9dDcIdU2KbC65/K9Ncd0zNQNgxrkNO9MXi8ywSsAuxM5FX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568222; c=relaxed/simple;
	bh=uz1YAVgEYPVYIT2LQLxutH46//TDtbW68Cr+5R3TT8s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JW9y+jP9DDuayIdiGFozGQM/BxxARGwkYQtHG5fjq8oN5O/Ji7K0Hx0VPlbAIeEMbfffTo7CKsVfB9TFEu72DL3hGvarFOW4LYSJtyFWDkg9WYUIZbA7YQRItkR9FvmvQo+IUdAjCm4Ik9W5v7oKHKJp0wnVy2UTJaamu0GkwKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aoj+1c0v; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aoj+1c0v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740568222; x=1772104222;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uz1YAVgEYPVYIT2LQLxutH46//TDtbW68Cr+5R3TT8s=;
  b=Aoj+1c0vcgBoHWu4biuEXBtjfo6ye0PBM38BcM4bCpzfs/xPjXZoT92x
   cuUoxyGhM+6M36CyAq/1rbpiwQDC8sIb1+uj1cZPtz6BPJiYuL4NEIt+X
   akPuWpvgLlMv4HZUdlOwydJaYH3u+D+2XyhJmA/wnwO0762hQhkoodN7B
   MbR94JUWCQ0UMKDd9IRnvf1ycXFw+B1+15S0z+HGdY5xLzcsR1KPtfeDw
   sOd6rZ5AIKXHrdBbaeJby2WxkIw3HLtEEY23DpZtMx8wDIt3+zXMbHhAf
   Jlcwfx4EFqA5jcotqzkuaTBE5HAsCaih6egqpn64Erde7tzmzIg29yMSV
   Q==;
X-CSE-ConnectionGUID: /0E818rCRrKhFDQMcNB5Kg==
X-CSE-MsgGUID: 04P6dpo9TZK1O81rSON/lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41111110"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41111110"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:10:22 -0800
X-CSE-ConnectionGUID: vzE8Cl26RVGJv1XnddFY1Q==
X-CSE-MsgGUID: tEm/dEXoQvaIX3OAfcZitw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116685107"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 03:10:19 -0800
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
Subject: [PATCH v2 10/22] ASoC: codecs: rt5640: Fix definition of device_id tables
Date: Wed, 26 Feb 2025 12:26:00 +0100
Message-Id: <20250226112612.166989-11-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt5640.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 82db9dceddb6..c6ec3729b9c4 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2963,19 +2963,19 @@ MODULE_DEVICE_TABLE(i2c, rt5640_i2c_id);
 static const struct of_device_id rt5640_of_match[] = {
 	{ .compatible = "realtek,rt5639", },
 	{ .compatible = "realtek,rt5640", },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, rt5640_of_match);
 #endif
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt5640_acpi_match[] = {
-	{ "INT33CA", 0 },
-	{ "10EC3276", 0 },
-	{ "10EC5640", 0 },
-	{ "10EC5642", 0 },
-	{ "INTCCFFD", 0 },
-	{ },
+	{ "10EC3276" },
+	{ "10EC5640" },
+	{ "10EC5642" },
+	{ "INT33CA" },
+	{ "INTCCFFD" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, rt5640_acpi_match);
 #endif
-- 
2.25.1

