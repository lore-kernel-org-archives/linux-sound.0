Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542BC3E63A8
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 12:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776170694; cv=none; b=SMrEK0FTA4xTnxX9YEFvZGOH1X3THodc6bVHq9E7ZqexDKAmx+4n/ZQ8lEvkjNWUfXjwVZN7UuhEPp/r9GLyDfz6JgwGdzxgXM/ekC1vApwOxlIjFqQlpQ22SToF9NNAEqM7QMAwXlpQQHEq/zNUxTSwYKEogPNfBZKwFyP1mWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776170694; c=relaxed/simple;
	bh=MqIU2s95rCSKY7r0HXVPUvNlyI6qmsx9HZvEQ4sXve4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RlmoYToTxXo8BcC6LY12IV4q9gcEUY3oUIBQphC3O4FhaG7pzeVaWw88WdMMn7JoF6uk8Hxvz76ANHAyqrCeWf0ESGhdL6qnzJ47OoHvx3TeZ03h7w6HJIC/F/oRL1N8oP8qA7qo58QHORowPVnHoCF/rk1YfL/XYFEbP7XuBTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dUPax8RC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dUPax8RC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776170693; x=1807706693;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MqIU2s95rCSKY7r0HXVPUvNlyI6qmsx9HZvEQ4sXve4=;
  b=dUPax8RCsZHQuGaqd58l5WkVRFgUKlwu5oR8gfaEmIDcjC2koaegQ7lJ
   4sVjKUgYfkRPXx77PMO605OV/VpCeJHLsSRcogsIs51SZm0KJQEqU+Qt1
   xeZrN8EKZYWAp5xh3UsL5wszr/syrIxty4Lwaj486QqV501icSQKk08/X
   eDC+FVCEDofSaMRmgyKMZ6bf+G+RtRlmswCl3jXAoz2hufNAP81rWFRCy
   kGB4ftWCaEKXtoYWPomSQb271v7kiNIPUEDRoFF5CBs7RRnb65KE3YVUx
   abPjzsVgWWW9ajybd/0i/TrTW+ds3mwLQuSNRbEMri2e2ARchktwQUeJQ
   g==;
X-CSE-ConnectionGUID: pj26TBxGS7Cpmjs63i3PWA==
X-CSE-MsgGUID: U22OpbhwSLWyi2iupvJRRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77002730"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77002730"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:44:52 -0700
X-CSE-ConnectionGUID: iAy7DgsORmqh72T9pn68PQ==
X-CSE-MsgGUID: HaPTGeSAQfe0K2rJNFb4hQ==
X-ExtLoop1: 1
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:44:51 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 0/2] ASoC: SOF: topology: allow user to add topologies
Date: Tue, 14 Apr 2026 20:44:41 +0800
Message-ID: <20260414124443.3270016-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds a module parameter array to allow users to load specific
feature topologies.

Bard Liao (2):
  ASoC: sof-function-topology-lib: add virtual loop dai support
  ASoC: SOF: topology: allow user to add topologies

 .../intel/common/sof-function-topology-lib.c  | 11 +++-
 sound/soc/sof/topology.c                      | 51 +++++++++++++++++++
 2 files changed, 61 insertions(+), 1 deletion(-)

-- 
2.43.0

