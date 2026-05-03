Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49DF3537E2
	for <linux-sound@vger.kernel.org>; Sun,  3 May 2026 21:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777843271; cv=none; b=HEeGddy6Xp26SUHBhXseHNKCCYc9vQqbOQ/wxEbqoCu55WlEal+wnDfNtFH8SEVmHJVCvWj8clxGYCtAh5xGJj0yj56k/XXwKMTjfsqcyY2P9OzhXGDdd6psVALUSWWCzcpoUgzI552gU+w5vxjLpvHM5+aUy2VOKOuJuXdPOjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777843271; c=relaxed/simple;
	bh=WtL8OS1YnNGjQgVNOCpLNO9Uttl/pmSrIlnfIUeuAns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhQQQr1lK4zPr2jD/q6e0lFQqo4IcFjxHr0Ntx4ztPtzEhKua8m0FbcDSl6u1pJqbw0+x91X/zAsSv4syBE44ZI70tRPtMF06t0OMd2MmLkJjji9bNrIpbt0hkzZc+afmzteTRkTbqBWIay3mEDnyI7YcpLwqj/AEozn0Uo98CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZYqlfX5; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZYqlfX5"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50faeb8317bso26535761cf.2
        for <linux-sound@vger.kernel.org>; Sun, 03 May 2026 14:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777843269; x=1778448069; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o0QNlGrqaDI4UYp6C7qqj/fd9cv+jSvpWhH3Jn8vqzI=;
        b=NZYqlfX5Nq8zcfXaB5rwTQWs+aLqAZ1E+2DkRWXbigD9LGo/H2mgc3BQ2/KgK6uPGN
         DUO0SJ5pNjZkFR2cuiv0Sr7rI8uwLDCj0hhtVg4tKu2/p1r70d4wS3DxXXoswM/6jE3Z
         3zNxd/xXrbYzoFBWXmR2m3Ppc+ziuvQLyC9QeRHvEdyE4Cp4dNzf97yq3Vd1Kyqu4wQQ
         XFC8Kb2xSE/IFzK95Q466JChNhfy27tYEBukUglKWiErqpvnvJuGaxq6Yr2mIJehiCXI
         p/ikV66ybXXIbZY/jy5rdCVz02xZEimYjEoAUoCDtaqpmMUMo7zKvcAuGtP3Kvt/FQ3s
         Zq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777843269; x=1778448069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0QNlGrqaDI4UYp6C7qqj/fd9cv+jSvpWhH3Jn8vqzI=;
        b=rbJGwnubVwEQg2Ld1vTaQymm7CbYGChvdTnmPaGXHSRYGQ+91eT1ZmNAJ3tGR8KAap
         RPj9Js3+eJozce4CXlzM9my62PyHCzysRH0yq/CVOnsr43gQmzNi87FglFPRTtW1n6rA
         TiHn9F3JVCfIqAh6lvyrus6zpFPh91ccVSeLGZsWERFCx3om7m3G2iUW6OUpxQ9CtT8j
         7oWZ4O0Lx6f7P+8G3JVMCjnAv43k1fCsmsaDO4l4pQ1WzRMkD1WwmZKimq0pNjlrf5aN
         pFsV8jx4cB/0wts60zEBKeMIVlsTQeSIDuILTVt+QetJ5fNM6uY1QwMeD8TxDoEg/QIX
         MOvw==
X-Forwarded-Encrypted: i=1; AFNElJ8qz2UM0b+oHzI1FemuW3wqmmH3q9fVuYK2vI7OQTeLMantLWTg2PY+LlPIjXiwcm6vSoWuGXgLA6xFrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhGpMJgArIq9QLizOb8ilfqBttHFkQCw8C/tjxiKPxYP+pw019
	KtcggGw60zbOkG8ufpCaaKH6oLSj7QR8D4CCwVFUoHDg24G0fwxnMcV/
X-Gm-Gg: AeBDievNFKpFOASUBXacC3JBgQIaYIEyzc8mVI0xaTQmwGZsRr+k41OFBgHX8MXt1mf
	VK0QD06LW2iDmkD8IC+MiYWM25Z9Skef3SNLAE7GXlxwELWGk5L2sKdcs6TcVgowji6HXU3QH1T
	BoZYM1DxkMopruxAefdhf5gEKeLZ7f3fc4sw6z65SRP4EzSNa0Wttj+mUSgiwVkonxLz2CUCnZk
	eSvfr9M95xA34WPU5hp1W1hPDBqc0ngot0pzL1yi82cjAlUkorCKzNfigGdCr/9HsEtl2JV/FSw
	0uKPKC3nVIkqQ+BSeH/YfY0k8CeJjoaubq2wftgARC+RQCeJ3tBcmb5Nwuey6cDL32EtkTUN7Nl
	xEFWRTGFicYo71O5wcd32rRjp3KfsTQIFJhqvwk3+ScYTAHyOJ9Ttgz/5NJwk/QRpY8Qlo6WDFR
	QYhYdNoqdhNKWFWrwT2QYPTwcgiorNCA/+hmq0
X-Received: by 2002:ac8:59d1:0:b0:50f:ca25:fb48 with SMTP id d75a77b69052e-5104bfade50mr120133951cf.55.1777843268706;
        Sun, 03 May 2026 14:21:08 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040b5e8b4sm86548111cf.23.2026.05.03.14.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 14:21:07 -0700 (PDT)
Date: Sun, 3 May 2026 17:21:49 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v4 02/15] ASoC: dt-bindings: qcom: q6dsp: add internal
 mi2s support
Message-ID: <afe8bQ3SIAu9rP1S@rdacayan>
References: <20260501153128.8152-1-mailingradian@gmail.com>
 <20260501153128.8152-3-mailingradian@gmail.com>
 <20260503-devout-mamba-of-sorcery-d4ecb2@quoll>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503-devout-mamba-of-sorcery-d4ecb2@quoll>

On Sun, May 03, 2026 at 02:11:31PM +0200, Krzysztof Kozlowski wrote:
> On Fri, May 01, 2026 at 11:31:15AM -0400, Richard Acayan wrote:
> > The internal MI2S ports are found on devices with the internal sound
> > card for Snapdragon 660. Add support for them.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
> >  .../bindings/sound/qcom,q6dsp-lpass-ports.yaml     |  4 ++--
> >  include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 14 ++++++++++++++
> >  2 files changed, 16 insertions(+), 2 deletions(-)
> 
> Same feedback as last time. DO NOT send next versions, untill you reply
> or address the feedback.

Ok, I believe this is about [1] and [2] with reference to the patches
already in v7.1-rc1 [3].

My patches add INT0_MI2S_RX through INT6_MI2S_TX, which correspond to
q6afe port IDs 0x102e - 0x103b. Srini's patches add LPI_MI2S_RX_0
through LPI_MI2S_TX_4, but no q6afe port IDs.

I asked if the LPI_MI2S ports have q6afe port IDs to check if we're
referring to the same ports, but apparently q6afe is too old to have it
[4]:

	> Is the LPI MI2S on Q6AFE? I don't see the AFE port ID.
	I think the older SOCs did not have this I guess,

Even if there's already an allocation of dt-bindings ports for LPI_MI2S,
they can't just be reused for INT_MI2S. There are allegedly INT5_MI2S
and INT6_MI2S (each RX and TX) but LPI_MI2S only counts to 4.

[1] https://lore.kernel.org/r/20260305-fluorescent-gainful-unicorn-4f8d7e@quoll/
[2] https://lore.kernel.org/r/20260305-gigantic-gay-boar-86db8a@quoll/
[3] https://lore.kernel.org/r/20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com/
[4] https://lore.kernel.org/r/23434dcf-5f45-4d16-95fb-a13021331de6@oss.qualcomm.com/
