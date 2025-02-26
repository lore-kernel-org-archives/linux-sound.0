Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C442520D4E7
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 11:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568220; cv=none; b=q2qrNTMlIRRQEkdr7cU8FuJgEc5ghrkZcIjl0HBKhiRmV4XUbT/8hFMUpwf6MwrDUi11p4lM6V74Ks952tJqvnNV4rRde3PmSXnpkzaW3hg+3gG4bhMzH5FmJ2OsGiatmILNzPdoe8lRirev5dKomqzEVLYfcZ7rmnORtaGoPLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568220; c=relaxed/simple;
	bh=K64z0fZq8XSDZlsoyzAdBUAw/dP72FTbXu323dNkzFM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I5trEm7abNOKSnrDwkjeaCrarTwp9Ax6exHeHRQeAZkRTWaeh05p6saNLC/bjgMS4H0lIUccJD0YyZXYtSERn87UFXsqeQPF040imHdkWktQuRQTz17E31hy0tO2xIcnR6SB6GswWQhSNgE73ysPezfkKgzfCS/SSCrFtxv01Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KUhf4aPF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KUhf4aPF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740568219; x=1772104219;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K64z0fZq8XSDZlsoyzAdBUAw/dP72FTbXu323dNkzFM=;
  b=KUhf4aPFar9rZAAlsZCor4YA22Vuur8/JaMV9CF1hodcE1NoVqzr53YL
   +PCbljlmn9sPgPAzQR+sKBtE08J3kwt6nsq9h/fQk/OdHRk4XpIGP+Egt
   d6xF06h5rmHuQCY4bnUtZJ6TTQ+oeY3VWS84gdE1/Myx4eXYELHo+5JBB
   9MhCDpFMAaxqCYveb9zZFwCuhhYZ6qN+9SpgWtiIdkOTQky1KAMNgDEuL
   SR8so75f0cxcsQcBz+XPm+NnS2yy+5IyJhAPjzAIHVOb/XLrLZtt1dr8p
   WgnCNWJERUQQEzN0hBUnZUGBA4hTcc6nYdt6+SDqp1kdk0GfyzX6M8B91
   g==;
X-CSE-ConnectionGUID: 8nyLbNVrQOqjo4b1jEf2Jw==
X-CSE-MsgGUID: pbglHFsrRI++LQOmDnMkqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41111105"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41111105"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:10:19 -0800
X-CSE-ConnectionGUID: BdWzlUdARRmIMmRj8FmqNw==
X-CSE-MsgGUID: mt3UlHJWRDC+DLI2Dm00cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116685096"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 03:10:16 -0800
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
Subject: [PATCH v2 09/22] ASoC: codecs: rt5514: Fix definition of device_id tables
Date: Wed, 26 Feb 2025 12:25:59 +0100
Message-Id: <20250226112612.166989-10-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt5514.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5514.c b/sound/soc/codecs/rt5514.c
index 9cb74962161a..a7f984b5d80f 100644
--- a/sound/soc/codecs/rt5514.c
+++ b/sound/soc/codecs/rt5514.c
@@ -1206,15 +1206,15 @@ MODULE_DEVICE_TABLE(i2c, rt5514_i2c_id);
 #if defined(CONFIG_OF)
 static const struct of_device_id rt5514_of_match[] = {
 	{ .compatible = "realtek,rt5514", },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, rt5514_of_match);
 #endif
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt5514_acpi_match[] = {
-	{ "10EC5514", 0},
-	{},
+	{ "10EC5514" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, rt5514_acpi_match);
 #endif
-- 
2.25.1

