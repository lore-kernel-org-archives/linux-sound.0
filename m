Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A030378B5C
	for <linux-sound@vger.kernel.org>; Mon,  4 Mar 2024 19:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709579075; cv=none; b=menmfReuplc9yHab0myvscnI3vlZ4A9CnBLZMdaFltYeru+VmN6P7cR1hwAtzbs4aTzTHT1g1KgW8UtsrmUDs+/jhnRduJpAtCiLt9MfUlBurQs72mLAhoQDSIHZZTV3kWFLLog2sSPmDu1Hx521ULEXt7mBekd5NyN0FETqU7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709579075; c=relaxed/simple;
	bh=JwZ+hTwodZVOZjjcv5y82g/XjxBtI97P5qvbPi/nw5s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=caMGDzfG434QApUMuglskReeq2aSa9G2cBdAjAERvqq/1f0NcRTZOdOC2o7CoxhCT8IfZUq2oDocpM932WL+LfSI0GkWkQfNKwt8x6ThXWSvq6DUpfAqjIb+H9aHG63V+uqWT+iGsPEBCZ41ycN1wPx3IQFkPyTQColzkKD5wKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fGza3HeE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fGza3HeE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709579074; x=1741115074;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JwZ+hTwodZVOZjjcv5y82g/XjxBtI97P5qvbPi/nw5s=;
  b=fGza3HeElkcfepwxWqHssLEM006km6q+sQs9722+9s9+Pq/bfXEWpDOS
   DvcxH/kBoOYZ29BeiUPBPliZFpUwCfofU7lFnJEnK8JSAhqSCEkJwDsVs
   oOCoYT6iPSRkU1/vHGfn31GA8ApQi8OG0HXskUGqcJtyRemmIJwuQhOMD
   d2P6+Vy51a52QGdnSFkA8nVBPFWB/R+No+imrOxnZXzOL/fgrcI+xBZFb
   lorD5BspLSnDi0XFgfGhwxaV2SeVGGULujBcgK9NHlIG3WFTPyPy5PIM4
   3a5ClbrqxzZODOjaUvICPeOaI5DD/aODYe16ejSVRFF9dYYaqfb6wVfFC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4257297"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="4257297"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 11:04:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="13788291"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa005.jf.intel.com with ESMTP; 04 Mar 2024 11:04:30 -0800
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
Subject: [PATCH 4/5] ASoC: Intel: avs: ssm4567: Board cleanup
Date: Mon,  4 Mar 2024 20:05:35 +0100
Message-Id: <20240304190536.1783332-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240304190536.1783332-1-cezary.rojewski@intel.com>
References: <20240304190536.1783332-1-cezary.rojewski@intel.com>
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

