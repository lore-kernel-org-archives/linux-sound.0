Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE8538F629
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 07:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742469; cv=none; b=FdBlHThcop5hXoJURQ+/y34i4iD/GK3kZsdk5BIpNNwsWYfEciGSo/UfOjT9FCZTjKmnIa9gLdmXbfQPAT37Ltzk6FMsuGNpaF6JAiWpu3P6N0yCt+gjBLcgx2ZBmdX2tV3yPJpO1xSBHHzQ/02fHF5Uv6a3MGJB9xb7uejqmY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742469; c=relaxed/simple;
	bh=33s6yhLucYMAE2N9t0wyfYGQKp5Yx+BMQFGHVkoLSOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UlhixHlRtfxi/+N9gLlXuQD4+8pnwjVUWIthL8PrwXu1ahtk+rfrP97XKOpoDRNJwy2oTHRUInnCbqkWMp23MF0wpCjd6pct2B4xaTzLQUaJ8HHTdipvS6GmdvIuDl6rbqu1GE4lwRQCJBscF8773p9IP8tMCLte7mSMdCQ/VfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtcFcAQL; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtcFcAQL"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84830c774a0so2906216b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 03 Aug 2026 00:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785742468; x=1786347268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wS4teYo3wuHiEoDKbPYxioZSZwZYOwoqE7Pv/fw4Cwo=;
        b=QtcFcAQLs18zwgQqesPPG6aQcmqHILj1shl/v19RIsEPEag4/eFjG9lZ66C86AMWO9
         oHDdl2j5IGq62NY4mbBKxp1ZjNHcKjFG6jHzmatemZoVUEvBUmh4F14BjzaY/RWR03ti
         AHl40qOYsF96iRftdRtcTTcGH7UjnZ3+W/cet4wzf5h3P+KQ3k6K5hYfn3/uusZuWzIH
         lIvfMo4xdvH8KnqraHifU78by2x+SaGzdiffO0Qwh0dbkr2/dTN2mwJzAajVqJ7JazeH
         3PckZDHlTnsdIUTI+PElhw9J/CyLP5DLkL+RhzClt7gwPjNnFJzfiFrIrHv/FzWAhHyN
         BPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742468; x=1786347268;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wS4teYo3wuHiEoDKbPYxioZSZwZYOwoqE7Pv/fw4Cwo=;
        b=p3viE88h4G66jJ5dKcbXjIjMO0x/Iwgh6EHYJG+AjZ9ObxEazs5+swbT76vMpg1hVp
         mqdtu3eoNJ93eM302rmzYtxnyWeccx8W7sQ7iBZ+Ii236zOuo3GNReYkS3xjHPmkar6J
         irBD5T1RKz3GhiY+7oM18njmCjTxyzjw9pWwSE3k5duS9M2sNO9DwHwubZvpKQc/yMn3
         8sDrt/pIHR/XIEfmxPU74rlDHDVEdJx7+LgdIZI7xPA1SEVd8pgTJiR14S9SKvQ5dP7U
         FMj6O5E9SyvrJt7dNhH8uJaSfWnryNcjMRSwItDfZ/Vl4oK1d6CRWC3yZJ0AwpWmciM4
         LwVA==
X-Forwarded-Encrypted: i=1; AHgh+Rqa4taf1PlW5DWnF4wIJLO607helNJEB89xa8e6/sQFKl2NDaaf1sNykrCiid+hrZv9OwTlp9mmzl+OAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEnI2us1+MNxgz6k+EULQasNRmxIyjARMdEDnTMUeU1tU2aQ6j
	49BQv6MH5ok9L7TCEQdElxtMOi46YAqDvtsBcPHbPEGglsE1ACBue2SU
X-Gm-Gg: AR+sD13r3UA7typ3uJTzzT3eTz9DjJ/+Wa7G0I8+tgWh3UvLVG9WZkl1isSy29Zy8V7
	M4sWCQSogFthhuR4H//WrqbkSe4JPMgSl7mBkc/5Cvb1z1SKxGvAjcuZxCt2G3C2kHBz07iuiMX
	RSWUjHOrVvx2tuNPQ3RsN8ws8EqrD99B+hd0mEmhXmVsXrUBBiURs7T4Iszzr0vLeajXyQOxTKc
	xY3bFunB8RAedOSM2nNR9L1UZvLtkn3iAKK+/l9UpJngDdagDw1UBtZLm00X1vYE8CoU/oOQcPV
	U6n/D3e1HTD3F4vFFubesJM1hT9rx1ZYjK3NJwDqWzsxYKn1o4NTdYSR1Kr5TiF480YAvu06EAD
	AhXLnpqxPUjfQLXKeEGE2AAGaDVDcSFlQG5BN+462pH2zO6kYUfIhfllLnII4FE+cqVpbxVq8lz
	C2tZki293ivnDSnB4+tdz0VPJhQ0o68pQJ/a3/9J1LZZLcWVnZ5Fm4W51OyPnnPGOvK9xo3/6JS
	ewyWmrplnkxyZA7nJzNbuTlyvLM
X-Received: by 2002:a05:6a00:328c:b0:845:e8b5:8c49 with SMTP id d2e1a72fcca58-84ee479afbamr7756583b3a.10.1785742467630;
        Mon, 03 Aug 2026 00:34:27 -0700 (PDT)
Received: from [172.20.10.2] (114-137-58-248.emome-ip.hinet.net. [114.137.58.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd31639sm3320470b3a.9.2026.08.03.00.34.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 00:34:27 -0700 (PDT)
Message-ID: <8af09a82-3d0f-bdf7-5a78-32e2de53c108@gmail.com>
Date: Mon, 3 Aug 2026 15:34:22 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, krzk+dt@kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com
References: <20260708093506.895481-1-YLCHANG2@nuvoton.com>
 <20260708093506.895481-3-YLCHANG2@nuvoton.com>
 <a5139285-2017-4c94-92f2-f87fbef6fa6a@sirena.org.uk>
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <a5139285-2017-4c94-92f2-f87fbef6fa6a@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/9/26 03:11, Mark Brown wrote:
> On Wed, Jul 08, 2026 at 05:35:06PM +0800, Neo Chang wrote:
>> Add support for the Nuvoton NAU83G60 audio codec. The NAU83G60 is a
>> stereo 30W+30W smart amplifier with an integrated low-latency
>> Advanced Audio DSP.
>> +static int nau8360_dsp_chan_kcs_setup(struct snd_soc_component *cp,
>> +       const char *fw_name, int dsp_addr)
>> +       ret = request_firmware_nowait(THIS_MODULE, true,
>> +               fw_name, dev, GFP_KERNEL, ctx, nau8360_dsp_fw_cb);
> This gets run every resume but there's no cleanup so if for some reason
> we get suspend/resumes running back to back and the firmware load
> doesn't complete, or the driver gets removed while the firmware loads
> are pending during normal probe, nothing cancels the firmware loads and
> they might end up completing.  Both suspend and remove should clean up
> anything that's pending.
Got it. We will add a completion mechanism in v7 to ensure the firmware 
load finishes.
>
> There's a bunch of issues reported by Sashiko:
>
>     https://sashiko.dev/#/patchset/20260708093506.895481-1-YLCHANG2%40nuvoton.com
>
> some of which looked valid.
We will review the report from Sashiko and fix the issues in v7 as well.
