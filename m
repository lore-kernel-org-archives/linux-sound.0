Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4501C6FF5
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 09:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778233682; cv=none; b=Zo66DXVXMAUDCv0YtlSY+cy61xzZPkY6093qmhMkmtkgwGb+iZz5QazTMEKGwNywic0FDJBkdIb0EKzD/3lS/SiNiGfBCWIkxUMfWAgci/yMqqNucLLhrYW0ftW6PJK/tBudKT4rwxV4rHwEYEjJNX1OjJfFVYc+xMGo6ZnnbSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778233682; c=relaxed/simple;
	bh=7GuY5zElsnoVMw4lSRIjCmyybUv1omBXwg00FU/kQQs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H4Puvh8x9D9G4IRuG+xlVVED3OoICOr1zWp0nuX8BWx2a51eDCbB1TpZP4IkjtmU1tJm4OseH4Cv8AcXbrrfgQp4wE6ypZPJNU1to/x/a165OZov9XiVn/FB5Q/Sj8xuVboNRB6FB3GmmATQwSZASyR3FUU099NMG9euLqNcxco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hV5iiV0n; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hV5iiV0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778233680; x=1809769680;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7GuY5zElsnoVMw4lSRIjCmyybUv1omBXwg00FU/kQQs=;
  b=hV5iiV0n4Mvj+ai28BlgqOpUDOUtwEe1Hqwyu3Gd1RHK+Zyzw9Lzg9O1
   jyWX2DuChLg6OU4pXrqk7k2W9Bn2YOanXj5+izanf2EigBsOgzxl4q+KO
   ToDAeE4JmiEpY3/qHfZpMpY00Iro9FucsHvkmVCsJIq6XF9PSGhWXC4FE
   ijn9y9SoMhWAgAfg9x7g3he1zfVnG+Hhm6+JR1mY/iQufTkJUfyv+RKEG
   COBpVcRd3pTYssB01pV+FrUq5BV8BxW6O827fwur95ATJBTdxpMqzP7zB
   TOKoGWNddKG52n+cceF+mk3lR4RjUb8q0TtWUipNMqcDe0C1c+Rn7LKMn
   w==;
X-CSE-ConnectionGUID: 7MDcbH4oTLqA5TqkwpcmJg==
X-CSE-MsgGUID: qwrwB3eMQ8SkSAfrXhaXQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="78221305"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="78221305"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 02:47:59 -0700
X-CSE-ConnectionGUID: HsUKOtEuS9ilUKq1Q1WxGw==
X-CSE-MsgGUID: h1vSfDU8QMCeErmcfU5Izw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="232380693"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 02:47:58 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 0/2] ASoC: soc_sdw_utils: skip aux device if it is not present
Date: Fri,  8 May 2026 17:47:48 +0800
Message-ID: <20260508094750.1246796-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ASoC: soc_sdw_utils: skip aux device if it is not present

Similarly to codec endpoints that may not be used [1], aux devices (like
HID) also may not be used. Hence skip aux devices which are not present.

Also update the comment above is_sdca_endpoint_present().

[1] https://lore.kernel.org/all/20250414063239.85200-12-yung-chuan.liao@linux.intel.com/

Maciej Strozek (2):
  ASoC: soc_sdw_utils: skip aux device if it is not present
  ASoC: soc_sdw_utils: Change comment into proper kernel doc

 sound/soc/sdw_utils/soc_sdw_utils.c | 86 ++++++++++++++++++++++++++---
 1 file changed, 77 insertions(+), 9 deletions(-)

-- 
2.43.0

