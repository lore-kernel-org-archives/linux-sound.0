Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546F84E2F31
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 11:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730017; cv=none; b=WCTB0gjaeuNV6CKBPwrjyrAsnegXWqmMYvJtB7Oeo9Ccu1cAqXNKcCFw32SgN5+nmpcvU+oROiXlYxOZUKxq4N14vrI6O0DSb3LBzAdbg/NTmKLqfAedjIT/tzoipK1xy8tzUbUxia722sUVR5dBR1Fooez5cKYUkO6ztE06pEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730017; c=relaxed/simple;
	bh=0MsgqrrAvs2YwHxK6VYBcnDTxsQ4ctA/bl6naFcKjkg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c2mx4YZiwj5V+blkwdRWLcCtvnHnudu0oFakn8Vmc4AesnmwUEV0r5HkkBLTpd3lfzwRkzfJjIoqyevEfq7ICh3PyaI+2mbyQk6fUUBvBxtg1wJPYn+G+m5e9+bcw11NNK3BOq9X8cTtUqlcZZZouUi2T+ugVuiszCP8yhbdZJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q2o/AarZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2o/AarZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789730015; x=1821266015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0MsgqrrAvs2YwHxK6VYBcnDTxsQ4ctA/bl6naFcKjkg=;
  b=Q2o/AarZY+YD1WeodWm0i72xktZQa3z3xvjt0nvcNJ8CZQJKRgt0H+ZL
   ywDjrHVAGzxFjsFFVIX91bulecB7zIi0jhQn3EPb5Wnn9VJ9cn2TSQNo6
   YYA9Icm4fwpng2brl9K6ZN6+78+GpkVTrexhgIgtx8o8lHatk/u/5jXdY
   4COjZVtZHQ0bhvHeoRj8nRvnvRP4p/m1VbmXJ7qUirUWcLnFJ0TtnwwJD
   zduz/NSxG0SOzn9DlM7eDXdX/Xqk7+iW3aFIVakCOM6zDMMOozD8/2YJp
   uVrXoI5G72bflNV4SJFUI2OI5QE1/3oymdLN9u3+9Z+3HHcM9razKNWx3
   A==;
X-CSE-ConnectionGUID: /67vEniPT6qgTeaWQiMDqw==
X-CSE-MsgGUID: awEUBEwISomEQoaRYcYang==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="101577737"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="101577737"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:13:33 -0700
X-CSE-ConnectionGUID: meE4rfvCSI2DWujpy2B7HA==
X-CSE-MsgGUID: i7bXtiQRS1OFx9SH6j5R4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="279581941"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa005.fm.intel.com with ESMTP; 18 Sep 2026 04:13:32 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/2] ASoC: codecs: rt274: Fix format setting for 44100 rate
Date: Fri, 18 Sep 2026 13:17:45 +0200
Message-Id: <20260918111745.3589393-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918111745.3589393-1-cezary.rojewski@intel.com>
References: <20260918111745.3589393-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As per specification, Sample Base Rate (bit 14)
shall be set to 1 for 44.1 kHz.

Fixes: c7e79b2b2d2d ("ASoC: rt274: add rt274 codec driver")
Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt274.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt274.c b/sound/soc/codecs/rt274.c
index 91031a08a5cd..496cfd3e8fb7 100644
--- a/sound/soc/codecs/rt274.c
+++ b/sound/soc/codecs/rt274.c
@@ -622,9 +622,11 @@ static int rt274_hw_params(struct snd_pcm_substream *substream,
 	unsigned int val = 0;
 	int d_len_code = 0, c_len_code = 0;
 
+	/* bit 14 Sample Rate Base, 0: 48kHz 1: 44.1kHz */
 	switch (params_rate(params)) {
-	/* bit 14 0:48K 1:44.1K */
 	case 44100:
+		val |= BIT(14);
+		break;
 	case 48000:
 		break;
 	default:
-- 
2.34.1

