Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA751547EF
	for <linux-sound@vger.kernel.org>; Mon, 14 Oct 2024 09:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728899353; cv=none; b=bcoa8OLMt1ZfstXETfyvl0nooPidVaew4GFQyjWQTCwuUWr7I9ArGfNqCIA/sTlOjXrgGGlWL0kvhbYnsS9TSPpqIA13v4jBVI3r3sGVnbqY3Js1cHsNNkPq8Fm0oWg36QN8LUKc5Kay1R4+KoajMJWAB0XjwMctLLhz3Nfw55I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728899353; c=relaxed/simple;
	bh=sX2+clgMqGflwZFTNJN/6f020ifcLgdePoK8LI0NZuI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=tW/cBYjj9AhwWNTctB0VZqGIwe41eI/147j+U1MHGQcDq9/CXs1vVAUCxF0s9JzsMJEq4pIy6EYJsCnZ2NVAB/lZqOMNipbF3oiopfvdJodjNMYmGgQiiZobxcrRQmN0Uys4epIP+SoUkJzS1rrAbDP+8sxbj32ktKNJweeUVcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mHsydeLO; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mHsydeLO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728899352; x=1760435352;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sX2+clgMqGflwZFTNJN/6f020ifcLgdePoK8LI0NZuI=;
  b=mHsydeLOuTDfEgVjE+wYwSmSjE8EFDnz87S+AMJ7yE4yyoheis7JcPIs
   8ZI5zq3GQ6kQ8BsBpPbc3ocpDcZZ/09rnlJeRynbOrfTYHab0K7Bs6Z2w
   RbDYg8ekx04OgrASIXZteRDSAPdwtDj1ToAzKuLXoBjCQmIzi81XSEI8k
   NY0cTaHwX+TEHD4yTpnt/OlcYejROHHFbanj7e9jpn7dHUYlzenJWna4+
   nic7raCOhYdeSVoZ5eiw60bCLO5NjaCKxgEN6+FvSsS6znppewvGLRJOB
   eklV1gpi3pkR5qrI1g0YVbF+lQXX9vrBso9Qpv9D1ZM8hI2AcdHgLaSYb
   Q==;
X-CSE-ConnectionGUID: kStDATNFRlyKFcvShZC7lA==
X-CSE-MsgGUID: H9tKWGHmQqWoF794MtzpYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45712640"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="45712640"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 02:49:11 -0700
X-CSE-ConnectionGUID: zdaH1m4yQ96aCgLfE6u/pw==
X-CSE-MsgGUID: 0l+SQ/rtRaGtwx4lsJL5HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="100857963"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa002.fm.intel.com with ESMTP; 14 Oct 2024 02:49:10 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH] ALSA: hda: Fix all stream interrupts definition
Date: Mon, 14 Oct 2024 11:49:58 +0200
Message-Id: <20241014094958.708563-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is defined in header to 0xFF, which only allows to set values for 8
streams. In specification it is defined as bits from 0 to 29. In
practice there is no HW with 29 streams, but as the only place where the
value is used is chip initialization, it is best to make sure that all
bits are reset properly.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 include/sound/hda_register.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/hda_register.h b/include/sound/hda_register.h
index 5ff31e6d41c19..db1cc0b897fd3 100644
--- a/include/sound/hda_register.h
+++ b/include/sound/hda_register.h
@@ -180,7 +180,7 @@ enum { SDI0, SDI1, SDI2, SDI3, SDO0, SDO1, SDO2, SDO3 };
 #define SD_STS_FIFO_READY	0x20	/* FIFO ready */
 
 /* INTCTL and INTSTS */
-#define AZX_INT_ALL_STREAM	0xff	   /* all stream interrupts */
+#define AZX_INT_ALL_STREAM	0x3fffffff	   /* all stream interrupts */
 #define AZX_INT_CTRL_EN	0x40000000 /* controller interrupt enable bit */
 #define AZX_INT_GLOBAL_EN	0x80000000 /* global interrupt enable bit */
 
-- 
2.34.1

