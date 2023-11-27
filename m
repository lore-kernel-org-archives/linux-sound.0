Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MfLwBUE2"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1874187
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 07:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099329; x=1732635329;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XdNZRgknADXEqHF4IqHONdH1Gkp9aKKF8greIYETTko=;
  b=MfLwBUE2jDrZFrlvipFyS9dHvGUedcrUM5UJZAzvWvQmGNossZNW8lXR
   Cw73AbSJQJ8/OireMAwYBPlZXrJc41gdPPLU7A08KfXREHSy8iEuJI8Ua
   pY8DISufsgJYkwptnGzvhkDZgLWoRopvjTGLmwcHdAMSvsJEwG+HlBNgZ
   KMStq3j7B3f50JRbyfh5AK8ijv/Lzr1fHCMtUb+B+wMTMcap5mUxnQAPY
   aZ1S3ef0TjP2xXTF9OUD9o08f7nZ03S/pg0+Cmk81jXum4vtiDO/muZ4v
   XOY7HM5r/PGmoolOHYiWGGMvkKsrgdE2HDAr1BTqHo+wWJOuU2bDWQRbT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894532"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="372894532"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:27:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956801"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="771956801"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:27:00 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 15/27] ASoC: Intel: sof_ssp_amp: rename function parameter
Date: Mon, 27 Nov 2023 17:26:42 +0200
Message-ID: <20231127152654.28204-16-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Rename the parameter 'ssp_codec' of sof_card_dai_links_create() since
it's the port number of speaker amplifier. No functional change in
this commit.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_ssp_amp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index 8e478d1cc875..c463bc698c10 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -98,7 +98,7 @@ static struct snd_soc_dai_link_component platform_component[] = {
 
 static struct snd_soc_dai_link *
 sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
-			  int ssp_codec, int dmic_be_num, int hdmi_num,
+			  int ssp_amp, int dmic_be_num, int hdmi_num,
 			  bool idisp_codec)
 {
 	struct snd_soc_dai_link_component *cpus;
@@ -156,7 +156,7 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 	if (amp_type != CODEC_NONE) {
 		be_id = fixed_be ? SPK_BE_ID : id;
 		ret = sof_intel_board_set_ssp_amp_link(dev, &links[id], be_id,
-						       amp_type, ssp_codec);
+						       amp_type, ssp_amp);
 		if (ret)
 			return NULL;
 
-- 
2.43.0

