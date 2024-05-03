Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AF5154BE3
	for <linux-sound@vger.kernel.org>; Fri,  3 May 2024 14:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714745065; cv=none; b=O2gOpBCcy04KiT19h7+7wq3yPd90AX08C3H69llYOnylIEkoc9N9y8TCrzvkR+nk3Ba4elVcOgIi1DaaDfHMG4YhYU0H8yT5ZiSZqp36Pw8x23IrbiZz2jNs0uW41VSbFNXSSFZhSK1PrGu+Tb1lUzjSCAaPttSCPqYCvPVJ9Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714745065; c=relaxed/simple;
	bh=+AJnVax2NKzC9XlJ/59ix8YgGvBsB3TV+IL9bfNoAkY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DhpiRC8yxrLGg60OkfWN0iUTelPGQOSivv0o9eLcYcukRDlYmcj9t0CfYHfmvIRaUMl/h7uYojciDx5C786NQfMkTUEtn0lGdoFnV9fIS2AYHCZ2ebKhZdFB8yC3OvPE3Q+5wbGIH/qM9itVP2YRGuhyPU2NIHS24WiYS/HaGfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fH3rWDtU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fH3rWDtU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714745064; x=1746281064;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+AJnVax2NKzC9XlJ/59ix8YgGvBsB3TV+IL9bfNoAkY=;
  b=fH3rWDtUqUzcDTGubYaDV9o9w/TPhk2FhAnhWNlkR0zhxu1w68lAPFJ7
   XnBZKsRjiUi5SGsh64RNe31FSEfNH4eL+iCG2P7EXQeYxYcG6ujSBP3QN
   pdO/DcNNTJ7Nv80UZdYAKgJW95u+5kHVBanRDJXRBeO5ET0Nhn/YGqikI
   4mL6Cey18HFAFkYRAUlaWomz+BCWyzlLjj0nJRs5FrewcpCOAu5OQFQ/n
   T7DKV+98t70mzASFR4uzMGa0Mwedznl2rhjtubSu3d4y5qgRiEH6sTs+4
   wdtRI2NAHy9+qApHVWXf5B/v7woSF07qkupepRw1assj0dZBAvJouoLfo
   A==;
X-CSE-ConnectionGUID: QK7paxa5S4Wl3kBkyRAHxA==
X-CSE-MsgGUID: ZJa86BPgRlebezLTfXnQEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14369537"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="14369537"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 07:04:23 -0700
X-CSE-ConnectionGUID: HU2pu+xvSKuUDVyMCLSw3A==
X-CSE-MsgGUID: OGdlV8/YTiem2YAJXvn1KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="64908120"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.113.3])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 07:04:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 8/9] ALSA: hda: clarify Copyright information
Date: Fri,  3 May 2024 09:03:58 -0500
Message-Id: <20240503140359.259762-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
References: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For some reason a number of files included the "All rights reserved"
statement. Good old copy-paste made sure this mistake proliferated.

Remove the "All rights reserved" in all Intel-copyright to align with
internal guidance.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/pci/hda/hda_controller.c | 2 +-
 sound/pci/hda/hda_intel.c      | 2 +-
 sound/pci/hda/patch_hdmi.c     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index 8af5ee1b0ea8..a16fb764f779 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -3,7 +3,7 @@
  *
  *  Implementation of primary alsa driver code base for Intel HD Audio.
  *
- *  Copyright(c) 2004 Intel Corporation. All rights reserved.
+ *  Copyright(c) 2004 Intel Corporation
  *
  *  Copyright (c) 2004 Takashi Iwai <tiwai@suse.de>
  *                     PeiSen Hou <pshou@realtek.com.tw>
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 6a3022a87245..82fc57b2e326 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -4,7 +4,7 @@
  *  hda_intel.c - Implementation of primary alsa driver code base
  *                for Intel HD Audio.
  *
- *  Copyright(c) 2004 Intel Corporation. All rights reserved.
+ *  Copyright(c) 2004 Intel Corporation
  *
  *  Copyright (c) 2004 Takashi Iwai <tiwai@suse.de>
  *                     PeiSen Hou <pshou@realtek.com.tw>
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 495d63101186..b68a1db0f7d9 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -3,7 +3,7 @@
  *
  *  patch_hdmi.c - routines for HDMI/DisplayPort codecs
  *
- *  Copyright(c) 2008-2010 Intel Corporation. All rights reserved.
+ *  Copyright(c) 2008-2010 Intel Corporation
  *  Copyright (c) 2006 ATI Technologies Inc.
  *  Copyright (c) 2008 NVIDIA Corp.  All rights reserved.
  *  Copyright (c) 2008 Wei Ni <wni@nvidia.com>
-- 
2.40.1

