Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB653BCD20
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 06:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785996850; cv=none; b=HAFAo6vhq72FB6JZXzYyX0S9cbQvPQA+2Df411pRTsO8UiheKAA5NyqDGz6mFngZRSO8LeiS+nE+wB+nFBR1ijUXETh8bev0D4N9FwzMSmbzVqZhZohoFAKizPhihBOh+7bpTkZnh/90GwEeT45FvdTUWTwqO143nnJ1eM8hoEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785996850; c=relaxed/simple;
	bh=hrW9L4xaSSpHQn+wFbaOWOl5DjkeO3GEbDUEZZaf9g8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N5DsSWzUMxH3+0cXt1Afd42WUv9dEGDrHiFL2gZ2+SXeCvCxHMT2jN61HXo11jbYBL4mXLQMhNIbFE/HtWtAH+TgOeDULLHJH3b9A/udhhP3QcYvttBP59kKqHK5FuEnm4m90dm12cY76k7NuF2GJtsGyn+qGcWn3QtOWwqRyVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ft+G6f0t; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ft+G6f0t"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-472326ca506so1215205f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 23:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785996845; x=1786601645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OijuLZPhej2SFByujucev5iJJVa0B0Uo0liYiFLXj+Q=;
        b=ft+G6f0tHCb7ugM30sJ+qA9xP/lSlztZ6VWI3NsXzZCwX1KbGyoQuNd4RjSnyIYzHH
         1DrgAd9DZ5tCfUTqu156ZSQ6Tss9gHkWYNNnLLOJXKVF0M4AFHAOKgi6lZFk5E7aTT7p
         cc8XG4/HRAc7B9LwX0pWTcBlkYaD3bBGQpYiWWcj9HLprlGp+nJZYLmN2Qy4iM+LRSG6
         QdHSiB5yM42yKS4ARogHiwxQlBOESx54qjSuwg8wRoQ5L8dsPfGUGpoadfIJlAdRMyIL
         SI3/lcBJV59/gXANnwS/eS9UaPJPJE8jJoOhQ1Hb1UGnpIWTO3e0imyOBTv2BaU6sBqp
         1NeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785996845; x=1786601645;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OijuLZPhej2SFByujucev5iJJVa0B0Uo0liYiFLXj+Q=;
        b=MKntppiisRddN+oZDNLd5ojqbPq0zuiPbI84+P0BxzWlSUFDt7HlPRUDLZcf5rVq1x
         6MgjnYIssrNBkSi8KRQNKBTclzGiX4Q/bQKuu/hsBFgriGdnMTQ40PtTAvrmLj6yAoDg
         YBL61gba2cBfEMqehCnpgxq7H4ID8voLGi5fY+RWPe2Br6PJ8Nm33oGlmYImcu7jlFt4
         W0MR/BloYPmxPxWf/5QB0ekm2N2GLdZA1u5Fcdu1HqVlelOjMgPmWbjbtMvKgvYFWTr4
         73Ie9K5F7hFC6Xnv4g/fO2EFE0X1snOTJaPUt98nBZzKBU8XptixeZRdKzGgqHaJ2q+X
         Z9Tw==
X-Forwarded-Encrypted: i=1; AHgh+RqakKjPjxa9UshykNbXt6A3/7R9JjrXwNpOXhPhAwCuYSEzx6qUZOaXSXjsl5Awxcg1xPFq7en0sCsuyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3w68R3q/ueKocY6gQ0DLC/9PX8tJm5U9cPpuYbSXh1uJV5KsI
	BlB6kDlfSSi8HIbe5t3JmzMdYJ5X87yU63B1Eeb22tQO+l9rwt0O87y44SSi6Q==
X-Gm-Gg: AR+sD103gHgcVjiWmfXIKdaMqBsbaJWUTZgM3A14fjxPB931jXOncTqYjScH65C8P4q
	6UCWq6nm8gEEY+7qielt9E6gJrENp/+856hTGVBO2u3IbpLDqXOUaxvdEeZH1gygqcA5YlfFnRZ
	2fJCJMOxgB7+5mwZ5qxToPHKHUTvMZYL3cJtJ7CfJQ6YQ2AWhzJqH5cvFbWURDFIajiov57pgYU
	9S62Ceszqdm4Fl6Ift4vIt08E8+eYT8jkiePY9+3M0nkwugrD8kuoHCmqlKQ0tK1aNO+lb6vPnr
	Osj2MeswRcaG/FDeMmaGifGsuswUVu9qWlnPf35KVWBPtPfTMRGkRhbCU0BUxxtGbrwLx5iMSKv
	1UUP2iGZzy1ddjtrrX0IoCPCnooWS0sV2b4guC37B5LSeclzFOrnwV6jviZUa206Jb6KsfzLNLs
	S+JtRw6TCkMVCmtgziQb2WGTRjkzGQVb63e6GuldLbqKKm7GjgV8QlCku6KQGqMOREVK6W78Am
X-Received: by 2002:a5d:5e92:0:b0:47f:f87e:6485 with SMTP id ffacd0b85a97d-47ff87e6823mr2586875f8f.15.1785996844697;
        Wed, 05 Aug 2026 23:14:04 -0700 (PDT)
Received: from [192.168.1.10] ([95.43.220.235])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47ff79b32cbsm3465954f8f.10.2026.08.05.23.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 23:14:04 -0700 (PDT)
Message-ID: <75ab739a-b70c-49ab-af90-03d40fc3b5ff@gmail.com>
Date: Thu, 6 Aug 2026 09:14:02 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: core: Support INPUT and OUTPUT DAPM widgets in DT
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260805145625.1290628-1-ivo.g.dimitrov.75@gmail.com>
 <1cddd05b-804b-4d91-a5ff-7c5e07903610@sirena.org.uk>
 <ec5b015a-30b7-4e59-80af-f18da69e4240@gmail.com>
 <f2b01744-69d1-429d-bffc-db0e571665f9@sirena.org.uk>
Content-Language: en-GB
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
In-Reply-To: <f2b01744-69d1-429d-bffc-db0e571665f9@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5.08.26 г. 20:23 ч., Mark Brown wrote:
> On Wed, Aug 05, 2026 at 08:16:10PM +0300, Ivaylo Dimitrov wrote:
> 
>> I have an out-of-tree audio-graph-card2 based machine description for
>> Motorola OMAP4 devices using the CPCAP codec together with an external modem
>> codec. Without modelling the remote endpoint as a DAPM INPUT/OUTPUT widget,
>> the DAPM graph is incomplete and one side of the codec-to-codec link does
>> not become active as expected, so runtime PM does not resume one of the
>> devices in the link during a call.
> 
> Why is it appropriate that the remote endpoint be a raw widget of this
> non-specific type?
> 
>> I used INPUT/OUTPUT because they appear to be the generic DAPM endpoint
>> widgets for this type of digital connection. If there is a more appropriate
>> existing widget type for modelling such a remote DAI endpoint, I'd be happy
>> to use that instead.
> 
> If it's a DAI to DAI link you need a custom machine driver, we don't
> have anything like the infrastructure to put DAI<->DAI links in DT.
> These should be using AIF widgets.

Thanks for the pointer. It turned out that everything needed was already 
there; I had simply misunderstood the codec2codec example (or perhaps it 
could be a bit clearer).

The missing piece was to route the modem DAI stream widgets to the CPCAP 
AIF widgets in the audio-graph-card2 routing:

/* codec2codec */
"Voice RX", "Voice Call Playback",
"Voice Call Capture", "Voice TX";

With that in place, the codec-to-codec DAPM graph is complete and voice 
calls work correctly, so there is no need for my DT parser patch after all.

I'm sending this follow-up mainly as a reference in case someone else 
runs into the same issue in the future.

Thanks again for pointing me in the right direction.

Best regards,
Ivo
