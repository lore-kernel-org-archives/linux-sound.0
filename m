Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639D21F03D2
	for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 04:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773374787; cv=none; b=sUn/bPwslTvYjsVbfhX3L7smhBnX7dHEISerYNEZKMGqUmBH7hQ/ks0F9NJORfZIoin8BKBEln1820EZ4sgF9h7OC3VdmoZyZLXoP2+hgyqbSa/R0SL2G3xIFRlQ09NWzR1TsUSYPqjFMBBQpuQWBzzu2L9KFZnK8VVL7gspDu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773374787; c=relaxed/simple;
	bh=Ccb7/rrFkWTefSKTgc4VB5t8QmMBzWsjuDWfEug+R5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=He0ONxGgOZGOb7LfMp/iuEUM/sD5c6ysE4MjkuEa8CkQjXCgZd9bo9YmsGfy+eLX5WkWD/tDS56T8tCAHJkJaOk7Up20is+RlGoAjPZUB7zYEBi6KoFYL5JHjyJiptYGhxFRsG23NMzeDPpZWsH/sjBc8qmA+TbKAEYQgy2oqPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hldKoajK; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hldKoajK"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82a15b44c3cso390965b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Mar 2026 21:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773374785; x=1773979585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MZbSvC8sAuSPUZNbLT6g7eFzZMKiQ1pz/Tp17o9W3DA=;
        b=hldKoajKAFz4kdwRadE2N05T34zqqC+fbwO0fZf0UjP1eXPJTSEpyFzFzJ+hOkD1S7
         ucHwOLG6Tt+Cy6Hp+iMRhyhj/tNiTi6kaQFPMh2hUIMd/5T4dA2XR/HikyuUOil2cjUH
         c5FzenoPLOPIjK9gB7hu2UBCDSBJZtu5LaxA6YFPfFcGt2hJCsPc/Zyg9GwArG2+Ygla
         GxrIpkDcXBcOQgRlQl3XMDlTKGjscvUu4OxcUTWnoi2gRdHNOP+5zFRBsryNTb+Q041z
         Q3LEEDKpePFOd/0AcJNDHhi1c2oaQpye71i/PF/FowAQrtUvaoGJbW/p8XVlrO7z0ZX6
         ICjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773374785; x=1773979585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZbSvC8sAuSPUZNbLT6g7eFzZMKiQ1pz/Tp17o9W3DA=;
        b=L76fwpcc0UXZofGMkp/K0hG1azAfKhR5dbhMMt02UFceoklkfJgR0uL2e9nas52TMt
         iuE47aQY4AF87LSxsMYL4JBIAwU/cVFu/GA9ShU8zyQZZ5afdXZAwQ9qkUZN6XfJgLuk
         9UkkJK++UzLlLpgzYmUYAAZjP8KIq/CW9xj1LzJZsFKnBSyxKZ26JQVT4jRykhnmNfq5
         CFOsqraXbCq8zQZvT4xjBp7k+MpIfg5vaMymgLZhsLEg6yuMCRjZXQer/H2WknqWUixn
         v/CznliPsF2CLuGGIE2/gHF3tOrBsoiKtPMaUWbGUupes93l1bln0IcVR4ExTkdkjybi
         WnKw==
X-Forwarded-Encrypted: i=1; AJvYcCVj5M2WzKOKw8KJbVN1s87tF+arRo8AMX+jllrBmIxKYzf2NaOYTAprXKAVKM+BxCr/G2MDljz1EKwpDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbyjWzEb+JoUNwW739yUBxWxMLk5vZm8Vi617A2ax5KlO1RVws
	Yw+B/FO0Rvr03S5otzpDLt1PuvKEJ0nhV9aoLI8oZXhiZoQrjL7v2pTp
X-Gm-Gg: ATEYQzwbFR6GL3/pdP07QPRcA4R7KwB5aovbIJZm7B8vGAsHjmDOtJoArWDwuy2MJTK
	8wcbkO+A/CKuct4jQ8HWUUDpFQaseFm+Y7Umj7EOW2eaw97db+sbyEXQk4DYRdDJ/ASCnUz0pd7
	k07YwQb2ySzyIMHs1sHTNVbyvFEE0mL6BhwT/9wxeHq57K48zSOcLA8EghCsrWbd+gJZVjJLY2k
	xDlrtO8SSKcDIzs+TChtkamcZ+mtjGg08TcMprWmZkWYZsWzk9SpgoG+unDxVVG+Z+SW4hh3hN5
	ruC3fy/9mm7vfXLxzkYEBWCcPcISU9Xt489DKYHyjtS2x3+tVHQKTmQfLOC5oCAF8PoEtsattcD
	OFVI5UWnD6pVrHsqja0G7XJPp2G390wSTeDuRLf1JNapZU2lpIYdvGP2e3YTMOb5RePXAm6qFL3
	yjPw6fe9PqwrkFqDlntCqC
X-Received: by 2002:a05:6a00:7084:b0:824:a7bb:e8fc with SMTP id d2e1a72fcca58-82a1983fc2dmr1224093b3a.24.1773374784697;
        Thu, 12 Mar 2026 21:06:24 -0700 (PDT)
Received: from lgs.. ([223.80.110.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07384b27sm4523373b3a.53.2026.03.12.21.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 21:06:24 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Kiseok Jo <kiseok.jo@irondevice.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chenyuan Yang <chenyuan0y@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] ASoC: sma1307: fix double free of devm_kzalloc() memory
Date: Fri, 13 Mar 2026 12:06:11 +0800
Message-ID: <20260313040611.391479-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A previous change added NULL checks and cleanup for allocation
failures in sma1307_setting_loaded().

However, the cleanup for mode_set entries is wrong. Those entries are
allocated with devm_kzalloc(), so they are device-managed resources and
must not be freed with kfree(). Manually freeing them in the error path
can lead to a double free when devres later releases the same memory.

Drop the manual kfree() loop and let devres handle the cleanup.

Fixes: 0ec6bd16705fe ("ASoC: sma1307: Add NULL check in sma1307_setting_loaded()")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Replace kfree() with devm_kfree() for mode_set[] error cleanup.
  - Clear released mode_set[] pointers after devm_kfree().

 sound/soc/codecs/sma1307.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/sma1307.c b/sound/soc/codecs/sma1307.c
index 4bb59e5c0891..5850bf6e71ca 100644
--- a/sound/soc/codecs/sma1307.c
+++ b/sound/soc/codecs/sma1307.c
@@ -1759,8 +1759,10 @@ static void sma1307_setting_loaded(struct sma1307_priv *sma1307, const char *fil
 				   sma1307->set.mode_size * 2 * sizeof(int),
 				   GFP_KERNEL);
 		if (!sma1307->set.mode_set[i]) {
-			for (int j = 0; j < i; j++)
-				kfree(sma1307->set.mode_set[j]);
+			for (int j = 0; j < i; j++) {
+				devm_kfree(sma1307->dev, sma1307->set.mode_set[j]);
+				sma1307->set.mode_set[j] = NULL;
+			}
 			sma1307->set.status = false;
 			return;
 		}
-- 
2.43.0

