Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B81D6FD0
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 16:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715272478; cv=none; b=EA5kIt+LfwrPicVVQKYVRgUV6iqeGJ/LF5y/TtG9eVKyqMaAbBKMBPqUYHcGV4YjyZ/q3mDFP1wKfTq7C27RMAZy8MKBI10b/uUdHWdACJGzsPOFpG2R/eF6ztauFdNpZ83+V1Mm7l7ztnjAuQvDYjWAw0z8BoJuDIy7yZZamUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715272478; c=relaxed/simple;
	bh=vdUXvj31VRzGNcb2Reu0iGTWq+ST+xK5JQCgJuLhRpk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=havEyPvCvj2a/J97gl7I4YgSXZQBuJcneaL6JzTYPTbsaX0V4GXAIxIrV499j6ycSlmZC5WDQVb7zaFmFhs1i809XKLrQdLmaqHWOxpId7GNGPXoflWlx/0xGEY8SyzSeTvEyuP1TFko3BMHi449D5R7DC2FAtbJhx/4FEoCeEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BrKW5cze; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BrKW5cze"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272477; x=1746808477;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vdUXvj31VRzGNcb2Reu0iGTWq+ST+xK5JQCgJuLhRpk=;
  b=BrKW5czex/6H6FsNU9RA3aG+0cxbkcTq3Qu6Gg4606P6XgeBgNfS91Ox
   MXTsfibuGN0pVuX13DsMzYmrSjPenTefLUaKT647oem9siG7jBaMm+a54
   pS0qGP2bTx5Hx/1LTwaJk3G3W1LwCTSPvjilmdz7SI4r7RuIxuVs5Yaua
   i+sfXCLQW42YEQqe3cEgsMFF5Zoj1CxRWxG+x1+A4+F1sOvIHVSYoqjQm
   UPhEXPYnbG/TUBef1TZSYcQsZXixGL4r37C0rqwYoXZXouoR45I2GX545
   XvNJZnFYG3uJLJRdfhVXFI+ujH4Rj/tA0RI+qT/N9ByMmEKwqw6rSY1lF
   A==;
X-CSE-ConnectionGUID: 5T1BereBRX+SfOcZMyX2zQ==
X-CSE-MsgGUID: PcKoCDrnSgCKmYJzzlQj/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017632"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="15017632"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:35 -0700
X-CSE-ConnectionGUID: K2pNm49VSN6Cj5ymkX0y5g==
X-CSE-MsgGUID: AHqY1zzgQ6Sxjo0DVZmxyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="33761049"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 18/18] ASoC: Intel: sof_sdw_rt_amp: use dai parameter
Date: Thu,  9 May 2024 11:34:18 -0500
Message-Id: <20240509163418.67746-19-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

get_codec_name_and_route() get dai name from the first codec dai in a dai
link. However, the dai may not always be the first codec dai. Use the
dai parameter to make sure get_codec_name_and_route() refers to the
correct dai.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_rt_amp.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_rt_amp.c b/sound/soc/intel/boards/sof_sdw_rt_amp.c
index df03441ab364..797ea9ffa77a 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_amp.c
@@ -158,15 +158,11 @@ static const struct snd_soc_dapm_route rt1318_map[] = {
 	{ "Speaker", NULL, "rt1318-2 SPOR" },
 };
 
-static const struct snd_soc_dapm_route *get_codec_name_and_route(struct snd_soc_pcm_runtime *rtd,
+static const struct snd_soc_dapm_route *get_codec_name_and_route(struct snd_soc_dai *dai,
 								 char *codec_name)
 {
-	const char *dai_name;
-
-	dai_name = rtd->dai_link->codecs->dai_name;
-
 	/* get the codec name */
-	snprintf(codec_name, CODEC_NAME_SIZE, "%s", dai_name);
+	snprintf(codec_name, CODEC_NAME_SIZE, "%s", dai->name);
 
 	/* choose the right codec's map  */
 	if (strcmp(codec_name, "rt1308") == 0)
@@ -186,7 +182,7 @@ int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai
 	int ret;
 	int i;
 
-	rt_amp_map = get_codec_name_and_route(rtd, codec_name);
+	rt_amp_map = get_codec_name_and_route(dai, codec_name);
 
 	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
 					  "%s spk:%s",
-- 
2.40.1

