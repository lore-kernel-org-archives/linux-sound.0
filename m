Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F2717E8FD
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 19:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716839104; cv=none; b=HwuZsR80FIhJCICnKafzUUVFCSgeh95HM/FBSVrEeP6NPh6JSbm+HhdteV3dgqd8d+y3u0l6Z22tPfVoKgTcnTU8dCzzcih6e0IwrmpukzH5ev7j9dmNSGTjospClb8xaVxHuEaREzN65FX6B2+YWde8JXOHQrJ1eSpXeFwXgE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716839104; c=relaxed/simple;
	bh=ER/znK/s8ewD6cpmlot+Ja1dpoTPCYtblyYvr6l2PyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Tcdh1G4sFUcZhubC5CM/25hYHAYUCngIIRD3UNto3eZOjWk18EaiT3lsoWDPNp9flQ7S6bO8R+Rzz5Ndq5pK7nT4MvwvaVv/DCDO+ggc9854K+NG5TWagdr/AKbT2C4U9yec2mLVxg7VB9pWGHATeqUQEQqjDUKN+dC9OLlxzGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EycCpRkh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EycCpRkh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716839102; x=1748375102;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ER/znK/s8ewD6cpmlot+Ja1dpoTPCYtblyYvr6l2PyM=;
  b=EycCpRkhrz1FRayDelmKjPXuQx5GnqwE/pWSZdsAg5huiVOeC2IksgfB
   45nHtv59aVJreK0/aQcNgZ0ODScJ8QOiQbYfjq6PbSzfqnSu/EnObbK+m
   kcGNjJ7juaOArqqR/CcTtJ5WYlXSRBCnUpk720L/KBryPV91POJLKyVQd
   zhXQTBYy32CqoGmSq3rmXpZ+xZs2AuQ4txxBAhyimFESbVchq8VDsO2B8
   7NCLL1jPFWEwcAbvHg0Gx29+gnXVGpIVQsSoc2fOxXZxiRbd3i2weQlQ5
   77EWZ5wxjmh63BhhGkCp+ZzY4a9nbGCgiZfVM4Hgn1Hab28AuAm7Fam4h
   g==;
X-CSE-ConnectionGUID: CSSzCAjSSMySNmySEg+Vhw==
X-CSE-MsgGUID: /QpYLwS2RJOtP16ABVvxpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30679478"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="30679478"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:45:02 -0700
X-CSE-ConnectionGUID: uyVeeZUJTZe1E2idY8w7Tg==
X-CSE-MsgGUID: K/Fglqf5ShOiBpVpqGGVdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="39280541"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:45:02 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/4] ASoC: SOF: add missing MODULE_DESCRIPTION
Date: Mon, 27 May 2024 14:44:10 -0500
Message-ID: <20240527194414.166156-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

'make W=1' now reports missing MODULE_DESCRIPTION lines. This patchset
cleans-up all the module definitions and adds MODULE_DESCRIPTION lines
as needed.

Pierre-Louis Bossart (4):
  ASoC: SOF: stream-ipc: remove unnecessary MODULE_LICENSE
  ASoC: SOF: AMD: group all module related information
  ASoC: SOF: reorder MODULE_ definitions
  ASoC: SOF: add missing MODULE_DESCRIPTION()

 sound/soc/sof/amd/acp-common.c                 | 4 ++--
 sound/soc/sof/amd/acp.c                        | 2 +-
 sound/soc/sof/amd/acp63.c                      | 4 ----
 sound/soc/sof/amd/pci-acp63.c                  | 1 +
 sound/soc/sof/amd/pci-rmb.c                    | 1 +
 sound/soc/sof/amd/pci-rn.c                     | 1 +
 sound/soc/sof/amd/pci-vangogh.c                | 1 +
 sound/soc/sof/amd/rembrandt.c                  | 4 ----
 sound/soc/sof/amd/renoir.c                     | 4 ----
 sound/soc/sof/amd/vangogh.c                    | 4 ----
 sound/soc/sof/core.c                           | 2 +-
 sound/soc/sof/imx/imx-common.c                 | 1 +
 sound/soc/sof/imx/imx8.c                       | 3 ++-
 sound/soc/sof/imx/imx8m.c                      | 3 ++-
 sound/soc/sof/imx/imx8ulp.c                    | 3 ++-
 sound/soc/sof/intel/atom.c                     | 1 +
 sound/soc/sof/intel/bdw.c                      | 1 +
 sound/soc/sof/intel/byt.c                      | 1 +
 sound/soc/sof/intel/hda-codec.c                | 1 +
 sound/soc/sof/intel/hda-ctrl.c                 | 1 +
 sound/soc/sof/intel/hda-mlink.c                | 1 +
 sound/soc/sof/intel/hda.c                      | 1 +
 sound/soc/sof/intel/pci-apl.c                  | 1 +
 sound/soc/sof/intel/pci-cnl.c                  | 1 +
 sound/soc/sof/intel/pci-icl.c                  | 1 +
 sound/soc/sof/intel/pci-lnl.c                  | 1 +
 sound/soc/sof/intel/pci-mtl.c                  | 1 +
 sound/soc/sof/intel/pci-skl.c                  | 1 +
 sound/soc/sof/intel/pci-tgl.c                  | 1 +
 sound/soc/sof/intel/pci-tng.c                  | 1 +
 sound/soc/sof/mediatek/mt8186/mt8186.c         | 3 ++-
 sound/soc/sof/mediatek/mt8195/mt8195.c         | 3 ++-
 sound/soc/sof/mediatek/mtk-adsp-common.c       | 1 +
 sound/soc/sof/nocodec.c                        | 2 +-
 sound/soc/sof/sof-acpi-dev.c                   | 1 +
 sound/soc/sof/sof-client-ipc-flood-test.c      | 2 +-
 sound/soc/sof/sof-client-ipc-kernel-injector.c | 2 +-
 sound/soc/sof/sof-client-ipc-msg-injector.c    | 2 +-
 sound/soc/sof/sof-client-probes.c              | 2 +-
 sound/soc/sof/sof-of-dev.c                     | 1 +
 sound/soc/sof/sof-pci-dev.c                    | 1 +
 sound/soc/sof/sof-utils.c                      | 1 +
 sound/soc/sof/stream-ipc.c                     | 2 --
 sound/soc/sof/xtensa/core.c                    | 2 +-
 44 files changed, 45 insertions(+), 33 deletions(-)

-- 
2.43.0

