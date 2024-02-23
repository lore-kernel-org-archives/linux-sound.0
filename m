Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9321A5C60F
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 11:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708688693; cv=none; b=atY6ZkpN+sZv3aWdAvsfpQ/RxHURa0wOW1Pzh9ntfTRdpdGP3fRR27w3i51aTq7SMKExDi/dni1zqWvvFKKn1pvGuO82fotONqdhCnfZn/MAR4Xv1+yeX4CmIf2yo65WU1Fp14L6iWOGlPS1kag245hCHg16I7RqQC1Ip0nBiL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708688693; c=relaxed/simple;
	bh=5M53J19YnQsDTZHCO/RGLH/1wCJSKBF2s0sCAjtorsM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Su+pUiguP/1TzbGJDsaicejAmEUTSMnsYqHTl1g6EQKwjpzntNhZHJQ70HwtJ8D5CcOhXsZXXoJVVRcdkU0mja/1pz+aAZMnz7h+F/SPmOh8fjlrE6q/rtmizGj4f41lcxlEJwKVV5tcRONMlJXs5uUCm/SD5u79xHMyp0hNpNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jga1gbuy; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jga1gbuy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708688691; x=1740224691;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5M53J19YnQsDTZHCO/RGLH/1wCJSKBF2s0sCAjtorsM=;
  b=jga1gbuy//81VxN8yV7+MJELx8nIOafVZJaJuERV1tNg++2uVL8D9abJ
   HrnReK7NObgdR19Bb/yh4D2RtUxH0l5l1PLDH1jOAwOs38/uC61NXRJcp
   XoUDJfGw0ifB6FvIdCHgvIoMGehhADhgrR69YcKEMzaCMDIF8SeyBdlYQ
   rx2sIMwvswvRtyE0syuvhBMkzV5ua27sSvKRBNHzC3F6rhgtfhXBXHWne
   M85a2tOvMf1jeCSp29ofbaVJUPXAkSH9QkCBXm82xmKcK5J4VhKDvSxYF
   PiJQl9eEksgCwagbCRZyX/b9+iBTwzlZnUPaoyQo30ngB+EDqfVczt1o2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3504591"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3504591"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 03:44:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="6092883"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 23 Feb 2024 03:44:48 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tvrtko.ursulin@linux.intel.com,
	intel-gfx@lists.freedesktop.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 0/4] ALSA/ASoC: Conditionally skip i915 init and cleanups
Date: Fri, 23 Feb 2024 12:46:22 +0100
Message-Id: <20240223114626.1052784-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A small set of changes to improve initialization of the audio stack on
HDAudio devices and pair of cleanups.

As the first change is the most important one here, following is the
technical background for it:

Commit 78f613ba1efb ("drm/i915: finish removal of CNL") and its friends
removed support for i915 for all CNL-based platforms. HDAudio library,
however, still treats such platforms as valid candidates for i915
binding. Update query mechanism to reflect changes made in drm tree.

At the same time, i915 support for LKF-based platforms has not been
provided so remove them from valid binding candidates.

The snd_soc_hda change is a follow up for the above and the cleanup
patches do not bring any functional changes.

Changes in v2:
- list of problematic VGA devices is now declared locally, no more
  touching drm stuff

Cezary Rojewski (4):
  ALSA: hda: Skip i915 initialization on CNL/LKF-based platforms
  ASoC: codecs: hda: Skip HDMI/DP registration if i915 is missing
  ASoC: codecs: hda: Cleanup error messages
  ALSA: hda: Reuse for_each_pcm_streams()

 sound/hda/hdac_i915.c     | 32 +++++++++++++++++++++++++++++---
 sound/pci/hda/hda_codec.c |  2 +-
 sound/soc/codecs/hda.c    | 15 ++++++++++-----
 3 files changed, 40 insertions(+), 9 deletions(-)

-- 
2.25.1

