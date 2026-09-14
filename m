Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD51341F7D4
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 10:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380915; cv=none; b=liU70W6+i/3JKg/VIuiO5XGIuUPGLlasTHZNxbcwWNqTvDoRmymc0T9E4h1urJgqV7aNfTK0wknTw8L42lFg/ho+rg9CWW3JS3dWdNkTJbOZG42AC/YEDtgx7iv6TjUd6wCidtbnGZRczrLObMyJhOqdeZywzrJKqiR1AY5CcbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380915; c=relaxed/simple;
	bh=u8gtw3RY2cTmKKpOJB1x88S+BSUjM3gKULR66ufffZY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m70HyTUgxOV+gVWZ7iqfVbxc+mUx1IOz7e92fGZnkWitNd94xbRmZRL42iior0iZ/x2HW+t6u+HqxVUzJQsDXYMyFMq90LWOXBQf8+Lk0vW93lsgIGZtkEr+d9YCyCSF/0BLHaNF+yle1OzWSSWoA10eUxuYwsG/VY5QSaP9WsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUNDMdlD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUNDMdlD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789380912; x=1820916912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u8gtw3RY2cTmKKpOJB1x88S+BSUjM3gKULR66ufffZY=;
  b=IUNDMdlD1KVxQvrYQ9iTiYyZuzfY0bTH53bwd7UHMh/5ogUXL0evh+52
   H8IE3hhiknvoKRfDCUxbfWtAEcxEHw23MY5LSS5zN7UUixTdNHRtH04zu
   Yw/nYKz54iXl0TF2BcDhDp2gv+IuMSCErEWnBx54lc8/+YL0f5oy0zfDG
   05zS4xS/lMeeUj8DVe9uCojH2oK1a+GjiOhVabGuGUDhF+YDugnp57302
   WPRaRksuW14e2Mqh0a1xGXQKgiC8YRCy+zvWqoercomL1hGbVpdCQtlh+
   KbsBtNhLAlcMUseVQzUQur3LgRKwKJhIrRfojUx6Usw3p+ADrqa/MnO34
   Q==;
X-CSE-ConnectionGUID: uY3CWbiOShagjsNzhcebLw==
X-CSE-MsgGUID: WwLYZX3BQnO0mJGQkYthtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="107102786"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="107102786"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 03:15:04 -0700
X-CSE-ConnectionGUID: hErvrEW/SS2AvQOvZQunHQ==
X-CSE-MsgGUID: s338yG7TR+OwGP2ZqYlw8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="296093938"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa002.fm.intel.com with ESMTP; 14 Sep 2026 03:15:02 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/2] ASoC: codecs: hda: Use list_count_nodes() to simplify the code
Date: Mon, 14 Sep 2026 12:19:17 +0200
Message-Id: <20260914101917.2969665-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260914101917.2969665-1-cezary.rojewski@intel.com>
References: <20260914101917.2969665-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By enlisting list_count_nodes(), a recent addition to the list.h, the
code responsible for manual counting of the HDAudio PCMs can be dropped.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/hda.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
index 237b0b060457..084659106d5d 100644
--- a/sound/soc/codecs/hda.c
+++ b/sound/soc/codecs/hda.c
@@ -85,12 +85,11 @@ static int hda_codec_register_dais(struct hda_codec *codec, struct snd_soc_compo
 	struct snd_soc_dai_driver *drvs = NULL;
 	struct snd_soc_dapm_context *dapm;
 	struct hda_pcm *pcm;
-	int ret, pcm_count = 0;
+	int ret, pcm_count;
 
-	if (list_empty(&codec->pcm_list_head))
+	pcm_count = list_count_nodes(&codec->pcm_list_head);
+	if (!pcm_count)
 		return -EINVAL;
-	list_for_each_entry(pcm, &codec->pcm_list_head, list)
-		pcm_count++;
 
 	ret = hda_codec_create_dais(codec, pcm_count, &drvs);
 	if (ret < 0)
-- 
2.34.1

