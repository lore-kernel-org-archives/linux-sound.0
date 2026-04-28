Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30E73D7D6F;
	Tue, 28 Apr 2026 08:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365984; cv=none; b=TJ897Nk1r9mWG/Du0q9w6d5sApKZpGtGNO1QpqZaS0eR9bdamxt/n6BbTUdTasOxLWOkldUGqoFJpbBsR/Wuo+e3c6auPigHWYJjvV74pKj9lsJAT58z3h6REv95KChbesGC7qqW9JlWoPEIPpjTcxfoxYHnzS9+b49A7XXkHkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365984; c=relaxed/simple;
	bh=v/FtdyqYqM6XmYIAUEAXApbL23Nchrm1fV+xHfiiy1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p7N5kx81I4+B1ddmBN1btnfTvGd1388ze8Bz/gnvzOhsa4xYTTuN0bVvKHdjrv8LKUEd/xTPc3J1F6atyt00h57HL9C7zSN0R5sBrnSZFjKmF93Ctjq6xzBOsplOXfGxjbhWPqJwJ0m71MfkzXWwWnxminD/Dok91aM5fKmo1F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Frw8+cra; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Frw8+cra"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777365983; x=1808901983;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=v/FtdyqYqM6XmYIAUEAXApbL23Nchrm1fV+xHfiiy1U=;
  b=Frw8+craVjfd8wlcOF7MlykxfH1D7Dw8MB1Db5GOGox/ZWm9hVbpq3TS
   qlnv2W1nJ0BNmd/El7GLRUscx0gI7xNv0ArQhARS3qblbiBg73nh/YD5v
   lmhFeH1x9N3aLUgDeU1SWLd4rkFRcGRkzC1+23Q7rURQUMxujM4NFMQ4X
   7CQuadsKehdogj1BSnJCMFy7CU47DR08N74igku8JqDX6iA26Txmz7hV3
   2AI2Tz7HMpnIS+z8UwHytmMCpmV/9U8RHb1gVKd60AfOuoLKhPgYG53Sx
   ymSOJvFOBFpLmB9Hl4N89DRUynvjTj8gEMZLKLAob9afnWghWE1eROSgH
   Q==;
X-CSE-ConnectionGUID: dlcUPUJ9RUiXc7iRq5wlCw==
X-CSE-MsgGUID: Eofr2kgLQ/ySMiXpoSnpaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78252281"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="78252281"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 01:46:22 -0700
X-CSE-ConnectionGUID: 6UgYy2z9RFmtdzWegae3CA==
X-CSE-MsgGUID: bG5HnRMnQbCBgKaPAYjHjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="257423146"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 01:46:20 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH RESEND] soundwire: don't program SDW_SCP_BUSCLOCK_SCALE on a unattached Peripheral
Date: Tue, 28 Apr 2026 16:46:12 +0800
Message-ID: <20260428084612.322701-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

