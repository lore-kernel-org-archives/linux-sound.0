Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E413CB91C
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 17:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785950176; cv=none; b=bntkT3YsdjtoAbrA0GrYDNYrCs5NIYTZ6ckpoQGngT07L6cU0QGiHRNczISumxP2XGLBBMTiA6VAcDeV9IoWMyVB9f1a3rtnR45uks6uHE/CF/ZUFl2tgFQ73HMOC0vki9iyO/a+xXcccsAE9qLjqqxSK98ge8qUpIQIQVC7edo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785950176; c=relaxed/simple;
	bh=1OXvNgBF79ZY8LKA52SVyqJhRiBPae1v3rOOB+6pP1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KZ0McZhEY1wHjRGjw96mkAos+oI1Ov8q9hJ9X0lz6MLRHINVqogAYKVNhJW8ImhxtSab2+SNyoCJvnVxboc28vU1rQ5ASt79qvU0VnzGkFL17i2ulhEzS3El4cZjGqmE7xJOk1BQZ82zcw0jNENY+Uluf1gZkog6e7vZN4EHC2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZE2hplG3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZE2hplG3"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b966dd74so7623215e9.3
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 10:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785950172; x=1786554972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1/xDVKNV4JWEck6ko+fu8jMjh0fZluUAUVFY+j3jxA=;
        b=ZE2hplG3NY2WojJepQIXjCITwwftNvg9PmOs8C98LqPKTYFqIAaHaggUWszDoxzab3
         6QgZw9Qa7r83dulINxTRJcYY26gRASnED3UQBO9eQAzbT8doy4kp0CRNrKQd1mJ3w1wm
         VZLpUVT3zuJkQzaWQlYaRX43Kt7sG9o0IMmAjLPf74O3wiZwmAesdCQ9D3KhKLBrrUwv
         v8UdOKA9q/dw1pEe1idrWTZOfxoDoPPjeLHGhaDUaimF0cJ8atKdrgw1PHWyIF2plbid
         8x2AappAiwPnlhS2HCMtbMhxwMnhVkQWs6VjvtfFVw4f8p9a4il/++DQ3HqSsV+sRqpK
         p0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785950172; x=1786554972;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v1/xDVKNV4JWEck6ko+fu8jMjh0fZluUAUVFY+j3jxA=;
        b=M6k6n1/sOvwmj3Xa6GtT+qTO8sr1kIljlsNiGOV/8CREgWLkiKZhFc0ToCknX5Njx1
         UC9WO8mnZeSgTQHwraf83+4wl0oJ8GMvu/DKRvc1v6wPWpX24ePDfNqAuyq7uSxvxkS5
         aWSu2c4HDwLbo8lNsBt5VovTLOQUldKFNd4vczldrDCFz2saLmwer0cqbugcFPElhArB
         fEmuda1UJCAyDsseStOo67yYy3XtA7eya6naBvLRFqVbvrnRPRA3YLwPe4FsJxm0aXo5
         6eaNS8h3S07z8Xs57EyrEh+r+57EriWttPHiJ1KbuYwwc0CDCbrKB8m60apUNbc7qMli
         7uJg==
X-Forwarded-Encrypted: i=1; AHgh+RrUgc5SCWqR/L85cnTmkIgLqciXc5Etp/UOVS6ndYXNUeGou7HhocI1HbUqDwAThNOC4OXYOp7jLF9cqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE9tmsRd1RgnKvBrm+XqfOkPbrnnnqOp4rE7RVnI+CXHb+NvQX
	SYV3bDj1DcigjNxto+Rbg9+fk93qq1reuSZllCdUww2a8blKT7/A8Rm5
X-Gm-Gg: AR+sD12BQCL5+7vAndcN9FR9bO9w2bFQSSNyeb5pm7YnqRBEdy46VwAtES8zeXrC3ka
	FkwRyjhmpW2dV9SMdRxq5X4QjXkQvjv2mMRNQ/q2oPlKccubKJZ5p+w0OD44ET1pQprhiHfh9YT
	9i2DKm0l7r2BXbQBkeI2tkpEtS/WEp+GM6yIyMGzQ2lan1vcn8DIASKK+wp8tehTLEVMNw5sEHW
	2VdJBLXrd4DnfM8K2Ij9+981ruu9fL+oi4kcNxzLuTrU4Fl2ThDIz8zrcQ77dWxmaZKyqOtgRvw
	vEKEDcKIbGU3VhR+NDdkmKjNdYB476E2zAcWtJsrA4C4hnG/9gLRARG8MjpgCaCp1xRvf6DDDkR
	V0qYq9tAZ/EvhGNG/Y+5KtTtfWm2maRZ3gdz/U6arcJ6wgPGzUttuDzt/dbtuDAB9BKudzHyQsv
	utCfckBUYZ4kCF01G47698rCfBuhH4RUfCsErN4iiRdWSLsrmlDfSNZvaD84T4C1DjyUA5I/po
X-Received: by 2002:a05:600c:1c21:b0:493:e460:1f6 with SMTP id 5b1f17b1804b1-4994e6fe377mr105947895e9.0.1785950172137;
        Wed, 05 Aug 2026 10:16:12 -0700 (PDT)
Received: from [192.168.1.10] ([95.43.220.235])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4994a0f7b73sm229089095e9.9.2026.08.05.10.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 10:16:11 -0700 (PDT)
Message-ID: <ec5b015a-30b7-4e59-80af-f18da69e4240@gmail.com>
Date: Wed, 5 Aug 2026 20:16:10 +0300
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
Content-Language: en-GB
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
In-Reply-To: <1cddd05b-804b-4d91-a5ff-7c5e07903610@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5.08.26 г. 19:40 ч., Mark Brown wrote:
> On Wed, Aug 05, 2026 at 05:56:25PM +0300, Ivaylo Dimitrov wrote:
> 
>> Allow the DT audio graph parser to instantiate INPUT and OUTPUT DAPM
>> widgets.
> 
>> This extends the set of DAPM widgets that can be described in DT and
>> allows modelling external audio endpoints as part of the DAPM graph.
>> This is useful for more complex topologies, such as codec-to-codec links
>> or multi-DAI audio paths, where routing through external endpoints needs
>> to be expressed using standard DAPM routes.
> 
> What specific cases do you have where one of the more specific endpoint
> types isn't suitable?

The use case is a codec-to-codec DAI connection, where the remote 
endpoint is another digital audio interface (for example a modem or 
Bluetooth codec), rather than a physical microphone, speaker or 
line-level interface.

I have an out-of-tree audio-graph-card2 based machine description for 
Motorola OMAP4 devices using the CPCAP codec together with an external 
modem codec. Without modelling the remote endpoint as a DAPM 
INPUT/OUTPUT widget, the DAPM graph is incomplete and one side of the 
codec-to-codec link does not become active as expected, so runtime PM 
does not resume one of the devices in the link during a call.

With this change, voice calls using the audio-graph-card2 based machine 
description work correctly, as the codec-to-codec DAPM path is properly 
represented.

The topology I'm referring to is here:

https://git.maemo.org/leste-upstream-forks/droid4-linux/src/branch/leste/maemo-6.18.y/arch/arm/boot/dts/ti/omap/motorola-mapphone-handset.dtsi#L65

The hardware schematic diagram is here:

https://lkml.org/lkml/2018/3/27/1225

I used INPUT/OUTPUT because they appear to be the generic DAPM endpoint 
widgets for this type of digital connection. If there is a more 
appropriate existing widget type for modelling such a remote DAI 
endpoint, I'd be happy to use that instead.

Thanks,
Ivo
