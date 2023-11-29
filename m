Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CY87ATiR"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9474C4
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 05:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701263618; x=1732799618;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PiVe9U4U1W5hG4xscPTKgCHmOs8bL4bJ2WtBt7pjeWU=;
  b=CY87ATiRLPKSqUiJgcLkFLnrQqnHJ4DzVvZQ9mSGSk6bLYt0zA7gPZkE
   FybiK5MOOpBZcuhgBIviZrR/2pfeJVH5iekoWl7BAy6tD/JRkvIYZ/T3Q
   XD/xVSN2ch6JFMhct4vbB+LPhCjM8b29LQrPRWUyGPi+hz7BYtGSQS8f+
   Jbg2ZBjpTEZAXpzB1UVG6pGDoBDwXoTS6a6ddx61ocVX1ygVWOXl9Jnlf
   7zGwz/2rcJ7TfjVIsDNQM5qia0noAaj8v0tx0CF6G7sa5V5RNVmkHZCOi
   FJpixkVwvBMdPgHrY2zyUcxxR2906XBow0kWcDDmEqtqe1Ss4bqnpxIBk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="383553814"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="383553814"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 05:13:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="912850181"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="912850181"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 05:13:35 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 0/2] ASoC: SOF: ipc4-topology: Correct IPC message struct layouts
Date: Wed, 29 Nov 2023 15:14:09 +0200
Message-ID: <20231129131411.27516-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The SRC and GAIN module defined it's kernel side private struct in a way that
part of that is used as IPC message without making sure of proper alignment and
padding, which happens to work but it is better to be not 'clever' about these
sort of things.

The two patch corects this overlooked detail.

Regards,
Peter
---
Peter Ujfalusi (2):
  ASoC: SOF: ipc4-topology: Correct data structures for the SRC module
  ASoC: SOF: ipc4-topology: Correct data structures for the GAIN module

 sound/soc/sof/ipc4-control.c  | 20 +++++++-------
 sound/soc/sof/ipc4-topology.c | 52 +++++++++++++++++------------------
 sound/soc/sof/ipc4-topology.h | 34 +++++++++++++++++------
 3 files changed, 61 insertions(+), 45 deletions(-)

-- 
2.43.0

