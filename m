Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D7A13774B
	for <linux-sound@vger.kernel.org>; Wed,  3 Apr 2024 09:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712136686; cv=none; b=kjMdyYs26K0VXqnUl4wMuOxGwrHhXJ/zIZ7mjKgESuwNSRQWprMX9l6LoiiyRKBH3Hf48PGpStA3QnlOtrJ3/DBRLdMZTqQM2lFrXZosJPK6CkjOfe716mmyxK29I/RZJ6miSss/MRup2HiO0UNKaV/XxlxDKAUqK0AP/PwZzG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712136686; c=relaxed/simple;
	bh=3xPphXhzLbuA18UzOFb+kaXJTJ0k+ktqMIUg+a9AL6M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MwSTRQf7qrDpawLB2k2ugUaE4IvMgQbPQGgBRUhn9dTo1MzdmB/OJ6jRCXgNqxHg2r6KBHxBooJx0vU+u7o7u5uqMkroh/ssmbITL/pPmDp6WTiPF253jItj3yp4DACntvyCA3vE6t9qosQnQseu/5K51PeO0S0lFHgh/45z+rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OyCByTkB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OyCByTkB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712136685; x=1743672685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3xPphXhzLbuA18UzOFb+kaXJTJ0k+ktqMIUg+a9AL6M=;
  b=OyCByTkB509W4jwjlu5lbMaGofvjVEFeuPHoA0fZNEd+mZPcYsyOj0yt
   QS8f4hxOo2iH9i7eV57ztApxJYKCdUZzSn8oLR3ZEIBooqRi3gOzKCfdj
   urL1XYj7avTDGrP9nebHrMylkUO7bJNBr872Ug/9Hkk+wf6fHwQS0exeo
   tmA/hxHeisgEEQrNWmscXJjN1lgRYCoAwwrEToYW+naT2oGXInuPwv9QN
   Tr+TSHZJcqfWpJAYJiByeKY/8kfWd9craR9tsEw9/BJtz2qQROYRr1bDZ
   S3kSs6XIRoaxefxqgLXDCS8Tuv4STSofFl9+4STzkJPhNHjBGALu35ikh
   g==;
X-CSE-ConnectionGUID: UTHFL010TD+PcDDdLrhhYQ==
X-CSE-MsgGUID: 3ekWrQQxQwGco+bgWuIAuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7218711"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7218711"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 02:31:25 -0700
X-CSE-ConnectionGUID: lWZ0R/YRQwSDZ/CPRdwftA==
X-CSE-MsgGUID: PjStveT4SzmSB5jAlV/MEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18797557"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa007.jf.intel.com with ESMTP; 03 Apr 2024 02:31:23 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 06/10] ASoC: Intel: avs: rt274: Constify card_headset_pins
Date: Wed,  3 Apr 2024 11:31:41 +0200
Message-Id: <20240403093145.3375857-7-amadeuszx.slawinski@linux.intel.com>
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
 sound/soc/intel/avs/boards/rt274.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index 1cf5242160875..e3aa28780df5a 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -75,7 +75,7 @@ static const struct snd_soc_dapm_route card_base_routes[] = {
 	{"MIC", NULL, "Platform Clock"},
 };
 
-static struct snd_soc_jack_pin card_headset_pins[] = {
+static const struct snd_soc_jack_pin card_headset_pins[] = {
 	{
 		.pin = "Headphone Jack",
 		.mask = SND_JACK_HEADPHONE,
-- 
2.34.1

