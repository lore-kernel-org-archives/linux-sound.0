Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DD41E7C23
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 11:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050053; cv=none; b=qRVYhlFBJW1+zvhhhLzaOjz1712rWdS82SIg8wyTq+8IdRsh+y/roCLdDiEcppLMYbYv8yDL5t/SpILff/XmV+ufpefFjQGP4EWvhCFlcbWPIyTnKZx9CrpjrTd5DxP+gecEaF9mN6igWKtPcrKYhEsz8pcsG6PvsEbfTryzG1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050053; c=relaxed/simple;
	bh=HVQyQlo7P/T1XE4WXDxF5tI6JpUKXxS09xsCIqT9m08=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D16uka+rdZ1JGUW+USmrWxQ265vleV1fVnvhuekiqag18220sy6J+iRFgNW46Xy3cS7ctZHh3/3x+3dcwEPm96MfQryUzFWawflm7IaiOqih0gsRd1Lvyq11a/9uMg7GHXnkx8tEFMa8EGPfmcp2Mcj9xnMU+9xqHdOdeoYT9Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUg5ZhZy; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUg5ZhZy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740050052; x=1771586052;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HVQyQlo7P/T1XE4WXDxF5tI6JpUKXxS09xsCIqT9m08=;
  b=IUg5ZhZyo0au8dV4XeDbaee1fH4kRApjDgZsXyYexUZnfHQ6ToE2a+5c
   ruZCjSWsr3QuaSpuBlzATaDb0L/L3TJPt7iwzLYCHGY8ZR3JaRzbKhhLX
   kt8LBLEpo9BcA3D82fmecAZUbK6cggap6orf0OFiZ7GALiZvWWZ20K4GK
   iZIOGYk4NM0OiFYmmpU0/+YrXq2JkLf+XlHPq0xDphSHtNW9Baw9Mn92y
   mi89M4D2J/JgMffsQRSNQEIX1r9LJw+AD1WBNPma1PkeHssIgArRvSs5M
   yDsk8IciN46cGMQFqX8w2UysX5XlFdGqw17/nt+7BlTxC2rhww4TjonD6
   g==;
X-CSE-ConnectionGUID: n6qTju7zTiOIZtBamXNhLQ==
X-CSE-MsgGUID: /U6cS5MmRV6mEE/AHgkUUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51808140"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51808140"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 03:14:11 -0800
X-CSE-ConnectionGUID: uyHLDUFgRWa10YRLM3S2lQ==
X-CSE-MsgGUID: MiuSF21PR9mRfDqd8LvcDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114865227"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2025 03:14:08 -0800
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
Subject: [PATCH 00/24] ASoC: codecs: Update device_id tables for Realtek drivers
Date: Thu, 20 Feb 2025 12:26:19 +0100
Message-Id: <20250220112643.3813295-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series aims to streamline the formatting for ACPI IDs so that a
single pattern can be used to identify the device.

Work implicitly suggested by Andy Shevchenko - reading and learning from
number of his reviews on the Linux mailing lists.

Several formats do exists, however, after technical discussion PCI-based
format has been selected as the recommended one. For Realtek devices, it
is going to be 10ECxxxx where 10EC unambiguously identifies Realtek
company whereas the following 4 hexes specify the PART_ID i.e.: the
device.

While at it, there shall be no comma after the terminator entry and
initializing fields with 0 for statically defined structs is redundant.

Patches sorted into two groups:
- fixes, no functional changes
- updates: fix + addition of new ACPI ID entries


Cezary Rojewski (24):
  ASoC: codecs: rt1011: Fix definition of device_id tables
  ASoC: codecs: rt1015: Fix definition of device_id tables
  ASoC: codecs: rt1016: Fix definition of device_id tables
  ASoC: codecs: rt1019: Fix definition of device_id tables
  ASoC: codecs: rt1305: Fix definition of device_id tables
  ASoC: codecs: rt1308: Fix definition of device_id tables
  ASoC: codecs: rt1318: Fix definition of device_id tables
  ASoC: codecs: rt274: Fix definition of device_id tables
  ASoC: codecs: rt5514: Fix definition of device_id tables
  ASoC: codecs: rt5640: Fix definition of device_id tables
  ASoC: codecs: rt5645: Fix definition of device_id tables
  ASoC: codecs: rt5651: Fix definition of device_id tables
  ASoC: codecs: rt5659: Fix definition of device_id tables
  ASoC: codecs: rt5660: Fix definition of device_id tables
  ASoC: codecs: rt5663: Fix definition of device_id tables
  ASoC: codecs: rt5665: Fix definition of device_id tables
  ASoC: codecs: rt5668: Fix definition of device_id tables
  ASoC: codecs: rt5670: Fix definition of device_id tables
  ASoC: codecs: rt5682: Fix definition of device_id tables
  ASoC: codecs: rt1015p: Update definition of device_id tables
  ASoC: codecs: rt286: Update definition of device_id tables
  ASoC: codecs: rt298: Update definition of device_id tables
  ASoC: codecs: rt5677: Update definition of device_id tables
  ASoC: codecs: rt5682s: Update definition of device_id tables

 sound/soc/codecs/rt1011.c     |  6 +++---
 sound/soc/codecs/rt1015.c     |  6 +++---
 sound/soc/codecs/rt1015p.c    |  8 +++++---
 sound/soc/codecs/rt1016.c     |  6 +++---
 sound/soc/codecs/rt1019.c     |  6 +++---
 sound/soc/codecs/rt1305.c     |  6 +++---
 sound/soc/codecs/rt1308.c     |  6 +++---
 sound/soc/codecs/rt1318.c     |  6 +++---
 sound/soc/codecs/rt274.c      |  8 ++++----
 sound/soc/codecs/rt286.c      |  5 +++--
 sound/soc/codecs/rt298.c      |  5 +++--
 sound/soc/codecs/rt5514.c     |  6 +++---
 sound/soc/codecs/rt5640.c     | 14 +++++++-------
 sound/soc/codecs/rt5645.c     | 12 ++++++------
 sound/soc/codecs/rt5651.c     |  8 ++++----
 sound/soc/codecs/rt5659.c     |  8 ++++----
 sound/soc/codecs/rt5660.c     |  8 ++++----
 sound/soc/codecs/rt5663.c     |  6 +++---
 sound/soc/codecs/rt5665.c     |  8 ++++----
 sound/soc/codecs/rt5668.c     |  6 +++---
 sound/soc/codecs/rt5670.c     |  8 ++++----
 sound/soc/codecs/rt5677-spi.c |  5 +++--
 sound/soc/codecs/rt5677.c     |  3 ++-
 sound/soc/codecs/rt5682-i2c.c |  6 +++---
 sound/soc/codecs/rt5682s.c    |  7 ++++---
 25 files changed, 90 insertions(+), 83 deletions(-)

-- 
2.25.1

