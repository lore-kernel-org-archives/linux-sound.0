Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787E412F590
	for <linux-sound@vger.kernel.org>; Thu,  4 Apr 2024 18:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712256900; cv=none; b=aJV3tLGI/2pqLUoiEuGFhSxD9sPdokfE8EBWe2f4QByV8sM1FSiJKdjeN22HoC1UoOwEwDtmmoeyJbpX5lh50mswDhlv9UtYXQkLrl5QMca90PCrcsDMsmpkl7nUIFToKUIm3XLNqbkS/rjVyXkmV8c6lJKDqsb1XAm7kpZHIRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712256900; c=relaxed/simple;
	bh=fPFoUzRC7yp0tHLHieUekcRDHzzgkJTA10VfyCjPKN0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=miqjub34avF3ihN4W3Bu8frk65HXUrWu8JxH2mC3E/3HNYwZ6D5/p2aDs1uln3h2YFTflUESWgrA5kAjCA9qgKau7DxkiR2gVayLsOGbC3OnV4uHeFa5cM3wr0Ar47oV44Y8nxXN/cRQPw7KYW3y4unXcPqiK91ef2Zxlbkc1w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=blEBTrIS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="blEBTrIS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712256899; x=1743792899;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fPFoUzRC7yp0tHLHieUekcRDHzzgkJTA10VfyCjPKN0=;
  b=blEBTrISwL05O+PpfUiUgnn6ZCjqLOsYWCkLRo9+cfLWoGXByVtEyzFj
   YAYsnnju2aDp6i9aGHQy4xvv8VaQE+2f7Q0tFGU8xRK5vGNHxDK2DuX30
   Iu/IBi9FWZEXttElQPPXYdX5RvbsgXqbXzZ9YPgHuqRr7P4tQNZO/HLXW
   WFF5URcPJXJbVRy3YuZmoQ46JR8uhD0DAG7cvAm6AR9A2m5V4VoyhIoNT
   xOy7fIZRwp892KR9nJJ7/2na4fK7VXb8Esdnu3XX1dj1Uatj3zRvxUXTB
   oSB+s6/STBwlLDPx6qhsVtfsVMJ8O3/vtiK/IHQKnUDkuroD1oK+0hORr
   g==;
X-CSE-ConnectionGUID: 1h5wlbZ/T9uefiTmcNuL2Q==
X-CSE-MsgGUID: OpNUKU6YS1Gw8mMUDIjnlw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7432788"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7432788"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 11:54:58 -0700
X-CSE-ConnectionGUID: n68B0qNzTbeYvffkFS7usQ==
X-CSE-MsgGUID: fnE6eCGqSOmAmYnVy7YiTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="23574615"
Received: from sparrish-mobl1.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.119.106])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 11:54:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/4] ASoC: SOF: Intel: extend hda-loader for BTP/BRA transfers
Date: Thu,  4 Apr 2024 13:54:44 -0500
Message-Id: <20240404185448.136157-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For SoundWire BPT/BRA transfers, we need to reuse the HDaudio DMA
infrastructure. This patchset extends the code used by the code
loader. The BPT/BRA functionality will be provided in a follow-up
contribution.

Pierre-Louis Bossart (4):
  ASoC: SOF: Intel: hda-loader: add flag to tag ICCMAX stream
  ASoC: SOF: Intel: hda-loader: change signature of code loader helpers
  ASoC: SOF: Intel: don't ignore IOC interrupts for non-audio transfers
  ASoC: SOF: Intel: hda-stream: clarify comment

 sound/soc/sof/intel/hda-loader.c | 80 ++++++++++++++++++++++----------
 sound/soc/sof/intel/hda-stream.c | 24 ++++++++--
 sound/soc/sof/intel/hda.h        | 13 ++++--
 3 files changed, 85 insertions(+), 32 deletions(-)

-- 
2.40.1

