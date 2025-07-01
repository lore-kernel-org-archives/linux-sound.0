Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B7B2777F3
	for <linux-sound@vger.kernel.org>; Tue,  1 Jul 2025 19:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751398549; cv=none; b=ELHEhuOPdyx5yDoyi1LlfyfysTAIBro76iGdlBqe5y5izkD8vcD+4Qh9WBXokWc6ap22jYhs54gJrpgSiNmmPJmXrEscM/En4zTcp+rgDY8grJw9RvBqRg4UFVH3BR1kqtpu+Qm5fvPA2hfNk7BeI+mLK/wT38coD/cr6u+KdxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751398549; c=relaxed/simple;
	bh=+pmAczIoAz20Sgyz7Pn5reSR+IXgzDoQvoDClC/I1fA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=bLlE8Jv2aTBW9bDx0fmBJK3RCWsKtGAlZYuiqyfn4zj4jiG6KAlG2zQ+/X9tYd4s3RBrOp+8YPiYWxG7bZTHUDp7r/YMjmjWvPg1gcIAtb82iLqgUSSkj7Ry8oCL/bmfaeIUAya97i6hL+ZqeF9c6SJY8DbcUAqm6Np0WCVNRkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jjGn1ARo; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jjGn1ARo"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso3533253f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 01 Jul 2025 12:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751398546; x=1752003346; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aN3BX1N8+BC+t/ow8nynRNiXWtKajXyZjEmDVu5QSCg=;
        b=jjGn1ARo1MsU+akd6WRW9IjHuImBmWNFv2vepbSukxS6f12bHEAcumOAAHZkARzqSw
         9aanTQ5RFELV0iCfIHvbzKj9Ufr/st7tZV9Uf/BO9ugU84DhRG0v4rQzlEdbJ0c/ynzd
         ngsbtHrFuomWbEqb+X70evJCYMtlj9lPh/QE7MSyfam0q2B96lGLkEXG9Qb3yTekxCZl
         xRe78oiusTQu95RVrsUIVTUFr4a04IAQRj+kt4dpXaRDk7D5ZsJKaXsF4Ay/FzuSQ94K
         JTXtoqrX9rvvPaTbCm+vHEZQmyz8LFBBjveKJdNICwtL1+5vmV/mEwXmGHgpksdk3DC1
         EKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751398546; x=1752003346;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aN3BX1N8+BC+t/ow8nynRNiXWtKajXyZjEmDVu5QSCg=;
        b=UDnZ2ANzJXzzDncI6G3aFrd9BLRS+c/KMUMCW4d5rdOSEIYhebtoBXXfltHCsnP4Ug
         YasCSdUpRcIxe/eUwWissxMsnnzOkm/GxhxeRPM/+xQaSXc5GZNyl1EH4GWz4wfNh7x/
         DQ8nAiWrtZ92gmfWD81p4Op5evhbTYN4M9WJMVdkGK1F1dr1lMAvDk1dRHdpQkSxSoll
         A+SkeSTsfkGoKSOkNiHjOA1SO7sNMpxkS84YRhXQlkzb/as/YDoUJInBiebzGbjHwtPb
         OY1lUtxvn4tO/PlbcVqv6ylpHcodvshI8G71Al/SFVZXzsP2R7RVLRP4vdv4zKoDNMh6
         DiGw==
X-Forwarded-Encrypted: i=1; AJvYcCViYa4LIV7Riwtx7zrme7rtjdFpgQwfZvrH64JPTdzvQrjOxZYmNunn4i49NrMXKLIDMRGX+UUDtcDrGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZdq+zj5vNjHGv/0eBle2YXCMeYbU93KG3g5wXTbiG91O+zstb
	+OA+Wpw/ZWXN0RSVl/wgDofgNnOfi2Pz9NnJPNdXzaImOBwKUKSNv7oqno2zY6fMO5w=
X-Gm-Gg: ASbGncs5BFu99UG4pCITZZDoPJTW8WR5uys9CbKOpIGGdtcLY4Xp2SeRYtWi612/Wg5
	4JARVN6hmg5vxxKOsQeQLz/9yrF7ePHd2YHK7V9MwgVAfR2mVY1eIMQ98ehE6IhvJg63do8tTnD
	09uuog65pyJDDvAIDlJU5+l7Mz9V4APzgPT1PmPBndvZlIkrx54dElw+e4VKNUI1s7aQ6B9P1wG
	kyst78787ViXPdo4LyhI8xsdY2uX/XLYjSTjkDNoaIdQ3XiPmhdYP1YtZOupPPOJnNIrswXz6r5
	nOfS5HYzU2Wz37IbkOILVkmMVdzC9bvi6hUCgdkPGGs59qomTEi3X6nE/U5p4kDGL0/f
X-Google-Smtp-Source: AGHT+IHKNKmkuKmDbrMhk4D/Fosqh/fvD260/xNJ3I/m+eUhB036LtpCqopLJVCj9MPeocJBMoTfxA==
X-Received: by 2002:a05:6000:440d:b0:3a4:dcfb:3118 with SMTP id ffacd0b85a97d-3a8fdb2a65fmr11528022f8f.10.1751398545560;
        Tue, 01 Jul 2025 12:35:45 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:4dad:b69a:9c81:2e57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e61f48sm14258924f8f.93.2025.07.01.12.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 12:35:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Jul 2025 20:35:42 +0100
Message-Id: <DB0YYV10UD2Q.M36VAZJOVE7V@linaro.org>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Stephen Boyd" <sboyd@kernel.org>, "Lee Jones" <lee@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] ASoC: codecs: add new pm4125 audio codec driver
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
 <20250626-pm4125_audio_codec_v1-v1-3-e52933c429a0@linaro.org>
 <aF01gRFjsKgy6j4V@finisterre.sirena.org.uk>
In-Reply-To: <aF01gRFjsKgy6j4V@finisterre.sirena.org.uk>

On Thu Jun 26, 2025 at 12:56 PM BST, Mark Brown wrote:
> On Thu, Jun 26, 2025 at 12:50:31AM +0100, Alexey Klimov wrote:
>
>> --- a/sound/soc/codecs/Kconfig
>> +++ b/sound/soc/codecs/Kconfig
>> @@ -297,6 +297,7 @@ config SND_SOC_ALL_CODECS
>>  	imply SND_SOC_WCD937X_SDW
>>  	imply SND_SOC_WCD938X_SDW
>>  	imply SND_SOC_WCD939X_SDW
>> +	imply SND_SOC_PM4125_SDW
>>  	imply SND_SOC_LPASS_MACRO_COMMON
>>  	imply SND_SOC_LPASS_RX_MACRO
>>  	imply SND_SOC_LPASS_TX_MACRO
>
> Please keep this file sorted, there's obviously been some things missed
> but please don't make it worse.
>
>> +obj-$(CONFIG_SND_SOC_PM4125_SDW) +=3D snd-soc-pm4125-sdw.o
>> +obj-$(CONFIG_SND_SOC_PM4125)   +=3D snd-soc-pm4125.o
>> +ifdef CONFIG_SND_SOC_PM4125_SDW
>> +# avoid link failure by forcing sdw code built-in when needed
>> +obj-$(CONFIG_SND_SOC_PM4125) +=3D snd-soc-pm4125-sdw.o
>> +endif
>
> Other drivers sort this out in Kconfig, do as they do.

My bad, thanks for pointing it out. I'll change that.

>> +static int pm4125_micbias_control(struct snd_soc_component *component,
>> +				  int micb_num, int req, bool is_dapm)
>> +{
>> +	return 0;
>> +}
>
> Why have this empty function which is only called from within the
> driver?  At best it's making the callers look like they do something.

I tried to make a minimal working version that we're going to
update with more patches during next submission.

Right now there seems to be at least two approaches:
-- pull in everything and send it in one go. Srini said that it will
be much more difficult to review due to the volume of code;
-- provide few patches that iteratively update the initial one and
add more functionality. The similar way when wcd937x was posted.
I counted there 5 patches for wcd937x. We probably can do that with
this audio-codec. In that case I need to figure out the right way
to split it.

My main issue was MBHC part -- it is needed to avoid IRQ storm
from pdm watchdog interrupts but MBHC requires more things to be
added for its support, that's why there are some empty/placeholder
functions.

What do you think should be the right strategy here?

In theory I can remove MBHC and make much smaller driver but
it will suffer from IRQ storms with some kernel WARNINGs generated.
Or maybe I should remove watchdog interrupts from it as well.

>> +static irqreturn_t pm4125_wd_handle_irq(int irq, void *data)
>> +{
>> +	return IRQ_HANDLED;
>> +}
>
> Why bother regisering for the interrupt at all if you're just going to
> ignore it?

This approach seems to be inherited from older wcd-family codec and
wcd939x.c (wcd939x_wd_handle_irq) provides this comment that I can copy
and adjust here like this:

/*
 * HPHR/HPHL Watchdog interrupt threaded handler
 *
 * Watchdog interrupts are expected to be enabled when switching on  the HP=
HL/R
 * in order to make sure the interrupts are acked by the regmap_irq handler
 * io allow PDM sync. We could leave those interrupts masked but we would
 * not haveany valid way to enable/disable them without violating irq layer=
s.
 *
 * The HPHR/HPHL Watchdog interrupts are handled by regmap_irq, so requesti=
ng
 * a threaded handler is the safest way to be able to ack those interrupts
 * without colliding with the regmap_irq setup.
 */


>> +#if defined(CONFIG_OF)
>> +static const struct of_device_id pm4125_of_match[] =3D {
>> +	{ .compatible =3D "qcom,pm4125-codec" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, pm4125_of_match);
>> +#endif
>
> Why does this compatible exist?  If the driver is instantiated from a
> as a Linux software contruct it shouldn't appear in the DT.

Could you please elaborate a bit more? Should it be instantiated
as an MFD device or platform device?

As far as I understood we need references to soundwire child nodes
of the codec (which are in DT) hence this one is described in the DT.


>> +const u8 pm4125_reg_access_digital[
>> +	PM4125_REG(PM4125_DIGITAL_REGISTERS_MAX_SIZE)] =3D {
>> +		[PM4125_REG(PM4125_DIG_SWR_CHIP_ID0)] =3D RD_REG,
>> +		[PM4125_REG(PM4125_DIG_SWR_CHIP_ID1)] =3D RD_REG,
>> +		[PM4125_REG(PM4125_DIG_SWR_CHIP_ID2)] =3D RD_REG,
>
> Data tables like this shouldn't be in headers, they should be in C
> files.  At worst you might end up with duplicate copies in the object
> code.

Thanks, I pull in a change/patch that fixes-reworks this.

Thank you,
Alexey Klimov

