Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3077A4E1CC
	for <linux-sound@vger.kernel.org>; Mon, 26 Feb 2024 12:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708951379; cv=none; b=M/6TNGDaicGWOBReWGImFVMttISSU3YoRpxm24KZoMouOuk+zXkWVUEb4pno+hU12E43oVAsvjzVp0tWIXPxJaqC17Ks7Jzu345DHqNcRjAT8tE61UKknd1Lnzh96BaGDk0DstrBaz/h61zuY9QImoFcrbtFhJc+qgn8+M2IL9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708951379; c=relaxed/simple;
	bh=2KdsoRdBQn0vAvJ3VTzz+IQEwwTyje5sOboncMJlplo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GTk2aIWaxmoYyvL0kCbdcHvAj7G5/pTwpY8GXXTIv/+shmPC9ty5F1ikmhGy/tLF1ol0WyBCQn63L5IE6vnVfTjaBihxj5tHgfT1EUeyuTWz2MZFcK2TINrvOuxEQlc+aPOFckby3cynsbum5IOQjvWpr5TpgpFQ+dtimeUkGyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=isYM/bcB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="isYM/bcB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708951378; x=1740487378;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2KdsoRdBQn0vAvJ3VTzz+IQEwwTyje5sOboncMJlplo=;
  b=isYM/bcBkEldR9wkjCmrTy3bBbaTvcz4J/bTl5wPuUs6A+yk81MeO+1p
   aioXEOZ4XGEVYOM1JKukPu32vWR4iSgo8z9J0Lp43BPWwORgbAsZx1OsL
   bmwXwh8w3ZyI8YSlvALdWQtM7kdg1y8I4vqcrzOWIJ/9LPWPz0k+FlgTe
   1nYdkkChVKqCPByJNJYpsBo1d/IA6vUX3SJ3SO2rJQK3zAgqe4FzcZAt1
   2yDNUaI3U2/XYWG0jMEMyVQwA2ck1zmWt/JXmy+aMMz4u/BbFsk4WEgKC
   HOLRSUy+0V/Q09KPhLiqDc6Op4xbOE7VvvI1ykvCJs9VO79ZaOLfUK5P+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="28658220"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="28658220"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 04:42:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6688605"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 26 Feb 2024 04:42:54 -0800
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
Subject: [PATCH v3 0/5] ALSA/ASoC: Conditionally skip i915 init and cleanups
Date: Mon, 26 Feb 2024 13:44:27 +0100
Message-Id: <20240226124432.1203798-1-cezary.rojewski@intel.com>
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

Changes in v3:
- snd_soc_hda_codec now returns -ENODEV on attach() if i915 is not
  present
- denylist now const
- added new patch for the avs-driver to address -ENODEV during
  probe_codec()
- note: retained reviewed-by for patch 1/4 as changes are minimal

Changes in v2:
- list of problematic VGA devices is now declared locally, no more
  touching drm stuff

Cezary Rojewski (5):
  ALSA: hda: Skip i915 initialization on CNL/LKF-based platforms
  ASoC: codecs: hda: Skip HDMI/DP registration if i915 is missing
  ASoC: Intel: avs: Ignore codecs with no suppoting driver
  ASoC: codecs: hda: Cleanup error messages
  ALSA: hda: Reuse for_each_pcm_streams()

 sound/hda/hdac_i915.c      | 32 +++++++++++++++++++++++++++++---
 sound/pci/hda/hda_codec.c  |  2 +-
 sound/soc/codecs/hda.c     | 15 ++++++++++-----
 sound/soc/intel/avs/core.c |  9 +++++----
 4 files changed, 45 insertions(+), 13 deletions(-)

-- 
2.25.1

