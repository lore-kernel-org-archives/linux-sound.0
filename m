Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DAA1DE4C1
	for <linux-sound@vger.kernel.org>; Tue,  4 Feb 2025 05:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738647594; cv=none; b=V8uhRcfaKDXtSU/0gw48DgkSyssG23o/cPmNctoFqQ49w3efBJxoLnKIebAHXpfERK8INOcycPROc36MCgDcd9jo68luC4KeNQDZnBJocF2PHe5sPqaaCPq4ypYjaXEZxVpZVxYLyd/hufCXDaPSU2qs9beKz83Gh/tZ93I9ppI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738647594; c=relaxed/simple;
	bh=PwToX+ytx54HJtlWL+MXLP9bSAQOyEJTUbg6Cct5sdI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s0jJkI+Y7BO1n8A2BKKrAyXFdeCF1JqyeTQHBwkPD+Cwzv86xtUNpy+WTVpt5SPgJAz8DVaa7F5GUT92tUrM7QU0D5QRQtxe6pCUl9Y7EUPjvc0PRKvvS8oLsctsWkrMRH2bCx136YqcNC39pruKZ3HSTzkY4lR4xuME43HIMtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YwVXuxQW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YwVXuxQW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738647592; x=1770183592;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PwToX+ytx54HJtlWL+MXLP9bSAQOyEJTUbg6Cct5sdI=;
  b=YwVXuxQWNnI8q+Jtwxsg0q83hIJRsN0FZ0iPhYUOFRjBRUEhyrAG5RmK
   Mh7GbwQTaTudesMgITLEzdQsayL3SuI39xEJr7/kQpFnraG3F56bEDZmP
   FMITwn9PVCmoSpytjw9N7CoTpsPS+s5T2GdkFtDbg2o+nCWjnOTEDgFmZ
   acez1UjSnGsn8G2LsAsm2dEdF1EmZIkipKUP+EEYEkBWxU7AvmSSRAT2S
   bmj7FL+zlCIIrDeCxHGw9cvYKiV+ekB/zcVi2ZpmzL9RtxLiFMH/E2ypX
   fG7h1tbPUIFPKQX+R66QOHabxmSp8mU+UR6Yk2kouAkN+XwvS3FuzkeEb
   g==;
X-CSE-ConnectionGUID: z3ldW9wtSGO9M4DB1VbPAg==
X-CSE-MsgGUID: HKi6JjBtT0iJVUTSvE0Elw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56590568"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="56590568"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 21:39:52 -0800
X-CSE-ConnectionGUID: qFeLaUTRRc2kF6Vd5n20mg==
X-CSE-MsgGUID: MppjgUR4TgymLnTPULfk5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="115492004"
Received: from iweiny-desk3.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.111])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 21:39:51 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 0/3] ASoC: Intel: sof_sdw: Add support for new devices
Date: Tue,  4 Feb 2025 13:39:40 +0800
Message-ID: <20250204053943.93596-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for Asus Zenbook S14 and Fatcat board.

Richard Fitzgerald (2):
  ASoC: Intel: sof_sdw: Add lookup of quirk using PCI subsystem ID
  ASoC: Intel: sof_sdw: Add quirk for Asus Zenbook S14

Uday M Bhat (1):
  ASoC: Intel: sof_sdw: Add support for Fatcat board with BT offload
    enabled in PTL platform

 sound/soc/intel/boards/sof_sdw.c | 41 +++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 6 deletions(-)

-- 
2.43.0

