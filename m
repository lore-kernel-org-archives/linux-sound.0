Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0614A749C
	for <linux-sound@vger.kernel.org>; Fri, 30 May 2025 13:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613343; cv=none; b=taawpGhzCeqF8G4MM8B2uG7yuXSBzCwVPC2bLPrdNNhrSCQ38r+6vQOzyF00syN22swv/6C0EhsoDg/NOOIbLDscxTPTc8Ne6u6NvBpM2/A5zXVOp9E9CvC+bZTIWDQT7g1u4YEcX7q0mBmU4LVhHmxAPl3dHzKw5/l3Nb+JaDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613343; c=relaxed/simple;
	bh=siB99Kx71Cz1i9jULbxMvYQhFN/gDB6SSzRwANUBYaM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=fiO3A7HYRHmBScDByjkkxNQZg+nhu3XEjZkO/aQA6WCvAr8YBzN2rB3mcOycDX8OZbC6q8pmWGMzpmLlBNxI0a4JkG5p/skZiPDE69p6YGIc4VNalFax0muNPIu+BpSOguyDBXZAw6vG97rnckv+Ug4m21oj3KZrtXFoiDyDeNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E5wcapaU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E5wcapaU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748613342; x=1780149342;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=siB99Kx71Cz1i9jULbxMvYQhFN/gDB6SSzRwANUBYaM=;
  b=E5wcapaU31+SOS11qWR8CYh/wVeGsrEWrkWLIE/H+z1jIirwsJe0TXcR
   Eu++Fo+aQxhMpmoT4CtHNDUPFVDW/MFfqn0fgqHH8pBLsHOpm2YHfRoXT
   78l+WjiUOcALDRZCT9C4NS3mDBUVZ0hcl6bE++KlCyb5JPa4nP0CWRw1W
   +ybagnH93jSia4pva3K/oZAWsjTrgMJd0TjUtXD6mitfAl4ZmZNi/BFGq
   IFP4Gc/65DHkel7I3iKB4JructyrRpgAbKaxTcOaVANOsgg6lrRgVU+Tx
   YknMxUC+iCJJWH1a1tEYB0Vmfs/NNCgSxBPFVhwhurAQ8cg4vaiEMwSWM
   w==;
X-CSE-ConnectionGUID: bqzBbZlAQbq3NVsECqzABQ==
X-CSE-MsgGUID: McqgrrQ0S3a+6cYKa56dsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="62051049"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="62051049"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 06:55:42 -0700
X-CSE-ConnectionGUID: XoncAqB4SPqV/qdjnAH2HQ==
X-CSE-MsgGUID: +tkUtjAESGCxgktoC6ovcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="167073665"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa002.fm.intel.com with ESMTP; 30 May 2025 06:55:40 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH] ASoC: pcm: Do not open FEs with no BEs connected
Date: Fri, 30 May 2025 16:12:31 +0200
Message-Id: <20250530141231.2943351-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The check is performed in prepare-step, that is dpcm_fe_dai_prepare()
but that is very late - code operates on invalid configuration from
dpcm_fe_dai_open() till it gets there. Relocate the check to the
open-step to avoid any invalid scenarios.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/soc-pcm.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 43835197d1fe..2c21fd528afd 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2510,17 +2510,6 @@ static int dpcm_fe_dai_prepare(struct snd_pcm_substream *substream)
 
 	dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_FE);
 
-	/* there is no point preparing this FE if there are no BEs */
-	if (list_empty(&fe->dpcm[stream].be_clients)) {
-		/* dev_err_once() for visibility, dev_dbg() for debugging UCM profiles */
-		dev_err_once(fe->dev, "ASoC: no backend DAIs enabled for %s, possibly missing ALSA mixer-based routing or UCM profile\n",
-			     fe->dai_link->name);
-		dev_dbg(fe->dev, "ASoC: no backend DAIs enabled for %s\n",
-			fe->dai_link->name);
-		ret = -EINVAL;
-		goto out;
-	}
-
 	ret = dpcm_be_dai_prepare(fe, stream);
 	if (ret < 0)
 		goto out;
@@ -2776,11 +2765,23 @@ static int dpcm_fe_dai_open(struct snd_pcm_substream *fe_substream)
 	/* calculate valid and active FE <-> BE dpcms */
 	dpcm_add_paths(fe, stream, &list);
 
+	/* There is no point starting up this FE if there are no BEs. */
+	if (list_empty(&fe->dpcm[stream].be_clients)) {
+		/* dev_err_once() for visibility, dev_dbg() for debugging UCM profiles. */
+		dev_err_once(fe->dev, "ASoC: no backend DAIs enabled for %s, possibly missing ALSA mixer-based routing or UCM profile\n",
+			     fe->dai_link->name);
+		dev_dbg(fe->dev, "ASoC: no backend DAIs enabled for %s\n", fe->dai_link->name);
+
+		ret = -EINVAL;
+		goto put_path;
+	}
+
 	ret = dpcm_fe_dai_startup(fe_substream);
 	if (ret < 0)
 		dpcm_fe_dai_cleanup(fe_substream);
 
 	dpcm_clear_pending_state(fe, stream);
+put_path:
 	dpcm_path_put(&list);
 open_end:
 	snd_soc_dpcm_mutex_unlock(fe);
-- 
2.25.1

