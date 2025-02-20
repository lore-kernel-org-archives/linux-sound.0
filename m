Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A307A1F0E3C
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 11:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050071; cv=none; b=MdY4TjrxM2c8Hs4jEXdUlhyLL3Nqd8WR0fCRfqIs+AlNpBu6PZROClhdjrnYD6oB93tag9oD+IhJzBeX7CYlBWgxZuclpP85Z5wLd2F70cVT3dj6R5vEh/T8j3D0fKs1a2pScD0EaSCNnEpT+3MLTS3SPV9X5VFzc/EOpdYc0r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050071; c=relaxed/simple;
	bh=ufwt+KKwfS0agpTkyBn+NBjZnntxP36qrYVSUdBTffk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VDLa+SRTNR2dqU+joP3J1MyL9kPOpicK+wzPJ/UtYYo/Jm38WN9vK0D+V7xgShvSjWAUlWO2ontm5iRneUiaLd4CWgIMzc8K3vMXOMeW3F73kD5wyTZmIMIfUEPodJJS+dk0c4dMQEYSH3UttGEOG9RXFdh8M9U/wAjS1P7jSoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/iyqwO7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/iyqwO7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740050070; x=1771586070;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ufwt+KKwfS0agpTkyBn+NBjZnntxP36qrYVSUdBTffk=;
  b=R/iyqwO7WvQyp95PZ6ms3PF0qZg5uUYSzVspCqJO+PqowUkW7VwCktnO
   2Geodx4fiHotrUeeh0SqIA0rlGmVg3mLWZ6thtYXcS/gw4YUHYHi8uod4
   4yWSD5bz22dDFJ2s1uny42lBbLhP2QKujJ1whkJlQjcEHIw9zoL9aKBs7
   AYaa2CjzFKo7yU/DgWnFmUAdlUCjqSb1sosYVio2waiMPVhlq/nBvhuDV
   Pv3Ur2q1UpB3bzF359v2utnCq4Cv3z42f+uFohOvrO9kF3/QqnykMSyTh
   lVlnp/eD0u2JSDQsiuSAL2bGn1hDe0SY7bmgMY0xGyJ2BknCOpKRhqr24
   w==;
X-CSE-ConnectionGUID: M4m3k02OQRCWrAYu0M96XQ==
X-CSE-MsgGUID: 7QTGOgI6Q2elB0jqSN7QWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51808220"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51808220"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 03:14:29 -0800
X-CSE-ConnectionGUID: eHkvooP8Qq2r2wgBOsj3ww==
X-CSE-MsgGUID: RkJc98RiT+yLUdbWhyEodA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114865309"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2025 03:14:27 -0800
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
Subject: [PATCH 07/24] ASoC: codecs: rt1318: Fix definition of device_id tables
Date: Thu, 20 Feb 2025 12:26:26 +0100
Message-Id: <20250220112643.3813295-8-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt1318.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt1318.c b/sound/soc/codecs/rt1318.c
index e12b1e96a53a..69cd32acbe7c 100644
--- a/sound/soc/codecs/rt1318.c
+++ b/sound/soc/codecs/rt1318.c
@@ -1147,14 +1147,14 @@ MODULE_DEVICE_TABLE(i2c, rt1318_i2c_id);
 
 static const struct of_device_id rt1318_of_match[] = {
 	{ .compatible = "realtek,rt1318", },
-	{},
+	{}
 };
 MODULE_DEVICE_TABLE(of, rt1318_of_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt1318_acpi_match[] = {
-	{ "10EC1318", 0},
-	{ },
+	{ "10EC1318" },
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, rt1318_acpi_match);
 #endif
-- 
2.25.1

