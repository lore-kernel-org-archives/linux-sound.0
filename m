Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE46A52F6E
	for <linux-sound@vger.kernel.org>; Fri,  8 Mar 2024 09:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709888615; cv=none; b=RGjqeRtRs7uC1CcSsg9ISZJpM7KIakctD4yGuMTZYjPMmHVrUcUGdB3J2KseVE65bKC2z3OnkC+ZNfEEOwfYOO+ZTJj7B2xCo7v2iFbGrd8pQcASa88H7zRcYRqhfNsokCWqQ9yG+2AI7QlfYG17DI7A4GkhKYz+14DxRnXWHvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709888615; c=relaxed/simple;
	bh=JwZ+hTwodZVOZjjcv5y82g/XjxBtI97P5qvbPi/nw5s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ec5/akDSoUW64Af2D50AOVJWZ3DMZ5MhneBpPUZLEY7v5HogkDfS53GacGWIilJNAuJwTGAw8undszce4iUnESwtwZd9nQWT0QLfV+uDQYLolLIZo6rqRjC0i5FUKwNQSL5rrCdIRM0twdNvigDAAHuHwBJT1UlPwG14WQngKeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iaRP+Rf/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iaRP+Rf/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709888614; x=1741424614;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JwZ+hTwodZVOZjjcv5y82g/XjxBtI97P5qvbPi/nw5s=;
  b=iaRP+Rf/ga85SixQNRPexMTBe8rYa/0yjqe9vG9SlkGcLtniNgYURaxp
   YRghi7sMtqLZTKnLVWX+BjsQjiFP0R9Go6XN7nQJWAW0SFNtbLa0Tz8Ak
   yOTcPQyIGiIThbmnK9aJGxzcTVEjbEzwjut9py6d2rFs9BgddL1xfoMdu
   tFnsuKeRoH2ElMZc8QqsF6OuNuHzFxqqGJa3mqdZToWt+6sjPuluzm9wX
   cvoHM85OYHPov8kc+bYRDKo4OXXP0hoKVTuIp372+pplOHXz4ZGRC9aHy
   pB/uawe5VeKGLNhCYuv4Uk3ntywsgQkg/DI7N5yifXUZDVzGatk4xE20T
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15247012"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="15247012"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 01:03:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="10419287"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa010.jf.intel.com with ESMTP; 08 Mar 2024 01:03:31 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 4/5] ASoC: Intel: avs: ssm4567: Board cleanup
Date: Fri,  8 Mar 2024 10:05:01 +0100
Message-Id: <20240308090502.2136760-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240308090502.2136760-1-cezary.rojewski@intel.com>
References: <20240308090502.2136760-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The card-name suffix and the DP-widgets are an unintended copy-paste
from skl_nau88215_ssm4567.c. Both are redundant.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/ssm4567.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index b64be685dc23..abb87bb88fff 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -37,8 +37,6 @@ static const struct snd_kcontrol_new card_controls[] = {
 static const struct snd_soc_dapm_widget card_widgets[] = {
 	SND_SOC_DAPM_SPK("Left Speaker", NULL),
 	SND_SOC_DAPM_SPK("Right Speaker", NULL),
-	SND_SOC_DAPM_SPK("DP1", NULL),
-	SND_SOC_DAPM_SPK("DP2", NULL),
 };
 
 static const struct snd_soc_dapm_route card_base_routes[] = {
@@ -158,7 +156,7 @@ static int avs_ssm4567_probe(struct platform_device *pdev)
 	if (!card)
 		return -ENOMEM;
 
-	card->name = "avs_ssm4567-adi";
+	card->name = "avs_ssm4567";
 	card->dev = dev;
 	card->owner = THIS_MODULE;
 	card->dai_link = dai_link;
-- 
2.25.1

