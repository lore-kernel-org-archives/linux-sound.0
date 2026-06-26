Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BDC33F59B
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 08:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782461386; cv=none; b=Fp1crJ1a9bY7SYuAiHPFWeqL3TvGvTuCX4GPCeUU9C3v0Ip8VjhWBBD+Oouu4yBuqvhi0HG3QK0HD9cA695N89Pw5m2j3COMlC5amWlm/Sp8nMx6GUSskQvcrEF++HqyPV5YbsZk2C9Z/Zbki8ujfJ6uzVNkJGINXT8xgBoZles=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782461386; c=relaxed/simple;
	bh=74oB9dCRg/IuKwvTPv0f5zd2Mnk280z9T3MLJIHjosU=;
	h=From:Content-Type:Mime-Version:Subject:Date:References:To:
	 In-Reply-To:Message-Id; b=kgc7ZBat52a/zQs4HbjSywRThJyc473Dl0yqC6V1+JVyCLZ3mWw3AapNpfWiiIoMYhlw/YxmpvnqvYIWV/iygJTJssaIry3a374QCWqEEKCTs5OwmS42wS05tI7JHLG+gf8k063cWP6kH9xhL/Ytn3l8DVm4wvZqJPwO9nMiSR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etbhwODZ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etbhwODZ"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5ad578c49afso623294e87.3
        for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 01:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782461382; x=1783066182; darn=vger.kernel.org;
        h=message-id:in-reply-to:to:references:date:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74oB9dCRg/IuKwvTPv0f5zd2Mnk280z9T3MLJIHjosU=;
        b=etbhwODZciferbRCuk1Y+nwuk9+l3z9qB2LFulFiaXOhr/OKZdL2Qyv4VUYYeoDgDF
         9yG2LsyOqScil+5VxSD/7IoCgxuTAMX8IsQzkKFbrUfTGKbgoACMLkXMuIJW2Y27lsmC
         Epb/dlz2Op+MDZzCMcVq2wR3FlcURDJQYXhZGXj7eo/EwgpWbXjTTT/FcbDUDQ9VwaVG
         GSaIX88rxOsp90oZcv3tInQHgaj+TH3i+Bfwxw+Z5LwLho7SfeeATT8v4pukefinKjj9
         66L3n/EDe9zimY1KKztD78SlnHZ0HFbBi9m/r6FulQg2qqnDg0oJIxRxhTzbROHd+Onn
         DTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782461382; x=1783066182;
        h=message-id:in-reply-to:to:references:date:subject:mime-version
         :content-transfer-encoding:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=74oB9dCRg/IuKwvTPv0f5zd2Mnk280z9T3MLJIHjosU=;
        b=ZF/CCnPSz7pUZ21CW5crHb6DLvKvB3n860eHp6bpzgcv2rTiwREHUW/BDF8xL8WtHj
         ozQjz3bTZPXZIEeodTLE3R+Bqa0ZGiWlwHe5VvdaRlToPoyKtirrRq3Ob6ZDWXvgOPQE
         beWB1Nso1U74f2l0eZ7fpSoTqkcF9iueVAS+rkCJCFhLJef6hziliWe3dVM4W25NyfCb
         NPrVL4A1/nT6HKH9C9tGikH0zJXNRIdq4kmGu0FgOmLCGvafLGXyW9kkFcW0QWITt4H7
         voQ20yTZ0qHEhED6hzYyCGlOYAh8fl/Hy46tTQAfFnNdBlFAJtpiACpIKkTHbHo2e+/N
         oTxA==
X-Forwarded-Encrypted: i=1; AHgh+RowP+bpUCcoIdVSGhQ5F7iSdWmndWXyRQFTlcrvzNaYJQgCwQvh/eLlyzsqi2rL+WfLJ33UGR1CTy1y1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5MCV8GkuSC2emsehE5a31I0OzR/dZA5bVAP1VlToa7tB3ILN/
	0o8wroH6Tcfz7Q++5iWfQTjC+5Dz5FH8/W5onfo2JnOaSFHdHa4WYLhx
X-Gm-Gg: AfdE7cmcBVzDwUG/VKZjVK7sjcZ+90CJS4J+2s2udXoLtH0qgxQP0wT2/8oKIvWIpCk
	JUA+2bE/439P5edNUic1rurrL3nhYSNdqlZavbLJzoHby49mn0jc30cDmFLD/UY3TUMvHUDkErc
	cnarkC18f8ppaOK0KflFBrGUQd6ASuOAKe4bq6I2Dxc1vkAItiZjuC1saDanUg3rJc+FYAxPrkq
	nMq6kTjTVCVsu1GO/ygOcapHGqE+rgu4uVkbqsTYdjoTcmI7AeUccCbytCgjDZAbPG3RQ0GZ3Ki
	A1VTPQGQHsIWeowe6CetbFLiLDEBOJRgiv1aT9oD4aXufa4F+iFH3hocGkbs6Gcf95SlsESmPxX
	9suxqHdGw1W9ZTHt2/xZM+m8Re0CqCbm4BLsNF4tos20u+N5F8rCVirtGQ4/LWxY5zLJHVdKeZO
	GXm/skSdBMiSjFzB11h1K3csLX42Swns+Tnh7WFQHhjQ==
X-Received: by 2002:a05:6512:3087:b0:5ad:5daa:9c90 with SMTP id 2adb3069b0e04-5aea1f579b6mr2196508e87.52.1782461382239;
        Fri, 26 Jun 2026 01:09:42 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea80d4722sm186240e87.26.2026.06.26.01.09.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jun 2026 01:09:41 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF
 datapath on start/stop
Date: Fri, 26 Jun 2026 12:09:26 +0400
References: <20260626080422.4191435-1-christianshewitt@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260626080422.4191435-1-christianshewitt@gmail.com>
Message-Id: <82AA2E33-70B4-4EEC-882A-EABDB51904FA@gmail.com>
X-Mailer: Apple Mail (2.3864.600.51.1.1)

> On 26 Jun 2026, at 12:04=E2=80=AFpm, Christian Hewitt =
<christianshewitt@gmail.com> wrote:
>=20
> The I2S FIFO soft-resets its fast domain on start (AIU_RST_SOFT bit 0 =
+
> AIU_I2S_SYNC read in aiu_fifo_i2s_trigger), mirroring the downstream
> vendor driver's audio_out_i2s_enable(). The S/PDIF FIFO has no =
equivalent:
> it only toggles the IEC958 DCU, so a stale datapath FIFO can be =
replayed,
> producing the "machine gun noise" buffer underrun - on start when =
switching
> outputs, and on stop when playback ends. The latter is audible on =
devices
> with an always-on S/PDIF-fed DAC (e.g. the ES7144 on the WeTek Play2).
>=20
> The vendor driver resets the IEC958 fast domain (AIU_RST_SOFT bit 2) =
on
> both enable and disable (audio_hw_958_enable), and when reconfiguring
> (audio_hw_958_reset clears AIU_958_DCU_FF_CTRL then resets). Do the =
same:
> reset before enabling the DCU on start, and after disabling it on =
stop.

Fixes: 6ae9ca9ce986bf ("ASoC: meson: aiu: add i2s and spdif support=E2=80=9D=
)

^ I can send a v2 with it done properly if needed?

> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> sound/soc/meson/aiu-fifo-spdif.c | 5 +++++
> 1 file changed, 5 insertions(+)
>=20
> diff --git a/sound/soc/meson/aiu-fifo-spdif.c =
b/sound/soc/meson/aiu-fifo-spdif.c
> index e0e00ec026dc..826055a71421 100644
> --- a/sound/soc/meson/aiu-fifo-spdif.c
> +++ b/sound/soc/meson/aiu-fifo-spdif.c
> @@ -24,6 +24,7 @@
> #define AIU_MEM_IEC958_CONTROL_MODE_16BIT BIT(7)
> #define AIU_MEM_IEC958_CONTROL_MODE_LINEAR BIT(8)
> #define AIU_MEM_IEC958_BUF_CNTL_INIT BIT(0)
> +#define AIU_RST_SOFT_958_FAST BIT(2)
>=20
> #define AIU_FIFO_SPDIF_BLOCK 8
>=20
> @@ -68,12 +69,16 @@ static int fifo_spdif_trigger(struct =
snd_pcm_substream *substream, int cmd,
> case SNDRV_PCM_TRIGGER_START:
> case SNDRV_PCM_TRIGGER_RESUME:
> case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> + snd_soc_component_write(component, AIU_RST_SOFT,
> + AIU_RST_SOFT_958_FAST);
> fifo_spdif_dcu_enable(component, true);
> break;
> case SNDRV_PCM_TRIGGER_SUSPEND:
> case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> case SNDRV_PCM_TRIGGER_STOP:
> fifo_spdif_dcu_enable(component, false);
> + snd_soc_component_write(component, AIU_RST_SOFT,
> + AIU_RST_SOFT_958_FAST);
> break;
> default:
> return -EINVAL;
> --=20
> 2.43.0
