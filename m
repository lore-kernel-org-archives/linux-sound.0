Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14EB3A255F
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 08:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787559991; cv=none; b=C0ZuDl7hjQ3l2SRs/3dZvycPfQcRVIQ9JFeC67NwcdaVzEh5boEXsm/Q02M4sadY28Z4gtD6zQg73wxZZq032HxWDZubUKoN8DF6CM35dv7IhXrXp0wNOZ7sgkvKraFhyGGU6DC3uJzNPaf2/jJY3ARkjmynVAslbEpDMfhRjak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787559991; c=relaxed/simple;
	bh=IcAntOh7IHjex268kpIeIclWRWwYpWZIiIuBC8ontzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rwdeGVCh4tgoxA+f+DN7NwJORQsfldWz0Zf+DbW+dyXlzmNYg6akE0K/7OWzsN7mDxzQmCU3SVkBHTRRzx9hsEmyMCNcoERqTUDDUdqPuXJUUSAopYTBabel7b2ZTjx/4A8hPkCFl2Rbj1Vbs9bzaVgZ/+IgCjmpHCSG37EI3mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jc90ZIBa; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jc90ZIBa"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-382ef647e20so3288178a91.1
        for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 01:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787559989; x=1788164789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zpKY1Gh5ZlUDMT2T5S01JZglILnkty62PxyLVIepUZg=;
        b=Jc90ZIBascInOvgPMJzHBEOPVB4fxX+yb9iDP12frlj8BxM8i0Ii/oXH2P5293/z97
         lvAaeqxMDd64MWMfs7vS9L50mJJVwMjFrbkrtyOhF2a2BCXDXhSXE0XwXiSB00y958Ui
         vBQdVsNjbpGZweoi1aJjVnz/OzcBoBxr9iIG1GkeUU+eBGr8GlsNaYSevrquAjYJSKi/
         ozOvrkkKdVvTnaAdFOX6cIPNp95WEqtcswxDZ4RLCsVGzsumH8KqBza60H9bUnG60bBV
         +JF/oKh6qJnvDthOH6rpuQ7o6n8tQEEyATaiNgPF79YO/gUfTd/i9+MI+CDt7ZZzv/cm
         gSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787559989; x=1788164789;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zpKY1Gh5ZlUDMT2T5S01JZglILnkty62PxyLVIepUZg=;
        b=d+MCv8T8TfjVVCq4ZSCP+A44dFAJVVl/6AUi/UI2FfXUIVW+1Wkh5V7qzVzHn9XgAT
         gm4ugY5GfeNOIW9aX6XMJY7quGp5qkDSlymNha1qz3KY413Ri46KnQwBzJ99lD3hElu1
         HakCnea8DTbVVebJjoKvueeZUfmY+Kq/JM8KDyq2uR/NusN2dWJ2uN6jLb4zQ9I7Q3ws
         rQDkbblzXvN6JzJbTv/XwDCV5OCjSuNsKg7+XYoyU9dGlQfrE1qiJ8KYJA6ioKsM9yse
         Z7itYc9Aj9IFVVB9JxZZsvZuPZD5hwN2OTvgHuyd6Rm+aRLb68YyGiEEMeigjLA1e1aB
         Pocg==
X-Forwarded-Encrypted: i=1; AHgh+Rrm4mQDfap90AKA3I3wwNbYOgOL4gekIxnnSvRya/mBzIBaykjAS6lBQci1X+cNgrKqpl+aXk51a6SS+Q==@vger.kernel.org
X-Gm-Message-State: AFuF++mB3pzFWKvx46jh5fH/uZdLFEXeb/6iO/G7zyyO1yHm8BCzLv6x
	vfITE0CRwcuRGUL3Uab4jA5h1fpo4OAq/Z+WkWeyLiFSty0Q1J1NOSw+ut4x8Q==
X-Gm-Gg: AR+sD11ReFDn8VXdmuqjbj2mIqESBvQTKSCtcnvq/PMGUVKV9x1wOpbIF0/oA5YG9y+
	O7IYN3zbo8J0ZX0300dnq7esJHW+/DJNDdyfPZsQwkkIJYeqvduPaHuGAyxYJV+8UMN9ECHU2Ts
	a5TL9KJKV99L3BzFt80YqHlj17II1OtDgsmXtCODSKJg+w7dg9RuFiq6ZDOyy9ZH1btTGLqnFsB
	5LXEx9v3adB4TqHfZm2VVhCbmXd00UbCQmkwptOac4yObPJ3QBtvXdVVFhUR9AGL8DskNewuVyA
	2ZChjmVW6hae/f10v9DjP5ifyBPl15+ZzHF8+isgn5yQBS2U06XQUp425Nw+HxuYP4qekk4opsp
	YX80wyl7D8jUp7PJK93MiDXF1XuMo0E4PSCpP4HsG7hItcqB7G6vMWwOMGwlXynG+B8hlfUOA9d
	JXP0nnnTE2WP6Ipn4gqw6A+qGzGcCKw3kwn2XVdpPNl5WVS66KPR2zSy1Nz8N5vhNlVrVQA8wbX
	5LTtlrxBkLW/GKZShTRsAQo6y76YFj7Sam/hyXCbnchY/1fIx+91Q0R6mtDLGycELMFQ4P7gOQH
	PfSyiWilDuiJqlfxcOsWba39R53E8w==
X-Received: by 2002:a17:90b:2cc3:b0:392:e5b1:d833 with SMTP id 98e67ed59e1d1-395df29666cmr31573039a91.13.1787559989298;
        Mon, 24 Aug 2026 01:26:29 -0700 (PDT)
Received: from ?IPV6:2001:b400:e3ee:1d2:6c98:a08:2638:bfd9? (2001-b400-e3ee-01d2-6c98-0a08-2638-bfd9.emome-ip6.hinet.net. [2001:b400:e3ee:1d2:6c98:a08:2638:bfd9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e49b4060sm9164143a91.6.2026.08.24.01.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 01:26:26 -0700 (PDT)
Message-ID: <ad5e618f-eff6-4b28-8c9c-456531e6632b@gmail.com>
Date: Mon, 24 Aug 2026 16:26:21 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
To: Mark Brown <broonie@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, krzk+dt@kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com
References: <20260820022925.1174132-1-YLCHANG2@nuvoton.com>
 <20260820022925.1174132-3-YLCHANG2@nuvoton.com>
 <7e7b8329-23d3-495d-ad48-9ea70189c46c@sirena.org.uk>
Content-Language: en-US
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <7e7b8329-23d3-495d-ad48-9ea70189c46c@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/21/26 23:24, Mark Brown wrote:
> On Thu, Aug 20, 2026 at 10:29:25AM +0800, Neo Chang wrote:
>> Add support for the Nuvoton NAU83G60 audio codec. The NAU83G60 is a
>> stereo 30W+30W smart amplifier with an integrated low-latency
>> Advanced Audio DSP.
> A couple of issues here, mostly this looks fine.
Hi Mark, Thanks for the review.
>
>> +static int nau8360_peq_coeff_put(struct snd_kcontrol *kcontrol,
>> +	struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *cp = snd_kcontrol_chip(kcontrol);
>> +	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(cp);
>> +	struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
>> +	struct soc_bytes_ext *params = (void *)kcontrol->private_value;
>> +	int i, reg, ret = 0;
>> +	__be16 *data = NULL;
>> +	bool changed = false;
>> +
>> +	/* Use the DAPM lock to prevent race conditions during DAPM power-up
>> +	 * state transitions, and check component active status to prohibit
>> +	 * PEQ access during active audio streams (playback and capture).
>> +	 */
>> +	snd_soc_dapm_mutex_lock(dapm);
>> +	if (snd_soc_component_active(cp)) {
>> +		dev_dbg(nau8360->dev,
>> +			"PEQ coefficient access is ignored during audio is active");
>> +		goto unlock_dapm;
> This should probably be -EBUSY or something, though that will upset
> mixer-test.  As things stand since the values change when a stream
> starts and stops there should be an event when that happens, and since
> we report success some value ought to be filled in for the read.
I will change the return value to -EBUSY in v10
>
>> +static void nau8360_dsp_fw_load(struct nau8360 *nau8360)
>> +{
>> +	nau8360->load_fw_done = false;
>> +	schedule_work(&nau8360->load_fw_work);
>> +}
>> +static int __maybe_unused nau8360_resume(struct snd_soc_component *component)
>> +{
>> +	struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
>> +	struct regmap *regmap = nau8360->regmap;
>> +	nau8360_dsp_fw_load(nau8360);
> This only kicks off the firmware load, it doesn't wait for it to
> complete.  That means that if a stream restarts quickly after resume we
> will run into issues - I see that the normal playback path just errors
> if we try to start without the firmware.  We should wait, either here or
> in the startup path.
I will add flush_work() in startup() to ensure the firmware loading is 
complete before the stream starts.
>
>> +	if (NAU8360_IS_DSP_REG(reg))
>> +		*value = nau8360->i2c_read_buf[0] |
>> +			(nau8360->i2c_read_buf[1] << 8) |
>> +			(nau8360->i2c_read_buf[2] << 16) |
>> +			(nau8360->i2c_read_buf[3] << 24);
> get_unaligned_le32()?
I will replace the manual bit shifts with the unaligned function in v10.
