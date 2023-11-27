Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dVqIGBkV"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFCC1E1
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 04:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701086792; x=1732622792;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JNxAhFhfV59tZwezM3pRBKq1Yh/nncfhSJlbVm+Ksak=;
  b=dVqIGBkVDgCF/0o4/f7goKqJHctca4u732l/tSoNWwRtM5Yl38zLRGUn
   uOS95HJTURizqSDvs38Bpna+zhapEbt+OgegCoGcj+TvjHk4z7awXxhRs
   0XT1y5fAlO+AR61AHwgH3RExFMh1Erjob5Z1yBBd7qc/6qjEV1+gEBReP
   4GGeW3yoXLUOBhH/vcXFbtg/S+G6PbY7KDUC7N4qFRg4Yjvfly8CjCrYv
   YVHUNs1ympwlw8KYgmSGGCMFE1MSe1jC0PqKNrdtcHkvu14gh/hnMr1Gb
   cgasJQo5gu8JGY+mb/HO/TcVmNk83xhH9LM6Wy/3x3C44N7yqJK2ncF+C
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="14249614"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="14249614"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 04:06:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="859035578"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="859035578"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 04:06:28 -0800
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
Subject: [PATCH 2/2] ASoC: SOF: ipc4-topology: support NHLT device type
Date: Mon, 27 Nov 2023 14:06:57 +0200
Message-ID: <20231127120657.19764-3-peter.ujfalusi@linux.intel.com>
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

The endpoint in NHLT table for a SSP port could have the device type
NHLT_DEVICE_BT or NHLT_DEVICE_I2S. Use intel_nhlt_ssp_device_type()
function to retrieve the device type before querying the endpoint
blob to make sure we are always using correct device type parameter.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index b89065abb511..f034fed06669 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1348,6 +1348,7 @@ static int snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_s
 	int sample_rate, channel_count;
 	int bit_depth, ret;
 	u32 nhlt_type;
+	int dev_type = 0;
 
 	/* convert to NHLT type */
 	switch (linktype) {
@@ -1363,18 +1364,30 @@ static int snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_s
 						   &bit_depth);
 		if (ret < 0)
 			return ret;
+
+		/*
+		 * We need to know the type of the external device attached to a SSP
+		 * port to retrieve the blob from NHLT. However, device type is not
+		 * specified in topology.
+		 * Query the type for the port and then pass that information back
+		 * to the blob lookup function.
+		 */
+		dev_type = intel_nhlt_ssp_device_type(sdev->dev, ipc4_data->nhlt,
+						      dai_index);
+		if (dev_type < 0)
+			return dev_type;
 		break;
 	default:
 		return 0;
 	}
 
-	dev_dbg(sdev->dev, "dai index %d nhlt type %d direction %d\n",
-		dai_index, nhlt_type, dir);
+	dev_dbg(sdev->dev, "dai index %d nhlt type %d direction %d dev type %d\n",
+		dai_index, nhlt_type, dir, dev_type);
 
 	/* find NHLT blob with matching params */
 	cfg = intel_nhlt_get_endpoint_blob(sdev->dev, ipc4_data->nhlt, dai_index, nhlt_type,
 					   bit_depth, bit_depth, channel_count, sample_rate,
-					   dir, 0);
+					   dir, dev_type);
 
 	if (!cfg) {
 		dev_err(sdev->dev,
-- 
2.43.0

