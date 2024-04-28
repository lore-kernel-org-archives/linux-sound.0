Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7656EB5C
	for <linux-sound@vger.kernel.org>; Sun, 28 Apr 2024 15:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714318328; cv=none; b=iL9SWYOUnFsP5AhOMmERktGNi5GAR23HZwDT8CgAxSvZJpnpgAEr/Hw4Y9FbmDSZ0YYOiR4JwgHUi/SmOYvziDxH3f2j2pZjVKk6/drVx7ZSgzTZ3HpFEtZyKaoBD0lWe1Bvxdk4fehGRcFELE1uT7hBEMFTRcEBSABjCzVsRxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714318328; c=relaxed/simple;
	bh=fBeYTF/ok3UxBtPwI+q3QQsrFXPmBVBnjuiX8J3VMQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PoFmxSfeYwIX81duxCNoh5ihoR5/fAunahsPUxPlCiOD3ZMM2CgVv2+di+X9HusqfE8qZdPlzu9k240cO3Lp7HGDiNmUsJkVlSc1fwa/U4CCteMLEuCOZKVA32jfh5/pL4OJxZiO3rpM2Fnk420cRVSBw37WOycjNmyqLq81fMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U2pnp+G/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U2pnp+G/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714318326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p2rk3b82daJR4aYDGTiBOVZojg+15MWPW8M7QHsi7Yo=;
	b=U2pnp+G/pD8QtAwK6Il1GL4lHigEs2hVDiRrleSN3hiNj6qJwyj/+rF4EmhGIDj9fe8VKM
	n37NOLAJhYb2MG3N2cfNtF9HM3K2WIMcYzMhr+0afQN94y4hnOogcohJ60cJ9tYz5zbQpY
	cHah0gQQOHndrW4yfRuiZ6K4dFjsZvU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-TwU8mg3sN6-S9U4DzC1KOg-1; Sun, 28 Apr 2024 11:32:04 -0400
X-MC-Unique: TwU8mg3sN6-S9U4DzC1KOg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a58b9cf05afso190959766b.1
        for <linux-sound@vger.kernel.org>; Sun, 28 Apr 2024 08:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714318323; x=1714923123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p2rk3b82daJR4aYDGTiBOVZojg+15MWPW8M7QHsi7Yo=;
        b=bGHPHpThM3j3HIXASFh+t+u6a2/8NamB00pC0Af0W8EUJ7eEz8cyilon7PRVZWXnBf
         hgiq9WnK0rr1iF1Z8SEtYNXbF8j5KHBSQx7JoGSQts5f5+SCEhjClD1vYwCPIS41lWFh
         cVqwflB9qwaKs5aIG+jLPx+Op3OmSEYoaaIpCRNk/UrHRWwIbupB2iqLtGas/pbJEj9J
         niGAYl3iCj9Sbvwn0rwHqieyMNlEpizeTlBsEcS5LpHdKsLwxs/zrWqucUYq/nK5cToX
         rNYsCTmtbNHBT4QDE71E5HwJ+7Aoj/DiMfqck8tmL2vDjAoWwa1VbDbNH4DTUpzp3V83
         VKCQ==
X-Gm-Message-State: AOJu0Yxg8d7EzKRYjBStm4rA6GmktINasjflMLJp+RQS4hqO2L6+2chx
	9esrEWqil3sBRSjYKYzdC2nD54qN2Bto0mj0HEK2kK6Fl3tjAUEVRfIxh62zY5zV4VtsWdu6nab
	1AONbssP3cpvzw9g4Utkln1WhDrdpr+qB+/M4JmcMDbbOnH9CCX7e0bQLF4BY
X-Received: by 2002:a17:906:b349:b0:a55:6f69:a939 with SMTP id cd9-20020a170906b34900b00a556f69a939mr7066713ejb.41.1714318323498;
        Sun, 28 Apr 2024 08:32:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSqo1+9e38+j2Yobyx4qaDwbP/uzsPiGry1td2UWbf6KNEhx420b/YNJS3ifJw2jXvgysT+Q==
X-Received: by 2002:a17:906:b349:b0:a55:6f69:a939 with SMTP id cd9-20020a170906b34900b00a556f69a939mr7066700ejb.41.1714318323150;
        Sun, 28 Apr 2024 08:32:03 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id q10-20020a170906388a00b00a46aba003eesm12830416ejd.215.2024.04.28.08.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Apr 2024 08:32:02 -0700 (PDT)
Message-ID: <6027e255-0bd1-4be2-ab69-19cb91ed3db4@redhat.com>
Date: Sun, 28 Apr 2024 17:32:01 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bytcr_rt5640 : inverse jack detect for Archos 101 cecium
To: Thomas GENTY <tomlohave@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240428130736.877917-1-tomlohave@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240428130736.877917-1-tomlohave@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/28/24 3:07 PM, Thomas GENTY wrote:
> When headphones are plugged in, they appear absent; when they are removed,
> they appear present.
> Add a specific entry in bytcr_rt5640 for this device
> 
> Signed-off-by: Thomas GENTY <tomlohave@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  sound/soc/intel/boards/bytcr_rt5640.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index 05f38d1f7d82..12c90cb2a782 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -610,6 +610,17 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
>  					BYT_RT5640_SSP0_AIF1 |
>  					BYT_RT5640_MCLK_EN),
>  	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ARCHOS"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ARCHOS 101 CESIUM"),
> +		},
> +		.driver_data = (void *)(BYTCR_INPUT_DEFAULTS |
> +					BYT_RT5640_JD_NOT_INV |
> +					BYT_RT5640_DIFF_MIC |
> +					BYT_RT5640_SSP0_AIF1 |
> +					BYT_RT5640_MCLK_EN),
> +	},
>  	{
>  		.matches = {
>  			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ARCHOS"),

