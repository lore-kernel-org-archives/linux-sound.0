Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8F6F4E2;
	Fri, 10 Jan 2025 00:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736468777; cv=none; b=hqYgDYRqBfJPVObK4sMqF2HQcqm27DrWYxxktOYjPgx/NXcdg1d+gmJXi3RmFMsQ3Z6rDR+u16u1mKmWtgidlbiHFNZb/oJJ9tcyUT+stOLpVhOanqivAu91JREynQKUm3u6SB8tM3VkqNsTf3Cwfa/lRgeOYZSY2Tl/5q2LFg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736468777; c=relaxed/simple;
	bh=TS8PM3Kg6COB8HuPm53E7SJoPUBeZmZsfNDbldCBrJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QjjOQ42crJ/CyZAttDALAj++AbLco4rlfJ+vghYemEnHq1kFTo8ftoGf76+URLndJM0LEDrcU6KJnrWu4zbwsjb7W0VvhXKaKLUmb7FRPqHl7QQ4g5TC1XsdeN+mKTBrdQxUl2XsqvqJsZcrQOALqO8kcvCI8kSLJPxt3ymIZpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=So1YDS46; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="So1YDS46"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso820903f8f.0;
        Thu, 09 Jan 2025 16:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736468773; x=1737073573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+a3dHJzMzifTQ2NxfvXphqMKBCmCvVOILXcIZHhLVYE=;
        b=So1YDS46+PfdA9sWPfX2HB3qCykVN7YRpmxiN6amloVAEl0iM7P1rjAaouP5bywQ2F
         ppEGHrTQxCcROMSfdoodRAwzyZ1niWbnBD6kIALkyA6CumRkqboV+w8cBRTF5IDGQkaX
         6ZyiQTDFmanjX+jjnf05G85/UoAJaRurid1/lZjefzkJ3Kb3wMcxuU+Ltcu8fAwo0L9X
         G0KDkVf7GPpPsyjWUcVVaa6Mov9g61OiQn+QUfq14njqRnIu1fCtcpRnlwNtiY5HLejl
         s9qgWd+Kpw1aOhAmbwt5idX7n78ken2LMFHE1st9TELqMpADy39M0aJ1oNLaZOS1/06t
         aLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736468773; x=1737073573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+a3dHJzMzifTQ2NxfvXphqMKBCmCvVOILXcIZHhLVYE=;
        b=Sev3Dr+40DE539xfSxyWvjHqmMFFMp1Tqp1UTZZVHZ7XhF3J2gxL8OI+9z1Ns0qyRd
         oSoslDTqpr8y47T314pN7JG1t9peqbqGrue9cXLa8Dc7uyDgenWXvaIMo6hzaMN4bKR0
         W++blyitRP2tT3niQ9w/zPljRanw30gVoiVdIkvLOb82QYtioAFxQUTattCNRiv+N2/W
         HF+EfbYDeThH+n63kZ39MBQtrwMeGM68KnYnP+ItTm3V7Wn0s8xbNBFdYLYIKlLWEgma
         wOjEcEU/9pwd1r5I2yh08Lyj4Ya3WPeWdhG6aJB9LfG8Hisn1F8+wPUbepPy/RTHkdAi
         +5gg==
X-Forwarded-Encrypted: i=1; AJvYcCUCp0r1FUHxDTHlgZj21FaOjEupKfSQ8pLZZfq1oUss8wxSTe0MFmOZGgFj+7HF+yj0Jaol+c5zBxcQepg=@vger.kernel.org, AJvYcCUv7JQI9ooeBnDYrJRE6eowYmGK6gjAjSUXAVzSq6M3decA3j4AkFwaTBPuFy80N+O48fp49NSAzhiWElE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMrAgodK2vQgY90ES+nFRLTw4+I5/s9/h1ajCjojnUPoG6OAy8
	I1Xib+1SxlVVaFQ6nOb4Dme9uc7BVc1Z6bQ1e193VecvH2XF0ZFv
X-Gm-Gg: ASbGncsr9CiPVtCBO3Atxgt1EGDxAtEgaB2fAMc/5MCr1KU2Fa0Fa0MbwQupx3LMkGr
	rubI918PHYdJswtQI9xcmYAh2oOVTK0efRYqZAmKSakSS8Iz/ZoITYP83EE3p08aHDTP/Ev0/7z
	UNEvt1YhmHsPLkp9UxUxojhUc9qc2NotB9nNMbAah3VGJO51dvUFqvYzZtepPu1FdnydsU961gm
	9CFkaIVhCrB9jiJRaztzKYyQaUbfvdd4w9CXcJtnz4ARNNV/Xem9IxWw5jlLpHS6R5EEZXx8ias
	sin6p8Mi4A==
X-Google-Smtp-Source: AGHT+IG1DaWA0p7wHe2pk6Ky/hxFrmJrm0m/2YC37fQnhpdP6yIAoz+D6qOmtsEE2/GR0jVp2Xqp3A==
X-Received: by 2002:a5d:5f44:0:b0:38a:864e:29b1 with SMTP id ffacd0b85a97d-38a8730ddf8mr7351307f8f.41.1736468773019;
        Thu, 09 Jan 2025 16:26:13 -0800 (PST)
Received: from [192.168.1.130] ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e3838a3sm3055656f8f.33.2025.01.09.16.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 16:26:12 -0800 (PST)
Message-ID: <146532e5-1329-433e-852b-e6d400eb5347@gmail.com>
Date: Fri, 10 Jan 2025 02:26:11 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] ASoC: simple-card-utils: fix priv->dai_props indexing
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241220151213.2462-1-laurentiumihalcea111@gmail.com>
 <87h66v8bsc.wl-kuninori.morimoto.gx@renesas.com>
 <197add46-752d-4779-98ff-1cde2543dd63@gmail.com>
 <87y0zk26ko.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <87y0zk26ko.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit




On 1/9/2025 2:07 AM, Kuninori Morimoto wrote:
> Hi Laurentiu
>
>>>> +#define runtime_simple_priv_to_props(priv, rtd)
>>>> +	((priv)->dai_props + ((rtd)->dai_link - (priv)->dai_link))
>>> Oh yes, indeed.
>>>
>>> But I wonder it is needed not only utils, but all drivers
>>> (= simple-card/audio-graph-card/audio-graph-card2).
>> At this point I'd say there's no need to do the replacement anywhere else. That's because the code
>> still using simple_priv_to_props() makes use of the link number to index the array, which is fine.
>> This is opposed to the PCM runtime data ID that may not correspond to a link number, thus making it
>> unfit for use as an array index.
> Oops, my previous mail indicates strange sample.
>
> I would like to tell was update simple_priv_to_props() itself
>
> -	#define simple_priv_to_props(priv, i)	((priv)->dai_props + (i))
> +	#define simple_priv_to_props(priv, rtd)	\
> +		((priv)->dai_props + ((rtd)->dai_link - (priv)->dai_link))
>
> ...
>
> -	simple_priv_to_props(priv, rtd->id);
> +	simple_priv_to_props(priv, rtd);

ah, thanks for the clarification! correct me if I'm wrong here but the issue
that I see with the suggested approach is that we have some places in which
simple_priv_to_props() is used before the RTD is created.

Example scenario: in audio-graph-card2 we call graph_link_init() (which uses simple_priv_to_props)
before the card is registered (during which the RTD is created).

If the current naming might confuse people then perhaps we could change it to something like

simple_priv_to_props -> simple_props_by_link_idx
runtime_simple_priv_to_props -> simple_props_by_rtd

while also adding some comments on how/when the macros should be used?
