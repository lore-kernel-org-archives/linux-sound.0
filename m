Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F079D33F8A6
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 03:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785987006; cv=none; b=YI2WmLn15NfkkBTNI4+DPCObexD2Ma3/kZ4cCTuEaOxBOm1LTRyUphVdXs/ln5w7Bg76sXh5FYm8NMg0Gjbq1jo3e+h1WEWyDroMs6ZLYl786cFCa40AJTAYPEjyv1BegQ4UDogE9hxJUsva+MHAZhbL9edFSx+H7X1b48GoVBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785987006; c=relaxed/simple;
	bh=nmzijyFbb0U1VQ8qXzk5PkUoP5TirGh/vCj/nSrmjng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d988JJUQz9LPZb5MVI98z6bSeIZCE5qlWIBJrcRK6VTwTbPqWeVVCuXGrMGKxYDAvc52pPQHsxwG198O2aHWdL3v3mzUt41qFyzp3PLWPXk+jDfoczxKdhzgMWZwzgqFVE8bADsFeiI3yoH+Xg4oqAFj2RIK8mlIV4efzH5qQgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sklbchRm; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sklbchRm"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e347638adso1898231a91.0
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 20:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785987004; x=1786591804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YAXCryH4oh6nQIKuZN3/aiZHSgXb6KFeGAGvPh2FRm4=;
        b=sklbchRmY1BtxRHPUBUCe2jgycVLSdItAxWpGKB2H/kB8bMMb68PyQi1k9UfEfyN5c
         6rGwQ3sYKL+rQrDRwFd+KeUGW9i5J+VIKFbzMwRlJPqnmqZUBhj7PDYPQnln/zZ7ARzV
         vpDki3zOMAHWkiTn4KK8n38jTINGT4lL+SY7qxrSDlX6NFCNSPwdi4jE2vjcrYV5uh0u
         sNnwa8D1UuqFkt1hRHL7IMa8Eg51fJeoOJUpOxaJceGvqATQfhwZxz4JQMyDUGitkVXw
         v1RTC9igUz42d9aRExkAoQe4aTh/HYOeXY+UBLART6oPCVCO6ylpVwSCl3hmV0fkPD3S
         mxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785987004; x=1786591804;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YAXCryH4oh6nQIKuZN3/aiZHSgXb6KFeGAGvPh2FRm4=;
        b=PdLI9blF9ShdoTWzBiDdCz/MwB1vKNlU40n/Ug3JJ+tjgiLbBU/0DzB6IePlDW/U+4
         0IcDM/3/79QVVcYWs+gWPJHw09NGiCWb2K9NLoe166+z3YfdaZztnckXd3gvSP60pUmq
         aFssgYNdW6WRJvu8RUuBuo2bGK3/ZwZspzmeX6WmdbBFp2nKy1F67+1A2kh+lgVQ4RsE
         ZT5CdHzxZol4pXLnX+S6YMI3n8rFPjQ2wZvhZigkm4FGqzHur9gs33RWPSgC0vksfZCT
         R5XSOKGpKIdz1hSmJWmlF1BYzq/M4Foz8BRZ9QOIHUbiFidRuuFueVdgUanw5i1TeZeA
         ndag==
X-Forwarded-Encrypted: i=1; AHgh+Rolnx6DWCqPbPyTQa5tqsIm9iWyEu7Rz4lfRFLC8uqtjlCrdAFJjxWzO3vfovW8/aZQjnBQDHZY3MY1oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5+53/FndN98/LoIrDsQha4A9wdCTh/MGkAbi7WiEGiV+vqZDg
	ZL34klmJswI+ni/abRBfmqtnlaCBI/1nwZuOgdehDWEOD91MVtiDXBSSN0tdsQ==
X-Gm-Gg: AR+sD13+qX89kL6khJe6vfAFr1QrndDRc3CINVX0YXVLMLqTE6zItrI7IE4PynWh0wU
	HFRmU/CuCdR66SS77R+C9M5cQ4hlorVDzbkFZMi1i2beA9dWY4WW0bfuSBOXetCLdhM1dVe7nlF
	chnzFuWpHdb/4zfh+jvhkEpbfSon16hWC0ki9NdOIsN0OvBDclGFzj8DFThNIFKr6OWbVxDsMPi
	OIC+DT/sn6oQ4tJhMgxWZ1IozckGTPEZZbTCuLS3A2JcpnYP8UNypbTXYeE9DYr91JJxjAoLXDk
	1nYGjA+ADI2cPyEu49zkugFtvkC42AoVuJAjycS9Jpe4tzYYQ7mOFy/YYDvVubQtELJEJOB9rbA
	HLGPniiSEYbotiLQ570xaH+feXAD4Pupq0UbggM4SWb6tpEi8EoZqgUrajQN5AVJsSfHcHr8uoK
	i8I2RednTbaUKuC5b+XN2YP6AvYZ8P0he6vllNEJiSoQJipjDPhJND51xcUbpuAULXJZeiwDyln
	MMZXTtphCPf+/QvwhESe444uj3gPXL5LMibIWM=
X-Received: by 2002:a17:90b:3f43:b0:38f:57f3:4dc6 with SMTP id 98e67ed59e1d1-3903c6798bdmr13404230a91.21.1785987004218;
        Wed, 05 Aug 2026 20:30:04 -0700 (PDT)
Received: from [172.20.10.2] (114-137-35-218.emome-ip.hinet.net. [114.137.35.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903d2f9a9fsm2451155a91.1.2026.08.05.20.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 20:30:03 -0700 (PDT)
Message-ID: <4bde20c7-2496-8122-7e0c-4fd986a59232@gmail.com>
Date: Thu, 6 Aug 2026 11:27:43 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
To: Mark Brown <broonie@kernel.org>
Cc: Neo Chang <YLCHANG2@nuvoton.com>, lgirdwood@gmail.com, perex@perex.cz,
 robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org, kchsu0@nuvoton.com,
 sjlin0@nuvoton.com
References: <20260804032951.1069901-1-YLCHANG2@nuvoton.com>
 <20260804032951.1069901-3-YLCHANG2@nuvoton.com>
 <479efa04-2c02-4b5d-8fdd-e3d4c6e49c4f@sirena.org.uk>
 <7691eac8-5798-c1b5-5ffd-19c780b69a3f@gmail.com>
 <fe60dbe2-0626-4d52-8be3-62445a35ddaf@sirena.org.uk>
Content-Language: en-US
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <fe60dbe2-0626-4d52-8be3-62445a35ddaf@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/5/26 18:30, Mark Brown wrote:
> On Wed, Aug 05, 2026 at 05:03:01PM +0800, YLCHANG2 wrote:
>> On 8/4/26 23:58, Mark Brown wrote:
>>> On Tue, Aug 04, 2026 at 11:29:51AM +0800, Neo Chang wrote:
>>>> +	switch (clk_id) {
>>>> +	case NAU8360_CLK_ID_INT:
>>> Usually we don't have a lot of fine grained control of the internal
>>> clock dividers of the device, things are a lot easier when the device
>>> just figures out what it needs based on it's input clocks.
>> To make sure I understand: Should we remove the internal clock IDs from
>> set_sysclk and handle clock configurations automatically inside the codec
>> driver?
> That's ideal.
>
>> Does this mean we should avoid configuring them via the machine driver
>> entirely? If so, what is the preferred way to handle clock fallback when
>> playback stops or MCLK is absent
>> (e.g., via PCM shutdown hooks or DAPM events)?
> What do you mean by clock fallbacks here?  Presumably there's some clock
> still running, if that's the only one running it's reasonable for the
> device to switch over to it.
Hi Mark,

After further internal discussion with the team, we prefer to keep 
NAU8360_CLK_ID_INT in set_sysclk purely
for clock source switching to maintain consistency with other Nuvoton 
drivers (e.g., nau8824, nau8825).
In the v8 patch, I will remove all fine-grained clock divider 
configurations from nau8360_dsp_hw_clk and nau8360_dig_sys_clk,
leaving them to only handle source switching.
Is this approach acceptable?

