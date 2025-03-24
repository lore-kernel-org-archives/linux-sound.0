Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAAA263F37
	for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 16:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742834995; cv=none; b=nLA9JoN2H0D+yLzAa5VbnsFd38AqyyvrFGriYZmx5Tte8EzxViNV4nOlaC/SPB4ZXnfjyWhxv0Hn1dahxy/6V1Fd+DFiUPs0FUFh62h3WcBbgTtIXzwMW1LlEeq0pX6TsaRPKLJ7sbdvd330On+3fZM0b2dNkmHy/R78ZLR3KV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742834995; c=relaxed/simple;
	bh=LviRtfZ2Zkhdvc1v2tQGyN26tUVva3KWP4SpMnY0qFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ku7Fjp+3x8MCyhmJlVDTvMw2EI6027lvXkongqD9q+J3nLvDEG+x1mEgI7R6eZ2pk70RH/FTXYyiCMTijKUC9RhcD3V5wkHClClpux+GjRXitzm3Rq8GTqy5SLsaj746j+aurUBEmkF+shO9uxSGklGRVi2s+4qlhcJOVr8NiQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GByonw+x; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GByonw+x"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43690d4605dso32669795e9.0
        for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 09:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742834991; x=1743439791; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PKZOx3qp50UyeT4k9CXml4Zn6aQsxicd61ejBpyhlHw=;
        b=GByonw+x/a/1AjebGTc6VSwGRiKm7N6ggsMu7tsYjwDCnzPoQ3pTN+GwxNg+BQeKbb
         R4joKHKJNfmX6J4sEklmxh+ZaCVdghWhObGMgPQkCva8cJIUsi+ZtNO4Iu1yabCQ5xBe
         iGBYkJYT18sflhoL5FkDkvAwddFWLehrTTJtGrv5fvCbfQueDreLBYO8aUkGedaY2Q1p
         bqx/BwS2alQ3YIpxljP0GrlRJ/ncNXIoV4c46Ka5SgWsEYaGJAiSg65bc8LI3BXiycWz
         WWc9UNK0u1qN/uzTeZkfZRz+vUJXZBH4hshzOIjTttoMoUqj2+djiYxdfzdBRH3+8AGs
         iRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834991; x=1743439791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PKZOx3qp50UyeT4k9CXml4Zn6aQsxicd61ejBpyhlHw=;
        b=UKOAJyDYIcnI5vJxze5K3YrxkoIWCFpeUcDRyerSg20sRhDh2RXgH2Sv7IonyyWQ31
         amwHj1tf3vYIawd8R4NG4YyvE49hoGf3395Y+2EY7L0toLb8Cfnvky0epncmGayRwYl4
         Ym3iRsfCIMpD+kgyR0GchvUss5+poFW3LesF9SGlfqsCZaGOXO+cZe+jVMlNDD73ue4D
         GOCE+FfJ8IkzeCFuPQNG3ojKJtZ/4fl7Zt6iXi3Dm4iwi7u4/5gcmEH6+Bpukkcnx/Je
         3ylfjvuIwxLOBtIUQbhIaSy3b1f+attr81FfO6uuDUSbQtRDqXqVxgRF+NDYuurhV03l
         +KyA==
X-Forwarded-Encrypted: i=1; AJvYcCVL5cpRkVDArG0YgfKrSaxzJljeQB+0wWecKFk3PMgNMJu+dx8fEVzDUIfyCHbQ+FPVKUZICiyLtUCqAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrgEbKB/zGaOk3tca75HP086tfty4/lTXAkHdUdMGT8Tz9u4Dc
	VYEtTpDBQ/vFoR+J1R58zBnR/9nE3diFiOR6AiaNG9PVjB/eY+s5z5GAUYNGEDs=
X-Gm-Gg: ASbGncs/ZXxXeo//PUBHOeE7Ni/pLpD9ZRxERM1VG3oKY6h6asjfvNfbHvjRj2VRcd2
	dQeBrvyxr3nWDjMyRnnWRn+r4UpavZp0VGvEGaQYa1cpML5ETUv1eOSSvxKzQhu5HW/+61y6Huk
	mw1IQanmdT4+mKPoZaQQb1BHAcSHvAzvx1qwurt3gnbhn1LvWjtxmEBuR44VAz/jbglswrwE3K0
	heI5rMpxXLLg3ckwBN6+VQ5ALybsIe26DBw4WXjmujTyioa5Db1QDEdZVcIT0GLV0Eav3AWYcWe
	nir3WGMM1imHrkJfuvu6Hwtr/o4bYkwfAgJLNDs1XuLL0S7+bFA9tyStZdBsYOpEtipbNGk8mg=
	=
X-Google-Smtp-Source: AGHT+IEgPD+xDa6jr2Is2O2+Xj32Sel7N6UWscGct1y1fK9hAAcLY0xxiUzIYdVwngw880A7Z6/vOw==
X-Received: by 2002:a5d:6da5:0:b0:391:2f71:bbb3 with SMTP id ffacd0b85a97d-3997f958f34mr10938614f8f.46.1742834991401;
        Mon, 24 Mar 2025 09:49:51 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3997f9e6450sm11505850f8f.70.2025.03.24.09.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 09:49:50 -0700 (PDT)
Message-ID: <1f090804-2ad6-4ab4-a6a3-aa5d482f320b@linaro.org>
Date: Mon, 24 Mar 2025 16:49:50 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] ASoC: codecs: wcd938x: add mux control support for
 hp audio mux
To: Peter Rosin <peda@axentia.se>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: broonie@kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
 ivprusov@salutedevices.com, luca.ceresoli@bootlin.com,
 zhoubinbin@loongson.cn, paulha@opensource.cirrus.com, lgirdwood@gmail.com,
 robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, johan+linaro@kernel.org,
 Christopher Obbard <christopher.obbard@linaro.org>
References: <20250324130057.4855-1-srinivas.kandagatla@linaro.org>
 <20250324130057.4855-6-srinivas.kandagatla@linaro.org>
 <CAO9ioeX9RTBAeL3+9STn+=oEYR0wtaF6yoa=esNddEvqLQyO9Q@mail.gmail.com>
 <e4e94fbf-172f-4cfd-becc-cb2836ac1fb1@linaro.org>
 <ctcqkdbv6zh2rabkkr7tlhxlcfsn5nazjfbsnbbu4l4blyakft@pejdsvnazfh6>
 <324d5789-6309-4a64-bbfa-3afa0632e7ff@linaro.org>
 <8fbc8cd7-f8e7-e33b-74df-cdea389ac9a4@axentia.se>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <8fbc8cd7-f8e7-e33b-74df-cdea389ac9a4@axentia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24/03/2025 16:33, Peter Rosin wrote:
> Hi!
> 
> 2025-03-24 at 16:58, Srinivas Kandagatla wrote:
>>
>>
>> On 24/03/2025 15:18, Dmitry Baryshkov wrote:
>>> On Mon, Mar 24, 2025 at 01:58:06PM +0000, Srinivas Kandagatla wrote:
>>>>
>>>>
>>>> On 24/03/2025 13:50, Dmitry Baryshkov wrote:
>>>>> On Mon, 24 Mar 2025 at 15:01, <srinivas.kandagatla@linaro.org> wrote:
>>>>>>
>>>>>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> *snip*
> 
>>>>>> +       int ret = mux_control_try_select(wcd938x->us_euro_mux, state);
>>>>>
>>>>> Hmm. Does this really work? You have selected the mux in probe
>>>>> function, now you are trying to select it again. If I'm reading the
>>>>> code correctly, you will get -EBUSY here.
>>>>
>>>> On successful selection of mux state, the mux will be kept available
>>>> (mux_control_deselect) for any new callers.
>>>>
>>>> So we will not get EBUSY for the second caller.
>>>
>>> No. wcd938x_populate_dt_data() selects the state by calling
>>> wcd938x_select_mux_state().
>>
>> At this point we also released it (both in success and error case).
>>
>> This will hold on to the previous state unless we have defined a fallback idle-state.
>>
>>
>>   Then you call mux_control_try_select() here.
>>> As far as I understand, it will return -EBUSY as the sempahore is > already taken. Moreover, this is not how the MUX API is supposed to be
>>> used. The driver is supposed to hold a state while it is still in use.
> 
> Dmitry is correct. A mux consumer is supposed to keep the mux selected
> while it needs the mux to remain in a certain state. Relying on details
> such as idle as-is and that no other consumer butts in and clobbers the
> state is fragile. Mux access is not exclusive, at least not until a
> mux state is selected.
Thanks Peter,  I agree that its fragile to depend on idle as-is flags.

Will update accordingly.

--srini
> 
> Cheers,
> Peter
