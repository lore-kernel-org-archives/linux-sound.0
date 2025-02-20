Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDAF1F03ED
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 11:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050073; cv=none; b=cBEoBUhpjmZbc7hk9kV6JP8gef5mG7p0OMp83byue5DOcVcQ0oi+WP8MBUAfMWUgiVY5p7drpryR9kjtMH5IC67NE49wSjDMIEfZOMvW0GtwDu9J4F8x4az/NbPphjegBkp0fCfop+k6HffdXKcE2Y5yCROGuFhzjJLwi5P+Y/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050073; c=relaxed/simple;
	bh=/FJ6/ysdao8PLmQWH6B3kyoaUZ6IBK+6T15QQpScSv4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KAxC1UH0dcArb3dTsoSI8VtQRGZE6KDNpmGH6EZyo1b4JcOvqJoO9eJLFkdb/dXVyb4l6Bx7eHOS9FSfetwuDJ2EEeHD6TuTzQXwJS6hLBteuneP4Hgx21cd/d3epOSTNqQVX0Qju+JlEEuueIOB/q1tDfmiIzFeIn1rlLZfqWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cX7Dw1bE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cX7Dw1bE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740050072; x=1771586072;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/FJ6/ysdao8PLmQWH6B3kyoaUZ6IBK+6T15QQpScSv4=;
  b=cX7Dw1bEkwvDmZ4Toljpvr1JQgzxhjIXj4RR0Ac/81CcGDc0o8/Nxr7x
   TghRdm6myZ5a8dKboV2L5bJn8LAqdD8EJ3Anu8lcQ2AkDqeGo5MJALy/8
   taTC8BcJs0UPvmODoHbXY8rKZtX1NO7tSzYRgdqMn2gcSwmE5WXmrlo6q
   t4TrFaKwTOMxvKPGe1wg5k3ws851WhjPNly4U1/tjNIAXBgK/O1Mf45c2
   7w1vT6ecqrhzXpuiIwDIiAc+zX0RmSQEEBLMFKISjnE7u7D35Ue5G8Rcx
   flQqW3OL4Mfcg9FIQzcu6y8/AlgiJp1EqUE5kESGPbjuLbSn6NG0aOT8x
   A==;
X-CSE-ConnectionGUID: SvodUsIYSpSi5JaAG+3mMQ==
X-CSE-MsgGUID: eNdJec9aRN6emnLck92a4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51808230"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51808230"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 03:14:32 -0800
X-CSE-ConnectionGUID: RVXvz1+KQpOkwI/S2zrROQ==
X-CSE-MsgGUID: uycSZ0FZTGCC4h5AUUR7Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114865317"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2025 03:14:30 -0800
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
Subject: [PATCH 08/24] ASoC: codecs: rt274: Fix definition of device_id tables
Date: Thu, 20 Feb 2025 12:26:27 +0100
Message-Id: <20250220112643.3813295-9-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt274.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt274.c b/sound/soc/codecs/rt274.c
index bd61a257d7b5..15bbd920fda2 100644
--- a/sound/soc/codecs/rt274.c
+++ b/sound/soc/codecs/rt274.c
@@ -1091,7 +1091,7 @@ static const struct regmap_config rt274_regmap = {
 #ifdef CONFIG_OF
 static const struct of_device_id rt274_of_match[] = {
 	{.compatible = "realtek,rt274"},
-	{},
+	{}
 };
 MODULE_DEVICE_TABLE(of, rt274_of_match);
 #endif
@@ -1104,9 +1104,9 @@ MODULE_DEVICE_TABLE(i2c, rt274_i2c_id);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt274_acpi_match[] = {
-	{ "10EC0274", 0 },
-	{ "INT34C2", 0 },
-	{},
+	{ "10EC0274" },
+	{ "INT34C2" },
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, rt274_acpi_match);
 #endif
-- 
2.25.1

