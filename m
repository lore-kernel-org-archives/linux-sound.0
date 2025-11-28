Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD78E3002C8
	for <linux-sound@vger.kernel.org>; Fri, 28 Nov 2025 09:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764321242; cv=none; b=ONfJHJwmGx1oHbkdROAaKICfGi9sC0s1xldK/bz1vkGOSbujYjKbTT0B2wyVy8f4wzC1t5kDy8U2DFkkt0f/bNq01L6LOiEiinShSVvQSkwDWSvNXuFD9YI6dTQ82dQv2kBqg8Py/EifiYgGBEiD20nQj150AMdQuCr3K8HmRxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764321242; c=relaxed/simple;
	bh=tVxO59q21uRIyULfPN9UHVi25w0JLg5Y8enqJgH81Rg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MM++P6x9JOlxqi+86I+qA6eotu6sQH1YIZcZPl7BK6efbFW21A6ZW3lU1Cw6wfn34Mw15T5e1p/BC6XbtZpl747wQ5LCcerLqOZRuoeN78OBPhk1D0vX1Q70M/l3dOqZWnWokOpAl+PjAhqol1jBtj4bXqiAOAxmWZEFcbPrQ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JXP+15vg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JXP+15vg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764321238; x=1795857238;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tVxO59q21uRIyULfPN9UHVi25w0JLg5Y8enqJgH81Rg=;
  b=JXP+15vgoO9V4FCu4PCWiN6Ey0C8xrp7ZrCjcrjtvjev+AQ3a/rhXKo6
   PSloNZwe2zUm3O5Xy2XMOTc8P3hYxFjXP2M1apsK5On25JZej/Fqg6fCS
   dkHPoeHjqh9aMwAq0dgZ1ACXQDyzGJNIbPcmTeX1Wn/3AhEaJrTHMB643
   ZCIhO4wnmuSBC7ANaxfYKa621BL/45lzGodGOE56zkFxEoRBae8r4qCKK
   kdqFf9JdeL5LiUYmBFR9eh4cyYe7/JvvmTRr3ZY49d+6LYo0/bpDC12gx
   XfMCm3r6cVwVcGEFBcT7VaWpOkzihnyLkbCkuXOx7J2+UXK8onjqjTjkv
   w==;
X-CSE-ConnectionGUID: UsSl0E/GRdeS9x3V/qTcqg==
X-CSE-MsgGUID: NlKUOS5YTRyVGmc8RwNBow==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66428486"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66428486"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 01:13:53 -0800
X-CSE-ConnectionGUID: DWrRYAgXTnircCYleVxsBA==
X-CSE-MsgGUID: S2Sfnox5SDaYjteD+BA49g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="192680929"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 28 Nov 2025 01:13:50 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 2/6] ASoC: Intel: catpt: Fix probing order of driver components
Date: Fri, 28 Nov 2025 10:34:08 +0100
Message-Id: <20251128093412.3949374-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251128093412.3949374-1-cezary.rojewski@intel.com>
References: <20251128093412.3949374-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

catpt_dai_pcm_new() is called during the bring up sequence of the
machine board device which is a different device to the parent (DSP)
device yet utilizes pm_runtime_xxx() against it in order to send IPCs.
If the parent's pm_runtime is not configured before that happens,
errors will occur.

Fixes: 7a10b66a5df9 ("ASoC: Intel: catpt: Device driver lifecycle")
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/device.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index faa916f40069..eed330bc82b6 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -184,22 +184,25 @@ static int catpt_probe_components(struct catpt_dev *cdev)
 		goto err_boot_fw;
 	}
 
-	ret = catpt_register_board(cdev);
-	if (ret) {
-		dev_err(cdev->dev, "register board failed: %d\n", ret);
-		goto err_reg_board;
-	}
-
 	/* reflect actual ADSP state in pm_runtime */
 	pm_runtime_set_active(cdev->dev);
 
 	pm_runtime_set_autosuspend_delay(cdev->dev, 2000);
 	pm_runtime_use_autosuspend(cdev->dev);
 	pm_runtime_mark_last_busy(cdev->dev);
+	/* Enable PM before spawning child device. See catpt_dai_pcm_new(). */
 	pm_runtime_enable(cdev->dev);
+
+	ret = catpt_register_board(cdev);
+	if (ret) {
+		dev_err(cdev->dev, "register board failed: %d\n", ret);
+		goto err_reg_board;
+	}
+
 	return 0;
 
 err_reg_board:
+	pm_runtime_disable(cdev->dev);
 	snd_soc_unregister_component(cdev->dev);
 err_boot_fw:
 	catpt_dmac_remove(cdev);
-- 
2.25.1

