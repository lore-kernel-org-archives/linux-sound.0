Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1533F3B05AF
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 10:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466782; cv=none; b=ZBDaiIG8ciEpSH+fwpihXS5r1TvMG6mDKoxQKnSwFOH/F0LU6bRjWwkaEHJs67tVBLlCl+94WIrpx/pnxACK4G/GYzaDslwyyzSAyE5ve+RtD7PLBIKcOsW3TNa4zM25E+OvnaJYLINwGkyydHOV2u+QbfkZt9N8mDycBJYIRAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466782; c=relaxed/simple;
	bh=dSTCKmxcBaOFa8dCqcC5qK6BNOcxDCPfc+EZQpkwH+M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OcQle1b+imNIlvnfM+2MZUVe+z1H41471iHFPT95yBx1mBE/WUBeBBQJ+HwEKbjI0wFdtOQI5xoV4NNGh2slq6rLb/UjSpZmygYewYeEwA7ZyATXfkBY12oF4M+Ez3XpqyzWkcLZ0BKJ1byR07YlNFMuGL3gO7GpPLoE33gkHDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ayTNd88U; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ayTNd88U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789466780; x=1821002780;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dSTCKmxcBaOFa8dCqcC5qK6BNOcxDCPfc+EZQpkwH+M=;
  b=ayTNd88UzHIsqpwtpvcS4xwJL7M4pXr6HdS3Wg06pikhwnDDk7ufDW/+
   K/IchIg1HKoR8qe9kXAeCSD9rjgwqbKs5Fnk/qNDmaU3tw/l7qmwU9GkE
   5f5Mnt+GVH6wnW0j6g3lBCy24wd+5grwewXDpXGlaxIG42bEgWPEP9Gr2
   Yrcei3/FZlpH6kNzdmqTIfbh8QWbbPnBjkez9Rj5dFSDBIQ9xp+sm5xNd
   isqs4pqupLEeJHYHnivxGxX3Q6F//7xWumNUyCEb4C3CBdeFox8r0+0lI
   jke3o5pWqNUlMpVM6eNNwSYvz+0cMchFsigMKsSGjyvV5TaXCMekL61hs
   A==;
X-CSE-ConnectionGUID: LPXbV2hoSCOj3LeVovzyLQ==
X-CSE-MsgGUID: TvpxYilQTziBXn0icROyaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100979690"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100979690"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:06:19 -0700
X-CSE-ConnectionGUID: Ckiya6XOS+S7R8gvHLeh7g==
X-CSE-MsgGUID: Ex5qcEDgSpaBDBXPuHmL3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272925941"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa007.jf.intel.com with ESMTP; 15 Sep 2026 03:06:17 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH] ASoC: Intel: avs: Remove topology-loading wrappers
Date: Tue, 15 Sep 2026 12:10:37 +0200
Message-Id: <20260915101037.3087956-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With recent changes avs_load_topology() became unused whereas
avs_remove_topology() is a simple wrapper. Drop them both.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c      |  4 ++--
 sound/soc/intel/avs/topology.c | 25 -------------------------
 sound/soc/intel/avs/topology.h |  3 ---
 3 files changed, 2 insertions(+), 30 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 8174d2ebfa99..2d7ced953fde 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1065,7 +1065,7 @@ static int avs_component_probe(struct snd_soc_component *component)
 	return 0;
 
 err_load_libs:
-	avs_remove_topology(component);
+	snd_soc_tplg_component_remove(component);
 	return ret;
 }
 
@@ -1083,7 +1083,7 @@ static void avs_component_remove(struct snd_soc_component *component)
 	mutex_unlock(&adev->comp_list_mutex);
 
 	if (mach->tplg_filename) {
-		ret = avs_remove_topology(component);
+		ret = snd_soc_tplg_component_remove(component);
 		if (ret < 0)
 			dev_err(component->dev, "unload topology failed: %d\n", ret);
 	}
diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 5d70be63a4a7..1085090d5a9c 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -2226,28 +2226,3 @@ struct avs_tplg *avs_tplg_new(struct snd_soc_component *comp)
 
 	return tplg;
 }
-
-int avs_load_topology(struct snd_soc_component *comp, const char *filename)
-{
-	const struct firmware *fw __free(firmware) = NULL;
-	int ret;
-
-	ret = request_firmware(&fw, filename, comp->dev);
-	if (ret < 0) {
-		dev_err(comp->dev, "request topology \"%s\" failed: %d\n", filename, ret);
-		return ret;
-	}
-
-	ret = snd_soc_tplg_component_load(comp, &avs_tplg_ops, fw);
-	if (ret < 0)
-		dev_err(comp->dev, "load topology \"%s\" failed: %d\n", filename, ret);
-
-	return ret;
-}
-
-int avs_remove_topology(struct snd_soc_component *comp)
-{
-	snd_soc_tplg_component_remove(comp);
-
-	return 0;
-}
diff --git a/sound/soc/intel/avs/topology.h b/sound/soc/intel/avs/topology.h
index 189984ce7b51..25f3888a1939 100644
--- a/sound/soc/intel/avs/topology.h
+++ b/sound/soc/intel/avs/topology.h
@@ -233,7 +233,4 @@ struct avs_tplg_module {
 extern const struct snd_soc_tplg_ops avs_tplg_ops;
 struct avs_tplg *avs_tplg_new(struct snd_soc_component *comp);
 
-int avs_load_topology(struct snd_soc_component *comp, const char *filename);
-int avs_remove_topology(struct snd_soc_component *comp);
-
 #endif
-- 
2.34.1

