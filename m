Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.42.129.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187669;
	b=bFtrY7rkxT6dDI8B8ulC1/Vq8e2PPOkFavK76Q2bajfDb7Vez5D0BjpnkqKtObpAYWQJ
	 e7hyIF9pFlNzxWHI2rxX7XHyqUXr+fWxxiY8AKH1g5SVfLPVlHL8c0Eg6f6w50Xeq4tCD
	 O5qdufTZTTSpJKS1r7KNh0rx6vnRxjSNpfXeMeiNqDFUdN//hQjb8N84AJC9PrNJjDZ1t
	 klLLSzMcy1x2MQzlVEN96B2bdmZZSWyX4j6rLAiEHLha5q9tBbRf5z6jto8lG2bl0CiWM
	 2KVU1zP9JSxL45WpOgXlQciMFNtyAULp7GeGMiBDRtB5Pi33PreIgWo3WNnyNw2Uw1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187669;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=NilhZec3NzhSq2kvh3OODZ0EuL968UpLZVD86XHzdYE=;
	b=EZHFfiRXSy+yHz8FxoNCWOnA1ZD0PYYQ8w7zBgMrcE3NLj5j4HUiTik3zy30ZSjor7ai
	 tVeeZM+tJnFTxVZQg+1NJ5awGCq2JsXSfTgGR0VQjtqhe/Wg/L+aXrzP2lyyGYXVIvtuS
	 kRoZrESmumXjHVoBMBVqWAItiJBPbHxGu7pyA7OEyFR1s/xRSb7vSfAzlRpc46naPEnh9
	 FIjawUxkDqs2fkMaU1//ZFm7nePBI9mruHXUXL162eOURBNS3JzuwdqGuRrQqo21GhLd1
	 2leRQ/0DdQZ7IedIdtk7DQ2ukduD6aB5+YaVXAr9kh1GFsd2Aj/1j0qr75qECSTfBRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ixit.cz;
	spf=pass smtp.mailfrom=ixit.cz;
	dkim=pass header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b=D2ojOaSY;
	arc=none smtp.remote-ip=84.42.129.46
Received: from ixit.cz (ixit.cz [84.42.129.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF7D606A325;
	Fri, 20 Nov 2026 15:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BF7D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b=D2ojOaSY
Received: from [192.168.42.97] (nat2.prg.suse.com [195.250.132.146])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id E20B05340C68;
	Fri, 20 Nov 2026 16:14:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1795187666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NilhZec3NzhSq2kvh3OODZ0EuL968UpLZVD86XHzdYE=;
	b=D2ojOaSYaDEpoS+XktlkXEePulCQlBMsAfJV44JOw38KXXifkwcleKnE0cbM7tbHofReE2
	AYR0wEX3uMLRwMDT4/oatGE8MLyi6gp6KV7DtahRp5Mo7KrbVzlhgMWm2gXGXfTRVJadOy
	9UlMDd/zT4kfK9+EdkRulNh9NYdJOps=
Message-ID: <d1694124-558e-455e-b4ce-10363ede09ba@ixit.cz>
Date: Fri, 20 Nov 2026 16:14:25 +0100
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
Subject: Re: [PATCH v4 0/2] ASoC: codecs: add Texas Instruments TAS2557 smart
 amplifier driver
To: Gianluca Boiano <morf3089@gmail.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, "Wang, Sen" <sen@ti.com>,
 Markus Elfring <Markus.Elfring@web.de>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261120004414.1686884-1-morf3089@gmail.com>
Content-Language: en-US, cs-CZ
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <20261120004414.1686884-1-morf3089@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/11/2026 01:43, Gianluca Boiano wrote:
> The TAS2557 is a mono Class-D smart amplifier with an on-chip DSP for
> speaker protection, controlled over I2C, with audio over I2S/TDM. The
> DSP needs a firmware image tuned for the speaker; without it the chip
> passes no audio.
> 
> Patch 1 adds the binding, patch 2 the driver. One node describes one
> chip or a stereo pair on one bus, using the reg-array convention of
> ti,tas2781.yaml: reg index 0 is DEV_A, index 1 is DEV_B.
> 
> v4 uses tas2781-comlib for register access, adds the firmware rate
> constraint asked for in the v2 review, and addresses the v3 review
> from Mark Brown, Krzysztof Kozlowski and Markus Elfring. The
> ti,imon-slot-nos/ti,vmon-slot-nos properties are gone: the register
> they were written to only holds the I-sense scale. I/V sense now stays
> on while the amplifier plays, as in TI's driver. Details are in the
> per-patch changelogs.
> 
> Testing: built against broonie/sound for-next with W=1, checkpatch
> --strict and dt_binding_check clean. The v4 driver was run in mono on
> a Xiaomi Redmi Note 6 Pro (SDM636, ASI2) on a 7.2-based kernel:
> firmware load, playback, stream restarts without a program reload and
> unbind/bind. Stereo pairs, TDM, DSP_A, ASI1 and suspend were not
> tested with v4.

Thank you for working on this. We have mutiple use-cases in sdm845, please let 
me and possibly phone-devel@vger.kernel.org in CC.

I may sent tas2559 a top of your patch at some point, thou I think it has some 
cleaning ahead first :)

David

> 
> Link to v3: https://lore.kernel.org/linux-sound/20260717233402.414326-1-morf3089@gmail.com/
> Link to v2: https://lore.kernel.org/linux-sound/20260711145722.188556-1-morf3089@gmail.com/
> Link to v1: https://lore.kernel.org/linux-sound/20260709221331.989109-1-morf3089@gmail.com/
> 
> Gianluca Boiano (2):
>    ASoC: dt-bindings: add Texas Instruments TAS2557
>    ASoC: codecs: add TAS2557 mono smart amplifier driver
> 
>   .../devicetree/bindings/sound/ti,tas2557.yaml |  158 +
>   MAINTAINERS                                   |    1 +
>   sound/soc/codecs/Kconfig                      |   13 +
>   sound/soc/codecs/Makefile                     |    2 +
>   sound/soc/codecs/tas2557.c                    | 2973 +++++++++++++++++
>   sound/soc/codecs/tas2557.h                    |  207 ++
>   6 files changed, 3354 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2557.yaml
>   create mode 100644 sound/soc/codecs/tas2557.c
>   create mode 100644 sound/soc/codecs/tas2557.h
> 
> 
> base-commit: cee03387d20bb267663085d9ac2622ff9263d302

