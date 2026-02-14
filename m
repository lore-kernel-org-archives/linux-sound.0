Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5762D25EFBB
	for <linux-sound@vger.kernel.org>; Sat, 14 Feb 2026 03:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771040287; cv=none; b=t4sBY1bAX0cC1zDgpRZL6gWC0CEM3ojEBzW87xen5IKIHIi1Rt86AQZTG2fa2v80HPVp8YWFar/ioAu8DsBkkcNXkuXhFlmR5nIt5Jd8GqxqQTIJq4k7xPo4utpOBj8Ff5ARHlpEuv0B6EGzSIkRHTRVkhI6L9AqZwO1gRhRfBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771040287; c=relaxed/simple;
	bh=xxGNc+rP9ZPTTc3FwwTPwlQ5fGDKz+5HieBZopV7j38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XnC+WDHZe7uF7whwDO+2NSBLrWlJeaBwIwwVXVMAOGCzqD1mfDRz6dqLQM63nTP6Zzxuw5mPepWHcBXKCJ8KGxovlBf1IQVnMI1LsqOdxCRrKmCe9M7q5ciQSLMepIsZWFyZW1eSS/dyMMCExIx0ioVpFmAeKoHFGfYpyZyofVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cM/kxHG8; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cM/kxHG8"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-894674a4c4aso26850746d6.3
        for <linux-sound@vger.kernel.org>; Fri, 13 Feb 2026 19:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771040285; x=1771645085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LKQnzX/eBtVk8Ym0yArjRsUU5WC6RCp5/uzwJ8iLxzg=;
        b=cM/kxHG8YCT+TBahF1IzkNzefp2L+HNc4UceDLzsWUp/wO7XQrpRGrHd6WBt18PkYV
         RORz950OZFoviba75p46UpGubtwont4s4CHLVb5AieuwsvNyJE3DT3wdfb4U6qN07mj+
         /Vu+gCm0lCWZ9MAwj317Ucc1gPT4r7PsOhkXAFbJVDnbX6SKtjMVEnQyNLR24o6EqX6R
         FIdk7mTXaizZuZ1e9REuHY24qdV+jSPvaklvWv7MORKWvKNrMCTylWKSpy+jj0H2xFqY
         gpSZGEtC+hGCV0xv1DRxTsPQ30ameLbsfSqhNJzY1xbut05H28Nj+AruSVPiGtOUdbti
         sPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771040285; x=1771645085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKQnzX/eBtVk8Ym0yArjRsUU5WC6RCp5/uzwJ8iLxzg=;
        b=Dh4CleB7HvfGvKZM+lzFqUBIEtX0Hd48aBzuRB3zYfySKQCK76ig4Ln6R5g/POkANU
         skTFs4IfjmGGCkaYzszVwiohMibrMI8kKOrx2Zz45524gSsjWfClxPaMb/tr+9dXdAxz
         aIQmYcdhpxY2WB0taGbNbUuFSt0ennYboRHuoIrHTs+Ch7EUDzV+okSntHuN1PQLl8eH
         IZWaqcAd2pk+vNZNGFmx+qLHkKGdzpCfQsahj6lqWjmGMuv/Vyf9KJw1NRKZlcwunT/6
         eCj3dN/S21XtigCE24rgf7pmtoj6RJBsiyZOLI/ZzLol7Va4K/RNIGE5+AaVrhvK3VtP
         /A/w==
X-Forwarded-Encrypted: i=1; AJvYcCVOBsF6c1KI3Xrywbtxg0BuxtlE76g9wnDtiacCn9Riq3cytt7z0eSPMIegjKHrSzC2jwQPzslqHmWYsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx/ipTuAqy1Ye23tXAre9pf0BnRb2/Ihc0+3bEYyJufml565zI
	GwXoeaWw2SaP42dUczKjm/ktcBr2xqa4UZtuIPC2hG11uXhefphXgdgA
X-Gm-Gg: AZuq6aJOhJ9gQ6FRUFt2eLscn+HrBU91XXeCSyhDxZVzOey4oh4wKGDVsbzBf+4bFTP
	gPSr+ztz6jftqyeH3Zp1n74yIMQ2KqM1ZmN0u8awHfSp+zUWHQGhFiCYZMzPtFQbxEmQv/m3JtP
	iFx5b5YVN+/oXUBtj+IAxx79BY02b5FL/V/7fy+qUV84KYl+WQ9A/2jpCrkE96QP2GfD2lfr78G
	xbGRy1fA+H1XoUsYzB7UBam+ToaWGxNNtc7hQzljXAH/n1h2CBdK2FFogPDT/8NrDK54VdfsNTE
	3dRNsf48wGcpM9L4cCZuSQcEkKKNMSWi6HkGWDCCLD4k1t2/EfZVxaitxkuL2bFEKSjSuLcSPXH
	98fKBizetkDQg6TONqre5OoD3RZSrx+rsjXGYXzmAylr+krG64BtR3T84NQWBsyL/LFQtYUeYGm
	RdCtmktRh5lqyddN+CQDgh1r9ACxDm04ilf3guY7G+/RsqUKuepuMavC2m93ie6YCus1S3XgCXJ
	ElewVP7gwpOf8DXbNURyRNWfpJerw==
X-Received: by 2002:a05:6214:23c6:b0:88a:2de5:c824 with SMTP id 6a1803df08f44-897404bd0c2mr22980146d6.54.1771040285087;
        Fri, 13 Feb 2026 19:38:05 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b1f8185sm758797185a.36.2026.02.13.19.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 19:38:04 -0800 (PST)
Date: Fri, 13 Feb 2026 22:38:41 -0500
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
Message-ID: <aY_uQZxuwt8rDf6n@rdacayan>
References: <20260211020302.2674-1-mailingradian@gmail.com>
 <20260211020302.2674-2-mailingradian@gmail.com>
 <yxrhmblavwkuhfrfgskujs7tz7cykojnqnl2mfrf365lhdem35@bgqwiaft67b3>
 <20260211-skilled-transparent-moth-fac10f@quoll>
 <f1b67c1e-cfc1-4d23-a24e-4dd342edd2e9@mainlining.org>
 <f27ec5bb-1562-4bcc-9178-4ff4d4fe00d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f27ec5bb-1562-4bcc-9178-4ff4d4fe00d8@oss.qualcomm.com>

On Thu, Feb 12, 2026 at 10:34:27AM +0100, Konrad Dybcio wrote:
> On 2/11/26 10:55 PM, Nickolay Goppen wrote:
> > 
> > 11.02.2026 09:51, Krzysztof Kozlowski wrote:
> >> On Wed, Feb 11, 2026 at 04:11:24AM +0200, Dmitry Baryshkov wrote:
> >>> On Tue, Feb 10, 2026 at 09:02:53PM -0500, Richard Acayan wrote:
> >>>> From: Nickolay Goppen <setotau@mainlining.org>
> >>>>
> >>>> Add compatibles for sdm660-internal based soundcards.
> >>> Why is it called "internal"?
> >> Yeah... I am pretty sure there is no such sound card. You cannot have
> >> sound card internal to the soc, because you need the external components
> >> like codecs.
> > 
> > It comes mainly from downstream driver name [1].
> > 
> > Downstream also mentions it as int_codec [2].
> > 
> > There's also an sdm660-external sndcard [3].
> 
> It seems like "external" means "coupled with WCD934x+WSA881x" and "internal"
> means "coupled with (digital cdc on SoC and analog on PMIC)-over-intI2S plus
> optionally WSA881x".

Interesting you left out WCD9335 (codename tasha), is it never used in
production on SDM660?

If it is used, the sound card might need to provide different
configuration (e.g. channel map) based on the codec, or we might at
least need a separate sound card driver for SDM660 with the tasha codec.

If not, a single SoC sound card driver can provide codec configuration
based on the port without checking the codec.

> I also notice some details about a WCN slimbus channel (bt and FM radio?)
> in the internal one.

I also notice BTFM in the external one, on SLIMBUS_7 and SLIMBUS_8. They
don't conflict with tasha or tavil, on the other slimbus ports.
