Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670293;
	b=mjZpxwH6uyuwWZ86YmXsUPPDESjLu9KZ7PHWcAF0gOPJBcbxH/ox0qARQB7R2DT2rW0r
	 BTE/5dS+Jp67S4elk/y9ikov6LTN4MIW4uEVldSmax0rVWayx/zPAUN7CrOIlVkz+DTtU
	 b3XW2oSdJlj3j8uEp8s5iKRt333Wx/S7oMLg4mlyQGhm/SwjKFkojJuOUXhxL3BvrtNNG
	 lxlFDPLLDqvSEsZ0uqnKYmwxS2IjtQ7iGe83e+BEhm+BKwZBXnkWP39ZeLkEb6Nmu+HB+
	 4D18pGbrE2XRpWmNREk9QZlqgwvj7TiRa4ESnM+dW9BYLi0bryDCQyOXm1/n8Xh8Bcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YSdNyUgtJmI7PwDkbgXgw82KdpgvmE0VKK9YY9Y1cvI=;
	b=YqIxjpMkC0vkkWd0YrM983RpqdRSkVf10e/+J9/Wmmo45v5oTzIEP1nNudUZpJxGahBx
	 80xcfV6R7qMhHlrPWOeZzyBk2QEpLh005R0TkY3kUYgSaxNC7w/nt1ybMWYXmUWhE3517
	 ut6kIvXi8ZZmUl084ssLn5YD52Bo7+kza1LeuXocrZg7vpqPy3f3DAvrhV+U4WLTz1JXL
	 a13JMgov4zqiIkZofHRl4Sa7ZA/BgP93RCFH30seSiw44YmDuNJjgH2q1yXHQuWM8VGEV
	 q8yiknZt5PATbtwS99zS3LJaqITFCDDLFyFgd4dQBcEAVKxP+Kw20im7wsoCgNWY2tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OyUqbDLW;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB621606A323
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 05:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB621606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OyUqbDLW
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3866a784546so9032555eec.0
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 21:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795670292; x=1796275092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YSdNyUgtJmI7PwDkbgXgw82KdpgvmE0VKK9YY9Y1cvI=;
        b=OyUqbDLWPEHL8Fqc11/23WQbFDoFF+mCpIRdztARiwDJUZ4cc7BrZnSFF/ozJlMkSC
         BC3CdXAuar+pasfjNCFMsF7LeT5zIfOLhlnQ0UxqNFxAFUtgP9e1u9xFwOda7G3xuk1S
         Bsiq3cUCE4lkpZkg7FupQ0kGj/y3PKPe7co2UFcnQkLTdP39uivPDiRRKKdET5RNF7hI
         m9zMn3TkMFFfn7tOz88N0cujR1xqvj+kDezXoUVNKKgi9xX3wpbasuPPr0Md9I6giFMW
         fFBsskCUgk4ca3t34fjIeUKqyCivrH6rpquHLDFPWcKbUoFT62oIt2KC5H7AAmwciFLA
         Idnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670292; x=1796275092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YSdNyUgtJmI7PwDkbgXgw82KdpgvmE0VKK9YY9Y1cvI=;
        b=Sb5q0AuxvYgIHeM9VZwnseGH7+7q4RXWBQm/opHyrnxYO0Qm2JOZ6jwJARPyj27CQW
         yR/QPrJ8DQhHCfhTowc2w2uHZIG+GVKR4TM1LBVxhqFzpyaTju6nKC9C09zj/5xusLP2
         RY15DAs7HtH+a3q2oHtu6Kg3BbxC2QmNAc+aIeJ72B3VnQZC2yTSTiauCHdp/F3irlt4
         nIzbGwe6CU1kfllW3Lv9i/Zh9LL/Pn6dOJSgwUrOcH9ADJ9w175uvWqPUYTqnZ7YTvlW
         DZN73jj6xEdLwLF5AfpGaV4rhSaIrMRwKm7+9OxS1xzKoo/pnLgtl+GyHVAA6zSuERbD
         n+2A==
X-Forwarded-Encrypted: i=1; AL+hErGBu/Hui35NHJxqO7Bm3JNtCt7G0mYjVzq4S8fuqm8OebuJLumHjxuI/1pmbqVxN1Tl5/odVKe3DqAcHQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8RTaEU7s63A4sbdx2BZAFwjvFLdTfnMnJfsi7r3xw9v1l8eks/
	8PCkgK9qHkEiKVhoE3KPr64/MDHODrw9L+wa8+gAYcbka5ZW4d3P+kw=
X-Gm-Gg: AZFdTZfqKwi/UFv7wTj4TtNcASyPQOkkYMa9aJ3TfkRMrWFCHKyIgM/q8GNzkPLuJ0E
	T6pnGDygEy9+lnH3v1fv59yWNSJzeU1+tukjjFZJ0ivmHXW9qPl335b4c1fTeOTQ/jOwRqGf+FP
	0gFE0YfWdpCbaG84/daRnc1jlOn5VebQAWNqmuAo1ccWc3f6JQgx3IIQPH6RZMF9vwZZjxbNUby
	+8vmRLQARVP3D2vduNwIbXNSoV6OQ5Vc2Yy6jzBVm9yBz6Iw540oDhVXTn1eCbC818LSBA+BLSX
	1BZcRXArAUrSRL21sghuKtD1uaKWFP9zjKXARj6jAaN2KCVLqoC3qnJRTSZhx8nNLhaTiIEeWrF
	Bvzs7jLjMaKIpN2SNKGXuqdIVR0FGhZQuqspNmDyJPInXiWm1FyRgFV74NGvRk5IUaubXWb4qgW
	2Qii7GeDTi+YEOCnHxOd/uZ3mD0gbypNG6SrHMZNwKuoVyjUKZcq9tOf4XOfTA6IFCNCQTbA+Wh
	7HKN5tdrsjS7716DaV1Kou3VqxH4lptohEYJ+3wItO2SajfApcDVZzfayghO7cN481L+PsEDEy0
	7Kcfr6TLX2jifZoPAxJne+aIrVJgQLxynhmlmcMa7uWWVF4ENNHST+W3aget1YvDWDgvOygJIM4
	2+F9dQ2TGCRqS
X-Received: by 2002:a05:7301:7004:b0:386:c5b8:960b with SMTP id 5a478bee46e88-386c5b89f9emr6662695eec.17.1795670291931;
        Wed, 25 Nov 2026 21:18:11 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm54973501eec.7.2026.11.25.21.18.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 21:18:11 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: sdw_utils: Drop senary_sdca_jack codec device reference on exit
Date: Thu, 26 Nov 2026 13:18:06 +0800
Message-ID: <rc-b1-20261110-vc-07b-67948988e977@gmail.com>
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

asoc_sdw_senary_sdca_jack_init() takes a reference on the SoundWire
codec device with bus_find_device_by_name() and stores it in
ctx->headset_codec_dev, whatever the jack source quirk is. But
asoc_sdw_senary_sdca_jack_exit() returns early when SOC_SDW_JACK_JDSRC()
is zero, so then the reference is never dropped. One reference on the
codec device leaks each time the card fails to register (including
-EPROBE_DEFER) or the machine driver is removed, when the quirk has no
jack source (DMI quirk entries without one, or the quirk module
parameter).

This helper follows asoc_sdw_rt_sdca_jack_exit() and has the same
problem. senary_sdca_jack_add_codec_device_props() adds no software node
when the jack source is not set, so use the check to skip
device_remove_software_node() only, and always drop the reference and
clear the pointer.

Fixes: 77272ecd96d7 ("ASoC: sdw_utils: add Senary SN624x helpers and codec_info")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, GCC 14.2.0, W=1, COMPILE_TEST=y, SND_SOC_INTEL_SOUNDWIRE_SOF_MACH=y, SND_SOC_SDW_UTILS=y; soc_sdw_senary_sdca_jack_common.o built before and after, no new warnings.
No hardware or runtime test was performed.
The path needs a Senary SN624x jack codec and a quirk with no jack source; it runs on card registration failure (including -EPROBE_DEFER) and on machine driver removal.

 sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c b/sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c
index 1dab6f99877d..6954041b7962 100644
--- a/sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c
+++ b/sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c
@@ -150,10 +150,9 @@ int asoc_sdw_senary_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai
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
