Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF2523AE8B
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 11:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744024034; cv=none; b=er9LgUCRqQhr3QW0xbQCAm6mp475gaQb/SfYM3hVHGh1aZJ8rT/6yu3oD/6gaJVygAirWbhRk0mrAlsh9b7wVLFllmacvU6/RC/Q3SKIjZseV3lC1A9+ZAlRd5SJ9104Dejp3YNIEM/OtA/yHQwK8aMGynyIH30QKrn+H+O9L6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744024034; c=relaxed/simple;
	bh=3fsfsswKq90GCZ5KBvPDdKgMT6gZRRXzRnUoArjx2P0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ckA/qENr4wy035dzVdl2Osg58ql0kHrkq6LEZKXAQp8sWjBEYhLUPA6hDoRUFQL+0bjLc1SVYIxjGKhutez+nFW+plWqo3SiEupgDy8aFK/T6HcQ27D4P0N8Ij2cnDblPZ66T7VVltnT8J4wA3x5I6yeJtAo4fqUW3OG9cWi4rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDFlVQvM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDFlVQvM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744024034; x=1775560034;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3fsfsswKq90GCZ5KBvPDdKgMT6gZRRXzRnUoArjx2P0=;
  b=oDFlVQvMWd9L1eFd+0QqU0z+gVCZFxSgcbKItl0ST/8LAD99Am8Mn78A
   aDGU/5/bCQYcwki+McxCeSkbWVI1vic2mPlAaaoSzuNM0N2/Gd/WV8kv8
   3q1BBHlsQ7KqcZ52hDUdF/LtlYyQkFDZH+8gmDNvh8nSA2MBpwVDeiLuS
   QpAAZnRgNtmoBQD/1No1WRz2x8czBWtjz28INZh2A+Bxqk1KcyZlVgwgj
   TtZ2atH3bDnpXWIiPcys3HGOfkwvXbMVEQgkfQ7/DKukmObnq0V5e+jw8
   LSDzSy+XvLacTNYyTaToQm+i9vCl54DLsbmj+Nws4icbG0dINkrpSo8lb
   Q==;
X-CSE-ConnectionGUID: ggkjOaXKRkOW1LORD3IicA==
X-CSE-MsgGUID: ySPWSRswS5aNqYOmAGKHLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="49057393"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="49057393"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 04:07:12 -0700
X-CSE-ConnectionGUID: e81cl1GKTkGPCzhR+PG7Fw==
X-CSE-MsgGUID: S/ocnRXlSd6hMmWfGkEnjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127776347"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 07 Apr 2025 04:07:10 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	liam.r.girdwood@intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 10/10] ALSA: hda: Select avs-driver by default on FCL
Date: Mon,  7 Apr 2025 13:23:52 +0200
Message-Id: <20250407112352.3720779-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250407112352.3720779-1-cezary.rojewski@intel.com>
References: <20250407112352.3720779-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The avs-driver is the recommended solution for FriscoLake (FCL)
platform.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/hda/intel-dsp-config.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 5103e37be428..01594f858129 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -112,6 +112,10 @@ static const struct config_entry config_table[] = {
 		.flags = FLAG_SST,
 		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_M,
 	},
+	{
+		.flags = FLAG_SST,
+		.device = PCI_DEVICE_ID_INTEL_HDA_FCL,
+	},
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
 	{
-- 
2.25.1

