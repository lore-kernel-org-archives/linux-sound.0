Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E19613C9BD
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469137; cv=none; b=QRbwqks/1j3fjxwUrEGtCzsZ2XUZ+I+alqanwBig7n+iduZ1lH/338p6TOfqX5GXNFXdXJDRYhZ6kY1qEb/k9zx0OOIGsJ3mBMov/yf/Vv6Hj49F3VRg5TB/yzPbpu/Qkyu/fpAPP1vz5LTE5yxyYKVeb3exAHoYJYrzDFqeSsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469137; c=relaxed/simple;
	bh=mDzSkoz5dkqO6+iiJ4uoAI2nRZkxqWOmEeXtWfmUyek=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FaDInbL3ZwBW0g/CHbwyoW1zOsCXIPfdUc6Kv1q2zjxQWaNiVBKc0CLiVIq7eHx/x8T2eH/+03KmI9Tj3Z7oQGv5UeBWMG0dtrG6Z0qQjqDO2UtKfur/elA4q6Ym7gYi/5HwNi1TA8iVvENqxn5tCZIXPHpTk98s8QKiBOwX6jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BH0mcBQ4; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BH0mcBQ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469136; x=1743005136;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mDzSkoz5dkqO6+iiJ4uoAI2nRZkxqWOmEeXtWfmUyek=;
  b=BH0mcBQ47+X/3397eG+abPxzABw2cZzLNMnmvtHFxK3mt/nexMmsVaIt
   4ILV8cNZPxXz585/NhV2Mrgh8so/3Uh2bX2tp/OpnGJNRL9juwFuvaXd0
   dlZUCGeJLQCwZr1zpvQpy8hGBhag7l1HRTwKMp0wP6E9yhEykgGk37vyj
   SCbhioRuxhaKnBl7Wfn8WN+K37AJRg3H09G3Q1VHfyvmaMFK2upuNmyyY
   e9g03ZYVxocX9rAUNQoKWS/HkEPYUnEh6sPy2FgbCbjUzOhCnHmIP3RVd
   +jmas9Tw5oqrkfLBySTJKIFlD7TF8c9DrrQV20uHw9JC3NC5T6IxgM4HN
   w==;
X-CSE-ConnectionGUID: iRmLYDd+T+Ow6nbknp15TA==
X-CSE-MsgGUID: xKbVxxUATgOc1omwvTYTIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260468"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260468"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482333"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:56 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 20/34] ASoC: Intel: sof_sdw: Move ignore_pch_dmic to new parsing
Date: Tue, 26 Mar 2024 11:04:15 -0500
Message-Id: <20240326160429.13560-21-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Trivial move of the handling of ignore_pch_dmic over to the new parsing
code.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 0566ab843c2e..cda759ee6345 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1453,6 +1453,7 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 			       struct sof_sdw_endpoint *sof_ends)
 {
 	struct device *dev = card->dev;
+	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
 	struct snd_soc_codec_conf *codec_conf = card->codec_conf;
@@ -1483,6 +1484,8 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 			if (!codec_info)
 				return -EINVAL;
 
+			ctx->ignore_pch_dmic |= codec_info->ignore_pch_dmic;
+
 			codec_name = get_codec_name(dev, codec_info, adr_link, i);
 			if (!codec_name)
 				return -ENOMEM;
@@ -1630,8 +1633,6 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 	if (!codec_info)
 		return -EINVAL;
 
-	ctx->ignore_pch_dmic |= codec_info->ignore_pch_dmic;
-
 	for_each_pcm_streams(stream) {
 		char *name, *cpu_name;
 		int playback, capture;
-- 
2.40.1

