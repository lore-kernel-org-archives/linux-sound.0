Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F18A17A314
	for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 12:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315338; cv=none; b=CXQOF+SSib0lB9AQKzFF33LwHVix7vckz+JqMvFlw54GB3DjZfBSiTboGyqOR+5zrX6kS5wrZbUt5lOuumQp07O1XGPJ2XNRiQRNdmKx8QpT5XHWEjGPxc6LlCgAM5js6ziaIlbs2AaL4UhU6+03xGo0ZOtN3OqDEkYl+RKDFJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315338; c=relaxed/simple;
	bh=xdyQIZt0TR+UbML3arBEugmfHKhGrb/C+dsm6nPGKfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UXBG1ux0FFIKPsKzh2B3+JNs7hF2ne/OTuXG/N2pybA2o8cd54c4udCnCrVE2YQ0qElhGrwooYXy2asZEEQ3QchH3k7r+rCbFhTl66ALu+yC02i8odHie5QayoVK0m/YpF9tlBTkbfsAdABD6kpJA5XpqWAYqgtLx+weBT5XRBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Li2XUecc; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Li2XUecc"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d530328efbso8476675ad.0
        for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 05:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315334; x=1787920134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xJG5qITotgQ4r/8yEzCbVy01AHxnXQ29q5xOCfnqmk4=;
        b=Li2XUecc3BXPNHONT6YoOIueJU2ihk0UoCMfzrN3MtoojzHKDv5EEvScekilSGY89/
         uRf+zoE7hFPqll4TCr07JH8jY572PHaRFEVyf1kdD3Y2kORqd2mhuEL3/YEoe1vP8Fcg
         0JEJLGxsiW/93WKOARHImShP44o0CiiFQ9tZBFygtRnSXvN0HmzgYhmKXj7TPmAf0k0l
         nXWU0hSfEdLVOvebRadODGLb0yYbN9SUq+Qikp7J73ynSz3Qid0mIkJ8ox9Ff6vZbY4k
         V5IsmF4XKjq/2r5gYRZc8KAROhBWI0wh7maiCnxks8CHZyPWte4cbAz15ppkvLVpzYRH
         pb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315334; x=1787920134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xJG5qITotgQ4r/8yEzCbVy01AHxnXQ29q5xOCfnqmk4=;
        b=qwSAtW7PS9wGFuVY9OuJEw84oTpGePNrzA7BX3V4Vs7U84uJ4NT3lDYTwQzCNCSHJ/
         SS0tIVYDqHrnbqOxj5rB9zrhdKDVFHbXKAw/Q9z3RQi8tH7fT+9ljjj5BWhbUu3/GMlr
         6w09ibb1ZkO4V0hWmgSlW91YHDL2vJ4fEo92sJU1feae13WE9BWIY2/5T0g+sDqLXvmE
         wTKJXIyP1PM1xVsKiKNFUHiL70ZeqvNgb4CWRVuIsa12ZW/iQKY6Xqal9lLpJi3bJjjJ
         wGzhOt3zHrcvSH2do7Ju9enocbhiWs3hRQEMEZwqJJk6xKxoPxH57MDwdhvy1vJhQQPC
         r1rg==
X-Forwarded-Encrypted: i=1; AHgh+RoTDGjgbjUUKnVGaAmklgROD6hFnMngK3T0LVgIRXznglZj0vLu7JkysP3nLNuIeGPRcINcpYPL+ogSKA==@vger.kernel.org
X-Gm-Message-State: AFuF++mEaYdnyRWzG0PIEB9DFtYJW9zVe0tDvzQLqOKHmrNq356Rq+PV
	SH6AxnO7V6g49BBwpGMFPPDvabncv5fOvIZfz5tgdc999kQ1pwn2r1HQ
X-Gm-Gg: AR+sD11bntgW8XT3yAnfEhC6K1aQm7MfMT6LBouLNfrcjHjn+ud4UuY5yhj6ljLeqqR
	3iY1W7OiEenH/u21WVVcVvlJO6xNVlMXJWYWC+kHhbtgtNVV+kTPwj60+tSkTit/xsmLwEDaryN
	SIlxUBfaJOfphUn72Uj/q6s51yRitUUH9oxWxlVya8yrtw6cqHnAuSi6zAaRKID4zmEtBCmPERQ
	eZIZa/Izet5U30F59jr/1dyRYzOFr1wC1ncVPW1gica4We27p/eIJJqWueWyTtGsbRqNErQCIeO
	2RRSG33N3I4Bs1A+VC+x6jQpWE4p5vH/X8UTElHzULKWzzzj9OuGSJRC5AEP3JzgupTVd1aEuwi
	G+/xuIWdeXVjL7HhPyK7TKNypAcwkKYWevHB2I7nj0U/YzNzxgtiwrvm8Y154Vw7wTR0ryYidpO
	9TAHOuC1F9kxRHGARdoywW16qh2Tu4aTABxTbSQDYJD7c5BFvK+ggyeEWef8RkubZgSWheUO2CQ
	jj2EH2uWqv2UAlCr93u+u+GYVaHl4OD4/PeniUWK4NOJjMe1qhNTVhkUACr4DRrgaogoUJW4iyn
	/7iM
X-Received: by 2002:a17:903:b07:b0:2cf:afe8:b722 with SMTP id d9443c01a7336-2d64afe960dmr114112305ad.11.1787315333606;
        Fri, 21 Aug 2026 05:28:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d554450sm18134515ad.2.2026.08.21.05.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:28:53 -0700 (PDT)
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
Subject: [PATCH v3 0/3] ASoC: mediatek: mt6797: Fix error handling
Date: Fri, 21 Aug 2026 19:28:37 +0700
Message-ID: <20260821122840.41266-1-phucduc.bui@gmail.com>
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

This series fixes and cleans up error handling in the MT6797 ASoC driver.

Compile tested only.

Changes in v2:
 - Update the subject prefix from ASoC: mt6797: to ASoC: mediatek: mt6797:.

Changes in v3:
 - Add a cover letter.
 - Add Fixes tags.
 - Add Reviewed-by tags.

 
Thanks,
Phuc

bui duc phuc (3):
  ASoC: mediatek: mt6797: fix wrong unwind order and error code in
    enable_clock
  ASoC: mediatek: mt6797: Use dev_err_probe() for error handling
  ASoC: mediatek: mt6797: Drop redundant probe error messages

 sound/soc/mediatek/mt6797/mt6797-afe-clk.c | 23 +++++++++-------------
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c |  8 ++------
 2 files changed, 11 insertions(+), 20 deletions(-)

-- 
2.43.0

