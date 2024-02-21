Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C48280606
	for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 15:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708529031; cv=none; b=jeXOpCXQZdgqyITH13Qp+HWrcSYoTCz9Wk6Nb+Kfg5bPhUS16fe1Ki7taHHZRQ+dyUkxU6m8L09ZNRLzuVBLUxaLPbSQ+2ca2TyAAMqCdnSFaIKB7qMkRapubjl7ss1jZiQ334qJASWGDcmMvpAVA43wcWvhlrK8PyfiNmdzguU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708529031; c=relaxed/simple;
	bh=C4eam5B1/ua7yw+Vatsep/Lrr+vtYohYNHxWd27npZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N9XvG3EClwnxPzxf/6dhhSd9aijVSyetryxXoFsD3HCmn6nJy6DOdF2IknLx8mZWaTvvPWhe8igIDKPSWmtMRHXKFapXyJB1DrdMwC7YhhX4axCUc9fypuyvsduCQWK5EDtgesPz8iRXdHWxJZPuSLmS6Zy1rJj4+rmReS2LseA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dzQBAJb9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dzQBAJb9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708529029; x=1740065029;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C4eam5B1/ua7yw+Vatsep/Lrr+vtYohYNHxWd27npZw=;
  b=dzQBAJb9JdEZnSeqXMuPYALxS9/e6PQwPFhImHTTSjfEquKeST1vBtQ2
   pJTy6doY5w9SBj3SU58evvXCEtVO8xB1WllEeBAII5sjxehWWS7sLDHMN
   Tn+AHAZRHMCVAFjouLLounN2Xm4uWPRrK274WrqAGPRT+VArB3xQuiZS8
   0zd0fSVZ9ax2MZkxYafwNhhYrA+CaDFgyOLxDYxyHyJRIzbtaa01QE8uk
   IjlENei62Qc8AhO39lmHwgNkT+mPPDaHEn8bAzPy3Emm17O0pPJA/GOtP
   HVplV2ZIZBoum2uW8tWZodaS+heDFVJ6IEkbHAA3NfAXTf8q/rgLiolTL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="14104788"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="14104788"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 07:23:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5374253"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 21 Feb 2024 07:23:46 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/6] ASoC: codecs: nau8825: Simplify mclk initialization
Date: Wed, 21 Feb 2024 16:25:12 +0100
Message-Id: <20240221152516.852353-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240221152516.852353-1-cezary.rojewski@intel.com>
References: <20240221152516.852353-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Most of clk_xxx() functions do check if provided clk-pointer is
non-NULL. These do not check if the pointer is an error-pointer.
Providing such to a clk_xxx() results in a panic.

By utilizing _optional() variant of devm_clk_get() the driver code is
both simplified and more robust. There is no need to remember about
IS_ERR(clk) checks each time mclk is accessed.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/nau8825.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 5cb0de648bd3..cd30ad649bae 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -2836,16 +2836,12 @@ static int nau8825_read_device_properties(struct device *dev,
 	if (nau8825->adc_delay < 125 || nau8825->adc_delay > 500)
 		dev_warn(dev, "Please set the suitable delay time!\n");
 
-	nau8825->mclk = devm_clk_get(dev, "mclk");
-	if (PTR_ERR(nau8825->mclk) == -EPROBE_DEFER) {
-		return -EPROBE_DEFER;
-	} else if (PTR_ERR(nau8825->mclk) == -ENOENT) {
+	nau8825->mclk = devm_clk_get_optional(dev, "mclk");
+	if (IS_ERR(nau8825->mclk))
+		return PTR_ERR(nau8825->mclk);
+	if (!nau8825->mclk)
 		/* The MCLK is managed externally or not used at all */
-		nau8825->mclk = NULL;
 		dev_info(dev, "No 'mclk' clock found, assume MCLK is managed externally");
-	} else if (IS_ERR(nau8825->mclk)) {
-		return -EINVAL;
-	}
 
 	return 0;
 }
-- 
2.25.1

