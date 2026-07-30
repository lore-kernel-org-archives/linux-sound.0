Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222BE3B6C14
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 10:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785408074; cv=none; b=LRLx/t3bFzM12VW4t/RkyrGM1y7TZuiw0p2xslEXdPJu7x2hR2NlD8pNILxu/tOPn1ekUeI6o3qflyunUrHTryl8pGvatShGgR00GUDGRcdBnhHSdGRKRCg1CJecfeDISEZVe73gDnDQzq+64RGWHoPgj2Q8nJixtC6JVa3AHjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785408074; c=relaxed/simple;
	bh=b9tKM6LOZpc0Z/425Z4j70DCr9hw09bguO3YjbBivsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e91n015ZLKJa8P1FfeEeRBVOf5cgti4oUqS2RWy+57qkDLAyfr2jRTuVBWGn2JX/oAZ++pZCScIcmr9EtYecz/kTfQFJLSSVXeBolfTKunXCQTrv3whTEeqvOvOiDZ/8uNRIbG/cykccErRmE2OsUOZgsEQctISF42JSl/qID3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VHTOSrjy; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VHTOSrjy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785408073; x=1816944073;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b9tKM6LOZpc0Z/425Z4j70DCr9hw09bguO3YjbBivsk=;
  b=VHTOSrjyMZjH/q3Zg27RKJcd8NynFd0lsxjo3iDnrgY9x2Iw5S2EaU1r
   3jocwDIoPgP1FPzu5bm+jKnuk25aKZ3Y31sHVRO4zZE2JD72I8r7LIntH
   J05NrCHjG6KKoZ37iTSc31HNtIV9YhWqEsgjuUIMz68SlGfuwOSGWI7Bz
   ePG6aNroqfd5fJrVaNVcV8TIHyoy91H+ZsBzHWUmEEUO55+KV/iks3Ur1
   2HHzgezDEdyjJfIFwigCMzQ2m72LNKaA74AsX9aqfL0ZgWL3TOvA2d/XB
   Clw1Lli0Ncx6jTARl0Qr847ANBTsQOsAOVJVuTMWQCstv88qAxYsFSiur
   A==;
X-CSE-ConnectionGUID: JgZqNqmESfiNBAhF+ik6YA==
X-CSE-MsgGUID: UztJMKh9Q9uuX9IERyxiCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108817766"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="108817766"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 03:41:12 -0700
X-CSE-ConnectionGUID: Tv/fZPRnQlqJlOaTP/Vf1Q==
X-CSE-MsgGUID: QVmBobGsSO63d72P4JKtWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="262221311"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.79])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 03:41:10 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	jyri.sarha@linux.intel.com
Subject: [PATCH 2/6] ASoC: SOF: ipc4-topology: Fix SOF_TKN_COMP_STACK_BYTES_REQUIREMENT id
Date: Thu, 30 Jul 2026 13:41:37 +0300
Message-ID: <20260730104141.14817-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730104141.14817-1-peter.ujfalusi@linux.intel.com>
References: <20260730104141.14817-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jyri Sarha <jyri.sarha@linux.intel.com>

The was inconsistency with SOF_TKN_COMP_STACK_BYTES_REQUIREMENT and
SOF_TKN_COMP_HEAP_BYTES_REQUIREMENT token ids in the Linux driver code
with SOF FW topology code. This commit fixes the Linux side to match
tools/topology/topology2/include/common/tokens.conf

Link: https://github.com/thesofproject/sof/blob/main/tools/topology/topology2/include/common/tokens.conf#L30
Signed-off-by: Jyri Sarha <jyri.sarha@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/uapi/sound/sof/tokens.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index cc694a397987..d42adbef0478 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -111,8 +111,8 @@
 
 #define SOF_TKN_COMP_SCHED_DOMAIN		418
 #define SOF_TKN_COMP_DOMAIN_ID			419
-#define SOF_TKN_COMP_HEAP_BYTES_REQUIREMENT	420
-#define SOF_TKN_COMP_STACK_BYTES_REQUIREMENT	421
+#define SOF_TKN_COMP_STACK_BYTES_REQUIREMENT	420
+#define SOF_TKN_COMP_HEAP_BYTES_REQUIREMENT	421
 
 /* SSP */
 #define SOF_TKN_INTEL_SSP_CLKS_CONTROL		500
-- 
2.55.0

