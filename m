Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB72D39B976
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 19:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774900036; cv=none; b=hsoIIegU2HQARzmsXj6hws8LyEhylEh3BP11U7BboVdgb/MxSRUn0F/rN+sVZgDjIoz/C1Ax2o74C+qQuwe+1f8dawg4aaKciS4JbFoNUoGdyFd5UBHbI2PhRM9gq1AP3QPwwmMIgBLD6ydtIDKfgOQiB0a6dqI1JXcsWGr3Y6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774900036; c=relaxed/simple;
	bh=b4dfFFhVxCppetsQCIQi6F2IzJkz0MkcswpGkyB4KGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRzLg1Bi/ymVvY1fzhwAnJnLNj8PGWgj6ATqvulx00dyZTyenR/DSlx9XTLQ4cMnlgInIR3/Uo7c9AgEXSgofBplC3MigQ5Gd9rBITTKoN3Bc9VDRhMdhMfqedy/mwwag6rHsFqUijZBbigvZkVBUTSWqI1kGs6joNRb3pgMT2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQXF94Vb; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQXF94Vb"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8a210c813f8so7403316d6.0
        for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 12:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774900034; x=1775504834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3wWujn7zEs4XmtDo8jVLXY8JrcwdbToQOe8VxaRy0AE=;
        b=FQXF94VbsNoDPkqgVGjKra3yATMHt9c95gNuCvzl0tdzGSclmUpUvyKjlp+1LimHyw
         ANqeu9lBUBZCHE4B/M9NbV0gH7nqLwmQi/YYU4wcaQ5Qtq0rtUPg/+8/h2sLv4wLLEBm
         iID/KO+C/TO4ux0dIuhn2kcCRN0F0iVorqYN0FXIA2jiUeLq+bzIrNke04jeVWNX08G6
         Z3a2pJPc9Gz81lJLMGD2WhTKbfcwmcqcf1orRBE4tvU3oAwo27I8F78yhB9hbmhEsUvV
         KCaf4zaELl71yjFgA3N2SyJ8WfCl1kdYZmvgAV+MPnEnNyYfwkh9gH9oVRP+r1QRdP/H
         37gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774900034; x=1775504834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3wWujn7zEs4XmtDo8jVLXY8JrcwdbToQOe8VxaRy0AE=;
        b=Ec8m2FnWtedIhs1ShqUq2UrSipkRlgthowAnSV85Izk++E1jgsr/Lvw3GUdAhVNBcp
         AzEaBRt9Kcd7sfd1ntSPIa064Py2dMDV/68ZGECU/oe9M6CPN1Oia3EELR3pGYI8S6U9
         H7BVLEqnnUvecUr/luuX8LaRKspZcuQbCk0F/i4joDNxHQgypHIUDo69yWXq0tI7m7G9
         I0Z4FmipgQreIRLqgGEiKK4c7oExtEsm8BMaS5UxlWCpTBDRJz4mz3m3+gx5AuFpsJkJ
         BkSV9QUFghZHJy07Ok2TFG2PwIZeDZlUl3Gatc2w7h/aDrO3rJ2pbsc9jS/uIur7s/fE
         ey9g==
X-Forwarded-Encrypted: i=1; AJvYcCVKXK6Ax0oL7NC0C4Dtxdqx1mgBGMQUIgZrDyRFdn+l7wYNXSBgharsVF6/oevWrcUQsTkB0q0BtDCmXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOHFkl2cQoH5LXLnf5oqvs7swmIL0WtGqhb+0wb1v9n+gdfgo7
	uJ1kfbnv8669/YFnOQPGPM1Mg2iDF4xSMETxq+2qtq/3MAHPHJB0eHpp
X-Gm-Gg: ATEYQzzN2IAZ22gXDrTN0gqBtrTGRfPkdgmMJKVs9LdUWBT+bz/lJi4RONdCvtYK2iV
	ReZu8L/+2Zmt5GEql4oKaVCxUb2WZXiyOHrG9baeEtokTiBZ4axnN32Yy2PScQOzThMqHt6uy13
	A1g/6Cpwy479rY4rJeSS7rHjmyTXNWKqwR14zXumszOGBSl+huNSCxWdnrbOeiHG/LjzpdSxlfY
	oWVkTCYGlE6LfnH4QIxw9LPSEKWFpmuzqso2yaYTdfYZhX2wKeJBYI747FdTaBCtpiuICb7oMV6
	s2pMoUZCXXIqRVLakWf8zyu7RaYv34GQPEhMbDlh0xi9i5uR2UTFEtsyLBWjzuwhT2HylAm4CTD
	uhwXZPhScs7W7paK5iKxzc2oIz7dnJLVzkFRUcGDu7zEuXhnhUO8Lt1YI4+gVxtMxax3qSMjOwm
	kjYh2PsTNpfuZFMmztoy4gJSM=
X-Received: by 2002:a05:6214:478a:b0:89c:4b50:510f with SMTP id 6a1803df08f44-89ce8d421a4mr192997706d6.8.1774900033776;
        Mon, 30 Mar 2026 12:47:13 -0700 (PDT)
Received: from localhost ([199.7.157.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ed02364e2sm72112396d6.45.2026.03.30.12.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 12:47:13 -0700 (PDT)
Date: Mon, 30 Mar 2026 15:47:57 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	Nickolay Goppen <setotau@mainlining.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: Re: [PATCH v2 11/11] ASoC: msm8916-wcd-analog: add quirk for cajon
 2.0
Message-ID: <acrTbcihqVJlNR5-@rdacayan>
References: <20260304195815.52347-1-mailingradian@gmail.com>
 <20260304195815.52347-12-mailingradian@gmail.com>
 <aalV5dBloD1BmwzZ@linaro.org>
 <acqvm25ap4LTSB8j@rdacayan>
 <84219949-8c5b-416b-b6cb-a77c0ced85a9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84219949-8c5b-416b-b6cb-a77c0ced85a9@sirena.org.uk>

On Mon, Mar 30, 2026 at 06:22:50PM +0100, Mark Brown wrote:
> On Mon, Mar 30, 2026 at 01:15:07PM -0400, Richard Acayan wrote:
> 
> > It looks like the codec part is mostly complete except for some trivial
> 
> There were missing signoffs so I'd be surprised if anyone had reviewed
> this, I certainly didn't.  Looking at the thread I for this version
> there's a bunch of high level negative review comments that you have so
> far as I can tell ignored.

Sorry if I wasn't clear. The codec patches in Adam's MSM8953 series
(linked in the message replied to, not my own series) seem in a late
review stage and I can take those other patches into this series.

> > changes (empty line after compatibles in dt-bindings, constant to use
> > BIT(n) macro). I can take the codec patches if it's okay with the other
> > submitters:
> 
> Given that it looks like the series consists entirely of ASoC changes
> I'd be *really* surprised to see it going via another tree.

This is not at all what I am suggesting. I want to add patches from
Adam's series to this series if he and the other author are okay with
it.
