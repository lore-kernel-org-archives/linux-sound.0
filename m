Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C2617B50A;
	Wed, 20 May 2026 02:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779245863; cv=none; b=OL6eJdeiYABaX/cVhQHUDZMkTA/NFgapRM+JihE/4El1xl3T4QhaHKvlMICAejGlqtgjgQWZQbxUR+mOA0wP6GYXf9ZrBMX4KOE+yjrWUNup+J+aBCEq5vWSnZgETNos3HB7hzwY7QIQc104bst/W3hfAKagbwjrZ0HO/WiKRik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779245863; c=relaxed/simple;
	bh=+0MIlt21Ej2HkgV9MH8e4l2H+Yo2WbM1oIHugTiwEjA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sf715wVlLc7Qa8kxWWPqjXjucrmNyPnS7Q0MiNMIQXbeCmONRfTA+MnhRvgLivEJKQKUaA/6hPZ8yB7HQZiEWxhru+LYklA0nCJV/oZFqdqLJhUuIGcpgjSBxQ4uRnWd/b7vIQtU70yzuqX6C2aMgY/PQi15NknQOIWnMtwseaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AFeiynRc; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AFeiynRc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779245862; x=1810781862;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+0MIlt21Ej2HkgV9MH8e4l2H+Yo2WbM1oIHugTiwEjA=;
  b=AFeiynRcVoWHb9py2bg3Yy6pU/tHOqMyxwRAQlQAJq203bcScocXV46o
   F5FL+5ddQUquTM4AiooZzbVzLX1o3uq96i8UfHwQTx2EZNpvcRHNEjy1Q
   5a5564PEnAFP4Wwz5jDLFFQC+86Jqtq7Qah2+/x6hUHB3oATVqVWZksCE
   ABqDyMqrDO+pE2Odq7umqk1yxA7zJgc2ABURHnNlZYIATYNHRFjS52PAA
   z2l/nZJdZMh7Rl9PTlww75ThldhOoZo+d9mbdgAjRF0hG2MofrPgFxLPE
   BXH7aaxvFMtFtfqfHBfys1fn+SNvpO/aoRX2D1CVl6LYZCfIFMIfab8p4
   Q==;
X-CSE-ConnectionGUID: oS7PZaIVRpa9QzuSlIqXRQ==
X-CSE-MsgGUID: z77GaG66R5Wp6V0UqyNEOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80190406"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80190406"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 19:57:42 -0700
X-CSE-ConnectionGUID: r1F3qwY/Twq/Ydo7qidtPw==
X-CSE-MsgGUID: MXJ2swGxRnCeTpc/k1dO5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="239150920"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 19:57:39 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH] soundwire: only handle alert events when the peripheral is attached
Date: Wed, 20 May 2026 10:57:20 +0800
Message-ID: <20260520025720.1999367-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It doesn't make sense to handle an alert event when the peripheral is
not attached. The slave->status could be SDW_SLAVE_ATTACHED or
SDW_SLAVE_ALERT when it is attached on the bus.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 drivers/soundwire/bus.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index fe5316d93fef..0490777fa406 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1958,6 +1958,10 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 			break;
 
 		case SDW_SLAVE_ALERT:
+			if (slave->status != SDW_SLAVE_ATTACHED &&
+			    slave->status != SDW_SLAVE_ALERT)
+				continue;
+
 			ret = sdw_handle_slave_alerts(slave);
 			if (ret < 0)
 				dev_err(&slave->dev,
-- 
2.43.0

