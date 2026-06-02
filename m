Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92D13BB132
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 08:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387976; cv=none; b=fqFDPZTHj15yzrOD46CZ1JZYLZiDNDioXadFIhzrce4nGSLgo9C3whZHNtLWvGSK9XN6apEt+e36f7WWU+KkEdPOa2ginwtZKE9EpfznR9bGiMVeJo/ePes/GAldA0fJ6NqAPzZmPqB9Y3xQwWDZH7nEnU9Go0l8pM96fRTViJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387976; c=relaxed/simple;
	bh=Bcc9zTnbqHeIxFprFFQRXchkx5uS0HN1dij9lD8ZZBE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nAwEGq5Po+g40qEl3+JNHobPURaKq7HzWYM5Aqybp73nm8CrGlDP67p7ypRYe6GZMF3V4zmSJp1e7NZfburCE1jNtsnZ4IDhKyf59agQw4EdR/hNi8fbvarF3WeCtsp9ZG4LQxNHH+C8d0Av5CNgYeaQY7ftFzGRR4+vsHuZz50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ColgogI3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ColgogI3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780387975; x=1811923975;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bcc9zTnbqHeIxFprFFQRXchkx5uS0HN1dij9lD8ZZBE=;
  b=ColgogI3j+Thc0BT/1XyRoIAAGiXz7iuXrkXNG1dhk994LIo8SIdB9i/
   TAUEwjQ11VFkVyHCsiMNTpvExW/C0m01z7aOOujLq5V1NIKp3C8b4P4Qj
   eMZKa1StJp7vFX3TK6om7bTZ/+pONU1VhDmaODYQyohQUfChwGW9Jn7fn
   qI4gz/P86q4KLLBy84ByaZtpZXicVgXOHPvx8haa0/8U9+mLqbAs/oXVn
   i++cxZ2brhtSOCMtWE6+wDbNcaWQ5ssXgKQqGWXb2YbP/dKD+s2iUg/Km
   YoHL2oCmeSKeiOv0S1pnEZWZ3SNAmAGXtPA36dwkJJcuuslLaJ3Cr35TO
   Q==;
X-CSE-ConnectionGUID: roRL4jFHTyaKswuch+wK1g==
X-CSE-MsgGUID: t/DVFUdUTZiPieeVXu0Klg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="91742878"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="91742878"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:12:54 -0700
X-CSE-ConnectionGUID: 6Z/u1PsxSF2YMd7RbXVntQ==
X-CSE-MsgGUID: dQpSKyGWSoWlAl5S9GrkRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="243949929"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa007.jf.intel.com with ESMTP; 02 Jun 2026 01:12:53 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 1/7] ASoC: Intel: catpt: Utilize lock-guard helper
Date: Tue,  2 Jun 2026 10:13:44 +0200
Message-Id: <20260602081350.1752773-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602081350.1752773-1-cezary.rojewski@intel.com>
References: <20260602081350.1752773-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The lock-guard helps simplify the driver's code.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/dsp.c | 12 ++++--------
 sound/soc/intel/catpt/ipc.c | 10 ++--------
 2 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/sound/soc/intel/catpt/dsp.c b/sound/soc/intel/catpt/dsp.c
index 677f348909c8..b1865d10f995 100644
--- a/sound/soc/intel/catpt/dsp.c
+++ b/sound/soc/intel/catpt/dsp.c
@@ -5,6 +5,7 @@
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/devcoredump.h>
 #include <linux/dma-mapping.h>
 #include <linux/firmware.h>
@@ -256,17 +257,15 @@ static int catpt_dsp_select_lpclock(struct catpt_dev *cdev, bool lp, bool waiti)
 	u32 mask, reg, val;
 	int ret;
 
-	mutex_lock(&cdev->clk_mutex);
+	guard(mutex)(&cdev->clk_mutex);
 
 	val = lp ? CATPT_CS_LPCS : 0;
 	reg = catpt_readl_shim(cdev, CS1) & CATPT_CS_LPCS;
 	dev_dbg(cdev->dev, "LPCS [0x%08lx] 0x%08x -> 0x%08x",
 		CATPT_CS_LPCS, reg, val);
 
-	if (reg == val) {
-		mutex_unlock(&cdev->clk_mutex);
+	if (reg == val)
 		return 0;
-	}
 
 	if (waiti) {
 		/* wait for DSP to signal WAIT state */
@@ -276,10 +275,8 @@ static int catpt_dsp_select_lpclock(struct catpt_dev *cdev, bool lp, bool waiti)
 		if (ret) {
 			dev_warn(cdev->dev, "await WAITI timeout\n");
 			/* no signal - only high clock selection allowed */
-			if (lp) {
-				mutex_unlock(&cdev->clk_mutex);
+			if (lp)
 				return 0;
-			}
 		}
 	}
 
@@ -303,7 +300,6 @@ static int catpt_dsp_select_lpclock(struct catpt_dev *cdev, bool lp, bool waiti)
 	/* update PLL accordingly */
 	cdev->spec->pll_shutdown(cdev, lp);
 
-	mutex_unlock(&cdev->clk_mutex);
 	return 0;
 }
 
diff --git a/sound/soc/intel/catpt/ipc.c b/sound/soc/intel/catpt/ipc.c
index 225757e6a776..11238fc641a4 100644
--- a/sound/soc/intel/catpt/ipc.c
+++ b/sound/soc/intel/catpt/ipc.c
@@ -128,14 +128,8 @@ int catpt_dsp_send_msg_timeout(struct catpt_dev *cdev,
 			       struct catpt_ipc_msg request,
 			       struct catpt_ipc_msg *reply, int timeout, const char *name)
 {
-	struct catpt_ipc *ipc = &cdev->ipc;
-	int ret;
-
-	mutex_lock(&ipc->mutex);
-	ret = catpt_dsp_do_send_msg(cdev, request, reply, timeout, name);
-	mutex_unlock(&ipc->mutex);
-
-	return ret;
+	guard(mutex)(&cdev->ipc.mutex);
+	return catpt_dsp_do_send_msg(cdev, request, reply, timeout, name);
 }
 
 int catpt_dsp_send_msg(struct catpt_dev *cdev, struct catpt_ipc_msg request,
-- 
2.34.1

