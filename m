Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DDF26157A
	for <linux-sound@vger.kernel.org>; Tue, 25 Feb 2025 09:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740476250; cv=none; b=Coo00fqyiA9UqRVqCDNJYrqtBE8j7YhggcdtF75P+56GcnfGdp0wyYNBS0uatjjn1kqEUQb4BSEA0NRFR38XU0ZkH2flPMVxnmfaGxdp8jyhSMkDrrK+xCnAFQIXNdNdGfQGkYP2m7/LYVk+RBGOS1OQlrNoHKvusaS6hsMASBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740476250; c=relaxed/simple;
	bh=IU/28gRu7ULFTb29n7jsSlp804AvwidCQ2d7Z+/4vSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lf2qMRg5GXTJ6rvRuw0XgzJJjqjX3IAcYRunzzVkuY5dhtvligmKzPyr+HQLYNnRIwDeHYKHP8Da+2M6dgeXjN6AUu4pliKf+ImXafhgFPbF6/1X9zLNm6dVMOYJoEQTX1wNpr+rnQGZCdgxw9QKF/xE1aLr09ZeSUi2v1DOCAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SD1lH1Ai; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SD1lH1Ai"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740476248; x=1772012248;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IU/28gRu7ULFTb29n7jsSlp804AvwidCQ2d7Z+/4vSA=;
  b=SD1lH1Ais051Qk01025p45ua3/3C9ajeFoaj40CTzxV61FUeICH1hRMq
   6R7/hyZ5V5qSmw22vJIw5ACmA6wSDPuRRQFmW5q50VFDDRtuRAMvagDSe
   uRLHA+nr/vJbBSJvh2WWo710IL/ExvhPnW7kYr1dpJcT5nkkPE+XrGjxN
   US3mrdtJ0uJp+3r1ZHt3KH0fyOut5eZ5lU3iJvvLstrVhwZXy9xnSc6Vs
   a7h8W6D05y767UHQr4VEYxkHVYOl36lMOpELhI1T8Mo/w7Ntey9WIoRJo
   PBIXGXLSWQCT6X0PbsD4bwIBzfs3pxZzCqDzRIK1vW1iMzTHdYHpMixGe
   A==;
X-CSE-ConnectionGUID: aRxJFwziTLm6JCI6CDA6ag==
X-CSE-MsgGUID: AdQerYKYT5O0zv7yF3l3Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40458597"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="40458597"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 01:37:28 -0800
X-CSE-ConnectionGUID: xtCEwJ31S86jMC3adoDCig==
X-CSE-MsgGUID: tW/ZQo8hQ8SKgGjJdk5fFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120439341"
Received: from tfalcon-desk.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.91])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 01:37:27 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 2/2] ASoC: Intel: sof_sdw: warn both sdw and pch dmic are used
Date: Tue, 25 Feb 2025 17:37:16 +0800
Message-ID: <20250225093716.67240-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225093716.67240-1-yung-chuan.liao@linux.intel.com>
References: <20250225093716.67240-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Typically, SoundWire MIC and PCH DMIC will not coexist. However, we may
want to use both of them in some special cases. Add a warning to let
users know that SoundWire MIC and PCH DMIC are both present and they
could overwrite it with kernel params.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 203b07d4d833..c13064c77726 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -803,7 +803,9 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			      int *be_id, struct snd_soc_codec_conf **codec_conf)
 {
 	struct device *dev = card->dev;
+	struct snd_soc_acpi_mach *mach = dev_get_platdata(card->dev);
 	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
 	struct intel_mc_ctx *intel_ctx = (struct intel_mc_ctx *)ctx->private;
 	struct asoc_sdw_endpoint *sof_end;
 	int stream;
@@ -900,6 +902,11 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 
 			codecs[j].name = sof_end->codec_name;
 			codecs[j].dai_name = sof_end->dai_info->dai_name;
+			if (sof_end->dai_info->dai_type == SOC_SDW_DAI_TYPE_MIC &&
+			    mach_params->dmic_num > 0) {
+				dev_warn(dev,
+					 "Both SDW DMIC and PCH DMIC are present, if incorrect, please set kernel params snd_sof_intel_hda_generic dmic_num=0 to disable PCH DMIC\n");
+			}
 			j++;
 		}
 
-- 
2.43.0

