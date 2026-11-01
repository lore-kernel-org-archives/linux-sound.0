Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793531304;
	b=UfAj0A4fsYFdWbYoAm5mnakgGz1tO/4akOFki8TkLklGjNccPb9+09QOyZk9oBTvxLk8
	 t90M5ix4ogtLA/ZkH6i7bWSqqmmuvecPr51NeKLdoSl6iXh1kl0C427oCeUgq3v7nOcX/
	 m4uLvJ0CFxru6pVmsKcyEFB9w4My2sEOO2ZuFQOuXvA0kDhIq8Rn0ZwnmiTTaMixnNL9B
	 tYrclCHNXV7uOXA79TjtCNBS64tuy4CtvC9XZBJ7hSiEyM1wq5ySHvFbu4rKetV92H8LH
	 tEyYrwSABd3aKiMJ6pTmBIExkc06HYtV+55rpWj9AyXyyAqFR33+Ampi6upYuRWcBLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793531304;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zSkm1F94Hxf3h1WceOTdp0wd9kGqEyvyc2dlIyuruxM=;
	b=LdSaxYAeWPv0c1SaY4cy21+MpgInj3Pm86+bj2JWwgtFzsv0ay/6w6YYCG02pKxt2boS
	 jA5Is9ToArKdaww4huBCnL+9tdMOvDSMjtXJAKJgaAdQKQ3X93ikY6skBu+7LEweKGFFx
	 9IpHWmdZ/sSURRlV0/cqVku+GOic5F/cxkIW30AJ7Ns/3faIcwfJrqZXhFxappt6tMTje
	 nnO0UVIcyF0c5zkYLxso/p1jvgVyldTA1zkXWrXIze1jRupDlByzvdBC5vvFsqOIBcTI7
	 xVWfU2HTIF9bSfMeqV/MrXVW5/NOmHnTPdxcCpVoM/vkf6rCHOnACiojBcu48bS06qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XqVmrKVl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D01606A32C
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 11:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XqVmrKVl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 071691F00A15;
	Sun,  1 Nov 2026 11:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793531304;
	bh=zSkm1F94Hxf3h1WceOTdp0wd9kGqEyvyc2dlIyuruxM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XqVmrKVl6tRYifFVsvf+cUQxQagcYIQ4yWI2cfUqnX6I3YV4DWAjZ5xBcOhNa9xS0
	 jFXZOaXOp9cl8BNF1YEIAjaBwm0W5eD1svd67DpO+J+Jt4X3mvE3U+W1/t9BjLxjGj
	 Ars7XJZ5g99Mq1bCKuSA4EEvK2zxbPjZjDD3BeI766TWNsT4cjnfyoBeTBGOyFpZ1H
	 3vdtYD+0ZfQODJihPAs0nwLS26aJiCA3K7S4EUqrT9QgGWjrqxTBw33RaaTRPuEoCk
	 ht/oyox1GgYYTco9qd9N3Wiy6823J2Xu5MUN8Dkj/EefLbbfdCrOVbbI+RKpWrC0t5
	 0O0EOlmy7zQKg==
Message-ID: <sashiko-outbox-192375@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] ASoC: rt711-sdca: handle HID button read errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Avi Weiss" <thnkslprpt@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261101110056.423353-6-thnkslprpt@gmail.com>
References: <20261101110056.423353-5-thnkslprpt@gmail.com>
 <20261101110056.423353-6-thnkslprpt@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 11:08:23 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ASoC: rt711-sdca: no-op error path in rt711_sdca_jack_detect_han=
dler()
--

commit 54e5617fc05f75e04b8c64c9ddcc952bcf29b404
Author: Avi Weiss <thnkslprpt@gmail.com>

ASoC: rt711-sdca: handle HID button read errors

This commit changes rt711_sdca_button_detect() to return negative error
codes on regmap_read() failures instead of zero, and updates
rt711_sdca_jack_detect_handler() to handle negative btn_type values.

> diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
> index 9781f289f8adc..f6c8377c51ab5 100644
> --- a/sound/soc/codecs/rt711-sdca.c
> +++ b/sound/soc/codecs/rt711-sdca.c

[ ... ]

> @@ -330,6 +333,17 @@ static void rt711_sdca_jack_detect_handler(struct wo=
rk_struct *work)
>  	if (rt711->scp_sdca_stat2 & SDW_SCP_SDCA_INT_SDCA_8)
>  		btn_type =3D rt711_sdca_button_detect(rt711);
> =20
> +	if (btn_type < 0) {
> +		unsigned int mask =3D SND_JACK_HEADSET;
> +
> +		if (rt711->jack_type !=3D SND_JACK_HEADSET)
> +			mask |=3D SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +				SND_JACK_BTN_2 | SND_JACK_BTN_3;
> +
> +		snd_soc_jack_report(rt711->hs_jack, rt711->jack_type, mask);
> +		return;
> +	}

[Severity: Medium]
Does this btn_type < 0 branch actually change the jack or button reporting
behavior when regmap_read() fails in rt711_sdca_button_detect()?

In sound/soc/codecs/rt711-sdca.c, both rt711_sdca_jack_detect_handler() and
rt711_sdca_btn_check_handler() immediately follow every non-zero button pre=
ss
report with a synchronous release report that clears SND_JACK_BTN_0..3:

    snd_soc_jack_report(rt711->hs_jack, rt711->jack_type | btn_type,
            SND_JACK_HEADSET |
            SND_JACK_BTN_0 | SND_JACK_BTN_1 |
            SND_JACK_BTN_2 | SND_JACK_BTN_3);

    if (btn_type) {
        /* button released */
        snd_soc_jack_report(rt711->hs_jack, rt711->jack_type,
            SND_JACK_HEADSET |
            SND_JACK_BTN_0 | SND_JACK_BTN_1 |
            SND_JACK_BTN_2 | SND_JACK_BTN_3);

Because SND_JACK_BTN_0..3 are never left set in rt711->hs_jack->status
across work invocations, and snd_soc_jack_report() -> snd_jack_report()
reports the full jack->status for all keys and switches in jack->type
regardless of mask, calling:

    snd_soc_jack_report(rt711->hs_jack, rt711->jack_type, mask);

produces the exact same hs_jack->status value and input notifications as the
normal btn_type =3D=3D 0 path below (aside from skipping the dev_dbg() mess=
ages).

Additionally, because snd_soc_jack_report() is called here even when
SDW_SCP_SDCA_INT_SDCA_0 is not set in rt711->scp_sdca_stat1, a button-only
interrupt where rt711_sdca_button_detect() fails will still perform a full
jack and button report rather than skipping button reporting.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101110056.4233=
53-5-thnkslprpt@gmail.com?part=3D2
