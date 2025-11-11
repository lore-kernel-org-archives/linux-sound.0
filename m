Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9743AA180
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 12:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762864674; cv=none; b=ZpDfQJviJNaBBkPA12XfVeTzMOwa3vBtYQZpfNfByG9vsZYqmYmWqV9qkEBAKbR/SXX9c11ADa4RWeBUDmnvSTYb6Tp35yl8lFgBIPpR4tn6wiIvmLAsfg5ljNZQV6oHQbAHx+rt41V5ZAc1PbPSPbUH9jRT2ZhwOQlTls74Qqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762864674; c=relaxed/simple;
	bh=DHwefD6nFTaMZKOSwgYWU78mHKUMSwl18lb3rJ6qN3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fjTFLfcHN8C9KPgThwcgicvsh9jM+pJV3cTsfdCEmB59Yga9w/ZQuFFkSiiued3cAll+Q7WiQXJtgrmOfeqKXNwF1j2/F0PmOfJOUXhPon/xn1v3QM9rwKDqjxmvr5Nk9nQM0T2xVMJdFMh+OEn2LIgstekgG92wosTTT8AcIP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O/xeyAmJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O/xeyAmJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762864673; x=1794400673;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DHwefD6nFTaMZKOSwgYWU78mHKUMSwl18lb3rJ6qN3g=;
  b=O/xeyAmJMEvqTyc9LHkbEfyxpPsu4oVB0Pi0TZdauNBa+Vr1oK6z3Mll
   JmI3jq/wQXrH/92aJGcik+xuGot4cZKKCMJepo7e9niZOlVDRthWFwvjM
   dWq0eUq4GyNYwZFxgOmlNFQE8gPmK0eRNjEGskk3dXcJ/JPqr8y7wX8bn
   bvzHBg859nSWT/2EcDbI+I+C6nwajB4A2aVw77/Nly7e3gsSx3itZEDbZ
   mBlU0gFhR8Oe/ZJG2zsHWwFYslrF2GHNXizuyJrdwnxOhm7KZhVdxuNE+
   eLhzaMozxGuVw+0bGzMnDKFygvRdK0IU8pIyef/sbwpsTwcbIc6wmgRk2
   Q==;
X-CSE-ConnectionGUID: V3OAw135SMWttvgopgh5gw==
X-CSE-MsgGUID: kYFhNxIBRFCV/ikZL3IpfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64129469"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="64129469"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 04:37:53 -0800
X-CSE-ConnectionGUID: MJqECTTURPSE+Yg8HPJ1kg==
X-CSE-MsgGUID: f8WFRY3tSS+hQUEinHD2aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="189217529"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 04:37:51 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com
Subject: [PATCH 0/6] ASoC: Intel: machine driver updates for 6.19
Date: Tue, 11 Nov 2025 20:37:31 +0800
Message-ID: <20251111123737.246626-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add supports for new audio configurations on Intel platforms.

Bard Liao (1):
  ASoC: Intel: sof_sdw: create BT dai link if bt_link_mask is set

Mac Chiang (4):
  ASoC: Intel: soc-acpi-intel-ptl-match: Add support for
    rt722_l0_rt1320_l23
  ASoC: Intel: sof_sdw: Add quirk to exclude RT722 speaker
  ASoC: Intel: soc-acpi-ptl-match: add cs42l43_agg_l3_cs35l56_2 support
  ASoC: Intel: sof_sdw: add codec speaker support for the SKU

Peter Ujfalusi (1):
  ASOC: Intel: sof_sdw: add quirk for Avell B.ON (OEM rebranded NUC15)

 sound/soc/intel/boards/sof_sdw.c              | 59 ++++++++++++--
 .../intel/common/soc-acpi-intel-ptl-match.c   | 79 +++++++++++++++++++
 2 files changed, 130 insertions(+), 8 deletions(-)

-- 
2.43.0

