Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D7A139D0A
	for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 10:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719483496; cv=none; b=ieU7Wlz3mWfxSIR2nlm50BM2KwJsYMzGzYAHgx4ZP/LmT3VnvBqxnI/NBkvB40EjHFjkJX780LQUle+bSF8nK4xIzsb24SVSvFzXsI/zd8Cs0CzgnERB/hpRIbNXOpw7UV488AvJNFIOiaguU6YHMpwE2UOujEh7DcP1cDw/ceI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719483496; c=relaxed/simple;
	bh=yD+q2RDG/dZR0awJAesqv90yprhbvZCmeolGMXjZR+8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LYRX1jxenKvPhTT5PEknPZOjsDqbg/JUfN6djWWHi2r1eSnqVv/vtJEAy4Ie0Ng6W6U5PFy7Y38m5lndXbH36s0OZqveYXrxvXP8KEXNxWmeSDKh2u4T2Qht824/QjppXLNVkRM7U8iL+Vfj+89HJ+kU9hdc27rdF8RnXBKf4u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=afH84Mvm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="afH84Mvm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719483495; x=1751019495;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yD+q2RDG/dZR0awJAesqv90yprhbvZCmeolGMXjZR+8=;
  b=afH84MvmSYYFNmGmeSqXh423J792s2qdk98YbruVENNphaR8rxymyuXA
   vCSmVthaqiMUdrN0SSux5AdizIV3uzAMjgXSYgKcq2XS9GYifIV6FAJe0
   qwR8x98bhoJ+TYTNsMGV9TTUpnWHJiE6n58rkhEZqLtg6M6OJ7kCvn1QG
   z7e6Nuh0Z+yyLNtgMnZi8JkyzUlv9IBM5D+Re6h708osSRxepZ5F17LM0
   bmDTD6H+ab1nGjyEuyK73c9n1a4RXWZXMXHw5YREvsM8IttBVq9rBuy+U
   7Eg4QZI+eNUuzH5qDXdYgu1klIS01Qad1JydVtFqTuaedyOxVzvU6r1Iq
   w==;
X-CSE-ConnectionGUID: mlQLmyolTtajebWabqNKFw==
X-CSE-MsgGUID: 2aErNYRoQ+i5WbL/by3XcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="19487567"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="19487567"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 03:18:14 -0700
X-CSE-ConnectionGUID: 8ZBS3PezSWq1QW3MK/6hRg==
X-CSE-MsgGUID: IuhQhnHlR6u78amgENGfpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="45079963"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by orviesa008.jf.intel.com with ESMTP; 27 Jun 2024 03:18:13 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 01/13] ASoC: topology: Simplify code
Date: Thu, 27 Jun 2024 12:18:38 +0200
Message-Id: <20240627101850.2191513-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627101850.2191513-1-amadeuszx.slawinski@linux.intel.com>
References: <20240627101850.2191513-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Instead of using goto, when there is no controls, just do a loop when
there are. Overall the check seems to be a bit redundant as
num_kcontrols will only be above 0 if kcontrols are set anyway, but
let's keep it, while simplifying code.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 4b166294602fa..dff83d49a8f61 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -394,13 +394,9 @@ static void soc_tplg_remove_widget(struct snd_soc_component *comp,
 	if (dobj->unload)
 		dobj->unload(comp, dobj);
 
-	if (!w->kcontrols)
-		goto free_news;
-
-	for (i = 0; w->kcontrols && i < w->num_kcontrols; i++)
-		snd_ctl_remove(card, w->kcontrols[i]);
-
-free_news:
+	if (w->kcontrols)
+		for (i = 0; i < w->num_kcontrols; i++)
+			snd_ctl_remove(card, w->kcontrols[i]);
 
 	list_del(&dobj->list);
 
-- 
2.34.1

