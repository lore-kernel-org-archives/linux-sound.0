Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850B639151A
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 06:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776060497; cv=none; b=CbSUPyzgt4YO4PUJ2uOU1hgRX+l/6QnUvkQc1aatbQobfsnuwmaLEfVC9ULwGDA/ByZgzx1Ywl/3F1QAef4xNevAiN8c12hguNWqkeZiCFySqEdftt4JzWQfHFaLxjqG6E/JcO9w5g0dWmZ7nTQQXkYhzxS4EmkXOWnmK5/bq0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776060497; c=relaxed/simple;
	bh=wRAao6XBM3eQkoXRKMG5HeCQzZxYj68O+Ca6jLXJr5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vEYW7oWYLUYk+dSy3tryDyY3wK20nAz7Npt+fKQ44EwbLNpirkqKy+eItQCEir0G0nGG0grpVAsm0Zuf7G5TPoO4Wv1tvhe+ajZOEWR2HOkw3+geWr1OwOO8bKlMYsXDN3SWD282i9GPKdvt0yBU+nKtE9um1VmJtUutnYOl99A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLFBLPSn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLFBLPSn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776060496; x=1807596496;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wRAao6XBM3eQkoXRKMG5HeCQzZxYj68O+Ca6jLXJr5Y=;
  b=jLFBLPSnfDT6tEWwkxVt28HJfnIpaHJHXGH0gqtGke9kLz9Z3HTiQoP+
   T/a14uClheffyKGuWx3e5UdgxEr8+BOdyx+aNTjO0S1JRYiiO3qrMEumt
   WArSQvmxd3w52QTZTR776XhUjInmE/NuB6tVEBIbGWjncGJGBkQxxlsQJ
   KVNIWTZ60AoWZLWo5hGtqMvMvCMH0NSSw9E9C3vh2pbxmbkd5bkRDe8Sy
   uvOVTIJQzTUohhodfps/4yq/Xtjn0FI4zH67LOVWpB1290xvI+H/xXHMG
   aMmOmf+MJPOp7VUM/2V+fGE1xmUaW4hWRT9uqP0bdh7B8X529OhmLZ29r
   Q==;
X-CSE-ConnectionGUID: O+nFlxr7ThCu/V/6g3i9fA==
X-CSE-MsgGUID: 4pjnTPLlRbeXqJWMjGC83Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="64517606"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="64517606"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 23:08:15 -0700
X-CSE-ConnectionGUID: M7bhxbrXTM2C8/5+3TgVZw==
X-CSE-MsgGUID: rVpyE3fSSI+Y5eTHkxgeog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="231415216"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 23:08:14 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 2/2] ASoC: SOF: Intel: NVL-S: add platform name
Date: Mon, 13 Apr 2026 14:08:00 +0800
Message-ID: <20260413060800.3156425-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413060800.3156425-1-yung-chuan.liao@linux.intel.com>
References: <20260413060800.3156425-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The platform name will be used in the topology name.

Fixes: d3df422f66e8a ("ASoC: SOF: Intel: add initial support for NVL-S")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/nvl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/nvl.c b/sound/soc/sof/intel/nvl.c
index 0ee3507824e5..86d2e1aa0eec 100644
--- a/sound/soc/sof/intel/nvl.c
+++ b/sound/soc/sof/intel/nvl.c
@@ -73,6 +73,7 @@ const struct sof_intel_dsp_desc nvl_s_chip_info = {
 	.power_down_dsp = mtl_power_down_dsp,
 	.disable_interrupts = lnl_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_ACE_4_0,
+	.platform = "nvl",
 };
 
 MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_MTL");
-- 
2.43.0

