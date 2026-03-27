Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034393F0746
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 13:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774617506; cv=none; b=n80yPVAtGDpS+4lLqUzkWWAPAEsyRmql7xN8obRSzg14pPsk1UWPt3XTmQUyhwHJLiDcb6IKq6jgnypkyGVEME1ln45sQb82ATEI5DBzZ/d3TAY3M27o/NCPjkKFAKy5rzkMJPcqZ2x5JRzHhogLXJvAjpZOKBHcckJkhf73UHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774617506; c=relaxed/simple;
	bh=lIcEeJUAxHlLV+3EoJu2rdgzUpTAIhxvKJOwKa/Fqvg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=hcAr0LpQsYfRQxNVw3Ozj1HZ+cdNjeCZijaZN7AGJ0R3SNktWyaWsRscuIYfZbACV1tVg0H4WI5uOAgetaDVR653+Zwr+lv4AhGlEn6EHrzI5j+JRs4fOhTrTS1XycoIybBI2fvEENdNZDHIT9RG4F2eK+h71wMj25GUlQtqd+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AUXUGKxu; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AUXUGKxu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774617505; x=1806153505;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lIcEeJUAxHlLV+3EoJu2rdgzUpTAIhxvKJOwKa/Fqvg=;
  b=AUXUGKxu2bcb0lK+Cd42sKvBNP2uIg/E0PtjgHq23jnDfwGPznwdwsEz
   l3sz/PwcbH6YmS6KFzzqj4NrL9f72BMt4JciBex/Fy1SuGmRjTqb67fce
   VtW2MW2C4rIr1lujvfbn6ewZO1UsUMkLEgFebU/32cd7uuUp+zEzd82WO
   +uz+ky1ryEVzwFZkHjdZiYCz/P0XWNELucIfBxxJrq1Uag4QvIZgWlbiU
   62KXSqp/HnYz4hO2AulkGoawwhNTw7qjjq+uwSzvvqGVhwnalufR6RR51
   f2bJaOPLKRuXsYNz7Ln1gTMThpXPYW+knJS5HNc7zB4EUG91oFUjGBxmC
   w==;
X-CSE-ConnectionGUID: BzGXAXrcSlaqOxLiCHWAEw==
X-CSE-MsgGUID: Va5ZZyQvQCiMp90L5jgWaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75571280"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="75571280"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 06:18:25 -0700
X-CSE-ConnectionGUID: DVjpZ390Rn2/FpCszCsiXQ==
X-CSE-MsgGUID: /2HYjI6gTIyOGNylFRiIZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="248354538"
Received: from jpp-desktop.igk.intel.com ([10.91.221.24])
  by fmviesa002.fm.intel.com with ESMTP; 27 Mar 2026 06:18:23 -0700
From: Sachin Mokashi <sachin.mokashi@intel.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	tiwai@suse.com,
	pierre-louis.bossart@linux.dev,
	cezary.rojewski@intel.com,
	Sachin Mokashi <sachin.mokashi@intel.com>
Subject: [PATCH] ASoC: Intel: ehl_rt5660: Use the correct rtd->dev device in hw_params
Date: Fri, 27 Mar 2026 09:14:39 -0400
Message-Id: <20260327131439.1330373-1-sachin.mokashi@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In rt5660_hw_params(), the error path for snd_soc_dai_set_sysclk()
correctly uses rtd->dev as the logging device, but the error path for
snd_soc_dai_set_pll() uses codec_dai->dev instead.

These two devices are distinct:
- rtd->dev is the platform device of the PCM runtime (the Intel HDA/SSP
  controller, e.g. 0000:00:1f.3), which owns the machine driver callback.
- codec_dai->dev is the I2C device of the rt5660 codec itself
  (i2c-10EC5660:00).

Since hw_params is a machine driver operation and both calls are made
within the same function from the machine driver's context, all error
messages should be attributed to rtd->dev. Using codec_dai->dev for one
of them would suggest the error originates inside the codec driver,
which is misleading.

Align the PLL error log with the sysclk one to use rtd->dev, matching
the convention used by all other Intel board drivers in this directory.

Signed-off-by: Sachin Mokashi <sachin.mokashi@intel.com>
---
 sound/soc/intel/boards/ehl_rt5660.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/ehl_rt5660.c b/sound/soc/intel/boards/ehl_rt5660.c
index 5c7b218f22b7..c40cd9fb1a26 100644
--- a/sound/soc/intel/boards/ehl_rt5660.c
+++ b/sound/soc/intel/boards/ehl_rt5660.c
@@ -127,7 +127,7 @@ static int rt5660_hw_params(struct snd_pcm_substream *substream,
 				  params_rate(params) * 50,
 				  params_rate(params) * 512);
 	if (ret < 0)
-		dev_err(codec_dai->dev, "can't set codec pll: %d\n", ret);
+		dev_err(rtd->dev, "can't set codec pll: %d\n", ret);
 
 	return ret;
 }
-- 
2.34.1

Intel Deutschland GmbH
Registered Address: Dornacher Strasse 1, 85622 Feldkirchen, Germany
Tel: +49 89 991 430, www.intel.de
Managing Directors: Harry Demas, Jeffrey Schneiderman, Yin Chong Sorrell
Chairperson of the Supervisory Board: Nicole Lau
Registered Seat: Munich
Commercial Register: Amtsgericht Muenchen HRB 186928

