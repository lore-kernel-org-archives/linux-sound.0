Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.236.52.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680062;
	b=wzhIQkr8cD9wGt0V73hD5kS/UYn2Pq2cEhdbcSgzSg0lL06ndOcNhYysGHLHMteuHTkm
	 m4M4Y8yM9S8wEgqagMROmtekW6u+D39YdVpqe3NCE7FPWekZYsJpYaVSIEYIhmdD62pPj
	 ctSCzL0cTgmrBhmEp3m6FAbQXq5hMHLKI+dW0UPKfKNnhZQR4fMCmkpESNpPsE9IMGNUD
	 UKbqSUNPp6FUX2xP6UumWHlGiQt/lbKso/YYSSyne+AWNd6+0xQJEB1r/aEfaW8XESvbu
	 3XBDUXrR9YFmKsJGxfRISF6RdEMEn7hDCzCeybl68qcUSXzr0RpnQ9LCAksGOPZfuIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680062;
	h=DMARC-Filter:Received:From:To:Cc:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:Thread-Index:Content-Language:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=YCOqfm8jLdPUobiMOt/FWva32XOdIfsn2eVW9Fy6g68=;
	b=w+EcgEy7x3oyb0eOlNmswH0hjm3d9Hu5qfpovtDnaSwvEXBZFr2TjhY8yU/pih2+YDt4
	 Z0dyyekvyMrRJE+nLN1m39MUoZxYg/15LkpFxWyKpJp7Fa6LT1K2IkkVUGZXs5opnFpSO
	 Zf9X91tqzveATQ2RUPbpr+gDCSiqYME72TfqmfIXRnbd7IFCyEkvS3G5l0NOP7HeA2RRW
	 fhzFXOrZqIkLYL5kjS8e6qj27iPnc9W5w2307b8Gl6nPlGP8c7Ah6fRdrUYGLVxIcrwiv
	 kzRA4qYK/ep8QQzt2kbOvQokkf+uaYqQYNihCC6FUqYb+PbtT8Lw72pInrZ6tfw6K8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=senarytech.com;
	spf=pass smtp.mailfrom=senarytech.com;
	dkim=pass header.d=senarytech.com header.i=@senarytech.com header.a=rsa-sha256 header.s=default header.b=d4TEJH4O;
	arc=none smtp.remote-ip=160.236.52.122
Received: from mail-m16023652122.xmail.ntesmail.com (mail-m16023652122.xmail.ntesmail.com [160.236.52.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852F0606A321;
	Thu, 26 Nov 2026 08:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 852F0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=senarytech.com header.i=@senarytech.com header.a=rsa-sha256 header.s=default header.b=d4TEJH4O
Received: from Wangqianghua (unknown [27.38.157.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561622526;
	Thu, 26 Nov 2026 16:00:47 +0800 (GMT+08:00)
From: <qianghua.wang@senarytech.com>
To: "'Yige Jiang'" <yigejiang86@gmail.com>,
	"'Liam Girdwood'" <lgirdwood@gmail.com>,
	"'Mark Brown'" <broonie@kernel.org>,
	"'Jaroslav Kysela'" <perex@perex.cz>,
	"'Takashi Iwai'" <tiwai@suse.com>,
	"'bo liu'" <bo.liu@senarytech.com>
Cc: "'Bard Liao'" <yung-chuan.liao@linux.intel.com>,
	"'Pierre-Louis Bossart'" <pierre-louis.bossart@linux.dev>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <rc-b1-20261110-vc-07b-67948988e977@gmail.com>
In-Reply-To: <rc-b1-20261110-vc-07b-67948988e977@gmail.com>
Subject: reply: [PATCH 2/2] ASoC: sdw_utils: Drop senary_sdca_jack codec device reference on exit
Date: Thu, 26 Nov 2026 16:00:46 +0800
Message-ID: <000201dd7d7c$3f44e7c0$bdceb740$@senarytech.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Ad19fD2VDdOCUhsmRX+EtT10miN4DQ==
Content-Language: zh-cn
X-HM-Tid: 0aa216df11b309d8kunm110b399495994b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHUlIVkMeHR8fSBlKGksaTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlJTFVIQ1VKTkxVSU9JWVdZFhoPEhUdFFlBWU9LSFVKS0
	lCQ0NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=d4TEJH4OS7CmkhH1hJMaFwZj0WPimopV7wlQpTg1ypmbLEWaY8uv4TC8+5Bre+WzKXLvzmxfGbTLgVlFEo3VtkwF/0ac6nkcevp/zO+rMgv2iPjqY9Kw/QVUt0jaRE5aHFp3uUziXxLDIQdoGPwDHAtDgzMncgArzI/WlqjqSq4=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
	bh=YCOqfm8jLdPUobiMOt/FWva32XOdIfsn2eVW9Fy6g68=;
	h=date:mime-version:subject:message-id:from;

Thanks for the catch.
asoc_sdw_senary_sdca_jack_init() always stores the =
bus_find_device_by_name()
reference in ctx->headset_codec_dev, while
senary_sdca_jack_add_codec_device_props()
adds no software node when SOC_SDW_JACK_JDSRC() is zero. Returning early
from asoc_sdw_senary_sdca_jack_exit() in that case therefore leaks the
reference (and leaves a stale pointer) on card registration failure /
-EPROBE_DEFER /driver removal.
Your change matches the intended cleanup: only call
device_remove_software_node() when a jack-source software node was =
added,
and
always put_device() + clear the pointer. Same for the rt_sdca twin.
Reviewed-by: Qianghua Wang <qianghua.wang@senarytech.com>

Email: qianghua.wang@senarytech.com

-----Original Message-----
From: Yige Jiang <yigejiang86@gmail.com>=20
Sent: 2026=C4=EA11=D4=C226=C8=D5 13:18
To: Liam Girdwood <lgirdwood@gmail.com>; Mark Brown =
<broonie@kernel.org>;
Jaroslav Kysela <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>; bo liu =
<bo.
liu@senarytech.com>; qianghua.wang <qianghua.wang@senarytech.com>
CC: Yige Jiang <yigejiang86@gmail.com>; Bard Liao
<yung-chuan.liao@linux.intel.com>; Pierre-Louis Bossart
<pierre-louis.bossart@linux.dev>; linux-sound@vger.kernel.org;
linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: sdw_utils: Drop senary_sdca_jack codec device
reference on exit

asoc_sdw_senary_sdca_jack_init() takes a reference on the SoundWire =
codec
device with bus_find_device_by_name() and stores it in
ctx->headset_codec_dev, whatever the jack source quirk is. But
asoc_sdw_senary_sdca_jack_exit() returns early when SOC_SDW_JACK_JDSRC() =
is
zero, so then the reference is never dropped. One reference on the codec
device leaks each time the card fails to register (including
-EPROBE_DEFER) or the machine driver is removed, when the quirk has no =
jack
source (DMI quirk entries without one, or the quirk module parameter).

This helper follows asoc_sdw_rt_sdca_jack_exit() and has the same =
problem.
senary_sdca_jack_add_codec_device_props() adds no software node when the
jack source is not set, so use the check to skip
device_remove_software_node() only, and always drop the reference and =
clear
the pointer.

Fixes: 77272ecd96d7 ("ASoC: sdw_utils: add Senary SN624x helpers and
codec_info")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, GCC 14.2.0, W=3D1, COMPILE_TEST=3Dy,
SND_SOC_INTEL_SOUNDWIRE_SOF_MACH=3Dy, SND_SOC_SDW_UTILS=3Dy;
soc_sdw_senary_sdca_jack_common.o built before and after, no new =
warnings.
No hardware or runtime test was performed.
The path needs a Senary SN624x jack codec and a quirk with no jack =
source;
it runs on card registration failure (including -EPROBE_DEFER) and on
machine driver removal.

 sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c
b/sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c
index 1dab6f99877d..6954041b7962 100644
--- a/sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c
+++ b/sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c
@@ -150,10 +150,9 @@ int asoc_sdw_senary_sdca_jack_exit(struct =
snd_soc_card
*card, struct snd_soc_dai
 	if (!ctx->headset_codec_dev)
 		return 0;
=20
-	if (!SOC_SDW_JACK_JDSRC(ctx->mc_quirk))
-		return 0;
+	if (SOC_SDW_JACK_JDSRC(ctx->mc_quirk))
+		device_remove_software_node(ctx->headset_codec_dev);
=20
-	device_remove_software_node(ctx->headset_codec_dev);
 	put_device(ctx->headset_codec_dev);
 	ctx->headset_codec_dev =3D NULL;
=20

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47

