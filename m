Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11002F3613
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 09:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761210379; cv=none; b=kfwzMtSs5iDzn0Lvlnj1EE0n7iCRFbrRm/uNwN9pbswdbeMuTRRbdQBxdoj2+l1WQPRBe2s1hXLqMZErQxafKWn2rk0qJKSf+bDz2aTUjo+NwMk1EVcMCN18sMJPEJETCMTeoIvJLHu5y6D/9dFNv7rvrh3Fktr5oY685fRFwlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761210379; c=relaxed/simple;
	bh=2mtJfNvkKwb7y7tJdgh4ythrE9e2cer1wD79oJZBOzY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ibi8JHdeN8ywZg5rCEXosaEJchaD2Z9D7gD1Rp5UmldpH6oeZ0du3Mzwbcj3DHroTXbfQtZ/VgFMR6MVqIOD5l1uN4GNF66AqNW0iBV9mSDsnEUVmKQZBmDeikNl3iS4KTXecyCp6IaEibvDiVLwjNyRitfio8wWKUlaoqcRGDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aXYLrpjD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aXYLrpjD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761210378; x=1792746378;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2mtJfNvkKwb7y7tJdgh4ythrE9e2cer1wD79oJZBOzY=;
  b=aXYLrpjDHBgdM4NfW3ErRgUEFVeoczTYJwm+plaNFwzVH3XxQ4+nvu6W
   J04qtRNDftVUTO01eqh3Grjq5XFUtkzrGoMEivfU3Bks8ngyKtdR8mGD8
   gTihE/4Oz3RNostWhpG1jpDy2qVdZsFVj0qS5jHqGMPi51rRv3iAgmx7h
   MMngQinnexuKnBch2jMLNP5slWu1gobuOk09Egaup7SsujDVRc1ekRgRf
   FG8fw0B5r6wV+1XfCpuRFjxYgufMsVCgUsYm7RxjAx6SRBqNtrpQbedEL
   TXwI5ece1LhTt7hBTB0UQo9s3LtbAjwpNXHEsdY0rrzyr5/JnUe/pc/6K
   A==;
X-CSE-ConnectionGUID: vrivs++xQCeHaeFwxpzk6g==
X-CSE-MsgGUID: GrvfjNRETUa6ceVYh4D05Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62404291"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="62404291"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 02:06:16 -0700
X-CSE-ConnectionGUID: 8xcnPiNQTrKrqa5c5+fC7A==
X-CSE-MsgGUID: U/5FOi2dQ0GqLMjLtvrt5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="189372397"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa004.fm.intel.com with ESMTP; 23 Oct 2025 02:06:14 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeusz.slawinski@gmail.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/3] ASoC: Intel: avs: Set of streaming fixes
Date: Thu, 23 Oct 2025 11:23:45 +0200
Message-Id: <20251023092348.3119313-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Small set of patches two of which fix problems observed during shutdown
and XRUN scenarios for PCM streaming. These ensure HDAudio HOST stream
is reset and re-setup during XRUNs and synchronize avs_dai_fe_shutdown()
and period-elapsed work (thread) so that no slab-use-after-free panics
occur.

The last change makes the 'format' parameter provided by a
compress-application taken into account - currently its ignored. Such
approach helps us increase the coverage of data probing (debug)
functionality.

Cezary Rojewski (3):
  ASoC: Intel: avs: Unprepare a stream when XRUN occurs
  ASoC: Intel: avs: Disable periods-elapsed work when closing PCM
  ASoC: Intel: avs: Use snd_codec format when initializing probe

 sound/soc/intel/avs/pcm.c    |  3 +++
 sound/soc/intel/avs/probes.c | 18 ++++++++++--------
 2 files changed, 13 insertions(+), 8 deletions(-)

-- 
2.25.1

