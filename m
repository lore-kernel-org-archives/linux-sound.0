Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D25D42188B
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 08:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477023; cv=none; b=Qj6OYykVk/wWIhJX8boVeb0BTUx2QvNXPqXVx/Qg1XITQAfPPiBY9AIlzsjG3tBTpmsNPvr06sxCZKLKjXFkn7o9cHtgv0vWueuUVbZ5lQmShbtGtXRoQML+krHlKLcWmVtV8i19Ul9V6zxua+s26l/f+UqLPncwcRacKks2izg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477023; c=relaxed/simple;
	bh=zHcGkjSaqCrOVRyZ41u5xhmVyQ3KUgcsbKQwsW1BmlA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q8wa721oLTedrbTgY77pqbg5mQP9yRXhN5Ig7zQmjH9AlPhpuaKcUra5rhwvpKD9CYDy7hwOxBxUacdEXy9wzAtn2fXpGGxs8NkLX7RIITBmEPIl+8Zc8cfsx5b6Ongg8CC7QMNswW4jYDQGMkDLTQnJs1FdbSalDZoajn8vQcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAhz7Vt0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAhz7Vt0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477022; x=1812013022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zHcGkjSaqCrOVRyZ41u5xhmVyQ3KUgcsbKQwsW1BmlA=;
  b=bAhz7Vt0yg4WighYDw+byI2J1g/xCRC6PlWATBC2rmOddV0+4lx0T9FV
   Ik32Xx6HrzvHS//Wnd4aPscEUL+0+8sOIdY7hphnWNwqzE9BL6KS7N0Ch
   TQ/ttJlisL7VtzBfkqKOfuTh2kixfy40UjwZoJW3znRe43YAH5vYzrrfk
   iARrD7/i0xMMxORGjL4PHCrP6lH0sJo5sPnfCm6npqm1q3fsuJGzfwr5t
   EvY1cJstPOLvRdcGF8G3a9ofgoI9uqogNxhOhKf3gKVJp67SsJLVSd4jT
   DqLfLZkDcJFQkWundhW+cJWb0w0b0PdDT9ah6AEUyIoPLJTWIuCHcOhB9
   Q==;
X-CSE-ConnectionGUID: ZWE979EZQCS3gj3yvtOElg==
X-CSE-MsgGUID: 6u+4oY4tS7ad79oT4BBG5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81182150"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81182150"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 01:57:02 -0700
X-CSE-ConnectionGUID: FOcA/v2oRQ2b1Anxp4mxcw==
X-CSE-MsgGUID: Vl7WIRNtSVC5vNOa7GnscQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="248109348"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 03 Jun 2026 01:56:59 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 5/7] ASoC: Intel: catpt: Remove unused WAVES controls
Date: Wed,  3 Jun 2026 10:58:25 +0200
Message-Id: <20260603085827.1964796-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260603085827.1964796-1-cezary.rojewski@intel.com>
References: <20260603085827.1964796-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support for the WAVES module was never officially published.  The
kcontrols present in the existing code were added to retain 1:1 UAPI
with catpt-driver's predecessor, the haswell-driver despite the lack of
users for the functionality.  Several years have passed since the
successful transition to the catpt-driver and removal of its predecessor
and there is no reason to keep the unused code.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/pcm.c | 32 --------------------------------
 1 file changed, 32 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index ba0c75f4b4e7..faa9c483c98e 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -968,32 +968,6 @@ static int catpt_loopback_mute_put(struct snd_kcontrol *kctl, struct snd_ctl_ele
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
@@ -1018,12 +992,6 @@ CATPT_VOLUME_CTL("Media1 Playback Volume", OFFLOAD2),
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

