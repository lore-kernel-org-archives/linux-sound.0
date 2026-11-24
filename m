Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795544634;
	b=aZj3H6mF+M4SoTaj6yvEED14hXUfi3L6HDMYiPDhC+2GtgfKZQtDTwqjDmmWF8PNIfol
	 oerZ8DAWkGrP1Wlb947IzmcNysMXLP+WLIlqaI0WFRoptdvXvjP3jcsDBdDf9FEI+9au7
	 OAduSXaUplZpa3H5zrWsQqPyN5CWV+zPngpLoQ8FoZdOFlyYPjZwAaoxuDSGwv5bboHLz
	 p0QaIwHRcGRpRmaxfdwfIqVq+mORxU0VOPAvTOJMLdFnZACi9USvQB4lnNCeUouix0+ma
	 z5ZES7zty57oq+aDUihBGI+N43wrT04pRB7kQ2yGNCX5fy8qoMWudp+NV/Pn5G/qa5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TCk6ZTxAnJNEApSswc5qcCNx/hSfuBl4OHBopATiaqM=;
	b=gWQyl4oNSc7JsIBrMvZQs6ItwWWPaiR+BReP6x9ibY7cfgUjLw+skLDpCCFFxIWleZsP
	 hX2pBRDLipAxhtXwa9ov4nzpFWmSxJoTqBvPVoN2IJEuOpY+S8MNyAmmKTc1fUahVsjE/
	 M/WOCWOnLfudOYjweyqKMWspBGOi16LAle/o1M/Bh3LBfNRKB4x5V/8q287QNYpSn5V0z
	 VbNCIPViFyqNOJSZaBQakaNogas0MeZXdvLpfZTrT2Ptj+OIhh5fLVnbBRklqZW6HXr6M
	 D4Maf/alo68rUu4yqVy19iz8cr+H2EtlZCFHf3QNH44ASmW1iFwIlFXF9CDRJGOOgHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qCZyGIFX;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AA5606A334
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 18:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60AA5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qCZyGIFX
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so4218319f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 10:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795544629; x=1796149429; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TCk6ZTxAnJNEApSswc5qcCNx/hSfuBl4OHBopATiaqM=;
        b=qCZyGIFXy+FwPC8hXAopGfv1ZQBpJ9NyjcaJSfKDT9oYk2t3001R+vwpdyFIK8z1vQ
         rFEifK0sVRQEuMTLvO0OteQrTq9SLSqwExMYmbwPnO7/G8EBwmZNuzdDqyDWSUasa8gz
         OL6GOO28hDbW9aOmBJHurQ0iVZaCmjmHoLqGLDEkInsl49/tWj61XpF6plw0PrDZHFid
         1ewJwjnUeGB/gFLofZAaorz2Sj5JQYUF6fYl5w/AK1JeDfOHEih0lSs93qpNW3GrrCls
         X/L7wccd6McN8hr62oVwS3boSMUyD9M7Om6UgyPvMdUeyWAEkeOnFaLYFpK62XcwizE2
         qKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795544629; x=1796149429;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TCk6ZTxAnJNEApSswc5qcCNx/hSfuBl4OHBopATiaqM=;
        b=fyZnH9LL0ju/yCKq/9uNOg9gqrkDIr1sWJK0SsSp6aQhmrtSnnVleu7pw108VSJRxC
         635nV9B3GeYMP+E57k9/SQHYwBRm1q9aCIoVXQbSmVwTwUB/ajDAzNAMMXtvr5eZ10z2
         vBqbYBpo3OBpK+qCbQVOLaE+c72ILgxhfuiEu69RZO3d2KBuoivOYYJSDNPeAS5ppS0C
         EIllXpabcdL/Aa8g1gBm8lRf99Ojy0mcMxPkuzU9AmZyx90Cklkz79u02ZCe/5BsXVsk
         1XKYwUhk3W8x/IznL5f22c6LIcFiPzjeGQxRADzTQwCbpu0JbBTubT3EptIJWtSDgQT/
         409Q==
X-Forwarded-Encrypted: i=1; AL+hErGHhOpdEvR5IjDuWMNegUhlVi0nY8T0X84GijUPlk/IZMBem21rGyDTUHNpTgr8sDp3o6eOiIeQzrpTtg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8PIHAOddoT2DFMKX8IJsaHC3NN95tFsiropvWBQlo+jdF+HX2a
	fH4GyD0Go/hBNjiLR+dbmpLR0m90r75PGfbN2CR7FwxQZwUO+L8ZXrzR
X-Gm-Gg: AZFdTZfptLzyGHif7PHJ9Hn75lZR+gLTFoar37cjBz2ycWp/DLX1LwtB9YwYPhK69VV
	ybQoG/2vQyBkeBtmijyMlKfCs5mvsC+TFE3bb6pOgLpRhcU9xQkYu2HvI0eQreF5P8m3PsIn5Yb
	56JZYtE+ixFOXZrUIBI8JSgPfuIkiKU00BSvDzfJGHfQoLRDZU4uOcXFg7qPePNeaft01zUirOo
	j6Pn/GGgxVzRnV6/VdLvQEUY2QLekiGuTve2yMN/Puhp5FPTKiaF4wRU4UgyJPYdYjPO0dogDvO
	Z6socMyy/M2HJgddPS+uJQJO/+BiTIp3N7SidUTbEwY6kAVL5Yt051pIP/FJKuuD8zXWyE6ySwL
	5tXnKQ+rgSdLjwQjGR1Y2RPIPPTpBHiU0atyoApJokubIjKS9NIbGM4SWRhX+3ls23g7pvsUk8y
	P7Ne3EgJSg43zZM9VcUwCGQfTDiJ3BzIzPdoend75PvljLX1wnNpwFX//qH9gbJRFK9UK9ku/ik
	KkyU32WI3dAaa5JH/6iGhkAI4qa/6lxZ+hBDpMe4zN/LSZbKQzt2DVy7PlFrX8yuGwae5/VO1Z6
	c8FNjZAKszOK50iy82IRooUpLmDDMaiyt0jWGJ19vDT3G16e7EEkpco1xT8exR9O8xx7VXDTmga
	l0FC1DGYh1YdPk/EqZZxBZg==
X-Received: by 2002:a05:600c:1549:b0:4bb:6a2d:b440 with SMTP id 5b1f17b1804b1-4bb887e0699mr322583625e9.2.1795544628580;
        Tue, 24 Nov 2026 10:23:48 -0800 (PST)
Received: from HP-255R-G10-Notebook (218-135.dsl.iskon.hr. [89.164.218.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm29235049f8f.42.2026.11.24.10.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 10:23:46 -0800 (PST)
From: =?UTF-8?q?Alen=20Ti=C5=A1ljar?= <alen.tisljar@gmail.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Alen=20Ti=C5=A1ljar?= <alen.tisljar@gmail.com>
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for HP 255R G10 (board 8D22)
Date: Tue, 24 Nov 2026 19:23:29 +0100
Message-ID: <20261124182329.20428-1-alen.tisljar@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The HP 255R 15.6 inch G10 Notebook PC (board 8D22, Ryzen 7 7735U)
has an internal DMIC connected to the ACP6x. Without a quirk entry
the acp6x machine driver doesn't register a card and the internal
microphone doesn't work.

Add a DMI entry for the board to enable it.

Signed-off-by: Alen Tišljar <alen.tisljar@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index f636b5ba5..9dcb98160 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -731,6 +731,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "8A22"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8D22"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.53.0

