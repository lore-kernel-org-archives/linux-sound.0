Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A72571B44
	for <linux-sound@vger.kernel.org>; Wed,  3 Apr 2024 09:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712135694; cv=none; b=rhHYzktfzTMUwJsVzxxNJcMoR7K54TYMXTtXrIdkfeTLYRZQbrT7RRd+Xlq9SulPZ4reilXT6OA3oZRs5lFbZ3qfFFnJSg6uXrV4XEqD9VaChejQED+MkGjtnTLN46pFULE+hgAIZCIIRiyHibxql6iiIDeIz/YZtf9FZBlwb+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712135694; c=relaxed/simple;
	bh=SHp+9nsh1AjyCsGFbMDMqy0Yw804wTr4lt2IRMmFxBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=CezgiXlvVWm4Ec6hYasDCdkI9v8oHfJ3y/LuSP/tSIhbo9Jfi4Jca59uY/eqUBk6b5LvogBQVQb3HnfSmWYOOHpGSjUkYJUA6rPWb4dorYDRFQxQcYKmfa4tvreQHFizyvvjQiy44ZWc8BJw5NOjWCTWDj8eKsLpDYJGL/VSIK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cvZdczPe; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cvZdczPe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712135693; x=1743671693;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SHp+9nsh1AjyCsGFbMDMqy0Yw804wTr4lt2IRMmFxBQ=;
  b=cvZdczPeLRdzTGGWTJdL91vyXYkwROOflPeglF0GCBs7elKM9Ex3F6Bz
   xE92CnpkhZ+9xeeFAryN0BUipiHNr+tftr7NMeMr51iUA75p7PD47T5Gr
   pLDwK2CjWr4XNg6sA1eTDrdtwfjkMnP3wiBJ2tm5woNn5FjOyZUnUkA/X
   pNsyHn8JWJb7b3XcAl6t2owORPISfVEFYbANB4dhrk99xBpSdPss+hCax
   j8g1GqgTxCi7wPvlKpCv0PKwEBlpY891dF6NH2Yeb87tpyVP0tL9Rmhz9
   TdYqxMi036BX+Fxu8qEY59NnZbF2cnYCjFhEBAZF8mC8R1ZL7wVolm8fd
   A==;
X-CSE-ConnectionGUID: sCJRTN8pS2iVFFZvvRdUZw==
X-CSE-MsgGUID: bColJfQXRtKyzP8BiCj+Cw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="10322537"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="10322537"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 02:14:52 -0700
X-CSE-ConnectionGUID: 1KAdb+wURLenVbGljQR7mA==
X-CSE-MsgGUID: luELzXxrQlOky9soH02NoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18410497"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 03 Apr 2024 02:14:50 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	cujomalainey@chromium.org,
	lmajczak@google.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/4] ASoC: Drop soc-topology ABI v4 support
Date: Wed,  3 Apr 2024 11:16:25 +0200
Message-Id: <20240403091629.647267-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patchset impacts UAPI.

The only known users of the soc-topology ABI v4 are Chromebook
configurations. Starting from kernel v5.4, all of them are making use of
soc-topology ABI v5. The patchset first removes obsolete code from the
Intel's skylake-driver - the driver of choice for the mentioned
Chromebooks - and then proceeds with removal of relevant soc-topology.c
and uapi bits.

Cezary Rojewski (4):
  ASoC: Intel: Skylake: Remove soc-topology ABI v4 support
  ASoC: topology: Remove ABI v4 support
  ASoC: topology: Cleanup after ABI v4 support removal
  ASoC: topology: Remove obsolete ABI v4 structs

 include/uapi/sound/asoc.h               |  56 ------
 include/uapi/sound/skl-tplg-interface.h |  74 --------
 sound/soc/intel/skylake/skl-topology.c  | 169 -----------------
 sound/soc/soc-topology.c                | 241 ++----------------------
 4 files changed, 18 insertions(+), 522 deletions(-)

-- 
2.25.1

