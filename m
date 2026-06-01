Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3048437C918
	for <linux-sound@vger.kernel.org>; Mon,  1 Jun 2026 14:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780322937; cv=none; b=nNI54BHLp3eyitSE+/yQP2g+ShTPZwjsMXL/x9+F1ce7zzg2p/MaR9yJPTpa2h/SsiCZ5jM11zRkUqGgkynSOCA1q4iOMmpp4ZkW/Re5buNP6N6g1tbnIPdRljT22+/7t49C12eheP4vTeySRo2/bfp+4kqOy+pXmsfnWVdPOJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780322937; c=relaxed/simple;
	bh=Bcc9zTnbqHeIxFprFFQRXchkx5uS0HN1dij9lD8ZZBE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d0MvxKcoOGekarpMoAAfzr5cxW2w7XNO+W1Nn/49tzidm48d2Jowts9a20e7i75SrsBPhn4baMa6wo0GKJFpCb2Ezrqn7IpN/TCDOAm5i5c3/sWDlBbsTx82pJz4KpXrKqoZOy1jKmNYar3f/mDMuBk5xemHPx8bzwt7R3lbOGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MILKXF0/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MILKXF0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780322937; x=1811858937;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bcc9zTnbqHeIxFprFFQRXchkx5uS0HN1dij9lD8ZZBE=;
  b=MILKXF0/Z49f+vv4uiMAuNtD7b1InFv280fkGX3uCop2hq3oEKQIS3rR
   zZ4SHdcrZxMLKzcg+UZ819iOafDYitKtK4axOs7gCgt0+N0H1rk+YI6rX
   SlX47mH+JTam2/b+q3nBmlgiArv61bK+14m5z/nviQiUtAwRrVis5qsBA
   1vEBWQ27aE/JYDQgOyoAio4Z5vmdJ1NEbpdymL8gsjZClcv7TiR1yM54s
   hQt1ehqeJmNYZv3TCcsXT5yfxrmmNTDzBOgp8MFQkaRBk/Z8jQvalrz9D
   LBX2Zm9rw1+LPm3Avxu+VsI24ppp+736WsqGYfO9VOE4zZiKI6LQSiby0
   w==;
X-CSE-ConnectionGUID: h2Gh35aYQXuCCOXCL+PQqA==
X-CSE-MsgGUID: mEq7ORxmSMiLVZHdOnLL5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81140247"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81140247"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 07:08:56 -0700
X-CSE-ConnectionGUID: DWAY74WGQFup6LdSu4J2wA==
X-CSE-MsgGUID: KUnwZ0bqRHig4LdJSHs3vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="243704895"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa007.jf.intel.com with ESMTP; 01 Jun 2026 07:08:54 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/7] ASoC: Intel: catpt: Utilize lock-guard helper
Date: Mon,  1 Jun 2026 16:10:25 +0200
Message-Id: <20260601141031.1606847-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260601141031.1606847-1-cezary.rojewski@intel.com>
References: <20260601141031.1606847-1-cezary.rojewski@intel.com>
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

