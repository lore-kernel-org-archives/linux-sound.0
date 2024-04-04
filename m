Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A4413049B
	for <linux-sound@vger.kernel.org>; Thu,  4 Apr 2024 19:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712257447; cv=none; b=I2vKteDvVoD2RL2XkmwZ4+HrP/IM2c0NvtWYnDVL+lDbhMoRjo6cWoUvFN3Asbw6XyqWlnEwjtfTYr/mwB84+k//12QOPooa4XcwUXa0ctUP5Qhu33fT4ui2jKR3FGm39tbV91YEQIyarZV2jaeFxhRbdzgjHMGms+L6NNXn1hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712257447; c=relaxed/simple;
	bh=gvWvwJz1TMcsZ+arLk6e5VFQm8nhkbazC2Uqjo8O/ic=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RmvHL0j3mjbxuXBh/rqUowBFGbSVwcQHjzvZ4TszYtW+ZMELaqfVYcJk2dUIeOfCrhGblG2Nb7fCaiOEUuREXqSw6mM+FYK8KXvpK5FTEx7JhoLkVJ2A56sujljAKQM4D7mHDS5nH10LVr9991v6O6TBBeLPIEzT/4jicaRs8RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZZt3G2G; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZZt3G2G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712257446; x=1743793446;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gvWvwJz1TMcsZ+arLk6e5VFQm8nhkbazC2Uqjo8O/ic=;
  b=OZZt3G2GnlgOkidQD/eXN95wNF5LnfIs5ZuzDtv0AByEjwR/RxjjAE0h
   mKqWckbcswUqfIfkgYCoNEt/V+YaGUR85yHmnooA1Yul7Tn8jCH+7d0Fr
   7V6IReALnTUKvFEWL9I7HddVqtHySrl9zFkz2htdIOhcSTevIDkju2pUv
   eSJ5CZQRMo+HIBe/T2NQgY9cxnSPZ7D+kttcvg8QUAlmsHQVh66RdYira
   hosPYJPf5dKjjPztiRO0f/3VVbySUBUwdXB6wZIY3pYUMfzhvbh9Wd0Jz
   cN18hYz30odTCDYdpoaC8uy6eWL04gt2iIen5jApiM47QczsdL4TlzHyq
   g==;
X-CSE-ConnectionGUID: VBotZfZqQgikYtL7NkwF5A==
X-CSE-MsgGUID: JYPee5qgTQm0cAyfQDxIEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7433860"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7433860"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 12:04:04 -0700
X-CSE-ConnectionGUID: KHTE80dDQGaUdnzi4OBsNA==
X-CSE-MsgGUID: xF8Og7J8Sc63xgcAh590cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="19492306"
Received: from sparrish-mobl1.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.119.106])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 12:04:04 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 1/4] ASoC: SOF: Intel: hda-ctrl: add missing WAKE_STS clear
Date: Thu,  4 Apr 2024 14:03:54 -0500
Message-Id: <20240404190357.138073-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240404190357.138073-1-pierre-louis.bossart@linux.intel.com>
References: <20240404190357.138073-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For some reason, the programming sequences in the SOF driver do not
include a clear of the WAKE_STS bits before resetting the controller.

This clear is not formally required by the HDaudio specification, but
was added to harden the snd-hda-reset back in 2007. Adding this
sequence back avoids an issue reported by the Intel CI.

Closes: https://github.com/thesofproject/linux/issues/4889
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-ctrl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index 84bf01bd360a..b4f0756e21f6 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -184,6 +184,7 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev)
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct hdac_stream *stream;
 	int sd_offset, ret = 0;
+	u32 gctl;
 
 	if (bus->chip_init)
 		return 0;
@@ -192,6 +193,12 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev)
 
 	hda_dsp_ctrl_misc_clock_gating(sdev, false);
 
+	/* clear WAKE_STS if not in reset */
+	gctl = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR, SOF_HDA_GCTL);
+	if (gctl & SOF_HDA_GCTL_RESET)
+		snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
+				  SOF_HDA_WAKESTS, SOF_HDA_WAKESTS_INT_MASK);
+
 	/* reset HDA controller */
 	ret = hda_dsp_ctrl_link_reset(sdev, true);
 	if (ret < 0) {
-- 
2.40.1

