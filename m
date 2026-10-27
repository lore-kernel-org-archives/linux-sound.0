Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793064841;
	b=iFeIzblzKqF5ndYd9451d0bJ5EuFGfUjjWCp/LGnJjlEtgTM5vrp1VOn4eZoNFQ0pVJw
	 7u39fvcqs342IVGZfnyjNe0MXXIRsk02Yp4L2i33pivsJewfKgsA0C8fbp7gLHpgRh/8x
	 uyESb65TWRrQtTxD+/GiO5w7rJsNfBMnTSD/WF26x5oI4oJdQGTgpfWFXKloZ+M0NUJGQ
	 9B8P+JMKlrSfepd5vhdtsovh0t9eKxW3NW2A1LY5o4QlhyJ7evNNfn82cr697DWxi35Nh
	 roKJNS8ckkItnEt3HRk/PllnPv1foPZPSRFYZNe8HBgaS9ldWdmFxOIg7uyZAZalSEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793064841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=NyHt3TXoE90H/OgpR8OuCuu32+Xh9oNMFhxW/sVa1aI=;
	b=uuCIxb1moBDZHqt6/JN+DukCB6/F4HPiGrltRzudm9uOHIVBbRDj/JvRqipEHF0N8cRh
	 4qqbnVQvhXiHDdmDMyLEQiSvgdceQ0bo6toBSD9bbA5GxVBKE+IXQ8/j/TBP8M1892O7d
	 wyHceFzhpyczA39Vp+UMx4Z68sod3HSDO89ZUgqiLRDRDUNqkhB74bfFXC8BfH8z2/1Dn
	 u5sfOBv+idqwMYPZfpL5E/WOKRv1zY4uj1QF5DZN9cDZ7124aOk+RblsBh8Q3ibzRBZQ8
	 3KL8N9nkHE7jEL2YNjlLAwt0MKYDk0CQREonr00ifA9uUFRFxEW+yYjrZGFII6hFIpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eeGmgB4L;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFD2606A32A
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 01:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BFD2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eeGmgB4L
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e20edd106so3099251f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 18:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793064839; x=1793669639; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NyHt3TXoE90H/OgpR8OuCuu32+Xh9oNMFhxW/sVa1aI=;
        b=eeGmgB4L2NeNKK3FaB6ENeHiCW1XmWJRp4zyAXRGxayd9/Edm6qwP36LehDZNkd0VX
         4EwTSAs9/bYYT3113LHqjVS2ZAzyJRa5E4amKyXyCepUkEa6LoWSPnvxoReUNqvXSPF/
         8MgYwlyEXQp+oaCQzqzho8mN9wsvNPrcgue/mbHuhCPRZU2ta5LpP55tzSgMmqIRAa1g
         fCxvMvYe8Q0HqgWa930bOR07V4TWvCtB5Bv8nx8NTmQUlWZQoh5O/3WZ8v4Nxmqql3dH
         zk2An7+f1HRVpMm1ey/ro0fUyyFyuyocAiHOKdeHDvvn9KNoEVcWGyueF2E3qHze3+Yq
         1Xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793064839; x=1793669639;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NyHt3TXoE90H/OgpR8OuCuu32+Xh9oNMFhxW/sVa1aI=;
        b=sBJrvUcf8BxfvoJILl7gGpvBw4v8F/7szUWW9kA469ZBvxB4/86IuYOaOqs3TGGi9C
         i686zYvjU7+ite3G7VGXUmtt326OaCVvlTo+irN+Hls7uIwhV6+96fwHMx39J2LY5dgj
         VX7BaV4kWV1Bg2kixszeQBBFPeGXbX8FH0L8YhExkXlRl+F4ZqH7cWglDJCFVr2Fj23a
         9ZTnXuUJeV+TeeFFWrflQAv7DR7UIbJz4P0lYuwX7zckzC1sWAWxoeSrECAZXCJLMC0o
         bFx/RjmzjobbFf0yOc779MymmRwszMJfeZh5LYoAh0O9AhyBJKQwRyLCLD4PEUgDbc2W
         vbuQ==
X-Gm-Message-State: AFq9FYL6c1Np4KNzUIi+jfFgzubjH0yom1MSBO5QiNyTJyin5D9St2Ss
	ChO9BiJo6f9ooLDsXdGgOenhBklTr3NqusP2wnmehywf7NEqLYpOqRD+
X-Gm-Gg: AYBFou16DhgUqXuGG953NnAgZPDMMLggAEVtfKwkSq0117mLVT/ZYOr6FltPBSeNSeo
	h+fgFXWeMS8EUErxq2iTsLPGdIGe13W+S3005LQdf0iezJtyy1RTwtdM5yF7bCne6bCn4B6sBAf
	56awwKAPIuM68WVDlNUZB0UpSnOgNwZuUZ3bI3TT6R/gOVu+dB1Dti7ZB5tZBJ+lvJVJm/jcW1g
	LHzBPj9w7HlyCQNo04kb32qo6U4wkbbT+0s1B8jDpwfghLZHaUbmc25zm81uq22wLQ9UoLAURhB
	Hlv4fKvVfub3fizdKJZsD9z4YJkUybB8U4PRRauTreNfaDwe7cB618NUGctbgYEnKCDQBpxhH1g
	0PXES2I/oSUyKeQmQ91iFxEGxOcDcr+SQ4o7eYkoz8vQsW2r7jmCQdEr7IvEnArFCpgjoNCrGYz
	ZRA66+XDU5R/njzvbcz09O0Zg21wwsVjVvcOoA6Bgj5a650K2l330ho6C4LLVejznQpRuN8SgQW
	9cJ+trrLL9/z2jHKihDeS2lv7WDTO5rrkn0n3Rx5Mr/dylOMwLYB/F00vwB78Z/dCqmwKG5bJVP
	pE46igPuS1KNgKE5VBjubWDIgGzxjxBC+Rx+wFGl8p6wrRWb5XPGmEWl40H2
X-Received: by 2002:a5d:5d10:0:b0:48d:e62f:db70 with SMTP id ffacd0b85a97d-48e3eb9c239mr15675840f8f.48.1793064839418;
        Mon, 26 Oct 2026 18:33:59 -0700 (PDT)
Received: from [127.0.0.1] (smal-20-b2-v4wan-173097-cust1152.vm20.cable.virginm.net. [77.97.36.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39a8sm20423096f8f.11.2026.10.26.18.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 18:33:58 -0700 (PDT)
From: Filippo Falezza <effeffe99@gmail.com>
Date: Tue, 27 Oct 2026 01:33:56 +0000
Subject: [PATCH] ASoC: qcom: sm8250: Limit RX digital gain to 0 dB
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
Message-Id: <20261027-sm8250-rx-gain-v1-1-386ee6d971db@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB2YBDTiVUoXMY46BdOSUREkd
 29sl2/x/wXKSVihry5IfIjKOxaYuoKw+DgzylgMlmxryDrUtbMNYTpx9hLRURi8aSYKhqFEn8S
 TnL/h4/m37sOLw3ZfIOcvSvucRXIAAAA=
X-Change-ID: 20261027-sm8250-rx-gain-70cba15f0c1e
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Filippo Falezza <effeffe99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793064837; l=3111;
 i=effeffe99@gmail.com; s=20261022; h=from:subject:message-id;
 bh=1LLIvIxKK8oazO3+DYemZYW/4j1UaYx/PuHcc1wucB4=;
 b=Jdj5CJDZr6qT3qrVO0vPcHohB+X1JYMKCoNgczdlB1NftI/RM3iaAbV3iYAShsByLd6snJ+r8
 hGBduKrYqrkD8etX+SH7jSYXdRoRY08CXrckUZLRC3WNHYWybA8mPhV
X-Developer-Key: i=effeffe99@gmail.com; a=ed25519;
 pk=7PPwl4QILojrh+ATB5QOpvXVmmoxaxyLQhrLRLWEL0I=

The RX macro interpolator gains ("RX_RXn Digital Volume") run from
-84 dB to +40 dB. PipeWire and PulseAudio map full volume to the top of
a hardware control's range, so a UCM device that uses one of them as
its volume control plays 40 dB hot at 100% and clips.

Set a platform limit of 84 (0 dB) on the RX0, RX1 and RX2 interpolator
gains when the RX codec DMA link is initialised, the way the sc8280xp
and x1e80100 machine drivers limit their WSA gains. 0 dB is the default
of these controls and the value alsa-ucm-conf's rx-macro init sets, so
existing configurations are unaffected. A control that does not exist
on a board is skipped.

Signed-off-by: Filippo Falezza <effeffe99@gmail.com>
---
Hello there,

this caps the RX macro's digital gains at 0 dB in the sm8250 machine
driver. I need it on a Motorola Moto G 5G Plus (SM7250), which I'm
bringing up on mainline: its UCM profile uses "RX_RX0 Digital Volume"
as the earpiece volume, so that the volume keys change a hardware gain
that also applies to the voice downlink, and without the cap 100% in
PipeWire was +40 dB and clipped badly.

This touches every board that uses this machine driver. As far as I can
see in alsa-ucm-conf, nothing sets these gains above 0 dB (rx-macro's
init.conf sets RX0 and RX1 to 84), so the only change for them is that
the controls no longer offer positive gain. If anyone relies on boosting
the headphone path digitally, a per-board limit would be the
alternative, and I'm happy to rework it that way.

Tested on the phone on top of next-20261021: the earpiece volume follows
the volume keys from silent to a clean 100%, in media playback and in
calls. The patch is on top of broonie/for-next (f3c7bee984aa) and builds
with W=1 for arm64.

I wrote this patch and drafted this note with the help of an AI coding
assistant (Claude Code). The testing above is on the phone.

Thanks,
Filippo
---
 sound/soc/qcom/sm8250.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 5866f1f34b3d..d776a17f1fd3 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -39,6 +39,16 @@ static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
 	case USB_RX:
 		return qcom_snd_usb_offload_jack_setup(rtd, &data->usb_offload_jack,
 						       &data->usb_offload_jack_setup);
+	case RX_CODEC_DMA_RX_0:
+		/*
+		 * The RX macro digital gain goes up to +40 dB. Userspace that
+		 * maps full volume to the top of the range (PipeWire, PulseAudio)
+		 * would clip there, so stop the interpolator gains at 0 dB.
+		 */
+		snd_soc_limit_volume(rtd->card, "RX_RX0 Digital Volume", 84);
+		snd_soc_limit_volume(rtd->card, "RX_RX1 Digital Volume", 84);
+		snd_soc_limit_volume(rtd->card, "RX_RX2 Digital Volume", 84);
+		fallthrough;
 	default:
 		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 	}

---
base-commit: f3c7bee984aa0ba2b48a44e16a6f3ec2c27f851e
change-id: 20261027-sm8250-rx-gain-70cba15f0c1e

Best regards,
--  
Filippo Falezza <effeffe99@gmail.com>

