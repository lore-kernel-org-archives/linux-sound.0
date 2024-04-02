Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FC3131746
	for <linux-sound@vger.kernel.org>; Tue,  2 Apr 2024 15:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712071129; cv=none; b=L3CS64CBoWcPsDiVFYGUdv2z9NCLsxcZU29MYsyClvtNQlvjuwczML4pNbeGBq5GwhUkNVlY425PuVYyMSTsznZ+llx+jIc50kXqRcChB5+EWkCPD4/EoOCkE32Eh+b2K01hIZ0/qrx82yrhFnHREDwYCu/eH1LbuCjPl2org/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712071129; c=relaxed/simple;
	bh=jCzzKujhK1qshxtOjWE+ARr12YlgAXeiXGDWIOps8sY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lIoebPgErz6OM6YjLSWus7LpuLmxlQ0ZktMPQpmb/d4I/t66MqdcsMG2PLljZD5olE9YmECH2oz4RrZ0+tnYpYiRriRRtFirlskhp+VQ/PowG54UG9wXTUfkNjdtag1wEp0LCCgcPfqME6p3nTGEaqc1ANw2fzXd2KZR5BEwWFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RlVLpyB+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RlVLpyB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071129; x=1743607129;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jCzzKujhK1qshxtOjWE+ARr12YlgAXeiXGDWIOps8sY=;
  b=RlVLpyB+kxyAV5RIy3jWYYtvL3VpIGxsncE9snWhR/MGNeKqCeiK5hEi
   PKuPPxg7XT9eD6CHHFUy+FrsENoIqwtWQn7CvNh+8Osl/NFYD/4C44k6H
   8Bm6L1OumNO0IxThFFa1QKfo2K/X6WpK2n4nAPpI/agj++BITdJAG0N4B
   KZA7YLe8Uhbj+ey87aQhdhQ4tuhpVwS4hJfKwKLcejsKtSjfMcApnY4EH
   m5TdFNScNPBm8Vshj2+9yzS3p1DFJMmva0+7r8FE7kyN63oUsD5kw43Dk
   KxT0QnV5YWsWcnBtrsmpUCbOJ/xor166bUUsnggHQI9oNAHD9CGNIIp9p
   Q==;
X-CSE-ConnectionGUID: fNfftwYsTE6SZi3bjTAUpg==
X-CSE-MsgGUID: PyCfXCXTQSqUOhV+PK+ycQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29730217"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="29730217"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:48 -0700
X-CSE-ConnectionGUID: b891x3ceTdW75q+j7m+okQ==
X-CSE-MsgGUID: N6kUwAahT/ujSvFB8Fy4+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22796549"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 16/17] ASoC: SOF: pcm: reset all PCM sources in case of xruns
Date: Tue,  2 Apr 2024 10:18:27 -0500
Message-Id: <20240402151828.175002-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the delayed stops, the xrun handling is problematic: the
applications expects everything to be reset but the firmware and DMA
are still in a PAUSED state.

This patch makes sure the prepare while pending_stop is set is
special-cased.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Co-developed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/pcm.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index fbd7e045bcfb..4e11df6b4823 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -221,6 +221,7 @@ static int sof_pcm_prepare(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_sof_pcm *spcm;
 	int ret;
 
@@ -232,8 +233,18 @@ static int sof_pcm_prepare(struct snd_soc_component *component,
 	if (!spcm)
 		return -EINVAL;
 
-	if (spcm->prepared[substream->stream])
-		return 0;
+	if (spcm->prepared[substream->stream]) {
+		if (!spcm->pending_stop[substream->stream])
+			return 0;
+
+		/*
+		 * this case should be reached in case of xruns where we absolutely
+		 * want to free-up and reset all PCM/DMA resources
+		 */
+		ret = sof_pcm_stream_free(sdev, substream, spcm, substream->stream, true);
+		if (ret < 0)
+			return ret;
+	}
 
 	dev_dbg(component->dev, "pcm: prepare stream %d dir %d\n",
 		spcm->pcm.pcm_id, substream->stream);
-- 
2.40.1

