Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OzzPIdV8"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C487BA
	for <linux-sound@vger.kernel.org>; Thu,  7 Dec 2023 14:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701988221; x=1733524221;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4mNgJNnotsHrJOFFxqMdimap3f18t/HV+ud7BxYhTaE=;
  b=OzzPIdV8Zgcmmv4YNudsYTryZBN5eWFHoeBNaftUps/OQqLTwcEOmkWp
   gDfElevD9IgjI6YihznicqyOamI+f/3MEJHCenRN6wx7mXhh3R8udh1iu
   myrU6qR/WjSun6IoMZqYiGZXlrEDqTkXrSX2p+WvGKokTDRsp/G4zh8Nr
   Vh5tix1pjjEwCyecDoX86rZZIyDCi1MM/4/Nv+CkCt99Fknbk4C2T84Ra
   fhcSMz1mqouonB6PQaNK78eU647Q08ZZW5UjrB/fU/SUU6KgTgSX6t5Fq
   tXKqEF0HbzyO86QrdXEq3V0eYHna34YRZfM/KwTMXo+raeaMOMSuWH8V8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480516665"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="480516665"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 14:30:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895307498"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="895307498"
Received: from hrcolco-mobl3.amr.corp.intel.com (HELO pbossart-mobl3.amr.corp.intel.com) ([10.212.148.159])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 14:30:19 -0800
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
Subject: [RFC PATCH 11/16] soundwire: intel_auxdevice: add indirection for BPT open/close/send_async/wait
Date: Thu,  7 Dec 2023 16:29:39 -0600
Message-Id: <20231207222944.663893-12-pierre-louis.bossart@linux.intel.com>
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

Mirror abstraction added for master ops.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel_auxdevice.c | 55 +++++++++++++++++++++++++++++
 include/linux/soundwire/sdw_intel.h | 16 +++++++++
 2 files changed, 71 insertions(+)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 93698532deac..1cdf4699cf2a 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -74,6 +74,56 @@ static bool is_wake_capable(struct sdw_slave *slave)
 	return false;
 }
 
+static int generic_bpt_stream_open(struct sdw_bus *bus,
+				   struct sdw_slave *slave,
+				   enum sdw_bpt_type mode,
+				   struct sdw_bpt_msg *msg)
+{
+	struct sdw_cdns *cdns = bus_to_cdns(bus);
+	struct sdw_intel *sdw = cdns_to_intel(cdns);
+
+	if (sdw->link_res->hw_ops->bpt_open_stream)
+		return sdw->link_res->hw_ops->bpt_open_stream(sdw, slave, mode, msg);
+	return -ENOTSUPP;
+}
+
+static int generic_bpt_stream_close(struct sdw_bus *bus,
+				    struct sdw_slave *slave,
+				    enum sdw_bpt_type mode,
+				    struct sdw_bpt_msg *msg)
+{
+	struct sdw_cdns *cdns = bus_to_cdns(bus);
+	struct sdw_intel *sdw = cdns_to_intel(cdns);
+
+	if (sdw->link_res->hw_ops->bpt_close_stream)
+		return sdw->link_res->hw_ops->bpt_close_stream(sdw, slave, mode, msg);
+	return -ENOTSUPP;
+}
+
+static int generic_bpt_send_async(struct sdw_bus *bus,
+				  struct sdw_slave *slave,
+				  struct sdw_bpt_msg *msg)
+{
+	struct sdw_cdns *cdns = bus_to_cdns(bus);
+	struct sdw_intel *sdw = cdns_to_intel(cdns);
+
+	if (sdw->link_res->hw_ops->bpt_send_async)
+		return sdw->link_res->hw_ops->bpt_send_async(sdw, slave, msg);
+	return -ENOTSUPP;
+}
+
+static int generic_bpt_wait(struct sdw_bus *bus,
+			    struct sdw_slave *slave,
+			    struct sdw_bpt_msg *msg)
+{
+	struct sdw_cdns *cdns = bus_to_cdns(bus);
+	struct sdw_intel *sdw = cdns_to_intel(cdns);
+
+	if (sdw->link_res->hw_ops->bpt_wait)
+		return sdw->link_res->hw_ops->bpt_wait(sdw, slave, msg);
+	return -ENOTSUPP;
+}
+
 static int generic_pre_bank_switch(struct sdw_bus *bus)
 {
 	struct sdw_cdns *cdns = bus_to_cdns(bus);
@@ -203,6 +253,11 @@ static struct sdw_master_ops sdw_intel_ops = {
 	.get_device_num =  intel_get_device_num_ida,
 	.put_device_num = intel_put_device_num_ida,
 	.new_peripheral_assigned = generic_new_peripheral_assigned,
+
+	.bpt_open_stream = generic_bpt_stream_open,
+	.bpt_close_stream = generic_bpt_stream_close,
+	.bpt_send_async = generic_bpt_send_async,
+	.bpt_wait = generic_bpt_wait,
 };
 
 /*
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 00bb22d96ae5..9e114df37a5b 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -423,6 +423,22 @@ struct sdw_intel_hw_ops {
 	bool (*sync_check_cmdsync_unlocked)(struct sdw_intel *sdw);
 
 	void (*program_sdi)(struct sdw_intel *sdw, int dev_num);
+
+	int (*bpt_open_stream)(struct sdw_intel *sdw,
+			       struct sdw_slave *slave,
+			       enum sdw_bpt_type mode,
+			       struct sdw_bpt_msg *msg);
+	int (*bpt_close_stream)(struct sdw_intel *sdw,
+				struct sdw_slave *slave,
+				enum sdw_bpt_type mode,
+				struct sdw_bpt_msg *msg);
+	int (*bpt_send_async)(struct sdw_intel *sdw,
+			      struct sdw_slave *slave,
+			      struct sdw_bpt_msg *msg);
+	int (*bpt_wait)(struct sdw_intel *sdw,
+			struct sdw_slave *slave,
+			struct sdw_bpt_msg *msg);
+
 };
 
 extern const struct sdw_intel_hw_ops sdw_intel_cnl_hw_ops;
-- 
2.39.2

