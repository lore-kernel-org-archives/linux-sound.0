Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6686F099
	for <linux-sound@vger.kernel.org>; Fri, 30 May 2025 13:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613242; cv=none; b=lZOg1jtETfcG480ELHG3Pa+zjinAJshljJvMkKJD6h34Mg3vRad+/p0eRtQJj+3DDJ2d7FGamC+18y7Czm1Y2R4us+C9MLzqPrIYc5Dq9QdmZbK3xaWGN49QLt/R7f91l1N66bEdNphqh/vCCmion5orD5q+qa8gAtWgwcm8Qdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613242; c=relaxed/simple;
	bh=L48kn9rDpiGXUHNu2wYZnkkOE8MGXuQLdMgUVZDeiZE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=byc+B26c8zK69LdL5weDuF1z+cxYiK6mCfOsfqje0tzwKeA1X3PFh3KwHZuP6ww1ohGC0N2LyNzdJfFtcg9/TxLGXb0Q2NVm3N9d/XWPn3CyLrteLC334M07lIWPMszF08F4Do0hGpPwSTE2jHCm2CmBJplI0N5Z3K0oZqcx+7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QyqA0SJ9; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QyqA0SJ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748613240; x=1780149240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L48kn9rDpiGXUHNu2wYZnkkOE8MGXuQLdMgUVZDeiZE=;
  b=QyqA0SJ9ykATJOJbl2kIEru6fPW/DH1C0E1+l7DwBQJsPQIWa1mwBupK
   /Ob7G+xtRbckQ9pCv557PcMNF8tFwQION8J8CkqjB8pBhwijyxFZxBEiG
   ZIr3Gwe+o9HGVrrD8VG3d/eXjABVtB0g1OQqvLcFAuUOrkF+5T3gFo+FL
   WmNkBE8pmQnFuJS0AB8EyQg+fNpJ7wW+hl5KYq0wlUeROcI+dYU/RoCE/
   Bo2AEDxxHiVC2BUHZBOo930R00JWCniFjSEwaecQ17OLtcJrPUTbwXUPt
   uYKNQ+aMfnjkiU6tD5mU+nyHI5nKhMxi8W7b6z2m+yVhG+PoMwXBMwKwQ
   g==;
X-CSE-ConnectionGUID: mpVK5SzkQQ+1u61s3KNuhw==
X-CSE-MsgGUID: 6EO49CQoRE+gre9/WXaFRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="68256174"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="68256174"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 06:53:59 -0700
X-CSE-ConnectionGUID: 8FbF9ZirSi20aO1scChzrA==
X-CSE-MsgGUID: H/NL8xYrSrqxLFY78TQUlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="174763336"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 30 May 2025 06:53:58 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/9] ASoC: Intel: avs: Fix deadlock when the failing IPC is SET_D0IX
Date: Fri, 30 May 2025 16:10:18 +0200
Message-Id: <20250530141025.2942936-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250530141025.2942936-1-cezary.rojewski@intel.com>
References: <20250530141025.2942936-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The procedure handling IPC timeouts and EXCEPTION_CAUGHT notification
shall cancel any D0IX work before proceeding with DSP recovery. If
SET_D0IX called from delayed_work is the failing IPC the procedure will
deadlock. Conditionally skip cancelling the work to fix that.

Fixes: 335c4cbd201d ("ASoC: Intel: avs: D0ix power state support")
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/ipc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index 08ed9d96738a..0314f9d4ea5f 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -169,7 +169,9 @@ static void avs_dsp_exception_caught(struct avs_dev *adev, union avs_notify_msg
 
 	dev_crit(adev->dev, "communication severed, rebooting dsp..\n");
 
-	cancel_delayed_work_sync(&ipc->d0ix_work);
+	/* Avoid deadlock as the exception may be the response to SET_D0IX. */
+	if (current_work() != &ipc->d0ix_work.work)
+		cancel_delayed_work_sync(&ipc->d0ix_work);
 	ipc->in_d0ix = false;
 	/* Re-enabled on recovery completion. */
 	pm_runtime_disable(adev->dev);
-- 
2.25.1

