Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470FC84D03
	for <linux-sound@vger.kernel.org>; Thu, 13 Jun 2024 09:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718269247; cv=none; b=tadm3RnPBNAj6OaZHhxye0NUd+oxi1HJLwvHixz6y5MPGNAsosDWMvK/3ARxrq8VAzPBAyFpf+L2HKNIRTItZA26avFECnl8otXYQhASUzWYACJqR6VTpGPNGHfqQ4NcopFAqdohGKWJC2EBbrsVm88jcOWDTwo9jCu3p9T18TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718269247; c=relaxed/simple;
	bh=RmlL49W8XAlC/ECbKBS7UloNBM1NP6YzyoAgBjV3DKY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=X+W1XO4j9obVKVwYH0mhaI/vN8CO89YSuXd4ptymsBIEIeXqUGdTo1h2GNbTusQoHijqIkLFpsrbfY5ju3V8r0nsdkueKViROB0QvAJUlAkyJarl+vwRwvG2acS3IaHClT8S3nuE4rw3LU6S3xC/YyR5bXeJyiccCI5VNoFHLOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ETmSd71y; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ETmSd71y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718269245; x=1749805245;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RmlL49W8XAlC/ECbKBS7UloNBM1NP6YzyoAgBjV3DKY=;
  b=ETmSd71y+jwcvUT1XebGwVAWkMOHxucs5ujhBJID0hbMThqN2wuKaQ+G
   EGfBG+yIXKNQvGlxeKZZK62gCZ/G4vyGx5ITuU6x7YV0UIYGSGp0+NfAi
   lkFcwcBkzwe3GAOpv4cMsxKbGERH5zGP4IGT23LlddYNYulJNdNsEaWXs
   TRF9gu/Dx8xBcrulKgrO/ZFt6kG+/SH0cdQ0gE2T6fj7N5vcRNj1jHuwp
   EZ/QPhyNo/F1x7FIsF8Zb1PEMQMRM0Kw91tzivN6fmLkOwD6I3zW8dd1S
   IxKjuiZYS21BbCjjVUHZs5EW0WzgnHQADrHmlHJBnQ7n2RwhlCX9VA/jj
   g==;
X-CSE-ConnectionGUID: pHXDAkTvTVWYpYG1oMTRnA==
X-CSE-MsgGUID: RxdjjQbXRHWQkUQpOYpwYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18001759"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="18001759"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 02:00:44 -0700
X-CSE-ConnectionGUID: f8Id1/VKT+SSCHXW0MWXMQ==
X-CSE-MsgGUID: PgZiupMAR0KSxa8WXr6WdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="44455422"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jun 2024 02:00:42 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH] ASoC: topology: Fix route memory corruption
Date: Thu, 13 Jun 2024 11:01:26 +0200
Message-Id: <20240613090126.841189-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It was reported that recent fix for memory corruption during topology
load, causes corruption in other cases. Instead of being overeager with
checking topology, assume that it is properly formatted and just
duplicate strings.

Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Closes: https://lore.kernel.org/linux-sound/171812236450.201359.3019210915105428447.b4-ty@kernel.org/T/#m8c4bd5abf453960fde6f826c4b7f84881da63e9d
Suggested-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 0225bc5fc425a..4b166294602fa 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1052,21 +1052,15 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 			break;
 		}
 
-		route->source = devm_kmemdup(tplg->dev, elem->source,
-					     min(strlen(elem->source), maxlen),
-					     GFP_KERNEL);
-		route->sink = devm_kmemdup(tplg->dev, elem->sink,
-					   min(strlen(elem->sink), maxlen),
-					   GFP_KERNEL);
+		route->source = devm_kstrdup(tplg->dev, elem->source, GFP_KERNEL);
+		route->sink = devm_kstrdup(tplg->dev, elem->sink, GFP_KERNEL);
 		if (!route->source || !route->sink) {
 			ret = -ENOMEM;
 			break;
 		}
 
 		if (strnlen(elem->control, maxlen) != 0) {
-			route->control = devm_kmemdup(tplg->dev, elem->control,
-						      min(strlen(elem->control), maxlen),
-						      GFP_KERNEL);
+			route->control = devm_kstrdup(tplg->dev, elem->control, GFP_KERNEL);
 			if (!route->control) {
 				ret = -ENOMEM;
 				break;
-- 
2.34.1

