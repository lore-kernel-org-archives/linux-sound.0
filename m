Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4AB28C2BF;
	Mon, 11 May 2026 20:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.223.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778532072; cv=none; b=tBRgZsShejEByUkSZMTmCzx5kJKcA6f39LfNIHMX5KiMkQ0fDZd9fkGDRJ3eEWzJv/f0AuPaUZAFd9xUBb8uAKppHnnsf8can1zlkC2sj5QP1fFvGRBe2QVwy/FKtmBv2tvJR+LUGHvAWM7cmKLxNBc36UDfaB2JsnbtiRV91A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778532072; c=relaxed/simple;
	bh=m9AKMSMCrcj5te1LD/YGRfdW29wwUXSW9Lh1vVtt+dQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Q1IYgPuadEc+O2mlI3TajcERuZTgRK3U3RZ9l4p7LdXphS8yynUmZtWCBxEOIJAo/cq/Z7KSfWv08SOP3UbOaaxMbseGfvntMcJP9UrJPFi8AQcoK1A+7xHSTjxA1MaKKpfG6HhBqerdIJ7jO3K8NQyJnC/sMoNVZ07cup/Vmb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de; spf=pass smtp.mailfrom=al2klimov.de; dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b=tk1wXKzV; arc=none smtp.client-ip=162.55.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b="tk1wXKzV"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=m9AKMSMCrcj5
	te1LD/YGRfdW29wwUXSW9Lh1vVtt+dQ=; h=subject:from:cc:to:date;
	d=al2klimov.de; b=tk1wXKzVSIsRz7iwGAsjmbMuu9i/btCHXKjYxjBaaa2mXGcVLBc0
	DYdKxdAT330Khr/bBmLq8dBgqznhmUWAGHABFJpyMYJXABkF4xBJqrfnvPFdMUVEHo5Bd7
	UyJkzgRFaoVSYkJ3nGl0jzXLg6/O1ESChFK/X2KyWx1cUW8AaZdfScdz9ErQjz02q4VRtL
	Toe46R49CripSg76o8bLBC8q/YU8jV4wK5v3t0Xa1yTL4qPJq78ZQgV8qOiGvLY7ULU1XL
	Jz9APcHLn2Ka1kuDPr7ZIVGULg5DNAP3QuGbNuoafJSlL1FlOfFBkqzSdFJNfX1RxPglPZ
	fHf5qoJeJA==
Received: from [IPV6:2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5] (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 9c46fa19 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Mon, 11 May 2026 20:40:56 +0000 (UTC)
Message-ID: <01092e5d-7cb9-436b-82da-fe23bb68f530@al2klimov.de>
Date: Mon, 11 May 2026 22:35:30 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Nick Li <nick.li@foursemi.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] ASoC: codecs: fs210x: fix possible buffer overflow
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

In fs210x_effect_scene_info(), a string was copied like this:

     strscpy(DST, SRC, strlen(SRC));

A buffer overflow would happen if strlen(SRC) > sizeof(DST).
Actually, strscpy() must be used this way:

     strscpy(DST, SRC, sizeof(DST));
     strscpy(DST, SRC); // defaults to sizeof(DST)

Fixes: 756117701779 ("ASoC: codecs: Add FourSemi FS2104/5S audio amplifier driver")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
  sound/soc/codecs/fs210x.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/fs210x.c b/sound/soc/codecs/fs210x.c
index e6195b71adad..eda716f817b5 100644
--- a/sound/soc/codecs/fs210x.c
+++ b/sound/soc/codecs/fs210x.c
@@ -968,7 +968,7 @@ static int fs210x_effect_scene_info(struct snd_kcontrol *kcontrol,
  	if (scene->name)
  		name = scene->name;

-	strscpy(uinfo->value.enumerated.name, name, strlen(name) + 1);
+	strscpy(uinfo->value.enumerated.name, name);

  	return 0;
  }
-- 
2.54.0

