Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5761D2E0B6D
	for <linux-sound@vger.kernel.org>; Tue,  4 Nov 2025 11:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762257230; cv=none; b=p8Nf/4hF3cZ0NyKsGgpqbgiOPqAV4IFjGNSoq7msoWM4Mva22j4lQ5/eoSAbjRiPGgfICNtNOqcEykSwhl84Fl6UhCuYNi75vJpWkquvfR/qz05xFJqmerUvviO/e6P2bQbOvZbkai/EJYuGsn0IaDX5hQLFhXJAaWK1k+BjPbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762257230; c=relaxed/simple;
	bh=I36LzGSl9wytAsBf1yTXZ1w2SrwG6l/dCnsmOh1gGrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LoA5vQW96xX6tkSv6zdoE4JuzMDY9NUw5Qcq5yW1kZ+rAhgdExj4N0HsMoCweC6YA5QcGYCM8/mfGcqEgkIfpPZ3GyW+8fyolDRFGxp3IhAX5JPqdD/BnVtd2umUXdN4ebJubMT3RzIl5hZNumDENR4iejUT7NbZs5hoWVzCo0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MlmPrg96; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MlmPrg96"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477549b3082so6657835e9.0
        for <linux-sound@vger.kernel.org>; Tue, 04 Nov 2025 03:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762257228; x=1762862028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I36LzGSl9wytAsBf1yTXZ1w2SrwG6l/dCnsmOh1gGrc=;
        b=MlmPrg96LFRqxvhrbK0I99Y3mY8Rrq0VCaGf5E8xXGxVFFGMtvcCyrKanpVtWafb+f
         qFl6CvABdtYGYlYZZ0sE+g7Kh28FAW7IP/WCDWSKiHPRc2UCzKFftKPBVoH3/pMw/YIR
         Eo+9/OWQXIQMIagvNfsUlSWwz+PjtK8pjQbAMy0glqhcb6vPexE1S1Al2tZxWInnrvDp
         gluSziYScLerys1iQW6Ya0fxIaPwDLIb92G0hdur+SEirXERwgAA06yRJIAYhFUQZsof
         2pPMHD8UJ65YmgCbL6+Z+HofKBx4J2iuI/VCRYKxPhEMUw17bGHN6IGGraOd9upsvab9
         xLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257228; x=1762862028;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I36LzGSl9wytAsBf1yTXZ1w2SrwG6l/dCnsmOh1gGrc=;
        b=vP194mfyBgXEJ0j0lvjITWiAIlgz/BdoLD/+k5caohFydYnm6Y/ESsJs8CPwMDQ0hK
         oCiTfUjWoc2lrsouu/tr5cmIa+cfTT/V54nY79i6S/ToO4+WLu64qjDEwMze1QK6+Sbl
         KOoy72XRDDnXbfbBQUiTQQaeFoGWMz2g1v+B2luarVz4MIAolGMdlpb2NR3lfJtUdzPV
         kG6cz2jL2syrJIgBgSC7QrWKhFmy14gKlRci7wq3p4QhLSo50zzcIFSYnr2GyTU9wi6Z
         mqhpccEjndiBUiZ38XZ+iC8VnffgkjXSAmBRyiND8DuEdYR9EL5VLbYi7TT3SIcQh344
         bQQg==
X-Forwarded-Encrypted: i=1; AJvYcCVoCoZp7td+FmcPOy4uIandRC8sJV4h5JnRVg8vWn2j5WEKjOUI65ZeZf+imkiMPdkUkA6YbuxrkD8WMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yww3xt5ufSmZEncmRs2w+/eILgVqExn3HzlWUQiXOYNO458ooR7
	qbwNYREV/qdyOVwdt6Phz9XLW2dr0U2cWZgZSBI7A2nbyNBsSh9npwgSx0KxhrNLFk4=
X-Gm-Gg: ASbGncvjmcKQf36/ek+uk2shUY7OgfDVBcoG6zDWNNz2RO4Vx8JNnStAciDjJDSR78m
	YY4hg1GDc3ncMVk5cmXI8mbybsvLnlK1dmnvjr65ny+tEjPEX4cg40wEAtA6lDN/Abxbjcye9G3
	q+9m+P/36Wam7ZzSh7W1k0oTiLxL9Khv8hXIka4PS3zxUan66bYIq2u7cLN4Zt9Oor9gqL6KqxS
	p68UDRrWE321YF5JyEY9Rl3azO0Ga9lMeW/mHqwbllcM/G1y73m+9K1Ddb+hDr8KJZzhZ5U4rQu
	dIsQFn30miLddhdlqV3Y0wLV7Gw8FGxjSuiFU+Lzbo8Yk4/nU7nHkqmxLwfjbk0cfb809m7Oq+9
	jUQuN7sadO20BeCfzS9ToqeSGg9b1IpY2vozyJuqJienVtdtuiaG24qvVq9Vm6WbUwVhJ96B8z+
	FbGk79yLmn
X-Google-Smtp-Source: AGHT+IEvDHwONng4aJ6PO9esJ0vd+TzU9M+bzqzfCyIK9M1CiPuaL9xKsM8JexApKzS2Btn21bVVEQ==
X-Received: by 2002:a05:600c:1553:b0:46e:436c:2191 with SMTP id 5b1f17b1804b1-4773089c34dmr151966595e9.25.1762257227721;
        Tue, 04 Nov 2025 03:53:47 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47755938f45sm16302215e9.4.2025.11.04.03.53.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 03:53:47 -0800 (PST)
Message-ID: <6296a8fd-bc2b-470a-a367-61c2d80fe8e1@tuxon.dev>
Date: Tue, 4 Nov 2025 13:53:45 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: codecs: Use component driver suspend/resume
To: Mark Brown <broonie@kernel.org>
Cc: support.opensource@diasemi.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, biju.das.jz@bp.renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
References: <20251029141134.2556926-1-claudiu.beznea.uj@bp.renesas.com>
 <20251029141134.2556926-2-claudiu.beznea.uj@bp.renesas.com>
 <bdb14543-e611-42d0-a603-300c0ea17335@sirena.org.uk>
 <70362ac1-244b-43c5-97cb-ebe8f5b90c3f@tuxon.dev>
 <56911e0e-0f25-4134-92fd-f89cb47fd9b6@sirena.org.uk>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <56911e0e-0f25-4134-92fd-f89cb47fd9b6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Mark,

On 10/29/25 18:14, Mark Brown wrote:
>> Would keeping the regcache_cache_only() + regcache_sync() here along with
>> populating the struct snd_soc_component_driver::{suspend, resume} be an
>> acceptable solution for you? I think that will work as well.
> I'm not sure what you're intending to populate the component with there.

Sorry for the late reply, I took the chance and prepared a new version
showing what I intended to say here. v2 posted here:

https://lore.kernel.org/all/20251104114914.2060603-1-claudiu.beznea.uj@bp.renesas.com/

Thank you,
Claudiu
