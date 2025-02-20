Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8371F0E4B
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 11:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050092; cv=none; b=bLjYlOraZWkFT/tBwj9gsEYpLnAFNJkUhpD9qDphpJ2k/n27K6bIXMULpsRq5RubDi+IFiVmYO4iz1qtSbcvwh8jka8yqkMtoCQW1gxR3gfEK5v4FmPEiJtDn9HZZFVhXePYwb+hiNla9KNxIK6FPOmhbdYeuG4hb3EyXFTCffo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050092; c=relaxed/simple;
	bh=0Abw04MVF2mdmhz51CPdSEtrBhpZu63mbMIxtLD7J+s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QTXhDEAYVBu14GVIq7NkLWGzPk5iC+vwwWwLA1hgxkVM2gFkbI3Rr7wkWB+fF/58ZWuH9RP8tgVO8AUNxhTZ3wzRItKIjwPXNjw8FOw0FyU5p5bnZfuUyQoppdDp9t4BpoAnRCuNl4l9oYQLVLLfEhq0qlhWiD7bVNcDu5O1vM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n0zdB/Vr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0zdB/Vr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740050091; x=1771586091;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0Abw04MVF2mdmhz51CPdSEtrBhpZu63mbMIxtLD7J+s=;
  b=n0zdB/Vrttne5H1q9J8BQUGpdlKCzDNKgkDJdSoBxADnBa3EkIgTt/pE
   w5Glfm+qs/jaoKHje5soPw8Vwus5K3lrBNZzvSj5EkI45J3qI8yWI/Wn9
   fXlyZ6bP/Oed9/gNsMgIqzusL3rPNTDYlTtBZsU9FvWG4qwY7VIyGPXHy
   PpduhRPHLuV8FfNtQ6Mku5VbCCeu0rkbxkBgy5fAb20WpLDbY7YRrYycl
   zUQMYErTdtp9RuJzfhav9xuZxyIa1UTHt5B0nmmXPW3TrWrpvOyFet38A
   PjF6ixEpTlpC846obmVwtehwNx9JBpKEfLT2lHhGAgqUdgHKuCK+btKrJ
   g==;
X-CSE-ConnectionGUID: RFyQuJ3jSTSIU+RV5WrItA==
X-CSE-MsgGUID: O4dmwepMTmmtib9l9dMfEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51808304"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51808304"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 03:14:51 -0800
X-CSE-ConnectionGUID: 5oH2sHi0RMeY3VHs37RZeA==
X-CSE-MsgGUID: OaFSyXkyST6G4WhoZq2BNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114865410"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2025 03:14:49 -0800
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
Subject: [PATCH 16/24] ASoC: codecs: rt5665: Fix definition of device_id tables
Date: Thu, 20 Feb 2025 12:26:35 +0100
Message-Id: <20250220112643.3813295-17-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt5665.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 47df14ba5278..61d098a57b3b 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -4949,16 +4949,16 @@ static void rt5665_i2c_shutdown(struct i2c_client *client)
 static const struct of_device_id rt5665_of_match[] = {
 	{.compatible = "realtek,rt5665"},
 	{.compatible = "realtek,rt5666"},
-	{},
+	{}
 };
 MODULE_DEVICE_TABLE(of, rt5665_of_match);
 #endif
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt5665_acpi_match[] = {
-	{"10EC5665", 0,},
-	{"10EC5666", 0,},
-	{},
+	{ "10EC5665" },
+	{ "10EC5666" },
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, rt5665_acpi_match);
 #endif
-- 
2.25.1

