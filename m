Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA183136E3F
	for <linux-sound@vger.kernel.org>; Wed,  3 Apr 2024 09:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712136690; cv=none; b=pODxT9JYcdBuKD25B2i6O/QnO+o9evBUy5+EwKO4p/TH+c6muC890PKNsJvAg+bE94VLbdA6brd4BI98SmWLVGSqJtGD4DwihzuFUOUmLoRzpkOYmBMlcKU5VKvwDaXdCW8F1WzrSLbUJN6kK8j7WS/z/17TdmJCbqSi0oIWREg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712136690; c=relaxed/simple;
	bh=YMdEHr0zD4bfppwoJREpSdpNbg1nvju3vBIFu7zwGzk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mkNB/R74Ep9zJQQkviU6r+PP/5wn6t8j52i5rSuAEKD3l/Nc0uhFBRWSdVpqlTeuoei6SAEqP60skXShsk6S9IZltV1Xk9top9h2iGntJ4uRK4ojXy4V92IIdauTryFVIvzsfWoMdyHkZT8piX43xF0pfAzWjujqGVBjuHd8lfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iwF2ocpp; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iwF2ocpp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712136689; x=1743672689;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YMdEHr0zD4bfppwoJREpSdpNbg1nvju3vBIFu7zwGzk=;
  b=iwF2ocppwCsJTiEWHvGYFcMqhBNgFBJ89yro+CtxnWI92WKo8ceC48dA
   qnEEXPzZrFhNROk2McaH8o4MxjpP3YKHHCIyXfGJ8+eMmy74UCA24tdYv
   PmcVymmvUe8lZz5GQcro2TQWBoQ4Ne8Y3RFa/8MeJ+a2DxXR47rJ+vQiL
   Xrks8vYD46Q3XlaRdgGnUthbT9Pbxu+c2XHvS3RK1r/7dXk14tYiJ132r
   d3w/uVgU2lRnYxTtn0bVgEEfYQ/IS06LqPZvLXDKql6APHGfkjPueyl0C
   6w3IrTNmK5EXXQnje6dm3yvsIDWbQ2pKp+dsh6vtpZ0BwIWjbqzFQGJuk
   A==;
X-CSE-ConnectionGUID: ERfUVEcsTXua2Jcq3xg4Tg==
X-CSE-MsgGUID: zkZZd70eRJq9bYYSOhSVKQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7218728"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7218728"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 02:31:29 -0700
X-CSE-ConnectionGUID: QwRajnwCQTOeHs5ORRd2Aw==
X-CSE-MsgGUID: Sa7tiJlHQdShmZNT/dNz3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18797569"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa007.jf.intel.com with ESMTP; 03 Apr 2024 02:31:27 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 08/10] ASoC: Intel: avs: rt298: Constify card_headset_pins
Date: Wed,  3 Apr 2024 11:31:43 +0200
Message-Id: <20240403093145.3375857-9-amadeuszx.slawinski@linux.intel.com>
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
 sound/soc/intel/avs/boards/rt298.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index 6e409e29f6974..7fd28544f7869 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -49,7 +49,7 @@ static const struct snd_soc_dapm_route card_base_routes[] = {
 	{"Speaker", NULL, "SPOL"},
 };
 
-static struct snd_soc_jack_pin card_headset_pins[] = {
+static const struct snd_soc_jack_pin card_headset_pins[] = {
 	{
 		.pin = "Headphone Jack",
 		.mask = SND_JACK_HEADPHONE,
-- 
2.34.1

