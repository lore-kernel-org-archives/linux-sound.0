Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5704F13D2A4
	for <linux-sound@vger.kernel.org>; Wed, 14 Aug 2024 08:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723623799; cv=none; b=W+xUT9SkrCKLVdymk4NkMR3Sp6XN9D3PEvhQMH1fpdwS0KckLwZmv2ml1Nuc8fYE2KhNnORfUV8rZBb16MpbR8D8idIU9iUTPHqxZY5mlseeeASOD/lBxKdh8zUTdjAqG3Eqk0nSh7pVKGvoENBZy4VotfMaxRBreYbNxd4PKzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723623799; c=relaxed/simple;
	bh=0CSWgPhv1C1tSHCnjvH3fpngV0BuO55p5vt/diV7PqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=czAWZspt83gBw8hKX1jP2RjRaQJUgcQ3CCsA8NNEVOLWjrhGFrzlw1kjQGYheGQ+wRdRqV25LUZhg78Ku82cBqmL7r/8VhRethdx7XzaQ3D1m/VG7cBFWSIYEQg6LZ+5CgZB5HVrzh2ecU2e5XJ+BpBya79QCcYnM5RLTXYW6n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zpuLtBTy; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zpuLtBTy"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52f0277daa5so8498970e87.0
        for <linux-sound@vger.kernel.org>; Wed, 14 Aug 2024 01:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723623795; x=1724228595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xk10wNvxLrP/sk7V6x9kzu7jdVHg9lMcvom23sK8kpk=;
        b=zpuLtBTydfE1azZCI3cyYdocQ+iOvRBLl6Ms6Tet/7GuwratUJg/VS0tda6q1iUI/X
         72AZhFCMUN89tBjhRar4OnWRqVdgkChboJMrma5jPeDYe9eI5fU4/sE89sJfqaXMVA3g
         uM5e7BkuY9YmbJoJVQ7kACL2V+VrFZOUm8xeW+RizdEMfBYXK3ftHyPXIhJ+0biJDA8v
         5cwNPhzLyH6GJVGobCa3/P6c2lbk0W65zDAIfFUZFLY4bI5hx+8SE9pclcZ7nlKUqVnF
         DX1ZZG0DjyQRTjuswxnw52u/Rl6uTkiLAIVuTNqE4EnECXkoSfPAJQJ62x8HVSFnmyNy
         /EAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723623795; x=1724228595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xk10wNvxLrP/sk7V6x9kzu7jdVHg9lMcvom23sK8kpk=;
        b=tdeqG3vFSRFXiDMuK0yc3otnL9fEocCIsxW8fvzJhWLG1dh8pEw1Ig1Uhbv7q+wQqs
         r/l2qe4xX4ymLSC8ayp5Z7fRSjFG4vAiSNrW+Kb3Njji4Tet2VKPEflFxySKNgsXAcLM
         dR+thr8klOxPoc37q2UGDmWLU3js8MfObwJMYzzN+G4MPZkTU7dX0lY4ofmyby2t+eyp
         9PFFSHPBDoJP606hsd07C/SfV/E8VzegBXXQLsPIOWhavoSf4cNGra2aJvEPgpUF/Mzp
         1E6hSi0w5/meI2wb/SLC6HWYBbI7arzh7qqpizlwuzUYf6JsPQcojx8xzjoM6Gu11yoj
         sMOw==
X-Forwarded-Encrypted: i=1; AJvYcCVny1f34pae11Fx8XMxaQGJ0jCAOYepsrgmmmwrPPPCjn+Bf0dpzxwV70VF1xlXJSzw6Nschpjt+vBaJLg+9dF3uqEOVcVB4fcuNgk=
X-Gm-Message-State: AOJu0YyH3BblYQK1zhY0Y/cLzLdzA2HbWQCMy2/HSfCoxPs+Knwv9a++
	/C961qwMqTATipE3/LniR/hPy3Yr6U/Jy7ePC0ZCrZfeF+Yg7/iwKdiyxuD+H+E=
X-Google-Smtp-Source: AGHT+IG6QSK40+UiY4L+iFUDmpExRkRbgPPw1TX9OKeTaKxcEceJXBh+o1azq0f3RjCLgFSJ+P0yEg==
X-Received: by 2002:a05:6512:3e0c:b0:530:ad8b:de11 with SMTP id 2adb3069b0e04-532eda8e5ddmr1174870e87.9.1723623795153;
        Wed, 14 Aug 2024 01:23:15 -0700 (PDT)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4e51ebcdsm12266411f8f.78.2024.08.14.01.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 01:23:14 -0700 (PDT)
Message-ID: <24215f3d-30bf-4379-bb10-c4b183c16b8a@baylibre.com>
Date: Wed, 14 Aug 2024 10:23:12 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/16] Add audio support for the MediaTek Genio 350-evk
 board
To: Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: khilman@baylibre.com, linux-sound@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Will Deacon <will@kernel.org>, linux-media@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Nicolas Belin <nbelin@baylibre.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Catalin Marinas <catalin.marinas@arm.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi guys !

Simple gentle ping, the serie seems ready to be applied.
Thanks

-- 
Regards,
Alexandre
