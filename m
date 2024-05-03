Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54DF14A4C6
	for <linux-sound@vger.kernel.org>; Fri,  3 May 2024 13:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714743188; cv=none; b=hNnyDZtHpH7inh7wTlKttPzSDso+SrmPgqV5LTt1/mGIHUFQTV6BXaVl5YWnsNbCMYHF3N8BA2msymQGUAP3fxjjyksr3XZvu5RzZpqrS1hQVD9mhXKqhpNPevP6W+QWDP4tNAkpgvLZiIgd1/kPsGCjEFi1qa/0aKKhFVkhksQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714743188; c=relaxed/simple;
	bh=zSyuO6Kje+lI8CV89ruIv0tHijXiAxyK0TNFcZ5zZJ0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=IVY6mhaF6wkeBHkZPsbR9D18xlK3ctAcYSxNCBn6tlgkgmCTNgrgjsVTR1NrpnUdbC5JitYpZIKmHfBEnFpoWJMpa7Q6AmTFAr5PRCd52bAEn79ryQIVPJ3sYEweaZuM0L9Br7scLoNdwxb0ZoFkvpo6ypPgoyt7pWD47ZdnCmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UTwx1+1y; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UTwx1+1y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714743187; x=1746279187;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zSyuO6Kje+lI8CV89ruIv0tHijXiAxyK0TNFcZ5zZJ0=;
  b=UTwx1+1y3GDs68nbpIeBXJAVO1QVurHzaTEKMREEafL6y/XHrZR+PWgQ
   R8iV1tnJbOPNXFLSdISvDWYJXwKqTqfuflNUMA5Ad+3aDx1R3cmrHioMb
   Ofwe4+XTrKy+fG00pMwcPdQTaUK3Mkqw13sp1sfz2JPaOxE0XCwV/9fCc
   I8cF1NAceHeOUi729kcPJ4D+kYvjPOmu+svV0NzN+tcS2NA27m/P4yOOn
   cEJV1B9dYX5GKTOgGupKEuAHIGnIl0diZjemptQbui1bA/r4R8ifHzPCL
   tK6p4JaF5ty2OC7Ez4+Kz/c5ff+wxzBeE61dN7HKQVmRZlznlfANq9iSS
   Q==;
X-CSE-ConnectionGUID: 3yp32uCNQI++XpBzSAMlkA==
X-CSE-MsgGUID: 9+JvNCpzSM2q7VXGVn1azw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="13499102"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="13499102"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 06:33:06 -0700
X-CSE-ConnectionGUID: 2IaRme5cSNWQ4aT8Zknz9A==
X-CSE-MsgGUID: HCj/73mETSWgvdkraY2qqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27501175"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.113.3])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 06:33:02 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/3] ASoC: SOF: Intel: HDA/DMIC updates
Date: Fri,  3 May 2024 08:32:50 -0500
Message-Id: <20240503133253.108201-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The first patch handles a problematic configuration where the wrong
machine driver/topology is used: when the hardware reports an external
HDaudio codec the direction is to ignore/discard ACPI SoundWire
devices.

The last two patch deal with DMIC format configurations and allow
users to select S16_LE even if the DMIC and internal copiers only
support 24 or 32-bits. The code changes are located in sound/soc/sof/
but in the scope of Intel DAIs.

Peter Ujfalusi (2):
  ASoC: SOF: ipc4-topology: Allow selective update in
    sof_ipc4_update_hw_params
  ASoC: SOF: ipc4-topology: Correct DAI copier config and NHLT blob
    request

Pierre-Louis Bossart (1):
  ASoC: SOF: Intel: discard SoundWire configuration if HDaudio codec is
    reported

 sound/soc/sof/intel/hda.c     |   9 +-
 sound/soc/sof/intel/hda.h     |   2 +
 sound/soc/sof/ipc4-topology.c | 245 ++++++++++++++++++++++++++--------
 3 files changed, 196 insertions(+), 60 deletions(-)

-- 
2.40.1

