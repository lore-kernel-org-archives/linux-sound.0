Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC971AAE28
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 20:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740195; cv=none; b=gbPT2/SRC2BYbrwxz4N/rynDTyTvOA3sPArxT2mEDX65obFTlMFPN4GbqzjCszfc4833BcPgdHaLMOz2OIHuLNsGEjjuiZpt7GVrflPGqYD8XmQGuq2Jf1mmrk4ibphz2krLCRNchQOKavpM3m7i+sm3WV3M5T5R1HnyKEjLEhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740195; c=relaxed/simple;
	bh=agKlK4pf1eDHt8crpSGQOnGSiPfbmB27vxClY4Takfw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DtwmiI0VbCnF609Z/U5ZMQx+fy9eZTAk13C+7wuqnmcwevGTH6uSgyi/vIqAh5v4MrzImY7IQaBSgHSv0JleDRZ4CH3IhUNSlur867t7zKJxDzQL48jh4KXjr1iU6V3Htf+t4BZ1tRjI/qLgTmfeoC/Lp3qVJsM41O8PR4zkf4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j0bpqxYh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j0bpqxYh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779740193; x=1811276193;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=agKlK4pf1eDHt8crpSGQOnGSiPfbmB27vxClY4Takfw=;
  b=j0bpqxYhZjFFgwYXvsSTXAWJI5PJyurKu1nqt2wRPUoftctfhJZ7Qe2Z
   e5M1JY3YWtMWHmja1TucBISl9mJaglfuDY27eDNGpHRh+e34a7YkJZSD3
   bZGOUsXbbTjnwwnSD+Nu2Kj6UG343xYAnWhUvPi5+HJsRdlb2f03LohMN
   Cfcy0oZx05yCy3y9Ft6O+iRkqNcbB5HTI6/a2nTipIj0S+RBR8YdQWFq+
   if6YppYdtl0IS5f/ErJD5zhYZeRAbzX+NqJdalLTJZ0kC1TM/Dhl+/3yu
   HBIPZ2d49hNXCtbQEW2E+DTD1M6OcLtMEY5o/SEaCrJAUYLaK+UQiT3oH
   g==;
X-CSE-ConnectionGUID: 9LloYV1FRfO300FTLFXX5w==
X-CSE-MsgGUID: /ebDoiGqTHSeF5zCLHJ7+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80745438"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80745438"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 13:16:33 -0700
X-CSE-ConnectionGUID: sypK/xx+S4+iSz/KRTcvvg==
X-CSE-MsgGUID: 5we50LoeSIiJ/eapODVz9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="245981186"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa004.jf.intel.com with ESMTP; 25 May 2026 13:16:32 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	jiada_wang@mentor.com,
	linux-sound@vger.kernel.org,
	peter.ujfalusi@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/3] ASoC: codecs: pcm3168a: Prevent regulator double-disable in S4
Date: Mon, 25 May 2026 22:17:59 +0200
Message-Id: <20260525201801.1336936-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260525201801.1336936-1-cezary.rojewski@intel.com>
References: <20260525201801.1336936-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SLEEP_PM_OPS are unset for the driver. Hibernation (S4) causes no
resume (skipped thanks to smart_suspend=true) yet still performs the
suspend sequence unconditionally, see device_complete() in
drivers/base/power/main.c.

If S4 runs for already suspended pcm3168a device, we end up with
"unbalanced disables" warning from the regulators. Assigning the
operations fixes the problem.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/pcm3168a.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index c8617a488b11..7f8d64fb0e57 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -907,6 +907,7 @@ static int pcm3168a_rt_suspend(struct device *dev)
 
 EXPORT_GPL_DEV_PM_OPS(pcm3168a_pm_ops) = {
 	RUNTIME_PM_OPS(pcm3168a_rt_suspend, pcm3168a_rt_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 MODULE_DESCRIPTION("PCM3168A codec driver");
-- 
2.34.1

