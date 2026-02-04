Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7D236BCC8
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 08:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770193079; cv=none; b=hVm21Z+dBl8FgbcCzR6xTBi2YV7T+RgFULYW9dtm1VcbhoKROWgkfvoGmGap2eiSrebj7KZq0+wYTocOOhSscImzHXhWoVct75KjiVTPwXD/kpYbyACTJvSiLO7OgCt8E9efyXl2et+/XE7K9rndUIgwJMlNlzVx5aFipocX8nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770193079; c=relaxed/simple;
	bh=Qi/9nLvlari+rc2gdtqX3jDAvt3GKFOnAnXBsxdwggc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HZgBV4xJaEKyxG8oDIkpTls6IYev5CSBh2uPVRJBMVnFJR0hXQH/KrXx2YGN+af2o0oHEbtLrRUbJvFe7lBSHoATauAcvEDNF4DnAUCrqoBm4yRFT3Trlgz+MtMWBpSQLdr1yTmMj6VoHVSE1CgEA5F9lkhQZ0D5NnPIFJJZMeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c954sk6R; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c954sk6R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770193079; x=1801729079;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Qi/9nLvlari+rc2gdtqX3jDAvt3GKFOnAnXBsxdwggc=;
  b=c954sk6Rhq/e6dFScUKxYZvAnARRhzOH56x9ezOVzLwl5Xcj1ewbIHrE
   AuQmpSCd/OSRQ81D4zbfp95tkLe5wfWTVGUovKmwZAwoUOX0SD989pAFT
   MSJCGzxLMQlw482D4rUwo1KkiY+Z6BlN51pV1D1p99IFL2lN01dmcwSwx
   YPUTiMJzSwpQq/qhoWbEGDRF+BN1J1xhhOSlHL7k96ssOY04CFyD3eLhA
   mO79BKnn5KUEQHHKHjJG850dFbaHn6lceLw2xGcZ2KkAtYJ8XleOS4Wxs
   75NxeNrDR/amb9GlKTRFA0xR02ziBGfZEZR8vsa29cIv+QFexFUttuH9s
   A==;
X-CSE-ConnectionGUID: JDhZNdteRMGNfRUalKRcVw==
X-CSE-MsgGUID: ObQ9558HST+9+K/qg8iVyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="94028444"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="94028444"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:17:56 -0800
X-CSE-ConnectionGUID: 1yxPgV9vSiWQiuxRveL91A==
X-CSE-MsgGUID: ORrDKrkgTx6YP7EhRdJZDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209893209"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.245])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:17:45 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com,
	mateuszx.redzynia@intel.com
Subject: [PATCH 00/10] ASoC: SOF: Support for echoref (virtual DAI)
Date: Wed,  4 Feb 2026 10:18:23 +0200
Message-ID: <20260204081833.16630-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

The series adds support for echo reference functionality by allowing
the capturing of playback audio right before it leaves the DSP.
For this to work correctly we need a virtual DAI that is also connected
to the echo reference capture device and in absence of playback a
signal generator generates silence to allow the capture to run.
When the real playback starts, application will start to receive the
playback audio to be usable for echo reference.

Regards,
Peter
---
Ranjani Sridharan (10):
  ASoC: SOF: sof-audio: Add a new op in struct sof_ipc_tplg_ops
  ASoC: SOF: pcm: Split up widget prepare and setup
  uapi: sound: sof: tokens: Add missing token for KCPS
  ASoC: Intel: sof_sdw: Add a DAI link for loopback capture
  ASoC: SOF: ipc4-topology: Add new tokens for pipeline direction
  ASoC: SOF: ipc4-topology: Add support for process modules with no
    input pins
  ASoC: SOF: sof-audio: Traverse paths with aggregated DAI widgets
  ASoC: SOF: sof-audio: Add support for loopback capture
  ASoC: SOF: Intel: hda: Fix NULL pointer dereference
  ASoC: SOF: Intel: hda: Add a virtual CPU DAI

 include/uapi/sound/sof/tokens.h  |   3 +
 sound/soc/intel/boards/sof_sdw.c |  43 ++++++-
 sound/soc/sof/intel/hda-dai.c    |  22 +++-
 sound/soc/sof/intel/hda.h        |   4 +-
 sound/soc/sof/ipc4-topology.c    |  82 ++++++++++--
 sound/soc/sof/ipc4-topology.h    |   4 +
 sound/soc/sof/pcm.c              |  81 +++++++++---
 sound/soc/sof/sof-audio.c        | 215 ++++++++++++++++++++++---------
 sound/soc/sof/sof-audio.h        |  15 +++
 9 files changed, 370 insertions(+), 99 deletions(-)

-- 
2.52.0

