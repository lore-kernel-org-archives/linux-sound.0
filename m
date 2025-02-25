Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB3D263C6A
	for <linux-sound@vger.kernel.org>; Tue, 25 Feb 2025 09:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740476249; cv=none; b=q25+REtb7mfNMx5c9RVTvW6O8M7ywRIumIk4BMjYnNI+xXsxjB91vERYRslqIUjNv5db9jMn/fhMcys76Co5kuklhSKzCUB5tun0OE6tx7Fr05GhIhZWFD2RARjdorzFSX8CEno9d+U8oRyTPFRJB0SpA3CQz4Etwn80FOUkQbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740476249; c=relaxed/simple;
	bh=rlSHFBV3fiPFgpmxPOG3nt87Eu9Y4e1F/BbcgI9O6jM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gbSiRZW9j/4AXS7/kUnfwebso+1EO1YMzHCZUgghe3APMmZ3oW5VF0C9VvQHU41p22KqvNpmQ1vHlka0yFq1z29MrBCLnB7lHkmihSOxYpkbH08DwcaPiu4oTBIST23Qo7gvJ3upiNnl4ZSnBOoJRANyAozVHrzaJfFnW/LNvwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4HF/QzS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4HF/QzS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740476247; x=1772012247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rlSHFBV3fiPFgpmxPOG3nt87Eu9Y4e1F/BbcgI9O6jM=;
  b=S4HF/QzSBM+RESd9CAniN/Xmr5oq5O2gF3hmUIt8iy2tC0HIIzOIuBhI
   6/enELHDoyz02mR51sf6LJXnk7mVREnN2NJKPUrtWjXf07fvj/2soNncP
   h7LaUc0jLt60mJq59Xpt+OmMXxo0edZcOykr2G6yRl1Eug1pjY98i4KYn
   R4H2G209CTOArV4OWDg7kvJ97rjwHh9Hi7BBO+FY2fognc8mbctm6B/jV
   f+uukS5xovy1DwX9ta7jlnBSUYsDufEt7smG4ALWfMwZtlM/QQnJVoKTt
   jY7YwNlzluu89VEyySWbziI8JECIjbBlqWjgByptDMa8JV9tL8rUmL2+0
   g==;
X-CSE-ConnectionGUID: lTokejStQzaG1cHttRH12g==
X-CSE-MsgGUID: xiW0WkdeQNmOcjVl0GVtVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40458593"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="40458593"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 01:37:27 -0800
X-CSE-ConnectionGUID: xgF9K11RTC+kC60wmzBFFA==
X-CSE-MsgGUID: PP9uWse5ReWuQPmwoLUYEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120439334"
Received: from tfalcon-desk.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.91])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 01:37:25 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 1/2] ASoC: SOF: Intel: don't check number of sdw links when set dmic_fixup
Date: Tue, 25 Feb 2025 17:37:15 +0800
Message-ID: <20250225093716.67240-2-yung-chuan.liao@linux.intel.com>
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

Currently, we assume that the PCH DMIC pins are pin-muxed with SoundWire
links. However, we do see a HW design that use PCH DMIC along with 3
SoundWire links. Remove the check now.
With this change the PCM DMIC will be presented if it is reported by the
BIOS irrespective of whether there are SDW links present or not.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index be689f6e10c8..a1ccd95da8bb 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1312,22 +1312,8 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 		/* report to machine driver if any DMICs are found */
 		mach->mach_params.dmic_num = check_dmic_num(sdev);
 
-		if (sdw_mach_found) {
-			/*
-			 * DMICs use up to 4 pins and are typically pin-muxed with SoundWire
-			 * link 2 and 3, or link 1 and 2, thus we only try to enable dmics
-			 * if all conditions are true:
-			 * a) 2 or fewer links are used by SoundWire
-			 * b) the NHLT table reports the presence of microphones
-			 */
-			if (hweight_long(mach->link_mask) <= 2)
-				dmic_fixup = true;
-			else
-				mach->mach_params.dmic_num = 0;
-		} else {
-			if (mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER)
-				dmic_fixup = true;
-		}
+		if (sdw_mach_found || mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER)
+			dmic_fixup = true;
 
 		if (tplg_fixup &&
 		    dmic_fixup &&
-- 
2.43.0

