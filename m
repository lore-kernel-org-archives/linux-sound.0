Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDB340096C
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 10:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785408081; cv=none; b=FzED9VZ5rB+KIebN3vVGn/9f6eDN2fN/LYU96G31jYtRb2y+dq7fSLSjhC6sH3oqTpvgUpYx3m+is0nf/HFmA92p4EuU7t4kga6i5x0l2n8eElVGplgLOAWei2ighPhEcZHiShOqbZRzhcY5GvsrxLtAGNkToMolJXi3FwtNEGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785408081; c=relaxed/simple;
	bh=FaO0fofV5ZyUBqAmoIoqYHzMOnpVJIi/vQU+ixQCOa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kb4XhUZO1rA7GShQYbFwk7Z5J1StO5++X8i0TKUXSlas/onqILHu72+kiiuqL56O9yHqdyop1lBePw1eicddnYcfSLUQwq85n/sHxvs6t5x0AwadXl3X01qpQ43nqi5CvkHNptXRMF8m5wj6rXPC/T2kTp6NVaNZ3WuwFu8oDq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bcKWJ1EL; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bcKWJ1EL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785408080; x=1816944080;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FaO0fofV5ZyUBqAmoIoqYHzMOnpVJIi/vQU+ixQCOa0=;
  b=bcKWJ1EL78+6HRhzg4DKNoz3/1Mmi0cSOiQnYIz4k55pr54f8aeQwnWM
   CUelb0Ct86947I2BON+T+iqLJohI0isetTxvIl5E+wiILbPS0vlBkZcC2
   OrZGFP6LoHUmzZh+HnCJZiw7JxtcIPTmQyK44wedON6ss5HWDmgkZ3wMg
   nFBQ3B//MVbdJ4n1fmks7yP7K5dxZTiBOiQqcZz1JrKApSRonItQxCKdo
   e3nU/hd8S0/ENil38KJy6APCynj5TDLFu9ohmEAGjvfVbtmM+hQEm8V3x
   mA7LOvJGQqxjwnL0dixNtpd2zyOFEW17RDnJb3i5gw4gwt/awHpRf3Bbi
   Q==;
X-CSE-ConnectionGUID: 1kjP5/vpRxa84iByidp6Kw==
X-CSE-MsgGUID: n3Jz8Hd5RpiIy34FVRe7vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108817796"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="108817796"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 03:41:20 -0700
X-CSE-ConnectionGUID: v5b/ar++QYuw5KsUS8t0cA==
X-CSE-MsgGUID: zy2eTc+cRp2OVpuvbUteyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="262221321"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.79])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 03:41:17 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	jyri.sarha@linux.intel.com
Subject: [PATCH 5/6] ASoC: SOF: ipc4-topology: Fix sof_ipc4_mod_init_ext_dp_memory_data comments
Date: Thu, 30 Jul 2026 13:41:40 +0300
Message-ID: <20260730104141.14817-6-peter.ujfalusi@linux.intel.com>
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

Fix a copy-paste error in struct sof_ipc4_mod_init_ext_dp_memory_data
datamember comments. And while at it, drop the overly specific notes
on the datamember values. The values are coming from topology and
and what to do with them is decided in SOF FW. Its a bad idea to try
to document their meaning in detail here. The Linux driver is only
passing the values.

Signed-off-by: Jyri Sarha <jyri.sarha@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/sof/ipc4/header.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
index 6fbf62c4075c..b49a74007bd7 100644
--- a/include/sound/sof/ipc4/header.h
+++ b/include/sound/sof/ipc4/header.h
@@ -660,9 +660,9 @@ enum sof_ipc4_mod_init_ext_obj_id {
 
 /* DP module memory configuration data object for object array */
 struct sof_ipc4_mod_init_ext_dp_memory_data {
-	u32 domain_id;		/* userspace domain ID */
-	u32 stack_bytes;	/* stack size in bytes, 0 means default size */
-	u32 heap_bytes;		/* stack size in bytes, 0 means default size */
+	u32 domain_id;			/* userspace domain ID */
+	u32 stack_bytes;		/* required stack size in bytes */
+	u32 heap_bytes;		/* required heap size in bytes */
 } __packed __aligned(4);
 
 /*
@@ -732,7 +732,7 @@ enum sof_ipc4_glb_pipe_ext_obj_id {
 struct sof_ipc4_glb_pipe_ext_obj_memory_data {
 	u32 domain_id;		/* userspace domain ID */
 	u32 stack_bytes;	/* stack size in bytes */
-	u32 heap_bytes;	/* heap size in bytes */
+	u32 heap_bytes;		/* heap size in bytes */
 } __packed __aligned(4);
 
 /** @}*/
-- 
2.55.0

