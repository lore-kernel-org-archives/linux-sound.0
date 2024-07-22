Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B091714A90
	for <linux-sound@vger.kernel.org>; Mon, 22 Jul 2024 08:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721637019; cv=none; b=fGg/BFks/EPku1gRmAVE8kShbXa2Ahtby7Ac8QTNj+k2tvfnjWJR7r0pau8lAfc8oMzHBSFh5jT3MBjU3Rz8JstwqpSWXLkvrJvzulo6a0nbWgVCgW5YA5UCETogTyAUm6eKuMZrfdybVShAUEnkdRjBY0FqR4nWAULU5oGPXNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721637019; c=relaxed/simple;
	bh=sNxor0rL/zyQgFc1ihPqOWgxV/sr0J968WghxDq+t1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OsCcl6JfqRrxyShytOtZHW2ViGQdYz6IydZbAqkddDTm0wAsFLxadhbDB5a01JyYtwyzniUOJs1aRHmdyLydTd0jIejBSfvbm1OUviy8IjoYGAOvZlwRjcIEPyli5Y6ClLHGeh3rv+jxufIQ3f1GNDzb+jxTMvfjbP0+M3k3bu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W1jSPEoU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W1jSPEoU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721637017; x=1753173017;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sNxor0rL/zyQgFc1ihPqOWgxV/sr0J968WghxDq+t1Q=;
  b=W1jSPEoUAGgY56Sn/3ntFO0xhN3bvCSOT/+26/F+0N/j0f+N1BnPqEND
   Gw7d3+00brXDJUx0/UQ6HpFWcpLzlRzmbcvqOVEXmUGR5FqQNBuWe4rqR
   wyyNN2TfJrc2rIvZclQ0JYZ5KIcezc/OIGCOPxcDSscqwgJJGSywD2DF4
   hXZhGZ5WA5oeZc3509O9sDbNDtZxcse82GuK35krRdFcjFTJ9yDyOfqPD
   5rqf6iTTK+xThrMQsemfC/qnu/4ikDNQ9yMELAqgQZ7fu/V+fexOACw7t
   HMhGXWewhOTA4UX6iVW8oqTw5scLP38YRI/lwYbMEMBT1Vq69PbWHrIeU
   A==;
X-CSE-ConnectionGUID: hjpmHnWSTGesKp+DzPTQ9w==
X-CSE-MsgGUID: HQATS1Y3SwuJk2ApNrpu7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="19320851"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="19320851"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 01:30:17 -0700
X-CSE-ConnectionGUID: 4iWpr9BbT6+aRBLbPY9l5Q==
X-CSE-MsgGUID: PoaYMgEbSUacfhmV5SKc9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="82453834"
Received: from ettammin-desk.ger.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.245.246.242])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 01:30:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	kernel test robot <lkp@intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH] ASoC: Intel: use soc_intel_is_byt_cr() only when IOSF_MBI is reachable
Date: Mon, 22 Jul 2024 10:30:02 +0200
Message-ID: <20240722083002.10800-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

the Intel kbuild bot reports a link failure when IOSF_MBI is built-in
but the Merrifield driver is configured as a module. The
soc-intel-quirks.h is included for Merrifield platforms, but IOSF_MBI
is not selected for that platform.

ld.lld: error: undefined symbol: iosf_mbi_read
>>> referenced by atom.c
>>>               sound/soc/sof/intel/atom.o:(atom_machine_select) in archive vmlinux.a

This patch forces the use of the fallback static inline when IOSF_MBI is not reachable.

Fixes: 536cfd2f375d ("ASoC: Intel: use common helpers to detect CPUs")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407160704.zpdhJ8da-lkp@intel.com/
Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/common/soc-intel-quirks.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/soc-intel-quirks.h b/sound/soc/intel/common/soc-intel-quirks.h
index de4e550c5b34..42bd51456b94 100644
--- a/sound/soc/intel/common/soc-intel-quirks.h
+++ b/sound/soc/intel/common/soc-intel-quirks.h
@@ -11,7 +11,7 @@
 
 #include <linux/platform_data/x86/soc.h>
 
-#if IS_ENABLED(CONFIG_X86)
+#if IS_REACHABLE(CONFIG_IOSF_MBI)
 
 #include <linux/dmi.h>
 #include <asm/iosf_mbi.h>
-- 
2.43.0

