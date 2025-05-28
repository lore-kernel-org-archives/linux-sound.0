Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5031428C840
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 16:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748448168; cv=none; b=esVfukRvVjfTwMLaWAWWUxZFTTWerHZVoCnaxU/T3l1FYx9RbDtdFSiV8XcdvcbGxV3g3qU9jlran33uwkQIKyRQscphF0+dSRQTp24ZuRe2lHa/NnMEm7vzB+ChKRtYPtx/ILU9EPzT8hOlAk3TENNPtpquJvM+gaC4xZnja3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748448168; c=relaxed/simple;
	bh=t08GAhcYElYwLHiAuz12CFNqRq2dkhmxDggvF3lXGGM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=GW2ysaSKQ3YohuywCC/eTbvYjzHp4A9WT8yj4UtKYWXuPBPUhWyiksEYaGeD7JV3CxeCOb+0mSIAkCBw5uWyBfKoQXYN4/uSTJD5ZoURcFRD1pjgf6U+CQjAvsMO/5AJv3M39fuFYX/lWbivsB+KhvoWe/uX0BPI8FL9w4bW6+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a8fdIjl7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a8fdIjl7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450caff6336so172315e9.3
        for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 09:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748448164; x=1749052964; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2kCK1t1rT2W4oANCi5yB4HtmJu4u8r4qJTejI8zo+Oo=;
        b=a8fdIjl7/wGtJAgXGu6Hlia3MDaLXGqC3UFiOuuSb8ZKrMmtlHikoz40qWQW5UgQrL
         MmvVh/uEzOii7/FCg0Iz7sdsNzJRSIkxttIaXP7bTYhtSIxOq2E+GIcSADbZXMLz63e/
         DvyNQ0EgIPEjr1z65xKhRCvikKL6ZbPfD7lChiAye/3c5bIMDBW97tcgY3OYvc5o2tWx
         R0GbQoI6c806zmCLQQATpJKpE9Dg4VPV+LyzctIjs85bKDPfUF5q2q4neJW2jW317Rdc
         pAfUkG1HaswVDJHNCuGhQGzKW6JSi6JKsR/iY8d6FlD7AjpfA7P2wWBia2zs8UBatlf8
         AvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748448164; x=1749052964;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2kCK1t1rT2W4oANCi5yB4HtmJu4u8r4qJTejI8zo+Oo=;
        b=VjriohgvUHWtWMiXiD/65YwUbUC6pZGHCHz4+dtx/2l2Yjs3hr1Q9Q6eeb0gXwHpM5
         FvJfAUH05UFH0jb05KNtvVKwfdSx23w24YKEhk1rsU/b+Mjko0N2ZI6Q3BrxiBuvIphl
         LLp7prW8HcG8P1zWRzBnm98IrXWJjqpEcOggwvwM99E+t5SSqmA/eD9d2ppwjg5b0oxT
         sYkCwKIfFIvLbbLygKGptoLMUjQv7Pi4UorKIDjPMbqMvL8wXJjdU6hAbTQ2VX0Bm1Gz
         1LF8DCJAo9oLPeiC6osjc2w6ke9VuWsfy04OYc0XEp8PXTKr3PUtStqgeqL4PyRBfvhN
         QVjA==
X-Forwarded-Encrypted: i=1; AJvYcCWxwOeDRWrMZ9azrBu8sb4MAP53K3WI2GRtxOqm+2ZiBr0x5EpqhUCaI0HzgFOjQ86T/gfgwYweZFic5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8ypVtN0fbzttg+a/t1WZmouppsBte8E/8yjZkHrL7rgXseXmg
	zuPCbJ24n2rmgkkzPECpmGF/7GJQEkcR1lnDGIqyYm2dtQjageU2IOSMTbIcpmoV6QI=
X-Gm-Gg: ASbGncsMorw4ACVbKyjKB1yllPAe97+XNsTMCXU1nYuBKrZwsML/F07M6koKtpDd3V9
	32PQgSwGqngXmEDMFAF0fAfBQnMWJU/9I0B4jmMSylZYmLxfDh1Gn7sPWS5kv0x63bJihOdU9OT
	PYbXUQmbaHO6166AZ60AzKO7h+pA7p5n8sjf7nspnOOx0rdA30T3mUut0DQXyXnSR2d1YR5lOz2
	wTx/Hu6+lSKuO8LV56ALJUmaK/CVc6SuAYErjwe/6jYSKNy+pcoN8MkMOzsnw8+POYUssJmDGLO
	WSUmd+G5pUcTqTn6SozenBO4mC7Ug5vU5PqBH2KQT4OKPBwTHe3byd+l
X-Google-Smtp-Source: AGHT+IGXdGfI0NZMb251EaclZsUurgUstIW2s6fQn24XtH1qsjwVUeWaMZ/3aPe3N0RLnQB8jJ+wTA==
X-Received: by 2002:a05:600c:1c99:b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-44c930165dcmr181795775e9.2.1748448164213;
        Wed, 28 May 2025 09:02:44 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4507254b9e4sm23132285e9.10.2025.05.28.09.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 09:02:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 May 2025 17:02:42 +0100
Message-Id: <DA7X59CE8REY.4E410IER5BJF@linaro.org>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel@oss.qualcomm.com>
Subject: Re: [PATCH v1 1/1] ASoC: qcom: sc8280xp: Assign backend ops for
 multi codec dai links
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>, "Srinivas
 Kandagatla" <srini@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250528150716.2011707-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250528150716.2011707-2-mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20250528150716.2011707-2-mohammad.rafi.shaik@oss.qualcomm.com>

On Wed May 28, 2025 at 4:07 PM BST, Mohammad Rafi Shaik wrote:
> In the existing implementation, the link->ops assignment is
> conditioned on link->no_pcm being set, which generally happens
> when a platform entry is present. However, in scenarios where
> there is no platform but multiple codecs in the DAI link,
> backend operations (link->ops) must still be assigned to ensure
> correct codec settings.
>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sc8280xp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 99fd34728e38..b1b31d197b42 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -147,7 +147,7 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *=
card)
>  	int i;
> =20
>  	for_each_card_prelinks(card, i, link) {
> -		if (link->no_pcm =3D=3D 1) {
> +		if (link->no_pcm =3D=3D 1 || link->num_codecs > 1) {

Out of curiosity or maybe I am missing something, why this is needed
for a multi-codec link only? Or in other words why not link->num_codecs > 0=
 ?

Or due to some reasons platformless single-codec backend is a no-go scenari=
o?

Thanks,
Alexey

