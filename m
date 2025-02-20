Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BD51EF096
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 11:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050069; cv=none; b=h5+9YcZAwe0QFZQCiSmK9awCbIO0ZbTelXhPlCumPRCWgxev+ZmkDccb4fDNgpo9UqCrfWlvCjU57JeUWYsptCNK0vvs+pSfghDNSy3p3eBgBOoq8FRU0ksVOG/CgwziTYvkR14Gt4SmePAdcfww8/V/HEAuxE/V+5zRjxCJKMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050069; c=relaxed/simple;
	bh=TzfOFkI/7l77pMLio/uIkIjJg4iSW+3uLVMbDOi61VE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GTt/tRheWD8FX7x+1+ysQAUTvXI3zJFH+AU5bkCzBop+I12blj0/fF7fHMyRpxYLDpQ06XPYFhsZ7jFZmLeaCKxwMj8locWZGrrXYUo3I4sV/ZWcMz1zuR49MbMO6u/luMpX4uOWVWHQlfBG1z13RrBYAqqvSRmRsRDXbdV/Hm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMk5af76; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMk5af76"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740050068; x=1771586068;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TzfOFkI/7l77pMLio/uIkIjJg4iSW+3uLVMbDOi61VE=;
  b=KMk5af76TfTvmF3nq2koEkb122e3grr4R14dkQ44CjuMmCBPcDK5bCXJ
   9VgCpP4eskvcZPTF8AX/pyl6NTdo4JTT+/4FffkNhVFvTB6SgDJaNJ98e
   8rD/Dm4sRtsa/akExm2fKpS7y4QkgO0d86MwXGVrdW6+6xtMFGLQfBcrv
   fat7zCtVJhZI4QVEAnV4XIiK82y625j5LsQD8QAu3bDaonsDhVwPQQNrd
   gkMxNv69gPZY8KwnKDTsLkdMEeF9xUgndHXoOcNg0v9Qf7e42ZGKk0UKG
   qM1CXQRsD2bF/SxT+mILBEnRe1AoRQ+w2bfrYu76+3WaDrkIlqAHxBrE3
   A==;
X-CSE-ConnectionGUID: oG4eGvQjQNOYeX15bSqc4Q==
X-CSE-MsgGUID: TpALItR3QDeHz2/Mh9Kc2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51808208"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51808208"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 03:14:27 -0800
X-CSE-ConnectionGUID: GS7K3JvYQ3OSxPrxKVQi3Q==
X-CSE-MsgGUID: l1Q+j2n4Q1K5NvlCrnRw7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114865304"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2025 03:14:25 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	oder_chiou@realtek.com,
	flove@realtek.com,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 06/24] ASoC: codecs: rt1308: Fix definition of device_id tables
Date: Thu, 20 Feb 2025 12:26:25 +0100
Message-Id: <20250220112643.3813295-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250220112643.3813295-1-cezary.rojewski@intel.com>
References: <20250220112643.3813295-1-cezary.rojewski@intel.com>
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
index b366338cea71..a9ba66228301 100644
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
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, rt1308_acpi_match);
 #endif
-- 
2.25.1

