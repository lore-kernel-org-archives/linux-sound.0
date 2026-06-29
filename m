Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF4535F199
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 12:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782734690; cv=none; b=Kc29u43aF+1Y/AtsMZN6ed7b7Id/sVsKBy/fI2L56iTIAt4MnZy+N69drPN88+SwvMsspBTl4+WIOlXioAI5DVZeqOL6s3/8Dr4COdc1i8soXtQtEp5Y/Li7Y+aT4veQuuWx8MJwj0u9s08wt8Lk9BCV+++ygDs3Tu02bsxdEAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782734690; c=relaxed/simple;
	bh=KucRsPEXVqSHA0jIYVaqXLRh/yGJufTgHGHlGxxDQnQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jT25r4Eoq1j9fvKkMKlI+PSwkIgiMG7NV1ezygnf+4wl8buuVDK4jI4EgYAAPBAEMxbXs/IkrKmZYZvgJYcjIuWQQoEuPoK4tfFnyEe/EwinyvYoE1UY+5TsArU0ODChKHXTLu5TdT09V5xVuMaiC/RBUECpMhIUMqdVpW5Ddsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=UUYIQful; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="UUYIQful"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4924593f45dso42307515e9.1
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 05:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782734687; x=1783339487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJgZmqjC2QA9/uTc6kcbWKzkbTz9n7WrrEXRH7DelFo=;
        b=UUYIQfulgvCcXCYNnUi2Qdd7wnHM0+X+nFPEjfxVAKNf1ELmMehdOj/6XFoAlF3qnh
         1gnSXDnGYiDySQikI9iOz35OIL905EgWx4yeuPlP9UrzPQUC4Tntrx9bfjcHUQsozOS0
         yynZVKNIGpVdD4wC12Ei/JH8WB4gYVPYME//1ZUjqXBcCM48w9bIVosk71Hy2Xz/RoM5
         sLL87g2VsWL23bjIrl6abBn9nsfEAgqILF8ph+aEd1718bDA37pIl71rw9VRVPpS7VFR
         4C+vY7mnDsVkE8fgbm0sPkChyKR7WIGpNKzoy2FKCZ38XOUJatLDTy1980At9Nu1PvlV
         i4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782734687; x=1783339487;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WJgZmqjC2QA9/uTc6kcbWKzkbTz9n7WrrEXRH7DelFo=;
        b=pu1TzeCS+4H1+UIGyRCXg5Kn0ey0l9qmFI/Yge1DHwWvRtjg3472xHugdp5/vt0bs2
         JcE172GOGA52Li46Je4u3jFOKJeCsUnX/aSWO8x4Isrf7kIi4ba2WgS5zFzzX00pRb9x
         D5ytG/ajL0j+uAabh41LZzp9ItPocyJqEOrXIovtJuu2xjKdXHJuZYeymshld6svsytR
         O9ec3Ti7M5oCa6q5AtfLYOSd1ZDCgmzpZ7o3qpsXfQAxx/F5ojDz/SlGAS18ghnJVjTH
         dzqAH5OreozG5h1c9eV7FuWmNqqYglMnq72dhFnDE/WuLW5WkH85QPXnG5md4L4XTE6l
         GPgw==
X-Forwarded-Encrypted: i=1; AFNElJ8dHh8Avde8haIYTHRpjfWw79d0Yw7DeHKSaevzad3Ta+0ziSIH8BBYb7XL2E1FvRnxYXXP06zvJJalnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf3Naa3LZhOBO2Dg2HGbL+049Gm0CuJXAVAO4cD3YluXhoDhxf
	CxGohrBgx+kUPywBgzqW7dG3n6XnTa0aCBtATuYTPEVtX2964Pn2uCr+50RviCHIG8Y=
X-Gm-Gg: AfdE7ck9KcL9g6dn3GH4x0g6SYq0HpNiR6aj+nka68GTO40twhaEs0V69TqF542bkwj
	1EYlLelWXX6lVrDFj0Arc5QMHkRKKe6aX7Om6UwT3GOyr0kk8sNkUW+Vc6e79UY09jKBlqgTRav
	owinI7durxR4ef7YrtiujmwdphxBt9rIxDwWBzYrbKA+5zQ3yznqoJeoP5ZO/f/M5VM4UEPvuFC
	/kiLYyT6flH0iEhDeNel6tbXk48t+SoKopZPj7LM/215ir/yEs1yewuao8OTekqQ6bq/PPLoVRE
	dIib36mgpP5e0qbjE+TyfPl0/JK5FZgeaKg3ni0LwE8O+M4Xlnpv0tGV83Kd7wTiaM5UJsqu3q+
	jdZftDSCxKk3j1lj981syC7/KubPeUNwqlnhEFfjNmYfLh7W4ncjikjBowQjPD510EEISMv3dIh
	6R+xNl2/nsFMk=
X-Received: by 2002:a05:600c:1d86:b0:490:d354:bcf4 with SMTP id 5b1f17b1804b1-49266885dc4mr247452875e9.27.1782734686627;
        Mon, 29 Jun 2026 05:04:46 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49269071d05sm317487775e9.11.2026.06.29.05.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:04:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Christian Hewitt <christianshewitt@gmail.com>,  Liam Girdwood
 <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,  Jaroslav Kysela
 <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,
  linux-sound@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF
 datapath on start/stop
In-Reply-To: <CAFBinCD5bn5VixbomCz0nmHuopBmgh0CJc-V4jY2vdXhoP_VCw@mail.gmail.com>
	(Martin Blumenstingl's message of "Fri, 26 Jun 2026 22:41:24 +0200")
References: <20260626080422.4191435-1-christianshewitt@gmail.com>
	<CAFBinCD5bn5VixbomCz0nmHuopBmgh0CJc-V4jY2vdXhoP_VCw@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 29 Jun 2026 14:04:44 +0200
Message-ID: <1jwlvha6xv.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On ven. 26 juin 2026 at 22:41, Martin Blumenstingl <martin.blumenstingl@goo=
glemail.com> wrote:

> On Fri, Jun 26, 2026 at 10:04=E2=80=AFAM Christian Hewitt
> <christianshewitt@gmail.com> wrote:
>>
>> The I2S FIFO soft-resets its fast domain on start (AIU_RST_SOFT bit 0 +
>> AIU_I2S_SYNC read in aiu_fifo_i2s_trigger), mirroring the downstream
>> vendor driver's audio_out_i2s_enable(). The S/PDIF FIFO has no equivalen=
t:
>> it only toggles the IEC958 DCU, so a stale datapath FIFO can be replayed,
>> producing the "machine gun noise" buffer underrun - on start when switch=
ing
>> outputs, and on stop when playback ends. The latter is audible on devices
>> with an always-on S/PDIF-fed DAC (e.g. the ES7144 on the WeTek Play2).
>>
>> The vendor driver resets the IEC958 fast domain (AIU_RST_SOFT bit 2) on
>> both enable and disable (audio_hw_958_enable), and when reconfiguring
>> (audio_hw_958_reset clears AIU_958_DCU_FF_CTRL then resets). Do the same:
>> reset before enabling the DCU on start, and after disabling it on stop.
>>
>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> This matches the vendor driver, references:
> - fast-reset SPDIF is triggered on enable and disable: [0]
> - fast-reset SPDIF is triggered after all of the configuration is
> written, then DCU_FF_CTRL is enabled: [1]

Take what the vendor driver does with a grain of salt, especially when
it comes to audio

>
> [...]
>>         case SNDRV_PCM_TRIGGER_SUSPEND:
>>         case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>>         case SNDRV_PCM_TRIGGER_STOP:
>>                 fifo_spdif_dcu_enable(component, false);
>> +               snd_soc_component_write(component, AIU_RST_SOFT,
>> +                                       AIU_RST_SOFT_958_FAST);
> It doesn't seem to make any difference, so just for the record:
> The vendor driver first triggers AIU_RST_SOFT_958_FAST then disables DCU:=
 [2]
>

One could even wonder if there is any point in applying a reset when
everything is stopped, if the enable path will apply this same
reset before anything else is started again ? Does it really changes
anything to the reported issue ?

>
> Best regards,
> Martin
>
>
> [0] https://github.com/endlessm/linux-s905x/blob/c1391ba1116aed801aaabfd9=
c7bbb76fda9801ec/sound/soc/aml/m8/aml_audio_hw.c#L1016
> [1] https://github.com/endlessm/linux-s905x/blob/c1391ba1116aed801aaabfd9=
c7bbb76fda9801ec/sound/soc/aml/m8/aml_audio_hw.c#L979-L983
> [2] https://github.com/endlessm/linux-s905x/blob/c1391ba1116aed801aaabfd9=
c7bbb76fda9801ec/sound/soc/aml/m8/aml_audio_hw.c#L1016-L1018

--=20
Jerome
