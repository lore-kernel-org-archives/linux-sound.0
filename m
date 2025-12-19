Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368641F5820
	for <linux-sound@vger.kernel.org>; Fri, 19 Dec 2025 03:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766116189; cv=none; b=lw3M9Q+6SsG0Ys7k3g26p5ehHYEkrvHTpPs9D3TLD0teygIiD1+rZb+7VLTkU+28zO1hQFGSg+0CtEryDks/vazm02d3nGuFY63Xsh12plcmbIJMcPoIn2/704RXBXMMDCnzZMs4XBvQkQyQ4nRNO6B1Arh95sa4NaxA6w8khf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766116189; c=relaxed/simple;
	bh=N47Rik/lZSeTSIQX4y+BjHQMjXeIrFdxFTVrzv5jPGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=J5sqXwgC/x3x/6yuBJutG5lpk2bK1dBJGR3949hVnYP8HQxXIonsaiq5UCiA6C9/o8+odNpXAZldxE3h582O/GAKd/6z2CKciqbBn7N09DoB+2pN5L+/q0zIe03zMC9g4FheVH1DlvuXfmO68RmObOKGn/KfG15/BKk+qNH1VG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MlwdXIAf; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MlwdXIAf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766116187; x=1797652187;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N47Rik/lZSeTSIQX4y+BjHQMjXeIrFdxFTVrzv5jPGE=;
  b=MlwdXIAfgi3ITvOv7RL40icihiQGY/z4y6Daj6je8H3LKAvIH0RnOTov
   M/X6wVXxtwfVUpHAy4eY9PRabFXp6pZ9WrUKEfmhj9PxvkMkl0dA13VAu
   wXoeVNNMncP16Njp5oFtu434piireASY7GqNRTziEGLnQQ8T5wQfDG433
   BHdZ5am95jTWH3nxAZzSaRfz7u4gWQEVUcFU6EXQ8jIO2fR+IoylLGmZc
   AqnBdIzTJNg5EToSK23TyZDMp5QvFBUJPYNc4XP8fcJIowcVu3mzwUe73
   l8Kt2m9q9q2IOvgoapA0R0J+vWtvM3C2jV25740Et5DK0b+i++0JD9fg6
   A==;
X-CSE-ConnectionGUID: IIXp28ERRJKSfu8wK8ZEww==
X-CSE-MsgGUID: lEmhsDVsStW1IulwNciAZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68118636"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="68118636"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 19:49:47 -0800
X-CSE-ConnectionGUID: JTWUSDDIRaGLv2IiKv3+1A==
X-CSE-MsgGUID: JPx2Y0UaTFefu0GcoPcyiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="198518311"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 19:49:45 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH] ASoC: SOF: Intel: add -bt tplg suffix if BT is present
Date: Fri, 19 Dec 2025 11:49:37 +0800
Message-ID: <20251219034937.3630569-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We need to distinguish the topologies with and without BT PCM.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 72c98154c027..d88ec66728fd 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1549,6 +1549,7 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 	 * name string if quirk flag is set.
 	 */
 	if (mach) {
+		const struct sof_intel_dsp_desc *chip = get_chip_info(sdev->pdata);
 		bool tplg_fixup = false;
 		bool dmic_fixup = false;
 
@@ -1598,6 +1599,18 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 			sof_pdata->tplg_filename = tplg_filename;
 		}
 
+		if (tplg_fixup && mach->mach_params.bt_link_mask &&
+		    chip->hw_ip_version >= SOF_INTEL_ACE_4_0) {
+			int bt_port = fls(mach->mach_params.bt_link_mask) - 1;
+
+			tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL, "%s-ssp%d-bt",
+						       sof_pdata->tplg_filename, bt_port);
+			if (!tplg_filename)
+				return NULL;
+
+			sof_pdata->tplg_filename = tplg_filename;
+		}
+
 		if (mach->link_mask) {
 			mach->mach_params.links = mach->links;
 			mach->mach_params.link_mask = mach->link_mask;
@@ -1609,7 +1622,6 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 		if (tplg_fixup &&
 		    mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER &&
 		    mach->mach_params.i2s_link_mask) {
-			const struct sof_intel_dsp_desc *chip = get_chip_info(sdev->pdata);
 			int ssp_num;
 
 			if (hweight_long(mach->mach_params.i2s_link_mask) > 1 &&
-- 
2.43.0

