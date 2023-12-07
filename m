Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="idxPcbvj"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8945911C
	for <linux-sound@vger.kernel.org>; Thu,  7 Dec 2023 14:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701988217; x=1733524217;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uiyA/2gfS2gL3oHUJD4rZf2zZF4q2znJkQE1RjzObzE=;
  b=idxPcbvj4SMJgDwFzoBBJQQ5DT1vGoAMO5G95c0Q2XjwEvwpUkbRxSv1
   c9hkVgK1uebjAQY02K49NyczSC2jgmunta1p48rki2HtFYrtelNcZ9EjL
   JAdlowjHm/w8yAgQ/XP288j9rLozBKeQY0xGhP+Yr/5OzVxcw3BJnnqHt
   NGf0IOoYfOpkgL0+clPtSbEFeW55ei/ZBNPsbR/SnZpWIg5MaVk9ITBbE
   1fxcFTmz80n5yp7RXUpnCZawrShRsNjbio9lEL4f2V0gybdWWlggEKgtQ
   TB6DlAU+esBSMkzxgk/+hNDPF/Gy1psfUstX/pAIEXW0KxleahFRpDhG8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480516640"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="480516640"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 14:30:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895307487"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="895307487"
Received: from hrcolco-mobl3.amr.corp.intel.com (HELO pbossart-mobl3.amr.corp.intel.com) ([10.212.148.159])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 14:30:15 -0800
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
Subject: [RFC PATCH 08/16] soundwire: bus: add bpt_stream pointer
Date: Thu,  7 Dec 2023 16:29:36 -0600
Message-Id: <20231207222944.663893-9-pierre-louis.bossart@linux.intel.com>
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

Add a convenience pointer to the 'sdw_bus' structure. BPT is a
dedicated stream which will typically not be handled by DAIs or
dailinks. Since there's only one BPT stream per link, storing the
pointer at the link level seems rather natural.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/linux/soundwire/sdw.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index e54c5bbd2b91..8db0cd7d0d89 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -965,6 +965,7 @@ struct sdw_master_ops {
  * @stream_refcount: number of streams currently using this bus
  * @btp_stream_refcount: number of BTP streams currently using this bus (should
  * be zero or one, multiple streams per link is not supported).
+ * @bpt_stream: pointer stored for convenience.
  */
 struct sdw_bus {
 	struct device *dev;
@@ -996,6 +997,7 @@ struct sdw_bus {
 	int hw_sync_min_links;
 	int stream_refcount;
 	int bpt_stream_refcount;
+	struct sdw_stream_runtime *bpt_stream;
 };
 
 int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
-- 
2.39.2

