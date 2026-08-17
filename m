Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6CC2F1FC7
	for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 03:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786936404; cv=none; b=aY2/9qei3/gF7vs3tvW+80Vg+i+u7nGPssYUTU8kznn+zZio3sVhugumKHHHvmTFyNQu/MzwgLy7UNKpbyqUlkh7pJQS1u+XUb/JuLvZMM4DpGiDt+PxGi+XXJrfnvDYrENbHCZH1Qje+DE9P+NWa/SKfQdyOfl1Cgs6RXdCY0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786936404; c=relaxed/simple;
	bh=ySjy65TPM2kNp1q7ryaPdkIhbkdqC+DpDrVF8bOxacY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GnILO69cR0JqGtOlh7HTJbPX+XiGM3RU/NuCYVGZOEZFm6JWsq+gm8FuOQW3LyVWCugQ+jnbste6s2HJ6agAv3OLaXq6CO6qBqDUTK5Ez0xa2ydt4kL8h3LkXKfK9eWA0wKzNUFyT30Rl/5OAEbQJwwdiIhSRG81R4YMdFCeCB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAyPrgTu; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAyPrgTu"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ceaf8a1265so44109315ad.2
        for <linux-sound@vger.kernel.org>; Sun, 16 Aug 2026 20:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786936403; x=1787541203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fIFCFL/FzLVixG6UIbo2y72gPYEoT51ibOB2HZxvDXU=;
        b=MAyPrgTuxioozR0a8xR3KHFEQtXmV5fzA41COMSApWDEhgX13LDok7fEAKwS2MDbeT
         4lVL9k9ZiBZHyZay2i2KuMsDbDDEZNAQZN9n0i7kgSLv88ltp++nWkmnYf2QHFOPj9eb
         jUAsG3utSHG8k23txUjpYbx8NeQJpOWumZU02liHqevKMeZbkHa29v6oQ7TcA3Z2uU4B
         4b1yQLwctFbFVbOYxcJn17cFqrzhwNOerJxsX5cF7lP6Fw4Lcy90ZATdUFm0kDjJPtcq
         zuicqKMLkWNteNaivk/4JqUgxXd64G+x6hpKOCclohV6fHPrjmF83XRNRBfQt1TI88dW
         ugmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786936403; x=1787541203;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fIFCFL/FzLVixG6UIbo2y72gPYEoT51ibOB2HZxvDXU=;
        b=gCCHN3lwcUHHyDHIKlnXwj3vHA/w9uHyK7TI8XL0JKAMQXDm7JXJ2WdrkaiUqOigrh
         oLaZ29CfXPQy+yKjYFCMyzMTdZwn1EX7FO2wtCP46ffqqKJQS5I4KVpd3aGjpAZlMMKd
         cKTc6Mt3WhuZsVkWW3ttuwrOm4GfrpLLd4umZungvs28aVylpn9hm1mpGVUo6NLsilht
         RgO8oHMhV/1pywRdFAoc6hFhiCyA1pH2/25a13nazl4lPK8WAl/C7y/syi0fCEHYP7hY
         4PTT6mjjFtxHcFKPzbptj/MkJhvFAIFW6xWUhth8V63mUeiR5KeSTZWQCM120WGn11JQ
         XBlw==
X-Forwarded-Encrypted: i=1; AHgh+Rqxv2RydeRg3HIms+FcEAMD5ob4IrXyBOA/aI64w2vjXg9FzfEi/2EjxyXbfJCJc121u3mNmiqVSNdLCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTUrFx/3kfp7c/SV8AM+J85431E3lABUyUv5PHnRZMB5mS4C/q
	amNVCrXogDgHtu7lzdNs7MUrEyNPYWwD8gGSL/kYruP9dld5LlXDbnhG
X-Gm-Gg: AR+sD13QhlXKB/e8Uy5WuI+VRNhynEwpYIBGsYfsPeg/7q+BYCWUYkoIz6o1XeENIzH
	W8Jw6DEAtXwjuh4xSBpDDC/y7yimE9I5oguCTAROe4vflOjGlXAyxVFNNQUJmeHb2ENTsx3GFyA
	GFckYirxYqjwlyllFScxV+T9/Sr5x7Q3syjOk02T5hSCS5BYh8j9ASegNwlWyPuJXciWWx3mq+p
	RtJJjROchLaoe0JiiR3Y88Kg52/gTIgfaxexmQTpimwHzXjs6pHvCaPZeYiIulDVe2oDhDOcqjG
	GCQNrdyg4daS3GkEcFreGhEOaxRqEO582LWsoJZnsUB63YppBf/oBhvaVP2f/uTzQK6aBVQ5lYn
	Y7FphlnlSa0y4Wc49JkxUHcHrR0twc/gxR/fV7aYvTyZexU0T2NafAU7F1mf74CUP53TUj44oaU
	IoOQG0e02SCVROrRWZZYvCsZxbTklF3VzZvf/xma7/tyXOVv/vBr/M2Ys5wmFfSwk6kiFu7SuHk
	OjY6qlj+3x2qYYQJ9xNlOvTpLwGikpEwTVH
X-Received: by 2002:a17:902:c94a:b0:2ca:53e1:b915 with SMTP id d9443c01a7336-2d3b0c48633mr217526625ad.14.1786936402761;
        Sun, 16 Aug 2026 20:13:22 -0700 (PDT)
Received: from [172.20.10.2] (111-71-66-151.emome-ip.hinet.net. [111.71.66.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3ae50bef1sm28371735ad.0.2026.08.16.20.13.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2026 20:13:22 -0700 (PDT)
Message-ID: <934a4c11-99a6-2c97-5d12-6aa8da2e64f2@gmail.com>
Date: Mon, 17 Aug 2026 11:10:56 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, krzk+dt@kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com
References: <20260813064327.1127236-1-YLCHANG2@nuvoton.com>
 <20260813064327.1127236-3-YLCHANG2@nuvoton.com>
 <d57c05ce-929e-441f-b02a-2e1598a06ee7@sirena.org.uk>
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <d57c05ce-929e-441f-b02a-2e1598a06ee7@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/14/26 00:20, Mark Brown wrote:
> On Thu, Aug 13, 2026 at 02:43:27PM +0800, Neo Chang wrote:
>> Add support for the Nuvoton NAU83G60 audio codec. The NAU83G60 is a
>> stereo 30W+30W smart amplifier with an integrated low-latency
>> Advanced Audio DSP.
>> +int nau8360_dsp_init(struct snd_soc_component *cp)
>> +{
>> +	struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
>> +	int i, ret;
>> +
>> +	for (i = 0; i < NAU8360_DSP_FW_NUM; i++) {
>> +		ret = nau8360_dsp_chan_kcs_setup(cp, nau8360->dsp_firmware[i], nau8360_dsp_addr[i]);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
> Should this or the binding parsing code do something about PBTL mode,
> the binding says that the left DSP firmware is ignored in PBTL mode but
> this looks like it will still try to load the firmware.
In PBTL mode, both the left and right channels must load firmware.
However, the right channel will be the primary channel
(meaning the left channel also needs firmware, but its actual data 
content should be identical to the right channel).
I will update the yaml binding documentation in v9 to clarify that both 
firmware files must be provided and loaded in PBTL mode,
removing the statement that the left firmware is ignored.
>
>> +static int nau8360_peq_coeff_get(struct snd_kcontrol *kcontrol,
>> +	struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
>> +	struct snd_soc_component *cp = snd_kcontrol_chip(kcontrol);
> This is registered as a regular kcontrol so should get the DAPM context
> with snd_soc_component_to_dapm().  Same for _put().
Thank you for pointing this out.
I will update both the _get() and _put() functions in v9 to properly 
retrieve the DAPM context using
snd_soc_component_get_dapm().
>
>> +	if (snd_soc_dapm_get_bias_level(dapm) > SND_SOC_BIAS_STANDBY) {
>> +		dev_dbg(nau8360->dev, "PEQ access is not allowed during playback");
>> +		return 0;
>> +	}
> What happens if something starts playback simultaneously with this?
> Nothing stops playback starting before we start accessing the registers.
> The check will also fail if we've got an active capture stream, IIUC
> we shouldn't have one without playback since it's an amplifier and
> that's presumably for DSP feedback but at least the docs should be
> clearer.
Due to a hardware limitation, the PEQ registers cannot be updated while 
audio is active.
To prevent playback from starting simultaneously, should we add a lock 
mechanism across the PEQ _put(), _get(), and PCM _startup()?
Also, I will add inline comments regarding the capture stream and update 
the debug message to 'while audio is active'.
>
>> +static int nau8360_hv_pre_event(struct snd_soc_dapm_widget *w,
>> +	struct snd_kcontrol *kcontrol, int event)
>> +{
>> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
>> +
>> +	if (SND_SOC_DAPM_EVENT_OFF(event)) {
>> +		snd_soc_component_update_bits(component, NAU8360_R9C_HW1_CTL2,
>> +			NAU8360_HW1_CH_MUTE, NAU8360_HW1_CH_MUTE);
>> +		snd_soc_component_update_bits(component, NAU8360_R99_HW2_CTL9,
>> +			NAU8360_HW2_CH_MUTE, NAU8360_HW2_CH_MUTE);
>> +	}
>> +
>> +	return 0;
>> +}
> This is registered as a SND_SOC_DAPM_PRE() so it'll run for capture
> streams too.  That's probably not the end of the world since IIUC that's
> only used for speaker protection data but it's still fun?
You are right. To avoid this unintended behavior during capture-only 
streams,
I will remove the global SND_SOC_DAPM_PRE and SND_SOC_DAPM_POST widgets 
in v9.
I will move the event_on/event_off logic directly into the 
nau8360_hv_event (Class D) widget
to ensure it is only executed during the playback path.
