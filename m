Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBE81C3781
	for <linux-sound@vger.kernel.org>; Fri,  2 Aug 2024 12:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722602783; cv=none; b=rTDh+aIoO5e4sLXqpkLLwPFsqh/3pphp2AeAF4Nbanjo9qaNuXNaDCMFvJxD3SCDwnOCtYM9u4bYK5kOiCJvd6CftKESPyP5+e5oKE7066JB9GTLjLSoKtsHnlCEiS6aT/tdZm9Al9fR3JccjHOJ8eK/xxu+qK6rtorQBZ/xX6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722602783; c=relaxed/simple;
	bh=fHr0c4y9cFrhSjFuuJ7aPF8B14yCQNEa5fFMaeX+GhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kOd9lhRwV3TFN1XQXNvUFpBUWTr5RUVj1KMGS1zf6dkbg6UxdlSsTUEgXmWt06YipuEMwsjXIyW1RmDVXaskDHKeMDU/o2O5w5R1lVQjjkyLiWOLkss9flfxWHSWACLTXbkYcsiyumS0GuNzzZpV6Yd7ynWAxSR7a/Iu5ArcAOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cXQGRb+M; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cXQGRb+M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722602782; x=1754138782;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fHr0c4y9cFrhSjFuuJ7aPF8B14yCQNEa5fFMaeX+GhI=;
  b=cXQGRb+MFjHjxezdo6zzGEe5dlBUVkoawhVvM9d5FOsOq5RO8te+sq/T
   4UNTir3BIXIALQMVFGQ2YWH2Rm1dYaacn1qAHUQICVvANK+MWK7p02uuf
   6D6IppmYOZIxo5TabWA9soKz5MnFv24GqQYb0PsZxLqGdS0zeWB2hLvMX
   2LUSetRrlGZ02Krt0bvhHWaHE2kIXIshc4/N6rCKoEdWrvqR8BZ7gKYf1
   Ncd4Ku4vn/skFODg1f6foFgv6pNg+l7QtqgmITafmwwiXAm88rP+fgFTI
   bevMKLyCw+q3Oy38D/mkGevaap7V+9YgBUOfGLRm0o10iUog1gNaOfdEA
   w==;
X-CSE-ConnectionGUID: UjQ/K9XoSCSkqlq2nnxXoQ==
X-CSE-MsgGUID: biUKjZ8bQKO+PJDKnq0LjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20199376"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="20199376"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 05:46:21 -0700
X-CSE-ConnectionGUID: JMN1u5hoROSKCtcbcPTL5A==
X-CSE-MsgGUID: XFKF4xJMSrSQAnVbeAeO1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="60407822"
Received: from ltuz-desk.ger.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.245.246.89])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 05:46:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/4] ASoC: SOF: reshuffle and optimize structures
Date: Fri,  2 Aug 2024 14:46:05 +0200
Message-ID: <20240802124609.188954-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

pahole reports a number of sub-optimal structure definitions with
holes and cache-line alignment problems, this patchset optimizes a
couple of structure frequently used.

No functionality change, only re-ordering of structure members.

Pierre-Louis Bossart (4):
  ASoC: SOF: sof-priv.h: optimize snd_sof_platform_stream_params
  ASoC: SOF: sof-priv.h: optimize snd_sof_mailbox
  ASoC: SOF: sof-priv.h: optimize snd_sof_ipc_msg
  ASoC: SOF: sof-audio.h: optimize snd_sof_pcm_stream_pipeline_list

 sound/soc/sof/sof-audio.h |  4 ++--
 sound/soc/sof/sof-priv.h  | 16 +++++++++-------
 2 files changed, 11 insertions(+), 9 deletions(-)

-- 
2.43.0

