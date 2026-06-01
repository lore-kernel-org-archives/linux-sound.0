Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8EA37C918
	for <linux-sound@vger.kernel.org>; Mon,  1 Jun 2026 14:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780322945; cv=none; b=acaeuqf/45d95AtOw334fS+VLjumxRtcqMFj8oQ+MxR0drBl+MRDfdn8jtOwIe/t3/KZN40epE9uvpjY+SpmjdxQPAC30GFgxPM4ik4LpJgjv6JrWyjznHjm9AgW9AnQGRBqAtMX6Jdf77lm7z+sgGsi3bl3yp/MQvxnQsiv62s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780322945; c=relaxed/simple;
	bh=hVMAJfzswOb+dj6/UMOypEk+IuFrstelNaOielW86uo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mcPwabkMefB/XDNiN4S/UDd8gFXpMeDx8pynBWhjufK56cu+yCdupF8DNEM0s9y1m5cLyCK9DUItkY0cjuGG+uNpaSOszLPGgfQeB57t4z7OBWHpXLu1sfWTMD6Ozt82wDz77SqVl0AS3uX8gVSRQ/lfP2sagi8o3gFvNoxBP48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LLUEuW78; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LLUEuW78"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780322945; x=1811858945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hVMAJfzswOb+dj6/UMOypEk+IuFrstelNaOielW86uo=;
  b=LLUEuW78GapAy4M0uVoDNBGfPgi3HN0TodVCNSLa7CdgkuORmkPFL8Vk
   XidkU6BS8vcswHoqm+6oi5Q8yVByeNsvWJ5axNEnqOZHk0trwL9yMgFNw
   ko7D/5Tycvu7dkmZDdPF/BZgE6U5RHhKjkpZ/7vI/PxS7Fwe51amSNvmA
   qykNC9WZjt586KalqUC94fQzaSpavbtIunqGW5jfRUZ47l9NH3E0eg8lt
   vb0GhXKWdcA4qi1rmrNsI+UdnXq8H/sZiulxgeYY9mIYzh2s2blIAI9+b
   CxTgQp51Fj0ZHszjap1w/lP8rG7uEK4tY2jPgfyd2Ctt1pZXDGdbqUOvr
   Q==;
X-CSE-ConnectionGUID: zinoNVszSkaV3jwHNbFdKg==
X-CSE-MsgGUID: tUz9d1qWQF+oiGOshnPe2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81140287"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81140287"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 07:09:05 -0700
X-CSE-ConnectionGUID: /gIUSFIJTDSy3+9NfYGE2Q==
X-CSE-MsgGUID: ia7UCC1jTW6MOqtB4dVB7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="243705027"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa007.jf.intel.com with ESMTP; 01 Jun 2026 07:09:03 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 5/7] ASoC: Intel: catpt: Remove unused WAVES controls
Date: Mon,  1 Jun 2026 16:10:29 +0200
Message-Id: <20260601141031.1606847-6-cezary.rojewski@intel.com>
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

Support for the WAVES module was not officially published. The kcontrols
are here to retain 1:1 uapi when transitioning from the haswell- to the
catpt-driver. The catpt-driver is very stable and several years passed
with no WAVES users so it is save to remove the code.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/pcm.c | 32 --------------------------------
 1 file changed, 32 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index deb76eb79d18..bfa94f5ffc8d 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -967,32 +967,6 @@ static int catpt_loopback_mute_put(struct snd_kcontrol *kctl, struct snd_ctl_ele
 	return 1;
 }
 
-static int catpt_waves_switch_get(struct snd_kcontrol *kcontrol,
-				  struct snd_ctl_elem_value *ucontrol)
-{
-	return 0;
-}
-
-static int catpt_waves_switch_put(struct snd_kcontrol *kcontrol,
-				  struct snd_ctl_elem_value *ucontrol)
-{
-	return 0;
-}
-
-static int catpt_waves_param_get(struct snd_kcontrol *kcontrol,
-				 unsigned int __user *bytes,
-				 unsigned int size)
-{
-	return 0;
-}
-
-static int catpt_waves_param_put(struct snd_kcontrol *kcontrol,
-				 const unsigned int __user *bytes,
-				 unsigned int size)
-{
-	return 0;
-}
-
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(catpt_volume_tlv, -9000, 300, 1);
 
 #define CATPT_VOLUME_CTL(kname, pname) {		\
@@ -1017,12 +991,6 @@ CATPT_VOLUME_CTL("Media1 Playback Volume", OFFLOAD2),
 CATPT_VOLUME_CTL("Mic Capture Volume", CAPTURE1),
 SOC_SINGLE_BOOL_EXT("Loopback Mute", (unsigned long)&(bool[1]) {0},
 		    catpt_loopback_mute_get, catpt_loopback_mute_put),
-/* Enable or disable WAVES module */
-SOC_SINGLE_BOOL_EXT("Waves Switch", 0,
-		    catpt_waves_switch_get, catpt_waves_switch_put),
-/* WAVES module parameter control */
-SND_SOC_BYTES_TLV("Waves Set Param", 128,
-		  catpt_waves_param_get, catpt_waves_param_put),
 };
 
 static const struct snd_soc_dapm_widget component_widgets[] = {
-- 
2.34.1

