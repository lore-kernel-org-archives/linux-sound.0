Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793126812;
	b=wHxT4/aKvL9kfywoyEtPyvKu1oQnmYFrnp1ML8xc3UrAfWJ6JQKBsoNlmK+O7EU+Ny2G
	 z6WHWuXjIsRz5gAuuCfBP6pi7HrlONs1Ef+JefvVkdssK2r9469XOWI2yO9Miz1VddEqr
	 gwfAn+r7EuyKcKQlvpZ2cllzZ6W/A/TXhbUby+7N8zv9NmsyZqcHi9PxGjlM8YzgWyaAZ
	 phzohDOj+8KmsMJS7FpfeD4VwIrhCq4jLzn2Z956hW+Noq3MvpvU2MPAhzTURMBBzB4bp
	 Mwb0NS4nhRN0aW0k5M9Fw7mKrodE2R9DlS25Y+sy1dYImp49JD3utcLVNI+u7tSEpZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HSaqKS2TpQZW7IvyQZH6ojBdMfjkGdBoVNPM3GO8eCU=;
	b=N5khGvyp0fm8B/5EbYhgbuhSVirwKMIsmsI0Wk2tJa3f2jcOKVg0Bk533SLArxfwMYYB
	 R278wd8D6KPaNx8kk15hT3ApGDgLB8yLRFfKLXq6pansojjjHAtM1qQDWZzSSYqz78gJl
	 blaedtDkZaklDvT/vSDMnCkXUYOu4l5OoBQA5gnfLxEq8O6zBg3lVQJIcdJtL3xzrpWDc
	 dfRGhyA4W2DfHrorvXOlB5TXo3KJrMjXbKSo+St5cdXHJQ9HUNGk1xOpxGMx9CS4zeadt
	 QP0FivbZFFWbn2rVtupl23fQ4mRf600HMh4a5RrWSKVN/bDt3tNRa27E1WIzg5cbFTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2G7yvHa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FEE606A31E
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 18:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51FEE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2G7yvHa
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-353804b591eso330000eec.0
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 11:46:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793126811; cv=none;
        d=google.com; s=arc-20260327;
        b=QtgbNRFCcullgmongjwDlL6ngJl1Lr7mdgh/BoQEg4u5BO/ClNW4lE93BPnZ0qB+g1
         tXuc5pcrZKoLVu2u+A0F6+JFxOpZyRhoxbVi/7KduL3TwTx1hWxlqrNkmyR4gA4Z3ddT
         R1iZKXPrBClqzjiduZ8uujsOCYWHmfAI2EMmbLm4GjKC5uyTOr097fXvEVqRu+6IlKAK
         I5btC0G7Vc5WiWs/NZImRgtk3YUHOlCRgtLMJCo3SXfumMjh9jqj2cmA/aX1QJ44bDef
         tVW+PHZDM+EMmq+RbHfzXc3ClbTMbvUSyEIJJ/LhIfyardag7cMaWYGmHBtdZQ1tUoNA
         tINQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HSaqKS2TpQZW7IvyQZH6ojBdMfjkGdBoVNPM3GO8eCU=;
        fh=KLG+PhczKXzMcQ2vxvMiM0yElRlPXdsXpSN0/86DWpM=;
        b=hYjH2MVnNNFHddCvJWktKySnFXtSCh3N3A1hhHiNQLDCe8iF8YPIG43pA3zdJSRdBe
         r46U/ZervaIbUZK5YQtOUEPXeHODuM9AJT1UCwjOPmD7KczBizai+mkZd8esrD919sLB
         C8JxnGVH93v6aXPGWQFlvMOUOJ8z2ggixTlRoUa+uCKAPmU7/1PqR4i/3Mq6jV0nLeeF
         YUYTqabuE4JMBpn94xiZKSNtM+VfZRFUhv9u7sOi/c2AW7gTeWHhWursoep/M8IQu4F5
         n9jfNaPrDGAcex1VEkebWUO2lD9hSSvCeXAsr7THYlfdNabpKkdGtv9JeA3g/iASZaER
         YkCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793126811; x=1793731611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HSaqKS2TpQZW7IvyQZH6ojBdMfjkGdBoVNPM3GO8eCU=;
        b=E2G7yvHaNkRxyW5X1e82+KIGXM5YEJiStgrdWIvG/gYSSS7qOXXR28A0GU3fx4B9qv
         39OttinzhaBsa0+GeHKfNbjNJIQz7h3J8bTmFKDp6du7ye2G+jDgrSN7sDv1jPFk/hE3
         o1BW1kG2DpmC26MFXaXofLL6r0i2h+Fh3zXcVQSF6dgwT+0hK7V8lP3VO9F1uZcL04jv
         WAOHHlYpkX56zN0B8hpKiKMIqT9WhrE9BOOBm6VyRUG+uOBWmVMkZeZOf17DJCocnc7D
         FlaAutXsgGENcLxSOMGA3Q3USXx4TGloK5IfEhnjEjIogrCqfYWQq3Kw1XP+nA2Shun/
         sIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126811; x=1793731611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HSaqKS2TpQZW7IvyQZH6ojBdMfjkGdBoVNPM3GO8eCU=;
        b=inzFDtHzhtz+HheemGo36BDw2MfAUmg3DLAZuLkrb1THi41QiaFPTgJm9enzYYA+FW
         VnWm7DCTgGs1NQ1TtasZ68Qw6N5+UokFXURITaUBVfxs98xa33Uhaq6dLRdX+2IBi9hD
         1fms+DWgiIdbFk1c9vmbhA4OMeH7StxfkbcLOYMJ8KSEBhJZej+z90PiLHAB/HuCM1bf
         owOFAzAmu43L/Wj5zlm50DtPMFjSQsx8a19yz4dluCaJl9qZJzaIeH6xvTThMYDuJIBC
         GPkwF5Bx94Ae0E50wHGOUy+oWk2ltMLY51LQLoA7hkhLCzUvQ8CojFc8GQIxkPA3x49+
         t3yA==
X-Forwarded-Encrypted: i=1; AKwUvBzOsoxjwoCZbcyh9vzIuR3vOhhYBWhDwvVzWq3oUNDOIj8qRtei0eko8JRR7B76XBTq2/pK/qsQReZ8XQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKK+GG/PkieBKYukZXH1VDXA9hiFmjNVi1JbaziLQ4PqeFWS2kf
	I6lm65KOEy3dEA4DEZmjb1UfQUPVqiZbksskRiTXckwmz7znn9tk+PMQHscWmISxmQ7DupzQS2w
	xAjskNqj09mWgppvxYalBUggCzaCimXo=
X-Gm-Gg: AYBFou1a4uEismzW7632Bfd9jJxhJxBDgwn4gXfYWaof1jLdl/9JIgL5Sxws9eSTu44
	IUg1ohGiLOoe6GuxpaZXMDwlwerIkNY43jiSjeW9IIt0GHdkxF+UpHLS0NoM3U0RkKz1mPmbyrG
	CmP1rm/GPDvtJH96l2zGFqDLj8GtnLtSFZ7eKfqhMia7RwX9ExCZ+y8bN6jNoG8w/C6sMfxKjoH
	bpoytzG73cLYloZBVXUQdLJCd/EQgZp2BPFNVSPHSTMoozkvKZsSW/XFixsyPXxLcCtaBIjznpD
	b5U6eoHuPjoBUrNL5PUpH/lz9lL+Hy/Evrrvey7xoLV0uB60jiDmJWUqTRQ5v2GtZFck0Kzz9Ad
	HUJqbiO92yrsTUjdOMTlf0H5YVn2zZjw9KsGhCTKu1Q6tykJO4bYR/VAI/nCp2s5QlFChSg==
X-Received: by 2002:a05:693c:638c:10b0:369:d8e1:7bb6 with SMTP id
 5a478bee46e88-36a203bc9dfmr355408eec.25.1793126811403; Tue, 27 Oct 2026
 11:46:51 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027120019.93611-1-clamor95@gmail.com> <20261027120019.93611-2-clamor95@gmail.com>
 <179312433904.199157.11834547028241710753.b4-review@b4>
In-Reply-To: <179312433904.199157.11834547028241710753.b4-review@b4>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 27 Oct 2026 20:46:40 +0200
X-Gm-Features: AclHuK-EdXsdf9foYz2HdBUkkAOJoPmsThEgknyKq7DwRpVYxIMIaZENdpZib5o
Message-ID: <CAPVz0n1be44e455tvaowB5H8mrYOyTyWof+PS-nmf7W5VyAtQA@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] ASoC: dt-bindings: maxim,max98088: Document
 #sound-dai-cells property
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>, 
	Leon Romanovsky <leon@kernel.org>, Animesh Agarwal <animeshagarwal28@gmail.com>, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 20:0=
5 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> > The Maxim MAX98088 codec provides a single DAI cell.
>
> The device has HiFi and Aux DAIs...
>
> > +  '#sound-dai-cells':
> > +    const: 1
>
> This makes sense for the device.
>

I must have set code correctly, but forgot to adjust the commit
message. I will update commit message in v2. I have to adjust wm8994
codec anyway.

> --
> Mark Brown <broonie@kernel.org>
