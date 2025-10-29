Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5315B2FFFA9
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 15:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761751761; cv=none; b=a+NGLAxwZXSTekTSwernO792y7J9SuX+Rr7DxUjbqeaPnBrnEg/2vr4LYmnEPvs4ihIaJ7qvaSpKhDkpJDOpLavsSHCto+5QOw+s0DCX6zwGUP3onOGtrIrpbELs6N9d/2F6Ty54yWPX4p5IPOkNbmch+3Ds9Wzd9lKBs9Plg2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761751761; c=relaxed/simple;
	bh=TmGjDwl2biFKFoDG5SxYDx3zPkhg2VZY+lBriMDwGx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rTerltXzj7ghn3OCEDhnfupsX6tsKMwBR9gXWNcGuq4bVeKyStVC9VTrKVdU/Eg0VljBT/ZBe3eYPgvGxIveR6xUYK8hm1vkI1HAa9aMHVyZDZcpki3Ch4KzFYMrRfEVou48ss9MeqG7XaIbyDmkTngoFnPg6tsButnSmnZdLtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Qgvfddvi; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Qgvfddvi"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42557c5cedcso4691010f8f.0
        for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 08:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1761751758; x=1762356558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ctrvyyDmJlg0kkSAOlpyChaeCX1qtmxwTU/oEiWOUXQ=;
        b=QgvfddviuL4U1MV5cXmGqID6ZQRTMgk/pKJAyTedB4yKgt/5I7fYI3uX2K28xRIB1f
         niJcAZwrL8bGENW0ANzIaHDk6lt7dEYnHlidgcroyHA5fvQPekk7AUVysieHtMK29Mfy
         nbwyR790XFJp3ZQK1xKKIY1IpWQq2TsTgtJUNbtY9+JdEoUwPUz2IDOFLVP/Kvu1rNOh
         /Xr/XrD3Q3QHDgHwF0MVAFuVK9oiiZWAcI9t/oM9LAOfGhiBNE4ock+UeXE4t0Sr/ZHL
         MQsOzXr3W/C7B9HqiV1HKo6+ItlZlJSkLZzgClPUyqfGkUpXBBMeOeaUsvEfzzS57SIG
         9/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761751758; x=1762356558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ctrvyyDmJlg0kkSAOlpyChaeCX1qtmxwTU/oEiWOUXQ=;
        b=ZIt21kMZWj3tGAWBsqXz13vu2PvtXn4d5kj3u9wvzjS2edQNvyHMVPBX8MHyBXpoU6
         sbUMfQow4XdMI9rzBSdyNQYcYrqxTy/EQn0GEC5j4i/gAPLKWihbxk7yH9LUXzut/i66
         Fgo2qaZJ9NT74KXQWZM6gKCxLlwOEnybu56zqJNlu7d5WBffNC3cba1vLaEQAOpPLmak
         HHQoJhPjie4JFpJzSi9K6wflF8uO5Dz3QSgiPt+/xHMt3A6U+G/ZjhmYT/S2zp4tRkbH
         dyuuc+09+oYYehar6xDhDOnnB6VX/g8Ab1GYTfaiNRIzfMLZhXbPN/1/Zsyd6+A47meg
         EvKg==
X-Forwarded-Encrypted: i=1; AJvYcCXlHIlmoQgYAAuV2eAOoelJF4kDJXtQd/PO36MkVC3d1LNT/Y8u9rev0gLUitM+uOn1kXz1AcfqBCAs8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEy42DbFwInk88db/CzaPuDl7bP20fCpEsM9v3vQCCV5cz6iIa
	/WjBr/ZboJKzr63jmr5xJImjNhZWkZy/WMzOsi6frPyWPkOE82TTdUKf0t406A/vd2qJw4ChK9s
	iaZ1V
X-Gm-Gg: ASbGncvxgHDFZ8JQ6htdGblOVkm1V1KnunDVen9zZAuEYV+6nmF/TzlMpd+Qa01ghCk
	FN016H/gsL5S5iP+Xf+N0TmMH614f+K2Qlg+DhzFwBFnYnNx8rklukYacYX1h8lRYruDa+L8ACL
	soxWRDntXoq6iXI8p642iUaKAYqDxS6gbdEaSpF6Ux6g37sR7fPF05ks5qBteNFn925mtIzOQvP
	dPy7054Ic1ZBepM8eEyGgh/2P6oOF/JM4j367GTV79MZLKegjWAkYckQsnCEwapX5zDebnrMpFH
	cVZwDD0q/R2qRtO08ABTQPkUufp1OQGgl0qtg3pxygVEI8NEWUd4PyqUsG7rr20JPY0QDs3gK78
	F06Oy3RlMlGmKI7AfdtBAs1DXA7sXJ70EiVDU8/bAGp5wG0SScmNkBeuwSOm1qBgfhXNTj3Tbb2
	kSSztqI7UktRZfGhM6y8PqE4CSJFM1W/h8z30xaOHNvO/CoJFTy3MCsexS54dERTcSiQ==
X-Google-Smtp-Source: AGHT+IGzKqIEUwGf7yC1EsnKLvYTprAHG5oxW1NDlfiVKv2vlfeP0rhWW9WukDhz1d/BkHuM2+I88A==
X-Received: by 2002:a05:6000:1787:b0:40f:5eb7:f24a with SMTP id ffacd0b85a97d-429aef77707mr2833160f8f.12.1761751757674;
        Wed, 29 Oct 2025 08:29:17 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6302:7900:aafe:5712:6974:4a42? ([2a02:2f04:6302:7900:aafe:5712:6974:4a42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952cb55asm26959094f8f.17.2025.10.29.08.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 08:29:17 -0700 (PDT)
Message-ID: <9d254e18-2e2f-49ce-b785-ef0f16117550@tuxon.dev>
Date: Wed, 29 Oct 2025 17:29:15 +0200
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
 <84aabf5e-c782-4e40-8e34-c8e7101188fb@sirena.org.uk>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <84aabf5e-c782-4e40-8e34-c8e7101188fb@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/29/25 16:37, Mark Brown wrote:
> On Wed, Oct 29, 2025 at 04:11:33PM +0200, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Since snd_soc_suspend() is invoked through snd_soc_pm_ops->suspend(),
>> and snd_soc_pm_ops is associated with the soc_driver (defined in
>> sound/soc/soc-core.c), and there is no parent-child relationship between
>> the soc_driver and the DA7213 codec driver, the power management subsystem
>> does not enforce a specific suspend/resume order between the DA7213 driver
>> and the soc_driver.
> 
> Oh, also:
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

I messed this up. I'll be more careful next time.

Thank you,
Claudiu
