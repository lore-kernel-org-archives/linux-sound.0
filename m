Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44A93C9898
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 08:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783932437; cv=none; b=WOEvWIA7GgI7nid/zwt5DfYFMxrhl3N9jlAfjyNZOmWQBPb8ZpHMw1wWyV7YpJsapygSWoDQhM0glOhqzH+zqZXiEu1l//G0/MSgPunvcCaeLlOJBIhVNMNe1z2FOPsz/f4l/7m5KveflW0dvvqI3LSZWVd45jkqApLAEz2G+eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783932437; c=relaxed/simple;
	bh=8c5/A1qKmq4ArGd29LZdfA+42PpHqCyEPjwv4rmFOns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BjwJSJ7sGI2gzTCeArE8WIEQsPaJkwNm1DcJhHXad+cl6aoiRIYenUGtrPsmHpoHhmgAh9qM3apvg896l8aTD8uDLGysplw+zpOwlY4AF/vPOfRyKe7Dg579NIjdcJakyBqpE1zabozc67Cb26RFo+rmUB0CsSx2+Ohubba0Mww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BXI1XNmv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BXI1XNmv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783932435; x=1815468435;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8c5/A1qKmq4ArGd29LZdfA+42PpHqCyEPjwv4rmFOns=;
  b=BXI1XNmvDl3h1+XMgeet+5t8j3/DUSk/YZl/iKlUMnm3hFTG3wzoNEps
   UiLvCZr1fx3jmyrAqhNWVcJRo4x5jHlyDL8LnCXdpVIPhT6od3NA25cGg
   59HD2HXSuAT/8HKo05Bla2n3iQRACDYbynL6LeECRtJSPyHVHy7xxR9wA
   f1+TH9ZsDG2ThSQ1Z2sxAwi5ejdyx9PKIwGfJZHRkgiFTXaAyACbsijsK
   b5jtKOfYXstBiAkHH+ElwxrXgI7fz+qa2qCD8jQLFLCPtg/Wn93g8DOOF
   g7ujybeMVkHVzMzFmfYtd665COaRQDGzhq5S1+9T0mwhrQmUqich7oZoo
   g==;
X-CSE-ConnectionGUID: dAW7FJ7lRnOtGY8R1evwSQ==
X-CSE-MsgGUID: vRyBIjbqQyWrO4SCwx+DXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84554477"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84554477"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 01:47:14 -0700
X-CSE-ConnectionGUID: xTT9U4WaRv6mb2oqmuT54g==
X-CSE-MsgGUID: CK1bbN5PSG65xb4BhtPgEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279905360"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 01:47:13 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 1/2] ASoC: SOF: Intel: reset spib_addr before disabling SPIB
Date: Mon, 13 Jul 2026 16:46:49 +0800
Message-ID: <20260713084650.4138172-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713084650.4138172-1-yung-chuan.liao@linux.intel.com>
References: <20260713084650.4138172-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The spib_addr register will indicate to the host DMA where the position
is in the buffer currently processed by host SW. The register is ignored
by the host DMA if SPIB is disabled. Reset it to 0 before disabling SPIB.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 5c1f3b427cdb..4a46e35c3eac 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -198,13 +198,18 @@ int hda_dsp_stream_spib_config(struct snd_sof_dev *sdev,
 
 	mask = (1 << hstream->index);
 
+	/* Reset the spib_addr before disabling SPIB */
+	if (!enable)
+		sof_io_write(sdev, hstream->spib_addr, 0);
+
 	/* enable/disable SPIB for the stream */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_SPIB_BAR,
 				SOF_HDA_ADSP_REG_CL_SPBFIFO_SPBFCCTL, mask,
 				enable << hstream->index);
 
 	/* set the SPIB value */
-	sof_io_write(sdev, hstream->spib_addr, size);
+	if (enable)
+		sof_io_write(sdev, hstream->spib_addr, size);
 
 	return 0;
 }
-- 
2.43.0

