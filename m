Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD34CB64A;
	Sat, 16 Nov 2024 08:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731744345; cv=none; b=OT2ykCyrp7ssKROhMsBVwVkFUfl9N8tzmfAJP17QAPFI+nQkLMDlvSSZGp1vDEWkLNY3iiNQ9P94CEUc/P9gkppOe1qVuGN4EHvBfRnA4jr8YKBhgr/CarcfjoiS3JGEZxmeJhTnIARvZWyC2SZC2Bp54QD2/5g0t1keQ0HqR7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731744345; c=relaxed/simple;
	bh=wgiLgzGKAYU27R3fy6i2E+LUkALYGlu7ODHf9sXAqfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kt1fBNq0zdqwUMEniUHFkGsZht58GHdtDpGF0Ja9p98DAeBKssllfxgyIEVwGAbvPdUAaG6bLhHXPCeo+fIPDq8jnR423CrmGuIVIi62DJxXupLSmUomzxQKFK4smvxUM9gLd41gJvGLHd6Q4aLoQA2SWhJjI8kByu5iHlVVidQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=myzmuc4y; arc=none smtp.client-ip=80.12.242.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="myzmuc4y"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id CDo4tecI9mK41CDo4tW2mE; Sat, 16 Nov 2024 09:05:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1731744334;
	bh=b+0UwGUK36XBZvKxvr6vjvATT91j6JD6JlC0ymG+Y2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=myzmuc4yZf7QyGuZva4JAt/xz9USMrsudZ8Ml04eo6D14T1a+RFluvnmVReDMCxeX
	 I873nmlwJKtlY5sCp/rUGMUY+v7PjpgHpBoJ2sGFGKEGvLVHkonzsZzmjWryqomNmd
	 PaKr0gw7h9yyg23v/8wW/OCYZGaRgHeYek81hCWfNAOq+K/qELx1Ufj6SLQbh7savU
	 Dh9sJpkuijTxAxo12hMSRpg5D4SgIdyXuoyrlcZ1Eh0AqVA9EJOH4cMQbhlI2WblXt
	 z4UQXaqz9syWILV92AwehIwJfohfDohJF7pWWmSRV4jIwzOS/0gVjhYl1PVJNA15hY
	 Kac5OCl9eSHjQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 16 Nov 2024 09:05:34 +0100
X-ME-IP: 90.11.132.44
Message-ID: <03d4131f-7204-4cc5-811b-ef541f904e17@wanadoo.fr>
Date: Sat, 16 Nov 2024 09:05:23 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] ALSA: hda/tas2781: Add speaker id check for ASUS
 projects
To: Baojun Xu <baojun.xu@ti.com>, tiwai@suse.de
Cc: robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
 lgirdwood@gmail.com, perex@perex.cz, pierre-louis.bossart@linux.intel.com,
 shenghao-ding@ti.com, navada@ti.com, 13916275206@139.com,
 v-hampiholi@ti.com, v-po@ti.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
 yung-chuan.liao@linux.intel.com, broonie@kernel.org, antheas.dk@gmail.com,
 philm@manjaro.org
References: <20241116075006.11994-1-baojun.xu@ti.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241116075006.11994-1-baojun.xu@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 16/11/2024 à 08:50, Baojun Xu a écrit :
> Add speaker id check by gpio in ACPI for ASUS projects.
> In other vendors, speaker id was checked by BIOS, and was applied in
> last bit of subsys id, so we can load corresponding firmware binary file
> for its speaker by subsys id.
> But in ASUS project, the firmware binary name will be appended an extra
> number to tell the speakers from different vendors. And this single digit
> come from gpio level of speaker id in BIOS.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

...

> +	sub = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
> +	if (IS_ERR(sub)) {
> +		dev_err(p->dev, "Failed to get SUBSYS ID.\n");
> +		goto err;
> +	}
> +	// Speaker id was needed for ASUS projects.

Comments in this file are all /* */.
Why introduce // in many places?

CJ

> +	if (!strncmp(sub, TAS2781_ASUS_ID, strlen(TAS2781_ASUS_ID))) {
> +		ret = devm_acpi_dev_add_driver_gpios(p->dev,
> +			tas2781_speaker_id_gpios);
> +		if (ret < 0)
> +			dev_err(p->dev, "Failed to add driver gpio %d.\n",
> +			ret);

ret should be indented below the ( to ease reading.

> +		p->speaker_id = devm_gpiod_get(p->dev, "speakerid", GPIOD_IN);
> +		if (IS_ERR(p->speaker_id)) {
> +			dev_err(p->dev, "Failed to get Speaker id.\n");
> +			ret = PTR_ERR(p->speaker_id);
> +			goto err;
> +		}
> +	} else {
> +		p->speaker_id = NULL;
> +	}

...
