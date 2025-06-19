Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB5F18EFD4
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 10:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750330584; cv=none; b=b2I7XO7a+fwv/uxdHjtz4mxJKWypW/HL8NaZk5jnfwcuu3KxDHIo9FBaEuNb0svQut16EYyDxxD39CMIBQJpxOvqeATUmXZzgAYQ4lLVnZyd2JGiYRixl0IsLcITTWBL19KYxB0jA3RjSuLkzf7auQrD4jCZXZkeWaPZcifM3oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750330584; c=relaxed/simple;
	bh=ZiJ4e5xdrVrHcgB5mAFaxqRq3YmjiTAcyZgTLXauE0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iNfzvO8nuS4/GvlsLqKVx01pa6YNdRW7DI8RPXW4NxJmsjth3tJf724B6w0e2Jwy5NMiizt1+tdC7m4UkDOGHY95HuWJhxM3/jFufXJEFh+/aRV4vmXbegCvzay+TWRJ5jWpLZ+oVJTUGUMvZQbwIaDRUNU+oJifCfav4IrmNcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cWaF5rFq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cWaF5rFq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750330583; x=1781866583;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZiJ4e5xdrVrHcgB5mAFaxqRq3YmjiTAcyZgTLXauE0c=;
  b=cWaF5rFqzqIBmQ/9uGOH7fum4ZEEOFYmZmkUGvIMQPItFl7iEzVxoae9
   bRMfneJXbt/hB74pssHfyxWSSTA05VsLRa/Gd6y/uyL8eem/Qfl3Gimec
   IoV+y4+mlfO05zfaJHx7lGgreOMfrg5JOcN8fqCIq5M103Q/tJPZBCAYf
   eBnFCPkjWokWcGGodhqHh+sYVVKLweqJYSZYIW8rT7jQ3d559PvA03R0J
   D6HYJUEiRbhItzwYWqgyelVzIpiMkhVL6pCPNY3ily2uEcjJ19WqqBhKa
   z1u0LempPooME76UY+Ladw/347alUkzeKke+L1mOvU2TAY45W5f56Trcp
   w==;
X-CSE-ConnectionGUID: 5XKI3GDSQIyz3U+jPy5IyA==
X-CSE-MsgGUID: YnCRRR0fRJakx/Go7x2rKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52282552"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52282552"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 03:56:22 -0700
X-CSE-ConnectionGUID: PB9a3uX5RgOB8Fg9CO4aJg==
X-CSE-MsgGUID: ProiWkdZQ+WiVObSCKbDGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="187817325"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.182])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 03:56:20 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	guennadi.liakhovetski@linux.intel.com,
	liam.r.girdwood@intel.com
Subject: [PATCH 0/2] ASoC: SOF: ipc4/Intel: Support for partial context restore
Date: Thu, 19 Jun 2025 13:56:21 +0300
Message-ID: <20250619105623.4546-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The firmware will be able to only save and restore the context related to
library management.
This means that even without a full context save, the libraries do not
need to be re-loaded to the firmware after second or consecutive boots.

This is reported via the FW_READY notification, where BIT(15) indicates:
0 - the library restore is not done
1 - library restore is done

This bit is only valid if full context save is not enabled, full context
save is by definition saves and restores the library related book-keeping
as well.

Add a new flag to tell the platform code if the libraries have been
restored, no need to reload them after boot.

Regards,
Peter
---
Peter Ujfalusi (2):
  ASoC: SOF: ipc4-priv: Add kernel doc for fw_context_save of
    sof_ipc4_fw_data
  ASoC: SOF: ipc4/Intel: Add support for library restore firmware
    functionality

 include/sound/sof/ipc4/header.h  |  2 ++
 sound/soc/sof/intel/hda-loader.c |  7 +++++--
 sound/soc/sof/ipc4-loader.c      |  6 ++++++
 sound/soc/sof/ipc4-priv.h        |  3 +++
 sound/soc/sof/ipc4.c             | 14 ++++++++++++--
 5 files changed, 28 insertions(+), 4 deletions(-)

-- 
2.49.0

