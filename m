Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134E9211A35
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 11:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568254; cv=none; b=MjTA980iZd6jsxC2vkFATVYYRirCelRK5Dz+2lpC00ZvpEbUVojrOslx0+Z51qf5gdwr/XO7ZwkJ2/vIkmMJA60wiKkD9Bf6ZN9XF2M12OZSZEkn2nD6gMbar7RfDMtSGrchjZ/gRbCN8lCcHyMkEut1qN6CfVd2+QjEiEYIMCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568254; c=relaxed/simple;
	bh=zJsjH7Ck3O+GOJiAM93ESa6QQAVjxG3+vdfW+5LnDzU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SeO+XOt6Ks6IdaLc0cJq7a/FJ9y55s+FwtpBN6Ucj6jTSgOU7SX3qbNB/QCEmNuoessGRJMsDT7quuf3S94SUClxwiumkhAVDpCQoZY9XkfLjsXTj1CnBngGJFwX7WwUcKVsb55Ddnj6KOA+/MdYEhIsJqJTCYF+rjIg14uySYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LaTI9t6h; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LaTI9t6h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740568253; x=1772104253;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zJsjH7Ck3O+GOJiAM93ESa6QQAVjxG3+vdfW+5LnDzU=;
  b=LaTI9t6hRT09ncJo9d5+kEekM7W0k6g5GseCycbgdfr3I3nEzP+XD7Ve
   cLCpEc4Qx+chIR76OZsfRpG6YVr6SoHIUCAhY5nVXKl2vHpaXoZbjtA5a
   G5vsZVf8fdfvueoM/OlDSyUUjhv77cDgVAUzmhdVcChBM1BI1TxG5Ebn8
   WHFsLehgNIj2PvHzGlG8tQ/NbBTG6Rfw5SmOVx2NSjfIABk3p59xQUax2
   749WqYEH6JfbtmRR1z4CBY2oFjixBXiCYheyzJ9o5wl1vfdHY5CzS3C65
   vxkM5eodoCqfyJTYzqNqtt/FTmSPRSKdl3UBmsnCGZ8D5NMSQuEs8Ajho
   g==;
X-CSE-ConnectionGUID: oO/prB9/Qe+guuFcNgxGrw==
X-CSE-MsgGUID: XMLfp+hiReavp2ry/aLALg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41111242"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41111242"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:10:53 -0800
X-CSE-ConnectionGUID: kXSNI/oMRGC2t3i5wCAFbg==
X-CSE-MsgGUID: 0xMMXDKQRieANpE3Hm/4bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116685228"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 03:10:51 -0800
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
Subject: [PATCH v2 22/22] ASoC: codecs: rt5677: Update definition of device_id tables
Date: Wed, 26 Feb 2025 12:26:12 +0100
Message-Id: <20250226112612.166989-23-cezary.rojewski@intel.com>
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

Follow PCI-based format (10ECxxxx) for ACPI IDs by adding relevant
entries to the existing table.

While at it, there shall be no comma after the terminator entry and
initializing fields with 0 for statically defined structs is redundant.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt5677-spi.c | 3 ++-
 sound/soc/codecs/rt5677.c     | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index d91a2184f67c..abe0a5a95770 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -617,7 +617,8 @@ static int rt5677_spi_probe(struct spi_device *spi)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt5677_spi_acpi_id[] = {
-	{ "RT5677AA", 0 },
+	{ "10EC5677" },
+	{ "RT5677AA" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, rt5677_spi_acpi_id);
diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 0e70a3ab42b5..d1e0b93d6ee6 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5201,6 +5201,7 @@ static const struct of_device_id rt5677_of_match[] = {
 MODULE_DEVICE_TABLE(of, rt5677_of_match);
 
 static const struct acpi_device_id rt5677_acpi_match[] = {
+	{ "10EC5677", RT5677 },
 	{ "RT5677CE", RT5677 },
 	{ }
 };
-- 
2.25.1

