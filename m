Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBD01A5B8F
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 08:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743756423; cv=none; b=NlWeZDptistGnblBy/XzHXAkp4j4UePxbyqMdQIuoBJ+QfMZd+zsABP1ZtcHcoDFRZ3iUI8QWfcaDvmzeIo/IhfaTTWzBhfrwika8CiGHRDC8Go9sITFrGOinh4s4yF0rbQoN9l05VDt22ljDMmEB5o5L30ZPnup31lhJwbMeHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743756423; c=relaxed/simple;
	bh=Zpe4UESyi0Rq1FzI7qKGY5CrVJB3C0bJa/dXpslg/eo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ocAroxYVOCSOok2gd9EiraoW8hqQANFUR88uMUTBOii2SDKwPHNDlsEJEqlejDTj1+DgFgDR0x7wgDqr85ZnJolhhcap8H57IpKCSSya8CQrSmWWwgO7qIQWxN0Z29V6SOn86j6vChwH/0i+vc7riNYPSZkpezh9s2dj+3NbmKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=asfnOAsP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="asfnOAsP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743756421; x=1775292421;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Zpe4UESyi0Rq1FzI7qKGY5CrVJB3C0bJa/dXpslg/eo=;
  b=asfnOAsP3v3ctWfdqEm+HsA75+IfkUnTlAnUUZeFHwpDNYemMLKTPl6S
   fQsRhi2uQZMIqQr2MpBePz5ywliaSECBPoXxsOJyK8y/lWbIc5C46zOQJ
   jc/Lp1f14UbAdBbYeYD3govtPsacMVBW12r6x3fGYZ3u+FuMt5RoS5T/8
   oUsTnt5jTYJG9vCW6qxLR0qib9wyzWNCQSgayVcg8/tfWx0ihVLWROv9P
   zoNYqB3LKj6L4dl2Vp8jRIYwggrOr7giydL5WKO3d+GUhaNpl7KrDybD9
   tWAJZ1SNjWYNbejUo1hwCRsQjroyALrHHS1uT8aGxpsva0OSL5qXBRWZs
   Q==;
X-CSE-ConnectionGUID: C0D3Ek/3SeGZ1lgWv/3FGg==
X-CSE-MsgGUID: 6IIICwdSRtqh/cEmKd9ryA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55854613"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="55854613"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 01:47:01 -0700
X-CSE-ConnectionGUID: WP9h+MawS1GaFVz/sJFNMA==
X-CSE-MsgGUID: R5OQtuPvTFCihay7PhjXgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="164464272"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 04 Apr 2025 01:46:59 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 8/8] ASoC: Intel: avs: Support 16 TDMs in dynamic assignment
Date: Fri,  4 Apr 2025 11:03:37 +0200
Message-Id: <20250404090337.3564117-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250404090337.3564117-1-cezary.rojewski@intel.com>
References: <20250404090337.3564117-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

When assigning new widget name there needs to be enough place in buffer
to assign name.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 3c222c352701..f2e4ad8b8e14 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -1668,8 +1668,8 @@ static int avs_widget_load(struct snd_soc_component *comp, int index,
 
 	/* See parse_link_formatted_string() for dynamic naming when(s). */
 	if (avs_mach_singular_tdm(mach, ssp_port)) {
-		/* size is based on possible %d -> SSP:TDM, where SSP and TDM < 10 + '\0' */
-		size_t size = strlen(dw->name) + 2;
+		/* size is based on possible %d -> SSP:TDM, where SSP and TDM < 16 + '\0' */
+		size_t size = strlen(dw->name) + 3;
 		char *buf;
 
 		tdm_slot = avs_mach_ssp_tdm(mach, ssp_port);
-- 
2.25.1

