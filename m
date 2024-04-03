Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAAB1369B0
	for <linux-sound@vger.kernel.org>; Wed,  3 Apr 2024 09:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712136682; cv=none; b=tOFBSBmfcqRAEbR7gP1OWG/3M+snSi0BpzvLxqU9RDh2lwyIfBQ2wqYLSL5uc5jfFXQQZkAZWzFr5M3J5D/JVrksRcMZZWdpVpA3ZWUUmnzKjGWs32RZEtD4JDUwrx6yihrRoCOt6vc/N8kdl81wyuFeTl/9VVXo7twerdXtyhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712136682; c=relaxed/simple;
	bh=FTDH1oQvlp5NP1lmkejXPGpJ6yiFZuoKf7yu4Nvt+hQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=napN+1I81YyFDDZntxBDNRP4eDFVdOUMmtn/h715M2JKXZGSjMiQXVzuI+yMGd2re//8m6LcjmGeupvMiLIWNIqIMgt13wn0LIZ5LFqlfjF+JILdOUPqDcGEds4ymiUrUdhZzwClF3fp2FCTzEePCSeTs7CtAVPK78C9YPUcMEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NCuL4665; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NCuL4665"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712136681; x=1743672681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FTDH1oQvlp5NP1lmkejXPGpJ6yiFZuoKf7yu4Nvt+hQ=;
  b=NCuL4665pap15BwiygE4Di5tYd4u2R+Dh8sd5FQqCbBza2ot1Eknwtn9
   o26DGOaR8RS6YRx0XHzV0QQ1zqTBQclTPeDvgbWlD8Scp7ds6o93iRGHF
   o1i9Vwbg4DpJIRgv83amGQtSHa1n/sVzneCdo+etTfwjN38kt41VHA3LL
   9ODWBQidD6tHyUufsTk+AbUeBaIW5+fqHj4Kjzkx+NeWT/SmGRDPi5A82
   9fUhoxrxMG/t/U8PC6kekR3HHbG09e5Mzc7UIr7p5eOQOs+DcC7ENWW6E
   o80U1/GNu8cJlVbTMl0yNDjE/tFkwFZrXixft9/c/bj+XhpJVbbvEr/gm
   Q==;
X-CSE-ConnectionGUID: Kd2UHU3ZQDSzjau8sgm0nA==
X-CSE-MsgGUID: A/xD6N8jTJOcw/Gf0GmJ/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7218700"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7218700"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 02:31:21 -0700
X-CSE-ConnectionGUID: 4noLoxgzS8qG2ti1B+o6GQ==
X-CSE-MsgGUID: FdVRklATQ4OXsRArR76EWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18797545"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa007.jf.intel.com with ESMTP; 03 Apr 2024 02:31:19 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 04/10] ASoC: Intel: avs: es8336: Constify card_headset_pins
Date: Wed,  3 Apr 2024 11:31:39 +0200
Message-Id: <20240403093145.3375857-5-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
References: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

card_headset_pins is never modified, mark it const.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/es8336.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index 5c90a60075773..ff3bd15132694 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -85,7 +85,7 @@ static const struct snd_kcontrol_new card_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Internal Mic"),
 };
 
-static struct snd_soc_jack_pin card_headset_pins[] = {
+static const struct snd_soc_jack_pin card_headset_pins[] = {
 	{
 		.pin = "Headphone",
 		.mask = SND_JACK_HEADPHONE,
-- 
2.34.1

