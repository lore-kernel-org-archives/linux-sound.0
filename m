Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BDr/iFEN"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F3CDBA
	for <linux-sound@vger.kernel.org>; Thu,  7 Dec 2023 14:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701988212; x=1733524212;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n1mWbGKFemsTLPwuTmI6hhmqxPf97t6/N27jfi+k5vQ=;
  b=BDr/iFENFdaX9bfAFuGv+XOT+TmD66xl+DNmfE6cXJT2qvMO1msv5bE7
   0tp1hhpP8z+cVQ3T68mmLAyIlDGgH/tWOAmiiaG5P1uxQ97MWqH381JzQ
   zbFTzujoorX2PFlP9bUwse6HZMVILNGnd7Cz1X7sRFMsiVKm0y1j8T5Qp
   LzvekFfrb4Uk+wMGCpYH0jdUBDzLToUFZwdGqjVkaYrux1WSIj0yYV2YR
   M4KcgxTSi4ofNrRWqoYdaK8siK1GYLPGtfm8kHD1MrvbooEjV1UOhd0Lr
   H2aaEiJ5mM3aIi6at+SF+h0Bt/uAxPbyW244V2wb00JqOwvcU+fJ5wvRA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480516603"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="480516603"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 14:30:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895307473"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="895307473"
Received: from hrcolco-mobl3.amr.corp.intel.com (HELO pbossart-mobl3.amr.corp.intel.com) ([10.212.148.159])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 14:30:10 -0800
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
Subject: [RFC PATCH 04/16] soundwire: extend sdw_stream_type to BPT
Date: Thu,  7 Dec 2023 16:29:32 -0600
Message-Id: <20231207222944.663893-5-pierre-louis.bossart@linux.intel.com>
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

BPT/BRA need to be special cased, i.e. there's no point in using the
bandwidth allocation since the entire frame can be used.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/linux/soundwire/sdw.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 5cc7fed1bf19..9f04f3ad044f 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -140,12 +140,14 @@ enum sdw_dpn_pkg_mode {
  *
  * @SDW_STREAM_PCM: PCM data stream
  * @SDW_STREAM_PDM: PDM data stream
+ * @SDW_STREAM_BPT: BPT data stream
  *
  * spec doesn't define this, but is used in implementation
  */
 enum sdw_stream_type {
 	SDW_STREAM_PCM = 0,
 	SDW_STREAM_PDM = 1,
+	SDW_STREAM_BPT = 2,
 };
 
 /**
@@ -959,7 +961,7 @@ struct sdw_port_config {
  * @ch_count: Channel count of the stream
  * @bps: Number of bits per audio sample
  * @direction: Data direction
- * @type: Stream type PCM or PDM
+ * @type: Stream type PCM, PDM or BPT
  */
 struct sdw_stream_config {
 	unsigned int frame_rate;
@@ -1009,7 +1011,7 @@ struct sdw_stream_params {
  * @name: SoundWire stream name
  * @params: Stream parameters
  * @state: Current state of the stream
- * @type: Stream type PCM or PDM
+ * @type: Stream type PCM, PDM or BPT
  * @master_list: List of Master runtime(s) in this stream.
  * master_list can contain only one m_rt per Master instance
  * for a stream
-- 
2.39.2

