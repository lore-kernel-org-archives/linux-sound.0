Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA21F3A6405
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 08:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477015; cv=none; b=Y6X4Z8j7rmhTtIWmEBbLDFOpLR3qFRhcBDe393VciN1aFJFpGx8dQb1Dcc2ZQ3vjuU5TG9JSalMG3c0WfpMn2Jq2U239e4vzjrkUykC5Rxf1JF9oPjiW0313Pzriz5Sm8f8qNeeqkGnxbhH89v5SUryrG3O7sbmpgoT0xG8fbY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477015; c=relaxed/simple;
	bh=OHrRjaP4e28PSmQ8DYNFUhotmiI1coO4kKDETiN32SE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eWI1uaUrXSrWUi44m8jwKSIWOK/uzV9j4n/FQX9cKqmmIFACIYqo0mKBayNvFjHi8WQ+2G3HPxPZy8OQnFFG/mA+2eAaZAl2Y3btrPewD5CT6cLh5Y0MoCR+E8P07+zuSh/SzZ3VfrONlZgAEA8oz+8eg6eBRRcDAIYCxKFFiow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0QAYhwl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0QAYhwl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477014; x=1812013014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OHrRjaP4e28PSmQ8DYNFUhotmiI1coO4kKDETiN32SE=;
  b=Z0QAYhwlAXqW/Klc3ar8PY0SXtH6hm2kw36wsWwZg9NCfvdOYxKLbuzL
   Lp/lEffkCp0PM4gcd8R1oPNg8nx641eEgdtA20RgcYVbGA0m1F2D1ay3c
   N4scGokHPlhv/h2a5g4UfLUui7XWOB9pgZkXNn4R6K1h2O4pga6kNcZ+a
   camqnfx6XnwDZ7tkcfRzBF8u76Nx4CtcWkV/70CmyfHWr4YZFuNmqXte8
   5ajgzw0Dfds4PIN4y4BxuTBlPzp7mXEQuD7mXjl0PkS6wkjALQTplc76q
   /D1InvAnlHmiJcxYxnq1pEBpzyrw09UcZqFd08SOtb8L0Q/OBNqi8A4Jk
   w==;
X-CSE-ConnectionGUID: aD+pdY05Q6WDj3HvZcn8FA==
X-CSE-MsgGUID: 6wtiFuknQICXV9IHWPZh7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81182123"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81182123"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 01:56:54 -0700
X-CSE-ConnectionGUID: pYxCZZzgS8SUFdMJ3eUwfQ==
X-CSE-MsgGUID: yfSI/BDpTBG3/R6dMXhtDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="248109314"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 03 Jun 2026 01:56:52 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 1/7] ASoC: Intel: catpt: Utilize lock-guard helper
Date: Wed,  3 Jun 2026 10:58:21 +0200
Message-Id: <20260603085827.1964796-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260603085827.1964796-1-cezary.rojewski@intel.com>
References: <20260603085827.1964796-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The lock-guard helps simplify the driver's code.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/dsp.c | 12 ++++--------
 sound/soc/intel/catpt/ipc.c |  9 ++-------
 2 files changed, 6 insertions(+), 15 deletions(-)

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
index 225757e6a776..8092944d6cb7 100644
--- a/sound/soc/intel/catpt/ipc.c
+++ b/sound/soc/intel/catpt/ipc.c
@@ -128,14 +128,9 @@ int catpt_dsp_send_msg_timeout(struct catpt_dev *cdev,
 			       struct catpt_ipc_msg request,
 			       struct catpt_ipc_msg *reply, int timeout, const char *name)
 {
-	struct catpt_ipc *ipc = &cdev->ipc;
-	int ret;
+	guard(mutex)(&cdev->ipc.mutex);
 
-	mutex_lock(&ipc->mutex);
-	ret = catpt_dsp_do_send_msg(cdev, request, reply, timeout, name);
-	mutex_unlock(&ipc->mutex);
-
-	return ret;
+	return catpt_dsp_do_send_msg(cdev, request, reply, timeout, name);
 }
 
 int catpt_dsp_send_msg(struct catpt_dev *cdev, struct catpt_ipc_msg request,
-- 
2.34.1

