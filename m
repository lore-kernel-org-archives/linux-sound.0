Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBC53D0909;
	Wed, 25 Mar 2026 11:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438931; cv=none; b=pFwOmhjkDLlSA6IGXscjtrHhCd1sL3gkh7GDA9Kaf8FSjgTgPvm5qnQhFMiykLYiweMzVcUS9wO8Wo1OCYk62YAu1HHCSj+4wOhyqsuxU/QBKJ3G5DLW3tZXQ+06fw1bNOPKdZjxbYoQyZhpVdkp9r1AlBpYHUxdg7VeA7LQ4eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438931; c=relaxed/simple;
	bh=v/FtdyqYqM6XmYIAUEAXApbL23Nchrm1fV+xHfiiy1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AuDkEijDKsEySpH59Hrf9uTI3U6q+AphKvUeVT37kOOSFF0Myk4EneOffCklZQMoCj8fgrJWk7IcOJ4LQGKQ+7peCAHVqKh6BG+PPOtc+D3xtVQY0q2Pbogs30cm0KUiLdPwDRAkiwgyCXq6Jb0kxz5yoCKong8/CsB0evViDnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gJajka1C; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJajka1C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774438930; x=1805974930;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v/FtdyqYqM6XmYIAUEAXApbL23Nchrm1fV+xHfiiy1U=;
  b=gJajka1CTfGZeaT5c8alCu1Y8LH2+03cclZraveBgQ+fIxD0S1ktc3rO
   +7ql+17uO9bpHQ4ErgGJ/qsYNKUau08BtPPJQ/YspwrAIuMm9D/35HL6M
   5ItkpS6JuyuO6cy2YHk8VZfY2ZCgoBMsXhDlmSNsr844bElQPRmWZWcxS
   ThYA6CtgihJeIBZhjSCXOmlHkjZtAOxMt/HGGdnhSvfCczAOSXrEhLg98
   kiETXriEoTEM4O8OqK7avAJZVgeWBU9NTUjx2O9+pJG1s57x9AMdr2Dzv
   tjFiurwrzSHv2toVa607yBiXQvgo3uci1CEWtlBRRoWKqoZYaf9Vk0INM
   g==;
X-CSE-ConnectionGUID: LSI4m7G8SUy8UHrFIz6azg==
X-CSE-MsgGUID: 3CXF1k88SSW6xlNFQaFavA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="63020048"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="63020048"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 04:42:09 -0700
X-CSE-ConnectionGUID: cDTgsJ18RVusKLJaccPeBA==
X-CSE-MsgGUID: zXBypTLySJy31diCSYU1BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="220253777"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 04:42:07 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 1/2] soundwire: don't program SDW_SCP_BUSCLOCK_SCALE on a unattached Peripheral
Date: Wed, 25 Mar 2026 19:41:55 +0800
Message-ID: <20260325114156.1028118-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325114156.1028118-1-yung-chuan.liao@linux.intel.com>
References: <20260325114156.1028118-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The SDW_SCP_BUSCLOCK_SCALE register will be programmed when the
Peripheral is attached. We can and should skip programming the
SDW_SCP_BUSCLOCK_SCALE register when the Peripheral is unattached.

Fixes: 645291cfe5e5 ("Soundwire: stream: program BUSCLOCK_SCALE")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Simon Trimmer <simont@opensource.cirrus.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 drivers/soundwire/stream.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 4ed8fb7663ad..0b9626838028 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -697,6 +697,13 @@ static int sdw_program_params(struct sdw_bus *bus, bool prepare)
 		if (scale_index < 0)
 			return scale_index;
 
+		/* Skip the unattached Peripherals */
+		if (!completion_done(&slave->enumeration_complete)) {
+			dev_warn(&slave->dev,
+				 "Not enumerated, skip programming BUSCLOCK_SCALE\n");
+			continue;
+		}
+
 		ret = sdw_write_no_pm(slave, addr1, scale_index);
 		if (ret < 0) {
 			dev_err(&slave->dev, "SDW_SCP_BUSCLOCK_SCALE register write failed\n");
-- 
2.43.0

