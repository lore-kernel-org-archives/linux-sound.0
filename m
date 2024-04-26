Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533A914901F
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145956; cv=none; b=dO6fZUZLj6Ue4tq+Lq4Oqa5wqkJdkFTSGf21u0RiJjBCUWFhAIWr9Tjfcb5gRfI6fARH4qIO0oLVkhDRwE6KPrZushEBx1Wa6Bo6lrpEbzm4kWJ/7F1DInajG0jjjUPjlw3F+P8lbEn+Q34xYlKZOya3zQWRRfrImeqOEb7/ikc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145956; c=relaxed/simple;
	bh=v4RrR4ZevIdejO++X3NJ7yMsgRZ5oysDLZ7RLMPgM4U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L4fL3TaVmxoLUnf4JVF7pRJkhHr6V1/V3/I5gI9tyCKm4mMZb7LQERKC08maLz2WxDCL7TH2xbIFPgOzEO1u6tKjPlQ95pUxfswclSKVv7FA37HfwfeNFwoe6CvERuMCdTaDBq11SKehK83l6gVcKZ/k+xBivUUGQQe5WB3GD18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gYytR8/l; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYytR8/l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145955; x=1745681955;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v4RrR4ZevIdejO++X3NJ7yMsgRZ5oysDLZ7RLMPgM4U=;
  b=gYytR8/lxT83WIugkuuT31osTsUi2sxadKoOOuuDskLq4j3YdqR+SbZy
   qD3bVEq+2uzr36hQH00PuD4XQCxxH4mq3TLHpiWiF58vUkjac8gtRSl2V
   BzbKoIaqy9Qlev4fjy8mLf2Q144czXG5rRt4C4lgXAw/9ZXF5dVlp16zD
   gR1gAlmiWtntPDS+uxE7zjSCv358e2x0cHtTFLLVJ2Ibft1IkMIcMk9Kg
   A0CzgpJ5ouW+r5hBGUN3eDQ1BnSLZdsJPfYMYbVLs+c1gnH8Aw7G1v95y
   3Z1z0QFyf+uj6tQgShoSrCkl7gM7xV8b7Z/kdEuvtceRopMYw/6VvDoYv
   w==;
X-CSE-ConnectionGUID: coFvGpaOShWYW4RF9/Ir7g==
X-CSE-MsgGUID: CZoc5cvqQKGc0fmWQzVAaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9718441"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="9718441"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:39:11 -0700
X-CSE-ConnectionGUID: dArphcUpTHu0MWM01xvL6g==
X-CSE-MsgGUID: rKXOU+QqQPGxrrRIVFB3kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="56623541"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:39:11 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 3/5] ASoC: SOF: Intel: hda: simplify and reduce indentation for hda_sdw_machine_select()
Date: Fri, 26 Apr 2024 10:39:00 -0500
Message-Id: <20240426153902.39560-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426153902.39560-1-pierre-louis.bossart@linux.intel.com>
References: <20240426153902.39560-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify code to return when no links are enabled. No functional
change, just code cleanup before updates.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 139 +++++++++++++++++++-------------------
 1 file changed, 71 insertions(+), 68 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 4d0fe706ebc1..8ddc1b0ca3c9 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1653,92 +1653,95 @@ static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev
 	hdev = pdata->hw_pdata;
 	link_mask = hdev->info.link_mask;
 
+	if (!link_mask) {
+		dev_info(sdev->dev, "SoundWire links not enabled\n");
+		return NULL;
+	}
+
 	/*
 	 * Select SoundWire machine driver if needed using the
 	 * alternate tables. This case deals with SoundWire-only
 	 * machines, for mixed cases with I2C/I2S the detection relies
 	 * on the HID list.
 	 */
-	if (link_mask) {
-		for (mach = pdata->desc->alt_machines;
-		     mach && mach->link_mask; mach++) {
-			/*
-			 * On some platforms such as Up Extreme all links
-			 * are enabled but only one link can be used by
-			 * external codec. Instead of exact match of two masks,
-			 * first check whether link_mask of mach is subset of
-			 * link_mask supported by hw and then go on searching
-			 * link_adr
-			 */
-			if (~link_mask & mach->link_mask)
-				continue;
+	for (mach = pdata->desc->alt_machines;
+	     mach && mach->link_mask; mach++) {
+		/*
+		 * On some platforms such as Up Extreme all links
+		 * are enabled but only one link can be used by
+		 * external codec. Instead of exact match of two masks,
+		 * first check whether link_mask of mach is subset of
+		 * link_mask supported by hw and then go on searching
+		 * link_adr
+		 */
+		if (~link_mask & mach->link_mask)
+			continue;
 
-			/* No need to match adr if there is no links defined */
-			if (!mach->links)
-				break;
+		/* No need to match adr if there is no links defined */
+		if (!mach->links)
+			break;
 
-			link = mach->links;
-			for (i = 0; i < hdev->info.count && link->num_adr;
-			     i++, link++) {
-				/*
-				 * Try next machine if any expected Slaves
-				 * are not found on this link.
-				 */
-				if (!snd_soc_acpi_sdw_link_slaves_found(sdev->dev, link,
-									hdev->sdw->ids,
-									hdev->sdw->num_slaves))
-					break;
-			}
-			/* Found if all Slaves are checked */
-			if (i == hdev->info.count || !link->num_adr)
+		link = mach->links;
+		for (i = 0; i < hdev->info.count && link->num_adr;
+		     i++, link++) {
+			/*
+			 * Try next machine if any expected Slaves
+			 * are not found on this link.
+			 */
+			if (!snd_soc_acpi_sdw_link_slaves_found(sdev->dev, link,
+								hdev->sdw->ids,
+								hdev->sdw->num_slaves))
 				break;
 		}
-		if (mach && mach->link_mask) {
-			int dmic_num = 0;
-			bool tplg_fixup;
-			const char *tplg_filename;
-
-			mach->mach_params.links = mach->links;
-			mach->mach_params.link_mask = mach->link_mask;
-			mach->mach_params.platform = dev_name(sdev->dev);
-
-			if (pdata->tplg_filename) {
-				tplg_fixup = false;
-			} else {
-				tplg_fixup = true;
-				tplg_filename = mach->sof_tplg_filename;
-			}
+		/* Found if all Slaves are checked */
+		if (i == hdev->info.count || !link->num_adr)
+			break;
+	}
+	if (mach && mach->link_mask) {
+		int dmic_num = 0;
+		bool tplg_fixup;
+		const char *tplg_filename;
 
-			/*
-			 * DMICs use up to 4 pins and are typically pin-muxed with SoundWire
-			 * link 2 and 3, or link 1 and 2, thus we only try to enable dmics
-			 * if all conditions are true:
-			 * a) 2 or fewer links are used by SoundWire
-			 * b) the NHLT table reports the presence of microphones
-			 */
-			if (hweight_long(mach->link_mask) <= 2) {
-				int ret;
+		mach->mach_params.links = mach->links;
+		mach->mach_params.link_mask = mach->link_mask;
+		mach->mach_params.platform = dev_name(sdev->dev);
 
-				ret = dmic_detect_topology_fixup(sdev, &tplg_filename, "",
-								 &dmic_num, tplg_fixup);
-				if (ret < 0)
-					return NULL;
-			}
-			if (tplg_fixup)
-				pdata->tplg_filename = tplg_filename;
-			mach->mach_params.dmic_num = dmic_num;
+		if (pdata->tplg_filename) {
+			tplg_fixup = false;
+		} else {
+			tplg_fixup = true;
+			tplg_filename = mach->sof_tplg_filename;
+		}
 
-			dev_dbg(sdev->dev,
-				"SoundWire machine driver %s topology %s\n",
-				mach->drv_name,
-				pdata->tplg_filename);
+		/*
+		 * DMICs use up to 4 pins and are typically pin-muxed with SoundWire
+		 * link 2 and 3, or link 1 and 2, thus we only try to enable dmics
+		 * if all conditions are true:
+		 * a) 2 or fewer links are used by SoundWire
+		 * b) the NHLT table reports the presence of microphones
+		 */
+		if (hweight_long(mach->link_mask) <= 2) {
+			int ret;
 
-			return mach;
+			ret = dmic_detect_topology_fixup(sdev, &tplg_filename, "",
+							 &dmic_num, tplg_fixup);
+			if (ret < 0)
+				return NULL;
 		}
+		if (tplg_fixup)
+			pdata->tplg_filename = tplg_filename;
+		mach->mach_params.dmic_num = dmic_num;
+
+		dev_dbg(sdev->dev,
+			"SoundWire machine driver %s topology %s\n",
+			mach->drv_name,
+			pdata->tplg_filename);
 
-		dev_info(sdev->dev, "No SoundWire machine driver found\n");
+		return mach;
 	}
 
+	dev_info(sdev->dev, "No SoundWire machine driver found\n");
+
 	return NULL;
 }
 #else
-- 
2.40.1

