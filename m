Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFC82D663B
	for <linux-sound@vger.kernel.org>; Thu,  9 Oct 2025 09:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760002842; cv=none; b=Ac5yM8+XsNL4zY9H/VqjcbHUgQxfVEJaq5bHGHZybCH/W7zSNZW7eSJU5J7DhZJvQeCGfd4tHYRXE1z7gCqSt9pHCvCL8LEYy9S0OFrX0z9s2hGeZB3OaCIkEN8rUsJXD8iAmAlwQF+QAzTQKUMuLWAsnGHSSfvBt9ddZQmz1lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760002842; c=relaxed/simple;
	bh=0soeWk+380Jn852hWFcK5qQ49qwx2u7SgSaXL/r2MuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jN95chfjpk/dxocB/E+CQhNNv730Za8ojfw/dKXgc/f2n29zpuwTjKa2HvH6mA9yOUEkKK6FQ81FVt3Tde37oMlJ2KvIQH515lSm+ddidk0N1+AGWhFvQ7RbYEQ+YwRIHRXwVFYLsjnsDQNdMdJHGzo7wAgo5E71tJPEWOVDMYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UOlL87IC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UOlL87IC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760002840; x=1791538840;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0soeWk+380Jn852hWFcK5qQ49qwx2u7SgSaXL/r2MuE=;
  b=UOlL87IC5sVEz96DN6+1ST1syPd0V7apAewnTKGrf2LxjVK3GOWLD3IH
   Aicv1NBUdEpsAa1SbeG287+Jnw7uGx3FmWEoGS72i00hetTB8dORRsPZ8
   oSr4GpLvO9USZs7J5koBb3UWMWFvRw/8qVtFFblm3NPO7rwGmRdC9jt4t
   hEZc4FVbna1d71mIDFl9fni0i34xEQnZjcwLKrdCRdLORnlgc7Q3XJMfz
   0LLPLvZgUZEAf9e7p5ttz426i9LT8UPHgXLOSB95vgk1jGsjtm5tQKi5H
   dXxJY+keHKF/1LX5qHKsW8tYA/DCBR1VWIEz85lpqQ/x9v8sn7SXKydjm
   A==;
X-CSE-ConnectionGUID: xRxNGvueTs651UGBAroScg==
X-CSE-MsgGUID: ZquOgJuOQyaQasdbR/qnYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62113225"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="62113225"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 02:40:39 -0700
X-CSE-ConnectionGUID: q7cfBG8CTo6QbTsu61Oo5w==
X-CSE-MsgGUID: YvFKPX1rSP2o+hKZp4GGgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="181437970"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 02:40:38 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 4/9] ASoC: Intel: export sof_sdw_get_tplg_files
Date: Thu,  9 Oct 2025 17:40:18 +0800
Message-ID: <20251009094023.3474895-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009094023.3474895-1-yung-chuan.liao@linux.intel.com>
References: <20251009094023.3474895-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sof_sdw_get_tplg_files function is a callback of snd_soc_acpi_mach.
Export it to allow other modules to use it.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Simon Trimmer <simont@opensource.cirrus.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/intel/common/sof-function-topology-lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/sof-function-topology-lib.c b/sound/soc/intel/common/sof-function-topology-lib.c
index 3cc81dcf047e..f685c1c5c6f0 100644
--- a/sound/soc/intel/common/sof-function-topology-lib.c
+++ b/sound/soc/intel/common/sof-function-topology-lib.c
@@ -133,4 +133,4 @@ int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
 
 	return tplg_num;
 }
-
+EXPORT_SYMBOL_GPL(sof_sdw_get_tplg_files);
-- 
2.43.0

