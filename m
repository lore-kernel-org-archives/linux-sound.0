Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B911FDE08
	for <linux-sound@vger.kernel.org>; Thu,  6 Feb 2025 09:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738835210; cv=none; b=bI72i4pgWNmNlDtbpRQ4UkPC3USmDDfD3YCdtIh3mQqCSVrYN6MrjsKg5qjYhPWluh+D+XYMI5zyZis/ahnZtd1KfgzzOSsDnlwCtbqBRbYvXcrNoqY84H/YcUTmkMMTjaDVymlTKlzDZOFRFKX8J3ShzThUdR/OMApH9t/R0I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738835210; c=relaxed/simple;
	bh=abOyaq9+IeJcvWWq92UdQ261nY4DDg5o2fTkbgEEjKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m23anYtIQVaDGrhpjpoutmM9iwyYXLJiMUSGOPLOlpa7CX2DaDHQ7mKge5MB7wY66JXRpi6WWhSGnyuQPvajmC4bgIOxwMOrWk4VTLcjdk7QGnGrLC/03XG/akbTxKKRn9U+gpByskmdoBAVps2k/dg8/ZU62cVIiFS8EId50WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R//nntAy; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R//nntAy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738835208; x=1770371208;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=abOyaq9+IeJcvWWq92UdQ261nY4DDg5o2fTkbgEEjKQ=;
  b=R//nntAyDfvbHfSBQbMl1ClR9oWd5mmwJj5tYZRBY/8ztgtaZW2XKQ2d
   jzK4dRHLL3BsR4sdrAvmi+rPVS0FeS5+ei25h8q6766TfOiidjrUm7vam
   1JcURn4sCfw8nDqU/+Lexa/BzBeCFiyZYEg9uR3IZsJHwQw1Yl+tyAx05
   CQ1cLj5JqxN1gp+A7RcRfT3LPwlJR2yzaj1GDJlqdCxjWkhrLebDc2nze
   5tYtuVcbM+LxIn4wtCVVA8EqYVPwTftcSlu8pRADW5nWVQsXAbvy1rpNq
   fj65nT5u/IvcfNjRFtS+x9jpXKLrFaFbqdGfGDMz9BB8lwOJjAES+klGB
   Q==;
X-CSE-ConnectionGUID: 4Sbnf5yERjefMsaEJGczww==
X-CSE-MsgGUID: mAlSBwNTTL6Ai2BloJilMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27031436"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="27031436"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 01:46:48 -0800
X-CSE-ConnectionGUID: slOGWuIgSEiHGIYIdorFwg==
X-CSE-MsgGUID: /gUVy3dqS1+7PwWtGB7GVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116126533"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.33])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 01:46:45 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	htcheong@chromium.org,
	lpg76627@gmail.com
Subject: [PATCH] ASoC: SOF: Intel: hda: add softdep pre to snd-hda-codec-hdmi module
Date: Thu,  6 Feb 2025 11:47:23 +0200
Message-ID: <20250206094723.18013-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Terry Cheong <htcheong@chromium.org>

In enviornment without KMOD requesting module may fail to load
snd-hda-codec-hdmi, resulting in HDMI audio not usable.
Add softdep to loading HDMI codec module first to ensure we can load it
correctly.

Signed-off-by: Terry Cheong <htcheong@chromium.org>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Johny Lin <lpg76627@gmail.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 568f3dfe822f..2f9925830d1d 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -454,6 +454,7 @@ int hda_codec_i915_exit(struct snd_sof_dev *sdev)
 }
 EXPORT_SYMBOL_NS_GPL(hda_codec_i915_exit, "SND_SOC_SOF_HDA_AUDIO_CODEC_I915");
 
+MODULE_SOFTDEP("pre: snd-hda-codec-hdmi");
 #endif
 
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.48.1

