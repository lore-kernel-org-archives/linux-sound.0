Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3655B35029B
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 11:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768217512; cv=none; b=oO/WCdDMNU3+GjePoqmw05Gbu4To86BxuV5QjamvxBpQWz3bX8uFYj5+Xua+9ZAweKs5FfbPEFFkPZ+I97KZlbGx89YoVoe3U+OUyVPU01ZUKc72hm37B6lrkJ1Dr6RWr84ELpDLfbMj+7lSxwSyL818SdoGfeEwOZFU3O4g/+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768217512; c=relaxed/simple;
	bh=nYRbS8j7p9bJpIeZROvFIkB6mXECIrTigUvyk8HWIrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z0h3RqbVVPt62bnh1jMDbV4prCIeoFKgFjGPXEBBUhtgBAlCvtLxpRU6Sbd5Jpy+LVpeLjTC4yaalEcHMaHcvxDbTe8zaYvRqFtiDy9YYXSOnd6877dId8OBREAQRnvfqG4HPtrcUM0lF8GUe6zBn0h3Si2QYScpE9fKFOmIyFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TuCRsCck; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TuCRsCck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768217510; x=1799753510;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nYRbS8j7p9bJpIeZROvFIkB6mXECIrTigUvyk8HWIrI=;
  b=TuCRsCckb+j1Uqo74847+G25JR1bLXpMrKioHni3hvR+Dit/9u3WFYZR
   2b1mP6Z9d1ymfdN1+RyBDiLmFV5OiWbcj8BWINbFNv/ozDBT/jL7s81mA
   Oyy8DHY0MJFQ7RnsEHc+hQkBiD9SNUCrCYRSmDS7rtuf+s8+cVP0VLa9p
   NGHAgTpJFU/vqkJzdAlr1JRinKm/ud5bQNelRtY4s+GI44bAkRIa/5UOS
   lCLpj/2wO/09nGCD3tAhok47w8VGgYR9c1lwzqJ86awfL0evHtKEy37Zf
   uhaTx5DEeyZRCeCy6BUykYh8vj+TRLvgairbGgUbgRyxd35NkZkr0pTp/
   g==;
X-CSE-ConnectionGUID: ghbaTkfBRhi0Qswmu8dY6Q==
X-CSE-MsgGUID: EB7N51RaTMihRkpTe8Qukw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69539740"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69539740"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 03:31:49 -0800
X-CSE-ConnectionGUID: sBSf197QQgmGxRju8+uP+A==
X-CSE-MsgGUID: gI7NroLoTYexApDgCr09oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203224321"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.204])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 03:31:46 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	guennadi.liakhovetski@linux.intel.com,
	jyri.sarha@linux.intel.com
Subject: [PATCH 1/4] ASoC: sof: ipc4-topology: Add topology tokens domain_in stack & heap_bytes
Date: Mon, 12 Jan 2026 13:32:18 +0200
Message-ID: <20260112113221.4442-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112113221.4442-1-peter.ujfalusi@linux.intel.com>
References: <20260112113221.4442-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jyri Sarha <jyri.sarha@linux.intel.com>

Add topology tokens for defining user-space domain_id, required stack
and heap size byte for a component. The new topology tokens are
SOF_TKN_COMP_DOMAIN_ID, SOF_TKN_COMP_HEAP_BYTES_REQUIREMENT and
SOF_TKN_COMP_STACK_BYTES_REQUIREMENT for defining required stack and
heap size for a component.

Signed-off-by: Jyri Sarha <jyri.sarha@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/uapi/sound/sof/tokens.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index 9ce72fbd6f11..5fa8ab5088e0 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -107,6 +107,9 @@
 #define SOF_TKN_COMP_NO_WNAME_IN_KCONTROL_NAME	417
 
 #define SOF_TKN_COMP_SCHED_DOMAIN		418
+#define SOF_TKN_COMP_DOMAIN_ID			419
+#define SOF_TKN_COMP_HEAP_BYTES_REQUIREMENT	420
+#define SOF_TKN_COMP_STACK_BYTES_REQUIREMENT	421
 
 /* SSP */
 #define SOF_TKN_INTEL_SSP_CLKS_CONTROL		500
-- 
2.52.0

