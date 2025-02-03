Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15262205ACF
	for <linux-sound@vger.kernel.org>; Mon,  3 Feb 2025 13:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591025; cv=none; b=Kwe680LFd6C0XNJYFJCh5q03LIpCcGQw4qxfWqR8YkPZEIntSyMwgiqXLG1WYazcJ141kFkJtbi5XnJ1unKRahPZLodhDQjyJRBGyONOFoqzWIBDqDhUwcWQgIhxHOde+Jipascv1cdWQ+DQqa67kqpCVvniWPS/o+r5Jqevit0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591025; c=relaxed/simple;
	bh=olxO9yHXsNQD8q2XjJJ18DLrgRRXPzel+E0JcDzlWkI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Zgvea9MsLr6B9su0tETiZplNN1jRpHL7uvtEJFpFv7edSOx2OrpPlo63J96CA/SwIIltztrIPs3LKt/b8NkQHldUlCholDVT2VZGWMMpzZW7/5DXqkAZEP0R5OVK4zl4LcHiVwkFabf93xGOcPy/l403nEgFOUyyMov2UfldjCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kPq8LILH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kPq8LILH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738591023; x=1770127023;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=olxO9yHXsNQD8q2XjJJ18DLrgRRXPzel+E0JcDzlWkI=;
  b=kPq8LILH14ZkDk35G6L8qOyG8fZa9UpcjFDLEuR+5DY4//ntmEDjhA8Y
   EIihOkAcdqxNDkHZctyPYnbWRepyLbYX2OUYVZRSXhRAKxEa8l7FOwOuK
   cEYvYRmimHGQsS3J29p9cvFBRd+KUbHlIlv7MKvPcJdPC6N53aqaznRN8
   Mwlh80Lf1+GrHhCAAb0VzZElmBRlKlMKxPXuq6RFx7nHngl34S/3wSLzC
   /FLEzkSyFk78s6lSOePYe8oI+APKCoKURAOZKWMJEPllkZpBWQTpOYIga
   vBmuBPyKRgrsdtIBO64+oOer6BizrlkcnNE3rc3FzvWhc4qrEdXRR9iU5
   w==;
X-CSE-ConnectionGUID: +yvFkxDlSY+/iX5ORlUb/Q==
X-CSE-MsgGUID: eSIdD0y5SJqX2vZ/KgbOZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56511774"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="56511774"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:57:02 -0800
X-CSE-ConnectionGUID: 49UfNntATIKGYdMS1SlSkQ==
X-CSE-MsgGUID: 1fD0mJRoTAC/3CVGcaEtyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110057844"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa009.jf.intel.com with ESMTP; 03 Feb 2025 05:57:00 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 00/11] ASoC: Intel: avs: Add support for MalibouLake configuration
Date: Mon,  3 Feb 2025 15:10:40 +0100
Message-Id: <20250203141051.2361323-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The avs-driver is the go-to driver for Intel Automotive. MalibouLake
(MBL) and RedondoLake (RDL) are representatives of the project. These
inherit majority of the featureset from RaptorLake-M (RPL-M) and
AlderLake-N (ADL-N) respectively. The onboard codec for these is TI's
pcm3168a.

In summary, the patchset:

- modifies existing pcm3168a.c to be x86/ACPI friendly
- updates the DSP firmware booting sequence for cAVS 2.5 platforms to
  improve its behaviour on some specific revisions/steppings of the
  hardware
- adds new machine board driver, avs_pcm3168a
- adds selector entry for RPL-M devices in intel-dspcfg

While there 'ALSA: hda:' patch within the list, I'd prefer the patchset
to go through Mark's tree to avoid conflicts with follow ups to this
one.


Longer version:

Currently the pcm3168a is supported on ARM/DT (ti/j721e-evm.c being the
only user). To make it x86/ACPI friendly, add relevant ACPI-match table
and relax driver's probing conditions.
The default format is 2ch, 24-bits, 48000kHz. As per specification,
24-bits are supported by the chip and it works in production in contrary
to what the existing code suggests. A fix is provided to align the code
with the spec.

Now, a single DSP firmware binary covers a wide range of platforms - a
single one covers AlderLake, RaptorLake and all their derevatires except
for AlderLake-N based due to MEU differences. While most of the hardware
capabilities are read by the firmware during runtime, some information is
not accessible from the DSP level. Provide the HDAudio controller
revision/stepping information to the firmware to address that.

With that done, expand number of modules supported with WovHostModule
(WHM). WHM is a processing module which is tailored for ultra-low-power
scenarios. From software perspective, as most of its config is similar
to the Copier module, code reuse is advised. To make the reuse possible,
existing gateway configuration code is refactor - not only to add
support for WHM but also make it easier to understand. Multiple smaller
functions instead of all-in-one one.


Changes in v3:
- fixed compilation under X86=n, found out by IKP
  Note: no users of cpuid() seem to be honoring COMPILE_TEST currently.
  In future I'll try to get rid of ugly #ifdef in tgl.c, but that's not
  in scope of the MBL series
- removed redundant hw_params() op from the pcm3168a board. Not needed
  for MBL where the codec has its own SYSCLK source

Changes in v2:
- added missing MODULE_DESCRIPTION() to avs_pcm3168a


Amadeusz Sławiński (1):
  ASoC: Intel: avs: Configure basefw on TGL-based platforms

Cezary Rojewski (10):
  ASoC: codecs: pcm3168a: Add ACPI match table
  ASoC: codecs: pcm3168a: Relax probing conditions
  ASoC: codecs: pcm3168a: Allow for 24-bit in provider mode
  ASoC: Intel: avs: Add pcm3168a machine board
  ASoC: Intel: avs: pcm3168a board selection
  ASoC: Intel: avs: Move DSP-boot steps into individual functions
  ASoC: Intel: avs: New gateway configuration mechanism
  ASoC: Intel: avs: Remove unused gateway configuration code
  ASoC: Intel: avs: Add WHM module support
  ALSA: hda: Select avs-driver by default on MBL

 include/uapi/sound/intel/avs/tokens.h |   7 +
 sound/hda/intel-dsp-config.c          |   4 +
 sound/soc/codecs/pcm3168a-i2c.c       |   9 +
 sound/soc/codecs/pcm3168a.c           |  11 +-
 sound/soc/intel/avs/avs.h             |   1 +
 sound/soc/intel/avs/board_selection.c |  17 +-
 sound/soc/intel/avs/boards/Kconfig    |  10 +
 sound/soc/intel/avs/boards/Makefile   |   2 +
 sound/soc/intel/avs/boards/pcm3168a.c | 143 ++++++++++++++
 sound/soc/intel/avs/loader.c          |  64 ++++--
 sound/soc/intel/avs/messages.c        |  38 ++++
 sound/soc/intel/avs/messages.h        |  22 +++
 sound/soc/intel/avs/path.c            | 271 +++++++++++++++-----------
 sound/soc/intel/avs/tgl.c             |  33 ++++
 sound/soc/intel/avs/topology.c        |  42 ++++
 sound/soc/intel/avs/topology.h        |  11 +-
 16 files changed, 544 insertions(+), 141 deletions(-)
 create mode 100644 sound/soc/intel/avs/boards/pcm3168a.c

-- 
2.25.1

