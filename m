Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD6F3F7AB5;
	Thu, 14 May 2026 14:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778768215; cv=none; b=qrY//L4lmRjez5R85kn40jr8bh1Gn4w7e+n4sq52fX5CltnLSAhYm5jNDc4ignGs+/led8nb5E5mk9FwQhq/x3E9G4yQKWu27QCYVZ93+1CYVJFXbWAyk3WrEBWJ8ZVvIyLqEciFOG9FWNHWNUT5Ivz9SG+Mo5jEEuewbpg/vBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778768215; c=relaxed/simple;
	bh=aCVNhnF2qRHEFqig3JhkdeSBv1KoYVA7RGHdEWn8zhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l+wLo96eWOuOfkNFr3BJGMJ+qN23DeiaTQF3bdmktUuQN3fMUuvW98cg1bmhz55F0DdcWSsVb6YKJLmguSJ5siwhc4DJRDwjuZUy4gRAnyaez9wMshT4/UaTWZG++lsH/leHFkAIFdjQIIEDu13o7XaLFGg4HiAGnP9hBDQzTvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zi1SjHa2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zi1SjHa2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778768211; x=1810304211;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aCVNhnF2qRHEFqig3JhkdeSBv1KoYVA7RGHdEWn8zhI=;
  b=Zi1SjHa2NngMWoSyewUW8YR9PJ9ABwUv6P51r3IHuuAPpehDGBzASmvT
   KJKu2Oky1y/+/ixEjPJvOxhbJMzYzOTogbsUUXo28yR7fIun27W+76oJ6
   2UNZezkU687zPPS9phqVUSyqYjviyFYGw6cGDLwAdKfiIF1q3LC0RcJCf
   dAmBA0p0h7VWzPE3k4ye5UMM9iSJKQTNseBDbF3IkVlfaMxgy4Nh+zIKs
   VfpcgF6epPHmUvuHUrA0ymtHfZkp84xQHPR0oM4Y5LKkz28lufZACDWCO
   Sh4opQo9eJUSOxbOPeNCVOLq/AVZ1KOhr78fMO9bMgqMalGDQ4zNsu71P
   A==;
X-CSE-ConnectionGUID: 3qXQQLrhRY2eeyUe8nN3Pw==
X-CSE-MsgGUID: +BeOn7nYS7CzLaRTSKz6zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="102381128"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="102381128"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 07:16:48 -0700
X-CSE-ConnectionGUID: a9QmU/gGRayil9XoYxWsqg==
X-CSE-MsgGUID: wYW8NDmxQxOySvcTf9nriQ==
X-ExtLoop1: 1
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 07:16:46 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH RESEND] soundwire: intel_ace2x: release bpt_stream when close it
Date: Thu, 14 May 2026 22:16:25 +0800
Message-ID: <20260514141625.1834216-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BPT stream was allocated in intel_ace2x_bpt_open_stream(), we need
to free it in intel_ace2x_bpt_close_stream().

Fixes: 4c1ce9f37d8a8 ("soundwire: intel_ace2x: add BPT send_async/wait callbacks")

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Simon Trimmer <simont@opensource.cirrus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
---
 drivers/soundwire/intel_ace2x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 0a97253fe0c2..b37933efac5d 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -317,6 +317,7 @@ static void intel_ace2x_bpt_close_stream(struct sdw_intel *sdw, struct sdw_slave
 		dev_err(cdns->dev, "%s: remove slave failed: %d\n",
 			__func__, ret);
 
+	sdw_release_stream(cdns->bus.bpt_stream);
 	cdns->bus.bpt_stream = NULL;
 }
 
-- 
2.43.0

