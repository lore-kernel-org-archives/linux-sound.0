Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A951D90C5
	for <linux-sound@vger.kernel.org>; Tue,  8 Oct 2024 11:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728385759; cv=none; b=U8yMTnC7qIeChA4gZvO6du6Zlvy/OT3kFxMEOEt1Sxzst/meS9upnFkFUb3lAn3z3asOyObl8ePrLuaL4WCyElPsBZWgd0Ev7QR5w4NDTrZb5Qmxz0yeOSQhysvOrI0974lnf7wuJ7oMpmarYzNxStMpspC3QS/3WxrliBaoS8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728385759; c=relaxed/simple;
	bh=6pG29jMF71hMIu4xdai57RGSSe8BzIFoAUI1jLjCAA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oq0Gcu3sMsRyalhseDTkTl2E67nfj3XsSKZAL0IIG7CsEh891JTqVcFRV4/dSeHXsBAjQzVlbX7Htz/ElFsLe9X1qZNiRP4jjDBA2axB/bvGMrpdpcLX0w/wcmpy2Jh+T8IUASbpQ7gjQwFYSpoQaG6B6DxsBXKF4H+HxM17IXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nv3tu4As; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nv3tu4As"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728385759; x=1759921759;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6pG29jMF71hMIu4xdai57RGSSe8BzIFoAUI1jLjCAA0=;
  b=Nv3tu4AsaS6yOCNQX8ia1P2yKBQJngUQdcU1PEIbAZ+yVvtESYXAdI7G
   unobwYbjo5AZsuIdGOSiR7t1q4NQChmld1mIy2n/pyt9jfym6hVxQOfMR
   nhaJ6X0tiJ68knhi4CU3XggYEwfy6LbkNuvK6fA0dVgUZwXmdVFEPNf46
   1NOMSddhZDxvxE4Vu1Dwy+8lYZQQjJI1irjL+HjRQ1LV9INqx1u5uvP39
   7DUM9Uh5rdiILfWoVIh4UIJICo12nPf+oisvJeW5qAxuyLgOidTuC8h/Y
   77k4sIYP50TFAnKlomvZrOd42aWVOrxLo7DU9G4XVfMSDStRG4bWZIOaI
   w==;
X-CSE-ConnectionGUID: LsMVIx54TgGuQQ90ckdzDA==
X-CSE-MsgGUID: weWUwArRTXmXYKiFU9rL5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="45036976"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="45036976"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 04:09:18 -0700
X-CSE-ConnectionGUID: Ey+5XgPVRK2RnCyqRQsy5w==
X-CSE-MsgGUID: 3GFfefTwTW6FaZ8I3AtKkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="80586636"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.49])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 04:09:16 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 1/8] ASoC: SOF: ipc4-topology: Drop the 'index' from 'Pin index' of format print
Date: Tue,  8 Oct 2024 14:09:29 +0300
Message-ID: <20241008110936.22534-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241008110936.22534-1-peter.ujfalusi@linux.intel.com>
References: <20241008110936.22534-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Printing the word `index` does not give extra information over printing:
`Pin #%d` which tells that the format line is for a specific pin.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 87be7f16e8c2..7967ec4c406a 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -195,7 +195,7 @@ static void sof_ipc4_dbg_audio_format(struct device *dev, struct sof_ipc4_pin_fo
 	for (i = 0; i < num_formats; i++) {
 		struct sof_ipc4_audio_format *fmt = &pin_fmt[i].audio_fmt;
 		dev_dbg(dev,
-			"Pin index #%d: %uHz, %ubit, %luch (ch_map %#x ch_cfg %u interleaving_style %u fmt_cfg %#x) buffer size %d\n",
+			"Pin #%d: %uHz, %ubit, %luch (ch_map %#x ch_cfg %u interleaving_style %u fmt_cfg %#x) buffer size %d\n",
 			pin_fmt[i].pin_index, fmt->sampling_frequency, fmt->bit_depth,
 			SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(fmt->fmt_cfg),
 			fmt->ch_map, fmt->ch_cfg, fmt->interleaving_style, fmt->fmt_cfg,
-- 
2.47.0

