Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A007E1FFC48
	for <linux-sound@vger.kernel.org>; Tue, 24 Feb 2026 02:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771898687; cv=none; b=XnayXwb+MxJe21r55hIr8PAhb+YZ+xsUs/l8Jgpj15zhoN/TPYqqtLNJWTiranjUOGO+P+l7BkiSst6AYBRdrqe8YqZbvljie02CPJz+aP6ssfhc7zhOpNlxOpHKaEdVUlWPNFaG9q/iMJw1BMjixkVMtvYegGCCCOVhjS7GalM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771898687; c=relaxed/simple;
	bh=uLgluuDCj92jXodSMJnL+H8miLgLtj6VzV3cb/Nfglc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fCd5a0DExx0YxiRF0UOQGsawFA1ue/pEU/bathY7ZXh9zSHYkKv7L7WTxHgJVa/RYwzJGYh6/AjcUztbeovwQMpEFk/Sk16Akd90dLInMaHlqX1thPmAvyttfcvRDsGwzy4D3E3WmFygygpxPWgrB78Dxhwj0cAjImAL3xfwg4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGPFJ+nU; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGPFJ+nU"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8cb4136d865so612334185a.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771898685; x=1772503485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bhavNWQtfwjo29hZM2bT15wiOFGQrdKpiRqxwXs1Kpc=;
        b=UGPFJ+nUlPm/JdkvdY+IqYtE22zztDmdufDVVxaXh7h6iz/FWDHDZruyA2ahlUsGTY
         Vk7SMVFmG1QsTKyTqM5/1tH1Lg10QBVgiNdonB1p9lzPfb6OhSd91cyQDaRLcdOC6dlJ
         zRO+Ou+Ueln8s612D0i+iIlCbpS2yzLP1ZWm454Kqa6WrRXncH1L+jKPgxJHqVxfWzBW
         puw3q2CVcPl87aB2E7pMwcalUp8jxdFx2GR/8m85zBF8mxj8Gbet7Ac5dllofDbWmJsv
         93aGJo2UZ8yzh8MmHfxEge440j80qd7Jrd2Ud2SfV19n0u9u3rPsEyDUhhayQmbRXNx1
         BIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771898685; x=1772503485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhavNWQtfwjo29hZM2bT15wiOFGQrdKpiRqxwXs1Kpc=;
        b=NJc/9i252hGTwqjtg0fe9sZaPiI90Fh2ti72c9e5n96/euVAIvOUvxeaeC3HFxTHtJ
         zVSLHZKBfTinJpd7Pu9m30zeI2duDBH8NGbiK01HlA+rI9gXUmCkzal0kbu8DLGK6gdd
         G4hznfpZxf7TyI9fkff7GqRyrOH9ozz0IVwICyLprnK29/JNVAdYbhdRGwVKSCB2isE4
         VHwYN2M8vMhaSfHU6vefO3BrY5yDSzDOKJt+jBUZD6aiHACqYmn9a0PA6d1R3oqxkaYa
         EqjuW0QWlUwBmuNOct6wV9UT5NWUa27PsI78JJX1CsTxvvS7VuTBOO62/xcvPJoQ3k/C
         VKyA==
X-Forwarded-Encrypted: i=1; AJvYcCXN3hx+wCOkUQKtTCq8OOsePTdysGcHHXFGVz7lrbfyK960M9IY/pTJ7jtRDsYxOSwzvJW4/8Rku1jSEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzspWJngPl7VEYaxXbDrRa/hskbTbJE5Ec+sN+mM+Ju59eafa7K
	ph/mO6MiTsL5HgNAfE+/wgjJxDYYRIzgwhWcCPkDC0YJC9QXAwxuACzo
X-Gm-Gg: AZuq6aLtFXJRSKFUAFfuO9MpBErylhP7L+ulzWIxfpRzUiYuQKkkK+HDsYJapr6Tiyt
	ykb/tT19oUxisqeCy7gCziWoHSTEIs3KzmYKobYujmj4HW1xwVKDWIyUFQ8EU1idBd/r8X/4gMY
	CicaZnIu3dZ/KvxoKoOczH848Rq/dIvh+qKE6XGBTgiVrcZZWO3YssKJZGAHbYVyhUzDvS9qfJ2
	YJR2cwY8mSUwzD6gzxR7ZdzAaYZDRiuj06XJH1kQOUJ3pBXNf26Xa4nMdMtTj8T3nexf+ebyHN6
	/eMjWFOrHBZRHZ6r9NNe5JC3sFj48A0dWvSnESLaKMQg1dj0FYLwhwvfVxS6NTF3d+HU706urf1
	bmIDken6MR76LoZ8h5P5OXGAAFuvUEKoq7EBAfJfn3+UIEpXWld/sr3p59w/5EBXXROIXLGu7vl
	PHFvOFsEtNFvEsaOhGvdRHfoOVadlaw9Q67/S+ETTP9C4qvBYbqZUlkgTbJmMuIV+GpFPPbUh3x
	D5yTWTdTaPpcK/rcL8=
X-Received: by 2002:a05:620a:8412:b0:8ca:105a:f5d1 with SMTP id af79cd13be357-8cb8ca0a6ddmr1082391485a.30.1771898685553;
        Mon, 23 Feb 2026 18:04:45 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d122906sm843410885a.51.2026.02.23.18.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 18:04:44 -0800 (PST)
Date: Mon, 23 Feb 2026 21:05:23 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 01/10] ASoC: dt-bindings: qcom,sm8250: add compatible for
 sdm660-internal
Message-ID: <aZ0HY_fMGAWt8nuh@rdacayan>
References: <20260211020302.2674-1-mailingradian@gmail.com>
 <20260211020302.2674-2-mailingradian@gmail.com>
 <yxrhmblavwkuhfrfgskujs7tz7cykojnqnl2mfrf365lhdem35@bgqwiaft67b3>
 <20260211-skilled-transparent-moth-fac10f@quoll>
 <f1b67c1e-cfc1-4d23-a24e-4dd342edd2e9@mainlining.org>
 <f27ec5bb-1562-4bcc-9178-4ff4d4fe00d8@oss.qualcomm.com>
 <aY_uQZxuwt8rDf6n@rdacayan>
 <ddb41df1-2d60-481b-999e-cc480a6900f3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddb41df1-2d60-481b-999e-cc480a6900f3@oss.qualcomm.com>

On Mon, Feb 16, 2026 at 11:53:49AM +0100, Konrad Dybcio wrote:
> On 2/14/26 4:38 AM, Richard Acayan wrote:
> > On Thu, Feb 12, 2026 at 10:34:27AM +0100, Konrad Dybcio wrote:
> >> On 2/11/26 10:55 PM, Nickolay Goppen wrote:
> >>>
> >>> 11.02.2026 09:51, Krzysztof Kozlowski wrote:
> >>>> On Wed, Feb 11, 2026 at 04:11:24AM +0200, Dmitry Baryshkov wrote:
> >>>>> On Tue, Feb 10, 2026 at 09:02:53PM -0500, Richard Acayan wrote:
> >>>>>> From: Nickolay Goppen <setotau@mainlining.org>
> >>>>>>
> >>>>>> Add compatibles for sdm660-internal based soundcards.
> >>>>> Why is it called "internal"?
> >>>> Yeah... I am pretty sure there is no such sound card. You cannot have
> >>>> sound card internal to the soc, because you need the external components
> >>>> like codecs.
> >>>
> >>> It comes mainly from downstream driver name [1].
> >>>
> >>> Downstream also mentions it as int_codec [2].
> >>>
> >>> There's also an sdm660-external sndcard [3].
> >>
> >> It seems like "external" means "coupled with WCD934x+WSA881x" and "internal"
> >> means "coupled with (digital cdc on SoC and analog on PMIC)-over-intI2S plus
> >> optionally WSA881x".
> > 
> > Interesting you left out WCD9335 (codename tasha), is it never used in
> > production on SDM660?
> 
> I don't know.
> 
> I think both were used with MSM8998, so I wouldn't rule that out being the
> case for 660 too

Okay. If the codec needs separate configuration, the sound card driver
can just compare the codec name like in SC7180.
