Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80C64A18
	for <linux-sound@vger.kernel.org>; Wed, 22 Jan 2025 17:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737567642; cv=none; b=nFjfb8H8tO0xgt4jFaOKxs0E6j1TmAZCmdmwh6mqZu69OEt7n/FF3MTe/sHt4nqn1qeGTNv/p69+zjplmiJK7/geLDdHJXpZ0fw8/KgKGL06ZmV6Gh3Nw3AuX2fcZyCrBwZCfK1eNR+d3G1PNtrjwHPV//16ru9jVHDXOkeyCCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737567642; c=relaxed/simple;
	bh=tZ8uZ3laC1/WVahJvYATMsRkndQi8gyH2lbng7+foJg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=dBgktWJ7/VpV0SZtqmzAxSXgN/9S5e2N1B2jP7e0ztAXzCaIGFpzvaR2uFOs7lPzTpWT2zCcaWPucuPZnsm+4YMCLsgfpczuqZpmPwyQSJ06vQTL4176Dhyt+lk0UIf9lfow4Gn/WiOSDcyca5kNwIwPhjPhKrdF7z5BjZ9yKQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mwHoAsRp; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mwHoAsRp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737567641; x=1769103641;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tZ8uZ3laC1/WVahJvYATMsRkndQi8gyH2lbng7+foJg=;
  b=mwHoAsRpGMjnudqjTTgKUcEC096REp64T8OegK5kW8FdHSwoqjS61x7G
   vjxJBheU1D9F/w0AO2Ws2ruuaK0PyVgHmHNH9j4E7OGf2Q50rKp0GRCfz
   Z5bW65D5Jzh7GXKtIkbzHxYCiaa7YdMco3oMqVFMJeFc4zxRA9QLM0EgA
   b3XfzlsGEZVIENhx7XJLFjy6S7ESoetMJGaKb9x4Pettk0RDCETT0DSb0
   DefOv2uwC9TfLRKXBU6os0WAK1jSuTx0r7pNhrvLprvX1C+RsW9ww3fi/
   rLP+LyL8HOExxtADMoV+fMl3LTF2WflSCM0J73SObkv1J4bB7gP3F+dyM
   g==;
X-CSE-ConnectionGUID: XicvqTR6ReKNQ3uwJN0wjQ==
X-CSE-MsgGUID: X4LCObC3SXukqccnSG9vCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="49434718"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="49434718"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 09:40:40 -0800
X-CSE-ConnectionGUID: wFlORnUrR/6x9SGIN3Qw/A==
X-CSE-MsgGUID: eNNFiKzCR5uRP5n3f6wnGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="112185189"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa003.jf.intel.com with ESMTP; 22 Jan 2025 09:40:38 -0800
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
Subject: [PATCH 00/11] ASoC: Intel: avs: Add support for MalibouLake configuration
Date: Wed, 22 Jan 2025 18:54:15 +0100
Message-Id: <20250122175426.1369059-1-cezary.rojewski@intel.com>
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
 sound/soc/intel/avs/boards/pcm3168a.c | 162 +++++++++++++++
 sound/soc/intel/avs/loader.c          |  64 ++++--
 sound/soc/intel/avs/messages.c        |  38 ++++
 sound/soc/intel/avs/messages.h        |  22 +++
 sound/soc/intel/avs/path.c            | 271 +++++++++++++++-----------
 sound/soc/intel/avs/tgl.c             |  31 +++
 sound/soc/intel/avs/topology.c        |  42 ++++
 sound/soc/intel/avs/topology.h        |  11 +-
 16 files changed, 561 insertions(+), 141 deletions(-)
 create mode 100644 sound/soc/intel/avs/boards/pcm3168a.c

-- 
2.25.1

