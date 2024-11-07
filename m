Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4923D17BB0D
	for <linux-sound@vger.kernel.org>; Thu,  7 Nov 2024 12:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730981741; cv=none; b=oesnf4/6eB0EyhZfJfMXlWNQwiyfkjCSI5gHPUueR/RX36R0kYspgYgnRpanEMQ+ijlD+Vmzdi1RClKFd89nx8srJEsFSskmz6F6dXiD8BWzOzTFLp8dbk1R8b9OQZRWCNl2zvI7YudFU4/K+2gKqn/8kDzoFdCzihVf7MfsPEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730981741; c=relaxed/simple;
	bh=UbyC4kSMOuEDpBNP7nhsy7n5Q+5nIgfQ5p4rbejvqj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TkVZkuszqiWLA2Pv87BE0y3bxILTBP7BzqEL6XUDQv4yGP5yz2vA44tQYlb2u7dM3qRctQHdi7TH48a8GKNWXDm/1VRmayx+rssnGzLlCSkgMfM9/RXcW+PtvBuPHE4IQKzJDVEPqZoo19OiN3dtekuhZ/UKSzfPC/dxdcq5dKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OYwip3se; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OYwip3se"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730981740; x=1762517740;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UbyC4kSMOuEDpBNP7nhsy7n5Q+5nIgfQ5p4rbejvqj8=;
  b=OYwip3seXKJ5O15LMtDLWJw2xvAovgd8hOHPqdVgorGew1hJ3/su0pV3
   93qVsZJIewW/wivQ1RvYwh0WIayjQKXN7eAKTM7fdruThDh4s9gYzHrQm
   A+askMFGpcWsUZWKdb+liSaZ1K7NeUf4pnxypttSVekB63BJ1WMh3dmS+
   cJ7V19bf5IsCajhd3icBQtuRtSLT4jdCk3/OrQYUytQKxsOpFNe5od65B
   pmr7/1Yw/tTgSXAIS37D44BsDeyfNAsqgvUv6HQ+El/CwlEm2xDVQ39EJ
   FCC00vtKNbdDuxeSlOhpHocm+13dU5V8S8oZk0BluIU9CwahlTEoGYOas
   Q==;
X-CSE-ConnectionGUID: 2lYO6t92TrCEA7tX3XgWiw==
X-CSE-MsgGUID: BijbBteNSPGzk5kGagrWOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="34595457"
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="34595457"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 04:15:37 -0800
X-CSE-ConnectionGUID: FpALHl2dTTOqH+ocO+IZ7A==
X-CSE-MsgGUID: iN4kPm4PRRq0RYxBmq/6lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="84991101"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.205])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 04:15:35 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH] ASoC: SOF: Intel: hda-stream: Always use at least two BDLE for transfers
Date: Thu,  7 Nov 2024 14:15:32 +0200
Message-ID: <20241107121532.3241-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HDA specification states that the SDnLVI (Last Valid Index) must be at
least 1 (two BDLE entry).

Update the debug prints as well to provide better information.

While the LVI=0 worked so far without issues, it is better to align with
the specification to avoid unforeseen issues with FW loading.

Notes:
- The LVI > 0 rules is valid and honored for audio use cases
- LVI == 0 is used with software controlled (SPIB) transfers only for
  firmware and library loading, which is permitted by the hardware
- This is not spelled out in the specification and it is better to avoid
  cases

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 3ac63ce67ab1..519bafd3b947 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -119,13 +119,39 @@ int hda_dsp_stream_setup_bdl(struct snd_sof_dev *sdev,
 	int remain, ioc;
 
 	period_bytes = hstream->period_bytes;
-	dev_dbg(sdev->dev, "period_bytes:0x%x\n", period_bytes);
-	if (!period_bytes)
+	dev_dbg(sdev->dev, "period_bytes: %#x, bufsize: %#x\n", period_bytes,
+		hstream->bufsize);
+
+	if (!period_bytes) {
+		unsigned int chunk_size;
+
+		chunk_size = snd_sgbuf_get_chunk_size(dmab, 0, hstream->bufsize);
+
 		period_bytes = hstream->bufsize;
 
+		/*
+		 * HDA spec demands that the LVI value must be at least one
+		 * before the DMA operation can begin. This means that there
+		 * must be at least two BDLE present for the transfer.
+		 *
+		 * If the buffer is not a single continuous area then the
+		 * hda_setup_bdle() will create multiple BDLEs for each segment.
+		 * If the memory is a single continuous area, force it to be
+		 * split into two 'periods', otherwise the transfer will be
+		 * split to multiple BDLE for each chunk in hda_setup_bdle()
+		 *
+		 * Note: period_bytes == 0 can only happen for firmware or
+		 * library loading. The data size is 4K aligned, which ensures
+		 * that the second chunk's start address will be 128-byte
+		 * aligned.
+		 */
+		if (chunk_size == hstream->bufsize)
+			period_bytes /= 2;
+	}
+
 	periods = hstream->bufsize / period_bytes;
 
-	dev_dbg(sdev->dev, "periods:%d\n", periods);
+	dev_dbg(sdev->dev, "periods: %d\n", periods);
 
 	remain = hstream->bufsize % period_bytes;
 	if (remain)
-- 
2.47.0

