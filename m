Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715871F3D52
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 11:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050109; cv=none; b=MeNGw/CvIraLIxJ6zazaG/zAShMLvWKMskYsaiUWff3SJIkyr5u7m7Vessu+LzIJUqCGi75bpmVo1Jn7Lud1lcm8EbcOu5W3CEQ7Up5gXdgPsGRKi4PYxDoec/OuZ5/BhgdTkR3aeG5pkfdDAZ60AN1iUgtx9QkJsp2V3k5DMGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050109; c=relaxed/simple;
	bh=rsTx+YNnZUx7N4r7VVbCDZWP6EtZDFrJUKvTYfDBWsM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m6xpwSc7d1TpECEjlSqr2YgF2o4JRoTVhPLYVrdFyUJUh1PeOGAqTpXTJLkWOUiMCyEsgKGTI0Mt9cCCp4LR8AXYhpyrKCzPDO1JlOMdXE4ubEhwTDP5jHNiKBCUypKlIIYLX82jNdOsSuf3i1WbWTCK/s1tQLFOcqJNKKvRNpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AKLRBYKJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AKLRBYKJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740050108; x=1771586108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rsTx+YNnZUx7N4r7VVbCDZWP6EtZDFrJUKvTYfDBWsM=;
  b=AKLRBYKJ6y/NQPlpd3FTFHEH/zdFjf8cXmnOcpFA3SlxAtrMl9tLR1wT
   62UpyfvOmkTBBS9zrzc5fRAv/VfzylEd8QSLyH1rZhAgMy4jrX4edpfQz
   Gg0NyCv8buoe+li94K6vQao2JnWWQ/kMjgnt/z/8by/z4y+Ndz9wOBEHG
   ToWuQnstZi8kK4OaLtx43U65zdvOenRupRoA1edXL3qbP6j063xNNfP0x
   NUXVaxE405aONxDkUW1atlhyv9JB3+wD/BOJiJZq3QAIGIe9NKXDJ4Gke
   l+akC8rVGp/Cbvcq+LTPEVrWJamKCHXgkXkEUEpht4chfo4L0y0F+0MDl
   A==;
X-CSE-ConnectionGUID: paOpB0pWRoyxYFQHZlNU8Q==
X-CSE-MsgGUID: 5k4qyjvMStaTG8CnvsWdzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51808389"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51808389"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 03:15:08 -0800
X-CSE-ConnectionGUID: Y8MbMkT4TnyKT6TU/lqXsw==
X-CSE-MsgGUID: FTSQVLpURgOSVqBWE4/CeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114865523"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2025 03:15:06 -0800
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
Subject: [PATCH 23/24] ASoC: codecs: rt5677: Update definition of device_id tables
Date: Thu, 20 Feb 2025 12:26:42 +0100
Message-Id: <20250220112643.3813295-24-cezary.rojewski@intel.com>
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

Follow PCI-based format (10ECxxxx) for ACPI IDs by adding relevant
entries to the existing table.

While at it, there shall be no comma after the terminator entry and
initializing fields with 0 for statically defined structs is redundant.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt5677-spi.c | 5 +++--
 sound/soc/codecs/rt5677.c     | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index d91a2184f67c..3b9c23aa255f 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -617,8 +617,9 @@ static int rt5677_spi_probe(struct spi_device *spi)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt5677_spi_acpi_id[] = {
-	{ "RT5677AA", 0 },
-	{ }
+	{ "RT5677AA" },
+	{ "10EC5677" },
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, rt5677_spi_acpi_id);
 #endif
diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 0e70a3ab42b5..d9b173ba7f6e 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5202,7 +5202,8 @@ MODULE_DEVICE_TABLE(of, rt5677_of_match);
 
 static const struct acpi_device_id rt5677_acpi_match[] = {
 	{ "RT5677CE", RT5677 },
-	{ }
+	{ "10EC5677", RT5677 },
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, rt5677_acpi_match);
 
-- 
2.25.1

