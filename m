Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263DC15A864;
	Wed, 25 Sep 2024 09:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727255126; cv=none; b=STuxdPNpR9gaGRDtl5VZ4s3oZV5am3gQMbdwT3euN0K5VEajglncWWDaiq0ATK/dywumnvKapVJyT4dDtdtyVz8p734dQFIvxJLmg19VolPY0WMaaaPNozsLje9TyfnH9m9RXGSjYkbyDtJ8OQvPWXwppcQ9m96j6Qjc/zQ6qVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727255126; c=relaxed/simple;
	bh=1QZUsUnnAE3WSKe8mRvALmjWQTDijRw4NHVHntQSucE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=caWvEO0BiH6o4mgezTusNLd1pNLt9SgbiY6jtPZZU9MPTSNwLuHoSI9is9nCrWy5aIn1AbxxBO9CZICl3V8XnwSe8yaXZTpi8HslT90C1qmxcwR/09qahroZOEYmP1guWvO2z8lfZgus6rZFM/8hUouWXysqPVNxVDt0HNPj7Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOZQ3hJ1; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOZQ3hJ1"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c26815e174so8011242a12.0;
        Wed, 25 Sep 2024 02:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727255123; x=1727859923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OpSxoOSH8sGRYYBVpsIkEfJWqz3E/EfZFQTLjHzT1H0=;
        b=HOZQ3hJ1pHdA6OI11k2kPLf010UncmSjN6txk0K+9mcjtVPHajf66FYDDvKjaR+t0r
         NcnRTlaBdf8gdeYE9sf3/xWkE1lGbq+a3uEtL7wmsCdadFcrTJ2Cgd/vVWxSYe7qCtdx
         tpq8EVKVBnAQMF0hrvtPLtVxrqTdDsejLKiOvMiyAQc1v/kaLiwqZ+hsEsqx74tEzO/3
         t8Ib60ychNf+xfMczIhEzIRF7L9AqemsnpL1bqaREThgxefMV3yXZI33WcAPHPu53tO0
         cSV9LZ4jjVMuH7Xs1vZLw/NMtm6wIOtY1OX9liMW7MOUgWmqJNWKq583ri6HO+si8bQo
         OdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727255123; x=1727859923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpSxoOSH8sGRYYBVpsIkEfJWqz3E/EfZFQTLjHzT1H0=;
        b=KOdjZGsauMNxO1/YuMdQA8z+tdpH+gpfSXXqwnLGbgfrD1Xo641J8R6Ihy7bai7PqV
         n2mby3rZJ/12QZ+RWFoTerS7ywKY7bj9l+GqQ5Zm9g+41M0TvGX+dZHBNrdEKS36Px8M
         BlzyxU4SM1Wp40qqpg9NyDfbM5lGwj2nItZBxPtP2UWPOMZDg0WQtf/0iAjOfKxe8Lbm
         beeNAa/wlZ59QdOaJrrmliNK2lek+hM2iuiLMNqm8szIZXC1GHC1HBuPV9+VIzSPB/et
         wLxAZVPzu5QQYjdq1LylnKBQyfDCUiPXYK35cCdzVNCapoUFmcnRnKz9pFhAJM8aXQcr
         FZxA==
X-Forwarded-Encrypted: i=1; AJvYcCVqF3d4E7o4eGtTEaC4uhKBA6UAoCCJ4CmZvzfy3ttaHg0fkV4VGbeUmSxCAg+EY6hBJdTqboLEpye2bYU=@vger.kernel.org, AJvYcCWeZxsA4D0Zo5wgIIUh3PBVaowzQevPtElRLyePes5N6/ROqfIMNb17rsR/mwzlL5wGETWC1WlRdHvS@vger.kernel.org
X-Gm-Message-State: AOJu0YxMzvOWVVJ56TsB6LWQaRf9mFEdBZM2CH5PaMvdo0Hfb18QkAlH
	QAwm3oxraQqygSRcJm4W6X681DV1Y2Och0SSLxob9qW1gsZtLPUGP5WIbRv3mAo2GMdEuaSlqEF
	dVjx1vTdu4kei8XXS1ONwYQ+oghA=
X-Google-Smtp-Source: AGHT+IHMhDBD4VbH/gs1euQafiviuUglJ4RhEofIOUHa7Z/aaoxmzI3ZTPxOSwo9aMR6U646AGZcuD6vs83g04COppE=
X-Received: by 2002:a05:6402:40c5:b0:5c0:c10c:7c1d with SMTP id
 4fb4d7f45d1cf-5c72073c6bfmr1772969a12.23.1727255123097; Wed, 25 Sep 2024
 02:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1727056789.git.zhoubinbin@loongson.cn> <9a286537a20f0f96597090f59165b4532e41bdb8.1727056789.git.zhoubinbin@loongson.cn>
 <ZvKEFlARvbFFWI83@finisterre.sirena.org.uk>
In-Reply-To: <ZvKEFlARvbFFWI83@finisterre.sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 25 Sep 2024 15:05:09 +0600
Message-ID: <CAMpQs4KW7P0soeTw0Bi_OpcGXjk8EBjcNmHFeAi=MCauhwanYA@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] ASoC: loongson: Fix codec detection failure on FDT systems
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Weidong Wang <wangweidong.a@awinic.com>, Prasad Kumpatla <quic_pkumpatl@quicinc.com>, 
	Herve Codina <herve.codina@bootlin.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Shuming Fan <shumingf@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark:

On Tue, Sep 24, 2024 at 3:19=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Sep 24, 2024 at 03:00:32PM +0800, Binbin Zhou wrote:
>
> > When the Codec is compiled into a module, we can't use
> > snd_soc_of_get_dlc() to get the codec dai_name, use
> > snd_soc_get_dai_name() instead.
>
> What is the issue with using snd_soc_of_get_dlc()?  Shouldn't we fix the
> helper instead?

I'm very sorry for this part, I checked and tested it again and I
should have over-modified it as well as the use of
snd_soc_of_get_dlc() is correct.

In fact, what's really being missed here is the assignment of
snd_soc_dai_link.platforms->of_node, which causes component_empty for
soc_dai_link_sanity_check().

I'll rewrite this part in the next patch set.

Thanks.
Binbin
