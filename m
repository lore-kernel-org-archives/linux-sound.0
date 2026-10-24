Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792858398;
	b=d3ayUF3PzRRXgUs35IjDj1YtJ55Llzv9L+JBEltygeG1ruYn5VKJbWv9Znab3obuVyEm
	 mBhEZNHGAm36RlL55rIHgQz65A3a/7ZkMZFQMi07X0S4TpZ5Y7YEGSk4ba0zndPxdoZBW
	 z8mpaelkXT4q4Yb8dck15S2jtPnw1MStMPgWqdiivB6QH5i3Po0VwKtytWEtMnbFXh+zM
	 APRCcvrqxYOCFSdIoprbBYq2JGnsQH3CvWR6BQx+65HiC+CbH79CHBMkWugjX26aXQy89
	 +Zvzq/mPM5XfPBzMR2e+FTi2UVLktSONG3Uc+95CvVNcckv0O5IDmzLV9oG3QtoiYIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792858398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8m4A9jkTkwuo4ipkSykg8HyuJpfZHAGONM9dzpmnNxQ=;
	b=IYhG8OnnYZlNaUZLi71MCAf4gkl4UTs5xq47icxiL6EDd1qKfEK6oWokle92gDYJicAw
	 0IazikPpAcv2lCAAvFdhnRXmWJI0BHeK3v03tGMkIuwQ6FdzTqNduAiON5RDTspjUg3Yz
	 /JuBitnOqrOLbyhNLJ4GLpjWDNieS1geTu2Xv1dwNEXoiiECKGTPE+LQJDJQxWOsDqaNj
	 7GeQZEJXqYtCWfPady1N4yR7Zh3isFCBFmyNloPRxLIfRy1GuuD3aIP2BTo9thvyOFz+t
	 rKZ5MYjSaopreIjTWFdtOnjqEQsDPP46B5FCK5q0DBMrF/GP4WB4Kznvr9sqF+w7ykA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LOwkl1uJ;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE8E606A31B
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 16:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FE8E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LOwkl1uJ
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91b834592afso20615966d6.0
        for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 09:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792858396; x=1793463196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8m4A9jkTkwuo4ipkSykg8HyuJpfZHAGONM9dzpmnNxQ=;
        b=LOwkl1uJjZXsyTq8dwsJoMHwAKpGn77KQcY3H0yw23C9r4dTTVvcDlgLDEikbuJY+4
         Ao/uvrFCciO3LdnUywnotj6RN588OeRabGyqdlDG6XQrn6ecjwoIvditQV2+okx3PRCI
         qHAIDX+fcPbPxKJjhJovUMMwo18HTYhyyYX9IsKIWYcCnr0gPBFPAXGfL7MeNpu8AHSw
         q5TB07O1KXthKywbT/uBoivV4wNHY7NJPxPO5X2zf+pgbqHX4Fo4HmW7ob34IHZ3JLbD
         mx8GEW8h3wxFZVouORyiokQDKPFY/dzt/l3DWAqoTKEUvyefvizzCr/ZNem859PHjQ2D
         K1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792858396; x=1793463196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8m4A9jkTkwuo4ipkSykg8HyuJpfZHAGONM9dzpmnNxQ=;
        b=LYEJlJUlTl4d9HZVE+KuH0jHHDY63Ut8Il5i53l5AlaOIINU1VQn021pbqvcDfMNP3
         Xdtylec+bPMvP3SiaV2d5kiKjYzUegRKLkk3Vp9eBvCB4D0E57IFsHF/rfjGwp+OKyFJ
         wdiEPVoHq1z7V/VvDMj5XMZX/Zo9iG0DIC5Xr7Y4PiPye3vi+Dip1fvXOcWr4jr+vZFN
         VtTOTiMhaB+sCZRDHeyWfL3IDb1byKZOuUtunzo7wxndGS5A4t74bcDT4NV5rslHk1M5
         jDG+//nGDFnZZrGGq2QHf9RLSVHQ8SBdtkN8WJ6/1gVRyxWNAsoU3XRURc4V98erBQ4g
         UjOw==
X-Forwarded-Encrypted: i=1; AKwUvBz4bwoEkOLpa+Onh9sOyAV3p5mjkuQ+j8ceqTodTMQo8fzZYEAJklDfyeVw6fNxNYtzyJUHwGEYrEgf+g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJUZE2ZQ7sIPg6afVrNwtepha/laRUXs7iC8h5pHqJnXoxpzRfU
	sCiayYPSZmhp8efEpVX7777wRTGBy93kHhjCI119Ljp1zF2oxqdT1a6D
X-Gm-Gg: AYBFou3mD3IPiXgvzgdbs3Mlso0zctLc4nOy2j2W9ufykJzzK+phVAbx7rFpGwtiGxc
	LRnGcyeVjD+mMgK00OfBktRogFngOxTKRlwxrPs+i5Y/svutF7fq8ZgCw6vV9wUQeWKi7yutTOb
	27NrEr2ubcYZ83iKuC+CQ+Q/hQTdKFUr5dC+CiHiGKnGHHg7ugnhX4sYe6Y8mtVMAZ/BOLcd5hv
	nUQGF+NTQ69bUU5ebtyxptXiX+Qdu+sjBCSNILVXLPEmLDdfV0tJ/C3nzyu+YRGpHwGdVv6YGVq
	mQx3m0+KdcpBHF/3Q7I5yqo9QMSSbWsg6DdoWfCVu5DD2sRBvuF0byihlW4GuVsg2ra6snHPdQh
	tFwTQB9gVYq52CuwjgRBuVrGNX++iIEdnrvDKieC9TVUp1SOYz9EqueAfhucedLpKn9Tx8cFZ3E
	QcH16e1f/5cfl4afx4zhdFHVBP5L6ymb/1NYf7iXPo4hTjYGWb1bDW2E9NIIGfSh6tXEHTBnfWX
	bM2ULrLecHz2pH4/yXnb/31MmgBEFKkBVNm43DIoyZRhPWICzmszABpYEK+Lz0rzyDjrXBKNaCB
	3v9zXm4ADhmO7CD8dgZEX+8JEb5/9kOYaynZOg6F1y5wu4DaYE1IIHPW5YbzVDMqTqqXomDBFeI
	gcZNP7tVCkyaVPjx8WGJUXopmKEv376s/jwE=
X-Received: by 2002:a05:620a:4515:b0:93e:fc4e:c490 with SMTP id af79cd13be357-940ef913660mr339909185a.15.1792858396158;
        Sat, 24 Oct 2026 09:13:16 -0700 (PDT)
Received: from [192.168.0.124] ([134.231.41.122])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0a9720csm210593385a.42.2026.10.24.09.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 09:13:15 -0700 (PDT)
Message-ID: <59ad0f62-dd4c-4d42-b50a-ab91bf469fb7@gmail.com>
Date: Sat, 24 Oct 2026 12:13:14 -0400
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/1] ALSA: add PreSonus Quantum PCI driver
To: Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-sound@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260820083646.11383-1-nicholas.johnson-opensource@outlook.com.au>
Content-Language: en-US
From: Jamie Steele <steele.jamie1991@gmail.com>
In-Reply-To: <20260820083646.11383-1-nicholas.johnson-opensource@outlook.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/20/26 4:36 AM, Nicholas Johnson wrote:

    The driver provides playback, capture, raw MIDI, sample-rate control,
    clock-source control, XRUN reporting, and surprise-removal handling.

Hi Nicholas,

I previously encountered sample-rate switching problems with this 
driver. Another Quantum 2626 tester has now reported similar behaviour 
using the August 20 RFC with Internal clock and direct ALSA hardware 
access, without PipeWire, JACK or a DAW.

His 15-minute 48 kHz duplex test completed without new xruns. At 
requested rates of 44.1, 88.2, 96 and 176.4 kHz, measured capture 
delivery remained around 48,000 frames/s. A nominal 10-second playback 
at 96 kHz took about 20 seconds. The actual hardware clock hasn’t been 
independently measured, so the cause is not yet isolated.

Full setup and results:
https://github.com/jamie-steele/presonus-quantum-linux/issues/34 
<https://github.com/jamie-steele/presonus-quantum-linux/issues/34>

Is this a known issue, and is anyone already working on a fix? Is there 
a newer patch series or development branch available to test? I’d like 
to avoid duplicating work if an update is already underway.

Thanks,
Jamie


