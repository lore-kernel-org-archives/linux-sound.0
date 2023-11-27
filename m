Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a8SHNmwh"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04AA7EA
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 04:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701086789; x=1732622789;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FmZHUbgfxcD8wfSdcyZNeRwAwPqOZS+OqQ2TAzPCkmE=;
  b=a8SHNmwhjHTJXuWz1YNFhpheVHjz45X7pk8UCfbKH7i2So9B1YdXPjse
   0M4XD+Y9zSoys+ER6uBut3sLK/9AwcV/0z6tORvbgr1iI8WDm4wUr9Lof
   DP9GO0680AwHYqTDqfsF8ArvlaLkC9CJ85LQFbQTHg9+q6ryj1tDTVS/e
   lj+Gzl3Lup769YsOBUmiv00qDnWlauZr6ltq1N8Iwqntx4XXpsIw7e6Q0
   +sPS25Xuq4Bm3doYK6l5a7mWfLZRsCDup98YvF7CsvWafD4CE/bfZQq/k
   8HIGeiVPRw5iBvZspeqvpxr8Y3TltJ0yyDeXmYwC/WcAHUGUwbnze+uRl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="14249599"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="14249599"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 04:06:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="859035573"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="859035573"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 04:06:25 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	brent.lu@intel.com
Subject: [PATCH 1/2] ALSA: hda: intel-nhlt: add intel_nhlt_ssp_device_type() function
Date: Mon, 27 Nov 2023 14:06:56 +0200
Message-ID: <20231127120657.19764-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127120657.19764-1-peter.ujfalusi@linux.intel.com>
References: <20231127120657.19764-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Add a helper function intel_nhlt_ssp_device_type() to detect the type
of specific SSP port. The result is nhlt_device_type enum type which
could be NHLT_DEVICE_BT or NHLT_DEVICE_I2S.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/intel-nhlt.h | 10 ++++++++++
 sound/hda/intel-nhlt.c     | 26 ++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/include/sound/intel-nhlt.h b/include/sound/intel-nhlt.h
index 53470d6a28d6..24dbe16684ae 100644
--- a/include/sound/intel-nhlt.h
+++ b/include/sound/intel-nhlt.h
@@ -143,6 +143,9 @@ intel_nhlt_get_endpoint_blob(struct device *dev, struct nhlt_acpi_table *nhlt,
 			     u32 bus_id, u8 link_type, u8 vbps, u8 bps,
 			     u8 num_ch, u32 rate, u8 dir, u8 dev_type);
 
+int intel_nhlt_ssp_device_type(struct device *dev, struct nhlt_acpi_table *nhlt,
+			       u8 virtual_bus_id);
+
 #else
 
 static inline struct nhlt_acpi_table *intel_nhlt_init(struct device *dev)
@@ -184,6 +187,13 @@ intel_nhlt_get_endpoint_blob(struct device *dev, struct nhlt_acpi_table *nhlt,
 	return NULL;
 }
 
+static inline int intel_nhlt_ssp_device_type(struct device *dev,
+					     struct nhlt_acpi_table *nhlt,
+					     u8 virtual_bus_id)
+{
+	return -EINVAL;
+}
+
 #endif
 
 #endif
diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
index 2c4dfc0b7e34..67d3e834c647 100644
--- a/sound/hda/intel-nhlt.c
+++ b/sound/hda/intel-nhlt.c
@@ -318,3 +318,29 @@ intel_nhlt_get_endpoint_blob(struct device *dev, struct nhlt_acpi_table *nhlt,
 	return NULL;
 }
 EXPORT_SYMBOL(intel_nhlt_get_endpoint_blob);
+
+int intel_nhlt_ssp_device_type(struct device *dev, struct nhlt_acpi_table *nhlt,
+			       u8 virtual_bus_id)
+{
+	struct nhlt_endpoint *epnt;
+	int i;
+
+	if (!nhlt)
+		return -EINVAL;
+
+	epnt = (struct nhlt_endpoint *)nhlt->desc;
+	for (i = 0; i < nhlt->endpoint_count; i++) {
+		/* for SSP link the virtual bus id is the SSP port number */
+		if (epnt->linktype == NHLT_LINK_SSP &&
+		    epnt->virtual_bus_id == virtual_bus_id) {
+			dev_dbg(dev, "SSP%d: dev_type=%d\n", virtual_bus_id,
+				epnt->device_type);
+			return epnt->device_type;
+		}
+
+		epnt = (struct nhlt_endpoint *)((u8 *)epnt + epnt->length);
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL(intel_nhlt_ssp_device_type);
-- 
2.43.0

