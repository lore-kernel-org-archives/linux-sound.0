Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1833B83FB
	for <linux-sound@vger.kernel.org>; Fri, 29 May 2026 08:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780044558; cv=none; b=Ijko1Ey6mguKSquqQVD/JqEY+3U4Uv4ygIczUJqKvTjupmwYTgGwhz/o9CkxA7t7GjWcI6M3tlcQLJOqsf+AIgnm40s/OxrfLuMQMyx0depcNyeY2vaPWaU3ZSF3gInmau7Vl/+9fsMVC5toeGYvMzaL6DjCC6KzYjaouWa8G0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780044558; c=relaxed/simple;
	bh=9ueTTfsQM7Cuw9fsa2Mw5zy14prrsOw1dfrs93kRZHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=buyMMfNhxAU9FS0gVK3gT/3xHQ97gu35IzpTkyVpvglBGfJAWH/RwPIV9CBygkgUDkGkHdMJ9mRuc2NhoXi8jpS/mT86V9p8OXcWwUm3bwng/X9akiuFSd3CKHACdoqe8RGJH71ffUaGBB6FSBt1tJ26vjgWwludprAtgxQ6y04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJdTJNkP; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJdTJNkP"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36b9b15af73so1401484a91.0
        for <linux-sound@vger.kernel.org>; Fri, 29 May 2026 01:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780044556; x=1780649356; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QhjoroGKXf9Vnwm4rb6qgzeF8DBjHLvOxd0WaalRzBk=;
        b=ZJdTJNkPywclqp7ovf1fs/qp/yt+uqTj5HYvBH7ouN5xpah9qEZum/m5KVP9Z60MG2
         feXHG3Zwe7w4xw+uo2MLvPzptXRr/Xqi6zfYGS5Emur97wzM93y3wY98wleUiROWWn0X
         0kCxmpfhqo6h1YJ40LUgJie8v/hTciVmx4dYUukNmWBPz07bSVGmtpU9hfk+QbtO+xGf
         sG9i/6KOlt9nKAVTQc4O35Aye1jhWcUdzU9DW9helYAl+jTTiVTy48EYFtO1SwgDOvUa
         OPcIg2bXbxzkYnnZ139BaCxbwORccFtnw0VozX1Y9EDzgwKbV78W2IyRdjzLZuJSqlYV
         g/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780044556; x=1780649356;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QhjoroGKXf9Vnwm4rb6qgzeF8DBjHLvOxd0WaalRzBk=;
        b=ns8QiMa+W8AigKbj5O+H/cpZvt+qCyhyxNlSWTQ/Lmin73TwjO1xcwnCEXCxs9OH+B
         +LMyVeph+sRi2J7tgtYV+rjMUPyQKSMf3NJStWNP4EOEWPIp3E1BcYOqscp18fOdyOAv
         TU9HnIPhVVWxq0nuBPGsx2xELtpg90Oi7Q2kp+jBrE0/0POsXO7wzyoK0hI1qIv3lnGL
         IztE4I8tQcFkPJIl9yxQ3wm0jvU0FBJxvpFCYZPsYjIl84Ge6Y+2wWx+dU1j2nIbR3Fw
         jZNGWTYw8oCvWQr1qv0G01tGX1ueSFCQdcubdl6SsPalOVrCxnM/TPknThYNMXxar/2e
         yJjw==
X-Forwarded-Encrypted: i=1; AFNElJ/RrB8Dr8+FCwj6ejqe8hKqsdIGRVL0xojzjrURnvJy+rDOqeHcuA8QoamIkuRVZHaLoHyQwQzH4SISig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTA6d3CO/pnj0AvOf38wZT4R+UEjmVCYwq1ntubPPceeJRwK+a
	uPtF7ymeD42z6ke6d68eM9FLjjWCTTCzu01Ezh+fj3P84wCN0QlIqjhp
X-Gm-Gg: Acq92OECp78W+zBTbuzHzKYRhidpOM2Pb+BIixUjm3ACpwMo7C1xx0qGXpRHgPbm9Pl
	mvkoAv+3jhPj+t7Lu90SH8VwIP9HyVEN1a/+QkPnzx51kmp3a4JMuyIkbNenKMw/pOtaB1e8pbU
	y1nHSeg9q6RFDqXzueUkXL29vn/CByvP82mLKu4AuPM8SU1w2wiJ6irch/9L2NNP7qYvM/3MVMB
	YVW21LZVnUU4/MaESfiMEwQHJ0RoAyNryfHi+kzomQmWdHusq+KvcBQhYvt4E1utyEmWngUcZkf
	kH7pFg++04rwFJwcYm2WhdSJX63xGeLT9gt8dpwk/FANWIHy7mjSt3e1gpPwF7lueQzpg+FeOWb
	oqMqFjcZo0Jt4ne1UojwF5OrKEFg1swuqrzBUBGnNjp5ry8AN+iGcRLiZW4SF2W9cMw1TpIzb/L
	m+AcOQ4O/qy477RYgtpUN8oiNFstxN5hS3aWdKDFhsgyUmSOPxiGC4MpPBVdqA0Sz8ETgD
X-Received: by 2002:a17:903:32c7:b0:2bf:2e06:2ebf with SMTP id d9443c01a7336-2bf2e062fb8mr2415555ad.31.1780044556442;
        Fri, 29 May 2026 01:49:16 -0700 (PDT)
Received: from [172.20.10.2] (42-79-54-216.emome-ip.hinet.net. [42.79.54.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a21f0bsm10975345ad.34.2026.05.29.01.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 01:49:15 -0700 (PDT)
Message-ID: <1d7a01aa-dd65-129a-c9ac-e24e9b474f8e@gmail.com>
Date: Fri, 29 May 2026 16:49:11 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, krzk+dt@kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com
References: <20260526015826.440769-1-YLCHANG2@nuvoton.com>
 <20260526015826.440769-3-YLCHANG2@nuvoton.com>
 <d4cf4ad9-82fb-4beb-be5b-b3687f822fcf@sirena.org.uk>
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <d4cf4ad9-82fb-4beb-be5b-b3687f822fcf@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/27/26 21:43, Mark Brown wrote:
> On Tue, May 26, 2026 at 09:58:26AM +0800, Neo Chang wrote:
>> Add support for the Nuvoton NAU83G60 audio codec. The NAU83G60 is a
>> stereo 30W+30W smart amplifier with an integrated low-latency
>> Advanced Audio DSP.
> A few things below, you also have a bunch of what look like legitimate
> issues picked up by sashiko (some of which overlap with what I've got
> below):
>
>     https://sashiko.dev/#/patchset/20260526015826.440769-1-YLCHANG2%40nuvoton.com
Regarding the sashiko report, I have a few questions:
Are we required to address every issue caught by sashiko? We found that 
some of them are actually false positives.
If we need to explain our code regarding sashiko's findings, who should 
we send the reply to?
Additionally, is there a way to run the sashiko checks locally before 
submitting our patches?
>
>> +static int nau8360_peq_coeff_get(struct snd_kcontrol *kcontrol,
>> +	struct snd_ctl_elem_value *ucontrol)
>> +{
> ...
>
>> +	snd_soc_component_update_bits(cp, NAU8360_R9D_PEQ_CTL, NAU8360_HW1_MEM_TEST,
>> +		NAU8360_HW1_MEM_TEST);
>> +	for (i = 0; i < params->max / sizeof(u16); i++) {
>> +		value = snd_soc_component_read(cp, reg + i);
>> +		*(val + i) = cpu_to_be16(value);
>> +	}
>> +	snd_soc_component_update_bits(cp, NAU8360_R9D_PEQ_CTL, NAU8360_HW1_MEM_TEST, 0);
>> +
>> +	return 0;
>> +}
>
>> +static int nau8360_peq_coeff_put(struct snd_kcontrol *kcontrol,
>> +	struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	snd_soc_component_update_bits(cp, NAU8360_R9D_PEQ_CTL, NAU8360_HW1_MEM_TEST,
>> +		NAU8360_HW1_MEM_TEST);
> ...
>
>> +	snd_soc_component_update_bits(cp, NAU8360_R9D_PEQ_CTL, NAU8360_HW1_MEM_TEST, 0);
> We use an rwsem to protect the controls from userspace so we could get
> more than one caller in these, you need some driver local locking.
Got it. I will add local lock in v4.
>
>> +static int nau8360_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
>> +	unsigned int rx_mask, int slots, int slot_width)
>> +{
>> +	struct snd_soc_component *cp = dai->component;
>> +	struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
>> +	unsigned int tx_slot_used = 0, rx_slot_used = 0;
>> +	int ret = 0;
>> +
>> +	if (slot_width != 16 && slot_width != 24 && slot_width != 32) {
>> +		dev_err(cp->dev, "Invalid TDM channel length: %d", slot_width);
>> +		return -EINVAL;
>> +	}
> This stops the support for disabling TDM from working, a slot_width is
> required here.
Got it. I will fix this in v4.
