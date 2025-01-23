Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C82921128D
	for <linux-sound@vger.kernel.org>; Thu, 23 Jan 2025 16:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737649378; cv=none; b=PYU/snVYpmNb9Is5oyvsNRtWcCGoZa6iq+3stHtAcIyN6pIQtuC9jS1cB0OexGbUeJ57+IAGdfxlVf9Hw0I8iY3ECsEeBqF4K5Slfad08QaX7A28eYMpFFK3czE07B38JGHQpzwHWVzpxPDpk/6pGqbu7lukAC0D3jUekuxe3nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737649378; c=relaxed/simple;
	bh=UCSEhxhDDzjVA9GbhKf4nJj8GeYwV0iJhuN4/8D0FyI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=raPSV+azM4qJC5S1+Ig6NuWiZoGiyODkXk5z/JBnvgL1GG3r4ImUxLDYaB1y0/JMdPj8kX79hj3lhWYExvatyk3gIXYr/Xhbxy+j0kily726Ziya6tk0rqtUM9mqQFR1F+LKaqkMADYlwF4s+Pc4+CPZpzjPgSzO6lsGlrKr8gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mHPujcvn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mHPujcvn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737649377; x=1769185377;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UCSEhxhDDzjVA9GbhKf4nJj8GeYwV0iJhuN4/8D0FyI=;
  b=mHPujcvnEbJ0f12vAM5RJFFk5RbcSV8MuUte3DJOz6zupFMOnNf19ySA
   fi3/unzbMPzqk5fId9MmFqiXcoF8okYJbTORVxKpHZUAewSAYEIVIieR5
   tOCiT72Mh4rFGShjZ1sYOZ+U7rgzgqyz0QrPXuMNA3AqTVMSgC92QEGqs
   BxwlTtAlLUJsPDvXPmjquAE+qyrR/GsQrN0GKDiRAI+t0zONWBRt6p6id
   II0XKfTzT95DQ3N//WZHM4X+ozNR0ad7DA/FliQFVd8cL7EWmQW9KtYao
   27w7qwjGJFpjc3Rlg/eiHcshU/hOGu6nfABWkQG8baSDvXwuvHkUX3VeF
   A==;
X-CSE-ConnectionGUID: xNdxj2EQQCG/WApMhbYUDQ==
X-CSE-MsgGUID: 7ekE9vgUT8mwSAw97zAEfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55572460"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="55572460"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 08:22:56 -0800
X-CSE-ConnectionGUID: 5GS72NIDQAmRvXqUf5L3cw==
X-CSE-MsgGUID: In2bLZ2cSa6ukWXju5U4qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107346671"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 23 Jan 2025 08:22:53 -0800
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
Subject: [PATCH v2 00/11] ASoC: Intel: avs: Add support for MalibouLake configuration
Date: Thu, 23 Jan 2025 17:36:23 +0100
Message-Id: <20250123163634.1451237-1-cezary.rojewski@intel.com>
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
 sound/soc/intel/avs/boards/pcm3168a.c | 161 +++++++++++++++
 sound/soc/intel/avs/loader.c          |  64 ++++--
 sound/soc/intel/avs/messages.c        |  38 ++++
 sound/soc/intel/avs/messages.h        |  22 +++
 sound/soc/intel/avs/path.c            | 271 +++++++++++++++-----------
 sound/soc/intel/avs/tgl.c             |  31 +++
 sound/soc/intel/avs/topology.c        |  42 ++++
 sound/soc/intel/avs/topology.h        |  11 +-
 16 files changed, 560 insertions(+), 141 deletions(-)
 create mode 100644 sound/soc/intel/avs/boards/pcm3168a.c

-- 
2.25.1

