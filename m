Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB17C8C7
	for <linux-sound@vger.kernel.org>; Mon, 27 Jan 2025 14:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737989028; cv=none; b=ZrR0J57UGa8OI3bHhLKfCEvSLAR0PMNva5Y7DfnzA7t14TyEq4Bry8BxaQnQM74gUSZ5A/ipY0i9+ifAZ12uErJbnEXW8V2dUcVN7l/k00iSOZ1fzSF9UC87dhM+y95n8xKCPzyfnVI1wNmXa3iviMFbHSMOx94b9n0CRkm0XBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737989028; c=relaxed/simple;
	bh=yb21W7qX1c2R+imN8jhHd0d4Ij3+p2aQY+oWDVEQs1s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sPOA3zRIHOdwC2y69yef5/+P1bAnJFSdVsC7Tti7TeA2BjhQzugzKebNDScJXxHiuzCnvnWwFAS7tDW7xOoYD56IKUCvgTjeFCeeVmFlrXArIvCaNmKPX/vfQEQbFoZGhB996wET7eowNqMOJAk05I7jv9qw11w6UuAaYAgade0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iy6+F/vw; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iy6+F/vw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737989026; x=1769525026;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yb21W7qX1c2R+imN8jhHd0d4Ij3+p2aQY+oWDVEQs1s=;
  b=Iy6+F/vwTVMeJMip5Ykf4plf5B1Ag6sPMXiptS+UiDPm/CSsMMrLZSiX
   DDJt7RPXHkX2WfHR7Qma9k4nMAHXimq1c3E2ejl1QRCiOArE+kqkzU7ZP
   1EuZw9PngaMI1GABLMOsUovlJw2bdvyyt/aNJFntcGC0qIuicJsP6Bp4V
   4enJgRfvYEXOk/LT+DieIk4XoGGSg35UdtEZ1PgPILjf+BqiKBCkRyxxm
   BHylx2Kob3OFJsuV8n7Zjo6/pIEQQjPfCajIcSEj4PczTH/b0S/Wm0jUF
   ucA1+NhJIxHNIwA04xt944T2eUBvEcXk+oRjvP+RbvKlELsU5svNtI3r9
   A==;
X-CSE-ConnectionGUID: kxdoJ7OQRr+JqJ24t+FIzA==
X-CSE-MsgGUID: 0GqVfbBGRWWJiBzgb4WWhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="55991798"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="55991798"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 06:43:45 -0800
X-CSE-ConnectionGUID: jHo/4aXLRA+TAPPM1RCAeg==
X-CSE-MsgGUID: 0ReWtRURRSKR/i2uUsU6Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="108265325"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by orviesa009.jf.intel.com with ESMTP; 27 Jan 2025 06:43:43 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH] ASoC: core: Change device numbering
Date: Mon, 27 Jan 2025 15:44:45 +0100
Message-Id: <20250127144445.2739017-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently ASoC cards when enumerating create CPUs rtds first and CODECs
rtds second. This causes device number on cards to not start from 0, but
from number of present CPUs. During that it does count number of rtds
and uses it as device number visible in userspace.

This patch changes device visible to userspace, when listing cards:

Before:
card 0: hdaudioB0D0 [hdaudioB0D0], device 1: HDAudio Analog (*) []
card 1: hdaudioB0D2 [hdaudioB0D2], device 1: HDMI1 (*) []
card 1: hdaudioB0D2 [hdaudioB0D2], device 2: HDMI2 (*) []
card 1: hdaudioB0D2 [hdaudioB0D2], device 3: HDMI3 (*) []

After:
card 0: hdaudioB0D0 [hdaudioB0D0], device 0: HDAudio Analog (*) []
card 1: hdaudioB0D2 [hdaudioB0D2], device 0: HDMI1 (*) []
card 1: hdaudioB0D2 [hdaudioB0D2], device 1: HDMI2 (*) []
card 1: hdaudioB0D2 [hdaudioB0D2], device 2: HDMI3 (*) []

It is done by skipping back end devices and only counting front end
ones.

Now there are few concerns I have:
- while rtd->id is not used much, few drivers seem to be using it as
  index into a table, above may break this use (although
  "include/sound/simple_card_utils.h: * the ID stored in rtd->id may not be a valid array index."
  suggests that maybe it is a bad idea anyway, but I'm not sure how
  generic that comment is)
- this will break user scripts, with hardcoded device IDs
- this will also break some UCMs with hardcoded IDs

Now my main question is, if such patch would even be considered?
Perhaps device IDs are not considered as "stable" interface and can be
changed and my above worries are unnecessary.

Patch is a result of discussion from:
https://github.com/alsa-project/alsa-ucm-conf/pull/499
and as such I may consider others ways of fixing the problem.
---
 sound/soc/soc-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 3c6d8aef41309..ba257396b2063 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -558,7 +558,8 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	 */
 	rtd->card	= card;
 	rtd->dai_link	= dai_link;
-	rtd->id		= card->num_rtd++;
+	if (!rtd->dai_link->no_pcm)
+		rtd->id		= card->num_rtd++;
 	rtd->pmdown_time = pmdown_time;			/* default power off timeout */
 
 	/* see for_each_card_rtds */
-- 
2.34.1

