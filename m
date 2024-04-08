Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE68B77F11
	for <linux-sound@vger.kernel.org>; Mon,  8 Apr 2024 12:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712580635; cv=none; b=QwImTQTpGVYPPg0TQV0uplD39eDfKTNEUjRq/RNeoZeRKHOyahhL+v+PJNaUJElyIHswdVD8ZkJyUNoqTdHLEQFfA6IR7gHLn43K0lNfC9VJ2LS75q9PF5hq6UDLRM6gJmTD9k6qytI7ngrhvAaL1u3n5G9kb7DlhvOEJiZPum4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712580635; c=relaxed/simple;
	bh=+b1X+G4j5vg/g5sSVMIsG4l7qLj4/UnWr/Wp6hgV9mI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVdLwrF2010nf/lqdEz/4hzfErvK5PS+NIWCHjzcc2FXd2Gr5CLM7kbvfX6pqebykhnTyJ/xgUiXHKbix9jqIwbOsHYxEgd3heEbh2S0fDaRTAoOcVIRj9hu04vke8lzyTBMgjqF0wCWCwPS0+du5kHaCrbEtX5GB0of4GNj9UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OkMuKgvF; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OkMuKgvF"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a4644bde1d4so616416166b.3
        for <linux-sound@vger.kernel.org>; Mon, 08 Apr 2024 05:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712580632; x=1713185432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Jqz2JncY/jtoTAT+GuKbSQdZrYRr+WWEpeeXtkbxJY=;
        b=OkMuKgvFnYVc+IB28JRvs5iXdL6ltKA9RIhr//7rqw4TygeqhuSlJ/CF7XsuXKMDOX
         FQaBdD/brMmhNGAKwymcm2pX+/kkV3KgQywea6uwGfK18G2+v+5zAZh0ChoFboikn2KF
         PjfUYA8b6jK08fzbjWDJ2OEq2d5/PYhUn1NKiNLYiR5f0p1lR3m5HF4vL1mM/xc/B5ck
         bP36qyCtZFCxjTAG66kunpKv6HzRYxge7csIQf5QWEhSZpXSv/rpf6RJY5hsZQ7S4G9y
         b8IjoNMP6l0aFB2XPeoD/2ShTyTAgw21veNMCCSRttd6tr9BApDSPNZtoRMyf27jebK5
         QqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712580632; x=1713185432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Jqz2JncY/jtoTAT+GuKbSQdZrYRr+WWEpeeXtkbxJY=;
        b=w5+IzMgrEBR5v2uSMEnukGtFlOF4JJ7fRhP05snhlyPW8Wu8VtY1H+xwbkVw3Za2G6
         fTtJx98MNi7yWw+TI+Wq+G2OVgufnP/nEJV61igPd3ecz8vRx3ZBs3BDB1nXrv1uqHsO
         SRAqUXc5pDsBEy/wt97GId2az8anS4TEKtWrFqpYvtBYJMe0tBQXisIDEP4W7Ctq9wmr
         lXsRY1NvIaghLi/UNQsODTllOq1mSIe1izMuZEMzocJm9Ba1CJT7sTFeQ/eDERevyFd4
         eJfeN8iPAg0hKJIttjZ4W1BIVrcyS2RvdoIlyeXzd3T8TbMEo6KT4YQ3rGvxmFoJ2Of3
         5rug==
X-Forwarded-Encrypted: i=1; AJvYcCWwq/RS4zA+DhhYUn76k045tg3UlUh5q1+0MxGowHDJ7Hg5lvRHZuFmGHYbImyW5H0U/ICzQo5AAXpAGm8ogBGZU/DlpzttZrjlHx8=
X-Gm-Message-State: AOJu0Yx8rN5Xn+AQKbR73+JYCSCRsZ3D2X3NJ/DM7wwdpHHqt0cPmdmw
	Jb3Dpm6v4PXo/jwRfgUzWDV/9L0DjW6gwdXQWHQothb13Cp3LGR+1VqJ6+Dhubs=
X-Google-Smtp-Source: AGHT+IGkACAAt6WrK3fdfk6qOQT1T9IleXUaTnuLuR3BsyNyAKeaVDfXwn5PTPwMGxSdOVxQ6RZO0w==
X-Received: by 2002:a17:906:f58d:b0:a51:9f5b:b659 with SMTP id cm13-20020a170906f58d00b00a519f5bb659mr7056707ejd.34.1712580631945;
        Mon, 08 Apr 2024 05:50:31 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id c22-20020a170906529600b00a51bbee7e55sm3058843ejm.53.2024.04.08.05.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 05:50:31 -0700 (PDT)
Date: Mon, 8 Apr 2024 15:50:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-card: Fix a reversed if condition
Message-ID: <b692071f-0c43-48eb-8faf-f9279c3d9439@moroto.mountain>
References: <155bb76e-dc57-4a5c-b0eb-acee5ebde9f4@moroto.mountain>
 <25771b56-8564-42c1-9a2d-408d91f23618@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25771b56-8564-42c1-9a2d-408d91f23618@sirena.org.uk>

On Mon, Apr 08, 2024 at 01:43:09PM +0100, Mark Brown wrote:
> On Mon, Apr 08, 2024 at 10:38:02AM +0300, Dan Carpenter wrote:
> 
> >  	ret = snd_soc_register_card(priv->card);
> > -	if (!ret)
> > +	if (ret)
> >  		return ret;
> >  
> >  	return 0;
> 
> Clearly a better fix here would just be to remove the conditional
> entirely.

Hm...  Actually, it should be:

	if (ret) {
		put_device(priv->card_dev);
		return ret;
	}

	return 0;

Let me resend with that instead.

regards,
dan carpenter
