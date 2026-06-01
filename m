Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFCF3B27DE
	for <linux-sound@vger.kernel.org>; Mon,  1 Jun 2026 14:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780322949; cv=none; b=SlKfbh6nrWffx+lun1UwaXvsQIdiIonZ7KmTNRJxPSDnqOIkYXgT2B1iafJ+0KLg/NF3ZD0OXuyMLnlW/df5WAU7z9YjYO7dFw30A5wJkiSkE69yRE5FU76SUxHtdHblgQSYQjFYsBIpwYXBPP+zByWRDtcFhvmjVfSQSTqUTRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780322949; c=relaxed/simple;
	bh=UeDIkspKuUow/0IGBpq3Jeki/emZV6RFum5eICMqBVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ypj+70SLogMVOswBJW4Ze9AOpw3MaQV6RHkzqr+YUqUxCgWHF4Hh62HiymIbW8t+3aDEUG2oUVhDuT6nrTaoqswqaqEM1MNnejqg3zRTX2X6vwufh4kh6ttO9vnlsRNGMJ+PjXHA4q10YIp3vWc+z8XMXyJ+puaWE9MOCKLzmiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mS1AhDhH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mS1AhDhH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780322949; x=1811858949;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UeDIkspKuUow/0IGBpq3Jeki/emZV6RFum5eICMqBVQ=;
  b=mS1AhDhHIPRYcc/jkri5tWwit+u8nxVSyDX9S/XHL3r2XNmgmcgY2FL4
   TGFm84lxia/FdqXJ51v+hVqJFjlYcQkzHLT2Jvjwz8FC1HTPpV1a7EW22
   BySjasKcg6vATKFkIXqAFh9K6ZqtxRKwoWQ6MFUJ5DUvtQzkorZe6G/NJ
   RZFhPFLLgy32PTOVWDC/+9bkpysDC+N/bAZcnJniYpFBTBsBs9rYRYO0s
   UjweWUmwVLRPbdIOqImesGGaWGTsB9NQdNT3JxSkdDt96prGBd8xICvuo
   M1i2XeA61w9Ufa2EJX5gBQuH9u4AaG8B4oeDqL+h9YXAYp9P8/mMfRG42
   g==;
X-CSE-ConnectionGUID: g4XkHAdOS2qLcWpCf1vCXQ==
X-CSE-MsgGUID: 91b1ww4eSQ2rMzXaD/lrNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81140303"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81140303"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 07:09:08 -0700
X-CSE-ConnectionGUID: hihPbxsoRsOrdiCH0c2WAg==
X-CSE-MsgGUID: OGIViVbzSJuuAqQDHo7mpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="243705080"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa007.jf.intel.com with ESMTP; 01 Jun 2026 07:09:06 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 7/7] ASoC: Intel: catpt: Cleanup components_kcontrols[]
Date: Mon,  1 Jun 2026 16:10:31 +0200
Message-Id: <20260601141031.1606847-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260601141031.1606847-1-cezary.rojewski@intel.com>
References: <20260601141031.1606847-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix alignment and drop redundant comments.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/pcm.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index bfa94f5ffc8d..01b015b4584b 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -983,14 +983,12 @@ static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(catpt_volume_tlv, -9000, 300, 1);
 }
 
 static const struct snd_kcontrol_new component_kcontrols[] = {
-/* Master volume (mixer stream) */
-CATPT_VOLUME_CTL("Master Playback Volume", MIXER),
-/* Individual volume controls for offload and capture */
-CATPT_VOLUME_CTL("Media0 Playback Volume", OFFLOAD1),
-CATPT_VOLUME_CTL("Media1 Playback Volume", OFFLOAD2),
-CATPT_VOLUME_CTL("Mic Capture Volume", CAPTURE1),
-SOC_SINGLE_BOOL_EXT("Loopback Mute", (unsigned long)&(bool[1]) {0},
-		    catpt_loopback_mute_get, catpt_loopback_mute_put),
+	CATPT_VOLUME_CTL("Master Playback Volume", MIXER),
+	CATPT_VOLUME_CTL("Media0 Playback Volume", OFFLOAD1),
+	CATPT_VOLUME_CTL("Media1 Playback Volume", OFFLOAD2),
+	CATPT_VOLUME_CTL("Mic Capture Volume", CAPTURE1),
+	SOC_SINGLE_BOOL_EXT("Loopback Mute", (unsigned long)&(bool[1]) {0},
+			    catpt_loopback_mute_get, catpt_loopback_mute_put),
 };
 
 static const struct snd_soc_dapm_widget component_widgets[] = {
-- 
2.34.1

