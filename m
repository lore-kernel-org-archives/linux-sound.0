Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E6412BEA1
	for <linux-sound@vger.kernel.org>; Tue,  2 Apr 2024 15:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712070017; cv=none; b=qpw5+oswm5z2lBYKqOMUXrFa7s5aZkfGyJr+kjeWR/KdNVJrcT93QGSH+hJDrYGjNq/7fFJ7/rnckU598eXkCkJs7vCLPPhCrPxSGWBOCqp/KgL3MUjujTywciqQ2aQXjGj0OtopUH4/oTeFARanc3C0xn4rQbNihBZzfIk9YJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712070017; c=relaxed/simple;
	bh=XC/KIBuVWENi+nZcHSHtH5poqdXkQwX6utx5Af8jDo4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jJbmhSEHp0xM+leAJqzjAzmDOvgCX96Rwy3JUU8RjpwWIf/IXBFXaj8gfIPQtFlFzWUTaInvSxHd2GHzQiQEpLl0xB/dZMeM0AMFxhA8AX0p4DPrYt1yoSxFLetV8QWeEcE2ozTaefl1r7Gr6XQ/x02HpzC0NfbXyaVVTQE8W+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=imlkZ8Wz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="imlkZ8Wz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712070015; x=1743606015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XC/KIBuVWENi+nZcHSHtH5poqdXkQwX6utx5Af8jDo4=;
  b=imlkZ8WzQEuoV9+FrraBwkaXhXedqEJaQCt7O9v3zpKUHHJPQI5m3Vnd
   fANjkc4boiNumz79vv3RB6w7Fk0tvqQrKcvuFGPAZ3zOmYBUyHboQuQcQ
   jUEc0bZsOsDDCqnvpIWN9lSrvXZFFWMSj+KwIt3oYu2Gi5KIRpRqcFCMX
   Ybq8ULzTusobKsU3DZJrXl9rBXmwTnt78NKUfAbC2jq/0ti+MM/v8Nh4y
   CkrmeRicdHpsaAOc9vHa/vJGtSeaJOD3erIn2N0UvRL64a9KQZZNiSA2u
   vjbga47BFTG8WWqRFfHDXtysHWr4eY0v10m13DV67cDuk2keGsoKOLgHY
   A==;
X-CSE-ConnectionGUID: BCY1pxFZRA+64x6Pds4nHw==
X-CSE-MsgGUID: FHYu+KBdSvCw0axwnGMTGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7433834"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="7433834"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:00:13 -0700
X-CSE-ConnectionGUID: 7E16P8RbQUSCSgoWUteSSw==
X-CSE-MsgGUID: GOPdG6s1RlyM+OvXzqjG8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22558031"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.8.83])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:00:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 4/4] ASoC: SOF: ipc4-topology: remove shadowed variable
Date: Tue,  2 Apr 2024 09:59:59 -0500
Message-Id: <20240402145959.172619-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402145959.172619-1-pierre-louis.bossart@linux.intel.com>
References: <20240402145959.172619-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cppcheck reports this:

sound/soc/sof/ipc4-topology.c:569:23: style: Local variable 'sdev'
shadows outer variable [shadowVariable]
  struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
                      ^
sound/soc/sof/ipc4-topology.c:512:22: note: Shadowed declaration
 struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
                     ^
sound/soc/sof/ipc4-topology.c:569:23: note: Shadow variable
  struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
                      ^

Remove shadowed variable.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 5cca05842126..427f186ddc11 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -586,7 +586,6 @@ static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 	switch (ipc4_copier->dai_type) {
 	case SOF_DAI_INTEL_ALH:
 	{
-		struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 		struct sof_ipc4_alh_configuration_blob *blob;
 		struct snd_soc_dapm_path *p;
 		struct snd_sof_widget *w;
-- 
2.40.1

