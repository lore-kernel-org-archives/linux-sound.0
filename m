Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1133E13D51D
	for <linux-sound@vger.kernel.org>; Fri, 23 Aug 2024 07:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724399778; cv=none; b=u2ZwLm7SH+pn1skFDNFoqHwGpH3UChQDgx/CibQ7TitIh4RF8SIJD6CxzENxgK5+RQXFUvedMwIB9SvMA1b3zx2SCwHG7lxl5ddLrEJ/CYIZ2xzTVLXrtFts09NWIvzgvStO6jkDLtKdo2lc/5odWMCzrSdabb+JtXKCVLuUj8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724399778; c=relaxed/simple;
	bh=UnkjIqsgpuDw3lA6RC1Oy2mDZXH4IxyC1VDxZQjr3Zk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eeVyFMIZ0uKepYrk+5c3g41eCuzHUVSaBfSaSOY+qtK9Djuj5h5n4cfcFjpPnnE+W8k9oHE1Ee/gTUVes1ScNUjP6jubb3mb4wv/sj5tBOzLqr1oxXEdUlxpdDAH+rwsGOLVqnfA1x3McGaxEFfOIqEbfNdSksRYmJnYDtWHOOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ImfE0EtP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ImfE0EtP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724399774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o3rE6SPPqCEkxSpsKu0BA3akjdr3RbmTBuI1l5d5u00=;
	b=ImfE0EtP6fqHjuMhC/fEuUWSygzDYv5edZN40sSfK1dzj2dxS4ckXPcQKlD/kkIl83Se49
	Ob3GrL6jwZb/4uliB7gadabjimJXDlPTUuYXXS/n7frx/XyPEoAIOAylXX8ePp3wRh2s7a
	EBKZ02ELa31hsyhyABlgum/72MbcOr4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-JQfiKgOZPLOjtlkiHNVevQ-1; Fri, 23 Aug 2024 03:56:13 -0400
X-MC-Unique: JQfiKgOZPLOjtlkiHNVevQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5bec6d21e36so1534315a12.3
        for <linux-sound@vger.kernel.org>; Fri, 23 Aug 2024 00:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724399772; x=1725004572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o3rE6SPPqCEkxSpsKu0BA3akjdr3RbmTBuI1l5d5u00=;
        b=Be1De0lHmcLtc+Pp3F+U1Y5IQ8DAK4lUAgBvbmkF0UgaNaViybpWIfn73r2dUIR0H8
         xZ3d8F71JjrtEWPxDgjN1MnKgDkAPU15dtdelqLMJlKQZ4/wB9gz+EtDdA2UCfUKp+vS
         dOjhN+NBAMSG+U4np/W6E4wlzQ9joygf2FX8+1Ud+lvFJeftxKC/EUPCdjOMP2nMvnEX
         jMnIrE2gigXg3IxHAAARc58J7Dh5vHU//Fe31Lv0DcO7+g8yn7tAPUc52dzlZvlrUg6M
         5yICA/arnsJ/oCpa3D/i4XaHpeNExW5T766WODTSWkVlCiHKOvj9ufjY2c9dFnUO18uk
         lhFA==
X-Forwarded-Encrypted: i=1; AJvYcCVCI87AQ+9OKugay4AVoN5oB6fOejJTYbC0s+jUc50SJHYh25JP4uxYTapEQrjUOTm2KE9aP6cXC4sKwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXkhZepYHbky2Wbl4L7dxZc337+Vq1w9kWcN6bSKV5zA1fvtUy
	401kJc80fTX2ginzPHTMAvOARH4TV4L39i6VOaxLtv0xNrcIbF81MvfZetY6ga0VGttSwrB9tcf
	lInnmiMLAP/KEmYpjGhD87r22Ye1msaSStubzEq9zu9j6gn+alqgICj7w3OZX
X-Received: by 2002:a05:6402:26d4:b0:5be:eb90:183c with SMTP id 4fb4d7f45d1cf-5c08915f4edmr1021204a12.6.1724399772107;
        Fri, 23 Aug 2024 00:56:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt7ZrIo78ATykBmqzyr2793HrCm9JJz0Ya3Mn61oH69MDDdy93LM3XfDYAmYoEzXNNvddjFw==
X-Received: by 2002:a05:6402:26d4:b0:5be:eb90:183c with SMTP id 4fb4d7f45d1cf-5c08915f4edmr1021181a12.6.1724399771620;
        Fri, 23 Aug 2024 00:56:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddc2bbsm1763978a12.6.2024.08.23.00.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 00:56:11 -0700 (PDT)
Message-ID: <6d97c46b-85f2-41f0-9d99-db734631fb4d@redhat.com>
Date: Fri, 23 Aug 2024 09:56:10 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.11 regression fix] ASoC: Intel: Boards: Fix NULL pointer
 deref in BYT/CHT boards harder
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 stable@vger.kernel.org
References: <20240823074217.14653-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240823074217.14653-1-hdegoede@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Note the subject is not entirely correct, I first noticed / hit this
with 6.11, but I believe it is present in older kernels too.

Either way the important thing is that this is a regression fix and
should be send to Linus this cycle.

Regards,

Hans


On 8/23/24 9:42 AM, Hans de Goede wrote:
> Since commit 13f58267cda3 ("ASoC: soc.h: don't create dummy Component
> via COMP_DUMMY()") dummy codecs declared like this:
> 
> SND_SOC_DAILINK_DEF(dummy,
>         DAILINK_COMP_ARRAY(COMP_DUMMY()));
> 
> expand to:
> 
> static struct snd_soc_dai_link_component dummy[] = {
> };
> 
> Which means that dummy is a zero sized array and thus dais[i].codecs should
> not be dereferenced *at all* since it points to the address of the next
> variable stored in the data section as the "dummy" variable has an address
> but no size, so even dereferencing dais[0] is already an out of bounds
> array reference.
> 
> Which means that the if (dais[i].codecs->name) check added in
> commit 7d99a70b6595 ("ASoC: Intel: Boards: Fix NULL pointer deref
> in BYT/CHT boards") relies on that the part of the next variable which
> the name member maps to just happens to be NULL.
> 
> Which apparently so far it usually is, except when it isn't
> and then it results in crashes like this one:
> 
> [   28.795659] BUG: unable to handle page fault for address: 0000000000030011
> ...
> [   28.795780] Call Trace:
> [   28.795787]  <TASK>
> ...
> [   28.795862]  ? strcmp+0x18/0x40
> [   28.795872]  0xffffffffc150c605
> [   28.795887]  platform_probe+0x40/0xa0
> ...
> [   28.795979]  ? __pfx_init_module+0x10/0x10 [snd_soc_sst_bytcr_wm5102]
> 
> Really fix things this time around by checking dais.num_codecs != 0.
> 
> Fixes: 7d99a70b6595 ("ASoC: Intel: Boards: Fix NULL pointer deref in BYT/CHT boards")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  sound/soc/intel/boards/bxt_rt298.c      | 2 +-
>  sound/soc/intel/boards/bytcht_cx2072x.c | 2 +-
>  sound/soc/intel/boards/bytcht_da7213.c  | 2 +-
>  sound/soc/intel/boards/bytcht_es8316.c  | 2 +-
>  sound/soc/intel/boards/bytcr_rt5640.c   | 2 +-
>  sound/soc/intel/boards/bytcr_rt5651.c   | 2 +-
>  sound/soc/intel/boards/bytcr_wm5102.c   | 2 +-
>  sound/soc/intel/boards/cht_bsw_rt5645.c | 2 +-
>  sound/soc/intel/boards/cht_bsw_rt5672.c | 2 +-
>  9 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/bxt_rt298.c b/sound/soc/intel/boards/bxt_rt298.c
> index dce6a2086f2a..6da1517c53c6 100644
> --- a/sound/soc/intel/boards/bxt_rt298.c
> +++ b/sound/soc/intel/boards/bxt_rt298.c
> @@ -605,7 +605,7 @@ static int broxton_audio_probe(struct platform_device *pdev)
>  	int i;
>  
>  	for (i = 0; i < ARRAY_SIZE(broxton_rt298_dais); i++) {
> -		if (card->dai_link[i].codecs->name &&
> +		if (card->dai_link[i].num_codecs &&
>  		    !strncmp(card->dai_link[i].codecs->name, "i2c-INT343A:00",
>  			     I2C_NAME_SIZE)) {
>  			if (!strncmp(card->name, "broxton-rt298",
> diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
> index c014d85a08b2..df3c2a7b64d2 100644
> --- a/sound/soc/intel/boards/bytcht_cx2072x.c
> +++ b/sound/soc/intel/boards/bytcht_cx2072x.c
> @@ -241,7 +241,7 @@ static int snd_byt_cht_cx2072x_probe(struct platform_device *pdev)
>  
>  	/* fix index of codec dai */
>  	for (i = 0; i < ARRAY_SIZE(byt_cht_cx2072x_dais); i++) {
> -		if (byt_cht_cx2072x_dais[i].codecs->name &&
> +		if (byt_cht_cx2072x_dais[i].num_codecs &&
>  		    !strcmp(byt_cht_cx2072x_dais[i].codecs->name,
>  			    "i2c-14F10720:00")) {
>  			dai_index = i;
> diff --git a/sound/soc/intel/boards/bytcht_da7213.c b/sound/soc/intel/boards/bytcht_da7213.c
> index f4ac3ddd148b..08c598b7e1ee 100644
> --- a/sound/soc/intel/boards/bytcht_da7213.c
> +++ b/sound/soc/intel/boards/bytcht_da7213.c
> @@ -245,7 +245,7 @@ static int bytcht_da7213_probe(struct platform_device *pdev)
>  
>  	/* fix index of codec dai */
>  	for (i = 0; i < ARRAY_SIZE(dailink); i++) {
> -		if (dailink[i].codecs->name &&
> +		if (dailink[i].num_codecs &&
>  		    !strcmp(dailink[i].codecs->name, "i2c-DLGS7213:00")) {
>  			dai_index = i;
>  			break;
> diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
> index 2fcec2e02bb5..77b91ea4dc32 100644
> --- a/sound/soc/intel/boards/bytcht_es8316.c
> +++ b/sound/soc/intel/boards/bytcht_es8316.c
> @@ -546,7 +546,7 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
>  
>  	/* fix index of codec dai */
>  	for (i = 0; i < ARRAY_SIZE(byt_cht_es8316_dais); i++) {
> -		if (byt_cht_es8316_dais[i].codecs->name &&
> +		if (byt_cht_es8316_dais[i].num_codecs &&
>  		    !strcmp(byt_cht_es8316_dais[i].codecs->name,
>  			    "i2c-ESSX8316:00")) {
>  			dai_index = i;
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index a64d1989e28a..db4a33680d94 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -1677,7 +1677,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
>  
>  	/* fix index of codec dai */
>  	for (i = 0; i < ARRAY_SIZE(byt_rt5640_dais); i++) {
> -		if (byt_rt5640_dais[i].codecs->name &&
> +		if (byt_rt5640_dais[i].num_codecs &&
>  		    !strcmp(byt_rt5640_dais[i].codecs->name,
>  			    "i2c-10EC5640:00")) {
>  			dai_index = i;
> diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
> index 80c841b000a3..8514b79f389b 100644
> --- a/sound/soc/intel/boards/bytcr_rt5651.c
> +++ b/sound/soc/intel/boards/bytcr_rt5651.c
> @@ -910,7 +910,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
>  
>  	/* fix index of codec dai */
>  	for (i = 0; i < ARRAY_SIZE(byt_rt5651_dais); i++) {
> -		if (byt_rt5651_dais[i].codecs->name &&
> +		if (byt_rt5651_dais[i].num_codecs &&
>  		    !strcmp(byt_rt5651_dais[i].codecs->name,
>  			    "i2c-10EC5651:00")) {
>  			dai_index = i;
> diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
> index cccb5e90c0fe..e5a7cc606aa9 100644
> --- a/sound/soc/intel/boards/bytcr_wm5102.c
> +++ b/sound/soc/intel/boards/bytcr_wm5102.c
> @@ -605,7 +605,7 @@ static int snd_byt_wm5102_mc_probe(struct platform_device *pdev)
>  
>  	/* find index of codec dai */
>  	for (i = 0; i < ARRAY_SIZE(byt_wm5102_dais); i++) {
> -		if (byt_wm5102_dais[i].codecs->name &&
> +		if (byt_wm5102_dais[i].num_codecs &&
>  		    !strcmp(byt_wm5102_dais[i].codecs->name,
>  			    "wm5102-codec")) {
>  			dai_index = i;
> diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
> index eb41b7115d01..1da9ceee4d59 100644
> --- a/sound/soc/intel/boards/cht_bsw_rt5645.c
> +++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
> @@ -569,7 +569,7 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
>  
>  	/* set correct codec name */
>  	for (i = 0; i < ARRAY_SIZE(cht_dailink); i++)
> -		if (cht_dailink[i].codecs->name &&
> +		if (cht_dailink[i].num_codecs &&
>  		    !strcmp(cht_dailink[i].codecs->name,
>  			    "i2c-10EC5645:00")) {
>  			dai_index = i;
> diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
> index be2d1a8dbca8..d68e5bc755de 100644
> --- a/sound/soc/intel/boards/cht_bsw_rt5672.c
> +++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
> @@ -466,7 +466,7 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
>  
>  	/* find index of codec dai */
>  	for (i = 0; i < ARRAY_SIZE(cht_dailink); i++) {
> -		if (cht_dailink[i].codecs->name &&
> +		if (cht_dailink[i].num_codecs &&
>  		    !strcmp(cht_dailink[i].codecs->name, RT5672_I2C_DEFAULT)) {
>  			dai_index = i;
>  			break;

