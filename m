Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA580216E1B
	for <linux-sound@vger.kernel.org>; Mon, 17 Feb 2025 10:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739786846; cv=none; b=TLUNIfNsSt6jAZ+t6c//a7RyVtVz3PTvPDR5pu4Tsxig3I81gQm03Hgr2Q5CjuoFDt8a6tNcZeiH57smMcoXEl+JlC4btS9DDqW0CY4UTXfurP0A36eXdxc/pLUxv41l1UsHJJKP8M0eGMZ/CfcGhsXJoGwtq/ZQBNVDFuY3CJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739786846; c=relaxed/simple;
	bh=Rqi4qyL2yKN31RE/eSo76dsJ5aumcqnHsfhCJBzsp4I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dlzl5RdYb9c9G/K0lDsTL+Uk4OOVY0y8+c2ueT6PFFvWwdP9N1eHmufBKroyfbkFldCYm+mpVd88Tc6ZYQc7L0ou60sbRoG49J47zmSDkkLjzBRcV6pdOQ8idzJ2YdLDBaq0RVU63AHIzGTYqB20Ux7+9iNlKoYNArQoE3qmvFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V6NYs+aD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V6NYs+aD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739786845; x=1771322845;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Rqi4qyL2yKN31RE/eSo76dsJ5aumcqnHsfhCJBzsp4I=;
  b=V6NYs+aDnZK6bEKDe+4t6lOCbie1YLMyxLrz89HdiGaD6bVohg7vSGjV
   WEH+LsdGz3Ye+HjqSXZ2u77vxF7X6UlymgY61CVRGG8Qid0ePDeWnFkG1
   YEQRdKWJkx8oTERvp2NO1aiBS/wBdJJOaRTypdI6PCTvc3AuMF+sOaa9S
   zxUZvTyg3RY5kR8U82MJQkffP5rSfAqkbw8eScKtwRVR9MsK5YETW3BKw
   21R4hK0+J/XFy9RTgF/Zudon97PB7PyEhKuGjnuU12sxfGmYUldGerWY6
   B1iHI536ZKOxQuLUI+bTmfQAY4VhGgJWHI230/1We+1s2fz142uxF32O9
   w==;
X-CSE-ConnectionGUID: d4H3Xxd/SCSuWzqHhV6DPw==
X-CSE-MsgGUID: 1VxLTJSiTv2XgrM08cd/Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="65818289"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="65818289"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 02:07:25 -0800
X-CSE-ConnectionGUID: VLK50K2RSC+bqS5N+w9xhA==
X-CSE-MsgGUID: V92Wr2kARry3fh5VAlXNmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118219052"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by fmviesa003.fm.intel.com with ESMTP; 17 Feb 2025 02:07:23 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 02/10] ASoC: topology: Save num_channels value for mixer controls
Date: Mon, 17 Feb 2025 11:21:07 +0100
Message-Id: <20250217102115.3539427-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217102115.3539427-1-cezary.rojewski@intel.com>
References: <20250217102115.3539427-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To provide minimal support for multi-channel kcontrols i.e.: more than
stereo configuration, store the number of channels specified within the
SectionControlMixer. The field is part of the topology standard,
currently skipped by the ASoC core.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc.h      | 1 +
 sound/soc/soc-topology.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 16e4e488521c..8931c24d9bb9 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1265,6 +1265,7 @@ struct soc_mixer_control {
 	int min, max, platform_max;
 	int reg, rreg;
 	unsigned int shift, rshift;
+	u32 num_channels;
 	unsigned int sign_bit;
 	unsigned int invert:1;
 	unsigned int autodisable:1;
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 921521a84e29..2b86cc3311f7 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -669,6 +669,7 @@ static int soc_tplg_control_dmixer_create(struct soc_tplg *tplg, struct snd_kcon
 	sm->min = le32_to_cpu(mc->min);
 	sm->invert = le32_to_cpu(mc->invert);
 	sm->platform_max = le32_to_cpu(mc->platform_max);
+	sm->num_channels = le32_to_cpu(mc->num_channels);
 
 	/* map io handlers */
 	err = soc_tplg_kcontrol_bind_io(&mc->hdr, kc, tplg);
-- 
2.25.1

