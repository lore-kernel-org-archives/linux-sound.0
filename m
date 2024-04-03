Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E6E131E2D
	for <linux-sound@vger.kernel.org>; Wed,  3 Apr 2024 09:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712136685; cv=none; b=XZPkMFNAnfGS5l7kQNNE+aUKP/A7nzLIyDu3WT2NqIt+zIWzA3lgGs0OGHO2u3LGaFnjX2oHEFvm9mXNo+bpmNf0E/WENvByYCnKPXq7K42tGPRVOi3rw4Q9HcBmErEjwfS72NYzNotRGlX4q1BTQFG0Ld5rM9rN19IGfBJyu+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712136685; c=relaxed/simple;
	bh=7TaebfQkikL01h/Xt59bLY/GpqScWWg7l2TJk8s/O2U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CSPnveNWwMePS2H8hCi/MSlj9UrEJDMmWwdosOjIkILRhIcWwl5stgodPYVPlUD13NHIFwI2ilB8kQRly0vNSIGigRjinVqvL4vAIeGYnKnyL/W4yARMCf1YQiwXPqXUK9E4XFfwT1ZKbRQLgF8SOWQHiaAKyQ7pJLZozU8EH7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NRcXU78n; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NRcXU78n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712136683; x=1743672683;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7TaebfQkikL01h/Xt59bLY/GpqScWWg7l2TJk8s/O2U=;
  b=NRcXU78nd6e4swk4BMMlZ2anPnJhJoAHX+dnFW+za0/IkukAICGIG7Mq
   Vm1NmYcDk26kOs/+qruND0tXULhmJW0ilB20cG/tCBbQs2ffdW5xSGcNE
   /BRPF3QJbu1fXKVphZa/6AZ7OrJeki4N+hxzjutTF4eLKMVQrlf7j4O91
   ygW8foP+1oPQemujcfCEI+T1IQD1BVxGyZW42weIt0stOHhSHFD3KctAS
   n0gbSMIA/2pzEEs8NpfnE+Eu/0UYLCioih4Px0VP34m8hikqsCi1Umk5X
   MiOLku+NmPrCN79l8BJ//397/pddT+OTRjvqkv/qfJ2QDlfkIvxdY7T4p
   g==;
X-CSE-ConnectionGUID: INxa9KN4TJaCVKn2KkTrZQ==
X-CSE-MsgGUID: d2a4YvUxSJ2EaHKqIyUgdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7218706"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7218706"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 02:31:23 -0700
X-CSE-ConnectionGUID: MN8P8KzkTMaI6od6ijiikw==
X-CSE-MsgGUID: mjFkUyOSRAy3IC+qNb9djQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18797551"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa007.jf.intel.com with ESMTP; 03 Apr 2024 02:31:21 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 05/10] ASoC: Intel: avs: nau8825: Constify card_headset_pins
Date: Wed,  3 Apr 2024 11:31:40 +0200
Message-Id: <20240403093145.3375857-6-amadeuszx.slawinski@linux.intel.com>
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
 sound/soc/intel/avs/boards/nau8825.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index 55db75efae414..3164745b15167 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -67,7 +67,7 @@ static const struct snd_soc_dapm_route card_base_routes[] = {
 	{ "Headset Mic", NULL, "Platform Clock" },
 };
 
-static struct snd_soc_jack_pin card_headset_pins[] = {
+static const struct snd_soc_jack_pin card_headset_pins[] = {
 	{
 		.pin = "Headphone Jack",
 		.mask = SND_JACK_HEADPHONE,
-- 
2.34.1

