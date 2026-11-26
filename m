Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670305;
	b=NlLUCStzyBGb+faUSI8MbuPfMey6AiFuVvKtn30T4qiBZeMH2mPP98FC8XBKcfazggh0
	 R5c4PUkeRziu9upb2uxa18rTev9vOOKw5RzCp/emYhNLieRAG3BW1vBGwQWlSk+kInzGm
	 oCOfqb7e8hes+XLUjA/iyQIvVFewluflOPXLeiVlzfMbBqJhrYWFJ+51DoHPauqBttgyx
	 oUuIlSS17HunMIXo27rCnFQPHL3q47++/EBP8PrpoJxirtx+9QvwBz4y2tqmu8qWMsax+
	 FQwVBK+byVk17jmEa5JLZGawYBseMDAt5/Hh4uizlW63KCc57wI2N5iWn27N5avI1yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Zsv+xoIslAlTljqBg12NU+Wygtm3YAvMHqbGgsgpyzQ=;
	b=TTypnoWicvjqJdXVHXlxoH7fDHdd0yRvCJ+XccrsJiCQmhy58gIP7Nr7jV0gB6ibn0/3
	 14qCm0VaIo5/mUq7tA52kQ2mt51OZg6Laga2lHKUm7IbnhbkBX+5huPyiU/VNR0ppogIM
	 Aa4+v2YPmwsgDc9HO0iRo0/tD1oxl/t9aD5olrbg2dMxM8YiezKBT3FUPWnCNhhcPwKAK
	 Sh9smSFaatrwVChID0qYeMT2I4o6m8MO+LQXV+HrFk08XOi3yCQ2v3mU9FDRtSGdTiu09
	 cTwrI0KwSOH39RDcc26fE+LyXiuZqonoRqPBaOlIVDIPbQ3pKToLF56j7QS9wng4RxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eavWJLn7;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A38F606A323
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 05:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A38F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eavWJLn7
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso14056516eec.0
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 21:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795670303; x=1796275103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zsv+xoIslAlTljqBg12NU+Wygtm3YAvMHqbGgsgpyzQ=;
        b=eavWJLn729s79Wc2z8ut8r+vSxgpeCNFtIrwFIuqebEMAo51j3fYefHUoPdYa2JDNV
         MR16m50EiyKX4yv3e+JnyJP2mpwZGvJ2BjbxUVuKqtHqI3VTRsOYLmUiGTUsRNpjPzxU
         KE4k/DSy0TyPtnz2v09XGAR9L15fqWjqlTX1PGTZTxq1qeRyryUYyblyneusgODYCko0
         kgTQm8zZoa5dE1HBnZZ6xUEFja6VKZkLiUeB4VKnTHd6B6pVnxZxOjun0dJ4eXX/Z8Mq
         tX3rGup2pjBITvKem26XnDDowqL4klwsGxd2vc+bIufB+dzX++rS9sElJBAMs3ySVwwL
         GraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670303; x=1796275103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zsv+xoIslAlTljqBg12NU+Wygtm3YAvMHqbGgsgpyzQ=;
        b=UqQ8bVtl8BpLGOx5jVQegrZs6adWqZOKgWZxqhg/oiO5JBNh7Zs7WdEGOBCZCkds6N
         XWx2eqTY+Jn40InPV0js3glUioC8qeTG/8tNEVfpHcsMzxWblcJwX6sP1PXEyXNNmkbN
         ZoZ8iHfge6ktDb0yXrcKmgBUCIGp9+ZeUl4aexoBTWgPgJMS6cFmV+Dy7mD+Ud2dzwng
         GzakJcWTwHiSlbMuwb2jKgR2nX5lhVfBGa/0W6yBK9CgveNuz2S4afIHWM2Oge8fPU97
         4b8H7nWYeXptb5O8GzkW26jiPvkd4DWB9+CrBo2gTG8dYdv60nOlR8ZjyYs0HAbkeC5s
         kGxA==
X-Forwarded-Encrypted: i=1; AL+hErH5/fB/XvDt3SUMrTyzokLEa49c75Y7+tcjLqTOmZBlvL5m8+2vQglA3dCU7tY82m/XMj1pggZ1Bg3YiQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8TEoGNrUq/KbEgbjFwy7eC02NYoqlvJt5XkIW/BJLE1Xuphyb7
	p6IElQz5/lt1VOeAShdHnH0EcPvKHrwF5pw6kXEjebALpXGt+YSUS2s=
X-Gm-Gg: AZFdTZccqr2fYd7Cugyz67Blh7GXWllICLa6eRsIQtkYKhWz/JSiS1nGU06g0mTn0Kx
	DMtlllfC4TAtNW+codFv3AOoGbb9WoyqNUjhllso1dANRC7LQuRKiFk0FTO1CtOQmAgXyUKihXv
	Ma+bebhl/a4tOgGW78UDVMQ6Te41vinci6KlyTnrwl++WHFCn7BHHW+OAH4wnTuPi9zek6ksp+T
	YDHOS4PZRIK23R24VWXLNuwjC8Dbq78u4uWZE7X4dLx5Vnrt3GKm4WJyDRl9c0nsPG/x9tPTKTE
	1E2OBLsKjg6+fWYvzI69Thit95+YVzaUPq9Aq/K+hOlPLQfcjC078oMcECj3tnQlUMlnWhJ3lwO
	YGuZbQnNc62rojPoMH1tWVUo9Y0Pwlho4Sf43wUj8kjmw6IhW2HVN1hTL9owJ+8lYu3VfgWoMTD
	CHA+WaDQeBhaw07ZmZY8Sq0U1esMdfwfbCDYpQXVL0zPLvQXI6/ro1aVxnIvLNcC/oPOzcr+106
	HU0u/lrx2YJgiTlBKOKIBaBKLkFvn9hZTMvQhE8IcWYtGRff508BlySJiK5UseyU6bdTbqmNzox
	t1lSJV2ZHfVQ/AqZW60oDU7A/RRMidpKE5DPwghrwAcAv3rg4hQc3evvihija9ls91U=
X-Received: by 2002:a05:7300:8811:b0:386:d86d:d445 with SMTP id 5a478bee46e88-386d86dd49amr3135963eec.36.1795670303265;
        Wed, 25 Nov 2026 21:18:23 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm17282954eec.17.2026.11.25.21.18.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 21:18:22 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	bo liu <bo.liu@senarytech.com>,
	"qianghua.wang" <qianghua.wang@senarytech.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] ASoC: sdw_utils: Drop rt_sdca_jack codec device reference on exit
Date: Thu, 26 Nov 2026 13:18:17 +0800
Message-ID: <rc-b1-20261110-vc-07a-7c635620fec1@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

asoc_sdw_rt_sdca_jack_init() takes a reference on the SoundWire codec
device with bus_find_device_by_name() and stores it in
ctx->headset_codec_dev, whatever the jack source quirk is. But
asoc_sdw_rt_sdca_jack_exit() returns early when SOC_SDW_JACK_JDSRC() is
zero, so then the reference is never dropped. One reference on the
codec device leaks each time the card fails to register (including
-EPROBE_DEFER) or the machine driver is removed, when the quirk has no
jack source (DMI quirk entries without one, or the quirk module
parameter).

The jack source check in the exit path is only needed because
rt_sdca_jack_add_codec_device_props() adds no software node when the
jack source is not set. Use it to skip device_remove_software_node()
only, and always drop the reference and clear the pointer, as
asoc_sdw_rt711_exit() does.

Fixes: 526a1876fc48 ("ASoC: Intel: sof_sdw_rt_sdca_jack_common: test SOF_JACK_JDSRC in _exit")
Cc: stable@vger.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, GCC 14.2.0, W=1, COMPILE_TEST=y, SND_SOC_INTEL_SOUNDWIRE_SOF_MACH=y, SND_SOC_SDW_UTILS=y; soc_sdw_rt_sdca_jack_common.o built before and after, no new warnings.
No hardware or runtime test was performed.
The path needs an rt_sdca jack codec and a quirk with no jack source; it runs on card registration failure (including -EPROBE_DEFER) and on machine driver removal.

 sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c b/sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c
index b4e427d55130..7902d423c8b9 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c
@@ -188,10 +188,9 @@ int asoc_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_lin
 	if (!ctx->headset_codec_dev)
 		return 0;
 
-	if (!SOC_SDW_JACK_JDSRC(ctx->mc_quirk))
-		return 0;
+	if (SOC_SDW_JACK_JDSRC(ctx->mc_quirk))
+		device_remove_software_node(ctx->headset_codec_dev);
 
-	device_remove_software_node(ctx->headset_codec_dev);
 	put_device(ctx->headset_codec_dev);
 	ctx->headset_codec_dev = NULL;
 

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
