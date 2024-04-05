Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BD61465B4
	for <linux-sound@vger.kernel.org>; Fri,  5 Apr 2024 09:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712308105; cv=none; b=SfDOUzDfl0s8q33WETxXEIG3klN9Bi2vBr2io7tX/b4RQrLQYs//EONyMd1rr/XNabPJ+AhNPiP3Nz34q6l93+JfTZUFINK0XG4eTl3za/h+xczEG/jvzbmUOJk3MZ/VkSwBCWOO2UAgxi6oPkGpJiGXrOtleOcBYGTyKtSb11s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712308105; c=relaxed/simple;
	bh=/l8JmGiEYsduQSPVUJfW308+QOvtWeS4SnQ3Hl92vdM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HHwThSarOLMC8ywFuUr3ZvLgyP0Ynml8jUl0sz3WTwYTBpGQIlNQr9vqdWlo0oylUO4t5z5bEtQQN/3QAl0gbJIYrPPcPFWMnpiasuStQ0cZHhDmeHG9Yv2pVracJzgr2Vo2JBctH9cueD4jHRS1AclUrwb6xUr/J4RdX9HXlxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XtFDBxBw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XtFDBxBw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712308104; x=1743844104;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/l8JmGiEYsduQSPVUJfW308+QOvtWeS4SnQ3Hl92vdM=;
  b=XtFDBxBwa4ZCdIuyJIC3gxICoTRbZFKFvNH7hAAMAP3G+xyy879vDw1s
   XvptNw6YjZHlEtZpIjnCRta+8N7/j7C67LVn4OULhCJ/kjwbT5y/8R+A+
   cwMD4X85DYJTk1nAMUdCvWvLSNX5e9nZehuFVunwp5LQz0FIXrbUlGefL
   hnJhk9NMQ7K0i5d7n9qG2NCI1GyGx9PEIJJUt/PPYKDnKfW/T4PSXoWap
   oePijTCvPltwZ9xvpj4M4dItkYqii+GWvGeqGMazoJaOypssqhPabeKJB
   oonNUR1ExYBT9xvmIZO5q2eYCzuAg/vbT6fW16vPN6jjfGaDCENGsC2TQ
   Q==;
X-CSE-ConnectionGUID: GqBetrxiTKuifzZ7bYk/XA==
X-CSE-MsgGUID: d1xBFx8RTsa1eEp1IYotdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7787466"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7787466"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 02:08:24 -0700
X-CSE-ConnectionGUID: nmem/xb6S6qGGj8tgyE1aQ==
X-CSE-MsgGUID: pV4bRyYsTg2Q8ULE1MHDGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19042443"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 02:08:22 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 09/13] ASoC: Intel: avs: Remove dead code
Date: Fri,  5 Apr 2024 11:09:25 +0200
Message-Id: <20240405090929.1184068-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405090929.1184068-1-cezary.rojewski@intel.com>
References: <20240405090929.1184068-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The result of list_next_entry()/list_last_entry() is never null.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/path.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 8dfd90587427..fa3fec339548 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -709,8 +709,6 @@ static int avs_path_pipeline_arm(struct avs_dev *adev,
 		/* bind current module to next module on list */
 		source = mod;
 		sink = list_next_entry(mod, node);
-		if (!source || !sink)
-			return -EINVAL;
 
 		ret = avs_ipc_bind(adev, source->module_id, source->instance_id,
 				   sink->module_id, sink->instance_id, 0, 0);
-- 
2.25.1

