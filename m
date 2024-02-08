Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A221A81ABB
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 16:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707411372; cv=none; b=H8X67oh167Nk54F3pI3QtcqgJ3DcFLLcypqm+K6cTHlg7HVP0fuOHK8w1mEJIwMRWPkdinz7vgYLlKNiJbxCVvlzOpqB+0d7/Q7xU2sbeQ5YvF4asF/4DVRSked6F4cvDRJKFEbOPdETJTlqoSHXQTPlQX2kW/ng+jPogHQxV9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707411372; c=relaxed/simple;
	bh=dv1QKYSjp5u7NiTRb5oRIKW0CUksjklA3x5VLpf1kng=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JaP9HDcJRjIJktkQwZvMTPHL8LcLJd8WqRGkrM9A3J+H9nE8kRzd+726BmO/f70anbvKXV3DVG7VI1ocU9xNK7A/X6GlKk2b7kafXEQw4WzcI50oauFFHgxs/W/qEFF6nVTSUk2bBTGxNo5dQBmvn6skeuWcgJ2h1AGsIvlkuBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQ/ry4ie; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQ/ry4ie"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411370; x=1738947370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dv1QKYSjp5u7NiTRb5oRIKW0CUksjklA3x5VLpf1kng=;
  b=XQ/ry4ieVaZHLzX31+rL40phngmAARrCeX5RiRW3O8bzvqqi/BK2H472
   OgTOCpJRMQSSMzjf4q3AE3bk8uMakpuC3LttdPpXJ9P/dYV3xfHVqWyiA
   34dg73RLsH3ZG/DY9xkEIm4UiirIOGHOgrvEX4aJYupSASSREGRq+Ufil
   CwdsMb/KOCbgqNYRAWWpG6GLgsnfgU1uphmfnRvWrrG/of45aobyw5P1N
   j36cwAgmpfcWi2I9y4Mf3PQwT6ELxTFZLHQRba36EWVJ+6BzztBj0vF/E
   mf0VqskSgrvOpdahmagQmVSSWmVZXpyUZd2MdupEEWz5vVPBIkSKQ14+i
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675451"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="395675451"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:56:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1690288"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain) ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:56:07 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Chao Song <chao.song@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 24/24] ASoC: Intel: sof_sdw: starts non sdw BE id with the highest sdw BE id
Date: Thu,  8 Feb 2024 10:55:45 -0600
Message-Id: <20240208165545.93811-25-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The soundwire links do not have their IDs as consecutive numbers, thus
the last link might have lower be_id than the previous one and this
leads to id collision with non SDW links.

For example,
create dai link SDW0-Playback-SimpleJack, id 0
create dai link SDW0-Capture-SmartMic, id 4
create dai link SDW0-Capture-SimpleJack, id 1
create dai link SDW2-Playback-SmartAmp, id 2
create dai link SDW2-Capture-SmartAmp, id 3
create dai link iDisp1, id 4
create dai link iDisp2, id 5
create dai link iDisp3, id 6

Reviewed-by: Chao Song <chao.song@linux.intel.com>
Co-developed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index e4b9f4d1ec06..08f330ed5c2e 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1767,15 +1767,21 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 				return codec_index;
 
 			for (j = 0; j < codec_info_list[codec_index].dai_num ; j++) {
+				int current_be_id;
+
 				ret = create_sdw_dailink(card, &link_index, dai_links,
 							 sdw_be_num, adr_link,
 							 codec_conf, codec_conf_num,
-							 &be_id, &codec_conf_index,
+							 &current_be_id, &codec_conf_index,
 							 &ignore_pch_dmic, append_dai_type, i, j);
 				if (ret < 0) {
 					dev_err(dev, "failed to create dai link %d\n", link_index);
 					return ret;
 				}
+
+				/* Update the be_id to match the highest ID used for SDW link */
+				if (be_id < current_be_id)
+					be_id = current_be_id;
 			}
 
 			if (aggregation && endpoint->aggregated)
-- 
2.40.1

