Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2FC4A1D
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 08:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322542; cv=none; b=dEFoDhkMufEsvTPsKYxPAagzS4NuvOde0wW4bzEq2nUGaLWAktIHFG0BeL9guHqdMAJ8xfRJr9JZyl5Zz1WkX1sLQiRjOk18tR5bnRRJyvqB/42oPilaFDQhp+vRexwsWJZjLMW16OKtkgRMbykODuXbASBE7PZyWKnadkxbw8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322542; c=relaxed/simple;
	bh=uHfDMLhS5puT9CEnaQT4alWyzKnZng6TvA0pG+9ZaXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hBPhp0rxRefOVP4Ejfydy5gL2jjtp7TZVW3jOWBOANB2f97ZlUGSeHh1rUbsPkXoaptfs5z5FaFJsEJvdRqt+Bz6U4oSLKGV0NIToDLhTai42HnPk+DkRqxLdUq2YLHQCovPkfVn5VvEIVw/VA+IYE18h8Ng9bIeHQ5eqWrsF1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RMDrek/5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RMDrek/5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750322541; x=1781858541;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uHfDMLhS5puT9CEnaQT4alWyzKnZng6TvA0pG+9ZaXk=;
  b=RMDrek/5dwqcTM++6CYPO28XTApU4uLq79k7Fk3HcA23zKgYovgfOo46
   9iKWW85Mh1D8J3NQCbAMKOtF6NhU44lYjOfKmgayplpc5ZoVDNYNAK0cu
   CEXxgxI2JAo5MwRAyPLSRbLxJRJKMRRmQvLrlTQ8xozKwb4IbyBRITafj
   E04FZtWjbNoAz8czTD0AGQi7XAZfiqIXMXYc0ZvdBGqCrAYZ4zbugVP9b
   sH+x06WurOsfJUkta4RnZV/OnWO4svW8hv2Lid4JVC3poWEvjrlBEAbYv
   7+arkWWdAvwnqLzg38RPvxcAC3sY2pdLSO8Ev2kP8Ml6NoSz/8eXCkUR5
   w==;
X-CSE-ConnectionGUID: yyt3Yl8nR4GvU++VgxzCtw==
X-CSE-MsgGUID: c/2Kze3tThORNRHhNdhKGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52491112"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52491112"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:42:20 -0700
X-CSE-ConnectionGUID: IN8UC/UdTA2xevuXJIomOA==
X-CSE-MsgGUID: 4MgGsZ9OQteE/exkc5DOzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="151224942"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.182])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:42:17 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 0/4] ASoC: core/topology/Intel: 
Date: Thu, 19 Jun 2025 11:42:18 +0300
Message-ID: <20250619084222.559-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

There are devices where the iDisp HDA codec for HDMI is disconnected
and it is not present on the HDA bus.
This usually happens on systems with dGPU, but not limited to them.

How SOF tried to deal with this is to drop in a dummy codec in place of
the iDisp to allow the topology to be loaded, but these PCM devices are
unusable, they fail when user tries to use them.
PA/PW is probing the PCM devices on probe and that causes the kernel log
to fill up with errors, which is harmless but disturbing.

This series will use the filter function to prevent the creation of the
HDMI PCM devices in the first place (like HDA legacy stack will not
present HDMI devices if the codec is not visible).
The topology still loads, we still use dummy codec to satisfy it, but
there will be no dummy PCM devices created.

The first two patch handles the same issue that was discovered by the
ignored link: a NULL dereference.
I'm not sure if both is needed, but I felt that fixing it in one place
and leaving the other open might not be future proof.
If I would to pick one, I would likely go with the patch for the
soc-core.

Regards,
Peter
---
Peter Ujfalusi (4):
  ASoC: topology: Do not call snd_soc_remove_pcm_runtime() for ignored
    links
  ASoC: core: Check for rtd == NULL in snd_soc_remove_pcm_runtime()
  ASoC: Intel: skl_hda_dsp_generic: Implement add_dai_link to filter
    HDMI PCMs
  ASoC: Intel: sof_sdw: Implement add_dai_link to filter HDMI PCMs

 sound/soc/intel/boards/skl_hda_dsp_generic.c | 13 +++++++++++++
 sound/soc/intel/boards/sof_sdw.c             | 14 ++++++++++++++
 sound/soc/soc-core.c                         |  3 +++
 sound/soc/soc-topology.c                     |  7 +++++--
 4 files changed, 35 insertions(+), 2 deletions(-)

-- 
2.49.0

