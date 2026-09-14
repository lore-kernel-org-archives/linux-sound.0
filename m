Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260FA42C514
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 10:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380908; cv=none; b=Qq1uM1V1MTESeA9TAqlVeb5o2XU1KgyWr9cgOFABpbiidxhvLvWgeTrxiORNjAsju9taIFT7UGur8nTOFAOpLDRfF4pzp4dLtxwXkKPSfSbkcHDhxzyykYRP+LnzTooLx8rAUbp7lhV1X4C+WtWDonx2xV6kfABUrKeKcWm279w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380908; c=relaxed/simple;
	bh=SSvz0FFSgyg29xz5woK909PJVEcExYSRAe/jIB2es3g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nFfqrH8IHcWf7ex45k74GZ7a5jAQmZrwjpyOXoO8gm8dG9WBzwSaZxRucD2QEUTn1swW8QDXs1OP7nQ3SANa5EVIpdynRqZQGAYVqqchp+kjLHGiLSMa+OBVVSvxbJTBdf17eUJuNDh+2LEG4rCsNwsYT70KuwYC4pcfeUm6hp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=At1+su3I; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="At1+su3I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789380907; x=1820916907;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SSvz0FFSgyg29xz5woK909PJVEcExYSRAe/jIB2es3g=;
  b=At1+su3IZhk21vd/lVVzEkoklaQjBEccJUJoUveTLwRuAGBx4Rt1CpYl
   lRwPsfqOTYgZCA73A3e/harl9yETT2DheJkrhnN6tJZTbdGxyAtBwq6o+
   WlKYxuRJSh+DCaG0w2F/075VQgKivPLFzLG+pWwjybIFIT558cbnFnaFh
   tH8T8acDoMyDLuyIAQe0Zsb6S7CxHQuDGqI/dEAkiZTND6eI/W58Wcr2t
   AwT5EpFntudeKAgUXf23Pcs7Ebqoby7hCWq5so/Fk05m55AJ6rKiAPzEx
   TWDLNc5qyK17biMr4ZbRw6xZ0BmavycU8p6rVpbUvMbj8O1FX2U88vGFt
   g==;
X-CSE-ConnectionGUID: jroFwXPdTymvWF1MOWPbOw==
X-CSE-MsgGUID: DaVbxR/tQBWzGpV2Lk09hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="107102779"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="107102779"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 03:15:03 -0700
X-CSE-ConnectionGUID: NmFxCUaqRUiJE1B75CFlJw==
X-CSE-MsgGUID: YKnfBL48TYS93zgi0mOW3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="296093931"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa002.fm.intel.com with ESMTP; 14 Sep 2026 03:15:00 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/2] ASoC: Intel: avs: Use list_count_nodes() to simplify the code
Date: Mon, 14 Sep 2026 12:19:16 +0200
Message-Id: <20260914101917.2969665-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
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
 sound/soc/intel/avs/boards/hdaudio.c | 8 +++-----
 sound/soc/intel/avs/pcm.c            | 7 +++----
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index 2e15a293298d..c1d2d0082b14 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -147,17 +147,15 @@ static int avs_probing_link_init(struct snd_soc_pcm_runtime *rtm)
 	struct snd_soc_dai_link *links = NULL;
 	struct snd_soc_card *card = rtm->card;
 	struct hda_codec *codec;
-	struct hda_pcm *pcm;
-	int ret, pcm_count = 0;
+	int ret, pcm_count;
 
 	mach = dev_get_platdata(card->dev);
 	pdata = mach->pdata;
 	codec = pdata->codec;
+	pcm_count = list_count_nodes(&codec->pcm_list_head);
 
-	if (list_empty(&codec->pcm_list_head))
+	if (!pcm_count)
 		return -EINVAL;
-	list_for_each_entry(pcm, &codec->pcm_list_head, list)
-		pcm_count++;
 
 	ret = avs_create_dai_links(card->dev, codec, pcm_count, &links);
 	if (ret < 0) {
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index ad25bd355769..8174d2ebfa99 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1614,7 +1614,7 @@ static int avs_component_hda_probe(struct snd_soc_component *component)
 	struct hda_codec *codec;
 	struct hda_pcm *pcm;
 	const char *cname;
-	int pcm_count = 0, ret, i;
+	int pcm_count, ret, i;
 
 	mach = dev_get_platdata(component->card->dev);
 	if (!mach)
@@ -1622,10 +1622,9 @@ static int avs_component_hda_probe(struct snd_soc_component *component)
 
 	pdata = mach->pdata;
 	codec = pdata->codec;
-	if (list_empty(&codec->pcm_list_head))
+	pcm_count = list_count_nodes(&codec->pcm_list_head);
+	if (!pcm_count)
 		return -EINVAL;
-	list_for_each_entry(pcm, &codec->pcm_list_head, list)
-		pcm_count++;
 
 	dais = devm_kcalloc(component->dev, pcm_count, sizeof(*dais),
 			    GFP_KERNEL);
-- 
2.34.1

