Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7408679F6
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 01:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724723042; cv=none; b=uCYKO9GfErv3lxZS22kb6MehKBgzm0HyPjSjxvnjzbxz9JnefhDIBoATrentsUm9l4LKMySKuX1dyBxLsFfVxxJoIa3OcqMPPGJ9i9TjKQ/J0uehdfUd9DW6SKoVY/lb5r2eCfONyqQZq2ChpUKCsQPA3cvxsARtrX2Z40P7kLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724723042; c=relaxed/simple;
	bh=hyKMyMBXgP+b4y3sT/vY+bGBaq0hxImDrTq+DdJRA5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gM2tXoYF0CIPHEbb6LHx7hVjq5P0j3y3Qt5jAM3F8/RszdzYLjnrVckijTJA6sn/58wWbTyYjvjNXwaMZA3U32f5eIXnq/6tAXVMsMj6Td2FqsSh6zP26GMwDEEt0BfaFWMgGZ8+KVcw+umOGbjaOYulJXh+/SKrefCBohTEzuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VWiwoxdS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VWiwoxdS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724723041; x=1756259041;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hyKMyMBXgP+b4y3sT/vY+bGBaq0hxImDrTq+DdJRA5g=;
  b=VWiwoxdSZ5hNEEUuaYy+CHrR3gfMMOfi130mYWnfLpfxLPg2eSB0HLPz
   r9HcensFngwx1gE9laj77UtniU++vxHujVNXsbJcUwRqBjYPFOO7h+9v0
   qzamAa4zhGkutyEcI0MOEVBzoHB85MVsiwGzAXzuN5rFl2hGe3/RZyKlM
   PWsupcgD1GFKKRx1BDAfzK1+gfzNbNOBrD4OFYOwl6DwEwxSBxJydZuG4
   tVlzHZDh455Vij6lphsNjOBCYNbGz0UiCLHILGP5iHo9Ng8Ypmr+kwMub
   Gj/e5ZK0rHNJID13xBQRiPZCu90XlA1Rdv4aWv++syGa9jFWcZNAy43vQ
   A==;
X-CSE-ConnectionGUID: ezmf4+fxS5e0uNZC1T2LFw==
X-CSE-MsgGUID: B10cW7PBSv2GFOxG/5YUpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22984910"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="22984910"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:44:01 -0700
X-CSE-ConnectionGUID: J8/3z3vXRf21kCcpERo07Q==
X-CSE-MsgGUID: VwiygFQaTCCR3Z8bxWVKxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="63427873"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:43:59 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 07/16] ASoC: Intel: sof_sdw: overwrite mach_params->dmic_num
Date: Tue, 27 Aug 2024 09:43:19 +0800
Message-ID: <20240827014329.6542-8-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827014329.6542-1-yung-chuan.liao@linux.intel.com>
References: <20240827014329.6542-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mach_params->dmic_num will be used to set the cfg-mics value of
card->components string. Overwrite it to the actual number of PCH
DMICs used in the device.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 3781a27bfbed..b06948c16b3f 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1108,6 +1108,11 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		else
 			dmic_num = 2;
 	}
+	/*
+	 * mach_params->dmic_num will be used to set the cfg-mics value of card->components
+	 * string. Overwrite it to the actual number of PCH DMICs used in the device.
+	 */
+	mach_params->dmic_num = dmic_num;
 
 	if (sof_sdw_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
 		bt_num = 1;
-- 
2.43.0

