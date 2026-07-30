Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBF738E8D3
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 12:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785415870; cv=none; b=RfeE34Fzdh98MYz5oomnikO1KecSbrRJfQBiYHoIynkKjnw9GyyxUJDKEZD/0JQLMh6bhuG1wrqSaKwq/rAV34RhonXT963V+/4I3b2M0ADEVINRM+Ofzimh9SwvOHdnWihsLX1ahDO7NQC05ffYWhJVJYDOgCImIgAzLLPYzMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785415870; c=relaxed/simple;
	bh=lzDp03vy+x4Ks26BKFjjaiEkgYHfZaNDImeK74jLmRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q7ouxlyKWRvvSNrpqf+NOnmz4SEzjIBPDuVCX9W8RmUesH4pVERo8KWxd+qoRca6P64kCdkOLO7a1OtsGlPaAJCr2RzkMEU4CTfT8ZAmSt4Tut5ah0rul+FzFIr/r+iPsp1rcOUwl5u34qZFHsparjjPSb6/3QNdk176mQiXo9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H+e194MN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H+e194MN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785415863; x=1816951863;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lzDp03vy+x4Ks26BKFjjaiEkgYHfZaNDImeK74jLmRA=;
  b=H+e194MN6fYM4lc/ebaMu6fOYTjkHR75isZ/4a+4CKzFxdgNrVvI5fuH
   Q1KNXz16iWReH5mK2w6fj6B/msDV/t30Fnu0JQM4YlEiXPQJpG2978Xzt
   Yx4VvjFx3DwlVHeabZybIZusICgfbdny6qLD2IeYP3CYpUZxiQtph5Dia
   Lj0Vwbv1V6sy8bBN9cEuZ3SK08cm3R4pPIh4OBwrWhYKSlJRlvqrd3Aok
   ML+KjPqqr+X6tF0sFBIrk93avTXNS2DMSFpYWreHu52pBZs46tHlCJuDq
   w4/Gz+C37fcJG9FyAWgPK+aez9hgkzDEDMzcvPZ8Ma6qngBNOdvIUAWy3
   A==;
X-CSE-ConnectionGUID: Vl5JISMYQPKNN3Ygv8AcOA==
X-CSE-MsgGUID: R+Wn5oPFSPi+XPcb+XsFEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103439269"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="103439269"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:51:01 -0700
X-CSE-ConnectionGUID: HdtFCLvKRZuuY54BWBJi0g==
X-CSE-MsgGUID: GUD0+8+mSCK88aG8AEZd3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="283638682"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.79])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:50:58 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 2/4] ASoC: SOF: Intel: hda: Keep non-alt mlinks powered at probe on ACE2+
Date: Thu, 30 Jul 2026 15:51:28 +0300
Message-ID: <20260730125130.29887-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730125130.29887-1-peter.ujfalusi@linux.intel.com>
References: <20260730125130.29887-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the hda_bus_ml_put_all() call at the end of hda_init_caps().

On multi-link (mlink) capable platforms the non-alternate links
(HDaudio and iDisp) are powered on by hardware when CRST# is
de-asserted (LCTL.SPA = 1) and their ref_count is pre-charged to 1 in
hda_ml_alloc_h2link() to match this state. The put_all call
immediately dropped that reference and toggled LCTL.SPA back to 0,
relying on the first stream open to power the link up again.

On ACE2+ platforms this redundant SPA 1->0->1 toggle at probe leaves
the Processing Pipe Capability (PPLC) Linear Link Position counters in
a state where they do not advance on the first stream after boot. The
counters only start working after the first full runtime suspend/resume
cycle, which includes a CRST# assert/deassert that fully resets the PPC
AON block.

Keep the non-alt links powered from CRST# de-assert through first use.
System suspend still powers them down via hda_bus_ml_suspend(), and
resume relies on CRST# de-assert to bring them back up, so no other
path is affected.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/intel/hda.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 26db0e46b827..77c7d2bc6fa2 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -668,8 +668,6 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	if (!HDA_IDISP_CODEC(bus->codec_mask))
 		hda_codec_i915_display_power(sdev, false);
 
-	hda_bus_ml_put_all(bus);
-
 	return 0;
 }
 
-- 
2.55.0

