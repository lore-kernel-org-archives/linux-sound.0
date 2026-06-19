Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A76A38757D
	for <linux-sound@vger.kernel.org>; Fri, 19 Jun 2026 13:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781874514; cv=none; b=fvCqkHMN75GBYWPQCCauYpr4wl+C2m0O0Q08D8nx+ZsYwH08KZ3B0AGPYuiNdwKikwqSKyyrl1ggtyWkvPorA/MmUpN8WezIRTkrPoO9lQY9TUnrZsRUZEM1juSa2iGMgcLKjZxRN6OEunPTOnJk2pHUT3u7i5djR3ONK5kbT3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781874514; c=relaxed/simple;
	bh=FZPyrhDIKHtZnqWESVoiWoI3FIueJBpbIWsR3B2EWZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GT9NeFU6l9faqDKD3Ws5RmwT18RehDPE/Q0Dlo0qzNMczq6ELSYSgGQbQ+O8VllwJIYUL6soqToSlqPSgHmfRSmxgsZSjTTyhqd7X+TZ3Bno/UyLNyzVWLMP52mcYjWPZ0o8Of6JemShNP4jREuvLwP8tBVonGjigi2EC1T8HmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gie6Az7b; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gie6Az7b"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-46066e640easo1307758f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 19 Jun 2026 06:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781874512; x=1782479312; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kZhsgkJerSVKBfdIsaLkYedynvx7vkcSWkFfn2/TgwA=;
        b=Gie6Az7bjjKPlKAFg/cOiXEPJg+s1YBK3enJ8uOsKyGYxz6BkkdyBGgU+Jj0BbJYt1
         DL8IYWwfUhXwcpEqCeCQVgGL6BVOzMSNWIKN8pI4UkVMsb6HDdB87B1Kkwe6PbfH+i05
         gd4CVCubIR4NzsS43L47q07LzUuRWdZX1Lx5UxPVCOy73nwa+qXIoAdi9/KleXyUJRk+
         Ao5LTKjynD4g9BbzCVZlt+xzpSmVZLQpNlXVsWsfFLc0+xHT7ZgU1V/0rfVxoSaWoZ7v
         ADVFmJ5qCYVtVSz9z2Ko6Xl/9D7So+PU5hijWQo7/pkmYUX8+JeE9bVBMZfbhp/i6fqy
         PSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874512; x=1782479312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZhsgkJerSVKBfdIsaLkYedynvx7vkcSWkFfn2/TgwA=;
        b=ngBaLskQ9qb/t47ewJfNl1+pMVx8wDpENzzjrYQAbEl1nLUzKKKTOWvhLVtGh812OM
         yGXLZGbgkXxxuOhwhXWeAz1cB4EyTzYLEr0zw+DbGfymRqLVy2AikYqaXeeoiBWhZ/i9
         xSI/FurdEZY2AD4SBRF1wfxvbsc3kb/inSrhYuk7OADLF+RM7Wv9bzVLYvEbPDKKuENl
         hF+VitCToKNsZ2ZYMo3hqKqbrmCx4qXRV2b6hv2WD6FpGw9kBAbOnlSBCedqUldyX8DP
         91evowdcSedsamqdIEvS5cqn16GFapDAIg89FaO0QNaPNHpXnwQNM8i/ZPb8Q5pq/nQL
         NgGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+KZrbrL1mVLa4+9g3kz0qZXB8sbAMF0HKW3XbosfInBbsyH8RNQhyGlsBDaKlfeHOsRl+wKHgK6p948g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzhYz+NFWlMmXYhfhofzFp+LdJbkt1iKPVIi4r1HaRNG3QsX+e
	oMfXzWdXyLX+08Jj1DESim1yFC48KRoFv6D7shFbzR66zj3iTrrdfbw9
X-Gm-Gg: AfdE7cnuePwheRdKr0imfztJT+pSD0+BiIRslhXDXkgrbIDDtxCuVpcvNvrWc+CzNkW
	Py6kxMmZC6ZBHa3+8nAIrIrG8JXXOIvU/PGVmevoPMcJ5Z5NmaaEm/RguKguq0V6AXXdJzXrMgR
	Zj6+CkTAcVrQokUfD74U4wp856r/lImcUhNa99Yxqs4488sG9GqRdtE0tkG5z5ZZUgv8Skm6Qa4
	Y2i8CmBiihT0/4ruOnTOkaoBAw8QWXh+x0NI615zvStro6wNBRcrcfWKjWX1eWwuX9kVlWuF6Nv
	XGGHfC+9UqXoJe/KvF/kVUIvYEEVRvy5D7O0/gEIGIq/fzz2znR8hEMuGZqjgrUenqozOwk4rUl
	Ax8z0S0RzAojYCpb2Dx5Cvl5lGXHDHzjsP8XaN7P9IEY1aFzNm0NNQPqHD4ZplShjrk9yoXSprJ
	5Luq90BUB2ZRc0d6myj7X/zvxv6+QxTGi/gIq5kD4RXkhCQe5EyFBPyR5EZDycZ+S4e/db8I/Wu
	QEnk8w=
X-Received: by 2002:a05:6000:481b:b0:45e:eaed:afd2 with SMTP id ffacd0b85a97d-465041d5b0amr6899357f8f.0.1781874511611;
        Fri, 19 Jun 2026 06:08:31 -0700 (PDT)
Received: from [10.128.11.42] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650b67a33csm7291097f8f.17.2026.06.19.06.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 06:08:30 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <f092d0a0-3188-4fd0-8228-2b715c642a08@gmail.com>
Date: Fri, 19 Jun 2026 14:08:29 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: acp: Fix linker error with SDCA quirks
To: Syed Saba Kareem <syed.sabakareem@amd.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Sunil-kumar Dommati <Sunil-kumar.Dommati@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Mario Limonciello
 <mario.limonciello@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Randy Dunlap <rdunlap@infradead.org>,
 Simon Trimmer <simont@opensource.cirrus.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Hasun Park <hasunpark@gmail.com>,
 "open list:AMD ASoC DRIVERS" <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260619124343.1683484-1-syed.sabakareem@amd.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260619124343.1683484-1-syed.sabakareem@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Syed,

On 6/19/26 13:43, Syed Saba Kareem wrote:

>  config SND_SOC_ACPI_AMD_SDCA_QUIRKS
> -	tristate
> -	depends on ACPI
> +	bool "AMD ACPI SDCA quirks"
> +	depends on SND_SOC_ACPI_AMD_MATCH
>  	depends on SND_SOC_SDCA
> +        depends on SND_SOC_ACPI_AMD_MATCH = m || SND_SOC_SDCA = y
> +	default y
> +	help
> +	  Enable SDCA quirk support for AMD ACPI match tables.
> +	  This is compiled into the snd-soc-acpi-amd-match module.

This Kconfig file uses tabs instead of spaces. Most of your Kconfig
additions are formatted correctly, but one line uses spaces.

- Julian Braha
