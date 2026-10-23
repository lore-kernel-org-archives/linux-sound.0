Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792753135;
	b=adGWqc10bETK/smrEzIFeZufziVeDCaha/kYvVGsoP5NDojK/zV/sKhhby2evWAtTmmY
	 I/I59tEqCShMPKVpnCOLkW1Dur5UWwYdXADnr9FVhQ6ebVO2kJmsPkvx7J5EfV+trqyfC
	 TMiF/jjwVvd2GriW0T+EQpncUQvs2jaqsVjJpzXMxbq1jAj1q41yxbgNNachEJr8vx+q4
	 RhACydpzP9aqdGkS1VlVM1j+zq7Alc8mmFYuz8kJNdWynyPcLxdLI4Ixmxs/2YZXD5N4A
	 6hYGcVsB4m6WroL16ed0Q61BMTuZytpI5cSI3IVrmVW0xYjBS/BSC4gaqcNFuOb7Sqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792753135;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=mIvlBW4/GPpeN7cz2hYJwdVs9l/VuWPUrt8q/81ovY8=;
	b=ii122/EEQq9EqZv+fBfBSBH/VKI9565kIKCWJq0mWdqeoKtXRGkj3Q6x/LAQ8CkA2NHQ
	 lmR7PZapZL7az/zkb4TCWW/bjp5NBsgU0zPJnOa2IdJyYv+5Uyg0ykU4WCIr9CMKx+zfC
	 ROt3qsd5am+IWJ693aS2PuuSbQajy0SUEn2+4m9iUqHKa+xBbhB/47PS+Gk8BYu8ZOIIL
	 iAnW/uBt/nclPXmXI1RztrCQk9iohcnDZy347GEmIRygTeW3c96R4Cv83NHlJuHNz1DBC
	 9aTAw8RMJ9ubgN5z4FC/rvS429svYpSpqFPfsFPf8OTIfHx0ZWA/bmfBldfoRqMyiSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fQUuuLAu;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857E4606A329
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 10:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 857E4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fQUuuLAu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792753134; x=1824289134;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9KqghvwdXIRR0e/GJhC48I7fwYf2pFzFP80DYjlgEms=;
  b=fQUuuLAuhMpndzYjx0p73kHpl98YOGjY5G2fOVk699FZBikigZanMCdZ
   xTRcaYeOL+Epw95FTl4MTv1cr1GTLJOjQ+dQsv4mF+AY0VAqA2LHraxvf
   A073sOq3nltMs54htdobE/LgikM5NONbKcX6Gv/GQuT3bK1j38ZMZzWuQ
   3lj/Z5sI+QgGZRGaPIfWThDgQ+ZmANd0oqFgXEbCDMwo9sJFrq80MnjFI
   69Rtj/zVaAjSbU4UATlGUOPeYn2ZhsVEPVteOjmwm/POKBHUVKGiusMW4
   +X3zNXyRCAOCtli9RUzlF6VERI1DEwgxiknWRKFAcPv2qMHyMuRxqJVlu
   g==;
X-CSE-ConnectionGUID: 9fZRlfxbR7SwsrbdZ2LwqQ==
X-CSE-MsgGUID: Ne/LA3FMRcG+pWB/HqTLUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1605834"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1605834"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 03:58:54 -0700
X-CSE-ConnectionGUID: /nnG6bK7Qie+ACmureVY4A==
X-CSE-MsgGUID: QFx7hUSFSaqaXw6IMAu3UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3681767"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 03:58:52 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH RESEND 0/2] ASoC: Intel: soc-acpi-intel-arl-match: add
Date: Fri, 23 Oct 2026 18:58:41 +0800
Message-ID: <20261023105843.2257167-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add rt712 and rt713 + dual rt1320 configurations.

Bard Liao (1):
  ASoC: soc-acpi-intel-arl-match: add rt712 on link 0 config

JJ Gault (1):
  ASoC: Intel: soc-acpi-intel-arl-match: Add RT713 + dual RT1320 support

 .../intel/common/soc-acpi-intel-arl-match.c   | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)

-- 
2.43.0

