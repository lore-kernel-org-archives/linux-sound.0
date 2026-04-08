Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66C03C3C03;
	Wed,  8 Apr 2026 12:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775650476; cv=none; b=YslHaxD+uxAlvBR3TNoY9vGaVeVWP8yY3oBnXxZxDbDHJz9RnnQ0FRxdrggzohxAslZ9pMjYi5b/ya9azo+CdflPbfqFmX0UhU83T4g36FVW+t/1zdqzpp3tgTUa+81/b3J/7uR3wV4BRBwa+TMlLhHuK/I95ATeHDvqQytDbY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775650476; c=relaxed/simple;
	bh=6MC4dLVJ8e1kN/O9XuBTQMyRuBy1R9RaTUeIpyQBFNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r9/cUyVcWWezzhnrnPKKgSeCmFFthAnDKuNHWKzgMah5bCe/p413aDJBnCB7Nm5ol1t5NjlwYW3+vxFNnjucQJI6oNUCEFsi/4xPuZ/xGWEcBzIUbguOmN8M6HdhCq/j6b02gPqhTeLqiwcomJjWSskydVlAoI2rHurfi3BTess=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+pgaV6N; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+pgaV6N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775650474; x=1807186474;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6MC4dLVJ8e1kN/O9XuBTQMyRuBy1R9RaTUeIpyQBFNk=;
  b=D+pgaV6NUsFFxStNmQkLwraeTx7LQRj30uAWFDuR2liwNmCoemZD+CnJ
   m3x3/sjBsmC6ims7QF6nMY5rW/pwjN518x/KhvRv+ZLVkeG589d5/C93c
   89Ech8YQoTBKzn4rZHuwJcET89qH7p2W3QpwgPhR8xOpWufGp8g2So6pG
   vG+xbh73eYgF2mKavEPbkbR2/VMMH2/4NKGaO2ahBvTEuqmJBD4A8SE4D
   FRMuYAJO/WDF3Pe90RRvY3LfDjryNFdCq21mlej2XG/r/MY9tc9W9f9OU
   fqkkBc34C56hk2X8GXV8nDfCk7iaS0pTFwrqgNTp6XpFTcGVJa+kR2/ei
   g==;
X-CSE-ConnectionGUID: PeX+30GpRiCrv4sKpw7kwg==
X-CSE-MsgGUID: O1ziv/RCQJa8ms0+x8Rgig==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="80225531"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="80225531"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 05:14:33 -0700
X-CSE-ConnectionGUID: 8RZNXskCRKKigANxc9SeDg==
X-CSE-MsgGUID: iwyV/RRjSUW6+zVIETi9ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="233405326"
Received: from rvuia-mobl.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.250])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 05:14:31 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	stable@vger.kernel.org,
	liam.r.girdwood@intel.com
Subject: [PATCH for 7.0 v2 1/2] ALSA: hda/intel: enforce stricter period-size alignment for Intel NVL
Date: Wed,  8 Apr 2026 15:14:47 +0300
Message-ID: <20260408121448.31130-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260408121448.31130-1-peter.ujfalusi@linux.intel.com>
References: <20260408121448.31130-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Intel ACE4 based products set more strict constraints on HDA BDLE start
address and length alignment. Modify capability flags to drop
AZX_DCAPS_NO_ALIGN_BUFSIZE for Intel Nova Lake platforms.

Fixes: 7f428282fde3 ("ALSA: hda: controllers: intel: add support for Nova Lake")
Cc: stable@vger.kernel.org
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/hda/controllers/intel.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 1b22dbf7a719..257c498c3260 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -295,6 +295,9 @@ enum {
 #define AZX_DCAPS_INTEL_LNL \
 	(AZX_DCAPS_INTEL_SKYLAKE | AZX_DCAPS_PIO_COMMANDS)
 
+#define AZX_DCAPS_INTEL_NVL \
+	(AZX_DCAPS_INTEL_LNL & ~AZX_DCAPS_NO_ALIGN_BUFSIZE)
+
 /* quirks for ATI SB / AMD Hudson */
 #define AZX_DCAPS_PRESET_ATI_SB \
 	(AZX_DCAPS_NO_TCSEL | AZX_DCAPS_POSFIX_LPIB |\
@@ -2552,8 +2555,8 @@ static const struct pci_device_id azx_ids[] = {
 	/* Wildcat Lake */
 	{ PCI_DEVICE_DATA(INTEL, HDA_WCL, AZX_DRIVER_SKL | AZX_DCAPS_INTEL_LNL) },
 	/* Nova Lake */
-	{ PCI_DEVICE_DATA(INTEL, HDA_NVL, AZX_DRIVER_SKL | AZX_DCAPS_INTEL_LNL) },
-	{ PCI_DEVICE_DATA(INTEL, HDA_NVL_S, AZX_DRIVER_SKL | AZX_DCAPS_INTEL_LNL) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_NVL, AZX_DRIVER_SKL | AZX_DCAPS_INTEL_NVL) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_NVL_S, AZX_DRIVER_SKL | AZX_DCAPS_INTEL_NVL) },
 	/* Apollolake (Broxton-P) */
 	{ PCI_DEVICE_DATA(INTEL, HDA_APL, AZX_DRIVER_SKL | AZX_DCAPS_INTEL_BROXTON) },
 	/* Gemini-Lake */
-- 
2.53.0

