Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61477F7DA
	for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 15:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708529026; cv=none; b=cZrQUsanVaZwNTKdrS1Lcol0HXY1a1BVnAfLC32Oeu99vDxweWgJMru+x8DyT8iNPP8eLKtDU1LdSlvS0yQ7jK6ZkVh8PcKPipdprgj0UyOcgrDDCYvZQu5aebW981XjpwWEbk8qs7yq+DeRRuptw70pDbNyGReUFAIYoaziH+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708529026; c=relaxed/simple;
	bh=UL33BUB1QvPJei2j1OXIrdPDYAwHFkF6kU98ejZwiio=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=nyBbEBtsvClmQ2vP2FM2aygr5+q/1cqIljoberLFEqQ6XqT544u4F3U19n+thN4e7r9Hgl9ufDSKVZNutHMIyL9FXqrsU3/nuQB1KjLGGFWNqWf9JMCP/DKEmSzCYYR5NxL03+Oq4SAirFEQowVvwpsmW8z6IrlMWjKObxPA4UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDcXGreT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDcXGreT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708529024; x=1740065024;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UL33BUB1QvPJei2j1OXIrdPDYAwHFkF6kU98ejZwiio=;
  b=XDcXGreTkZovIMP9OjRd9ExPXxMwUFlzEKCi7fRECWgZzJ5qwA1PJy2T
   IP4feFaiG/P0TtsEW4FZuxpBv6U/dhiPbLkC/rUIGSg5XryA8CswKlHpl
   /jJKOwPuCMcMNBuRZFvXGzwqpMKOge/6d8xEnVP/nJVN8vZgbR+UIys/3
   8CCPzV3M4xy9iU7E2sLewVkgOqGtPIUUolQOgScXrpq/VHO01ovuXiHex
   nmjcPDBwmTrWPcO3vNTkkZ2cUB6mNgH5bDwDZ0ACgcqLBEuUWhgtjJZl2
   +wDIlJjXvC4+8ToN0CkVz+IjgroF8Wt/COpX8vMUzUOoA24FI/+bl2dqR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="14104770"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="14104770"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 07:23:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5374233"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 21 Feb 2024 07:23:42 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/6] ASoC: codecs: Simplify mclk initialization
Date: Wed, 21 Feb 2024 16:25:10 +0100
Message-Id: <20240221152516.852353-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The patchset may not cover all codecs found in the codecs/ directory -
noticed a possible improvement and grepped for similar pattern across C
files found in the directory. Those addressed here seem pretty
straightforward.

Most of clk_xxx() functions do check if provided clk-pointer is
non-NULL. These do not check if the pointer is an error-pointer.
Providing such to a clk_xxx() results in a panic.

By utilizing _optional() variant of devm_clk_get() the driver code is
both simplified and more robust. There is no need to remember about
IS_ERR(clk) checks each time mclk is accessed.

Cezary Rojewski (6):
  ASoC: codecs: da7213: Simplify mclk initialization
  ASoC: codecs: nau8825: Simplify mclk initialization
  ASoC: codecs: rt5514: Simplify mclk initialization
  ASoC: codecs: rt5616: Simplify mclk initialization
  ASoC: codecs: rt5640: Simplify mclk initialization
  ASoC: codecs: rt5660: Simplify mclk initialization

 sound/soc/codecs/da7213.c  | 12 ++++--------
 sound/soc/codecs/nau8825.c | 12 ++++--------
 sound/soc/codecs/rt5514.c  |  9 +++------
 sound/soc/codecs/rt5616.c  |  9 +++------
 sound/soc/codecs/rt5640.c  |  9 +++------
 sound/soc/codecs/rt5660.c  |  9 +++------
 6 files changed, 20 insertions(+), 40 deletions(-)

-- 
2.25.1

