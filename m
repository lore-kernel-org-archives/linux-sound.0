Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF3E3F5BF4
	for <linux-sound@vger.kernel.org>; Fri,  5 Jun 2026 10:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780654712; cv=none; b=Tp9j/x5N0knXo8ibH9gI2Ihn+4X3lllncfFP6P0EPjKgSIKSr4cY+efP8MsJAZ6029NwQIL6ncW1yfoFDLxz5P2v1c+v/G6Z7XA53biRC0bvWDePjkodGuipXWV/rYsWRVv4B59cEIsTDr037Tj4KNMdBuh3dcB/LH5HUMyg/ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780654712; c=relaxed/simple;
	bh=/HsYneDkOU5Qk8rQmsI2WVLt28xtTz4NH2+jzYhzzzs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WdYAB4ruemmhvVpgxrE56PCVQP2VnO2vyRlzBGyeKo434E4Rjl49oinGPpyreDgwH5K4S60SmlcQdxT7iekGMG+dIGUhPSXGJ6W9XxPbVgWcMlLEzBvrAFgrxhqiik3Bo7AaRWvmO9ussMouUsMCOV59747gOgRt2L7NzbO6i+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UgA2svi6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UgA2svi6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780654711; x=1812190711;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/HsYneDkOU5Qk8rQmsI2WVLt28xtTz4NH2+jzYhzzzs=;
  b=UgA2svi6c2AVguv1t4MAyoCJ5zEqdQ1CGDLKXBigrYRkG0l40vkvVp4G
   SQRYBjxXJJYW0MIJcQm0Oz1ymPrXzssq5eJj/guoIjXHFaM9gZHSfyiBC
   /PSAw95UG3YP3FLy7y2IthOjpI7gTLWP4fFHOFzCDx4r91kgiw+bJidna
   WmW8BDk5TqxkRYpPsFDSeuydij5rrUe//kkWkJ/isv7i1lsvcFilfeMzM
   ONml4EaRpPmFXUdrcoDmg/gpaOwnHqcoM0U0VguhIzkAis9QaKEd2dfdM
   9p2W6HESEBWGjl6UJzqoxxuSs3CxEmsfliQ/gqi/5NOsyCDDOmioHEyqw
   g==;
X-CSE-ConnectionGUID: r60gfN4IQAaaeQVqu/fdCQ==
X-CSE-MsgGUID: npIbnXCLSaO+hGsfHRhgOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81610297"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81610297"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 03:18:30 -0700
X-CSE-ConnectionGUID: TPzmNjiGTA2yt28jQelYMw==
X-CSE-MsgGUID: BREdv1OyTO6mMKtdHGkkoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="243972163"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 03:18:29 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 0/2] ASoC: Use codec_info_list.is_amp directly in find_acpi_adr_device()
Date: Fri,  5 Jun 2026 18:18:03 +0800
Message-ID: <20260605101805.121428-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series sets is_amp to all amp type codecs in codec_info_list[].
So that we can use the flag directly instead of using a local flag to
check if the codec is an AMP type. The flag will be used to set
different name_prefix for amp and non-amp codecs.

Bard Liao (2):
  ASoC: soc_sdw_utils: add is_amp flag to all amps
  ASoC: SOF: Intel: Use codec_info_list.is_amp directly

 sound/soc/sdw_utils/soc_sdw_utils.c | 10 ++++++++++
 sound/soc/sof/intel/hda.c           | 14 +-------------
 2 files changed, 11 insertions(+), 13 deletions(-)

-- 
2.43.0

