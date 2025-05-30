Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59CF21D3D3
	for <linux-sound@vger.kernel.org>; Fri, 30 May 2025 13:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613382; cv=none; b=ObEgRL9S0/q7yDY3UeiLR5yxxGdhB4tCIW1TdEqe25KnvqDFPzn37YaiBYb9kJsyM/mcJAfGgLyfNsd2/pbMJzJTQs0XnzuNDYZm0zDWsVT3xQoHCJYgLIlbPSDbuWSiYd/DR0f2bNWb8K4L0IPVDulNVG/Z+YxwY5P8qF9FgFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613382; c=relaxed/simple;
	bh=8Fm2AZCfEkD64IgCvP7XvCga+M+tzZIFOQZGnSvyUfs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=XMUvtwhZBGfXkwEMkajIpAcxUB5HZ4rjJMo5ZYeRCUCM32TZG/2FLzLUHdrEHpqINgr0cSsAWZPvjuF1APZ50Hya4oPfZDu5mYgqQg1JKGlnGoVkpUEMllMIOKpGKP1QWnLJ7GBSAsraaDA2bxCh+bEzdkGkWbqKXaWBYqhyBDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U7Foi4Cj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7Foi4Cj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748613381; x=1780149381;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8Fm2AZCfEkD64IgCvP7XvCga+M+tzZIFOQZGnSvyUfs=;
  b=U7Foi4CjHmb27XW4DrgQAD5Tuphavlx9Z44683XmU+TAMI1fxmXpQSGm
   zx94DzFbCOi5e/nSdsX5cRiUHeGBkMAWyKeW1+M474K1D1e09YG/KkP1B
   v87RNv5AX21QAhzZ52irsT4/SYehE/2R6NPmnLrE2EbTRNzwG1fBnnYav
   iFliXiWVG5SskqM4slMuinLdR4b5Sy2kY3bAE2AdtUPonvGy7ceEfN+1g
   wL6QHe6MwJHnkLDoemAsuBTOuqSU4J+H7gxv++Ij9Sz3f1NJTrpYOaGA7
   G9wKRm4jgfTjUB8tjo7B38j9q0Zy/bruGvhPepVUXqsFhWoI8mX8d3mgs
   A==;
X-CSE-ConnectionGUID: x10FixA9T8CXwL8DgwCXig==
X-CSE-MsgGUID: Mm3HIrWdQGOjVZIinK1YEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="61371598"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="61371598"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 06:56:19 -0700
X-CSE-ConnectionGUID: 5E4JNDL7SaWXg3Ni+Yg4jw==
X-CSE-MsgGUID: yLN3Z9vHS5uOqLtuzmJqRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="144522765"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa007.jf.intel.com with ESMTP; 30 May 2025 06:56:17 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: tiwai@suse.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH] ALSA: hda: Ignore unsol events for cards being shut down
Date: Fri, 30 May 2025 16:13:09 +0200
Message-Id: <20250530141309.2943404-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For the classic snd_hda_intel driver, codec->card and bus->card point to
the exact same thing. When snd_card_diconnect() fires, bus->shutdown is
set thanks to azx_dev_disconnect(). card->shutdown is already set when
that happens but both provide basically the same functionality.

For the DSP snd_soc_avs driver where multiple codecs are located on
multiple cards, bus->shutdown 'shortcut' is not sufficient. One codec
card may be unregistered while other codecs are still operational.
Proper check in form of card->shutdown must be used to verify whether
the codec's card is being shut down.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/pci/hda/hda_bind.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_bind.c b/sound/pci/hda/hda_bind.c
index 9521e5e0e6e6..fdc8f65c4199 100644
--- a/sound/pci/hda/hda_bind.c
+++ b/sound/pci/hda/hda_bind.c
@@ -44,7 +44,7 @@ static void hda_codec_unsol_event(struct hdac_device *dev, unsigned int ev)
 	struct hda_codec *codec = container_of(dev, struct hda_codec, core);
 
 	/* ignore unsol events during shutdown */
-	if (codec->bus->shutdown)
+	if (codec->card->shutdown || codec->bus->shutdown)
 		return;
 
 	/* ignore unsol events during system suspend/resume */
-- 
2.25.1

