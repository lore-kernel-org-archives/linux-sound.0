Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920B01B21B4
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 09:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743759212; cv=none; b=JFr0g3CPWQVNMdotXmKevJehBKeHvHbQuWQYHfAKdOIIUv/Z2UKVGla4p0I92C3p/ghXWXQyAf9Cy8hDwROa6DlW8ExexYO9NMhpPwPXv3d7Hf/TXvw2OGU0lYEjUHNJeXb1H+ux6Qct4Dx58VC5QxIBNiTPJoCasx6ybyvxzhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743759212; c=relaxed/simple;
	bh=3fsfsswKq90GCZ5KBvPDdKgMT6gZRRXzRnUoArjx2P0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nWq1ltwops7IoY/O5Sb29P5ADS5K0FTAlT/XDx1nv3ySMpK6T1B2MILHNsnQiAjsgqfbUtnnYv02tgoHjAkpl+aAhfBcNHfcvW6qcCbrstJqIKqPuy+eqbf2PauU8x09SXciS09rtB1GtxhnnFRK9du6jHzhbAEVtQj1MLh4K3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TaA+Bjjm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TaA+Bjjm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743759211; x=1775295211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3fsfsswKq90GCZ5KBvPDdKgMT6gZRRXzRnUoArjx2P0=;
  b=TaA+BjjmPrrNT6cBRIx5Iur8XXRAashIu8SlNzYz6FcIdorJ6hkYQs9w
   k/jOEL0416pZVza8mAOZZgXPGbnIYZ0wzTHcgdJY2IYDm2qyi24MdvU0V
   cnUZ68VrTj0X6lpeC0Q1PqZoyBKZWeemkKOQBDvYrWyBxpHIVdLI3mZTh
   r//lws/o4tRLG+UxQ7bZnwC+DYLJYQyudHmBIFkyj+YILk0TOSNzkJuKN
   VHeZKkOfESM7zGQ3vTWrepW4o/Nf9gZh/roornL/e9FOVchVnfnrPNwiz
   bGeii1/AYUFrf38vQtOztuXKfzMPE4YLMgnw5DXPckSTgsGorQaWROYUy
   Q==;
X-CSE-ConnectionGUID: z6dGjnoAQ0KslBpHFtB8rw==
X-CSE-MsgGUID: ZAafFu2ESlqQdCgWtp7KWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="70566399"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="70566399"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 02:33:24 -0700
X-CSE-ConnectionGUID: TcbGNtVlRdSBC4alfm3oiw==
X-CSE-MsgGUID: SfPB3+XSRnejDCjDnqmTGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="158248674"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 04 Apr 2025 02:33:14 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 12/12] ALSA: hda: Select avs-driver by default on FCL
Date: Fri,  4 Apr 2025 11:49:53 +0200
Message-Id: <20250404094953.3657679-13-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250404094953.3657679-1-cezary.rojewski@intel.com>
References: <20250404094953.3657679-1-cezary.rojewski@intel.com>
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

