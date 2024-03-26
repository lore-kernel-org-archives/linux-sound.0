Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991E413C91B
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469135; cv=none; b=hbuwEhU0nXsAkZvWWVuXSLZY/FgPpcaY2z0wYEihkLCfBSIBA3ZMnSzevB+IHSfmlrkwp7kzr3IfXg0QikfS69RBjptgPxZyRgxzPvXLNRgxVAy+5I2I2jLm6RGhSLOufdw5ReBhxrOV/WHMTdZ/yPqLFqCz+apTi+NOcYT1L3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469135; c=relaxed/simple;
	bh=fQwkz9pcHM4JWHddRqJbn3Gbw0hCIVSlITvF7FgBPpY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jl8HrrOu2Mrqja8HDsCs22Gbe1iV4EIvVletbQYC4OdoUfNQpvMe1NqmWORmWK5jAPLqKpPo5jHaqWtvG4U1bDTICXhfECLSBNaqYcmb9i/P/5un1/52EwoHqrVa+EmI303NTr0O3BQgGcGOWJGdL81jZ+igo7vTt46VTF0jcLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KwmhZVBD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KwmhZVBD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469133; x=1743005133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fQwkz9pcHM4JWHddRqJbn3Gbw0hCIVSlITvF7FgBPpY=;
  b=KwmhZVBDd7T0DEXz/w82gMcBTl6uVd6wzdjEaehtaI/4M0MSfsDBiHmW
   eM7OqAOL5n3ukw43XnVj+sOtvfrz7vIo2Pb9Xc+qaaIzFGfHnM1hyNovf
   AgMgDrzH9iu9tvop903H/6HPNvASVhiLQ7ktdwquR0pkfbEHJNgaDuydo
   EN1jCjH8o9IeEIK5Mi8i0ArskIesYqUeuuRdqShA+vR33I6MgfFMOmhch
   sPEfxTtrVcOkj4U2TE4rUIMljoBvDRDuy+mCLQZCeMTz9CbIRaEFAVmfh
   FcaxZVmoekGUxLMGl18NRFg5ZR+W8x5Ui0u3HZj/FNLgK6MSyAKF8FjaF
   w==;
X-CSE-ConnectionGUID: fodRgD+7RnG8EbUbkCbDOw==
X-CSE-MsgGUID: rY721kTIT4uwH/yXfh4fVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260436"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260436"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482275"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:53 -0700
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
Subject: [PATCH 16/34] ASoC: Intel: sof_sdw: Remove no longer supported quirk
Date: Tue, 26 Mar 2024 11:04:11 -0500
Message-Id: <20240326160429.13560-17-pierre-louis.bossart@linux.intel.com>
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

The SOF_SDW_NO_AGGREGATION quirk is mostly for debug and no longer works
correctly with the current state of the machine driver. Remove it from
the code and add an error message if someone uses it.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 12 ++++--------
 sound/soc/intel/boards/sof_sdw_common.h |  1 +
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 1253a2dc33d2..fdedc32291f0 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -36,7 +36,7 @@ static void log_quirks(struct device *dev)
 		dev_dbg(dev, "SSP port %ld\n",
 			SOF_SSP_GET_PORT(sof_sdw_quirk));
 	if (sof_sdw_quirk & SOF_SDW_NO_AGGREGATION)
-		dev_dbg(dev, "quirk SOF_SDW_NO_AGGREGATION enabled\n");
+		dev_err(dev, "quirk SOF_SDW_NO_AGGREGATION enabled but no longer supported\n");
 }
 
 static int sof_sdw_quirk_cb(const struct dmi_system_id *id)
@@ -1136,11 +1136,9 @@ static int get_dailink_info(struct device *dev,
 			    int *sdw_be_num, int *codecs_num)
 {
 	bool group_visited[SDW_MAX_GROUPS];
-	bool no_aggregation;
 	int i;
 	int j;
 
-	no_aggregation = sof_sdw_quirk & SOF_SDW_NO_AGGREGATION;
 	*sdw_be_num  = 0;
 
 	if (!adr_link)
@@ -1187,7 +1185,7 @@ static int get_dailink_info(struct device *dev,
 						continue;
 
 					/* count BE for each non-aggregated slave or group */
-					if (!endpoint->aggregated || no_aggregation ||
+					if (!endpoint->aggregated ||
 					    !group_visited[endpoint->group_id])
 						(*sdw_be_num)++;
 				}
@@ -1393,10 +1391,9 @@ static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 			  int *codec_num, unsigned int *group_id,
 			  int adr_index)
 {
-	bool no_aggregation = sof_sdw_quirk & SOF_SDW_NO_AGGREGATION;
 	int i;
 
-	if (!adr_link->adr_d[adr_index].endpoints->aggregated || no_aggregation) {
+	if (!adr_link->adr_d[adr_index].endpoints->aggregated) {
 		cpu_dai_id[0] = ffs(adr_link->mask) - 1;
 		*cpu_dai_num = 1;
 		*codec_num = 1;
@@ -1758,7 +1755,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
 	const struct snd_soc_acpi_link_adr *adr_link = mach_params->links;
-	bool aggregation = !(sof_sdw_quirk & SOF_SDW_NO_AGGREGATION);
 	struct snd_soc_codec_conf *codec_conf;
 	struct sof_sdw_codec_info *codec_info;
 	struct sof_sdw_codec_info *ssp_info;
@@ -1896,7 +1892,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 					be_id = current_be_id;
 			}
 
-			if (aggregation && endpoint->aggregated)
+			if (endpoint->aggregated)
 				group_generated[endpoint->group_id] = true;
 		}
 	}
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 1daf98a5849f..e21ef79126b2 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -50,6 +50,7 @@ enum {
 #define SOF_SDW_PCH_DMIC		BIT(6)
 #define SOF_SSP_PORT(x)		(((x) & GENMASK(5, 0)) << 7)
 #define SOF_SSP_GET_PORT(quirk)	(((quirk) >> 7) & GENMASK(5, 0))
+/* Deprecated and no longer supported by the code */
 #define SOF_SDW_NO_AGGREGATION		BIT(14)
 
 /* BT audio offload: reserve 3 bits for future */
-- 
2.40.1

