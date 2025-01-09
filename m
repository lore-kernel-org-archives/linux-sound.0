Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F16216E05
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 12:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736424507; cv=none; b=ZLnnooSms1KAfvb5xaT5cAK0MFsnU8D99BjJ1TtUfPDmjmSiETvAP5p7xxZJ+Q++x2Ma5S44AxX9L8fOhtJLWXsNEE2xuRmWFJYC/sxqka08w6k67AWxSkO/EPxMyDBW7ZeuiQzaAjzAXamOqpoU0VPT4VJEfQyEqKbAnNwKAK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736424507; c=relaxed/simple;
	bh=A6UY/B0aGXy1N+UkDGV7z9BiloQ2PEZZqOjCfse7PuA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MarJBYTP83LUp6x+hRQQV/7eXBXkdYHXzAr0sE3A4oH5rGraWHNgOg1xkL6CBfChUkdAuCmKEv7fJRz80r8jKEPv7J+qJgyaiVf8G+jcPacWwREHWJZcW+35UkWRJO2Mzq2vrhSQzBXEyEAE/Z9teBzRs9bF6hXg5z67wsV5nhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N+u1SPXN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N+u1SPXN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736424506; x=1767960506;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A6UY/B0aGXy1N+UkDGV7z9BiloQ2PEZZqOjCfse7PuA=;
  b=N+u1SPXNAIuXn1GNMSy4kghGswlEWmeALHwKnncmfKD1haAWDabtFO8/
   /FBk6VvLtfspWYLZzVxDQF8VqKKsYNVpuVifAcCWPYJ3MaktlNSLAk3+0
   S1FZin8a9enLy8K0Lkb4zjRn1mU3Y6WYVKLZix/PLkQSTQddhJiGF1cWJ
   chd6Cg/ZiAnU9Aa4/p8JJ6e1EOBTFbod33OJIdzDv5gI5vUv9XrZ08Gl4
   8vDWwvpcoUjDGNboaeS9+6Qd6uxnTF9sq+I3pXPjvu5Jw/l1Ud5XIwCGF
   +hBtDuG9aM+wu69vOj1ZRZed1kMgJ0zIkvGwk9AHrFVMJJIDET3H/iUs2
   g==;
X-CSE-ConnectionGUID: FZ9zXwcjSXyNbU33xN9a/g==
X-CSE-MsgGUID: 0eMLcSA1Sp+yM45kWVDOzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47179584"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="47179584"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 04:08:25 -0800
X-CSE-ConnectionGUID: /ECJTuLBTMOzPaPOS3YiHg==
X-CSE-MsgGUID: 94AP15oNQ9WL8Zbk4A6f3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140710361"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa001.jf.intel.com with ESMTP; 09 Jan 2025 04:08:23 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 08/13] ASoC: Intel: avs: Clearly state assumptions of hw_params()
Date: Thu,  9 Jan 2025 13:22:11 +0100
Message-Id: <20250109122216.3667847-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250109122216.3667847-1-cezary.rojewski@intel.com>
References: <20250109122216.3667847-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no NULL-checks for fe/be_hw_params as there is an implicit
assumption that framework opens valid DPCMs only. State that clearly.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 5878cfdbbee5..4bfbcb5a5ae8 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -161,6 +161,7 @@ static int avs_dai_be_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dpcm *dpcm;
 
 	be = snd_soc_substream_to_rtd(substream);
+	/* dpcm_fe_dai_open() guarantees the list is not empty at this point. */
 	for_each_dpcm_fe(be, substream->stream, dpcm) {
 		fe = dpcm->fe;
 		fe_hw_params = &fe->dpcm[substream->stream].hw_params;
@@ -576,6 +577,7 @@ static int avs_dai_fe_hw_params(struct snd_pcm_substream *substream,
 	hdac_stream(host_stream)->format_val = 0;
 
 	fe = snd_soc_substream_to_rtd(substream);
+	/* dpcm_fe_dai_open() guarantees the list is not empty at this point. */
 	for_each_dpcm_be(fe, substream->stream, dpcm) {
 		be = dpcm->be;
 		be_hw_params = &be->dpcm[substream->stream].hw_params;
-- 
2.25.1

