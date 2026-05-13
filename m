Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3163876CD;
	Wed, 13 May 2026 19:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.223.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699481; cv=none; b=IdO0cvh0fvX7IawLoU0Go1PSDEzuq9aZAaUkfirzTROnj6MBgAwnd1Fd44pXGyXbHLWQvFLvy+D9gVOxUwcV0xMCmF8O2ZdUxg8UDkKO0MEPRAap5lcAZHSQvdCElEjvcNBC3TAFGIPBWotKPWXVJ8g35yHPmt3Ou0vLnzPNDiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699481; c=relaxed/simple;
	bh=otezwja3pJ9CpuZuvlI1rTLNWPvPWY7Zqc2puWCaVZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pYbr4TDvR/9IBZoo8oCIJtbXqiZlttjAbE7v+k7gdR4T4rUD3KP29+aYSdR4USjr2H+NU4Pnf3PaSGb/pcQwrCzhl7HdMZ87zcsl0QF8SjVHJbkyq16MRHjIv8Qgj5igdYQ0EqrrKc3gYL37jXIl5jhSddoZvDqx0rJAbaMDtX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de; spf=pass smtp.mailfrom=al2klimov.de; dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b=n4hII/kT; arc=none smtp.client-ip=162.55.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b="n4hII/kT"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=otezwja3pJ9C
	puZuvlI1rTLNWPvPWY7Zqc2puWCaVZI=; h=date:subject:cc:to:from;
	d=al2klimov.de; b=n4hII/kTOUfro1XGOmLLebfw2o38o9EL7GayYQcoa/qCVLqmL65y
	bKoiEEwAB6AqIs2AUILJsEYqKAd6VUesoJrdRTkVRTfM487HPQpkh+OcGAe5am+Chb5rJS
	k4NkKEOIGpCsJsXLlrR9svPL5dnw88lVPD1pS+z3WnHwIJjkAIOcB/86e95vKfQ2upPoB+
	P8DeN+LfwQc/6iAB/3u9eWrpIr32p6EzAE9NI3/jD+dfZVBHTw4bTMmAmSV6eL/zR9u1g1
	yjfvATgY22PjLufUvTG9J6Lv2l7Pg8+lEemLLopn/12B7QwBpJP122lKtLuKDU6DiaLTvP
	SdLBiWbaMg==
Received: from cachy-ak (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id f1896d0c (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Wed, 13 May 2026 19:11:10 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: Nick Li <nick.li@foursemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:FOURSEMI AUDIO AMPLIFIER DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH v3] ASoC: codecs: fs210x: fix possible buffer overflow
Date: Wed, 13 May 2026 21:08:52 +0200
Message-ID: <20260513190852.196723-2-grandmaster@al2klimov.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In fs210x_effect_scene_info(), a string was copied like this:

    strscpy(DST, SRC, strlen(SRC) + 1);

A buffer overflow would happen if strlen(SRC) >= sizeof(DST).
Actually, strscpy() must be used this way:

    strscpy(DST, SRC, sizeof(DST));
    strscpy(DST, SRC); // defaults to sizeof(DST)

Fixes: 756117701779 ("ASoC: codecs: Add FourSemi FS2104/5S audio amplifier driver")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 v2: fixed off-by-one in pseudo code in commit message
 v3: switched my mail client, so that the diff should apply now (fucking Thunderbird fucking trims fucking whitespace from my fucking patches so I had to fucking switch to fucking git-send-email(1))

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

