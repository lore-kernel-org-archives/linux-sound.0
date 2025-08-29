Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A517D265CA7
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 10:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756464748; cv=none; b=WOua08kZfsIE+wILa4tRJUvc4FNTlMRFopFGbOFD11OPP4zw7VYLykb9HZP6gv9OD6ZuBQx3eEZSL/W4i5rrsJA//hpl7DhbBZJbpE8b9oy5IxyDDUxeKiqGEHEnPZkeh/SBrmH7hlmi3cSTrkw/IcQU5x9yu9mKZ84xILo3ei0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756464748; c=relaxed/simple;
	bh=8xwSRHcl0gZa5JDCOK1Q5AD1fQWCb6HNyrCxr9SjISQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GRGPVSj6VkhLbSf/JL6sC7j5u4Z/AlmCJZLRJ0YoZzjJfSysel575PVGK5RW5BWOLPwbLlO1I+f+LzOokG31A/SCsizHKFjm/FnAIts/KXG9qmjyGqUs0r6etLA4bLVmSTtFX7S+WzfNOSQhcsGbrsBcn0lh5IE70485OVgA4WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C0eJFU0P; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C0eJFU0P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756464746; x=1788000746;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8xwSRHcl0gZa5JDCOK1Q5AD1fQWCb6HNyrCxr9SjISQ=;
  b=C0eJFU0P4HmFwBO92YU7tNde2BofDEgpdvSHHia1V8onJMmOjjvYChZP
   dSsdj7wLpFTzr6Vdgn902//asNgNwAiODp6WZlrovlMDFQs2EELLhpa/9
   xuQuWK9jv51EDobHJfcq96xI6CEx58OELkY5IDOUOaLqpc+/t90LIkoDi
   pyh+qj7kGQXCLbWZS4FLWT0cTzzw9pFRmVOM4jWcJY+ZeEHEaALIhEfbW
   T6aBeuCnj3uautdcAQgvkmD6f+OwuBf1EVSFBKlLhtSHhs1hiLRxRtg4g
   Y8CSMMKX4ZDf6c2V60jtIve5ZhBBU2Iu7RZdSzrroNmTnf4HILjAJOmsb
   Q==;
X-CSE-ConnectionGUID: j84P1Uf1TqS1N9BesJH31g==
X-CSE-MsgGUID: Zycd7ZAPROmep7pfF3Bqtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="61383241"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="61383241"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 03:52:26 -0700
X-CSE-ConnectionGUID: nPispU0NQrO6DaF+pvTqQw==
X-CSE-MsgGUID: IJ+F2Hk3T0GSGJBdVj+a4A==
X-ExtLoop1: 1
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.56])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 03:52:23 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	seppo.ingalsuo@linux.intel.com,
	liam.r.girdwood@intel.com
Subject: [PATCH 0/3] ASoC: SOF: ipc4: Add support for 8-bit and float formats
Date: Fri, 29 Aug 2025 13:53:02 +0300
Message-ID: <20250829105305.31818-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

This series will add support for various 8-bit and float formats.

Regards,
Peter
---
Peter Ujfalusi (1):
  ASoC: SOF: ipc4-pcm: Add fixup for channels

Seppo Ingalsuo (2):
  ASoC: SOF: ipc4-topology: Add support for 8-bit formats
  ASoC: SOF: ipc4-topology: Add support for float sample type

 sound/soc/sof/ipc4-pcm.c      |  56 ++++++++++++++
 sound/soc/sof/ipc4-topology.c | 142 +++++++++++++++++++++++++++++-----
 sound/soc/sof/ipc4-topology.h |   9 +++
 3 files changed, 187 insertions(+), 20 deletions(-)

-- 
2.50.1

