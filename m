Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C27A3C0A18
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 08:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387983; cv=none; b=XeHLEqO4IIfcLpCyp6ICmZoJw4T0F8bRlJExtPnOrAzOKcu1c4KRyn5stG+9onJUcNoP4BU5owkO8dhzoq3CaoGUTlEqgssnAHQ7B65Moa+Y26KkaEh3CBL36yG6gFQg2DtYEfkAIeS6PX5a77LT0P5XJECGjr2FQ/cPg5MMmpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387983; c=relaxed/simple;
	bh=hVMAJfzswOb+dj6/UMOypEk+IuFrstelNaOielW86uo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QS/j6dDvMaAH7tDThEokn33FyazKCWJGtzhBaxQgry0h6a1yzZJ4N1fpKiU9QP6l6oD7oAlWyyxQ7S/oWaeWuXDrvpAPwoScO/pX00fG6Hn4K5XlSbzUur/NwBd0TuxKLE8CHxiAMXdByxy4LcvM1w95xrZGbtqi8okldfi59i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g8eG1AWP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g8eG1AWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780387982; x=1811923982;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hVMAJfzswOb+dj6/UMOypEk+IuFrstelNaOielW86uo=;
  b=g8eG1AWPvytCRKLJNhg2M1PcpymK0+ipA1m8b5+alzpTs2DMhw6GkPw6
   TaC2K0J4nqJ8bu4yITYKyR7sqYU6k9lTNNJydMeXk5VqqKuPi/kt7Z6hK
   Oj9P90QTzfSUNxULB2IICNs4cv27RZFF7iep/gfBG8cJPpiftIeLa/eKf
   qG9J/fB4DZ9OGwWzU+0wvm/bngLf1uHqyn1aGJCw8rhaogWQpl8PHcdsJ
   4xLYIKFQIY4Q1SEZaTizlFxSGbyW+OXtAxGKE+h0A5IOMAksAmemb3TJt
   OohjIPK/Glb8qhkA8OhWhbhYIiGIJwVB1vfJktca95uPkWocEvfxz57yV
   A==;
X-CSE-ConnectionGUID: /xEqBSGPSeuICQW36A0DkA==
X-CSE-MsgGUID: +KuN6o0lSwW3fNxY0Ky6/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="91742905"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="91742905"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:13:02 -0700
X-CSE-ConnectionGUID: J19/PmtvT52h0KhqBLytDA==
X-CSE-MsgGUID: kjNZhHslQaCe4taZy4H9dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="243949951"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa007.jf.intel.com with ESMTP; 02 Jun 2026 01:13:01 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 5/7] ASoC: Intel: catpt: Remove unused WAVES controls
Date: Tue,  2 Jun 2026 10:13:48 +0200
Message-Id: <20260602081350.1752773-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602081350.1752773-1-cezary.rojewski@intel.com>
References: <20260602081350.1752773-1-cezary.rojewski@intel.com>
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

