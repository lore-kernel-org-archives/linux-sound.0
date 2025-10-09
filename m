Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095012D663B
	for <linux-sound@vger.kernel.org>; Thu,  9 Oct 2025 09:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760002845; cv=none; b=GpLqCm49VTRN7yhPD1yTNPJRTrtlUm/bipJ4mI7uVduWitksc8TRADQLDi3pmXTy4AKD44dSMivv3tXWPm8KusO+fv4Cz8K6sZz26SZuts6/pceIKzQxoHR1Fy2/g9GEgLy2Q7UTwa8y2SbjLZqtKSck970446G3MfILmHAmXtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760002845; c=relaxed/simple;
	bh=scGHoIpz3OyIF3bX1kfM8X3dxxyM51R2qH2/m8lQjMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WBehitl3Bqv8COHCzRWPlSNpXknTdF3N9wQHNXASJ+HUGDnGP2HEWvfMx1Qm7Di71NpfMJaA+zwPMTr/2bN/oQJHtXrHPeZmBo9MlXpNDbEyzhQ+gvv/mAP9BGg+/MYroPVwvh/EPeYVYvOPq9oN9F5v+nglLR7Po/f4GorXEw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FPcfbcgv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FPcfbcgv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760002844; x=1791538844;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=scGHoIpz3OyIF3bX1kfM8X3dxxyM51R2qH2/m8lQjMA=;
  b=FPcfbcgvGkgaSmmSQBkZK7mFgSmvwJm83g85+GwXLh7dTkNv1FiBH3UJ
   aVKn2u/UR+28wZkX4IkY9yjl5psrbh8hqBWQPODMNom34MC+3GeejFIqO
   g12g4ziHjuXfMfzyFJNlydY+a+2FZNmsm2/7yoHibACfQEUPNS3ElCk2p
   DDHKuD7Iuf+xGLWQnjqn17BCx84xMk0VtBs5L8R+Xgz6NK0K3RRc97IzP
   rpKV3CJ+NMdOYD6UyHbvG0QCzBsF/rtP/eDnAqCPMjSf3JoVbX/HmZRUj
   ZwAEJhfncsPFbCjxTh+/S4Hy6zWClu7qdzXMMif64ZUFhHp6+4v4uSD6Q
   g==;
X-CSE-ConnectionGUID: j+aItxQQSGSYwbsWEK8ZMg==
X-CSE-MsgGUID: KnK9ridxSF6JwYmp+ezAlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62113248"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="62113248"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 02:40:43 -0700
X-CSE-ConnectionGUID: kuRBY/KDTiyBJq8B3C4AcQ==
X-CSE-MsgGUID: W2B4ijFeSyKdHfQ0IVypzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="181437998"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 02:40:42 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 7/9] ASoC: SOF: don't check the existence of dummy topology
Date: Thu,  9 Oct 2025 17:40:21 +0800
Message-ID: <20251009094023.3474895-8-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009094023.3474895-1-yung-chuan.liao@linux.intel.com>
References: <20251009094023.3474895-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Monolithic topology is not needed if function topology is used. Instead
of creating a dummy topology in the file system, we can skip the
existence check in the kernel.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/soc/sof/fw-file-profile.c | 4 ++++
 sound/soc/sof/topology.c        | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/sound/soc/sof/fw-file-profile.c b/sound/soc/sof/fw-file-profile.c
index d2b232860091..4a2afc04f338 100644
--- a/sound/soc/sof/fw-file-profile.c
+++ b/sound/soc/sof/fw-file-profile.c
@@ -73,6 +73,10 @@ static int sof_test_topology_file(struct device *dev,
 	if (!profile->tplg_path || !profile->tplg_name)
 		return 0;
 
+	/* Dummy topology does not exist and should not be used */
+	if (strstr(profile->tplg_name, "dummy"))
+		return 0;
+
 	tplg_filename = kasprintf(GFP_KERNEL, "%s/%s", profile->tplg_path,
 				  profile->tplg_name);
 	if (!tplg_filename)
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 3404f1306494..c1083ea4624a 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2523,6 +2523,11 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 	 * callback or the callback returns 0.
 	 */
 	if (!tplg_cnt) {
+		if (strstr(file, "dummy")) {
+			dev_err(scomp->dev,
+				"Function topology is required, please upgrade sof-firmware\n");
+			return -EINVAL;
+		}
 		tplg_files[0] = file;
 		tplg_cnt = 1;
 		dev_info(scomp->dev, "loading topology: %s\n", file);
-- 
2.43.0

