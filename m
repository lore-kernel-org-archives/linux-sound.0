Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7505F137741
	for <linux-sound@vger.kernel.org>; Wed,  3 Apr 2024 09:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712136688; cv=none; b=IAq4PYBZbxQ30vaqpLXtTR4MbqfdIkqGlIRg58HFhI8Zy9FJe9ox4wvcZNNr5JSPG9FU/W3/eCRcK7/66ZadfFiW6SFJY8e9WGHQ835sOGRj5fxwh9SJSQDDTywpCGKu6BnEonHwtr1YMk6k9jkbNwiAhbGSLXLUGwi7LdpGm2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712136688; c=relaxed/simple;
	bh=xtNP8n0UaAOz/HWZrCRaOm/mAbqQPKVM9Ax+qaR6ZrQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cpPR5NB3j7q7bXQmm9LTr90tjo9BR+Zh4rp7mCzST/koyBI0MHsVI53QLjt39ef9fGtPUZadPWj3Ra5K+gaReFtq9LUGl3Zbi/AuUkGwDllkqXYuBlbPCg+rE88bGgjWEvlr2yZG9O+hc3P8BziX6LOV+IseRhKLn7fjnApWmEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DgzhKNsw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DgzhKNsw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712136687; x=1743672687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xtNP8n0UaAOz/HWZrCRaOm/mAbqQPKVM9Ax+qaR6ZrQ=;
  b=DgzhKNswzJUY+wWVM6CcsW8FlXlZN+ztMiRQRZQaCfG/vjbPVQoQgtj1
   DWAqm2NKpF64xIaZ2/Rz1yckqv/bq2y6O3SaIgymNVpVPk0xTQFRi3yOf
   wF/PSEaxjcVpK3xm9YFTvzZAYZSbWt1JwK/StFTtlNN9jUwsSdbCY5lVP
   nok/swkiLzQEn1JvqDGAd2A/KISPITG10UENA8BweoRYjfhLWInsi1dCv
   +MJA3QgBH3c1DeJbRh97PuMMBcU4Qr0ol1IPt1WSzGxpI5eFR9VvLZ+dD
   oJY9udB0uhBwrqJMt49TC+l6FHTYOycVLeysBVIt2LwYoFnz2lZ7z7TJR
   w==;
X-CSE-ConnectionGUID: nAovGfpgQTaXto6tbHfYOg==
X-CSE-MsgGUID: 2MzA6850SryyA0Y45IKtIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7218720"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7218720"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 02:31:27 -0700
X-CSE-ConnectionGUID: iCPtDgh2Re+f2VrhfT+/4g==
X-CSE-MsgGUID: VMTXgFl1TzuCpgh3VU2q4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18797563"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa007.jf.intel.com with ESMTP; 03 Apr 2024 02:31:25 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 07/10] ASoC: Intel: avs: rt286: Constify card_headset_pins
Date: Wed,  3 Apr 2024 11:31:42 +0200
Message-Id: <20240403093145.3375857-8-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
References: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

card_headset_pins is never modified, mark it const.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/rt286.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index 4740bba105703..d24316fc4db9c 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -38,7 +38,7 @@ static const struct snd_soc_dapm_route card_base_routes[] = {
 	{"Speaker", NULL, "SPOL"},
 };
 
-static struct snd_soc_jack_pin card_headset_pins[] = {
+static const struct snd_soc_jack_pin card_headset_pins[] = {
 	{
 		.pin = "Headphone Jack",
 		.mask = SND_JACK_HEADPHONE,
-- 
2.34.1

