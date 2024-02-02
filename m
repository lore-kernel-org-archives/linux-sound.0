Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF687764F
	for <linux-sound@vger.kernel.org>; Fri,  2 Feb 2024 11:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706874429; cv=none; b=YLKdMjPRWUAq0bQ5cOf1fKj0I8g51sRKb1BSv9vDsuGeEt04ikaZ55zO/00fNcKYJOU1NNn4vgQ1dlf6ZxvNK6D3sXofEhvsTyrf/7QziM23JtwjozHcenz/Lo6x8tHTeEj60k6fNcv9wGG7Dbro066SApheqAWpHdf9V1lHQ6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706874429; c=relaxed/simple;
	bh=DqACfi5Nm+Z5Vvu/yy4geSACSkUjfZsO8nMA65QjZFI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qBYPVExjxfBlVTFb55zzUclL1O09C8Oegm5YmwUp0Bkn50lHXn5IjfAH0feXkvswtjdJ77beA2piR8MFXKeM+4zqKVrpOD6aukMeBpdiqkNaRBY8dcm2NKhBcjUsDTAwLD5kVHTWXDRC53AmYe91bfJEHx8tjSq1mivvyC9PMqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cjplFshM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cjplFshM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706874427; x=1738410427;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DqACfi5Nm+Z5Vvu/yy4geSACSkUjfZsO8nMA65QjZFI=;
  b=cjplFshM4RX62fwn5NPndyCU71bSTXEKYUFSOmuXYLJK9uK/vnV769CQ
   AYZ5dXFRVdWOFxlVjFbnu2fMWcaSBTD12iaJrbtmhy/f1qK/TCRdYEopy
   eM1RlOyTG34PCuE6Xt5VD8h+biGYme7v9pVMgt/5btDhBFj3RdtLauXE6
   LJOx5V5ipzg7VQhgaVG2GzS3ikI+5OU0KY5oTpRm01dvlS+KgECEtj139
   YCLCUK5mst8fLwV9F1vsNBU1cVfkmfkmOXveXSi5uZbEnEEeAnWw5LX+R
   ZV0lKkM3WKfI3oSrN6BdNBlQzHs4/xXrcl1vWVYu0eu+BikKpxo+X+ZGj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="56746"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="56746"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 03:47:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4652485"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa005.jf.intel.com with ESMTP; 02 Feb 2024 03:47:05 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH] ASoC: Intel: avs: Fix pci_probe() error path
Date: Fri,  2 Feb 2024 12:49:01 +0100
Message-Id: <20240202114901.1002127-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recent changes modified operation-order in the probe() function without
updating its error path accordingly. If snd_hdac_i915_init() exists with
status EPROBE_DEFER the error path must cleanup allocated IRQs before
leaving the scope.

Fixes: 2dddc514b6e4 ("ASoC: Intel: avs: Move snd_hdac_i915_init to before probe_work.")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 59c3793f65df..db78eb2f0108 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -477,6 +477,9 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	return 0;
 
 err_i915_init:
+	pci_free_irq(pci, 0, adev);
+	pci_free_irq(pci, 0, bus);
+	pci_free_irq_vectors(pci);
 	pci_clear_master(pci);
 	pci_set_drvdata(pci, NULL);
 err_acquire_irq:
-- 
2.25.1

