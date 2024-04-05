Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31301465B4
	for <linux-sound@vger.kernel.org>; Fri,  5 Apr 2024 09:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712308103; cv=none; b=i6+Uu5jmFSFNxeSYlzsd8qnzbUCwJGAYGfzroZpffyhwYxGyGhwFZG0ZOnh+HqoVezRxsD/FsUEJs4dPdNePtlxHixHXeZlwbqpEBXd53S71qyl0ufFad3aa9Ct64P0qWDUcqrEMIYHBsHoeD83zIvc6Hkpnuvqn7xs7I+jHSDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712308103; c=relaxed/simple;
	bh=lBShL+hehblXjeItUaZJSU0+d9b1UISWY/cyd8pfpqg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SLp+YF/79dV4LUTDNjvVdqPYUoFB62N5j8Dk+sd5zcMsaUpcJUYkb8tWezCCh9BpTZhl6MdYyqiFtyx1MKeyMhXopYJO6VmWapHIjxzi5WNgnmZNlLghdNEnXGI3yVsPYeG8QyHNskZk6dT8FGf2Kfa0/kkkHSJBscrvUWxoVdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CmAnPL6n; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CmAnPL6n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712308102; x=1743844102;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lBShL+hehblXjeItUaZJSU0+d9b1UISWY/cyd8pfpqg=;
  b=CmAnPL6n3ONh0wg5XE4WAK7sqlUuYYHKLvpOOPGuguLTSzQUZwyDswua
   snp7t7BvOlePbsh4od1mpt+Rtl3b6KjKFCF6v1alH600JmViIsCA4F87R
   NYVHQRLqvkJPKM38HmndfgjybBteL3XTvghMhSeEYKxDpLI+BiqKg5mSj
   uwWfZC5C/M+uY/BZ4SsqfIirNlye1TNjZ8DBsGzymUw2B+vkjP2oSKtlf
   k8XOZrlYSWulkqMs4vZrqLqHyYQAwS/AgOl3b/wEx2iq7+pXt6Ke/rDHR
   K9KQ2vbujHPzfEYPNBKyxWmEu+4FsxFEardaB54OwTthoUXhoI3SYQuh0
   g==;
X-CSE-ConnectionGUID: y6dbbpIuSRCmTxAarH3TQg==
X-CSE-MsgGUID: bUdWTAWDR62YoD46lGJO3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7787458"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7787458"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 02:08:22 -0700
X-CSE-ConnectionGUID: cGhFZmbzQvu/P6HmVY4FtQ==
X-CSE-MsgGUID: wFPh7wH6Q/CZtRYYpiEwyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19042437"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 02:08:20 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 08/13] ASoC: Intel: avs: Test result of avs_get_module_entry()
Date: Fri,  5 Apr 2024 11:09:24 +0200
Message-Id: <20240405090929.1184068-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405090929.1184068-1-cezary.rojewski@intel.com>
References: <20240405090929.1184068-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While PROBE_MOD_UUID is always part of the base AudioDSP firmware
manifest, from maintenance point of view it is better to check the
result.

Fixes: dab8d000e25c ("ASoC: Intel: avs: Add data probing requests")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/probes.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index 817e543036f2..7e781a315690 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -19,8 +19,11 @@ static int avs_dsp_init_probe(struct avs_dev *adev, union avs_connector_node_id
 	struct avs_probe_cfg cfg = {{0}};
 	struct avs_module_entry mentry;
 	u8 dummy;
+	int ret;
 
-	avs_get_module_entry(adev, &AVS_PROBE_MOD_UUID, &mentry);
+	ret = avs_get_module_entry(adev, &AVS_PROBE_MOD_UUID, &mentry);
+	if (ret)
+		return ret;
 
 	/*
 	 * Probe module uses no cycles, audio data format and input and output
@@ -39,11 +42,12 @@ static int avs_dsp_init_probe(struct avs_dev *adev, union avs_connector_node_id
 static void avs_dsp_delete_probe(struct avs_dev *adev)
 {
 	struct avs_module_entry mentry;
+	int ret;
 
-	avs_get_module_entry(adev, &AVS_PROBE_MOD_UUID, &mentry);
-
-	/* There is only ever one probe module instance. */
-	avs_dsp_delete_module(adev, mentry.module_id, 0, INVALID_PIPELINE_ID, 0);
+	ret = avs_get_module_entry(adev, &AVS_PROBE_MOD_UUID, &mentry);
+	if (!ret)
+		/* There is only ever one probe module instance. */
+		avs_dsp_delete_module(adev, mentry.module_id, 0, INVALID_PIPELINE_ID, 0);
 }
 
 static inline struct hdac_ext_stream *avs_compr_get_host_stream(struct snd_compr_stream *cstream)
-- 
2.25.1

