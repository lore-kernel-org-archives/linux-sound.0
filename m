Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2E13546CA
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 13:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430397; cv=none; b=VBHg83H1M3kFQhaomAAl9Wv0/2i4/eGEycG5BNzAyXVWlcoP7AlUoWSS5/sTME7yhd1uJ4+Ag4NJBCjl1OwHpef0fbgX/sIQdcJtdjsFLLVw8ql6rP14uxoUUJRb+VIy6+df+BHKTL6YTa0Uk9++CJAu8Inf+Ue4FiToIW8jfTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430397; c=relaxed/simple;
	bh=8c5/A1qKmq4ArGd29LZdfA+42PpHqCyEPjwv4rmFOns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PQ47ZqzT8SkM4t6Plry++YPnPnhRlT0pJNrVomOpQT5HNrqiWPcqBUbxgdCavtmnai21xcNz7Qze08RnUd5qs6VKCrXDbJwr7o5HHHjC6E17Z+YWtdg3koICMf6h4bIEMg2DMn2wt2f/SeD1E0gRuPBFY8T2yYiKHz6dgEyfYKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ficCrdiE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ficCrdiE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783430396; x=1814966396;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8c5/A1qKmq4ArGd29LZdfA+42PpHqCyEPjwv4rmFOns=;
  b=ficCrdiEK00IAKdPppfEKWq1buT6MqSHTqMeqEXu1J0keqnDLuD21Xv/
   907YjQRvGnV5rEHssgFGd4L3xUR1OMh1RcctYI6Bav/w1DuEinDJNw9h9
   ijKY5R54/yxVqqhKno6dBGsDWQ1XqgMOzG2uznYLg4ZC1b4kbZLD5lLq2
   q+ywQ9X55k6cnoDdL4G9HfXsVUk8VSTiNFA6gQmmVOmHQPqjVbMwRfIJz
   kL0RPCObhhpOnpSsGDcWLBkq+wkPhbGQftCPBP/0v7B2nQKdQuWm5bM8K
   QqpueZadmUa0dwzagcVYu/057wjdnCgxyOw4Lv4WV4H2zF+xtq9cb/XmD
   A==;
X-CSE-ConnectionGUID: FZDVrJJETXO1zT24K8TfSg==
X-CSE-MsgGUID: gSeE9br5TmqGY7FW7g1Nqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="87992096"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="87992096"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 06:19:55 -0700
X-CSE-ConnectionGUID: RvQeVfPkT6m7/ObfyApYFw==
X-CSE-MsgGUID: LnqlLOTbS6+5CdoM0qdBIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="277214590"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 06:19:54 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 1/2] ASoC: SOF: Intel: reset spib_addr before disabling SPIB
Date: Tue,  7 Jul 2026 21:19:44 +0800
Message-ID: <20260707131945.3641663-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707131945.3641663-1-yung-chuan.liao@linux.intel.com>
References: <20260707131945.3641663-1-yung-chuan.liao@linux.intel.com>
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

