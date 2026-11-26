Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795711317;
	b=fLWPKGYnpcAectFSTvTgVLB/kFrCTMw0w7FcNrd8rbMgQtkMos5zC8OUXRUi2hbPFNqx
	 ze8bI+Eoueux1cbjCpV2+W5Xm/y5Idxdj683VA/W2TIxG6QBqm8gkERgPLnh/ZRnocZUt
	 tG3c5E15SgLVZjnBhQ6eBvTSi5n4FHl31BDUcO2x+ap94y4TaopAx13oukHJZDOo7zXZW
	 UzzFAjh0AvizdD+zdP9Zqz0bOXDqZRl1wE3QayPhXtwOKyu5kdfVSsmN9Eel4ySEx6uAW
	 cxVQP0jMywJoohfDjaHnM01Q9cAGdvNzJCwL80Y+ImwUNADHVXxvdi71WPTXSBBSPQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711317;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GB/YmXtPYHAHuLLZ5ld0C3UDGWd9OcABzGQ9vd++Fq4=;
	b=HusBWLQEyt7nzqhGUNREFYapwerL9bGkb3GWId3kho4cQPT5BPrSzkH+yLUXGyeUWKFm
	 BHXbdd5tFC6SnAF7WES2P/J0mfLaMBPx4JFTNfBkgxingtot/ML7wG0HnlofjqaS0omMJ
	 XkX6HQP6rvuVCfN9zHcLCsPfG0gbAGn0T9tcx3zBVWkjcSDCKww7+L1CW7YxF/Od+1xfv
	 rIkkLbZtS8XdlQYa1DjaEEazNG8GloyRKQF8BDh1yyO946Ju1RBb7qBbI8v/sDEhMY/i7
	 wT4G5Ly3eCq1AKB1gXBhBzl3Bo2G0ftI/UgZK9pYxCPErPIBVFGxAFgKs/zXUEURJkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TLcDpf3j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CC6606A31E;
	Thu, 26 Nov 2026 16:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TLcDpf3j
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795711317;
	b=lwbxooZ+KNJwR449E05HOnKJoc4MsYccGn7hzU1XUm1eu4MZ/2oj/WNqleRgiLXTTIiV
	 odyogrl0JA5D1fyg02YpMKbSsnZOz1qpGhzVpyEoY+ploouOx+C0CkBYMbPXte9T3bhd0
	 1FYWRDqCQB7UcqrZfiENWh7kQC4fHw6WVJrE493BeBFqs3Aay7VlQ4CncT/RahEVpMynJ
	 7iBqqXyryJWe1luhl3P8lgAaqG+6swUy+Sz0tVb5fDmcTm3lrH+T9J2ie1TXeRPMfSNEP
	 F2/k5qYUgsgNSXGklT4miMG2QHG1i6ztc1X97+t8NB+NVDrlCjdZKUNL1gqY8jAwVpQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795711317;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GB/YmXtPYHAHuLLZ5ld0C3UDGWd9OcABzGQ9vd++Fq4=;
	b=IjG1FJr4izMIH2nzVtLtfZsfx6ecsex6nVfWqrIyqytD1EQAggkHrFtH6iG0c5d8rIvu
	 ttXIDdUgW3bKDb63+SM0LWUIc8jrCoyh5l9NR+eXXhrCAwU787RDYvfW8gQebgSRL4EQS
	 tUteR2gX7dzSe73ils8/C3onwKvIkEXBCtFd+GaxfaiLe3DD1DmTfbByT7SolY17rih8O
	 Tzjhc/7cdfeSKtBhfN5YQSFFEiIk0P/4uNqtxQoKzMz4gtpwtJ3JA0GS53ZPPX8IuiIVI
	 /H0Hhx11+293Xt1RFE6i1Y8Y8om4yLYhWX1eOWP1sAVL598YVbK9u0SMNUUpQW/IASg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A03201F000C4;
	Thu, 26 Nov 2026 16:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795711317;
	bh=GB/YmXtPYHAHuLLZ5ld0C3UDGWd9OcABzGQ9vd++Fq4=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=TLcDpf3jxolQzMuWAu6eHotjKW8BisPzHn9H3sRAKsYOumptR5YbpMLPlftncis6q
	 V8SS+cbgMrdlMdpccg1ghfu1xLMgxQfLeW+/5iv/R5V8E/kndY9jw/eQToKM703ceH
	 uDbA0dUdJScejtTsBEa3YX2IGKFYA1/HBUNu0JjuFl4jI9KSUDLekBcll1uIeVrPuK
	 LLN+toFGy+jgsjBxnj7pGD8GTPcT/3CJPD2WJjVpKjJ9RRj6uPbe9yWlBe2vkwUnCH
	 NCpIcTfg8ZKC2hT9LGvokz+/J9vnFwmvjmR6UsA6AwDW1E+rxPCRgmynj52EIhcAvj
	 +eFtPnX2x6kXA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 224074D71B;
	Thu, 26 Nov 2026 16:41:46 +0000 (UTC)
From: Felipe Pesce via B4 Relay <devnull+coding.fpesce.com@kernel.org>
Date: Thu, 26 Nov 2026 13:41:46 -0300
Subject: [PATCH] ALSA: hda/cirrus: Control SPDIF out pin on MacBookPro 11,1
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
Message-Id: <20261126-macbookpro11-1-spdif-v1-1-8316370457f8@fpesce.com>
X-B4-Tracking: v=1; b=H4sIAElhCGsC/x3MTQrCMBBA4auUWTvoRJKCVxEX+Zm0gzQJExGh9
 O5Gl9/ivR06q3CH27SD8lu61DJApwni6svCKGkYzMU4IuNw8zHU+mxaiZCwtyQZ3TXYNFv2ds4
 w0qac5fPf3h/DwXfGoL7E9TerKouU8+b7ixWO4wuOkJ4khgAAAA==
X-Change-ID: 20261126-macbookpro11-1-spdif-63b5d75ea57f
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felipe Pesce <coding@fpesce.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795711305; l=1846;
 i=coding@fpesce.com; s=20261126; h=from:subject:message-id;
 bh=aXC3IyVGZ218SrwScWZYu42Cdp/Cm3nySQ3+C2EcmKw=;
 b=iMepBdKxNB1cmw4S796X9Ifw/WumI8mu62kXExFL4hHOpT38pMgmSjyE23TM0pMDfcNawrTH8
 yshixN97rbkDAvAbKcXtnVrNlQ644MwPqsFdRNuNRO7IJ2M5CK0MNQo
X-Developer-Key: i=coding@fpesce.com; a=ed25519;
 pk=cQ6L0+gycqDMWGyg+5rl+808vU//qlaPY0zjUWM2Two=
X-Endpoint-Received: by B4 Relay for coding@fpesce.com/20261126 with
 auth_id=1655
X-Original-From: Felipe Pesce <coding@fpesce.com>
Reply-To: coding@fpesce.com
Content-Transfer-Encoding: 7bit

From: Felipe Pesce <coding@fpesce.com>

The MacBookPro 11,1 (CS4208, codec SSID 0x106b5d00) has the same
combo headphone / mini-TOSLINK jack as the MacBookPro 11,2, but is
missing from cs4208_mac_fixup_tbl, so it only gets the default GPIO0
fixup. As a result the "IEC958 Playback Switch" does not touch the
SPDIF pin (0x21), whose pin control stays at PIN_OUT, and the red
optical light in the jack turns on whenever the codec is powered up,
even with no optical cable plugged in.

Apply the CS4208_MBP11 fixup to this model as well. Tested with
model=mbp11 on a MacBookPro11,1: turning off the IEC958 switch now
clears the pin control and the light stays off across runtime
suspend/resume, while analog headphone, speaker and mic are
unaffected.

Signed-off-by: Felipe Pesce <coding@fpesce.com>
---
The codec SSID was read from /sys/class/sound/hwC1D0/subsystem_id on a
MacBookPro11,1 (DMI product_name) running Debian 6.12.
---
 sound/hda/codecs/cirrus/cs420x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/cirrus/cs420x.c b/sound/hda/codecs/cirrus/cs420x.c
index 85c2ecf46d3834984d17bc8c67b274ac1938502c..160c4e10714e81fb4de0a25e4835c4387f184c39 100644
--- a/sound/hda/codecs/cirrus/cs420x.c
+++ b/sound/hda/codecs/cirrus/cs420x.c
@@ -576,6 +576,7 @@ static const struct hda_quirk cs4208_fixup_tbl[] = {
 
 /* codec SSID matching */
 static const struct hda_quirk cs4208_mac_fixup_tbl[] = {
+	SND_PCI_QUIRK(0x106b, 0x5d00, "MacBookPro 11,1", CS4208_MBP11),
 	SND_PCI_QUIRK(0x106b, 0x5e00, "MacBookPro 11,2", CS4208_MBP11),
 	SND_PCI_QUIRK(0x106b, 0x6c00, "MacMini 7,1", CS4208_MACMINI),
 	SND_PCI_QUIRK(0x106b, 0x7100, "MacBookAir 6,1", CS4208_MBA6),

---
base-commit: 40212b29a6f718d4e7fb3275cede181cb8e137cf
change-id: 20261126-macbookpro11-1-spdif-63b5d75ea57f

Best regards,
-- 
Felipe Pesce <coding@fpesce.com>


