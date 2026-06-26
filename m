Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693381F1534
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 20:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782506497; cv=pass; b=JpSpJu2yo8hhizbMKfgZ4QFLuwgXapT1GIXiWH5tnyx+kp+EG87qIqxfpsxGaoW85gkc+T75dMJjv2tAawfYqWC2YwAm5LJhQ1Kwl+kWMGwZpBknAXPG6/I5snL8kCbciIhSIkBrUKCh7CBJgdpRR3uV3c+TGz53zq4jmmy1/B4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782506497; c=relaxed/simple;
	bh=6pKD2AxqIgfdSbNVQiDqwuze3DQT/NLN/W82Ajeivf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kbitqU4bJIlRo+WlMXLEIzeTnPRbui2x9RYoxqhyopTQsr0CXnjAnHWiiv8FcxG5JbCfo4U2nuq9IZflwgqlY61np12uxpvcGl0YIjAQUh7mk8iTaAL1lDwbHnjarChU+wB4sOkVuEuBYxuDSIr4zlYwu06c0UyTXoAn6Cr6om0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=LuFYJQlq; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="LuFYJQlq"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c74383c93cso14417095ad.1
        for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 13:41:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782506496; cv=none;
        d=google.com; s=arc-20260327;
        b=rlVy6PAH/JjK2MpdYj6+tHAGO16HTezG//zRL5LHDiRV0WM0AEIIz+6umQzwEASgV7
         Cab5vLWI1D/RwOMhX67alaeWt66/dN8DkTts/arPvOp+wXcy1miU2Bh61k1aQZb3+XHY
         m33boWYvFUNDTJVWcHH4Pw02UEOLTqqAQHbIJrXcppXlAaksjlfUEvXWGdx/dwM7Ddbd
         pJhkpY87yU8YfA7RKH46h30tVOZMXZ5sorZPWR7BW22kJ7yrrCdi9HfjpyprsGrseScp
         4DgWjUnZz6vez1hTgv8ZHyAQCdLmfFoaJXZT6HrW8Hx4CAiw5PNrxAfHIoLs+nqwnUGt
         rhHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WIWP18m3HG8WOaoy4MbWUmKe5JZZFk+engmnmas88Q0=;
        fh=KqSan5lK0JhQNolMKnrgdXEuuLF8Y/E7x+aNMIT8wM8=;
        b=lRU6ZuF5jbFf4tRchwV7O4pMNo/zqLjy8LQfZK7VhSeIannUkNxnECDhMRcVe5cx2/
         hAPt8UEZAxGvQ6c0P+JEKbAts0Q8FSLQNq+M3N8zg4R1uOaLD+ubgw9K74gctXvDgx7y
         nbhZf7frLVz8wAhH5TAQGTf9tfX/zi6nH068ZIDV3ts54LSV+xvy4/VMW0e6ScVBwR9v
         wfYeATOQWWxIB5xYb7Gdp75/Go/KQTF89dicXYWejBmHRM/hTP5+ac9lPfwWVP+mMeHM
         tWLJiemdbAFxStcn9Jlc96DJQpOlTWqs4TmnzKutSQJ5jQFCySD3LGKE7Mu3C7sr5beb
         my3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1782506496; x=1783111296; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIWP18m3HG8WOaoy4MbWUmKe5JZZFk+engmnmas88Q0=;
        b=LuFYJQlqzX6mcq6SZDda1mXNo4Fp6G2RMPXIbnO7O04hOhWVazjzCccmuw3zqFmcpx
         bUwCBPK7sdAEPasH+S7frwkWMkhtO/nPn4xBNre9zJqiv/gp+qoiZiRRorWk9ybOwiJ5
         JCREahv53dTjZQjX5fd4cJjjrqn8hFvjxeFPW8YPSX2Eb5fAClOZzNKTCh3GnIeUlTZy
         mixgdW4twuXp7C/ZSkP31P3Z0bSpFvV71hMHoxipVHhuap8qfmgt7ANg2taQt9jxkzBq
         1amms6ZO5MaNO0VcZ0snu6VPDAgk6Ahtq7FvH5te3UZl7WMK3MMpkXHeLWPiSHReW09k
         RLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782506496; x=1783111296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WIWP18m3HG8WOaoy4MbWUmKe5JZZFk+engmnmas88Q0=;
        b=EwY05N/J7Nx1m5BvBkJwfkAY5XmwBRybTZ4UiZM/Ghzv6caQS2gT/imLp0ukCExjjl
         ldXzTzvYjhy+dP8S2/mS/ggx7qJ7PT47WVSQxZUpojn5FrkL0/SKHC5kB+JJzDE3QRD0
         5+a/huMsLgKM1gWGDXXZoUIPnAYgLf4sb7Vdn2LCYlNznknqI1N5G9zK5dm99Ps5u7iE
         nBlDrq3ZTptJ2bPEoSENBYjaIQ+1Xk4XzvfAS43NX0X+5HcJgiq4BGqwk2vtTHuML/Ok
         7StI+nw+BIC9C05VdPS7FHfL5+ql3TNjJUTqJmh1MB7X8fLEFquJQ6MNdZiIwlS0+pCb
         /Nrw==
X-Forwarded-Encrypted: i=1; AHgh+Rriin5DpmsS5kUd9ih6Zb5yi5R113CvmKNjjCBK1eeMWqQsYOUOBiTRNycwrM2a+r5Uw9V0+pVWbE/guw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+p0l7Rdir2jbMBUbf/sOVDUIrIEXObZHCgxNp+ZcROrTuQ3op
	aXPjc/PSSY1NbTR8rFsNpjmvRZjE224G+xX7TFuIPYZxbL35J2N9aWWi0UtamS0CjHBqMf0KEpV
	Arjy0N8BSra+kSar/M4GbltufGd07nw8=
X-Gm-Gg: AfdE7cnMJSTV+pkFBmYA5lzL8VtPMjwoaG30rTK3jHbr0aufdhadaXq1PygRXqHEq8g
	+GEjgb0DG7nghHIoh+qAdb1KHUrcpwn4CxBXsBi0Z7Dcp8SusKERYplsE9asH8h4wvCBme1Df+t
	QOzQn15JLGdK+iKSWjlM9rPkMN0m6rGaQr2ZMWeplXTOMBivvv35vUX5Qx7j7oKoV4hEBrHOHfe
	IKxN+f6QxzJ5Yorezt8V4Pb9EN54AvAUfh0qgL+3lcW5FQzNBWP78TejxaLGBBS5aQbCWgY36hJ
	m2EisBIf6iZCemEfKc8Xq6/RtBj6Iw==
X-Received: by 2002:a17:902:e847:b0:2c6:a404:ee91 with SMTP id
 d9443c01a7336-2c7fc6f344dmr79970005ad.21.1782506495557; Fri, 26 Jun 2026
 13:41:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626080422.4191435-1-christianshewitt@gmail.com>
In-Reply-To: <20260626080422.4191435-1-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 26 Jun 2026 22:41:24 +0200
X-Gm-Features: AVVi8Cfn4WVK2ZPqNv9jC0XwZH2Brmz7LG-ORQmMP9Wwtqmvfi60nz5FLrHG7m8
Message-ID: <CAFBinCD5bn5VixbomCz0nmHuopBmgh0CJc-V4jY2vdXhoP_VCw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF
 datapath on start/stop
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 10:04=E2=80=AFAM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> The I2S FIFO soft-resets its fast domain on start (AIU_RST_SOFT bit 0 +
> AIU_I2S_SYNC read in aiu_fifo_i2s_trigger), mirroring the downstream
> vendor driver's audio_out_i2s_enable(). The S/PDIF FIFO has no equivalent=
:
> it only toggles the IEC958 DCU, so a stale datapath FIFO can be replayed,
> producing the "machine gun noise" buffer underrun - on start when switchi=
ng
> outputs, and on stop when playback ends. The latter is audible on devices
> with an always-on S/PDIF-fed DAC (e.g. the ES7144 on the WeTek Play2).
>
> The vendor driver resets the IEC958 fast domain (AIU_RST_SOFT bit 2) on
> both enable and disable (audio_hw_958_enable), and when reconfiguring
> (audio_hw_958_reset clears AIU_958_DCU_FF_CTRL then resets). Do the same:
> reset before enabling the DCU on start, and after disabling it on stop.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

This matches the vendor driver, references:
- fast-reset SPDIF is triggered on enable and disable: [0]
- fast-reset SPDIF is triggered after all of the configuration is
written, then DCU_FF_CTRL is enabled: [1]

[...]
>         case SNDRV_PCM_TRIGGER_SUSPEND:
>         case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>         case SNDRV_PCM_TRIGGER_STOP:
>                 fifo_spdif_dcu_enable(component, false);
> +               snd_soc_component_write(component, AIU_RST_SOFT,
> +                                       AIU_RST_SOFT_958_FAST);
It doesn't seem to make any difference, so just for the record:
The vendor driver first triggers AIU_RST_SOFT_958_FAST then disables DCU: [=
2]


Best regards,
Martin


[0] https://github.com/endlessm/linux-s905x/blob/c1391ba1116aed801aaabfd9c7=
bbb76fda9801ec/sound/soc/aml/m8/aml_audio_hw.c#L1016
[1] https://github.com/endlessm/linux-s905x/blob/c1391ba1116aed801aaabfd9c7=
bbb76fda9801ec/sound/soc/aml/m8/aml_audio_hw.c#L979-L983
[2] https://github.com/endlessm/linux-s905x/blob/c1391ba1116aed801aaabfd9c7=
bbb76fda9801ec/sound/soc/aml/m8/aml_audio_hw.c#L1016-L1018
