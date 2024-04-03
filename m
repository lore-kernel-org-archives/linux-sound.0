Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9126F08A
	for <linux-sound@vger.kernel.org>; Wed,  3 Apr 2024 09:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712135702; cv=none; b=KXTG3ZIkSBfBZckwyhJLdR4aDEOt04P8RYAmSZj1BKM7OQOeQBP7DRi7sSdKSPx8D4IRaL6qR2zhlcv5tOqxN10u2VNab3PQ98Gup/ShBE0SIElmXtNZXjviAXA1B8oKe76gq02cfxkSQhZ0prv2ac+iiUpax1DdROM07OMpqek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712135702; c=relaxed/simple;
	bh=iYFpr2MqS0B9WjuWG5dfN8QG1tQ6E7J2EnZtahGh85I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KF5zOawiWv5ioVqTCiY2Pnrvm+msoIqUrAMd2rsTN2TN+a88ijWUBM7DbybXBNsckoQBGOV1UNGa/XHf0y/6u7ziSMmIJZRjVfShakX/wWt5uqyF6mJUiRJ0UTYD5aDqCbddj5fYyKMXz5fcS82XKxi82ygfMlOzNjVT/RMUcW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m133iNYx; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m133iNYx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712135701; x=1743671701;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iYFpr2MqS0B9WjuWG5dfN8QG1tQ6E7J2EnZtahGh85I=;
  b=m133iNYxeAWAiAiv/5N1ddlnTVFoRy3Ain5tTuosCnsPVu/0zo2mSRlW
   XmUAA9vezKYZMeW+xjYg4T6osqlclGN09Bxcm4T61YK6/frVo3Atap5yB
   55J6k5NhXnshBpBrD36aq3S5bK5gjop6y94e1VIRMbP/IwpL9GYdtAK5l
   BvT7tdJvBCNtBMF8a4DfzUDbgVuuCPLpCX+RNuz6INigwrOWAwLO0soOj
   aNVglcuQrLq2YjqBzhGqJFXAlqNf1oxhjXhf1jdUrRdMkrrvEBD6Mkek5
   IH5UTEutblKX9hm522laHv13eZpjFqth3OEB2hFQ6zEwU5IwVfWpOw/4y
   w==;
X-CSE-ConnectionGUID: ycRaU7OOSISR2PJP6L9L6Q==
X-CSE-MsgGUID: zYEkyjnbTPOEideJMMkwUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="10322565"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="10322565"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 02:15:00 -0700
X-CSE-ConnectionGUID: slL1i1sHQiu17QNQsuEyzw==
X-CSE-MsgGUID: plvU+xOBR0C+wzO6jAn6dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18410517"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 03 Apr 2024 02:14:58 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	cujomalainey@chromium.org,
	lmajczak@google.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 3/4] ASoC: topology: Cleanup after ABI v4 support removal
Date: Wed,  3 Apr 2024 11:16:28 +0200
Message-Id: <20240403091629.647267-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240403091629.647267-1-cezary.rojewski@intel.com>
References: <20240403091629.647267-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Flag 'abi_match' along with several other local variables has no purpose
with v4 related members removed.

Cc: Curtis Malainey <cujomalainey@chromium.org>
Cc: Łukasz Majczak <lmajczak@google.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/soc-topology.c | 47 +++++++++-------------------------------
 1 file changed, 10 insertions(+), 37 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index e73dc4e786ff..90ca37e008b3 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1771,11 +1771,10 @@ static int soc_tplg_pcm_create(struct soc_tplg *tplg,
 static int soc_tplg_pcm_elems_load(struct soc_tplg *tplg,
 	struct snd_soc_tplg_hdr *hdr)
 {
-	struct snd_soc_tplg_pcm *pcm, *_pcm;
+	struct snd_soc_tplg_pcm *pcm;
 	int count;
 	int size;
 	int i;
-	bool abi_match;
 	int ret;
 
 	count = le32_to_cpu(hdr->count);
@@ -1805,24 +1804,15 @@ static int soc_tplg_pcm_elems_load(struct soc_tplg *tplg,
 		if (size != sizeof(*pcm))
 			return -EINVAL;
 
-		abi_match = true;
-		_pcm = pcm;
-
 		/* create the FE DAIs and DAI links */
-		ret = soc_tplg_pcm_create(tplg, _pcm);
-		if (ret < 0) {
-			if (!abi_match)
-				kfree(_pcm);
+		ret = soc_tplg_pcm_create(tplg, pcm);
+		if (ret < 0)
 			return ret;
-		}
 
 		/* offset by version-specific struct size and
 		 * real priv data size
 		 */
-		tplg->pos += size + le32_to_cpu(_pcm->priv.size);
-
-		if (!abi_match)
-			kfree(_pcm); /* free the duplicated one */
+		tplg->pos += size + le32_to_cpu(pcm->priv.size);
 	}
 
 	dev_dbg(tplg->dev, "ASoC: adding %d PCM DAIs\n", count);
@@ -2003,11 +1993,10 @@ static int soc_tplg_link_config(struct soc_tplg *tplg,
 static int soc_tplg_link_elems_load(struct soc_tplg *tplg,
 	struct snd_soc_tplg_hdr *hdr)
 {
-	struct snd_soc_tplg_link_config *link, *_link;
+	struct snd_soc_tplg_link_config *link;
 	int count;
 	int size;
 	int i, ret;
-	bool abi_match;
 
 	count = le32_to_cpu(hdr->count);
 
@@ -2032,23 +2021,14 @@ static int soc_tplg_link_elems_load(struct soc_tplg *tplg,
 		if (size != sizeof(*link))
 			return -EINVAL;
 
-		abi_match = true;
-		_link = link;
-
-		ret = soc_tplg_link_config(tplg, _link);
-		if (ret < 0) {
-			if (!abi_match)
-				kfree(_link);
+		ret = soc_tplg_link_config(tplg, link);
+		if (ret < 0)
 			return ret;
-		}
 
 		/* offset by version-specific struct size and
 		 * real priv data size
 		 */
-		tplg->pos += size + le32_to_cpu(_link->priv.size);
-
-		if (!abi_match)
-			kfree(_link); /* free the duplicated one */
+		tplg->pos += size + le32_to_cpu(link->priv.size);
 	}
 
 	return 0;
@@ -2161,8 +2141,7 @@ static int soc_tplg_dai_elems_load(struct soc_tplg *tplg,
 static int soc_tplg_manifest_load(struct soc_tplg *tplg,
 				  struct snd_soc_tplg_hdr *hdr)
 {
-	struct snd_soc_tplg_manifest *manifest, *_manifest;
-	bool abi_match;
+	struct snd_soc_tplg_manifest *manifest;
 	int ret = 0;
 
 	manifest = (struct snd_soc_tplg_manifest *)tplg->pos;
@@ -2171,15 +2150,9 @@ static int soc_tplg_manifest_load(struct soc_tplg *tplg,
 	if (le32_to_cpu(manifest->size) != sizeof(*manifest))
 		return -EINVAL;
 
-	abi_match = true;
-	_manifest = manifest;
-
 	/* pass control to component driver for optional further init */
 	if (tplg->ops && tplg->ops->manifest)
-		ret = tplg->ops->manifest(tplg->comp, tplg->index, _manifest);
-
-	if (!abi_match)	/* free the duplicated one */
-		kfree(_manifest);
+		ret = tplg->ops->manifest(tplg->comp, tplg->index, manifest);
 
 	return ret;
 }
-- 
2.25.1

