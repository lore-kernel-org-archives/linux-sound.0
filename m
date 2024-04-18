Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3E76FB0
	for <linux-sound@vger.kernel.org>; Thu, 18 Apr 2024 14:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713450349; cv=none; b=rmUDpnDEWsqhd7avgEvYvuRbv1x979RKAWCcZeYmSnWBUN2R1HAElnsAPZeiZX6DdqpaHvo2icR2XtGWAOzMthJMeg8saGqc1KB/Jo9+1Sq4aTZJn525+Y3yPcWTVGAAU3RbCtSa7H7rUhIH61GCNFt2ePJo9SVuixscsIXoNi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713450349; c=relaxed/simple;
	bh=GzG00QwaIqfcRIUymW2pwbL8h7GyfnPyOeGrAxQf9jQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=W95EjdHsFqna2v0ain/oBTBuULleN0r8gM2d5ERwLE2mTVGbSEcIq3w9AWKIH73tGFxDwIslgRBNRLKJH+RlcSlsiRjPuP7ZBpbsbhBgZyjZUfoPSTCgYaIEwx5PAx9JqRPMXpyjwHpdgpksSYEWu5vJ4/ah+XXki/Am1RKNxG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FHrGwTiL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FHrGwTiL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713450347; x=1744986347;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GzG00QwaIqfcRIUymW2pwbL8h7GyfnPyOeGrAxQf9jQ=;
  b=FHrGwTiLUZF9ZcVyNjSIZFRY5rhmFZp6Lfism5DWIjHFEJHIYoiamKhc
   suBVevVG4Wfes8MtSRGKSI/U63dSzlweFzNVEiK1Gj6yjZNGzCdqmDDDh
   RuTFz63CzwTLnKP8VHYAJOGOTqoy/g7oI0nBcgwkERGKEAdQidLVWPuzm
   AMK7u8HHlZaguB/lwn5fvLLstx4igfRh3mPRyU7VJfQsCmgtAVHd9j4Pz
   C0LzTbsgRSpOO36mXysz/obE6tUw9XdPosgn/O2Y3zP01zS3bdYCuyjvk
   sieW1pi2Snx+oShGoCsTDiC2IO02fMo3Fu7YFWay9XUZ/QmnL7G4jYGwp
   g==;
X-CSE-ConnectionGUID: aNAfRLKcTqmNBP07LF8eMQ==
X-CSE-MsgGUID: JqcCYrw3SDusnITtJoajtg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="34393435"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="34393435"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 07:25:47 -0700
X-CSE-ConnectionGUID: TCCeq1dLSUiwwh3UD7V8wg==
X-CSE-MsgGUID: 0/vFicXzTNOqWEFEzX66hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="23439766"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa006.jf.intel.com with ESMTP; 18 Apr 2024 07:25:45 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH] ASoC: Intel: avs: Set name of control as in topology
Date: Thu, 18 Apr 2024 16:26:21 +0200
Message-Id: <20240418142621.2487478-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When creating controls attached to widgets, there are a lot of rules if
they get their name prefixed with widget name or not. Due to that
controls ended up with weirdly looking names like "ssp0_fe DSP Volume",
while topology set it to "DSP Volume".

Fix this by setting no_wname_in_kcontrol_name to true in avs topology
widgets which disables unwanted behaviour.

Fixes: be2b81b519d7 ("ASoC: Intel: avs: Parse control tuples")
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/topology.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 13061bd1488bb..42b42903ae9de 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -1582,6 +1582,8 @@ static int avs_widget_load(struct snd_soc_component *comp, int index,
 	if (!le32_to_cpu(dw->priv.size))
 		return 0;
 
+	w->no_wname_in_kcontrol_name = true;
+
 	if (w->ignore_suspend && !AVS_S0IX_SUPPORTED) {
 		dev_info_once(comp->dev, "Device does not support S0IX, check BIOS settings\n");
 		w->ignore_suspend = false;
-- 
2.34.1

