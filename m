Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3B423BCED
	for <linux-sound@vger.kernel.org>; Mon, 22 Jun 2026 06:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782108780; cv=none; b=eCtGiFtVlFEK5a/pF2YZqPuDM2i4gaJXRUapi+lpqsBELHyqCUSjyGKlDQkNEJfiGSo7ajqL5xgB6A9hudmQ8BLAgWJGdXoDX8Vo5yCh/mQtC0eAvw+YhjGmLII5yEvH54WZAaWc1PG2U/jVQa/MeYxIbtoiAN9aenP+rOOe89Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782108780; c=relaxed/simple;
	bh=eDoh/ddr71tTiTAsz9lGWJznKwWwsbZubmQFSPqALL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RU0x+SiZXWP+96liPP8Uf486IU6ql50diLWTvP9N/ZN1WlujYwID9oo9xhuAFmzcMClorQRip5XJb00VwTeg1ZMjkQpxv0nMaHwksZJaIXnQHEteBFC1YIpmVuUbOkPIhzbXLHFdaFPCXXs7bT1TFY2brVP7zUfDrmLAGk1ctF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jv/4hS1R; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jv/4hS1R"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c77d52bec4so4321775ad.1
        for <linux-sound@vger.kernel.org>; Sun, 21 Jun 2026 23:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782108778; x=1782713578; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RjZ6ir0ehE41+u9OZdoJp7dueeLzNjdukrB7MYQcffE=;
        b=jv/4hS1ROw+TnHsH4m9f8Dfthygp2/8YXXf3v/ct7sHcc4ZUvCcY2rMY8lW3L/2kae
         lAhtDO3TN/PhQAHryQD60XyeVPwgTnWsAF0tm0w9FXAfy9cB3DXFVYlsNL0gfwhTiZDW
         oF6tDMZPbEvX4ZaB6FN1R6eVODIxJzSX7p91iysa1Z6lnEbl4DoqqbedGCAN24cdXOf8
         VKf56StQNb1dLXX28IDibEErsFwafl1EjwZrTirOk0F/dXapHN4xWJkFrCqCW5WI/SQD
         wibZjdmrhddD7ff84l7EK+bCYnCXkPzhmhYpyIkCBIKBrMyj5Z/lxh0Mq8+TKYFqOfPG
         1/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782108778; x=1782713578;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RjZ6ir0ehE41+u9OZdoJp7dueeLzNjdukrB7MYQcffE=;
        b=Qtkilg9XG8d8+ksnL93qxBGBVQZqzt7Q5s6YpRoI3FxxNJWldFEuc2qD4D9l04ITBb
         rIdBdrjyLzo7qfWuGkzFi6ut6V3LxsHKGimm7V6Nur3kuYcuYrzv3LKvgxaXDHh4Rf0F
         oEoJEh+HksbGYFBSGOS7S0Z1yUZEJYlH9sgqZxfnq07FM5cfDvL2kT5r5f/xTjnAlaGj
         6jfN4EKwkXPgV2lIrKGx9sZBdwt/pcIqMsZgz9f29mqKJfJ8pMld98MpaefxrQo4VuqJ
         VYArHVnhlZBRT87CgwzzcjcUBgGaOM3lW2fxsMVo5GkhVOl+EsbmhonxnlHfihQvpwF5
         S/3w==
X-Forwarded-Encrypted: i=1; AHgh+RqxonDbNqtXT72jbz+JaDfPw2iURBPbSAJp1tT+X0t71jBh4fxzRTuwTGOfLKSCWz9O0v3EYzULDDB9Bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgCeoaY5lOZJFyy546NlwSLD98wQ95ZLp2jqN7wup0QdUMI0RZ
	r3Ue9DmbBQSUcwOoxrB1nu4qEL9jRO+KH9VSj9ShYU/kDvqAl5OICKtF
X-Gm-Gg: AfdE7cmgO5qLHunkQ1Ru7clJgg+9M5Ze0gLbLmVO7p3kgRmPm+eyRE5O22Cf6A1i0l8
	il8uPoWYLQ/0brP2LiJHjuHtwQbP+Oy9+/46zfosLhl0Bk8KPXMcpm5Tdkp6B9FURkM3XXkx/4d
	BTeYJkllQrdml4v4pGSv5tHjO1AhPM6STgeT5po5V06AiYxCKR8fARDGDz184FEjepBF7dPDxwV
	9VdzGD+s+gMvfnvWptYvWHFwG6Y/qkNbKoofL0e3UEw4n5WuZziUCG6unwyw6hzN3xN/wWhtjwb
	U0ZtD74opiZ+SG/xWvHn4L0s8r6uRpW9ob5fkz4n5iaXFg/diIkV4ynXGM0vtLRrxoZjL9oANpZ
	0ixkRgmI35MXIdInQb+Z5qzCg/uYMZq40xdr4YWKB4MKse7ZqGBrP42rrocFm8CCsuHHbyoxWcq
	KLTwnOZZVHRjbXrUZeMRigFmX9BxM2yEm4Dw9b0YQmUUwS
X-Received: by 2002:a17:902:e945:b0:2c0:b31b:b19 with SMTP id d9443c01a7336-2c7195f3973mr110771195ad.21.1782108778242;
        Sun, 21 Jun 2026 23:12:58 -0700 (PDT)
Received: from [172.20.10.3] (42-79-6-161.emome-ip.hinet.net. [42.79.6.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f8e81sm64842865ad.52.2026.06.21.23.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 23:12:57 -0700 (PDT)
Message-ID: <8c45d9eb-6267-0333-ab49-aaf55d9611c8@gmail.com>
Date: Mon, 22 Jun 2026 14:12:52 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, krzk+dt@kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com,
 Mark Brown <broonie@kernel.org>
References: <20260609024128.585938-1-YLCHANG2@nuvoton.com>
 <20260609024128.585938-3-YLCHANG2@nuvoton.com>
 <329cf637-786d-4fee-9c63-b8e73827b330@intel.com>
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <329cf637-786d-4fee-9c63-b8e73827b330@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/9/26 17:49, Cezary Rojewski wrote:
> On 6/9/2026 4:41 AM, Neo Chang wrote:
>> Add support for the Nuvoton NAU83G60 audio codec. The NAU83G60 is a
>> stereo 30W+30W smart amplifier with an integrated low-latency
>> Advanced Audio DSP.
>
> Hi Neo,
>
> I've provided a number of possible improvements and nitpicks which 
> scale for the entire file - not just the occurrences I've 
> highlighted.  In general, it's hard to follow the code.  A lot of 
> arithmetics bundled together with limited 
> spacing/comments/self-explanatory names.  Sheer number of 
> if-statements and brackets does not help either.
>
> There seem to be quite a bit of defensive programming here too - 
> checks just to print a message.  I'd suggest to enlist event tracing 
> and log the TX/RX communication unconditionally.  Would eliminate the 
> need for many of prints found here.
Hi Cezary,
Thank you for the detailed review and the valuable suggestions regarding 
the code structure, readability, and coding style.
I will apply these suggestions in v5 to make the code easier to follow. 
Regarding the defensive programming, I will drop those redundant print 
checks.
If necessary, I will consider adding event tracing for TX/RX in a future 
patch.

>
>> +static int nau8360_reply_from_dsp(struct snd_soc_component *component,
>> +    const struct nau8360_cmd_info *cmd_info, int data_size,
>> +    void *data, unsigned short dsp_addr)
>> +{
>> +    struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
>> +    struct device *dev = component->dev;
>> +    unsigned int payload, *data_buf;
>> +    int i, j, ret, frag_len, frag_payload_len, len_pos, pad_len, 
>> pad_len_exp;
>> +    int data_count = 0;
>
> 13 local variables.  Does not look good.  I'd try to refactor this 
> one. Ask yourself - what's the (one) goal this function shall 
> achieve.  It's clear that currently it does more than one thing e.g.: 
> performs validation of the payload.  The validation could be moved 
> into a separate function.
I will refactor this function and extract the logic into a separate 
helper function to simplify this and reduce the number of local 
variables in v5.
>
>> +
>> +    if (!cmd_info->reply_data) {
>> +        dsp_dbg(dev, "The cmd without reply data!!");
>> +        ret = nau8360_dsp_replied(nau8360, &frag_len, dsp_addr);
>> +        if (ret)
>> +            goto err;
>> +        else if (!frag_len)
>> +            goto done;
>
> No need for 'else if', 'if' suffices.
I will change this to a simple 'if' in v5.
>
>> +    }
>> +
>> +    if (!data) {
>> +        ret = -EINVAL;
>> +        goto err;
>> +    }
>> +    data_buf = (unsigned int *)data;
>> +
>> +    ret = nau8360_dsp_replied(nau8360, &frag_len, dsp_addr);
>> +    if (ret)
>> +        goto err;
>> +    else if (!frag_len)
>> +        goto done;
>
> Ditto.
Ditto, will update to a simple 'if' in v5.
>
>> +
>> +    frag_payload_len = frag_len - 1;
>> +    if (cmd_info->msg_param)
>> +        data_count = data_size;
>> +    for (i = 0; i < frag_payload_len; i++) {
>> +        ret = regmap_read(nau8360->regmap, dsp_addr, &payload);
>> +        if (ret) {
>> +            dev_err(dev, "failed to read payload of dsp");
>> +            goto err;
>> +        }
>> +        if (cmd_info->msg_param) {
>> +            if (data_count >= NAU8360_DSP_DATA_BYTE) {
>> +                *data_buf++ = payload;
>> +                data_count -= NAU8360_DSP_DATA_BYTE;
>> +                payload_read(dev, payload);
>> +            } else {
>> +                for (j = 0; j < NAU8360_DSP_DATA_BYTE; j++) {
>> +                    if (data_count <= 0)
>> +                        break;
>> +
>> +                    ((u8 *)data_buf)[j] = (payload >> (j * 8)) & 0xff;
>> +                    data_count--;
>> +                }
>> +                payload_read(dev, payload);
>> +                break;
>> +            }
>> +        } else {
>> +            *data_buf = payload;
>> +            payload_read(dev, payload);
>> +        }
>> +    }
>> +
>> +    /* check the reply length same as request */
>> +    if (data_count && (cmd_info->cmd_id == 
>> NAU8360_DSP_CMD_GET_KCS_RSLTS ||
>> +            cmd_info->cmd_id == NAU8360_DSP_CMD_GET_KCS_SETUP)) {
>> +        dev_warn(dev, "payload_len %d, expected %d",
>> +            data_size - data_count, data_size);
>> +    }
>> +    dsp_dbg(dev, "reading trailing fragment");
>> +    ret = regmap_read(nau8360->regmap, dsp_addr, &payload);
>> +    if (ret) {
>> +        dev_err(dev, "failed to read trailing fragment");
>> +        goto err;
>> +    }
>> +
>> +    len_pos = payload & 0xff;
>> +    len_pos |= ((payload >> 8) & 0xc0) << 2;
>> +    if (len_pos != frag_len) {
>> +        dev_err(dev, "LEN_POST %02X, expect %02X", len_pos, frag_len);
>> +        ret = -EPROTO;
>> +        goto err;
>> +    }
>> +
>> +    pad_len = ((payload >> 8) & 0x30) >> 4;
>> +    if (cmd_info->msg_param)
>> +        pad_len_exp = frag_payload_len * NAU8360_DSP_DATA_BYTE -
>> +            (data_size - data_count);
>> +    else
>> +        pad_len_exp = 0;
>> +    if (pad_len != pad_len_exp) {
>> +        dev_err(dev, "PAD_LEN %02X, expect %02X", pad_len, 
>> pad_len_exp);
>> +        ret = -EPROTO;
>> +        goto err;
>> +    }
>> +    dsp_dbg(dev, "LEN_POST 0x%x, PAD_LEN 0x%x", len_pos, pad_len);
>> +    payload_read(dev, payload);
>> +done:
>> +    return 0;
>> +err:
>> +    dev_err(dev, "DSP reply error %d !!!", ret);
>> +    return ret;
>> +}
>
> ...
>
>> +int nau8360_dsp_init(struct snd_soc_component *component)
>> +{
>> +    dev_info(component->dev, "DSP initializing...");
>> +    return nau8360_dsp_set_kcs_setup(component);
>> +}
>
> Do we need a function that just inlines to nau8360_dsp_set_kcs_setup() 
> except for a single print?  Doubt so.
I will repurpose this function in v5. nau8360_dsp_init() will now handle 
the core DSP initialization logic and
wait for the firmware loading to complete.
>
> ...
>
>> +static int nau8360_adacl_event(struct snd_soc_dapm_widget *w,
>> +    struct snd_kcontrol *kcontrol, int event)
>> +{
>> +    struct snd_soc_component *component = 
>> snd_soc_dapm_to_component(w->dapm);
>> +
>> +    if (SND_SOC_DAPM_EVENT_ON(event))
>> +        snd_soc_component_update_bits(component, NAU8360_R6E_DAC_CFG0,
>> +            NAU8360_PD_DACL_DIS, 0);
>> +
>> +    return 0;
>> +}
>> +
>> +static int nau8360_adacr_event(struct snd_soc_dapm_widget *w,
>> +    struct snd_kcontrol *kcontrol, int event)
>> +{
>> +    struct snd_soc_component *component = 
>> snd_soc_dapm_to_component(w->dapm);
>> +
>> +    if (SND_SOC_DAPM_EVENT_ON(event))
>> +        snd_soc_component_update_bits(component, NAU8360_R6E_DAC_CFG0,
>> +            NAU8360_PD_DACR_DIS, 0);
>> +
>> +    return 0;
>> +}
>> +
>> +static int nau8360_dacl_event(struct snd_soc_dapm_widget *w,
>> +    struct snd_kcontrol *kcontrol, int event)
>> +{
>> +    struct snd_soc_component *component = 
>> snd_soc_dapm_to_component(w->dapm);
>> +
>> +    if (SND_SOC_DAPM_EVENT_OFF(event))
>> +        snd_soc_component_update_bits(component, NAU8360_R6E_DAC_CFG0,
>> +            NAU8360_PD_DACL_DIS, NAU8360_PD_DACL_DIS);
>> +
>> +    return 0;
>> +}
>> +
>> +static int nau8360_dacr_event(struct snd_soc_dapm_widget *w,
>> +    struct snd_kcontrol *kcontrol, int event)
>> +{
>> +    struct snd_soc_component *component = 
>> snd_soc_dapm_to_component(w->dapm);
>> +
>> +    if (SND_SOC_DAPM_EVENT_OFF(event))
>> +        snd_soc_component_update_bits(component, NAU8360_R6E_DAC_CFG0,
>> +            NAU8360_PD_DACR_DIS, NAU8360_PD_DACR_DIS);
>> +
>> +    return 0;
>> +}
>
> Refactor the above four functions - you could create a wrapper to 
> lower LOCs without huring the readability.  If you prefer, instead of 
> a one-for-four, you could have one "positive" wrapper (handles 
> EVENT_ON cases) and a "negative" one (handles EVENT_OFF cases).
I will refactor these into a common function to reduce LOC in v5.
>
> ...
>
>> +static int nau8360_codec_probe(struct snd_soc_component *component)
>> +{
>> +    struct snd_soc_dapm_context *dapm = 
>> snd_soc_component_to_dapm(component);
>> +    struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
>> +    struct regmap *regmap = nau8360->regmap;
>> +    struct device *dev = nau8360->dev;
>> +    int ret, vbat, vsaw_level, vsaw_slope;
>> +
>> +    nau8360->dapm = dapm;
>> +    nau8360_coeff_set_def(nau8360);
>> +    ret = nau8360_dsp_setup(component);
>> +    if (ret)
>> +        goto err;
>> +
>> +    ret = nau8360_dsp_setup_controls(component);
>> +    if (ret) {
>> +        nau8360_dsp_enable(regmap, false);
>> +        dev_err(dev, "DSP setup controls failed(%d)", ret);
>> +        goto err;
>> +    }
>> +
>> +    /* default disable Sense signal after booting */
>> +    snd_soc_dapm_disable_pin(nau8360->dapm, "Sense");
>> +    snd_soc_dapm_sync(nau8360->dapm);
>> +
>> +    /* VBAT is sensed by chip. */
>> +    ret = nau8360_vbat_level(regmap, &vbat);
>> +    if (ret) {
>> +        dev_err(dev, "Failed to get valid VBAT level: %d\n", ret);
>> +        goto err;
>> +    }
>> +    dev_dbg(dev, "VBAT %dV for nau8360", vbat);
>> +
>> +    /* Config sawtooth clock according to VBAT. Class D modulator 
>> input short setting
>> +     * for mute and de-pop purpose. Restore normal after initiation.
>> +     */
>> +    ret = nau8360_sawtooth_params(vbat, &vsaw_level, &vsaw_slope);
>> +    if (ret) {
>> +        dev_err(dev, "can't get sawtooth clock parameters (%d)", ret);
>> +        goto err;
>> +    }
>> +    regmap_update_bits(regmap, NAU8360_RA5_ANA_REG_1, 
>> NAU8360_VSAW_LV_MASK |
>> +        NAU8360_KVCO_SAW_MASK, (vsaw_level << NAU8360_VSAW_LV_SFT) |
>> +        (vsaw_slope << NAU8360_KVCO_SAW_SFT));
>> +
>> +    return 0;
>> +err:
>> +    return ret;
>
> Why are we using the goto here if there is no unwinding found within 
> the error path?  Either you've forgotten to add the unwinding or the 
> goto is redundant.
>
> Repeat for all the functions with similar behavior found in this file.
I will drop the redundant 'goto err' and return the error code directly 
across the entire file in v5.
>
>> +}
>> +
>> +static int __maybe_unused nau8360_suspend(struct snd_soc_component 
>> *component)
>> +{
>> +    struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
>> +
>> +    regmap_update_bits(nau8360->regmap, NAU8360_R90_HW2_CTL0, 
>> NAU8360_HW2_STALL,
>> +        NAU8360_HW2_STALL);
>> +    nau8360_dsp_enable(nau8360->regmap, false);
>> +    regcache_cache_only(nau8360->regmap, true);
>> +    regcache_mark_dirty(nau8360->regmap);
>> +
>> +    return 0;
>> +}
>> +
>> +static int __maybe_unused nau8360_resume(struct snd_soc_component 
>> *component)
>> +{
>> +    struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
>> +    struct regmap *regmap = nau8360->regmap;
>> +    int ret;
>> +
>> +    regcache_cache_only(regmap, false);
>> +    nau8360_peq_mem_enable(regmap, true);
>> +    regcache_sync(regmap);
>> +    nau8360_peq_mem_enable(regmap, false);
>> +
>> +    /* disable Sense at standby */
>> +    snd_soc_dapm_disable_pin(nau8360->dapm, "Sense");
>> +    snd_soc_dapm_sync(nau8360->dapm);
>> +
>> +    ret = nau8360_dsp_setup(component);
>> +    if (ret)
>> +        goto err;
>
> Drop the goto, no error handling here.
I will drop the redundant goto here in v5.
>
>> +
>> +    return 0;
>> +err:
>> +    return ret;
>> +}
>
> ...
>
>> +static int nau8360_reg_write(void *context, unsigned int reg, 
>> unsigned int value)
>> +{
>> +    struct i2c_client *client = context;
>> +    int ret, count = 0;
>> +    u8 buf[6];
>> +
>> +    buf[count++] = reg >> 8;
>> +    buf[count++] = reg & 0xff;
>> +    if (reg != NAU8360_RF000_DSP_COMM && reg != 
>> NAU8360_RF002_DSP_COMM) {
>
> Refactor to positive a check.  Positive checks are easier to follow 
> and as long as there is no major impact on complexity of the code that 
> follows, there is no reason to hurt readability.
I will refactor this to a positive check for better readability in v5.
>
>> +        /* format for Codec, 2 bytes value and endian big */
>> +        buf[count++] = value >> 8;
>> +        buf[count++] = value & 0xff;
>> +        dev_dbg(&client->dev, " %x <= %x", reg, value);
>> +    } else {
>> +        /* format for DSP, 4 bytes value and native */
>> +        buf[count++] = value & 0xff;
>> +        buf[count++] = (value >> 8) & 0xff;
>> +        buf[count++] = (value >> 16) & 0xff;
>> +        buf[count++] = (value >> 24) & 0xff;
>> +    }
>> +
>> +    ret = i2c_master_send(client, buf, count);
>> +    if (ret == count)
>> +        return 0;
>> +    else if (ret < 0)
>> +        return ret;
>> +    else
>> +        return -EIO;
>
> No need for 'else if', 'if' suffices.  And the 'else' can be dropped.
I will change 'else if' to 'if' and drop the 'else' branches in v5.
>
>> +}
>
> ...
>
>> +static struct reg_default *nau8360_alloc_defaults(struct device 
>> *dev, int *total_regs)
>> +{
>> +    struct reg_default *dyn_defaults;
>> +    int reg_num = ARRAY_SIZE(nau8360_reg_defaults);
>> +    int total = reg_num + (2 * NAU8360_TOT_BAND_PER_CH * 
>> NAU8360_TOT_BAND_COE);
>> +    int i, j, idx;
>> +
>> +    dyn_defaults = devm_kzalloc(dev, total * sizeof(*dyn_defaults), 
>> GFP_KERNEL);
>> +    if (!dyn_defaults)
>> +        return NULL;
>> +
>> +    memcpy(dyn_defaults, nau8360_reg_defaults, sizeof(*dyn_defaults) 
>> * reg_num);
>> +    idx = reg_num;
>> +
>> +    for (i = 0; i < NAU8360_TOT_BAND_PER_CH; i++) {
>> +        unsigned int l_base = NAU8360_R100_LEFT_BIQ0_COE +
>> +                    (i * NAU8360_TOT_BAND_COE_RANGE);
>> +        unsigned int r_base = NAU8360_R200_RIGHT_BIQ0_COE +
>> +                    (i * NAU8360_TOT_BAND_COE_RANGE);
>
> Just add a local:
>     unsigned int range = i * NAU8360_TOT_BAND_COE_RANGE;
> to simplify the code.
I will add this local variable to simplify duplicated arithmetic in v5.
>
>> +
>> +        for (j = 0; j < NAU8360_TOT_BAND_COE; j++) {
>> +            dyn_defaults[idx++].reg = l_base + j;
>> +            dyn_defaults[idx++].reg = r_base + j;
>> +        }
>> +    }
>> +
>> +    *total_regs = total;
>> +
>> +    return dyn_defaults;
>> +}
>> +
>> +static int nau8360_i2c_probe(struct i2c_client *i2c)
>> +{
>> +    struct device *dev = &i2c->dev;
>> +    struct nau8360 *nau8360 = dev_get_platdata(dev);
>> +    struct regmap_config regmap_cfg = nau8360_regmap_config;
>> +    struct reg_default *dyn_defaults;
>> +    int num_total_regs;
>> +    int i, ret, value;
>> +
>> +    if (!nau8360) {
>
> What?  This seems redundant.
I will drop the dev_get_platdata() check in v5.
>
>> +        nau8360 = devm_kzalloc(dev, sizeof(*nau8360), GFP_KERNEL);
>> +        if (!nau8360)
>> +            return -ENOMEM;
>> +    }
>> +    i2c_set_clientdata(i2c, nau8360);
>> +    mutex_init(&nau8360->lock);
>> +
>> +    dyn_defaults = nau8360_alloc_defaults(dev, &num_total_regs);
>> +    if (!dyn_defaults)
>> +        return -ENOMEM;
>> +
>> +    regmap_cfg.reg_defaults = dyn_defaults;
>> +    regmap_cfg.num_reg_defaults = num_total_regs;
>> +
>> +    nau8360->regmap = devm_regmap_init(dev, NULL, i2c, &regmap_cfg);
>> +    if (IS_ERR(nau8360->regmap))
>> +        return PTR_ERR(nau8360->regmap);
>> +    nau8360->dev = dev;
>> +
>> +    nau8360_reset_chip(nau8360->regmap);
>> +    ret = regmap_read(nau8360->regmap, NAU8360_R46_I2C_DEVICE_ID, 
>> &value);
>> +    if (ret) {
>> +        dev_err(dev, "Failed to read NAU83G60 device id %d",
>> +            ret);
>
> No need for a new line here, you won't exceed the recommended char limit.
I will format this into a single line in v5.
>
>> +        return ret;
>> +    }
>> +
>> +    for (i = 0; i < NAU8360_TDM_TXN; i++)
>> +        nau8360->tdm_tx_func_slot[i] = TDM_SLOT_NONE;
>> +    for (i = 0; i < NAU8360_TDM_RXN; i++)
>> +        nau8360->tdm_rx_func_slot[i] = TDM_SLOT_NONE;
>> +    nau8360->tdm_chan_len = 32;
>
> Either use constant or comment any use of hardcodes.
I will define a macro constant for this value in v5.
>
>> +    ret = nau8360_read_device_properties(nau8360);
>> +    if (ret)
>> +        return ret;
>> +
>> +    nau8360_print_device_properties(nau8360);
>> +    nau8360_init_regs(nau8360);
>> +
>> +    return devm_snd_soc_register_component(dev, 
>> &soc_comp_dev_nau8360, &nau8360_dai, 1);
>> +}
>> +
>> +static const struct i2c_device_id nau8360_i2c_ids[] = {
>> +    { "nau8360", 0 },
>> +    { }
>
> Please match the style of existing entires.  Checkout Mark's for-next 
> to be up-to-date with recommended style or see commit 910714d4e79b 
> ("ASoC: Use named initializers for arrays of i2c_device_data").
>
> [1]: 
> https://patch.msgid.link/ae2ff4898eb340bd8bcafb7b75443eb4a0ce3e76.1778692164.git.u.kleine-koenig@b
> aylibre.com
I will update the array to use named initializers to match the current 
standard in v5.
>
>> +};
>> +MODULE_DEVICE_TABLE(i2c, nau8360_i2c_ids);
>> +
>> +#ifdef CONFIG_OF
>> +static const struct of_device_id nau8360_of_ids[] = {
>> +    { .compatible = "nuvoton,nau8360", },
>> +    {}
>
> Ditto.  Sidenote: you've used a different style then for the i2c table.
  I will fix the style to be consistent in v5.
>
>> +};
>> +MODULE_DEVICE_TABLE(of, nau8360_of_ids);
>> +#endif
>> +
>> +#ifdef CONFIG_ACPI
>> +static const struct acpi_device_id nau8360_acpi_match[] = {
>
> struct acpi_device_id is available even if CONFIG_ACPI is disabled.  
> Not sure if we even need preproc #ifdef here.  Remove it and do some 
> compilation checks.
I will remove the #ifdef wrapper and verify the build works with and 
without CONFIG_ACPI in v5.
>
>> +    {"NVTN2002", 0,},
>> +    {},
>
> Ditto.  Sidenote: you've used a different style then for the i2c and 
> the of table.
I will fix the style to be consistent in v5.
>
>> +};
>> +MODULE_DEVICE_TABLE(acpi, nau8360_acpi_match);
>> +#endif
>> +
>> +static struct i2c_driver nau8360_i2c_driver = {
>> +    .driver = {
>> +        .name = "nau8360",
>> +        .of_match_table = of_match_ptr(nau8360_of_ids),
>> +        .acpi_match_table = ACPI_PTR(nau8360_acpi_match),
>
> Does this compile if I disable e.g.: CONFIG_ACPI ?
I will confirm the build works successfully with CONFIG_ACPI disabled in v5.
>
>> +    },
>> +    .probe = nau8360_i2c_probe,
>> +    .id_table = nau8360_i2c_ids,
>> +};
>> +module_i2c_driver(nau8360_i2c_driver);
