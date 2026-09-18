Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE9A43A81A
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 11:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729915; cv=none; b=Z9RywAlE/WckIfjoMqiUPTUN5d7RyE5RP/dS/9hIagkq2/r1LEU4PofnjXSrHub31IOMQzDlGUmyTFCbB8TbbKC0Yo5k9ZGJeQUnc+GJS/Z0pPnXTAgFprGj3S422wuOsfffeWtGiD3K2dkjNugM6s6n4rJl5P2JJDDABsRI18E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729915; c=relaxed/simple;
	bh=DMqclb+Wnagf/ST3MDZfVzrvZXsadepVoWw7dYaaO4Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UogbU775xcInsOtPgwn3khg0NjJvciB0ztc7it0QMvNcIPg8uFE7fEt9Rx/gKNzA+tv1gufhBGaONdY+FM2bTjhgKQEG4ffdng9lrnkN3eHhLDpyZCCo4eVL+dhR9+kFsIN8ssdjE5qOO+xt2I/p/bi8HQcP/yRs2VhHUPQ16aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZCBQhUbF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZCBQhUbF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789729913; x=1821265913;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DMqclb+Wnagf/ST3MDZfVzrvZXsadepVoWw7dYaaO4Y=;
  b=ZCBQhUbFn4JNH+KlpacFacM4sV31sb02+xFKw24lELHjLM0ZHAwYSk28
   0PqCEQPtUdp0kAhus8Vq7LaYH9dbQpYxq7kdEpsFbHtycGpwx6NS08/rO
   lxtPtutUlEqdA5QT1M6VmykWPUeBv8kPf38fcI++mnywg3R2AsGLM5x5D
   AhmlEydw/gbzVxYf30ROdVmn8r128pCD4VHbGBjBz085f2pZrV1IY6wti
   /8yeQWBFvCTpLGAy2FzPZdyOpPW8ZshHflPnmv/DqVICrFe3AtkyjJzJN
   B2ixik98BIOgGJ7P9/0BhzZ1p+EDWGWq51pTT6q1SQFOShp4Ukn/awL7A
   A==;
X-CSE-ConnectionGUID: m0lv17uSTTCiFcsExO8wug==
X-CSE-MsgGUID: goCAm4QbTkmje35G09B6nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="94060967"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="94060967"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:11:52 -0700
X-CSE-ConnectionGUID: HUcsfc1cSDC6VLtn076zyQ==
X-CSE-MsgGUID: BiVyuZ6ZRpO5NNlkX/10mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="299459808"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 18 Sep 2026 04:11:50 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: tiwai@suse.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH] ALSA: hda: Fix struct hdac_bus documentation
Date: Fri, 18 Sep 2026 13:16:10 +0200
Message-Id: <20260918111610.3589324-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Spelling fix so the description makes sense.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/hda/core/bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/core/bus.c b/sound/hda/core/bus.c
index 81498f1e413e..20fe1c4a2977 100644
--- a/sound/hda/core/bus.c
+++ b/sound/hda/core/bus.c
@@ -21,7 +21,7 @@ static const struct hdac_bus_ops default_ops = {
 };
 
 /**
- * snd_hdac_bus_init - initialize a HD-audio bas bus
+ * snd_hdac_bus_init - initialize a HD-audio bus device
  * @bus: the pointer to bus object
  * @dev: device pointer
  * @ops: bus verb operators
-- 
2.34.1

