Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286311F8908
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 11:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568246; cv=none; b=fUKdMMfKKGdTqte7NOHEcc7+tMrEdF414EWp33Iyp0DVBF5YgCv7qhdreWQJZnNrts5IzQ/ppBxrdzrVhsPlXlmG4FTtZiL71buZsVfk3kGQxRtclBY3jUhsC5Qipt8wvwrrx13h2zSBLKHLibDCSx3nUIWG0CJ4l/OpQpd7qcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568246; c=relaxed/simple;
	bh=ARlSPz9oXNGBjisACsk9gFKDLoY3Yvv51aPLP8A0GsM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I5vGu4JxWx0K8yk3BPd3CwwjEY1pnucsO/Fp5kwzVoP0S6p+3E9j3gjS9qRZdGF3o+3fG8qDPowC8TsAfrrCivJi3LurAQ5IEsZ/3zd4rjhif0Zno6BZ7lYyHQek3RzIMCCvc+2k/x2C9cEXP8GnYh4n4DO1lCshru6XWebHKJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cS+K0uKh; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cS+K0uKh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740568245; x=1772104245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ARlSPz9oXNGBjisACsk9gFKDLoY3Yvv51aPLP8A0GsM=;
  b=cS+K0uKhxQ/uC4HcWDUV1bwFpRI5skQgKscs0nTa6nBSGivGE4J9o0Zd
   78S2Mr/W1hVvslBLEm0W76nkkPA4oMAye3h//FY1s3ZHVWy2G4tnN8Kau
   UBEXuhrzK4nik0I+YeBH1QumBz9N3w3tByh9MB5pHC7+OAMxHXw+wylB+
   XArAcNySo27NuwBPBiEd9QR46ORfqxJRJ3NHSsh7h7D83/sx1XmTYLphQ
   Cgd56o2MRUp/XU0V3MFiAy1MF4TFrS6UO73DKvhJXsuVJqpQJXFngPvob
   eOivHyGG/zc2zUBsoDMgxcnwjoyEsvD/bv4deB6a74lNNDQLBm19MiZhW
   w==;
X-CSE-ConnectionGUID: EBonvsJvQuq0uN9iBTid+Q==
X-CSE-MsgGUID: KWo0PXBNQJm6qyYX4EOYfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41111193"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41111193"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:10:45 -0800
X-CSE-ConnectionGUID: KygD+iQvS7q62HQcckJ/NQ==
X-CSE-MsgGUID: lMcZlDEKRamHqScgsp8Qkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116685200"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 03:10:43 -0800
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
Subject: [PATCH v2 19/22] ASoC: codecs: rt5682: Fix definition of device_id tables
Date: Wed, 26 Feb 2025 12:26:09 +0100
Message-Id: <20250226112612.166989-20-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt5682-i2c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
index a8820435d1e0..bba987308e15 100644
--- a/sound/soc/codecs/rt5682-i2c.c
+++ b/sound/soc/codecs/rt5682-i2c.c
@@ -313,13 +313,13 @@ static void rt5682_i2c_remove(struct i2c_client *client)
 
 static const struct of_device_id rt5682_of_match[] = {
 	{.compatible = "realtek,rt5682i"},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, rt5682_of_match);
 
 static const struct acpi_device_id rt5682_acpi_match[] = {
-	{"10EC5682", 0,},
-	{},
+	{ "10EC5682" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, rt5682_acpi_match);
 
-- 
2.25.1

