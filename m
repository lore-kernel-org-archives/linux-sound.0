Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E069642F70D
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 16:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194315; cv=none; b=o+n9RvdiRrgBAnLGw7w4yOy/Phovq2Fy3ICRiLbzdLmWVowFE5umU3X0ibmXQJ0R06veXJBgw9u19Hq3Dnl3R+XhkQQDxQfqicI5ZkJclDbJUi8cCeyc4zOdrWOeIO1WgWHqCkkc5B7etbpDFtNHHN2FoOocVsCMKaUtzc7x3mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194315; c=relaxed/simple;
	bh=YI8087MUaOcY73jkaW7vxPO+H2MNvRL0JKs9wOMdtD8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=CfZK79i019jscg+B0R3KksMhkuip58tYI5erLo/g8sOSYpHydNHo4tDDXn7XGDLd5dOJt22BqvZ+2an+CATqgWUduhzHtTWnuyL/LwbVw2wUYdyT1EwCIcjh9WT9eM/0DC9O4eIezfLThknuQB4/FAIcWhv/0EeqpDR1o4DhqZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EEitfKpr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EEitfKpr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788194314; x=1819730314;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YI8087MUaOcY73jkaW7vxPO+H2MNvRL0JKs9wOMdtD8=;
  b=EEitfKprtq76gvCZKYXOru+mWZ4JP6bLEsAhEg8vcmpCR0j4hm/DE8DD
   l37hKYtf8VkqGF2xGp8CotsDglxs5yxpDEeVc+5tLMJ2ErXNhx/GHzFid
   nn8ki065IOH6p5027yKXgoYycZuyP2T6RTlVM7zGfxJwy90Xib4n/4xx2
   3rB0NqNxgaCruwSRUakh1mlhL1BT8lyaGe6dxPVcyjySVtcJkWmJYoKTC
   PFUofmTEILNC8cxcCzT+/geXleyVrE+YIBLY3QwNyQft0zphqDgnKuT0e
   iUa7VRgKsqqEdgJP3w8XtZw7kIPcd4nWxQ79BhDA4Z8mrA8pwMEbf2gGH
   g==;
X-CSE-ConnectionGUID: 36A28LrKTXOMTrP7tie/NA==
X-CSE-MsgGUID: apKo7YGVQL63pY+Q02OjZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="111379701"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="111379701"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 09:38:33 -0700
X-CSE-ConnectionGUID: QquYCEIJT+SEAgGpfes6uA==
X-CSE-MsgGUID: j7TURVuDStC0CYAf/bK9mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="274111725"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa005.fm.intel.com with ESMTP; 31 Aug 2026 09:38:31 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 00/10] ALSA/ASoC: Intel: avs: HDAudio bus and general fixes
Date: Mon, 31 Aug 2026 18:42:23 +0200
Message-Id: <20260831164233.1487766-1-cezary.rojewski@intel.com>
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

 sound/hda/core/ext/controller.c      | 11 +++++-
 sound/hda/core/ext/stream.c          | 11 +++++-
 sound/soc/intel/avs/boards/hdaudio.c | 17 ++++++++
 sound/soc/intel/avs/core.c           | 59 +++++++++++++++++++---------
 sound/soc/intel/avs/debugfs.c        | 12 ++++--
 sound/soc/intel/avs/ipc.c            |  6 +--
 sound/soc/intel/avs/path.c           | 11 ++----
 sound/soc/intel/avs/pcm.c            | 34 +++++++++-------
 sound/soc/intel/avs/topology.c       | 49 +++++++++++++----------
 sound/soc/intel/avs/topology.h       |  5 ++-
 10 files changed, 143 insertions(+), 72 deletions(-)

-- 
2.34.1

