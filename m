Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9D01BF3B
	for <linux-sound@vger.kernel.org>; Thu,  4 Apr 2024 19:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712257445; cv=none; b=qCUhiTFDkVhqOhj8ndhlMGZgo7/4kT22X2r/2pb9d0KODFXgBWADaIG4qmEerCAGnLMr0ncVF2yHE21lEanKZQbLFAsNyaZMQShiIjrSKd2mtJleC9WPNsOnbVIipOKb1vbujPIQMorb7il8fAmgo1djEPeq2qKWlivXWa1YpAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712257445; c=relaxed/simple;
	bh=5PXai1ELdJMCIV3le8QrsuCjyQcUu0kNXQzg+DVqnkw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=I1D2uuj5mYT5dNp4Fy1mbdLGaRXc/i2lwUP+DeMlIQVegSYZ7hPqNzV/q7dBAjCnEln6bUl0zJC7+DyCAMqMFOc4CTfoHDQTf8re9a8CSz4g4/amhK1BJTiR4ERwBA+UAL+6H0sO8QPz9klEdJPXAiT1aKtcyEgJyvwI0ejpoIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K4bOdfpd; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K4bOdfpd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712257445; x=1743793445;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5PXai1ELdJMCIV3le8QrsuCjyQcUu0kNXQzg+DVqnkw=;
  b=K4bOdfpd1gsUHd+OkD6KTAVo2YqfUz6Fal1JK0tm3rWnJI2Xjwf+8HD9
   d/TSmID6G+VtEBpPrdC1wiDQDKFXP72SNwW074iYfbCb/17nOhkTaU4Y+
   Aai5cwUgMV9Nl5cXrlZLp64f1muQDTYlZzV6jxJV0qclLdIU+2JQB7IQB
   CW92cMH0C3dObqwiaaxkJ+mndBh42EI2QqMTWX5KvIiQ3JM9+5JgjgEM/
   A8m1y1wJHhmUO16nqVcPPhQ6+h5FjIYAW16rCcoj859xXZGBfFdcothNF
   u0TgsOvOf/zBg18JFFybl4xuQpvaMGTCC/t5HDUWcEI3MVjcGYI+7mph1
   Q==;
X-CSE-ConnectionGUID: Vtb3+PLSTC+vhasq3iWDLw==
X-CSE-MsgGUID: Wftvh7UtTVKv6PclZDs6zg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7433857"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7433857"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 12:04:04 -0700
X-CSE-ConnectionGUID: WdkdDkcbTMadF2e63i5eCA==
X-CSE-MsgGUID: jcVqJTJlQEiKYNvdXqfUuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="19492305"
Received: from sparrish-mobl1.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.119.106])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 12:04:04 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/4] ASoC: SOF: Intel: improve and extend HDaudio-based wakes
Date: Thu,  4 Apr 2024 14:03:53 -0500
Message-Id: <20240404190357.138073-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For LunarLake, the SoundWire in-band wake detection is reported with
the HDAudio WAKE_EN/WAKE_STS registers. In the existing code, these
registers are only handled for HDaudio codecs. Now the same registers
have to be handled with care as shared resources.

The in-band wake detection mainly used for jack detection. Without
this patchset, the SoundWire headset codecs signal an event that would
be ignored and not reported.

Pierre-Louis Bossart (4):
  ASoC: SOF: Intel: hda-ctrl: add missing WAKE_STS clear
  ASoC: SOF: Intel: lnl: add helper to detect SoundWire wakes
  ASoC: SOF: Intel: hda-codec: preserve WAKEEN values
  ASoC: SOF: Intel: hda-ctrl: only clear WAKESTS for HDaudio codecs

 sound/soc/sof/intel/hda-codec.c | 15 ++++++++++++---
 sound/soc/sof/intel/hda-ctrl.c  |  9 ++++++++-
 sound/soc/sof/intel/lnl.c       | 18 ++++++++++++++++++
 3 files changed, 38 insertions(+), 4 deletions(-)

-- 
2.40.1

