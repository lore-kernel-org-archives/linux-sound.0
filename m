Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34084225775;
	Mon, 26 Jan 2026 05:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769406057; cv=none; b=bKr8Jp8BG5e6XQd61ZrlUZfYqh7Qtvk+QPW64drvbhhbCtfRQdJMtvqi/8M/jptOniXyOy3Pt4wB1X0hbPCezG6MdYrXLjVPTfa/E4bc2NXt9/j7b7HymTmfrXYRUawTbZGjXsdnJy6KfMk8kPbN8JpEbzQEHamH4G+Znmk+zp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769406057; c=relaxed/simple;
	bh=O+vSeMwOkp+MCR3793K/XHUMd6DUFHa4oxlq6yNKmTE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BwhkbfhrhgabyeL0P2NeLyFd+mMYg411WNMWwv0LOA/oKMXHkrIW3q9LMxt45P8JC1OEPgLIsfzp5SQY37lQKTZQ5SDiZWUd8sOWC21jElyMems0sN4i0FAnhjTzfCQvf3MpaDsDNG59sB6et6b8XlU6kX6WYO62XDuD1bGXXuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mG56Zkv3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mG56Zkv3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769406055; x=1800942055;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=O+vSeMwOkp+MCR3793K/XHUMd6DUFHa4oxlq6yNKmTE=;
  b=mG56Zkv3KcrPo+zkLCXfvqyx+5bSilcZTJ7Dle4K55F05fPL5qGwsn52
   yxbr4EVxJ8JfRekVC+3Z4yqK1pyOzcOb7Pta6px6NSUBUY5hV01fsjnC4
   V98NHALMT5kTWl9x1g533PE4JxEaPSFcLCRLZaKsFAX+1WDQIhmjlAhLi
   4cW2lKc6Znu710qTF0A6HOXxa5aS5gdRKlhWXuRlXInaKV0iPTTlEJxoA
   nMPg+KJvuhD8u0nz6lMTmEmlB44zBt2nfTZInwDetUupwV2+L1wW8UptE
   j5lYjK8J3Idcao64QNW9ka3znLgN2oimCXiOmG7lQWcbccmochyJYFNis
   g==;
X-CSE-ConnectionGUID: M49ftRdYQYChx4YSEdrh9A==
X-CSE-MsgGUID: WPbayf7JTOeVaFpd+wpvsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70626115"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="70626115"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 21:40:55 -0800
X-CSE-ConnectionGUID: s+lUsi/VSiqRjLDaATj8Tg==
X-CSE-MsgGUID: YitlsBrXRq2RBiCUaJnBag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="207400657"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 21:40:53 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	simont@opensource.cirrus.com
Subject: [PATCH] soundwire: Intel: test bus.bpt_stream before assigning it
Date: Mon, 26 Jan 2026 13:40:45 +0800
Message-ID: <20260126054045.2504103-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We only allow up to 1 bpt stream running on a SoundWire bus.
bus.bpt_stream will be assigned when it is opened and will be set to
NULL when it is closed. We do check bus->bpt_stream_refcount if the
stream type is SDW_STREAM_BPT in sdw_master_rt_alloc(), but at that
moment the bpt stream is allocated and set to bus.bpt_stream. It will
lead to the original bus.bpt_stream be changed to the new and not used
bpt stream. And it will be released and set to NULL when
sdw_slave_bpt_stream_add() return error as it supposed to. Then the
original stream will try to use the NULL bus.bpt_stream.

Fixes: 4c1ce9f37d8a ("soundwire: intel_ace2x: add BPT send_async/wait callbacks")
Reported-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Simon Trimmer <simont@opensource.cirrus.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 drivers/soundwire/intel_ace2x.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 1ed0251d2592..9b3d110d021f 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -82,6 +82,11 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 	int len;
 	int i;
 
+	if (cdns->bus.bpt_stream) {
+		dev_err(cdns->dev, "%s: BPT stream already exists\n", __func__);
+		return -EAGAIN;
+	}
+
 	stream = sdw_alloc_stream("BPT", SDW_STREAM_BPT);
 	if (!stream)
 		return -ENOMEM;
-- 
2.43.0

