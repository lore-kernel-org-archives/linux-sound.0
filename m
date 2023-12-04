Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fc3IECJd"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71EF7B6
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 13:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701725861; x=1733261861;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LfTgqR3Z1RJTlCNlCBB4stGwRlasy3Nypa9RyCdr6iI=;
  b=fc3IECJdDwLKz2DQlTYeyp72kC6pVOaYgBRgryBvOKt1OwUHqAEDiD7S
   z3jT/MoyLrP2TRHXxrqchvsWY9Gq+QQ/rkpFCtipRS97NnAKL0TO4oniz
   xO3gEoj6xdz308WmNGWd2ZV5nzTuOAJ9rDqoEVsS1J5gAB/jQJUJ1Al4F
   JPtoNcaaPgpk0/ggJN16NUoS3T92gA+K6BTqeH2g+Gf43bKjoSAaOAZXW
   aaDO6rfq59HyapK5l3C0oaSYbOf7z7zqlCdaa1cVeQhT0NEeX43W8/ZYC
   V6IOqVeHxJFkR2fk39H/dGPLZcIRIZxL3pIJQIvMb4A9Jp75QUobNfSfh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="675130"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="675130"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:37:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1102223762"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="1102223762"
Received: from akashams-mobl.amr.corp.intel.com (HELO pbossart-mobl3.lan) ([10.255.231.189])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:37:39 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Chao Song <chao.song@linux.intel.com>,
	Jack Yu <jack580304@gmail.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ASoC: rt722-sdca: Set lane_control_support for multilane
Date: Mon,  4 Dec 2023 15:37:21 -0600
Message-Id: <20231204213721.197785-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Song <chao.song@linux.intel.com>

The RT722 SDCA codec supports 3 data lanes,
lane_control_support property has to be
set to use additional two lanes.

Reviewed-by: Jack Yu <jack580304@gmail.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt722-sdca-sdw.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index a38ec5862214..e24b9cbdc10c 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -256,6 +256,9 @@ static int rt722_sdca_read_prop(struct sdw_slave *slave)
 	/* wake-up event */
 	prop->wake_capable = 1;
 
+	/* Three data lanes are supported by rt722-sdca codec */
+	prop->lane_control_support = true;
+
 	return 0;
 }
 
-- 
2.39.2

