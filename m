Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G1oPLRHb"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49459D53
	for <linux-sound@vger.kernel.org>; Thu,  7 Dec 2023 14:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701988209; x=1733524209;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u4/yWFhGYkVI8D1iXkWMb8DzoHd+jsVaXCeuqfKMjdM=;
  b=G1oPLRHbrt+eU4S79JOGbMrnSVXUXEPxtXr46npiYonD60iLC08/e3aq
   8LcI7p7ByOGLdbsgwzmq7wu+iopfpO4VQNxBij+6wZ0e2XNIIZD8OD3nj
   ZEVcU2wP/nkw3EK8TN9d7IG+3QnVCxE9n6oOJUDcRQpZaO9K2fRnxblsD
   ycYGoLJImpzurgExiDkgFArPCZq4FqzP6ho0ihOWjRIXgDQzOkXEHSKnN
   zqWCy4lyS1avGl003YeQIWMNGj40Mh+diasKmxGQyQZuGj47Fh87x0xIo
   hpgW925ZBIYBf7uhn/mgCpLUgiuMipYjM4jLD8bp02N+xvmF+6l57IPR8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480516578"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="480516578"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 14:30:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895307464"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="895307464"
Received: from hrcolco-mobl3.amr.corp.intel.com (HELO pbossart-mobl3.amr.corp.intel.com) ([10.212.148.159])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 14:30:07 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH 02/16] soundwire: cadence: add BTP support for DP0
Date: Thu,  7 Dec 2023 16:29:30 -0600
Message-Id: <20231207222944.663893-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The register definitions are missing a BULK_ENABLE bitfield which must
be set for DP0.

In addition, the existing mapping from PDI to Data Port is 1:1. That's
fine for PCM streams which are by construction in one direction
only. The BTP/BRA protocol is bidirectional and relies on DP0 only,
which breaks the 1:1 mapping. DP0 MUST be mapped to both PDI0 and
PDI1, with PDI1 taking care of the TX direction and PDI1 of the RX
direction.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 725222036853..bb623f82826c 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -183,6 +183,7 @@ MODULE_PARM_DESC(cdns_mcp_int_mask, "Cadence MCP IntMask");
 #define CDNS_PORTCTRL_TEST_FAILED		BIT(1)
 #define CDNS_PORTCTRL_DIRN			BIT(7)
 #define CDNS_PORTCTRL_BANK_INVERT		BIT(8)
+#define CDNS_PORTCTRL_BULK_ENABLE		BIT(16)
 
 #define CDNS_PORT_OFFSET			0x80
 
@@ -1831,13 +1832,20 @@ void sdw_cdns_config_stream(struct sdw_cdns *cdns,
 
 		if (cdns->bus.params.m_data_mode != SDW_PORT_DATA_MODE_NORMAL)
 			val |= CDNS_PORTCTRL_TEST_FAILED;
+	} else if (pdi->num == 0) {
+		val |= CDNS_PORTCTRL_BULK_ENABLE;
 	}
 	offset = CDNS_PORTCTRL + pdi->num * CDNS_PORT_OFFSET;
 	cdns_updatel(cdns, offset,
-		     CDNS_PORTCTRL_DIRN | CDNS_PORTCTRL_TEST_FAILED,
+		     CDNS_PORTCTRL_DIRN | CDNS_PORTCTRL_TEST_FAILED |
+		     CDNS_PORTCTRL_BULK_ENABLE,
 		     val);
 
-	val = pdi->num;
+	/* The DataPort0 needs to be mapped to both PDI and PDI1 ! */
+	if (pdi->num == 1)
+		val = 0;
+	else
+		val = pdi->num;
 	val |= CDNS_PDI_CONFIG_SOFT_RESET;
 	val |= FIELD_PREP(CDNS_PDI_CONFIG_CHANNEL, (1 << ch) - 1);
 	cdns_writel(cdns, CDNS_PDI_CONFIG(pdi->num), val);
-- 
2.39.2

