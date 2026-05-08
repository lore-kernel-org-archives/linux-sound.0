Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788D43BFE44
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 09:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778232756; cv=none; b=rksxqnn0kQ1kxbvvGJn3hXgA5yxJW0sFhcDPRIXt5qXoWdtOulcUHVlg7YmHdQwyMTkVwWBfa35hiXgIQMUZg52qFFoMA3QCr++dT+8QwIKQG28GdRE08uCtD1R33+JIIegu6REhlN9Pk0N+lusvhDW8Nku9tkWYg9z8k/Mmlsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778232756; c=relaxed/simple;
	bh=8IJPdf26/k7gcfTUwQXngt3A+vz8KPLiFMH2g15xYlI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DRTjvfBwE1lXWhk3X9Ak3mYKTW6H5TsAKKgsnkz1TAfg0P2eHGCLOy++1rizKSBmXtRsQLaBYbvIUUSGkgRwtdUePsaLqsM5sIdmLD2AerLb0RHd13p0lz85uQ9G1c4GW1YmIgCt8LYyzGZReJrO2TUJ9Du1IDlHp84nZAWrBz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G9gLkSgc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G9gLkSgc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778232756; x=1809768756;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8IJPdf26/k7gcfTUwQXngt3A+vz8KPLiFMH2g15xYlI=;
  b=G9gLkSgcDLyOjnuCZYrH677uftRut6t6Itst7UxQqR2FsAh6O5ofF/nM
   tSyt0jkpIxZoVcKXTnwikm5gijQbMgt2mOjLozQf+a9MvejejR+MgmJpI
   t4gaHte/2IubBRDu9OLOrOozidjULLrEY0tuFBj/UJzXbGew2BtgqnmI+
   mdlegS4bmDm/tjvzKaMRHhOhIZT5QjpMWoIiE3nifofvJRFQVEbEppMCp
   4E4oxQs2tg3zP7tR9DECQX7kqAw3Z1eG1bJ6GUqUt2vmx3tj6kn3QE2G1
   mAHKw5RL5soD/T6cmdpL626bnt1+Dj64EHkVnp1qe4uOEG9aUtp/wDP+Z
   w==;
X-CSE-ConnectionGUID: H3w0U8dATpWN3R8PcTgisA==
X-CSE-MsgGUID: 2Hol6mb6SN2i4od/Bp6+PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="96621863"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="96621863"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 02:32:35 -0700
X-CSE-ConnectionGUID: eXuQYEZJQtWOHFFTlaN4xg==
X-CSE-MsgGUID: zgh5cPNJS9O7trENZVLCAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="236840355"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 02:32:34 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	mac.chiang@intel.com
Subject: [PATCH 0/2] ASoC: sdw_utils: make RT712/RT721 CODEC_MIC be optional
Date: Fri,  8 May 2026 17:32:22 +0800
Message-ID: <20260508093224.1246282-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RT712 and RT721 codec mic are optional and are not used on some
products. Add a quirk to make it optional and skip the codec mic DAI
when it is not present in DisCo table.

Mac Chiang (2):
  ASoC: sdw_utils: Add quirk to ignore RT712 CODEC_MIC
  ASoC: sdw_utils: Add quirk to ignore RT721 CODEC_MIC

 sound/soc/sdw_utils/soc_sdw_utils.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.43.0

