Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568F912B6F
	for <linux-sound@vger.kernel.org>; Mon,  8 Jan 2024 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FLI+X1x/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704707269; x=1736243269;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uR9cKFSgbtFW5NWjgAz89/toSKmi9TMME9XsEJO+SjI=;
  b=FLI+X1x/fdzCKreNwduhELKa/cjMpXYxzzFI7AFCcmdTz78DLfiO1fr4
   EIy4tjzkQYvcxR7pXg5qXte3XwqMZsz8DrMVPEipM0KmsYKfkRsGZkfmG
   umrfxtZGUlwRTX9ANpavvND8VLz93rWXUfJVV+ffXmjBAoD9t69qoeHmO
   qV993gpyZzLyOxAKbBSvwkUmazTPFmdYSLwaYVNXVhyYc+q9sOGbfpa3f
   7T+GWivsmE5BhocrBzvW+VvDlBFdbR08Sf024W6MsP4DcraRbaj3E4szP
   +PT7msxEZIqFpA9oQMxFHsKyz8QuqcGY7U6hRhYMG+fyUILNiC75+sfA/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="5208148"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="5208148"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 01:47:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="23112984"
Received: from scivlik-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.36.203])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 01:47:46 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kuninori.morimoto.gx@renesas.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 0/2] ASoC: Intel: bxt*: Fix regression caused by COMP_DUMMY changes
Date: Mon,  8 Jan 2024 11:48:40 +0200
Message-ID: <20240108094842.28782-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

We just noticed that
13f58267cda3 ("ASoC: soc.h: don't create dummy Component via COMP_DUMMY()")
caused regression (NULL pointer dereference) on GLK machines beacuse the
drivers are using the codec name or dai_name to find the link to apply a fixup.

13f58267cda3 is sent for 6.8, so these patches are going to be needed to be able
to boot these machines.

Regards,
Peter
---
Peter Ujfalusi (2):
  ASoC: Intel: bxt_da7219_max98357a: Fix kernel ops due to COMP_DUMMY
    change
  ASoC: Intel: bxt_rt298: Fix kernel ops due to COMP_DUMMY change

 sound/soc/intel/boards/bxt_da7219_max98357a.c | 6 ++++++
 sound/soc/intel/boards/bxt_rt298.c            | 3 ++-
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.43.0

