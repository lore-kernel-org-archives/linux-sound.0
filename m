Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1BB38E5E2
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 08:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770193095; cv=none; b=jc/6Qv0G23eDMLKFxkfgZsYSyxTpoyvVluhNdz1MjQyrNl+SJiJJ2+vTX0yTQtjzzhqMgP6XE+s0US7pGOOiA8Dim6GhE4erL84uP+S+pefMhOrCWJr1+p3FC1WTyG+kaYWSq23YEDPhGvm93+K5Eo9eZ3g/KLdlaKQIuAvWnw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770193095; c=relaxed/simple;
	bh=jfGwgWQIT/5WHh8m7yi9ctQJVPT/uDR0LVYbrlQ5Z4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PBfb8qbrWeSfj7Q0uoHTHoAEntm3baD/6WjTEgLwoybwr4Njje3kFOKYTRuKmeonJUPJb2IvslgKRNLo7qY68rhAGEHVnapksMXyflXg417NIQ90in0XhWsep2a2ZwF9DKEDznRq5dYjrPp/VY1GlfSzuN0GRqgKJRfPDNQvTe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KsPX19YT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KsPX19YT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770193096; x=1801729096;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jfGwgWQIT/5WHh8m7yi9ctQJVPT/uDR0LVYbrlQ5Z4E=;
  b=KsPX19YTJgxQP4jnKVerHUY/AaPg8UFeqs+rKRR/V3+XiIfX9AyNpLWN
   lKodCxNqfNbHZJ+EvwHg5lsIqEc3anXzsZ5IDrfWiXG2Vs8zlr2DiIaSp
   NbiLRkWoiiQAuKF1QEYobdsxrwDMw/H8kle26KG2kbRCWcisgmoY79RgO
   4+U/dZ+sywLl9AhfpaKyhOrsHP9RUmStX9rYTAL+GeLMhL3XmjhlnsfBS
   S0Hoe9YZbW5A8s9yagZSTKuMjQKaS3/8urFbvpGXeWMvxji3H0WdycymE
   XcK4PnYj7zZanc04wq0cFqfJ8bdYfGkSSqNYAU7VrK4fI7O70kSvr/Yel
   Q==;
X-CSE-ConnectionGUID: xWfBQjleSfms3/OaUcX0CQ==
X-CSE-MsgGUID: dyjRDI7TQHGOGMDcyYLLUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="94028473"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="94028473"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:18:07 -0800
X-CSE-ConnectionGUID: bxvhaekzQV+T+3Fqf9HemQ==
X-CSE-MsgGUID: S+oQvu4NQdO0EX6q1D5hag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209893246"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.245])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:17:57 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com,
	mateuszx.redzynia@intel.com
Subject: [PATCH 03/10] uapi: sound: sof: tokens: Add missing token for KCPS
Date: Wed,  4 Feb 2026 10:18:26 +0200
Message-ID: <20260204081833.16630-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204081833.16630-1-peter.ujfalusi@linux.intel.com>
References: <20260204081833.16630-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Align with the firmware and add the missing token for pipeline kcps.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/uapi/sound/sof/tokens.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index 5fa8ab5088e0..a68381a263eb 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -56,6 +56,7 @@
 #define SOF_TKN_SCHED_LP_MODE			207
 #define SOF_TKN_SCHED_MEM_USAGE			208
 #define SOF_TKN_SCHED_USE_CHAIN_DMA		209
+#define SOF_TKN_SCHED_KCPS			210
 
 /* volume */
 #define SOF_TKN_VOLUME_RAMP_STEP_TYPE		250
-- 
2.52.0

