Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D030319CC36;
	Wed, 18 Dec 2024 08:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734508951; cv=none; b=n+dqMl5MQS2YiLmi8BnGEsKVdUzmYYp7fo0HA2JANoM5tAdO1rH795p8CdFsoHfFbrJByqSoQHQljlFmQtYQkWTpYMzfFoyn2Ls3UZHxoJVNecqBsd+yHZcU86vEJEcj+/8mVg4aRyRsFc7bQGCymUjkLB0h6xxcHZe8Z3rVFAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734508951; c=relaxed/simple;
	bh=IWIIWEXMP+HgRrUppmGaLdX5pqFywKT4BBaDK/Fe0tk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ez/+lQk0DEpmDtU/M8ROC2/K4upCGuwqL6RRggkNxyou86gUQ8bDvEDL4dHmR37fTHWA+gPNO90oJOA15sBTSleaLNp6G7g+Q0C0QKVmNecDMTjyBuo+HeIKGO3khPgohrVkEChbXFkFKkcZKgA37QKFZmslIvTIdC1MneST1hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mpKcFgJh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mpKcFgJh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734508950; x=1766044950;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IWIIWEXMP+HgRrUppmGaLdX5pqFywKT4BBaDK/Fe0tk=;
  b=mpKcFgJhptLDSe6p6VA8Zlr+PFEnoLrF9BM1c1ldOqe1lD/WJQzZOzw5
   8e8ZraKOD2fTgendDYM+o3LaQOQ7xUZMoQL+0LexMSQxAZya/lSmTl5Cu
   PdbP0/Pb3d1rNJM2dWVPYfEQdoumlGicU1Y7nFVXgF4kjufUdc/uE7Kbu
   5kpPbygfmZUs0tnCf2/WhXzeBQ0h+l7FmYUP7bwyQbpe6/+am15FK4/mS
   xrqL6LewLcOJqMZp8Hd90YAteCveFWtjvwYN831Ow34GyUKuGY9c7zoew
   0g8fbr9XDInqIzpKRiE4VJOe1aHAJ8/ekeKBIAcirMu6QksFWu+/6R4P3
   w==;
X-CSE-ConnectionGUID: Fufx1W1yQUSaSKjMMIkgpQ==
X-CSE-MsgGUID: iPFd6VzzQ/6P9d434qF8Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45978671"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="45978671"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:23 -0800
X-CSE-ConnectionGUID: TSLmS0XxTOq6bDan0ZIC/Q==
X-CSE-MsgGUID: i1fbSQWUQIydZAxUYdTE3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101914727"
Received: from tfalcon-desk.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.206])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:02:22 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v3 14/14] soundwire: generic_bandwidth_allocation: count the bandwidth of active streams only
Date: Wed, 18 Dec 2024 16:01:55 +0800
Message-ID: <20241218080155.102405-15-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218080155.102405-1-yung-chuan.liao@linux.intel.com>
References: <20241218080155.102405-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

sdw_compute_group_params() should only count payload bandwidth of the
active streams which is in the ENABLED and DISABLED state in the bus.
And add the payload bandwidth of the stream that calls
sdw_compute_group_params() in sdw_prepare_stream().

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 drivers/soundwire/generic_bandwidth_allocation.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index 062e7488b226..59965f43c2fb 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -188,6 +188,19 @@ static int sdw_compute_group_params(struct sdw_bus *bus,
 	}
 
 	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
+		if (m_rt->stream == stream) {
+			/* Only runtime during prepare should be added */
+			if (stream->state != SDW_STREAM_CONFIGURED)
+				continue;
+		} else {
+			/*
+			 * Include runtimes with running (ENABLED state) and paused (DISABLED state)
+			 * streams
+			 */
+			if (m_rt->stream->state != SDW_STREAM_ENABLED &&
+			    m_rt->stream->state != SDW_STREAM_DISABLED)
+				continue;
+		}
 		list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
 			rate = m_rt->stream->params.rate;
 			bps = m_rt->stream->params.bps;
-- 
2.43.0

