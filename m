Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A3A1F0E4B
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 11:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050095; cv=none; b=qUuEWKG55agBxUtx+u5Zk5Y6Bf+ZXEvIRRI//qtIjWo9c1FKIx01xKXoQUMq2ta+AAGCT1exafztmL0u7L+7LZrWvb3JjAYrntW6o8QGcDo6aoFoOJC4T7mg9J6JHXySGIRd/NwHEtRr/PSA9iB2R/TrsKntMD35SI5Br8/ttWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050095; c=relaxed/simple;
	bh=zVjUcm2gN9eNhjj8U22JQ6lXaDCibtTsW+9ifRi2j3A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m+oyZ5Ya9gaJGxdrq2fSyIJM3GHXQwRPOZMcV4fa7hRwXht7wr3F+nzm53TMZDA0tqv59S80DEKSEJH8Zh38R54Om8swasp5/Y9WMbKNe5GZwm6Fx/OEARdePAo7MxxRy2AI2OQi0cAwjZzUIcYPgEzVo/YMFTndxFuSL5m68yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DxseIWlp; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DxseIWlp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740050094; x=1771586094;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zVjUcm2gN9eNhjj8U22JQ6lXaDCibtTsW+9ifRi2j3A=;
  b=DxseIWlp0iFjbf1z6epLwdFq6j/f/6LsOxZ2/FiPn0jYVbBWJeaLk1k5
   K8G+ckYRHEF3Lc9/DVyoYEZu/Z0UAne/xiTAdogousXGbB56Kvd9p1dJL
   +jeQsrdCIVK644nnIZjUnMQhrJkHnH9M1dgaeAKfzNckZEu6qk/r88o5d
   oZEIvfg+2hcTQn5VyHQyrFeukhBKvUbetC4Aq8myvF09RpWg1clrKJJ4G
   u4s+/HdNnoyCX2eF9lj3QgoIWNSm04pxx8CkBzBZLrGlOiip82CqJ0sQo
   2HOhlHrUKCaAHhP4lE4rzoM9iOahsPFJK0i7e/9e3o3GFAxISmGIu9JhY
   g==;
X-CSE-ConnectionGUID: wnTAtIp0QVupPcBKTlq2FA==
X-CSE-MsgGUID: SYceBaueRmSiVBQwKlEYIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51808312"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51808312"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 03:14:54 -0800
X-CSE-ConnectionGUID: 8DFtoJ68Si2ZhSydaYOQXA==
X-CSE-MsgGUID: H7W0Q17bQ6+T8dP/uMlqUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114865414"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2025 03:14:51 -0800
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
Subject: [PATCH 17/24] ASoC: codecs: rt5668: Fix definition of device_id tables
Date: Thu, 20 Feb 2025 12:26:36 +0100
Message-Id: <20250220112643.3813295-18-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt5668.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index 494ca3ce9b96..463aa81dce25 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -2598,15 +2598,15 @@ static void rt5668_i2c_shutdown(struct i2c_client *client)
 #ifdef CONFIG_OF
 static const struct of_device_id rt5668_of_match[] = {
 	{.compatible = "realtek,rt5668b"},
-	{},
+	{}
 };
 MODULE_DEVICE_TABLE(of, rt5668_of_match);
 #endif
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt5668_acpi_match[] = {
-	{"10EC5668", 0,},
-	{},
+	{ "10EC5668" },
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, rt5668_acpi_match);
 #endif
-- 
2.25.1

