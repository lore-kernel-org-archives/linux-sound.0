Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D4D63D5
	for <linux-sound@vger.kernel.org>; Mon,  3 Jun 2024 07:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717399922; cv=none; b=amj9iV6XyRdZBqXRw4ypp0YOgRZd5mRVXilqUGp3VyuWYDauPvN6xWVVOt08XdcJoCgJ5nu9QtUHZdAvZrP8IvOvUXalOqJWC9RYlkueadZqkpT9W/D6Su7aMZvSGFFn/01nsHmQcfr2ifdKYfrxy4ycntKOUYoDmzSbwmr9R7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717399922; c=relaxed/simple;
	bh=ntS9Gy90n6f0CemV5d+NiFWwyEP2n3otqbwTMqqZPmM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q4ieB2LwSv85awXUZ7gMhy0I2wnfcsLz/83Z6NamI2DGvPiv3nxkrWSdXFplIhFoTvZzb61AhNBcbIJqPVa/vzhWZhno9vaIVCyo+nwVZ9AXSM/Ya8OlNnTUbz1bM4TePLNOqrReKdkcQba63QbCBwVhFPFPgWCPF2zpiszWx9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nwQXQ8oH; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nwQXQ8oH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717399921; x=1748935921;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ntS9Gy90n6f0CemV5d+NiFWwyEP2n3otqbwTMqqZPmM=;
  b=nwQXQ8oHKMffCcXpryIkO1QEqUlvuz2phz0f9cYqwBwPrmvB8/fCsk3t
   fcuIDOG/dahmUtT9r3eWpxKDZlGlshQY5VSSss5x17K4IA05BJuwwIL8W
   gmVLwkw4vywjc2H7tLIFEEVDPWOjs17PZfM8sLmHSdN0TWWSr8CmUrTml
   xmVXFe7G2rAVShAm6dsLGTsbbvV5tpQ4e6Gfiyw+dwwkj13o4qUC/91a9
   eTL77R0t5jLvH9yGR2x1GkYnDoNJGVHlvbTRPa3MIDEmN+f7tFxq4wsgL
   fJVmSHlA+u3V5wM3OSQ8qZ6sAG8Zenvz9NAbjwGrLzPHj8T0dtthtreuf
   g==;
X-CSE-ConnectionGUID: xnHSpmfNQ7eDKbett+BTzg==
X-CSE-MsgGUID: 9Z5oqFS3Sj+KkuAVh5lXKQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="13729077"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="13729077"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 00:32:00 -0700
X-CSE-ConnectionGUID: LR7qiP0ZS2mKIJwuhkiE0w==
X-CSE-MsgGUID: pgnwgKGVQxeLwW8bMh06+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="36787941"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.158])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 00:31:58 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 0/2] ASoC: SOF: Intel: hda-dai: skip tlv configuration for DSPless mode
Date: Mon,  3 Jun 2024 10:32:22 +0300
Message-ID: <20240603073224.14726-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Thesof_ipc4_dma_config_tlv() call makes no sense in case of DSPless mode since
it is a configuration for the firmware.

Regards,
Peter
---
Bard Liao (2):
  ASoC: SOF: Intel: hda-dai: skip tlv for dspless mode
  ASoC: SOF: Intel: hda-dai: remove skip_tlv label

 sound/soc/sof/intel/hda-dai.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.45.1

