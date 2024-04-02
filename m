Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437BB17F3
	for <linux-sound@vger.kernel.org>; Tue,  2 Apr 2024 15:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712070015; cv=none; b=NbHKTfmUshCciEUttGOhUYVEMgHvQaLk8hkXBBj4oOW/Y1Q5vdK14QIWY7LrgVV1IJClmoIVRroGS2kMtXMieaVBtyr9H8Sa/3nikNVysufGrofMbw3SZyL/YZwF3I3KHJ2fwDdRfrFlBNEZn2NE0XZFwD1jcmsj+d9WQlmSvo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712070015; c=relaxed/simple;
	bh=f82dOPw9pkJ1NF8baBWwUGX/Wf0Zjl+Cupixo8XbQRI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VKaVKQQ1/ofkce1dG7afnvgAmu+aA+w3qew9O03QmjpF+Z/DOwWyOM+NGXkc9iE/F6quLkD2d+bVT9dF0ZFgL9QnRZ8sqUvQOp2GXO99xhZ5B3EUhqhaisVm6gbs4nIhnclC7Lf/tD2iq7PnxVtCT3DmFXNmFGyp+Hq+2DTe+BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jd8ihB04; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jd8ihB04"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712070013; x=1743606013;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=f82dOPw9pkJ1NF8baBWwUGX/Wf0Zjl+Cupixo8XbQRI=;
  b=Jd8ihB046zJ2v3dCFdT1KrGhmF4QEPJRoD8Eff2A+CTnkb7nKuPj9l7J
   v/jkJvKG9PKO7bgVgTct5H68nzNRaQO2ncQUaf7pEFbTASF8fyo34xVzr
   jmaGfbWeDLMCZm/C/JSETssxc7YbYscbaX78x2aGP4nexWI6CJp2n3uET
   Wn+1cgDjCJImVATkLaRkpnRQJbiYa3y3DxqBdEEzHttv7AGlDn1QfY5Fv
   Ox7ldfNR9W6NPphBHU47d7m1DNM8qKnEnaNVblnzNFfl/XuNv+2fLMBlS
   aSAq7gOZQuaOdTiAK77qvNGcZ2ivtsGeo4vJDb9aUKi7uDFcie7GXrouN
   g==;
X-CSE-ConnectionGUID: BwgTDmfyRNytVJocXrxsKA==
X-CSE-MsgGUID: l3tMS6F6RFC2TvGh0tK2iA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7433819"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="7433819"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:00:12 -0700
X-CSE-ConnectionGUID: QRMKrjuhTaGXlxxYOcsSWw==
X-CSE-MsgGUID: d48nDKVCSlaYin5wZxOCqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22558020"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.8.83])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:00:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/4] ASoC: SOF: cppcheck fixes and debugfs addition
Date: Tue,  2 Apr 2024 09:59:55 -0500
Message-Id: <20240402145959.172619-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Small changes with 3 cppcheck fixes and the firmware version now
visible with debugfs instead of only via dmesg logs.

Pierre-Louis Bossart (3):
  ASoC: SOF: amd: acp-loader: abort firmware download on write error
  ASoC: SOF: ipc4-priv: align prototype and function declaration
  ASoC: SOF: ipc4-topology: remove shadowed variable

Yong Zhi (1):
  ASoC: SOF: ipc4-loader: save FW version info to debugfs

 sound/soc/sof/amd/acp-loader.c | 2 ++
 sound/soc/sof/ipc4-loader.c    | 8 ++++++++
 sound/soc/sof/ipc4-priv.h      | 2 +-
 sound/soc/sof/ipc4-topology.c  | 1 -
 4 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.40.1

