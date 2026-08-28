Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98FF32E728
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 09:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908560; cv=none; b=KljH7psKpxBN20SSIld1B6u5XGpBbS3UvksKTFcAmZLpFSts/eUxyXyWICjsEI6jKyAc+lVvtawijNrSSUAQsbd1t+kCLcWestaFwG9NcNCqke7p7VU239+kmLc6RlySSE0d7VbvGttLRqKzuAMM0ZYWHiULzkST3JBynxyKXCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908560; c=relaxed/simple;
	bh=wQzBOC/Hf/ei5wMX4dQCdaP/CAlEzxlG0QrNSkvCxEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b9CQOzCerMT1h+mYkWb80ssApHQ/WtYrYy4sHdX2oHf9Yf4Z9D7UgHxU9cnWvXlu3YSxwfifxo3d+VN7sW3VOytqUgsOsMM0sy+M8IqI/gWBYCpBDI44rMJINZrkBSJSlYGuj/tJn4lDyy20IlOmBfJ0yqjnpSstn7G4TypJapg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RtcPk5lJ; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtcPk5lJ"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8568e3ecfc3so305122b3a.3
        for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 02:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908557; x=1788513357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oK69mOzh/nTQyD5btplCU6IorcHxRfVNJ/HUqVvgcgs=;
        b=RtcPk5lJuf0lqaFSxYruYpMljc264DGJyk6AQNmzTnri4lW1bdkUS2MP+dfyUsM4hs
         rwGaTWDmSXXrhn2ydLh/gY8t+aWhmGJEiqZnT41LaGIyX2cJ2n3zPtfNRmKRYTDqSxX+
         wP6Gz00BSL/7Ib6++6T9LhTgSnHxJtal6bMo7tWU0Oi3Byn5x+2lYeUpGUm1VoC/rfXI
         cFH14e+xaT4mRgj/ghNyqdgKwpJZT8lF8TxKZkTwhPaSKuhuwLL9Yur0JjL8IZECcihZ
         17LoOBAggUFum+aUIqIcCqaXJlOKT2x0y1m7fm0iRfsxxuGmcGWDLbeAitsoGO9WUTb9
         9egg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908557; x=1788513357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oK69mOzh/nTQyD5btplCU6IorcHxRfVNJ/HUqVvgcgs=;
        b=G3AggKjVkjdU+KcCue4Syx9QyuduhZY3C/OBbkt13bIC8iaXq52AV2iNTwlfrt5k4s
         dGELCAN7S1QH44SRUA3YsTg9aCE07SGung6RqyKCmsdcLkld/87XJ0Feutg3O6rYi4Bo
         BMHUJTHQiF3D3zJXiQr6d+E2XXqkLqZp7jQjwjRyl7jQzO69LQcyRq9AYkP+N3QjUPPF
         hD6el64yP8/ymsSEDSJ9rYMuhLZJJLBcYrGHc2RicNwRfANzqdc0MfWUSuuRiMy4VNaA
         vrqWWZLj0EAnD+KQkOBND4O98JfQYBeYnY7V0P3GmqbKaxAPIzxRnUqzY+K6dxdoW4Jm
         Viyw==
X-Forwarded-Encrypted: i=1; AHgh+Ro3wtfayTNpbDKRDwfezWiZmaVHwNmP2/YPHU9BM7WSRo/o7I4DWgVaBJFABm6pmG3K9BkTrUhD/EabSw==@vger.kernel.org
X-Gm-Message-State: AFuF++l0y8XXiMh4ZsL7R4Y8gXw/Tu1eGd9jxawwwfx1Brb4hU+x0z4t
	+4dDTy+rFbk4315TuHRcMOWh4eZZFHQ36xoRQHlS9lXn7GKIJR5sTjJw
X-Gm-Gg: AR+sD13cLecNiXruZTyr23d7D43bv2tpnbASoDajOQpfr3kMUZ8Q6XROrj8jB4tmcok
	N97FWCwLzRloe7GN+YYYqzN3Fy4ozJWZEQkWsHu5Qphu12p0SwgrFG8VTyLi0bomt5mbqeW0qO/
	GkDhbu55xkMEzMpL5LY4f5I7t2TYEeszR+7lhToqh9AzJwAYs+7SkY0wwm7NWIBw+fs0W8XVuT7
	uvmiYgj+qyr9NMh+3ehFxItnBZJNWjB1GtHu2dih1xpopx67Auwuv31yvgUOcUQiUPqTwvqvYLQ
	RCa7PN3QhhqUmIxcNxgsZWQykbAPQOLL+ERe3VptdmBXclrOQ5N3opbdIAypbhPVc89K/sbxKjb
	WmLbpF3qroJ17cAtiUoM1sO0n3xjf2H/MrL40YV3eOkpe8Ehr7Wm6q+K4axPdoGTjl+xTCJt9Yj
	dlwUZhSnMsJn3e3AZLhE5T/Ax0N+33nQY+jVTawFsPq/FvbxePm/HF2IAdv6rH7sJfr8Bz7HKid
	A71TVPpVrEnrJmDrYcfCuAx8bqMdd76Wo9y6MJvaT3IdkE0W9t51q3BKvzg0Sf2/23LUm6qc8JD
	UagB
X-Received: by 2002:a05:6a00:1da4:b0:847:973b:3cf6 with SMTP id d2e1a72fcca58-85625541a6emr12204502b3a.0.1787908556977;
        Fri, 28 Aug 2026 02:15:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:15:55 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 0/8] ASoC: mediatek: mt8186: Fix clock error handling
Date: Fri, 28 Aug 2026 16:15:24 +0700
Message-ID: <20260828091532.600047-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series fixes several error handling issues in the mt8186 ASoC driver.

The patches mainly address failures during APLL/mux, clock, MCK, GPIO,
and regcache operations. In particular, they make sure that partial
failures are handled correctly and that resources are left in a
consistent state.

The series also removes redundant probe error messages where the errors
are already reported by the called functions.

The changes were found by manual code inspection and compile-tested only.

Link v1 : 
https://lore.kernel.org/all/20260820111253.97866-1-phucduc.bui@gmail.com/

link v2: 
https://lore.kernel.org/all/20260821123021.41390-1-phucduc.bui@gmail.com/

Changes in v2:
 - Update the cover letter.
 - Drop patch 5 from v1.
 - Add Fixes tags.
Changes in v3:
 - Add a patch to fix clock handling in the mux disable path
 - Return directly from apllx_mux_setting() instead of using a goto label
 - Add GPIO rollback handling for partial failures in ADDA DL/UL.
 - Add Handle failures from regcache_sync().
 - Add a patch to remove redundant error messages from the probe path.
 - Update the cover letter.

Best regards,
Phuc


bui duc phuc (8):
  ASoC: mediatek: mt8186: Fix APLL mux setting error handling
  ASoC: mediatek: mt8186: Fix clock handling in mux disable path
  ASoC: mediatek: mt8186: Fix AFE clock error handling
  ASoC: mediatek: mt8186: Fix APLL enable error handling
  ASoC: mediatek: mt8186: Fix MCK error handling
  ASoC: mediatek: mt8186: Fix gpio rollback on adda dl/ul partial
    failure
  ASoC: mediatek: mt8186: Handle regcache sync failure
  ASoC: mediatek: mt8186: Drop redundant probe error messages

 sound/soc/mediatek/mt8186/mt8186-afe-clk.c  | 163 ++++++++++++--------
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c |   6 +-
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c  |  21 ++-
 3 files changed, 116 insertions(+), 74 deletions(-)

-- 
2.43.0

