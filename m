Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="meRkgaPf"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF94E1
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 04:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701086786; x=1732622786;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xIC41fFBzmKznL9WIQam10RoJy2/XeapkxNoaEOHH84=;
  b=meRkgaPfJzwxVZMBX2fuQaMH6O0B96vWnH2nwDCumkMj91RmoknkaY7N
   EDKSefg2oAV+CpEfZQYA7l6Wb4Gx7MqBsMAP2sF02uEdQBMGgBkh2ge6P
   p89Pdm23aY7mXgcnxLZnmz2tiUCRvc4QjgsVo8alCXaqAURidkerIYaj2
   gkup9N5mrBEfzu4NBiEaWY6SA7SV53fX/HpzEL+zvWVHviWPauk/mxUa6
   wP2uii+DNWXXK98JH2zTZctNR67y8ojvxV/Fu71quINRQ6th6rXmW19fz
   RjjkT7p4scgpIudTV3/yESAkEsOvNWndOCuaBybs3BYfnHJCfL+WM5jB/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="14249585"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="14249585"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 04:06:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="859035570"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="859035570"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 04:06:22 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	brent.lu@intel.com
Subject: [PATCH 0/2] ALSA/ASoC/SOF: SSP dev_type support
Date: Mon, 27 Nov 2023 14:06:55 +0200
Message-ID: <20231127120657.19764-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

SOF always passed 0 as dev_type to intel_nhlt_get_endpoint_blob() when looking
up the blob from the NHLT table. This causes issues since alsa-utils commit
3a47ef2487ed ("topology: nhlt: intel: support more device types and directions")

The dev_type is no longer always 0 in the topology embedded NHLT table resulting
lookup failures for analog codecs since they will have dev_type=4.

With SOF the dev_type is not used, we always use the SSP port index for looking
up the configuration blob.

The solution for the issue is to fetch the dev_type for the SSP port and feed it
back to the intel_nhlt_get_endpoint_blob() to be able to find the configuration
regardless of the assigned dev_type.


Regards,
Peter
---
Brent Lu (2):
  ALSA: hda: intel-nhlt: add intel_nhlt_ssp_device_type() function
  ASoC: SOF: ipc4-topology: support NHLT device type

 include/sound/intel-nhlt.h    | 10 ++++++++++
 sound/hda/intel-nhlt.c        | 26 ++++++++++++++++++++++++++
 sound/soc/sof/ipc4-topology.c | 19 ++++++++++++++++---
 3 files changed, 52 insertions(+), 3 deletions(-)

-- 
2.43.0

