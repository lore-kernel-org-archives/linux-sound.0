Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180631509A1
	for <linux-sound@vger.kernel.org>; Thu, 22 Feb 2024 17:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708621549; cv=none; b=FsMQSl2UygLHT2V7Yc9ML4XrDQioPyx7jgnaeLePfoxPNzEIQwnDQMZD9CKp8D/7uvj8/sqrUKiM33RiGcRwkG5fSrETteCpIReltIp/WYxnCw9FdFUxiSe/fKTlYUm6tP+lXhgMcd2fDHS4da6nST/HkqwCm3jMnUH3a2Thqag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708621549; c=relaxed/simple;
	bh=qBm5r8A0dH4nQsycHwkzWtzHdWmHKHLuX/nwo8bX8Dk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kpR3SOtRDyMBk2rHZo/vJ1V0DuttBqHg/HFWNj4lr+7neKEJZjqvQfYUyBuKSQ4t4u8i+cWnlDVRhzAjALOfU/4wS8Gp4oDLuTPivnqkgCh7OoWREvAZXSdQ6tsrFve1TG2kxFSt+6xOYDFD6Y2fEQQ4an4EYtawkXWLKkm5zRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gkOzfMRy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkOzfMRy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708621547; x=1740157547;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qBm5r8A0dH4nQsycHwkzWtzHdWmHKHLuX/nwo8bX8Dk=;
  b=gkOzfMRyHvm+wdkxBlysbvISN8/TfeGH9WZcq0UNxYQChaDgGC7D1Heo
   5P7BuaztDyX+EAnB+UsIPlQ/gYijb4Z8pqyO/vXnHiu1jju+TgrkAC5Ev
   Oogm11KViY47GHOqDvMtw2yKDmjHswOqZKzURG3h+QPWMAwq6retfEaxy
   vnmGDWJcrkxcmQqrZkHsf4FvgOcKoNsh08Q2UNVDKmR8wVjcEmYYEs1hL
   0PZCdY+i4VqOEijKY49gj0OlWq0oEwcrd5KeIghIOB9nC6VGqDzQt5SeJ
   1CY6NrSCRNknqwNW/jmBL0a4bwng+Xh9bkQd+vHIRStAFSe3bLy322JwS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="20299171"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="20299171"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 09:04:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="827575230"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="827575230"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga001.jf.intel.com with ESMTP; 22 Feb 2024 09:04:50 -0800
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
Subject: [PATCH 0/4] ALSA/ASoC: Conditionally skip i915 init and cleanups
Date: Thu, 22 Feb 2024 18:06:10 +0100
Message-Id: <20240222170614.884413-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A small set of changes to improve initialization of the audio stack on
HDAudio devices and pair of cleanups. While I did touch i915_pciids.h
header which is part of drm, I'd like the changes to go through Mark's
tree entirely - being cohesive with the rest of the code by adding LKF
IDs where they belong rather than hiding them within the sound tree.

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

Cezary Rojewski (4):
  ALSA: hda: Skip i915 initialization on CNL/LKF-based platforms
  ASoC: codecs: hda: Skip HDMI/DP registration if i915 is missing
  ASoC: codecs: hda: Cleanup error messages
  ALSA: hda: Reuse for_each_pcm_streams()

 include/drm/i915_pciids.h |  4 ++++
 sound/hda/hdac_i915.c     | 18 +++++++++++++++---
 sound/pci/hda/hda_codec.c |  2 +-
 sound/soc/codecs/hda.c    | 15 ++++++++++-----
 4 files changed, 30 insertions(+), 9 deletions(-)

-- 
2.25.1

