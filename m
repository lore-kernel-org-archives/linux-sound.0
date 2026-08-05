Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526A03D333D
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 21:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785965792; cv=none; b=HMOd1QiTJ/ZOF8ml4UPewlMNjdgEch8BVMa8R5AeG4V21pFgzfqilbWIlMkguaYeGqpg/7AmQQAp3EZozDT8Id3xbJ44sZeRZL/uCvDJKN+y7QoExecFnu8d8GHIEc2JGNgjGgqF8u1Db6MpmYGieE7VjIp4P2eTqxFAsJBf2pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785965792; c=relaxed/simple;
	bh=yD/ubb6kJa7DOfwntk8xPoEFt/XENFZ8+BHyCejBCW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ek0ranfZfooN8l8F8JPkZQPGPGD+AJnQlMQdkokRAbmyq0PiIoKpHlY83vqbZdh3pqNubnPis8c9w+uktyDZr18FKUDttGWvCIo+UYiA8An9e0qOFycoKDOO+2bNZbZln4wzE3x1pgCYd8QgWJJhHPQ888+5Lr7fNrk1j5OSyzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTBgEzAW; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTBgEzAW"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49553515a8bso21891305e9.1
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 14:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785965789; x=1786570589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+NXmUOU6BP036ldIRX6m2NJ50w0Dx+RHzZYyem7n1Zg=;
        b=GTBgEzAWuwj9tfW3yrjRNrTtJ0z0FZ38LeXqO2xvE4ygcwIL6h7NDwagV05KdyifvY
         wjSrgyxgnPgK/VyRdOFE6CNF+NoL/NZtbjvjOdXsiUGxc+1VzD6xazP9UGQo5U8yx31K
         6MNZKxe0/zFy3jzBiwr3saKm7U6qoalNP8CCKmuN3Qs0tOlmsjb9lb74kccKKDKFRA3N
         r4ENIhoNNclgUR8l/yCc5kxNga0w9MorE7T/nG0rxuj62EzZVfL1ZDxUq77xv6i525qO
         NVZDrKKLc5xqb/xKg+uY1/s5yJFHNI1cY6/0ABuZ1tckuPhqUhYpmRAdNaU9fk03uiPr
         viJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785965789; x=1786570589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+NXmUOU6BP036ldIRX6m2NJ50w0Dx+RHzZYyem7n1Zg=;
        b=oleW8vRGtXbe7QG1iHgqGVvm5uc4W1cPXlxiZ/9O20z5D7AFytzPN9gDS7FVVIqI7Y
         +yxbPsq/1kBf0uh6F3R6dGxGMv1boHLuPNDizsmMERud0KYd9/zRlQNQAjkv1LNC5etV
         l13TZYc/I2iV9JJ1vEUXEktcOK3PbeswbrrUzZje2r7tD82QPJgJfeQ8OV1LIZKzm6G1
         rgshcW3MOw6NvqlvzuZ3/IwXBjMlu0oQxr2vTENvBRgZgTM0EAcy84YxPGsvryVrE4XR
         a3+JTtvFkoEGoo5I4j5yBr1w9wUzjvkgl/YudcPs7oddrpQSWrQCfzltVxo4kzB1g8vm
         VZkA==
X-Forwarded-Encrypted: i=1; AHgh+RrF/lmjF+KE1XgqvgXDyOQ8JI+rtBiMlwccpBPlY3NYwRcchwSMrtYQgYh/Hzujq4PviaRQ/SXexmMrJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3p/3EhGq9cyajQqQqcRT4DvuPYdBs3bWdXSuEAKNESTLwazdb
	yo7oKMaV+ponj7sWtNuvnwdr9hfLnmrBvefyP6woxfjfqiGXyMqZ8WQd
X-Gm-Gg: AR+sD1050iKk9JfvwOMTLhEygL5hjhhmvMhwldpSYSFZyPGQxD8r5K90N6XYYvcWljI
	3m2KNVnVV3H0TwqEMrcWbyihKxVxpmVdmLIEOK+BpRDLnByyDXzjUdQTHvVFhuMNKkgvU0fT50N
	upfMLlyjGJRQSD1Cnl0XroUHbwx0d3N9tK2hGvq8uHFtw0FPqUZWUXa380OIjmcevL+c0LoJ+Hy
	JntQJLZd4bMXJZaXCFhqPoxpDjWPh5kIbg/wmjhsTQojKk+FdP084qRxrTt3SIANQpv/plTPjx7
	XvstiqKYex6AmJ8orT+SoJ9WBO/QPAb2gH4++rdPx4Hl809+hCjlzcEnNyO+nMSrzzHgin+qDos
	lpdaesld6N+/Qi/m5cH8/zaeUApdyRfFgu5VohDt0jhq2psCu3VM6NMgasj3uHyKf/AmY7Va3j9
	Si53M/5HFp6I9UC2cxLE76EG0m0LcIVo9WarhT/191HVQ/rQc3vFE94mwuWKZVWimBwBX7IaXk
X-Received: by 2002:a05:600c:468e:b0:495:4a22:d684 with SMTP id 5b1f17b1804b1-4994e7cc8f1mr116879845e9.10.1785965789417;
        Wed, 05 Aug 2026 14:36:29 -0700 (PDT)
Received: from [192.168.1.10] ([95.43.220.235])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47ff79b4bcbsm484133f8f.11.2026.08.05.14.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 14:36:28 -0700 (PDT)
Message-ID: <856e7188-b406-4e4b-95b6-4ee158478bd3@gmail.com>
Date: Thu, 6 Aug 2026 00:36:27 +0300
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

Ok, that discussion helped me remember the original reason for the patch.

The issue was not the codec-to-codec DAI link itself. The modem codec 
has playback and capture streams which both need to stay active during a 
voice call, but there was no DAPM path coupling them, so one side of the 
link was not getting activated and runtime PM did not resume the 
corresponding device.

I dropped the DT INPUT/OUTPUT widget addition and the corresponding DT 
routing, and instead added a small DAPM graph fragment in the modem 
codec driver:

SND_SOC_DAPM_MIXER("Voice Call", SND_SOC_NOPM, 0, 0, NULL, 0)

{
	"Voice Call", NULL, "Voice Call Playback",
},
{
	"Voice Call Capture", NULL, "Voice Call",
},

This represents the internal hostless voice-call path in the modem codec 
and makes the codec2codec voice call work.

This may not be the final form I want to use, but it seems to be the 
right place for this piece of topology since it is a property of the 
modem codec rather than of the board routing. I will revisit the 
representation when I prepare the modem codec driver for upstream 
submission.

Thanks for the clarification.

Ivo
