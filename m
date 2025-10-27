Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF49542AA1
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 10:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761561635; cv=none; b=aDXiWzRMkyxGhZ9TJ2+DlklecTQwhT2qUDlbwIECFZFP4LDtlvb8xbND3BVkw0Ov/K8uHKt9EGgKEu8XukZ4UoZrHBzNP2okVx0UxM8hXge52nuGFSB13xA6R9VwJXA2ILFEmTWmCI+qeFs2D8TQ8SVFpBxztc1x/SCDqsOrbpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761561635; c=relaxed/simple;
	bh=k2fsIetjSp8I5bCYi/IqSya1geEsrs7dw80NWiOYwrk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XtWK4cVrscVSvCukgPs7fUk9ryvWr0arO//uSZ/7piqudBFRtSbqDzNqd3F8sMiAsuQrVNVQtlbuDVQs5GOfudN9U8tgq2ENyUZnfSde91m0Zhz29yxCqc2ozn8gHog7n5yyiTm8gowa/M3G/UII1tAyFUm/pEJ3HvzsdSvBwyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a0qPFaJW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a0qPFaJW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761561634; x=1793097634;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=k2fsIetjSp8I5bCYi/IqSya1geEsrs7dw80NWiOYwrk=;
  b=a0qPFaJW6KcL7WWsLYssA7ILtnK5GQ0AkHpd+ic3XupA2bnGvD8TSHBn
   MQ/e4ePfV0dE1TFh+S87M1sosorDCms3eKEHS6+ioWd6gAEIgQenro6FC
   ntKslRpbKQ0+QnG7XzcA4d3tV/hJx6wBYy0/TcQ4CVRJIo1AM+/Dgmzt3
   gd+7UnY+CQWByLT2j/G3dfjZXdsVtWDSy4PopIJwVENp3xSgDxb1G1n8F
   Mk5kJBKCRnvZ5AOKXgO9CfL9O36XCUiw3PEB9YjrHNzGNtHjy2udMFfby
   Ky0bgqeCS1OZicbaJTfaBwr74bNduP1lK3o2bc+33Hvgmq/YWehU9vk34
   w==;
X-CSE-ConnectionGUID: upyIRI8bQL+phH3yz4yTTQ==
X-CSE-MsgGUID: zZH3kc9PQaiunLkIwSJ9UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63672081"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="63672081"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 03:40:33 -0700
X-CSE-ConnectionGUID: 0wpJ8VTURWye0jKALSr3Dw==
X-CSE-MsgGUID: RCCZXpFgRY6l/lCybT5eVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="189051571"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 27 Oct 2025 03:40:32 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeusz.slawinski@gmail.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 0/3] ASoC: Intel: avs: Set of streaming fixes
Date: Mon, 27 Oct 2025 12:01:03 +0100
Message-Id: <20251027110106.3157415-1-cezary.rojewski@intel.com>
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


Changes in v2:
- fixes sparse warning (incorrerct type in argument) for patch ("ASoC:
  Intel: avs: Use snd_codec format when initializing probe")


Cezary Rojewski (3):
  ASoC: Intel: avs: Unprepare a stream when XRUN occurs
  ASoC: Intel: avs: Disable periods-elapsed work when closing PCM
  ASoC: Intel: avs: Use snd_codec format when initializing probe

 sound/soc/intel/avs/pcm.c    |  3 +++
 sound/soc/intel/avs/probes.c | 18 ++++++++++--------
 2 files changed, 13 insertions(+), 8 deletions(-)

-- 
2.25.1

