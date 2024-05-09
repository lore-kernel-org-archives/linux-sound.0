Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256C8BE5D
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 16:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715272635; cv=none; b=FnXIxbUhYORqI6Y2oudJTI8YR097NTkPHgbUE0prRO5Id9Lzy+crFMbBWnT8yQo6aW5G4RZaUSzxfC5hiohMU1XmJZfsq6TJjvOKVVPlA1Xe+NhQ7hCpx8pC8A6WMKAIK9OYHmSw8Yeyro3XJqqopDbL27HZdAcmgWbHkGz6Z6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715272635; c=relaxed/simple;
	bh=SCXYAb7vitxLxtkFLM0yIYJIUoO70iWPghwmtNzSrLY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dl2IqBySvQi93QQpFvhXgKT64siEYH3MT+jdMn5NPAuRTSriCCIhoFmk8PGwyUjGXgVqesWpr0lidofyqRFA/fMMbmkx5aEdVn3zsqVGzHhApanxEm+zFAquMZJ95q/vJxIpN/XYiKEB8JUOOLC+ZSMhNwuU8YACXLuC6ryFsuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FLF9DDmA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FLF9DDmA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272634; x=1746808634;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SCXYAb7vitxLxtkFLM0yIYJIUoO70iWPghwmtNzSrLY=;
  b=FLF9DDmAB4bpVSw90+nY6m3ki0H0KxgtEBJbk0uKpV1G+Rt2cHEQlBlV
   zaeOkeDc3vNNnRmib3dFqBvvpovVHNCC1m8YK0zMuXaAhnMqYFJXCyTqY
   QeNyIVb6BunWuQ+gNLjQY4SNrnapWFUBXEI7hMJuaL5t4hU2ta+S9rl8j
   1GWu+FZ4Y7ewYAPswqIWCukUGI+3tJKT+Sb72ES9nNJgqOB4tblmaRQCj
   Q8heKH/vrbyRZ6J5LRRiMArrBc25WdzK2ry/ZXjd3/F7goS1KdQHvjs9q
   bYBj7qZKSAEAK1j71mgUysIrlQtVmhHFm/s4jnYN6D6hoO/fEc4pgbHB9
   A==;
X-CSE-ConnectionGUID: 8i10jhS4TeykxqVPVVKuzA==
X-CSE-MsgGUID: Z/JIANdKR3evvnANAysjVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11362563"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="11362563"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:37:13 -0700
X-CSE-ConnectionGUID: yMhnPOwlQvOsdP6pTnYPsw==
X-CSE-MsgGUID: J9lXMQAnTt6SeDyVPBZGxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="29344989"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:37:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ASoC: rt715-sdca-sdw: Fix wrong complete waiting in rt715_dev_resume()
Date: Thu,  9 May 2024 11:36:58 -0500
Message-Id: <20240509163658.68062-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

enumeration_complete will be completed when a peripheral is attached.
And initialization_complete will be completed when a peripheral is
initialized. rt715_dev_resume() should wait for initialization_complete
instead of enumeration_complete.

the issue exists since commit 20d17057f0a8 ("ASoC: rt715-sdca: Add RT715
sdca vendor-specific driver"), but the commit can only apply to
commit f892e66fcabc ("ASoC: rt-sdw*: add __func__ to all error logs").

Fixes: f892e66fcabc ("ASoC: rt-sdw*: add __func__ to all error logs")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt715-sdca-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdca-sdw.c b/sound/soc/codecs/rt715-sdca-sdw.c
index d3fb02e8f31a..c8dabb9b16b5 100644
--- a/sound/soc/codecs/rt715-sdca-sdw.c
+++ b/sound/soc/codecs/rt715-sdca-sdw.c
@@ -234,10 +234,10 @@ static int __maybe_unused rt715_dev_resume(struct device *dev)
 	if (!slave->unattach_request)
 		goto regmap_sync;
 
-	time = wait_for_completion_timeout(&slave->enumeration_complete,
+	time = wait_for_completion_timeout(&slave->initialization_complete,
 					   msecs_to_jiffies(RT715_PROBE_TIMEOUT));
 	if (!time) {
-		dev_err(&slave->dev, "%s: Enumeration not complete, timed out\n", __func__);
+		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
 		sdw_show_ping_status(slave->bus, true);
 
 		return -ETIMEDOUT;
-- 
2.40.1

