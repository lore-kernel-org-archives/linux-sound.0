Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD61D146A6C
	for <linux-sound@vger.kernel.org>; Tue, 14 Jan 2025 14:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736864122; cv=none; b=Mq5lgHR4wXrftUesbD3SWXpT86tqiRvLcgWwMWpE2B4iRG3EKvnGShb2Un5NfAdE4pwXnTvJWvnDzV1nAUM18ApUr5vYiw+loRvcmukbi7D82A/Gca5jvBOyJg2weHA7gYnOtqzue/mr8gbuymu6OObwtwHYRyhsiRS5UxgxtZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736864122; c=relaxed/simple;
	bh=dPiW9cU8fn/VoVc17fTcJXh78YO+sF2cYqxV4cvtN+I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EHO+WWEZroB0+hX+cWNde61xddL+42DOOPypn054CflAKS1XIxuFiwVCcrqEQNS6EdGo/Y2VL9h0HMk52KlSBwXjlw9qpjQgFiz0VzcYd2aPPd/hQqtHzN1xwAF1yuNUoq1h/RvVFp5/MK/r7tvB6Rbh8VI6xlfQylOpfZB5AWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=t6xY8MxY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="t6xY8MxY"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436202dd730so39654735e9.2
        for <linux-sound@vger.kernel.org>; Tue, 14 Jan 2025 06:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736864117; x=1737468917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGnwHZ/nWlYaaxLbV8V6TilY1n8mD+IS7w/R3cun8X8=;
        b=t6xY8MxYWC09SIpnV4L6xwAGo7xXxVUqTJWkHKR2HEPhBnMh3kUdwgb8Jm54iJDle9
         /DTixEXpojcnneH3JvwYwg0+KUc4LDyfWQZPzHud8joDr06l0Z6rIbGVJuxcd/MpqOaa
         HuYlp2sIrTAJZlfn43L+ZOGvzslhAEYcoxeaL9UFyiiIzvMN58f9GQUKObxqZ5Xd9KSx
         KkSyYy9MhIEl3iOKCODjxz4nY7g9flfcoTFPp/Mx4j7vzmluJ99tdqscW/70B9XHi/8l
         p5DGkFX8TieVLwhMkJqqSKQPCGCG3Lt6MRYHa3i/gEoAIpx5nivS64Km8gg7mD8q+X4o
         pZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736864117; x=1737468917;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zGnwHZ/nWlYaaxLbV8V6TilY1n8mD+IS7w/R3cun8X8=;
        b=IY/j9fSoKTV9VYzL0YiY1fxd1pS+37BRjXAjobWfaiq9xgH+h/RAGXHPi/MC43/k2C
         WAW7PGfFedaEgK1y5Xf95oZYrnou9b4sHPJdQ6YwWtBt/MVOGt0nRxWjXynrFAqidwRE
         CRfsAm8FYnfjtgydLGnFTwohk6jphYNW3lg/DV2UAgXioZGZIw+GsyRzmfRCzWZG/S8s
         NKRLKrqCMwaGLEsmSXuWQKUZyTFcMkFBHiQgtNrYXm6QubFrHQkxoxXTa/45tDTksYzE
         3/1OZ1OgTUP5mmZg2IbjYCFyjCL2aTTqhgI1YMHwO4z2SI+gyUtHIOEQxQMAYR2Uve6O
         4CDA==
X-Forwarded-Encrypted: i=1; AJvYcCX0kxTRZFSYIybNIC4hAY1bFpB1/Gb4o4MG2qoLhpPtpREbs3dDD8HkNMcUgeVWO1cSttx9mnmmtIDvpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBgcqgd90MMTKQqAgGojOKqMZ000Zkj3c7m0+afd2ZNMF+L+u1
	sy1X49rxu5JyJU7L97TnNr89JhaaMUXcMVhvnLc2lego6iTdSh+vzPbZLCeiF/o=
X-Gm-Gg: ASbGncspp4CuFQtLIp0cFU7rDSAbvq7ogTnXi+khwxSPYWRbi0Dhphs/B9XZpuEX9kO
	Y26mwbiOASCy+fPXKoccsH8eLJQ7tYdmPkvKK2OihiUnAKJJgzVd47QshbcCiTVDp/eCOjiv2gf
	tF8SjykB8+FN4n9k2hVZdDhLhSRiMtiqFpM8uHzwrxX8tNwd7IXGtYEtRwjLrpp0lnsWI96gmRZ
	X5ed6P4PR8npF33OwPPj4rM66s3q1D6YyH8qb3XZ8PVx2vKYtfg6JCi
X-Google-Smtp-Source: AGHT+IFBaxtBsbDoGCFuE0KrD/uC8iq93eKLTTc/GgOPTE+++0UVJujouLLyM9aFVx5ULskxQsYJHA==
X-Received: by 2002:a5d:6d8e:0:b0:38a:88be:bcb4 with SMTP id ffacd0b85a97d-38a88bebd23mr21000464f8f.29.1736864117139;
        Tue, 14 Jan 2025 06:15:17 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:317c:3d93:b7d4:96cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e62116sm175095835e9.35.2025.01.14.06.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 06:15:16 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>,
  Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-sound@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: Add Amlogic S4 Audio
In-Reply-To: <0e8b78c1-5c56-40e7-a2d8-41a7f49d52bc@amlogic.com> (Jiebing
	Chen's message of "Tue, 14 Jan 2025 20:34:01 +0800")
References: <20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com>
	<20250113-audio_drvier-v1-3-8c14770f38a0@amlogic.com>
	<1jldve939f.fsf@starbuckisacylon.baylibre.com>
	<813e2564-8c4c-4adb-8184-ab88156e3e4c@amlogic.com>
	<1jmsft7ihz.fsf@starbuckisacylon.baylibre.com>
	<0e8b78c1-5c56-40e7-a2d8-41a7f49d52bc@amlogic.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 14 Jan 2025 15:15:16 +0100
Message-ID: <1j34hl7a8b.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue 14 Jan 2025 at 20:34, Jiebing Chen <jiebing.chen@amlogic.com> wrote:

> =E5=9C=A8 2025/1/14 19:16, Jerome Brunet =E5=86=99=E9=81=93:
>> [ EXTERNAL EMAIL ]
>>
>> On Tue 14 Jan 2025 at 16:52, Jiebing Chen <jiebing.chen@amlogic.com> wro=
te:
>>
>>> =E5=9C=A8 2025/1/13 22:50, Jerome Brunet =E5=86=99=E9=81=93:
>>>> [ EXTERNAL EMAIL ]
>>>>
>>>> On Mon 13 Jan 2025 at 14:35, jiebing chen via B4 Relay <devnull+jiebin=
g.chen.amlogic.com@kernel.org> wrote:
>>>>
>>>>> From: jiebing chen <jiebing.chen@amlogic.com>
>>>>>
>>>>> Add basic audio driver support for the Amlogic S4 based Amlogic
>>>>> AQ222 board.
>>>>>
>>>>> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
>>>>> ---
>>>>>    .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 226 +++++++++=
+++
>>>>>    arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 385 +++++++++=
+++++++++++-
>>>>>    2 files changed, 610 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>>>> index 6730c44642d2910d42ec0c4adf49fefc3514dbec..32f50a5b860435d50d9c5=
528b43422b705b20130 100644
>>>>> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>>>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>>>> @@ -75,6 +75,19 @@ vddio_ao1v8: regulator-vddio-ao1v8 {
>>>>>                regulator-always-on;
>>>>>         };
>>>>>
>>>>> +     vcc5v_reg: regulator-vcc-5v {
>>>>> +             compatible =3D "regulator-fixed";
>>>>> +             vin-supply =3D <&main_12v>;
>>>>> +             regulator-name =3D "VCC5V";
>>>>> +             regulator-min-microvolt =3D <5000000>;
>>>>> +             regulator-max-microvolt =3D <5000000>;
>>>>> +             gpio =3D <&gpio GPIOH_7 GPIO_ACTIVE_HIGH>;
>>>>> +             startup-delay-us =3D <7000>;
>>>>> +             enable-active-high;
>>>>> +             regulator-boot-on;
>>>>> +             regulator-always-on;
>>>>> +     };
>>>>> +
>>>>>         /* SY8120B1ABC DC/DC Regulator. */
>>>>>         vddcpu: regulator-vddcpu {
>>>>>                 compatible =3D "pwm-regulator";
>>>>> @@ -129,6 +142,219 @@ vddcpu: regulator-vddcpu {
>>>>>                                 <699000 98>,
>>>>>                                 <689000 100>;
>>>>>         };
>>>>> +     dmics: audio-codec-1 {
>>>>> +             compatible =3D "dmic-codec";
>>>>> +             #sound-dai-cells =3D <0>;
>>>>> +             num-channels =3D <2>;
>>>>> +             wakeup-delay-ms =3D <50>;
>>>>> +             sound-name-prefix =3D "MIC";
>>>>> +     };
>>>>> +
>>>>> +     dioo2133: audio-amplifier-0 {
>>>>> +             compatible =3D "simple-audio-amplifier";
>>>>> +             enable-gpios =3D <&gpio GPIOH_8 GPIO_ACTIVE_HIGH>;
>>>>> +             VCC-supply =3D <&vcc5v_reg>;
>>>>> +             #sound-dai-cells =3D <0>;
>>>>> +             sound-name-prefix =3D "10U2";
>>>>> +     };
>>>>> +
>>>>> +     spdif_dir: audio-spdif-in {
>>>>> +             compatible =3D "linux,spdif-dir";
>>>>> +             #sound-dai-cells =3D <0>;
>>>>> +             sound-name-prefix =3D "DIR";
>>>>> +     };
>>>>> +
>>>>> +     spdif_dit: audio-spdif-out {
>>>>> +             compatible =3D "linux,spdif-dit";
>>>>> +             #sound-dai-cells =3D <0>;
>>>>> +             sound-name-prefix =3D "DIT";
>>>>> +     };
>>>>> +
>>>>> +     sound {
>>>>> +             compatible =3D "amlogic,axg-sound-card";
>>>>> +             model =3D "aq222";
>>>>> +             audio-widgets =3D "Line", "Lineout";
>>>>> +             audio-aux-devs =3D <&tdmout_a>, <&tdmout_b>, <&tdmout_c=
>,
>>>>> +                              <&tdmin_a>, <&tdmin_b>, <&tdmin_c>,
>>>>> +                              <&tdmin_lb>, <&dioo2133>, <&tdmout_pad=
>, <&toacodec>;
>>>>> +             audio-routing =3D "TDMOUT_A IN 0", "FRDDR_A OUT 0",
>>>>> +                             "TDMOUT_A IN 1", "FRDDR_B OUT 0",
>>>>> +                             "TDMOUT_A IN 2", "FRDDR_C OUT 0",
>>>>> +                             "TDM_A Playback", "TDMOUT_A OUT",
>>>>> +                             "TDMA_OUT SEL",   "TDM_A Playback",
>>>>> +                             "TDMOUT_B IN 0", "FRDDR_A OUT 1",
>>>>> +                             "TDMOUT_B IN 1", "FRDDR_B OUT 1",
>>>>> +                             "TDMOUT_B IN 2", "FRDDR_C OUT 1",
>>>>> +                             "TDM_B Playback", "TDMOUT_B OUT",
>>>>> +                             "TDMB_OUT SEL",   "TDM_B Playback",
>>>>> +                             "TDMOUT_C IN 0", "FRDDR_A OUT 2",
>>>>> +                             "TDMOUT_C IN 1", "FRDDR_B OUT 2",
>>>>> +                             "TDMOUT_C IN 2", "FRDDR_C OUT 2",
>>>>> +                             "TDM_C Playback", "TDMOUT_C OUT",
>>>>> +                             "TDMC_OUT SEL",   "TDM_C Playback",
>>>>> +                             "TOACODEC TDMA", "TDM_A Playback",
>>>>> +                             "TOACODEC TDMB", "TDM_B Playback",
>>>>> +                             "TOACODEC TDMC", "TDM_C Playback",
>>>>> +                             "SPDIFOUT_A IN 0", "FRDDR_A OUT 3",
>>>>> +                             "SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
>>>>> +                             "SPDIFOUT_A IN 2", "FRDDR_C OUT 3",
>>>>> +                             "SPDIFOUT_B IN 0", "FRDDR_A OUT 4",
>>>>> +                             "SPDIFOUT_B IN 1", "FRDDR_B OUT 4",
>>>>> +                             "SPDIFOUT_B IN 2", "FRDDR_C OUT 4",
>>>>> +                             "TDMIN_A IN 0", "TDM_A Capture",
>>>>> +                             "TDMIN_A IN 1", "TDM_B Capture",
>>>>> +                             "TDMIN_A IN 2", "TDM_C Capture",
>>>>> +                             "TDMIN_A IN 3", "TDM_A Loopback",
>>>>> +                             "TDMIN_A IN 4", "TDM_B Loopback",
>>>>> +                             "TDMIN_A IN 5", "TDM_C Loopback",
>>>>> +                             "TDMIN_B IN 0", "TDM_A Capture",
>>>>> +                             "TDMIN_B IN 1", "TDM_B Capture",
>>>>> +                             "TDMIN_B IN 2", "TDM_C Capture",
>>>>> +                             "TDMIN_B IN 3", "TDM_A Loopback",
>>>>> +                             "TDMIN_B IN 4", "TDM_B Loopback",
>>>>> +                             "TDMIN_B IN 5", "TDM_C Loopback",
>>>>> +                             "TDMIN_C IN 0", "TDM_A Capture",
>>>>> +                             "TDMIN_C IN 1", "TDM_B Capture",
>>>>> +                             "TDMIN_C IN 2", "TDM_C Capture",
>>>>> +                             "TDMIN_C IN 3", "TDM_A Loopback",
>>>>> +                             "TDMIN_C IN 4", "TDM_B Loopback",
>>>>> +                             "TDMIN_C IN 5", "TDM_C Loopback",
>>>>> +                             "TDMIN_LB IN 3", "TDM_A Capture",
>>>>> +                             "TDMIN_LB IN 4", "TDM_B Capture",
>>>>> +                             "TDMIN_LB IN 5", "TDM_C Capture",
>>>>> +                             "TDMIN_LB IN 0", "TDM_A Loopback",
>>>>> +                             "TDMIN_LB IN 1", "TDM_B Loopback",
>>>>> +                             "TDMIN_LB IN 2", "TDM_C Loopback",
>>>>> +                             "TODDR_A IN 0", "TDMIN_A OUT",
>>>>> +                             "TODDR_B IN 0", "TDMIN_A OUT",
>>>>> +                             "TODDR_C IN 0", "TDMIN_A OUT",
>>>>> +                             "TODDR_A IN 1", "TDMIN_B OUT",
>>>>> +                             "TODDR_B IN 1", "TDMIN_B OUT",
>>>>> +                             "TODDR_C IN 1", "TDMIN_B OUT",
>>>>> +                             "TODDR_A IN 2", "TDMIN_C OUT",
>>>>> +                             "TODDR_B IN 2", "TDMIN_C OUT",
>>>>> +                             "TODDR_C IN 2", "TDMIN_C OUT",
>>>>> +                             "TODDR_A IN 3", "SPDIFIN Capture",
>>>>> +                             "TODDR_B IN 3", "SPDIFIN Capture",
>>>>> +                             "TODDR_C IN 3", "SPDIFIN Capture",
>>>>> +                             "TODDR_A IN 6", "TDMIN_LB OUT",
>>>>> +                             "TODDR_B IN 6", "TDMIN_LB OUT",
>>>>> +                             "TODDR_C IN 6", "TDMIN_LB OUT",
>>>>> +                             "10U2 INL", "ACODEC LOLP",
>>>>> +                             "10U2 INR", "ACODEC LORP",
>>>>> +                             "Lineout", "10U2 OUTL",
>>>>> +                             "Lineout", "10U2 OUTR";
>>>>> +             assigned-clocks =3D <&clkc_pll CLKID_HIFI_PLL>,
>>>>> +                               <&clkc_pll CLKID_MPLL2>,
>>>>> +                               <&clkc_pll CLKID_MPLL0>,
>>>>> +                               <&clkc_pll CLKID_MPLL1>;
>>>>> +             assigned-clock-rates =3D <491520000>,
>>>>> +                                    <294912000>,
>>>>> +                                    <270950400>,
>>>>> +                                    <393216000>;
>>>> Why do you need 4 base rates ? Which rate family does each provide ?
>>> hifipll 49152000, mpll2 294912000 mpll0 270950400, mpll1 393216000, the
>>> accuracy of hifipll
>>>
>>> is relatively high, for tdm/pdm/spdif 16/48/96/192k we can use it. if t=
he
>>> tdm and spdif work on
>> It is fine to use the HiFi. I'm glad this clock finally got fixed
>>
>>> the same time, for example ,tdm 48k. spdif 44.1k, we can't use the same
>>> pll, so spdif need use the mpll 0
>>>
>>> other pll , only set a default value, at the latest chip, we remove all
>>> mpll for hardware, only two hifipll
>> I'm not sure you understand how this works.
>> There is 3 families of audio rate: 48kHz, 44.1kHz and 32kHz
>>
>> Each family needs a PLL assigned, so you need 3, not 4, unless there is
>> another specific rate family you want to support. If that's the case,
>> document it.
>>
>> Setting the rate of the PLL should follow this principle:
>> * Family rate
>>    - multiplied by (32 x 24): to accomodate different sample sizes
>>    - multiplied by 2 until you reach the maximum rate of selected PLLs
>>      This allows to support rates such 192k or even 768k
>>
>> 491520000 is not dividable by 3, it won't allow 24 bits words. It is a
>> poor choice.
>>
>> Have a look at the s400 for an example using the HiFi PLL. The axg was
>> restricted to a 68 PLL multiplier but the S4 is not so you should be
>> able to use a higher base rate (4 718 592 000 Hz), providing better
>> accuracy in the end
>
> for new soc audio ip, the hardware will not support the 24bit(include g12=
a,
> sm1,axg)

That may be what you chose to support in your BSP but that not how it
works in mainline. 24bits slot width is supported and has been tested on
axg, g12 and sm1. This is not going away.

I would find extremely odd that 24 bits slot width is not supported on s4,
but as long you document this, it is fine by me.

>
> SNDRV_PCM_FMTBIT_S24_3LE, 24 bit in memory

I think you are mixing up slot width and memory representation

>
