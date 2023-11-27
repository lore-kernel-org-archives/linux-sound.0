Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LaZXjMd5"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CEBE18E
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 07:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099317; x=1732635317;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ii0m9U9eGLM0JaSj4MdRpS4P7gneGNSwH3Z6Pu6Mn84=;
  b=LaZXjMd5tZ2CCZFhZmRHT1VbgAg3KjBW6crwOK438j1NDQjzQGiIh6EV
   B/lGkx+L2VIu/wrxlYq+NoJWiijB0bM2RpVZikDrpap4mbkhm43XfaZ6o
   GpoelMLmbOfa6dFVcPRsykAR6W3sd8Ly6EcMxhIlMz2V40OeCyTBV/Paz
   49Yy68BetYe7cXwfdA/Zq1a4QT65kT1D5LDnegEYCTXxPMgaUeZP9i+fo
   ZdcECmeE3EvE9uuLF39ge0yKBrqJekdjTvevt/BIpxmDrWv6A4Iy4CDi3
   jsOOhH6edfzYS97wi6Q903HszXbA16JHsdAtbSqI0XQJCgJkJLnxi0/jn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894366"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="372894366"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956165"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="771956165"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:22 -0800
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
Subject: [PATCH 01/27] ASoC: Intel: sof_ssp_amp: remove dead code
Date: Mon, 27 Nov 2023 17:26:28 +0200
Message-ID: <20231127152654.28204-2-peter.ujfalusi@linux.intel.com>
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

This patch fixes a dead code problem when calculating BE ID for each
HDMI-In link.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Balamurugan C <balamurugan.c@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_ssp_amp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index 137ba64254bc..22f37cf3a2ad 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -124,6 +124,7 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 		/* the topology supports HDMI-IN uses fixed BE ID for DAI links */
 		fixed_be = true;
 
+		be_id = HDMI_IN_BE_ID;
 		for (i = 1; i <= num_of_hdmi_ssp; i++) {
 			int port = (i == 1 ? (sof_ssp_amp_quirk & SOF_HDMI_CAPTURE_1_SSP_MASK) >>
 						SOF_HDMI_CAPTURE_1_SSP_SHIFT :
@@ -138,7 +139,7 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 			links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-HDMI", port);
 			if (!links[id].name)
 				return NULL;
-			links[id].id = fixed_be ? (HDMI_IN_BE_ID + i - 1) : id;
+			links[id].id = be_id;
 			links[id].codecs = &snd_soc_dummy_dlc;
 			links[id].num_codecs = 1;
 			links[id].platforms = platform_component;
@@ -147,6 +148,7 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 			links[id].no_pcm = 1;
 			links[id].num_cpus = 1;
 			id++;
+			be_id++;
 		}
 	}
 
-- 
2.43.0

