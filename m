Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF88C16E871
	for <linux-sound@vger.kernel.org>; Wed, 10 Apr 2024 15:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712763122; cv=none; b=D8/Stw65x+U6xwK7OMY8CHI8QUjPAxlf0aHZZB5vO28GWqDyO3aSO9N8IKAQPDyaWSaIc9MnyxomzdCnXmLvaDHAJMRYgAiXh/4WgPegMsbv2tBB/BMsPNTynNqWvNbxfAWKgtUwAyikt5lq1g+Vc5UR0kbzgA/WCJtFFkckHqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712763122; c=relaxed/simple;
	bh=6Vog+dAt2cAMqsPI+yh28GngocmuMJI+7wvR2qyxv7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mfxTSN+kRrvCvW/NxY61WVh6P2OwAhv2NK3RGwdqXa5h5ppEKN64iMsKmd0br2YTtsEm+Zq/1lMLDlEA0BxDOWE+SSeTaTmpSqisF97T/2M0UrJD/NhrFy1DmJUwJo/UwkJ+Fg+gRwZCzP7gxDc69SN8OTH2ImXkX/ofZFBt8Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HCEe7uhe; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HCEe7uhe"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56e56ee8d5cso5336788a12.2
        for <linux-sound@vger.kernel.org>; Wed, 10 Apr 2024 08:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712763118; x=1713367918; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cTPhvP3A5r7MS8UL1VvzFtK1xJvz3SKxBGHHR0/FSwI=;
        b=HCEe7uhet4O578NU7bREoB9lnXlswazrADXaijHRHIiiM43eEhpFQ2SmslgWH1lYXz
         36jEE735iRRtHxBb2PPWYQ80tE1r45Bu/lnxOYuC4d3aKTtK+/5twZhPSkmADwafhsSo
         zPWlRupNwHoy5osC92zpb+u363TsErKxqbWAH3BkwLLIR+Gl2wLc1jEccldxV0yaMLNj
         mCBQ89Nz2oHyyrQMI6ljL1GY9zsdZa/WSU0quaEGMoMAqQrgaN4yB9rp62h4R/re7g7k
         KTlXKjF7t0KXaNt/eV+Y9L3tcwvyZYBCPTdfF1IAwGuoFBYuU8cMenla6uOG74aDVAqU
         4yPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712763118; x=1713367918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTPhvP3A5r7MS8UL1VvzFtK1xJvz3SKxBGHHR0/FSwI=;
        b=gW7UrOSEFCv0T8AOU0992f2IBAflSMBrxu/8bD6goRgJUpkfWsindnJNXF0dF1Qm1P
         6Y49ejiQFUwK+TflscaJ/xCJof60JswCctRMMRFN48G7jK+IdhsvL+zbrJsaHlHkmFgv
         msb5oRRA9Yu/0ivQbl46bnqGhMT/G5iZRFa6NzUzAevPnbjl/ryszP6wTLJFpERGkbo2
         otgWDwzMZQq76/nGE521t6+FAq5Wix6ncg/YG6xHcJHpha097Mh2ofFm3KyG/rur1AyJ
         XUlag1z0wfZRgQTe88W4KCXvsuIZWmzWd9wQi2a8E2sXWwsplAMeRhBqkmPPgN4WP2tg
         i80A==
X-Forwarded-Encrypted: i=1; AJvYcCVqBfH6YLqthBqwdK4ixmnvTgopzKbX+amf0PoYkYCBeS1Kc6m8SUMQ9PWaoTvphujv/kjvPjYXciXdNch+dahWIiNROpIT8cPKau8=
X-Gm-Message-State: AOJu0Yx6K214IZGsZWOXT2iNTjHK/UEVaGEOZRV9KwBw9y6Vr+B21Iz9
	n4oTUw9osivnw01eUaYPLecAwtrH10d+vK6qcEqJVuOKrxxfAcszSucBdJACU+8=
X-Google-Smtp-Source: AGHT+IHI2Ekpl25h0Yy4yKCuyZYB9KuHYXbJc3VeE6shatg6Hicrdayi5+NJC9iLQkC8NWx5z+JrZw==
X-Received: by 2002:a50:a6d2:0:b0:56d:fdb3:bcc5 with SMTP id f18-20020a50a6d2000000b0056dfdb3bcc5mr2136474edc.12.1712763118023;
        Wed, 10 Apr 2024 08:31:58 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id et6-20020a056402378600b0056b8dcdaca5sm6501104edb.73.2024.04.10.08.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 08:31:56 -0700 (PDT)
Date: Wed, 10 Apr 2024 18:31:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: soc-card: soc-card-test: Fix some error
 handling in probe()
Message-ID: <6aaca4c3-46c4-475a-aecd-cf471370e97c@moroto.mountain>
References: <2db68591-64e2-4f43-a5e1-cb8849f0a296@moroto.mountain>
 <c8e9a7a0-6fcf-4bbe-a659-b2360f5980d8@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8e9a7a0-6fcf-4bbe-a659-b2360f5980d8@opensource.cirrus.com>

On Wed, Apr 10, 2024 at 03:43:45PM +0100, Richard Fitzgerald wrote:
> On 10/4/24 15:22, Dan Carpenter wrote:
> > Fix this reversed if statement and call put_device() before returning
> > the error code.
> > 
> > Fixes: ef7784e41db7 ("ASoC: soc-card: Add KUnit test case for snd_soc_card_get_kcontrol")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > v2: call put_device()
> > 
> >   sound/soc/soc-card-test.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/sound/soc/soc-card-test.c b/sound/soc/soc-card-test.c
> > index 075c52fe82e5..faf9a3d46884 100644
> > --- a/sound/soc/soc-card-test.c
> > +++ b/sound/soc/soc-card-test.c
> > @@ -148,8 +148,10 @@ static int soc_card_test_case_init(struct kunit *test)
> >   	priv->card->owner = THIS_MODULE;
> >   	ret = snd_soc_register_card(priv->card);
> > -	if (!ret)
> > +	if (ret) {
> > +		put_device(priv->card_dev);
> >   		return ret;
> > +	}
> >   	return 0;
> >   }
> 
> Thanks.
> Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> 
> I can see that put_device() is also missing earlier in the
> function:
> 
> 	if (!priv->card)
> 		return -ENOMEM;
> 
> I can send a fix for that.

No.  Let me resend.  I'm sorry, this patch has not been up to proper
standards.  Also I should fix Smatch to warn about missing put_device()
calls to prevent this sort of thing going forward.

regards,
dan carpenter
