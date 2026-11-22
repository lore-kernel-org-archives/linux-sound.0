Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340400;
	b=zFLAkcOrkcAwuD5vA55p3C2MIUpimG1BXdimX2EOX2gAY/iOTWUikmVs0ov0HGJCDUGF
	 p07/nnOQtYvYJLCUjCWkdVX5ZvJmLNE5L+X4xtXPZKzPISGv1VxDBf0dmLvRF3h19qhb3
	 CU6YO7RoRiHMlWF27rX8Pv0IKmsm0wrQVXMtjVwulZM0kAOo2aT/0QIeG2PPQC+GKsp3Q
	 Y2UpL6SwI5A0BBa2vXz6ywUpfv/toN2AkdSmIGvTL4hDaopCy4eY03x3ypqyeqS0GnDVO
	 V8TSQME4bTO0HnJs3QXEyJdcKBwG32JPdZl6wbd3JE1aruIEiEtDWkpVqLclVAo6+Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340400;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=BFUSM5kNimWFytT1czL0gkqvlBLC6uyPgfO2b6S2nM8=;
	b=kwSm9frx/4gOif3VtCJQkdqh35dwMUGkFa+Qw6bOHl365pEMHZ1gf+E67LySF9KQXpG2
	 5iZgcTGJhpMQZo4bubhIw3wAjo2KOJQpw5iCcwxGoSfz/ObM+5eAQAshBL/k8COQjWcJE
	 jQZQDnUFcCLn9Y4Xu/7oyIgVCc9vDDsITLy2lRyqcLyrXgvxbN4PnPdzI9clPZVori72S
	 9VUx5v53FRiyGfMwTQ/WI6ioC67QQ/gimnwunMdCjPWCEl+Faon9QbyXqeD30hB6HjVFZ
	 qZNEyyAKpdV3eT6ZMso7jhBAc4ZY527eq4RQBmNknWs0621LZeAZiL/XTRErR8UA43g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jjqsXrLk;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2D6606A320
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 09:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F2D6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jjqsXrLk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795340399; x=1826876399;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JC5xMiHZpwDFEEqXTqsRFvcSWZ8TvfLJ2iRyGHM3SYI=;
  b=jjqsXrLk5Z7CVpNMpva4JxWosyZNe47S3Q3JwAT/PIiKbkbODycsXvza
   wgeBmCmFlwqgLMPdJVyv5QBPAZNrBgcwz/STloI/TO76FXcwE1WTfvs78
   +GxpeeMI9K8f0TTj2Zkh+ZGececvNCfv/nyjXHYVduepND2uX8ItAEc66
   ybcZbH7GzAlR35M+t7/VGZVf064yBnw7iDSnKM4kNEY5aStl+hXB6L1jH
   OuGULwHtXoH9ZR+03PWwK+XQ8sHSPYiRBYSzAZcGHnE20CCKYl2mNdAMo
   eBOoL+K6jnth3tviJ/0Z0h3khLwdhrWu7+6B6OcRy+CA7VVYbwwdKfl/V
   Q==;
X-CSE-ConnectionGUID: /Pp7jO+STae2VzSQQ+jZZg==
X-CSE-MsgGUID: h35QgdavSdGTiwrsFZ6YWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4051523"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4051523"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 01:39:59 -0800
X-CSE-ConnectionGUID: a6vGnoBoQpyOSRp01dA0gQ==
X-CSE-MsgGUID: uhtniWFLT3ifTSE+GbW+uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="12759929"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 01:39:57 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 0/3] ASoC: Intel: add HDMI-In DAI link support to skl_hda_dsp_generic
Date: Sun, 22 Nov 2026 17:39:42 +0800
Message-ID: <20261122093945.2138118-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds HDMI-In capture DAI link support to the
skl_hda_dsp_generic machine driver, and prepares skl_hda_dsp_generic
and sof_sdw for HDMI-In links.

Patch 1 adds HDMI_IN to SOF_LINK_ORDER. The HDMI-In DAI links are then
created when SSP_MASK_HDMI_CAPTURE is set in board_quirk.

Patches 2 and 3 prepare for HDMI-In. So far all HDMI PCMs have been HDMI
playback, so matching "HDMI" in the name was enough to ignore them when
iDisp is absent. HDMI-In links are named SSP%d-HDMI, and their stream_name
may contain "HDMI" as well. The check would therefore also ignore the
HDMI-In capture link. These patches limit it to playback FE links, which
excludes BE and capture-only links. Patch 2 changes skl_hda_dsp_generic
and patch 3 changes sof_sdw.

Bard Liao (3):
  ASoC: Intel: skl_hda_dsp_generic: add HDMI IN DAI link support
  ASoC: Intel: skl_hda_dsp_generic: Limit HDMI ignore to playback FE
  ASoC: Intel: sof_sdw: Limit HDMI ignore to playback FE

 sound/soc/intel/boards/skl_hda_dsp_generic.c | 8 +++++---
 sound/soc/intel/boards/sof_sdw.c             | 3 ++-
 2 files changed, 7 insertions(+), 4 deletions(-)

-- 
2.43.0

