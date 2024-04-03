Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D1F137762
	for <linux-sound@vger.kernel.org>; Wed,  3 Apr 2024 09:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712136694; cv=none; b=na6vB5dEvM8s8lIc0E6p5Qo5bXmPYUVCMex+pC4m6wtqgxuEktbtDIK0Wx6kjfNw+AD/tTzIQAAOnIR63HDiVjjmVrmm5TRoZpaimLk4+T/JfoaznoVz4rKsW1vIG3DGYLXKwM6Uy9gdWYS2cd7JqEbNKOg3k7xWXPLh5EjSA2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712136694; c=relaxed/simple;
	bh=/0HwR9BeGlHT/8EimwBOYK6tvT4kTu02wjjOYw0tNGk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FP7f7g4E7lu7rm7EOG297Y4oSeVDKZJ3O1YNet9VrVEkCUa6Pibc6dGryOxCi+lPPFDJWFqcpnTXDLqSl+Q4QU0RYje+S+tACMYg+GoPMjJR3jDZSuKnufUXNXxEkHdI9eJutkKtFUZJHEpItXZuZxSb9WEgGv43aPvYpUQ8fT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eh5tztGi; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eh5tztGi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712136693; x=1743672693;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/0HwR9BeGlHT/8EimwBOYK6tvT4kTu02wjjOYw0tNGk=;
  b=Eh5tztGixikV3AXpsIKFjUuHZ3y4ywilg5XTPS2jjjd68MWOBTMtnerI
   ib7WGtW/JxLOpm2w/OofhRfehoEdvcTPuGJBCbASThsHRYabJGqWS90Ki
   +UByPWZwhyD7XP55TCeNum1h/NXR2fgwAmCcKrtE+EBG27reQqM5OFCfg
   iMcFW++dD7wg9y2InAvy+LUEGfYPYZC41Ncps1yCMISyGHjVaCuw4zpwX
   RGZXymRyjjipOvjji1Lf+fNV23Sk4bA4QWLVeatx19Gyr0n7g0sXRia8V
   BExYXH6Pq++KGsjwQ9kcR3hEsoVviJwqrkLWq0Vniptwbn2FIJwKMGHJ6
   g==;
X-CSE-ConnectionGUID: JlwEwRlLQ0eix87fJoIIcw==
X-CSE-MsgGUID: Cz/Ft6qlSVmNhAXgZT0OxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7218752"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7218752"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 02:31:32 -0700
X-CSE-ConnectionGUID: 1zKRmFJ1R/e8oauVacYm8g==
X-CSE-MsgGUID: phKU8EAhThiVGTLk/yTDvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18797585"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa007.jf.intel.com with ESMTP; 03 Apr 2024 02:31:31 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 10/10] ASoC: Intel: avs: rt5682: Constify card_headset_pins
Date: Wed,  3 Apr 2024 11:31:45 +0200
Message-Id: <20240403093145.3375857-11-amadeuszx.slawinski@linux.intel.com>
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
 sound/soc/intel/avs/boards/rt5682.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index 594a971ded9eb..823f04dba2f76 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -80,7 +80,7 @@ static const struct snd_soc_dapm_route card_base_routes[] = {
 	{ "IN1P", NULL, "Headset Mic" },
 };
 
-static struct snd_soc_jack_pin card_jack_pins[] = {
+static const struct snd_soc_jack_pin card_jack_pins[] = {
 	{
 		.pin = "Headphone Jack",
 		.mask = SND_JACK_HEADPHONE,
-- 
2.34.1

