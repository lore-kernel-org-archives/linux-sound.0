Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F75A3126A2
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 14:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756303306; cv=none; b=OLJxZgSajCzBsqNIAImvpsLCLfnLtY4WLJCLhQ58XE5DWj0vyS46O47S7j1ztG/ka2pnR//m838xUxpEnDevKYlWHcL6sUnv4aqD662zc4TV9loMxGeYpoVw/FZaWAPN7xtstrSaA0pw6y8At5ONxIEfFUloj4U/nhtZpD5sPBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756303306; c=relaxed/simple;
	bh=eMv/h1XohztCrREmdCxf7qNl6XD1mxNaUoOTXPiBWgk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gE6PItUPFQO4K00FCkOkx7j2utRCZA7JDdXGUQIGBUwQ98XnfsNziUxzM5QqMvosOxiyG9yIFMZoF64SSu3R7KC3sS4y/y7p1Tm3LvC0eOAk5y1bxq81fvAgPBfOZd393bqZE9k5ylyQzfXMtfqvDmwtbfJtJkn63VhIundFO50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hOTu30e7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hOTu30e7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756303305; x=1787839305;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eMv/h1XohztCrREmdCxf7qNl6XD1mxNaUoOTXPiBWgk=;
  b=hOTu30e7qYz/tEr2xAi2AWM0QbFLMz2Bh/KaO/6oGW5jm5dIfjeNgWuO
   lX8JUYF+04nNY+SyzMHskV/8Gj8lHWx4wenYfbiBKAdTt34yxL80ZwBzO
   OU65chG6zq2TuE/TiXpWri8seZJGh2GN9yH6a8TV6WmRjJBv9mjtMLFOg
   uqOOGPuvu0tNJzIg6DyY4/3elzP/ulJ3NOKOS5u/ZPdpxD5ToLImiQqqd
   WRlW11OxS26vaFQoO3wKBDOM8V95OHEhSbIH6s/SAR1e5G/DCHtzqKhvz
   cFjlK4uE/zJH/fx76U5oNgHXzsZ6wlF96u6gNU9NBsRTYQ1TtmsihFMt7
   g==;
X-CSE-ConnectionGUID: ApHkksxwRzaHbHl3CWq4FQ==
X-CSE-MsgGUID: ZGF0Lj15TKKgp+Eit4eUAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58473799"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58473799"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 07:01:45 -0700
X-CSE-ConnectionGUID: dOekTf+oTkutZaLPie8qCQ==
X-CSE-MsgGUID: DrI9lkh7SrGgUe8P8KCFGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="170016799"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa008.jf.intel.com with ESMTP; 27 Aug 2025 07:01:44 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 5/5] ASoC: Intel: avs: Allow i2s test and non-test boards to coexist
Date: Wed, 27 Aug 2025 16:22:29 +0200
Message-Id: <20250827142229.869139-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250827142229.869139-1-cezary.rojewski@intel.com>
References: <20250827142229.869139-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The i2s_test card serves debug purpose and is not probed by default.
Currently i2s_test and non-i2s_test sound cards exclude each other. To
increase the test coverage, allow both board types to be probed
simultaneously and share the available SSP port pool.

As 'i2s_test' module parameter is empty by default and requires manual
input from user to activate, there is no impact for standard production
scenarios.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/board_selection.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index 8539ad3d97c4..52e6266a7cb8 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -507,6 +507,9 @@ static int avs_register_i2s_test_boards(struct avs_dev *adev)
 	unsigned long tdm_slots;
 	u32 *array, num_elems;
 
+	if (!i2s_test)
+		return 0;
+
 	ret = parse_int_array(i2s_test, strlen(i2s_test), (int **)&array);
 	if (ret) {
 		dev_err(adev->dev, "failed to parse i2s_test parameter\n");
@@ -560,9 +563,6 @@ static int avs_register_i2s_boards(struct avs_dev *adev)
 		return 0;
 	}
 
-	if (i2s_test)
-		return avs_register_i2s_test_boards(adev);
-
 	machs = avs_get_i2s_machines(adev);
 	if (!machs) {
 		dev_dbg(adev->dev, "no I2S endpoints supported\n");
@@ -649,6 +649,10 @@ int avs_register_all_boards(struct avs_dev *adev)
 		dev_warn(adev->dev, "enumerate DMIC endpoints failed: %d\n",
 			 ret);
 
+	ret = avs_register_i2s_test_boards(adev);
+	if (ret)
+		dev_dbg(adev->dev, "enumerate I2S TEST endpoints failed: %d\n", ret);
+
 	ret = avs_register_i2s_boards(adev);
 	if (ret < 0)
 		dev_warn(adev->dev, "enumerate I2S endpoints failed: %d\n",
-- 
2.25.1

