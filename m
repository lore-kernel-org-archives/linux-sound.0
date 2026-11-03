Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793727823;
	b=cFfn7VfmtpDZeuLmNPVDsktbQX9KIUDcLv8AkKKvTOvh+rlP1SYCtqNBjLatMwoblotH
	 a4HAooSveTvDwS8Ax+2FfO5hCOyMD3IfoNGw6StZhkOhFde2evPhryqq4to6QNC4qRfdV
	 GjJFzr1PyRrVwrkaO13cxHvpqfVyclP33EZoUCv130OcKyTiz17jRXDHn2G+w86Cav9Y3
	 QfyMwrVRoPl2ekNPpLFW99q0Jn3LAx6Sk5Ha6ht0gWLfE+6pQC0tHUyHXjXH3CeDLV/tt
	 tBbBtcWus2z78/fov7s+xDYVyW5ksyqbAqccexoYmXh1wOeiRZAHrRXcPopNKsX0X+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793727823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=uJ2wtG0TbwKE5OUp6DvJO2lAnPSHDHBXyR6Yjzaf8Mo=;
	b=VvJ/Ath0L+MW7EUis4O1Ijp4o75OtXPDmFdTpAftCrpiP4xvvuVrfYt91XktwdxIeEwS
	 51itiSlywIyoX4XXHdoFRrZlelLUzeY+bimLrETxOr+HfAyQoluDT4KyyiwWXB9CKGBvU
	 j32h4FqdcqIusviuqqcSZJn31WoFHE953NswxcE0iqkk/J7uG4xFm+OdpD8klMc/MW65c
	 W/pZzoSUKnuUYk9a6oB4Bvp8jvJCXHhJsDJUhEs8yKwdD7siQbpbhvSVcVEps06MwNxFG
	 f5NjHOKzVRSgPfwpopOFlDTLkqf7LaNiqXI8U1SZqlfDgBKoto7R5qMnH4ByNj+XHFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fCKohBbd;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10090606A329
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 17:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10090606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fCKohBbd
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1aefd1bf74aso977116c88.1
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 09:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793727822; x=1794332622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uJ2wtG0TbwKE5OUp6DvJO2lAnPSHDHBXyR6Yjzaf8Mo=;
        b=fCKohBbdPAeqP6lLoXy6Pxi78e9W3W/LvK/V52Be04/jq9cSW+qYWS96LmnyXIn6gC
         8yx0KBKM33E5p4YT6rhKG7dQItCfABz8bud3SUfktDKRHsYNjCcusaNfBAFF7uToIj0u
         F/WCTqzRvW2GJ7AY7Bqqd1LxO2478diRGy9pBy7WqcbfOxXJ9snTjZSXqweSQMAq0slM
         P9H87Woc7+JDTT48LVnSKWCFNbX36l0u3IqSM8/25Y/P4oCIn4rLZAFVTO3Eb95y6nXk
         YNTUiM9y6XUd4EmdFzDZZ59uBkdFlV0nB1XDlvWEDSkV7+6p6Azu0pEOlPCnPIO3x4dL
         X6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793727822; x=1794332622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJ2wtG0TbwKE5OUp6DvJO2lAnPSHDHBXyR6Yjzaf8Mo=;
        b=TdH50s7ZhamYKEVj1HAoTTFa/tFuMdtcd9n99Z+PvTUQks+NEEpXsR5rk7f+OVjPFh
         TFrARUrnlHNodauJpa0CHhJav71Xe7ZtLYBTwOwKiz5WyNzrHojKeHJZweQ1WTAO3D6j
         fOyOWVTYsUsUAUPfpjDJXsPTSby1h+W80EIW5yUe3l9VYFfPEo8cpotYzRzoD69E4D6y
         au1ah+hPN2DPD+O7YgW4td0+9jNpELN8s5TzPIGEs9hyI6Dxb79wQU/Ifh0p3f8+tdUu
         RGJs/NFtGKmrBJM9t+Gu2UcCActkyuMZ63b3LhxTz/sdIbXyeR7pnErozgjejmTYT8FI
         MYIg==
X-Gm-Message-State: APuU4Z+zd9VXzV8pX7lteTnoRU+H8AB11b7qNgH9E3Q/p+r0mGxzM7WY
	1HlKAxt6fjEbIvo4rmPxve7w4ws+L1sAm4rijT9IMRoRa5UlwuaamaDav7wV4FWxLQ==
X-Gm-Gg: AYBFou0AJN5nWD/UTpWimaiLLh2M5qFr9kykJD0z1FKA1lb/I5kkHzFHvPRXe3UbDaQ
	SOiZtZhdhldypQIQ2uK1fddNA249kZLV8zoZAP5y6Vn6smj9hGDixtIiuUmGQJcYJyVkTRe5L6N
	33JKgeebj332+s4zPvOMDKvujw1aI/x0UqagTORURqzgiintpa+zF4PWHP5GQsrMSoLO/kx9vvD
	72W7eZm1NTQj1A0XAewJqFeunE8mPlMsYp90puCs1snW+MaUZvVJUX+NQUHYi6tYqzxu4WbOE40
	IWNZ3HIKNZgVXKbSGUvwykyoe2FCbG3lOxtKFGiNpkh4ltreWBpPDHbwlvXjY6WQVDGAcWq2XDK
	DexDACSWHImhxx76jGLtCEvf1T44ANzZ1gYwtniDEPvqiwEb/Tt15plUYO2JcnK5nb1Nigd0d3R
	8aQdSy5S1bWTSQbHPMXq8mGxlSb92wMxt/JGVTJyh4ri4zXAeqBCAlN8Pr6ZSajw/z0k041Hre8
	WmqWaRcRru8XKMpoejMQia9ppvLQrkpcSGas18vtB+vpPz4nuBoYdWH+WRC181WwrOD5JDNnRYp
	jsseJHSalJfP3nDUg52WedR1SCKrWEL77PbLGa9pmuGnOccDp/0HXsTOPwENFA3iD+4v
X-Received: by 2002:a05:701b:230f:b0:1ab:9742:e860 with SMTP id a92af1059eb24-1ab9742e8e8mr19731281c88.20.1793727821880;
        Tue, 03 Nov 2026 09:43:41 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a995:4c32:db66:d000])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1bcedsm420380c88.7.2026.11.03.09.43.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 09:43:40 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] ASoC: fsl: pcm030: release the platform node reference
Date: Wed,  4 Nov 2026 01:43:33 +0800
Message-ID: <rc-review-20261103-07-1337c123a4ea@gmail.com>
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

pcm030_fabric_probe() gets a platform node reference and shares it
between two DAI links. Neither probe failures nor card removal
release this reference. The links borrow the node; assigning the
pointer twice does not acquire another reference.

Register a managed put action after acquiring the node. This covers
later probe failures and releases the reference after the card and
codec are unregistered on unbind. If registering the action fails,
the reset variant releases the reference immediately.

Fixes: 084011615c1c ("ASoC: fsl: pcm030-audio-fabric use snd_soc_register_card")
Assisted-by: LLM
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261102 (2637bdec0535).
Compile-tested: powerpc, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
CONFIG_SND_MPC52xx_SOC_PCM030=m.
Baseline and patched target objects built from this exact base.
No full kernel/module-link, hardware or runtime test was performed.
AI assistance: Codex (LLM) for ownership analysis, code and changelog.

 sound/soc/fsl/pcm030-audio-fabric.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/fsl/pcm030-audio-fabric.c b/sound/soc/fsl/pcm030-audio-fabric.c
index a7a5dba83a2f..64d9f7e34611 100644
--- a/sound/soc/fsl/pcm030-audio-fabric.c
+++ b/sound/soc/fsl/pcm030-audio-fabric.c
@@ -50,6 +50,11 @@ static struct snd_soc_card pcm030_card = {
 	.num_links = ARRAY_SIZE(pcm030_fabric_dai),
 };
 
+static void pcm030_put_platform_node(void *data)
+{
+	of_node_put(data);
+}
+
 static int pcm030_fabric_probe(struct platform_device *op)
 {
 	struct device_node *np = op->dev.of_node;
@@ -78,6 +83,11 @@ static int pcm030_fabric_probe(struct platform_device *op)
 		return -ENODEV;
 	}
 
+	ret = devm_add_action_or_reset(&op->dev, pcm030_put_platform_node,
+				       platform_np);
+	if (ret)
+		return ret;
+
 	for_each_card_prelinks(card, i, dai_link)
 		dai_link->platforms->of_node = platform_np;
 

base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
