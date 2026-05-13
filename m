Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE3E25393B;
	Wed, 13 May 2026 16:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778689684; cv=none; b=RDx/Zj3bUW8wfH7qwYughsl/GQx40WchjjWmJ91wvh3FAj+eC4KkAbi9nO8AzdXQ8k7VQACGYdvkCHfT11JEdkCt1Gl97VjbamF9pdsFBB2VPIVKngK2vJTRtJ9KJBdV4L8abF5CRYP2swDxdY0MLAA/OFZk/hnpYy0/pbU66xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778689684; c=relaxed/simple;
	bh=N8oIg18Cz234XqN8BlpTmo0t2ZnqyA/UwxDKs1bsxLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HTXxoRKYq1mTgrH7pq7+k7prHPT6qAbHW9Bkq/n+NGTVOmMhZDPLYTpOf4rlbEXh0sgI/UU6BA9hjzHjY/SvUq+xPjqWL41/gM+CuqCaixaUkuOR58pZJWL8gk+eEuXRfys6XPGQ0cWw3ARRTdGJueyLYNOe6Sn/yr+YkuR4Puc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vjk9VdaF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vjk9VdaF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778689683; x=1810225683;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N8oIg18Cz234XqN8BlpTmo0t2ZnqyA/UwxDKs1bsxLg=;
  b=Vjk9VdaFqanOTZzdWXp9VJINGzcufEpBi/zUP8ZsKVkNBmPsQawLuxv3
   xvBsobVtCdngpjv5Aucft9p/TmzwRbHbtfkdGeBHvcQhkgYCtKsTTjCi5
   nn0uFwrgMLnd9KzUH4IlG2qhSPNPpVuVxBzxeFVdx22OAsl9xAK6zkre4
   66EFlVlOa4ssm6jgBWcDvaFi8MBZjKaFVLXjx0xsC3elePwR5HOKdArwS
   LbYo2XZoJCmnuvfoGcdhLGiosJrU7QPL10FiggO8HQvEjIAWNYwppT0jI
   FyPkpC0BRJqgkhuC9EEtNh1ZvgNuRQbcdk02nthxC/cRtm56YpoVr3YX8
   Q==;
X-CSE-ConnectionGUID: fab1IhbTTAeMz99G/zuQpg==
X-CSE-MsgGUID: //Z26p4mTFOd2905qAPN/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="89930281"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="89930281"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 09:28:02 -0700
X-CSE-ConnectionGUID: lPqvZVsZSlOUXul8PgHHaQ==
X-CSE-MsgGUID: tFsWLX7NTsy6dXUcxfY8LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="233863821"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 13 May 2026 09:28:00 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5AC4995; Wed, 13 May 2026 18:27:59 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH v1 1/1] ALSA: hda/cs35l56: Drop malformed default N from Kconfig
Date: Wed, 13 May 2026 18:27:58 +0200
Message-ID: <20260513162758.365972-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First of all, it has to be 'default n' (small letter n), otherwise
it looks for CONFIG_N which is absent and in case of appearance
will enable something unrelated. Second and most important is that
'n' *is* the default 'default' already. Hence just drop malformed
line.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/hda/codecs/side-codecs/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/hda/codecs/side-codecs/Kconfig b/sound/hda/codecs/side-codecs/Kconfig
index fc5651e555e3..e51964c0a091 100644
--- a/sound/hda/codecs/side-codecs/Kconfig
+++ b/sound/hda/codecs/side-codecs/Kconfig
@@ -94,7 +94,6 @@ menu "CS35L56 driver options"
 
 config SND_HDA_SCODEC_CS35L56_CAL_DEBUGFS
 	bool "CS35L56 create debugfs for factory calibration"
-	default N
 	depends on DEBUG_FS
 	select SND_SOC_CS35L56_CAL_DEBUGFS_COMMON
 	help
-- 
2.50.1

