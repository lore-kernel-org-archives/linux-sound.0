Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E592DAFA4
	for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 03:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770692967; cv=pass; b=QE7Rat6yhb9qGYrjf3E3WezE5NrhfR7BVK0jaytJYaE56rW5bpMUP4/hqCGCkoPJ1y0VoCyjHqYZevboqrThmLed3jShRXrMyFefzdgVyTuMrSNsknYNSSmAhwiD1iK9BfgZD9icym9k3Ml/5W6xTLRmsECuGw7ppBBzh/KV5dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770692967; c=relaxed/simple;
	bh=0YlaUcmgxCn2DCwO1WFpuOuQ5WL2LKmndF+igL17ygQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sYEHqaMPFtm5DQGWZTvAYuLjp2BgPrW7sUyateGh9S/m0/3hCW5UWVCPzy9NUhGGABY5TjoMKe1AVD/Nq6mvBGJUFsimPmbHSQ4tmMBl0Q8wb83OrcsyxcwghHJ0/Kjjy8EUURCyiKaOEv+/cuQ4VoeVwXsiarps/Dbg+bEqNEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gS65n0b6; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gS65n0b6"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-354c67da885so2152613a91.3
        for <linux-sound@vger.kernel.org>; Mon, 09 Feb 2026 19:09:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770692965; cv=none;
        d=google.com; s=arc-20240605;
        b=UwRvQO/GaoLc70WaHSv2Fy+7mxi/J++xNDGqfOEBsAaFSjTqpQ3IDA1vFGv3S+c1HZ
         k7DNfaBOvJEvzWrh+IREB65kYTz2bmionWKbIQ1UfZxe3/w7ni8CJCrzVcbxI/aZUnxo
         mxsSIOWlLMunhp0o80rj7SNjhvB6tBLHYqespxYcPJSSnS/Eb7Vc3/OxoE+ol0TkT+9O
         uWQOrmiKDfkliLGj3tD7dEQA/j6XHNVOpc4j/aBJ7uUn4Juo3ohEmypsgKSeTXMryKpM
         NmT4UvfKqES34bZ6tqLxlgL7Ut0yxMY10QnOeqeaUaIkAmfUEPW4JUIUYXRqQkGEon0C
         mlBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gv0qhvkTmSFzVccZrGFOJbxajUI5YCMnuOD9JD1hPPc=;
        fh=JpWvhYmx7MWoPiHduxDOUzbC9Hrp0Q2XtwZ5hbtGZZY=;
        b=c+TYh0xsoGavb/5izB1tRWrVCTXVSjTtt4endh1d/l0sRGqtF4d4hJLYiNPsnVtv7p
         /DueQMvGFTvBT4g1C7OwYFJPV1ieOUFU1N5gUiaIkaF7hci+xYp6ObE4Y3p7jvJZAVHq
         mpcKgylEh1wupQaOgPNcpunkvOlfgZTVm64QkoFCzuqy7kfDRQZuPVPNWwdlCTgAm78F
         5tA17GuYUJODU//FTfKYZtzehFwwrqwBHevNPdwrscCuUB1AGFuLxtDbvtCZioVKDVRJ
         QlXgjqQc2EkEs7kSpBiQI6MwDXzz9pTMXV8OPjnSEhLewktRCgwH1NsJCr9z9fsETbNn
         unLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770692965; x=1771297765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gv0qhvkTmSFzVccZrGFOJbxajUI5YCMnuOD9JD1hPPc=;
        b=gS65n0b6rDe8i51tv5/Ovm4ehP6f+P5dvVltQlkH9NvbK0nD8j2TwLp5qPQk6HgYV4
         exye9NgfKpO0AMyEWd77uPaidSWfcDmHcxdDbb11YzDPJ8tKwupTePQ7cM/E1dLpcK/8
         J+Q3u8IWjLrMldB4+9YB5pl2ZmpIcnZnN7W7cfH+59PJcOqFrfELG6AMIjtnlP0nOLFL
         M4knB2q/KW+2qCbMy3RiiWvTBzB5CVP6Vy1zZM07/5zSfQMqfEyPMay8zOtHqWLhsrBw
         oMgPA3AdZ0f7skWPcIbKhGbtpBp0YrXG14J6Z4DNdR1CWD468JrKO9o6V1eWlBizlFKK
         T2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770692965; x=1771297765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gv0qhvkTmSFzVccZrGFOJbxajUI5YCMnuOD9JD1hPPc=;
        b=aK1e341Fy4+5AHOfYzQ4DP89sPLtSvRzZraXO9L/6k/MhN6mz5gT/pLXBT5aiWhWT6
         M93RryR+cd7KiC+XPFZuQKJNKNanC95KI/AQBlt0LCRrCX1e6br/lyunUpTxupXHABIU
         n/9KjKB+STv9E91jxAyhRfuDWW457y43jGBlwG1GuUWu4j/2hhe0/DEeDsAdJrFh/3Se
         QdEN4XGNeKzy5b+XOHp2tZWeR4ILvLc+Y96JryrKk5ItQ73Q6xyTpsIxvIWGD0FUSDrd
         YkYdyVcWHADAZlkO80FkmUN84OsrIeO0jFeq8K9uc+G/EvzTqz6mNqm/hST+j7ENq2nC
         KPwg==
X-Forwarded-Encrypted: i=1; AJvYcCVkT3qEfDgKfG93/vreqn1bR3qEI+Fn+VUXtmvq5U1jiPPmOWyBGLP1+Y3tZL+shkY+dHeyHeuEg39+Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc5hc9IjOZsmOKHGRPyE03cqYCkuJap/b0fX7/JpdLmxd1ZMmm
	S166Uywaim2vJelAlEacz53XznDeE/OWKn4G9eWxvWGlmPAyCOxl2ey5gwkgTVbSqWSi5BQZo25
	KKJuGlNM1eiHuo4vAo6bKhGsIhpI2SgY=
X-Gm-Gg: AZuq6aIyVV8OtSIrDcMhjQvYYMK6z/n/XkcRLhLyMfqDSKdZ6GavyhuQouES9ntLpkp
	mG6DFZ+MoEhEryslM88onRoTCMBqX9ERspXjVU2ALiSg3TiBc4YqC5IKCgn5/Opwjr5/6wIbkkK
	fdldjO/IMSkLRFEOxaaMyImaA9IZaLjGDUv/LrczMLhVoqD/wDtSFi8PDnOfORpZD3u4x7l4d/2
	zRhU19w1ZLrlhjU14yyReXBZvQ5drtgfPHv7+vsPVp5z7JtO1dhRIl15RiEMeqi7B+jRXQuXNE5
	jZQQ6Y4=
X-Received: by 2002:a17:90b:2f85:b0:354:a5eb:a64b with SMTP id
 98e67ed59e1d1-354b3c81d39mr14250683a91.12.1770692965280; Mon, 09 Feb 2026
 19:09:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206084334.483404-1-shengjiu.wang@nxp.com>
 <20260206084334.483404-2-shengjiu.wang@nxp.com> <aYX8qnKiPxHej-Xo@sirena.co.uk>
 <CAA+D8ANHrwN_vL_JmC8ZUQ_FPUcOqvBof=Wrzkmpbexi5iFMQw@mail.gmail.com>
In-Reply-To: <CAA+D8ANHrwN_vL_JmC8ZUQ_FPUcOqvBof=Wrzkmpbexi5iFMQw@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 10 Feb 2026 11:09:12 +0800
X-Gm-Features: AZwV_QieFcNU6th1bBV0E2BOZPRwudjIeb-yLtK5EAu3GiRWTXfMqQcIoeeC55s
Message-ID: <CAA+D8ANherWa0p1fw--OkNedyb+Be-PMOC5mLHrD0fjC6L=2qQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: fsl_sai: add bitcount and timestamp controls
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark

On Mon, Feb 9, 2026 at 11:16=E2=80=AFAM Shengjiu Wang <shengjiu.wang@gmail.=
com> wrote:
>
> On Fri, Feb 6, 2026 at 10:37=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:
> >
> > On Fri, Feb 06, 2026 at 04:43:33PM +0800, Shengjiu Wang wrote:
> >
> > > +     SOC_ENUM("Transmit Timestamp Increment", tstmp_enum[0]),
> >
> > Don't have arrays of enums with magic indexes into them - this is just
> > error prone and hard to follow.  The normal thing is to declare a
> > separtae variable for each enum, or if you *must* use an array use
> > named constants at both ends to index into it (but that's not
> > meaningfully different to just having multiple variables...).
>
> Thanks for the comments.  I will update it.
>
> >
> > > +     SOC_SINGLE("Transmit Timestamp Reset", FSL_SAI_TTCTL, __bf_shf(=
FSL_SAI_xTCTL_RTSC), 1, 0),
> > > +     SOC_SINGLE("Transmit Bit Counter Reset", FSL_SAI_TTCTL, __bf_sh=
f(FSL_SAI_xTCTL_RBC), 1, 0),
> >
> > __bf_shf()?
>
> Can we use the __bf_shf() to get the shift of the mask?

Shall I use the definition FSL_SAI_xTCTL_RBC_SHIFT to replace
__bf_shf(FSL_SAI_xTCTL_RBC)?

Best regards
Shengjiu Wang

>
> best regards
> Shengjiu Wang
