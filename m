Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CAD25B08A
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 11:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730015; cv=none; b=NimVu3PpxhJLxXJa1uUc+RMS6c9yy6FE6GLucK78iUJff4KmOADATpv51no2B2Rjlvrphjk2bx+0AZeYXNcIhugzF4F76QWUQAoorxetSy1QebDXxi2OmkAYwtmclNXd2ZTeOOfniibIHMy7jIWRTqPQyToVIdEfU/RfyC8Fkek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730015; c=relaxed/simple;
	bh=vAqkRX/B6/OGUKFIDuo27h8UeTJZ7M3zwxDDn/SDHmk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pBT3Go7jOoOveEuCU1MXo0foU4oirkgXbACcBW1nFvg4xaUjJgTItTd/FCfJl72CdGTNZc1I2JAkEc4vph4KNyAVaKHUbg+dQryrpNtA6DCaQiq6KOoFw3b9pt+S0H20OEN0aHvTRWT5MsPtXDnN8RvWVN4r8p2vn4zy+gh+KQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tei/BR2b; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tei/BR2b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789730013; x=1821266013;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vAqkRX/B6/OGUKFIDuo27h8UeTJZ7M3zwxDDn/SDHmk=;
  b=Tei/BR2bpWqQnkY08/fDLoD+adNjDStEewFwf9xpFROwvSROdaufESWW
   tJOs7JIE+/0J6nYE0+3+0VngJQ/O31H5U5gXvqX0ytLY0PBD3DWmBeZ1c
   EvkvfRthEZO8qOJiVx0RvTPjMhaLfNQsGRYg1qucTRxlDIQfsXBNhdyjZ
   SDuphAAROvlwrz6wUDGJBBWdd4g1JtaZnAZ9BckRzp7YSkAuFMiIh23pc
   1qsT20IEx4idCWeY0acGvbmmOepZSIgov4S1TqoXkzdgXDKeu6igTCgLw
   jiDKbQ9S3nFc2evtwjBl+/Wr+BUk9IwUOUpZgdP5aaQM+nKPf20wNEgxC
   g==;
X-CSE-ConnectionGUID: u58B2RgzRO+/k0qKxhPTnA==
X-CSE-MsgGUID: UdILSMP9QyC/+a1SKfbkFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="101577729"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="101577729"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:13:32 -0700
X-CSE-ConnectionGUID: OrJmi7N9R4qCZReiBx4yQA==
X-CSE-MsgGUID: aCIpqkBWSdOXA///5/jfDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="279581933"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa005.fm.intel.com with ESMTP; 18 Sep 2026 04:13:31 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/2] ASoC: codecs: rt286: Revert delay value for jack setup
Date: Fri, 18 Sep 2026 13:17:44 +0200
Message-Id: <20260918111745.3589393-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fat fingered the change when reorganizing the jack-detect
initialization. Equivalent changes for rt274 and rt298:

Commit a43b4394bb35 ("ASoC: codecs: rt274: Always init jack_detect_work")
Commit 1eb73102da28 ("ASoC: codecs: rt298: Reorganize jack detect handling")

carry no update to the delay value.

From user perspective, no difference has been observed between 1250 and
50 values on Intel's SkyLake, KabyLake and AmberLake configurations.

Fixes: 3082afe097cc ("ASoC: codecs: rt286: Reorganize jack detect handling")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt286.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
index 9e84cc657ef5..edfe7d88c313 100644
--- a/sound/soc/codecs/rt286.c
+++ b/sound/soc/codecs/rt286.c
@@ -956,7 +956,7 @@ static int rt286_probe(struct snd_soc_component *component)
 
 	if (rt286->i2c->irq)
 		schedule_delayed_work(&rt286->jack_detect_work,
-				      msecs_to_jiffies(50));
+				      msecs_to_jiffies(1250));
 	return 0;
 }
 
-- 
2.34.1

