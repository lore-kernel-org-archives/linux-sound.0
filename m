Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF40A1A08A4
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 11:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568204; cv=none; b=pNcEW+MaQKOFqHiSHDFKK2zjI+dYQcWbV2iM7uRqNF+CtxvtFbmdTVGVqYjnZRMuc3Jzk7HmS66Ht7EWWsGDi3fyAp/y2uONBbVBLFr+QnzbUb4WB0EwtUjq2XFat/qs1Va3JFsezTEcfUZAUXIPsh5nMyD/AHSqHJWUafChT7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568204; c=relaxed/simple;
	bh=GiRsnA6zAC7mquCF22JGFoIOyg5ZAnmIbJCO2bW/GPc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=clWrfoLlc3tN3O1CrlLsNYXR6iGZUQFuW5FFIjLRJL+qIK9ype8pWl0IiAGhk5POsRY8sXIKcoRI+QcEsmQBVSaa1nOQ+LKpuTrD4PHHcrGa621qxApAMc/h+GAVzY3awZ4wkCZk8oo7vCWdjjHkGghJgrtIssxA1NPtMblaNJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ONkG31iw; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ONkG31iw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740568203; x=1772104203;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GiRsnA6zAC7mquCF22JGFoIOyg5ZAnmIbJCO2bW/GPc=;
  b=ONkG31iwZ0g0fOljlxd7ryI1ex71yYVun/sbowvqYmf5Y1qJWOkpzI7d
   ZN7ROwJpgvMhsaxyFqwBWA3z0Cook6s0jTsCqGB6H1OwAzpC7GlQkbfuC
   DlhHL+XdkxjG/28QkHlqUOZ/cO7fJW8xkFGRG4RqaFE5bp6yy6/TEuL3+
   H4PQ9cAYU71kd+Ny6e0qJ5yn9P1xP7C8mY029s/y7qRuh3XbGpSEwaKSr
   8mFs2W0yek29wu2zyKhEi3SlojIwbdByrJ2+n7Los4kqnHfOQu9wCoX3/
   mE2YAvA1WOP+XbDzldMzW+Bx9nZfamZqz5uSDHHPQnM0PhulJohvLhGQj
   Q==;
X-CSE-ConnectionGUID: rKe6du2iRxG+meNyTNPLiw==
X-CSE-MsgGUID: V3tEWuIZSl+tYabUogLVJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41111045"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41111045"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:10:03 -0800
X-CSE-ConnectionGUID: jj53n3kyQryeO9utOm3vgg==
X-CSE-MsgGUID: 4sZokzhKRSWMeC75qUDyZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116684979"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 03:10:00 -0800
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
Subject: [PATCH v2 03/22] ASoC: codecs: rt1016: Fix definition of device_id tables
Date: Wed, 26 Feb 2025 12:25:53 +0100
Message-Id: <20250226112612.166989-4-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt1016.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt1016.c b/sound/soc/codecs/rt1016.c
index fed4da23cba2..132c102983bf 100644
--- a/sound/soc/codecs/rt1016.c
+++ b/sound/soc/codecs/rt1016.c
@@ -616,15 +616,15 @@ MODULE_DEVICE_TABLE(i2c, rt1016_i2c_id);
 #if defined(CONFIG_OF)
 static const struct of_device_id rt1016_of_match[] = {
 	{ .compatible = "realtek,rt1016", },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, rt1016_of_match);
 #endif
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt1016_acpi_match[] = {
-	{"10EC1016", 0,},
-	{},
+	{ "10EC1016" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, rt1016_acpi_match);
 #endif
-- 
2.25.1

