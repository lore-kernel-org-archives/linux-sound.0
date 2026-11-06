Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943580;
	b=L238RsCqZ0weVIlI7PaHOs1D9FqDnDWOJavyP+AjczdU+21cIbk1HFBaSomoq+ReCT99
	 eQRrSrJM7AspncFCB9fOIvMWJ31SZCiW8hDulwRkzogYO42S5Jowi+3UqqRopkxQuFv3d
	 o2eepw+VIqshFOc0fpBId42BvHtwq+QyP/8HgMl5FRFknoIhKXy1Jbfu/c71U9r+pB10Z
	 EqBxV27JwbfGYVAHJLnCC8BieahVQtE/fJ5DPuKkWGw2ZNn9W09x++1ZI4PPn20/lE5Ck
	 2kKKddnStxNE+e88XTfPyaq4lVThR9pH2+gOoMKt6mNDbrzAXYXOKdOxG7enNznrjIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=auWTB7UYaiNGOrSlerkFN1JgXbcgJ8fBYjKO/2KEZoI=;
	b=UOTGhEP0wdrvCuLk0f4SMtbHQ1BVFbp79Fy9rQ1/FsmYdX72Qepmr8BIp7/+DESwVT58
	 xr3ouJNR/9khT30WYesTWt0eeqg/D/Pghps6xMzEMfGnsPj25nmlos7zZwBYuwKlBKwxP
	 +BgzOmMmfLmIUiF6UbpApeq/CrwPGYcDzaO7ky8k3akHysVfg1IJhMPkZ6fL48JM7H6CK
	 Y2MNizgTJUb8NgP/K6vN0BKtL6KmhXHnf1uAwSactq+JckmdMV6CNI5RKzI4mSWwF7fmx
	 5hptAJbYL1Yhswknp4ActROdIGxJaHwfTvDksDaN/bl3GgVQ5uRnz1rbx6W5lA/3ngw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B3TdQ2gL;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119C0606A326
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 05:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 119C0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B3TdQ2gL
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so478144eec.1
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 21:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793943579; x=1794548379; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=auWTB7UYaiNGOrSlerkFN1JgXbcgJ8fBYjKO/2KEZoI=;
        b=B3TdQ2gL2jHtIo0cI/cj/ubub4s3F3M8j+FQHmsVZ5HYFiR3GBA0tdy+RS25IPtivh
         uuJ8lJaPcEFpzQJ2VdGYIabQH6wSbfMihrkR+I10aKdumRjBNKDsykGTYEcdbUqejEXA
         XMLmV670Y0w1HsC9GjpLVel3jjG6ztsPAgom0XwWNZ1gTBjeAswwf5L0W8AzJe2esbMx
         J7iSLvSD/a23Q7yLm6NFKN+K4TJYWfftBbJn0FBOJvm7w9iKMkURAcQlcxYxgBDwxmIZ
         t5+dNDenB3WwhiWSxsh9PvZIS1tbe8eTuY8wtQds9sE5kZDJpGAKYv5R7Vi7LF3gfdit
         E+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793943579; x=1794548379;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=auWTB7UYaiNGOrSlerkFN1JgXbcgJ8fBYjKO/2KEZoI=;
        b=xPnhhEQ4Iu8CElxcToDTOaXfpNgYN7tgBPlrsZ3BAj0oM/qRoWQBXIkFuvNeqpdNlH
         8h9kaqpSqLzKYCxlhRXFo3b7O4is0yuD8CG0M6KtKJxqHIO/cgSC99P6ACwhbtSt2PuO
         XeX0JK/91T/ezvej9YPfyBrryjQabHwIS3v9ruyPAM80Qgpd3xFMJ+4XVC0v2hwLWQJS
         hDmo4UpSmV3SMYsnQNxq4dYktQ+ALWhFUYmfcLHZhtQN6hFpTrUTTU/rErrrYUVKHV1r
         ygGuyQBlbXc9LBBOX2yJQjRFWqufmvp17Qqb6srpT1vnN8THsBbC+TeVjj81IUv68caw
         zSaw==
X-Forwarded-Encrypted: i=1; AL+hErFGwLU1FQjNVH/YINPwA5N9+1raKBimptRxZ6m1j/ReFWpAwyibhj86tdD3EtzkgvIhDusNECSt3m0sUA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+k9oRxuPYOBfnJh0IDq9UJPAnNnZ/hbI/IG9aP0kWlBzJOndE3
	MCfeRlE09I8t0LX4ghUixRwmPfHLGxD7SiKKSB2OdO6/7R8HyshnwTUn
X-Gm-Gg: AYBFou2jvBGtV6711QWmU2loHRuoAnub7DabW2W6j8Fu1omLZj81rl3yO2XGZ7Z6+VP
	RCFJV0zA6aU6uK/3Z+1Ikon/jllupNvhZm+2qHEsbMCIst1igcYxwusx6eGD6ql8X4hTZG6YU2p
	HYEkUtF6AwGAmbf6UGRpvL9LkkhmDJL9Eakf6ty6LNncxx86GgU0JUtP3J3gSaDiUsvYSuAYUzJ
	nFu3oF/DCBqPLiO19fDvsnNGRdTb54LK8L/x37NohhoEIz23dyM58P1ZOhZ0rCJPCW+GtQbhAF3
	ZqqsI9AUR7IBQ/LKYgETpDX3bKkC8gKz1PSciKULwESqmAMnMbY8ufNPU/n5umC0UrTGJlAB9Ib
	nTcP3qYZ9LYlgzLF/J6QjxmIRbAOr4gvRD/GWECXaXu/Fe/FaRo/9x1Zwe83OkSRvskY3mgpjbl
	xPoxbHimp8TDeslSzkKa6WCNSQtj7yN++9IYAzrJZyfj6ZTHscUYJyw5o9sKXhui402mrqpD5xT
	5BZmUWuIzsXjjZhMjoCUpI0X1SESPDs0g1bf2bGg++L9kG9j1tzGHLVd6tRXFNQ5+IRqHBal+W8
	ipDFnvMEUv/yzeFTKZr+4+zfkB+3PVO+/jzzDg6NN33qG9JLM2QBEO8SRpTFBV0SD2yGUxHRTw2
	CWxiuT3VOrYSbOi/uaQ==
X-Received: by 2002:a05:7300:ea91:b0:36d:2704:6adf with SMTP id 5a478bee46e88-3700d01f2c8mr152037eec.11.1793943578782;
        Thu, 05 Nov 2026 21:39:38 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm6126445eec.3.2026.11.05.21.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:39:38 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/4] ASoC: arizona: switch to generic device properties and
 clean up
Date: Thu, 05 Nov 2026 21:39:31 -0800
Message-Id: <20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABNo7WoC/yXMMQ7CMAxA0atUnhspCYKIXqVisIMBMyRVTKuKq
 HcnpeMb/q+gXIQVhq5C4UVUcmpwfQfxhenJRu7N4K2/OGfPBot8c0KDmqOJeCXCgCeiAC2ZCj9
 k/e/G22Gd6c3xsz9g235l6/MLcAAAAA==
X-Change-ID: 20261105-arizona-asoc-ca9bba7a3bb7
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, Lee Jones <lee@kernel.org>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.17-dev-e56a4

This series converts Arizona ASoC drivers to generic device properties
and cleans up dead code and formatting issues:

- Convert audio platform data parsing from OF-only APIs to generic
  device property helpers and drop CONFIG_OF guards across the codec
  drivers.
- Parse device properties unconditionally in the jack detection and codec
  drivers even when platform data is supplied, preserving existing
  channel settings and boolean flags when properties are absent.
- Drop unused hpdet_acc_id and hpdet_acc_id_line fields from struct
  arizona_pdata along with the unreachable HPDET accessory ID logic in
  the jack detection driver.
- Clean up coding style and argument alignment in arizona-jack.c.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (4):
      ASoC: arizona: convert audio pdata parsing to generic device properties
      ASoC: arizona: always parse device properties regardless of platform data
      ASoC: arizona: drop unused HPDET accessory ID support
      ASoC: arizona: clean up coding style and formatting

 include/linux/mfd/arizona/pdata.h |  21 ++--
 sound/soc/codecs/arizona-jack.c   | 225 +++++---------------------------------
 sound/soc/codecs/arizona.c        | 121 ++++++++++----------
 sound/soc/codecs/arizona.h        |   8 +-
 sound/soc/codecs/cs47l24.c        |   8 +-
 sound/soc/codecs/wm5102.c         |   8 +-
 sound/soc/codecs/wm5110.c         |   8 +-
 sound/soc/codecs/wm8997.c         |   8 +-
 sound/soc/codecs/wm8998.c         |   8 +-
 9 files changed, 99 insertions(+), 316 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261105-arizona-asoc-ca9bba7a3bb7

Thanks.

-- 
Dmitry

