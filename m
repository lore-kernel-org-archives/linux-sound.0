Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4D7340413;
	Mon, 29 Jun 2026 02:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782701862; cv=none; b=HoTe3HLVluson1O+wpB8+S7Czoy1WM1g28nwHtitaNq2XdBNjtpImp9/8ICOYbJFhYx+u2MYOa5bx2UAr4hjtt96Y88yB/LnSgx76T8XyMQl/ZzcIcMiZqChivu2f2M4JkL3BDuvt5+sFAnuJPiWm8P6epAZnR+tld46q7FILBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782701862; c=relaxed/simple;
	bh=pbsIQ9iPTd617FZY5VqzB5MmpDmDvLlspi/HppvXgA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QoqWoMGaau1qLuQfQjhKUxFbjyJw45NLSO/ubO0r4UcKncZTwkGsvzB5A0A9LG+a+4BJYFtCIpdXWf7BBanXu77o11GbGON1KexF7STRBdc9JIi5LQXX1/8YB5o/rvXhCoGss+CpN0qc8XRlJjhT3Il8vk65ajvzJfcTzW0kDLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WfuhDKnK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WfuhDKnK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782701860; x=1814237860;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pbsIQ9iPTd617FZY5VqzB5MmpDmDvLlspi/HppvXgA4=;
  b=WfuhDKnKO2PoLLlBDkqVI5uMJJH9S2GBAx6IW9dYM3Sxfj0fvlWqYLMd
   BAePtzxALzS6gRmpZUqJWO5z5QlHNnfacrz5iJ4veGDSZW7yEaA7aF9zI
   hcOWMh7qv1QsnRTDHn30+PtwXF2+Zwzl0s6Y+F3x8OnPaogumdwfRi/4o
   nC8E6Go1g/oloe5WKDUnIR/vqf4TQzH/NPvX+ptW26y2q21HoBCtu8tQi
   QxDwMtMy6xNHeeHhMJ/bziPIKLzQjGsmkMwarXbN/TpQ4pty5CEVAIEql
   EjtqXYkXfDZgGZ93CNg5wruAV3hea/QSWfiHekwq0GSZrBN9L9QMKD718
   A==;
X-CSE-ConnectionGUID: vGFTbpTdSn+Ku0G4vp0Ypg==
X-CSE-MsgGUID: uwBWXBYlSMS5TMF4Tc3GWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="82490844"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="82490844"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 19:57:39 -0700
X-CSE-ConnectionGUID: kDVtYSZ0RseJ/4GTHbdS2w==
X-CSE-MsgGUID: 81AaUC9OToaxtUNz2DfLkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="255437352"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 19:57:37 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH] MAINTAINERS: ASoC: SOF: add AMD reviewer for Sound Open Firmware
Date: Mon, 29 Jun 2026 10:57:22 +0800
Message-ID: <20260629025722.1982120-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

SOF spans multiple vendors and hardware paths. AMD ships ACP-based
platforms and contributes to the shared SOF tree, so list an AMD
reviewer (R:) on the SOF MAINTAINERS entry for balanced review and
correct get_maintainer coverage when shared SOF code changes.
Add:
  R: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 42feedf526c3..59ba615c76ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25089,6 +25089,7 @@ M:	Bard Liao <yung-chuan.liao@linux.intel.com>
 M:	Daniel Baluta <daniel.baluta@nxp.com>
 R:	Kai Vehmanen <kai.vehmanen@linux.intel.com>
 R:	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
+R:	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
 L:	sound-open-firmware@alsa-project.org (moderated for non-subscribers)
 S:	Supported
 W:	https://github.com/thesofproject/linux/
-- 
2.43.0

