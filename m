Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E32303A1C
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 18:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757355520; cv=none; b=IiGKe/tSseoVMpzWGl80OwHRV9dNbzGPKez50jnhhNLKpUFxrqyBVpbcvGE999dwoTFu9JWo/avlwr69VoYiMdWXdFYxyJtwyrs4A6t4pibiHib5wITEnWl4hll6CE4Ti/DbnHJPuZt1UTGPndW+NrxqYPTviUpBzjBstGnbu4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757355520; c=relaxed/simple;
	bh=4qtyyFkAqi/EXUnCgIjsBDS6e3kOLtoXVXi5nZvXX4A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=r+/5WYv6AQ8gPSipyAPJdmMDIqulncOGzEF/MdK/zqUsJ6teBZyczK1gmSwJfQ+pbkiAC11RzAarmbgRGJC/c+SLJ9rA5BA9YrDEvGq86DllAPjqYuK7EyGmncRvGKvdIWFt4KLqrSqZpXS8HAoNHpamxQ80gkyv+PuHgh4EjLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LCiO52Se; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LCiO52Se"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3df15fdf0caso3657704f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 08 Sep 2025 11:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757355517; x=1757960317; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lb8SkQ+gt0WvvPJ4SzjGlb6HLfu8xf3EEt0ttO3omRo=;
        b=LCiO52SexyXWWlSVyuolNT1J63bk+M3J0zJC/amCHsHl9KcVymvTUuYfe41t6dw6za
         WK5hhcKR3GKhCTAzmq5XtbcL93tkswU+xTNzH24m1HOB0F6NatdtuFkpMniVibtpkS/9
         x05mVI44Ls9aivDA/CajPlr3CXEg+djt1TB8o3xeDAKjgejDJwxIFpWHn/ggAXdDStAQ
         iI0JMTlvZV3qcU73+1zL9SxgGaBA1BlGM26nOaYywrrclz+bG9VtMohyQKxVGZBS2VyW
         uFRUxqkuJApOkxSnTMIF8l774tq+0j4KoAPKubvJd6nKIbhr009D1szKT4k12DZfFx/B
         q2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757355517; x=1757960317;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lb8SkQ+gt0WvvPJ4SzjGlb6HLfu8xf3EEt0ttO3omRo=;
        b=mPNcrVEnRreZvYYXaUbS5PqJJuGQQwNPlRYtuG9pvlzuoDKFONczfnpwc/Zgc3KgTv
         d3NjnOTSeFEdXwIIPjGRcS8LWssHFrg98MIjImBRYoWVt+ZPMEoRK+hytxvfqU8BwBFm
         EBXDopPZo9yNniG9QXKql4WIlvAULaYqxMjtbNVgfK8cvdyq8MKrifAuvo+pTM74VtFP
         5yl4pADl2kUHFbPTlDf+nlCJr+BSf8iTQZBWsOL05lHs1xSuAe1JzoRBouU4U48JeCDh
         3Jd8BvnvJaGQVcuRiP5HIqfnMUIfFAu+ac7NmhXDVz808GyDj/3Zkj5YR/0Pgp9rMdus
         CkXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFEaxlkSsZBCj3/E0DjE/NixjokYZW9l7ZUw2FZObJcf6bx5JnVrNtcvlPn2lTh/191m5+QOU3lrttNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvmnn/7KRENjBBAQuuuPCxNNrhRw5/IaP9juctslyrFXx+/CrY
	EKJY8FW/X7uO562bLlvJjeT4ZJSFI0memAnSd8MiiY6twpgoF4wBSgIWvanbKVsKPXM=
X-Gm-Gg: ASbGncuH0pA6ab5HFj+O/v6zLsgs1JgE4Z2BWLCZ2H5UvJsl+RW74QwvEazyO/X8soc
	RF23PuL4up8f7yL9DlYT6o5mtAYAfZP9eP8EKfF1ilb9XjRrO9uDJ48YOzu2gnluOn2lTGAFsri
	dSFRfLTJ1J32Wk/Hn+tahKtFOgKAyoU9kEoZplZsFKjOM3x7XSpLbsYVYat9Hivkf40yydTFXrT
	YMQm3ZQvxUNcBwMrUDclN0h3sWkfUW3k6HngcDvzFUuUKNPvTiiHsVAvCbRLoUgUTqVkO645mQZ
	6+GJ9JNVJo52sDdTvbRldiWSGUv9Brox+PQmJNrngRcgWvPOxLXmRWnYxzoHSnZ98Ul2iIMHZKj
	o2fkNiTzVu6iuBYyO4XXhKB4I5Wk=
X-Google-Smtp-Source: AGHT+IFOzTS8FVjEgH8Go18e2etfKEqg7OecFkUxP2xoc5+BHcVI+ILWLt3vxVvL+fS0RCc5g0yPVA==
X-Received: by 2002:a05:6000:2486:b0:3e2:e079:86cf with SMTP id ffacd0b85a97d-3e64bde66d6mr9363317f8f.36.1757355516935;
        Mon, 08 Sep 2025 11:18:36 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:1299:47dd:d3d7:b7cf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dda597641sm65257275e9.11.2025.09.08.11.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 11:18:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Sep 2025 19:18:35 +0100
Message-Id: <DCNMJEP0XW33.1AUMCTJU5UPBY@linaro.org>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Stephen Boyd" <sboyd@kernel.org>, "Lee Jones" <lee@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v3 2/3] ASoC: codecs: add new pm4125 audio codec driver
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>, "Srinivas
 Kandagatla" <srini@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250814-pm4125_audio_codec_v1-v3-0-31a6ea0b368b@linaro.org>
 <20250814-pm4125_audio_codec_v1-v3-2-31a6ea0b368b@linaro.org>
 <df884334-c850-4ae9-b5e8-63cb834ae259@kernel.org>
 <DCNIVW9XSSY3.3H7TSNFDH7TKT@linaro.org>
 <690423ac-4283-47a0-9250-4c740978ccac@oss.qualcomm.com>
In-Reply-To: <690423ac-4283-47a0-9250-4c740978ccac@oss.qualcomm.com>

On Mon Sep 8, 2025 at 4:45 PM BST, Srinivas Kandagatla wrote:
> On 9/8/25 4:26 PM, Alexey Klimov wrote:
>> Hi Srini,
>>=20
>> On Fri Aug 15, 2025 at 4:36 PM BST, Srinivas Kandagatla wrote:
>
>
>>>> +static int pm4125_codec_enable_rxclk(struct snd_soc_dapm_widget *w, s=
truct snd_kcontrol *kcontrol,
>>>> +				     int event)
>>>> +{
>>>> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(w-=
>dapm);
>>>> +
>>>> +	switch (event) {
>>>> +	case SND_SOC_DAPM_PRE_PMU:
>>>>
>>>> +static const struct snd_kcontrol_new pm4125_snd_controls[] =3D {
>>>> +	SOC_SINGLE_EXT("HPHL_COMP Switch", SND_SOC_NOPM, 0, 1, 0,
>>>
>>>     SOC_SINGLE_EXT("HPHL_COMP Switch", PM4125_COMP_L, 0, 1, 0, ?
>>>
>>>> +		       pm4125_get_compander, pm4125_set_compander),
>>>> +	SOC_SINGLE_EXT("HPHR_COMP Switch", SND_SOC_NOPM, 1, 1, 0,
>>>
>>>        SOC_SINGLE_EXT("HPHR_COMP Switch", PM4125_COMP_R, 1, 1, 0,?
>>>
>>>> +		       pm4125_get_compander, pm4125_set_compander),
>>>
>>> This is same issue in one of the WCD codec, which am going to send fixe=
s
>>> along with my original wcd fixes series.
>>=20
>> So this was in other codecs for years, right?
>
> only in wcd937x since it was added.
>
>>=20
>>>> +
>>>> +	SOC_SINGLE_TLV("HPHL Volume", PM4125_ANA_HPHPA_L_GAIN, 0, 20, 1,
>>>> +		       line_gain),
>>>> +	SOC_SINGLE_TLV("HPHR Volume", PM4125_ANA_HPHPA_R_GAIN, 0, 20, 1,
>>>> +		       line_gain),
> ...
>                           PM4125_ANA_HPHPA_FSM_DIV_RATIO_MASK,
>>>                                       PM4125_ANA_HPHPA_FSM_DIV_RATIO_68=
);
>>> @@ -309,8 +307,6 @@ static int pm4125_rx_clk_disable(struct
>>> snd_soc_component *component)
>>>         snd_soc_component_write_field(component,
>>> PM4125_DIG_SWR_CDC_RX_CLK_CTL,
>>>                                       PM4125_DIG_SWR_ANA_RX_CLK_EN_MASK=
,
>>>                                       PM4125_DIG_SWR_RX_CLK_DISABLE);
>>> -       pm4125_global_mbias_disable(component);
>>> -
>>>         return 0;
>>>  }
>>=20
>> This doesn't work. Playback has two issues: 1) volume is very low and pr=
obably
>> not adjustable and 2) sound during playback dies after a couple of secon=
ds.
>>=20
>> Returning these global_mbias() calls restores the good behaviour.
>
> What is global micbias to do with rx playback? Maybe something is missing=
.

No idea. Spec that I can see doesn't say a lot about PM4125_ANA_MBIAS_EN re=
gister.
Just that these are main biases.

> Which RX path are you testing?
>
> I am testing this with Headphone and Lineout, it works for me.
>
>>=20
>> Maybe let's make a widget out of it? In such case I am not sure about
>> routing meaning that I not sure which paths do require mbias enable.
> Not sure why RX would need mic bias?

I am testing lineout that goes into wsa881x amplifier in analog mode (mono)=
.
I use the following amixers:

amixer -c0 cset iface=3DMIXER,name=3D'RX_CODEC_DMA_RX_0 Audio Mixer MultiMe=
dia1' 1
amixer -c0 cset iface=3DMIXER,name=3D'RX_MACRO RX0 MUX' 1
amixer -c0 cset iface=3DMIXER,name=3D'RX INT0 DEM MUX' 1
amixer -c0 cset iface=3DMIXER,name=3D'RX INT0_1 MIX1 INP0' 'RX0'
#merge two channels together (right channel goes into INT0_1 input1)
amixer -c0 cset iface=3DMIXER,name=3D'RX INT0_1 MIX1 INP1' 'RX1'
amixer -c0 cset iface=3DMIXER,name=3D'EAR_RDAC Switch' 0
amixer -c0 cset iface=3DMIXER,name=3D'HPHL_RDAC Switch' 0
amixer -c0 cset iface=3DMIXER,name=3D'HPHR_RDAC Switch' 0
amixer -c0 cset iface=3DMIXER,name=3D'LO_RDAC Switch' 1
amixer -c0 cset iface=3DMIXER,name=3D'HPHL Switch' 1
amixer -c0 cset iface=3DMIXER,name=3D'RX_RX0 Digital Volume' 80
amixer -c0 cset iface=3DMIXER,name=3D'SpkrMono WSA_RDAC' 1

and then aplay. With long .wav files the sound dies after few seconds of pl=
ayback.
But volume issue is present with any .wav files.

After playing with pm4125_global_mbias_enable(), tt looks like
both PM4125_ANA_MBIAS_EN_GLOBAL and PM4125_ANA_MBIAS_EN_V2I should be enabl=
ed to avoid this problem.

Thanks,
Alexey

