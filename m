Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D011DF256
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 10:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463073; cv=none; b=LF+jNAhRNPf9mIE4FCCyJtdi+I//qtiYfoRVbg9qWLLNhnj4TcCBf6YGhqIeLSRv5TJLAxJSgnYZvFjtBnpXeQZNp6XAtVwb8F/IfjJV5TGjpGJ8RtVRdtjVj/YtvXo0M+sdXM9Ht7mL1pcvCZgGqbE5tY0o5mN+yRalpH+Cbm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463073; c=relaxed/simple;
	bh=PNOjjTa+xnkHe9QpAQhC7vvtK0VaTitj9DWvdLyfPOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nqw+4LHfxrx+Ins8KwkBTl4+SDmKcjwiObZevqKJ7oNQRFVsUVLLIed6ozQl8oQg3ggF9ZUuG2FK+Vm/6sdpjQMIKWIM47PEniz91XwRgazYw9OI047eis+Rr1XdVAQY7gr9tswq8IQmrAaMPtRqSTK3BOLKiXE3bS6+8arrpv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lPduRs6C; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lPduRs6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756463072; x=1787999072;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PNOjjTa+xnkHe9QpAQhC7vvtK0VaTitj9DWvdLyfPOI=;
  b=lPduRs6CJl7VOP/1oDmv2JZSgGdQkzA/oLk67HQukAqstUGfuyb+LlgQ
   emmapio3nzmaCY8vOwJPNU9sCsvZKVs8cCcBBxBZjno/FiuigZTSpacy3
   sMK31B2QuK2HM39qYgFYcTRQtnPH2EQ9HCu9bCZIje4GqMxlNeegmHMfI
   B5ZdybX8u+47ERVJv5y7zy9VzsCGWhHM/zRdTDig1x44zgqII7TPijnHq
   3jTOf/dfym33dVQizQk2KOoykysbINbRYgX9pJp8Xls6vRHm9h3iejerM
   kdYMWECnBGFobVIYlXIvSbwzBcFPPpapuPH894uxHmu3TTweOvnCpt0XW
   w==;
X-CSE-ConnectionGUID: 3WBaPPI7RtOifWkHK5PtDw==
X-CSE-MsgGUID: EkhkC6BHRHm/imS14vuGxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="76342700"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="76342700"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 03:24:31 -0700
X-CSE-ConnectionGUID: EibJq/yQQlqdoBJbGwFJww==
X-CSE-MsgGUID: CWl6q7onS3qlwtFdmaOZIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="194001725"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.56])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 03:24:29 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	jyri.sarha@linux.intel.com
Subject: [PATCH 0/2] ASoC: SOF: sof-client: Enforce client access scope
Date: Fri, 29 Aug 2025 13:25:08 +0300
Message-ID: <20250829102510.15159-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Up to this point we had a spoken rule what sof-client can access and what
they must not (they cannot use sdev directly), recently there were attempts
to break this rule as clients could access sdev via the sof client dev.

The series will re-arrange the client device struct to 'hide' the sdev (and
the list) from client drivers to prevent abuse.

Regards,
Peter
---
Peter Ujfalusi (2):
  ASoC: SOF: sof-client: Convert sof_client_dev_to_sof_dev into function
  ASoC: SOF: sof-client: Introduce sof_client_dev_entry structure

 sound/soc/sof/sof-client.c | 105 ++++++++++++++++++++++++++-----------
 sound/soc/sof/sof-client.h |   6 ---
 sound/soc/sof/sof-priv.h   |   9 ++++
 3 files changed, 83 insertions(+), 37 deletions(-)

-- 
2.50.1

