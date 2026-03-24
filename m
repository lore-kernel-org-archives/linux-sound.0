Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1DA355F4E
	for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 16:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774370255; cv=none; b=peidO/z8AVuphRWhtM7wQbKiHZdes4/2Szr14600ZYZK/kLQmB4qM/MK/XDwltk0WcojEn2Lgunuz1LLLAYpQP0Ixz/jOa8lvvM4gYWVbWvx6lVsyWZCgYKZcKfcqB30H8NaA+TVjsqb/d9Ci3WkDEpFYz8LMuMMEYb9bCiPlGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774370255; c=relaxed/simple;
	bh=yi4Fvg7FkqCtqvd+hXTce1vKAWL/DOSxHSGVeeD7pIo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=QCfxBX4UaaivnCAITH9tFRn4FNsJdHC+6J9ppSVSlFsHyAbS9nIN7HlCVwxSm5xW75SJAsSJ16kAtrqgFWlRS8Saagap31FUcNcvaHgvLkilE5jEBD66xDNO5uo7aKiCFqcoV4lajXq/hVAcnnXhMU1SJ7g1YFbPzFC94Hc+4bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KEoMoLA7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KEoMoLA7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774370254; x=1805906254;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yi4Fvg7FkqCtqvd+hXTce1vKAWL/DOSxHSGVeeD7pIo=;
  b=KEoMoLA7fOp4quKIDTythxcDgYRoIn37LhIxBzKJs73VvTyRM9OrJEbo
   A6UruZ2d6/2H6Y0lK2W/X7bwhisBL4n9hpZRKm9VmaZnzUHg1xJodQ4Sv
   Z3eVUudDryGMjPnj2NpNb51p/PbsWscjxg0kqkh/44TLrnhmuqx+oqMuL
   Z8X/Eftq7zRokKWAEoUHQSorO0eIlcT9bhSkEjW+TCZlL1pkIr3mfdXbL
   TofyjhhNjFG4VT0axvXv9VaKQY70GBlVRgKCPC6u/RB7XH3gSgxhmL5XO
   bbGH8qWQe0gkTVo2pre3BsQjFY84I5raOnutXwZk7gY+7eTE+WCxqPxNg
   Q==;
X-CSE-ConnectionGUID: Ta37yiUjSSeCwDpJUArW0w==
X-CSE-MsgGUID: W4GmkDmRQZ6UpapyyzahlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="62945780"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="62945780"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 09:37:33 -0700
X-CSE-ConnectionGUID: +tI5957mRkWd/rySzSs9HQ==
X-CSE-MsgGUID: QLPb9+6hTMqV4BuZjTrICA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="229322971"
Received: from jpp-desktop.igk.intel.com ([10.91.221.24])
  by orviesa005.jf.intel.com with ESMTP; 24 Mar 2026 09:37:32 -0700
From: Sachin Mokashi <sachin.mokashi@intel.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	tiwai@suse.com,
	pierre-louis.bossart@linux.dev,
	Sachin Mokashi <sachin.mokashi@intel.com>
Subject: [PATCH] ASoC: Intel: ehl_rt5660: remove unused macro definitions
Date: Tue, 24 Mar 2026 12:34:00 -0400
Message-Id: <20260324163400.1276247-1-sachin.mokashi@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

DUAL_CHANNEL and NAME_SIZE macros are not being used (anymore) but the
macros are still defined. Remove them to clean up dead code.

Signed-off-by: Sachin Mokashi <sachin.mokashi@intel.com>
---
 sound/soc/intel/boards/ehl_rt5660.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/intel/boards/ehl_rt5660.c b/sound/soc/intel/boards/ehl_rt5660.c
index 5c7b218f22b7..ec4825064436 100644
--- a/sound/soc/intel/boards/ehl_rt5660.c
+++ b/sound/soc/intel/boards/ehl_rt5660.c
@@ -23,10 +23,8 @@
 #include "hda_dsp_common.h"
 #include "../../codecs/rt5660.h"
 
-#define DUAL_CHANNEL 2
 #define HDMI_LINK_START 3
 #define HDMI_LINE_END 6
-#define NAME_SIZE	32
 #define IDISP_CODEC_MASK	0x4
 
 struct sof_card_private {
-- 
2.34.1

Intel Deutschland GmbH
Registered Address: Dornacher Strasse 1, 85622 Feldkirchen, Germany
Tel: +49 89 991 430, www.intel.de
Managing Directors: Harry Demas, Jeffrey Schneiderman, Yin Chong Sorrell
Chairperson of the Supervisory Board: Nicole Lau
Registered Seat: Munich
Commercial Register: Amtsgericht Muenchen HRB 186928

