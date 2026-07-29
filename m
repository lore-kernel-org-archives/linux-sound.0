Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7ED2466AF7
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 10:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322639; cv=none; b=Hqz+7XzJGLUfug+eePvSO3/4S5t37BtYd0xj1hebHDE4cdXZt+4EgtAWrkPZz5+PkUK+UWHT5kjmHiZmCXcas62avRQUFJE4SJSnznLhg0D0xJQE5TR8wGhwioMI9Z96s0xISsEMCDPtbWOVWJfR7a/GQylhngu8c++DB79h7zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322639; c=relaxed/simple;
	bh=FcIAjEcBu917QLFP2+1nHGAZRf5Jg5sKSfQC8WkuErQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QQASXMju+EzbhGGbA/9a8BvbzSuDkGSSA7TFmZJORbHaLl5d9xAbVy2us8z/T5elCKfDNqrv0Q6sEj1M+5DC62YJ6HJwpj/o/LDnYEo6c76EFvcRUOjP9QmniFPZ0cUUobDFBCUX1JdrmifVF5MiI0lzMfTGccBg1XOVDkrh/Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+RCPde6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+RCPde6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785322638; x=1816858638;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FcIAjEcBu917QLFP2+1nHGAZRf5Jg5sKSfQC8WkuErQ=;
  b=a+RCPde6NgLp9ou9C0G0+W5yfn9C0Ua2zXAYByUsYIii+kJwDX4OAOTt
   ZUkK4VuxNXwLfcyzCg01qS/4plNymL6aoOn6MDDcdlz21+0KYTbUDYZ/S
   xXBp8da9qo8V+SVUAAarY054EwpK/6w1HGlyHqA0b7f3MxY4hGBKRF7g/
   HlUNJTiFWcuzJIgfxzMLfWH+lz7zGPNp0KNpoddrylYoKGbTUy44p7Pai
   ywN8ROkJhawGNIlhfRab+8jhc7op+JbhdOu0SfgPPCW/mN3BwNXmlXwzg
   lqU7LauyOtEdvf1Gn/hhLlFiDmps9OkaHRc6kSJfxQpvt96LaIivM8AX+
   A==;
X-CSE-ConnectionGUID: 7LG0doBvSjST793tHda31Q==
X-CSE-MsgGUID: IbdUnUxvQauFZVaryXkurA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96583839"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="96583839"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 03:57:18 -0700
X-CSE-ConnectionGUID: 4U3OxROPRTu2zdApSbpH1w==
X-CSE-MsgGUID: nNdm+jiySMeOEpmM5wLNSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="255675951"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jul 2026 03:57:16 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 3/8] ASoC: Intel: catpt: Drop redundant signature argument
Date: Wed, 29 Jul 2026 13:00:52 +0200
Message-Id: <20260729110057.342447-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260729110057.342447-1-cezary.rojewski@intel.com>
References: <20260729110057.342447-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initial design assumed the mechanism could be reused for loading
external modules with signatures differing from the Intel's constant. No
users with such characteristics ever appeared rendering the 'signature'
argument useless.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/loader.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/catpt/loader.c b/sound/soc/intel/catpt/loader.c
index 79742dceef53..775781489ded 100644
--- a/sound/soc/intel/catpt/loader.c
+++ b/sound/soc/intel/catpt/loader.c
@@ -569,8 +569,7 @@ static int catpt_load_firmware(struct catpt_dev *cdev,
 }
 
 static int catpt_load_image(struct catpt_dev *cdev, struct dma_chan *chan,
-			    const char *name, const char *signature,
-			    bool restore)
+			    const char *name, bool restore)
 {
 	struct catpt_fw_hdr *fw;
 	struct firmware *img;
@@ -583,7 +582,7 @@ static int catpt_load_image(struct catpt_dev *cdev, struct dma_chan *chan,
 		return ret;
 
 	fw = (struct catpt_fw_hdr *)img->data;
-	if (strncmp(fw->signature, signature, FW_SIGNATURE_SIZE)) {
+	if (strncmp(fw->signature, FW_SIGNATURE, FW_SIGNATURE_SIZE)) {
 		dev_err(cdev->dev, "firmware signature mismatch\n");
 		ret = -EINVAL;
 		goto release_fw;
@@ -617,8 +616,7 @@ static int catpt_load_images(struct catpt_dev *cdev, bool restore)
 	if (IS_ERR(chan))
 		return PTR_ERR(chan);
 
-	ret = catpt_load_image(cdev, chan, cdev->spec->fw_name,
-			       FW_SIGNATURE, restore);
+	ret = catpt_load_image(cdev, chan, cdev->spec->fw_name, restore);
 	if (ret)
 		goto release_dma_chan;
 
-- 
2.34.1

