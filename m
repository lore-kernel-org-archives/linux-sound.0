Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB1122B584
	for <linux-sound@vger.kernel.org>; Fri, 30 May 2025 13:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613249; cv=none; b=oEc4k4WMWjZcAlIJVMyRuK/g50UlCGw8309zcA0BK3dXoDpvX+iZdd8xggFB/tOnn1FUi/fTNGWm/HuLGEfVj8T5kuT4wCN4riAMOFlDh8XRE/Oz9TOWXdrSBWmT7IXXg7Rbgm5bUZLKROeUD2aJJdI1tSTcEwa2Nx6FZ5IcGOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613249; c=relaxed/simple;
	bh=FqeUUitkoDUKB10lURjwr7bPiWjgJ+AGxpt0PijRICY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YaLog3hOzYAalBK5dSNwzzcxTh9Z/h+iA64M3BFUY6V+z6aA5A1eWcsofH2r9B7GiAa1koWymb325j7cIXlW5rPQC4pkZL01Z5TS5CdgkN4RIMsmGSbvK3rvmtmv1PNisnHcWuetP8u7vetk+0kbrzcBWB3CxvG96mKQmMLOh9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S5XOzhPR; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5XOzhPR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748613247; x=1780149247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FqeUUitkoDUKB10lURjwr7bPiWjgJ+AGxpt0PijRICY=;
  b=S5XOzhPRqUSnoQb4Ln6Vzw2xTUkOj7EfEMF8cftTjA0P5UiKt0+KZt0A
   9R+cFiOI4lxu7p8gE0RS9PjCJ1hTvgLbn2XINNGTywrdxE11sz6gr9t2T
   j6B0tUbAbkdNoWZ0zBh3z9Pp4joFhMWLeoHYD6jRhMb+epqpv89KkR6z/
   XHIO/BGND0jILlGqoCHankA0La+BBooERv07jgYtvZhYMBAM4upKinw4O
   Kgqe12ExdrunkOW2bFOV/5t/dhmcItW7eI6nrshuixjakw/e3UvLEP2sQ
   v2+ahIXZDDZW23sLTFQFizJRaFlf2VWBCrPTAbL6GSvKWMD7qB7hGJScY
   w==;
X-CSE-ConnectionGUID: ykgJww4wQd2s0StYa1ALzg==
X-CSE-MsgGUID: nfUwQEmVTO2ICTAOxVcExg==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="68256207"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="68256207"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 06:54:07 -0700
X-CSE-ConnectionGUID: kPSIxf8+SlaEFb2zLza0Uw==
X-CSE-MsgGUID: Ji9pKSs9T/qkOPXg5S3iuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="174763447"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 30 May 2025 06:54:06 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 7/9] ASoC: Intel: avs: Verify content returned by parse_int_array()
Date: Fri, 30 May 2025 16:10:23 +0200
Message-Id: <20250530141025.2942936-8-cezary.rojewski@intel.com>
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

The first element of the returned array stores its length. If it is 0,
any manipulation beyond the element at index 0 ends with null-ptr-deref.

Fixes: 5a565ba23abe ("ASoC: Intel: avs: Probing and firmware tracing over debugfs")
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/debugfs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/debugfs.c b/sound/soc/intel/avs/debugfs.c
index 8c4edda97f75..0e826ca20619 100644
--- a/sound/soc/intel/avs/debugfs.c
+++ b/sound/soc/intel/avs/debugfs.c
@@ -373,7 +373,10 @@ static ssize_t trace_control_write(struct file *file, const char __user *from, s
 		return ret;
 
 	num_elems = *array;
-	resource_mask = array[1];
+	if (!num_elems) {
+		ret = -EINVAL;
+		goto free_array;
+	}
 
 	/*
 	 * Disable if just resource mask is provided - no log priority flags.
@@ -381,6 +384,7 @@ static ssize_t trace_control_write(struct file *file, const char __user *from, s
 	 * Enable input format:   mask, prio1, .., prioN
 	 * Where 'N' equals number of bits set in the 'mask'.
 	 */
+	resource_mask = array[1];
 	if (num_elems == 1) {
 		ret = disable_logs(adev, resource_mask);
 	} else {
-- 
2.25.1

