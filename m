Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D432C140E34
	for <linux-sound@vger.kernel.org>; Wed, 14 Aug 2024 08:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723624847; cv=none; b=gpNybu31B+1HQxdiI0q126omdTR5uY3svi+CnzLVQAH5QgqWgmzQr+DvKHZgeNmivjE3yT6np0Jn73TSL5maCmnCJjeBLCa31OJKpzgF3LibSFI4XAu5PPSfcHHVvg5NL5JVh8GWQmQkwx5G9NXy/7e6Ut62Gi8Fz0pjJsOzXKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723624847; c=relaxed/simple;
	bh=4odUtP/AEWZfLJ3vVU3By93GqPTr0OWR8KAXnBFaSXQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m6/MDHeUVdnln3ke3HtM8DyFTCJ7rgXFJqUSbyqQ8T5iHDeAQNuNrdybaw1sX+ry4hvBTG0lPiS7uPR+SdtQdc6oDfl96xQvaEX+Gr5G8J2w89CIftq1oppGnTSNnOOgeFK5rtWy3j/MNO8UZPRr3T7cmeab8/tsSD/9Gab+J44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cXDS7LqR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cXDS7LqR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723624846; x=1755160846;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4odUtP/AEWZfLJ3vVU3By93GqPTr0OWR8KAXnBFaSXQ=;
  b=cXDS7LqRc4ihyUETD2yG/MA6oJ5xfAQscmi2/1PlUzgpzftfS+Yp7bHm
   flWcQgnOaXqZSYwpvI9IJXwItl781jrmI0tmKBOHZg9dzSLcSUGKKFQeh
   lznPi4BOGZ2/yqSv4tH+e1zLTb5G7vhqRuqkEYOdbm2ky6DniMowE+HRs
   5EnFuAYF/412XhCf3ic5vC47nCGBZxIYxw5H+Dy4qjO5b8DP6sn9rMIKR
   36aXoL9V3MqmyB416A5QquEguyJpnr/Yn+IXtDV3XtCCPgST+CISjLmgF
   ATZdh+Q49UwKT+9YkD7E31PE6EksGgVwKPWOyKeRryaxdphcKdoiaiayy
   Q==;
X-CSE-ConnectionGUID: oH89tdBORz+BLCnTv4kYBg==
X-CSE-MsgGUID: v7RFkj3MSVmUPS1rdse4hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="24735343"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="24735343"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 01:40:44 -0700
X-CSE-ConnectionGUID: PI6VbwLZRE6AK+q+Yt4rXg==
X-CSE-MsgGUID: Wf09/Yv2TiaeZySrWhi2kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="63868161"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa004.jf.intel.com with ESMTP; 14 Aug 2024 01:40:41 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	andriy.shevchenko@linux.intel.com,
	cujomalainey@chromium.org,
	lmajczak@google.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 14/14] ASoC: Intel: avs: Enable by default for all SST configurations
Date: Wed, 14 Aug 2024 10:39:29 +0200
Message-Id: <20240814083929.1217319-15-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240814083929.1217319-1-cezary.rojewski@intel.com>
References: <20240814083929.1217319-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The skylake-driver is deprecated in favour of the avs-driver. As the
latter supports all configurations of its predecessor and more, update
the existing selection mechanism to acknowledge the SST flag.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index f2dc82a2abc7..da7bac09acb4 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -422,8 +422,14 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	int ret;
 
 	ret = snd_intel_dsp_driver_probe(pci);
-	if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_AVS)
+	switch (ret) {
+	case SND_INTEL_DSP_DRIVER_ANY:
+	case SND_INTEL_DSP_DRIVER_SST:
+	case SND_INTEL_DSP_DRIVER_AVS:
+		break;
+	default:
 		return -ENODEV;
+	}
 
 	ret = pcim_enable_device(pci);
 	if (ret < 0)
-- 
2.25.1

