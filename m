Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2252DB791
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 08:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336848; cv=none; b=te7vWtg3pmDmwUWA5y0+RQ1TiN69J5HikEViYGYbme9ollrd+GRqr19AopXSVvPexhpbQ5ds3QVWDioJ+tB6FaUxqjoLXA/MGZGECWyeMgHlbtiUQWOqZWm4QEaUqQ3X5/Bm7n6QHMB8hWGvmllvCBsZsJ7BlT6qXZ5k8okQIFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336848; c=relaxed/simple;
	bh=xCk9rgioBfJIgvuVTGmPUBJmz8CchmarO9mw2Xx1K54=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=FaUCf2JZXaJXwzTyeCsnJ2YAv77eHZ2Y0LPHURUQe2AGWuvJhQR/2oqNN+AYvAXt5WAPVEgAX9lHftl2fzxDtReY1uOaQRQpiAbMjm3MfTnflSGfoKgaej7x8K0NEahQdUgaYr4xGnIaniKxEPFh+dMrNzWEXUKyCWZBfAFM+8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qr7SR3uU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qr7SR3uU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788336846; x=1819872846;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xCk9rgioBfJIgvuVTGmPUBJmz8CchmarO9mw2Xx1K54=;
  b=Qr7SR3uUZIN2exycG5v27oUTeMhrCHq7SlrAwv8xFLpjQ8c5bVEk0WCY
   yDxd8ss+OJgSRY95Us0SJukBbiAYIhk0CMyXmtguOzPG1cJuW9PLbBwy6
   eqsO56TYciR9Y4tCfQWGq3HkWfRw4J/0hirtP2NIhC0/XQsV65QlqdCv/
   c51sibMPLKPQ1V0YcybnDauAP0+Yh0X0/IQTijqQrURzE7KgreRs2NZL2
   z2JmhC5J7bRW/FtI7yoUvmpQz2gRihQnH3F+uHZcc+V2HfgCvcK7jBgwV
   +ZrQLwz/g7z16VDq2R8X4dZr5xIUpZQFbOCrgsghjyRutOlDCJ5uc+WEk
   w==;
X-CSE-ConnectionGUID: g9Gs3h8qS4ap/GGl8uvGQw==
X-CSE-MsgGUID: T3EvhW0bQ0mLlvhIFcKMMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99120945"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="99120945"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 01:14:05 -0700
X-CSE-ConnectionGUID: /sUA5ORYTGCGFm9xJyk4WQ==
X-CSE-MsgGUID: 6oCNSP8xRGenqx17yRUI3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="266099052"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 02 Sep 2026 01:14:03 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v4 00/10] ALSA/ASoC: Intel: avs: HDAudio bus and general fixes
Date: Wed,  2 Sep 2026 10:18:04 +0200
Message-Id: <20260902081814.1590883-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The first half of the patchset concentrates on the driver initialization
procedure - a number of steps do not clean up after themselves when they
fail.  This is for both, HDAudio bus (ext) and the DSP part (avs) and
targets following procedures:

- stream initialization
- link initialization
- bus initialization

The next five are loosely related fixes.  First, split topology-loading
error handling from request-firmware one.  Currently -ENOENT coming from
topology-loading, which is a real error, is ignored.

Second, with deeper test coverage around corrupted firmware/DSP exception
handling, new issues are unearthed.  Switch to async d0ix_work
cancellation to avoid deadlock when D0IX has been scheduled just before
the recovery work.

The 09/10 patch, init_config change fixes possible out-of-bounds bug.
The fix is larger than what one could expect as instead of patching with
if-statements I've decided to refactor the parsing of init_configs.
The scenario that causes the problem no longer exists.
Note: the solution does not impose any changes on the existing topology
files (userspace).

The remaining two, IMHO are self-explanatory.


Chamges in v4:
- replaced error paths for patches 1/10 and 2/10 with
  snd_hdac_ext_link_free_all() and snd_hdac_ext_stream_free_all()
  respectively, as suggested by Takashi

Changes in v3:
- dropped the patch introduced in v2 as an equivalent change has just
  been merged [1]

Changes in v2:
- added patch "ALSA: hda: Clean up pages when stream buffers allocation
  fails" to address Mark's review for "ASoC: Intel: avs: Clean up the
  bus when its initialization fails" and clean up pages before
  collapsing the bus initialization
- removed unused 'acomp' variable as pointed out by Mark

[1]: https://lore.kernel.org/all/tencent_8E5BBBD19D53B1EFCDB6E89F3B6246A70B06@qq.com/


Cezary Rojewski (10):
  ALSA: hda: ext: Clean up links if their initialization fails
  ALSA: hda: ext: Clean up streams if their initialization fails
  ASoC: Intel: avs: Clean up the bus when its initialization fails
  ASoC: Intel: avs: Clean up the bus when fetching ML caps fails
  ASoC: Intel: avs: Clean up streams if their initialization fails
  ASoC: Intel: avs: Do not ignore -ENOENT when loading a topology
  ASoC: Intel: avs: Cancel d0ix_work asynchrounously during recovery
  ASoC: Intel: avs: Fix unbalanced module reference count
  ASoC: Intel: avs: Refactor and fix init_config access
  ASoC: Intel: avs: hda: Constrain MSBs on startup

 sound/hda/core/ext/controller.c      |  4 +-
 sound/hda/core/ext/stream.c          |  5 ++-
 sound/soc/intel/avs/boards/hdaudio.c | 17 ++++++++
 sound/soc/intel/avs/core.c           | 59 +++++++++++++++++++---------
 sound/soc/intel/avs/debugfs.c        | 12 ++++--
 sound/soc/intel/avs/ipc.c            |  6 +--
 sound/soc/intel/avs/path.c           | 11 ++----
 sound/soc/intel/avs/pcm.c            | 34 +++++++++-------
 sound/soc/intel/avs/topology.c       | 49 +++++++++++++----------
 sound/soc/intel/avs/topology.h       |  5 ++-
 10 files changed, 130 insertions(+), 72 deletions(-)

-- 
2.34.1

