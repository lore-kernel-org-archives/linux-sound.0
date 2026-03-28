Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4926022D7B5
	for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 06:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774678793; cv=pass; b=qaf58JBq3Uw0OV3/XIJSoJqszhyciNyOnnV0L6URVGwGfvx5wXv5EO8+q3ZknpobNp3c9IhwJNqLszMBFJG6+NcIlhxr6fFPwmhpA1xOtoEnAkPlgKcuG3+7HroJmGAxveD4VEv8dvITveodHwUFFgNpkdsrE1S+Yypb3rAjD6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774678793; c=relaxed/simple;
	bh=04xU+9rUTVF73lM2Nen62/GOM9PDQQ//s5R1roIVf00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j5hGatfdt6RJpD70yyOY3Xb2yZVBGjUKz6sRghyF2indpC2EfZFzSkYG50JwePFJk7svYqhP3WPwYV8fP6A1lc7MjzWZrZmvajKJCK5SFS1NZvgjOaCP8B1xNmy+XS6bmXvNMK9VVn1l3jLlcCVPNYl/loZCagDFv/zsz0ctDs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgOhYlAM; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgOhYlAM"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b97c44417ffso278295366b.2
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 23:19:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774678791; cv=none;
        d=google.com; s=arc-20240605;
        b=HgAM2qjtihmNWdY6IwCm349kHTwQl9pBExwMY5f1TrRzxD7wHkLEGM1mdbrGmPRkT/
         aWU/mRtJB+1sa9rxw0HkHX3FXtMW6C0QQnOWrO7t6E0gE9tDy58+SRMaCVGIBFheUQ2D
         NoAZsHGcfOR94p8zGxBzybqqDQlrHOQoUpVj/l7MNI+Mct6Ys3vOh2To1tRbLxcSmLyT
         LZjckJFn//dsiaGcvSiL6sL1V+soSigZmZcs+J2XTbN3UVHop4D7HC/ovuG7xhPRsazk
         0iH/CzUzrPwmboMKvpH0kezdd1AFYS5giUme/jx1gjdhE656GciBHnnGWA/5+SE2p7QC
         Ys3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GZ8LyFsiPdiB91OHtf9zow6c7/enCHW0nEJcsiAiiP0=;
        fh=NB1Osa72C6dfGvaAehzE5FV9zjGKkqXX9p7ffWxw5gs=;
        b=Lam5Viz3XTgN7lQF/kuK02etlJ2akHfL745fVKfao3mD99pfOQBCz3H+2raah6Kvoa
         5cKw5bqmjC4eow6bJgRAAYUVQTuPSQT8KSLkExgCweF7jYGvjPKK88rOotEetX1YO1/4
         16wsLQymjd9fDp+LioWSONB3mN53Gxup8u5DUx1RWlipCApX/WwvXVihjjPIwBrK6pz8
         CWSz8wxcvLJFtFCJGX0wHaOxmj/UFmZHGuez6Qr8h19xAiS22ZLOaWHZCU7QRbUvgo8I
         7fbj7OMjGY8D2urE8ULY4zoE+1LHFJaaA8g/jp1c5ozbahN8CxFHfYOE4lxwXrfiqEWp
         Leog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774678791; x=1775283591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZ8LyFsiPdiB91OHtf9zow6c7/enCHW0nEJcsiAiiP0=;
        b=GgOhYlAMaHHtImpgn0ZyQ9nDJLDV9meqUBEDTYPF7LaIigyTzFhz17d1EuvNPOlGnu
         ATVd/1tawty7uDSzcWeP0S0LH9KPERczA+WYI+L7D/mGacyuv4yhc/6moGogdbFvTiuM
         RpDnc1c0XYzHEmK3rAF9U6upmlJyxaAvivP8l0u5KFW1ZCrhF2p3On1OxYvGCZOmI4Rf
         Mx1B9lUEZti+yL6As9vLcKq44jC1GXZQ+wJAxBZ/j28KjYF9GC0uL7/0Ar0W2OZoEdJX
         y08UdPrCTLjZrV/PhGa/F4pdvyC2DjTtoEvyFA5fqb5reTmFfzPUcWH8cOQ6eev/ek0P
         TNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774678791; x=1775283591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GZ8LyFsiPdiB91OHtf9zow6c7/enCHW0nEJcsiAiiP0=;
        b=tRMPygsxljc43dkxgdCa4UQdz9qCtmppGFyPMpJZjht4oHYKjfdwd9AnF+XWhnelWL
         1ypUwlZ/QMY8G6f1AwptSQwiXchX+tE2P2scLHjDgd3qIKn7IzdjshDftsw0s2cG61sN
         0CgBKT9O7zMZov8ls/AQhSv9EP1f50WZs9qcOjDouvWMoCqyz19Ao0mXOqFOevdUVtrC
         zplI6FUe7DiD8k+aSEf0c3GO3oY0oa0p0YkzIg2vko9pdljn2CJDSOsYwiPsLWiNh2Pv
         kGlA2KBuRG9mAr0IixwRMlmv/lvewvDtGtyR0rotYy0y3WvJ8JXTNm0acoL/ZGzSt98F
         r9Lw==
X-Gm-Message-State: AOJu0YwX+iIZFVrvYbJJLr4l569J43lOy7IJPeaIqCfpyBrCgmdca5al
	992EBXrK5eeQfJVZyVyl3lXSlvHOn6dZa1sVk9oNT5kkNr3AaTIcbnxoiAMwn7oOzNM1ovqtt8e
	c1/uu4KhkxAkfJL0Xxr/LO2gAcMmhPW0=
X-Gm-Gg: ATEYQzxd8CrB3nwIcTgUHQBH9HS7Ujrsn2mA3wX5YEVnnOxFAlVp4OO8p2lgnhH83Qo
	1sm4hzM5ymWZwHm/pLXTQEWxdb0CSxG3PjohzdvbES55D5JLbLw0Cb45iIUyFNz+ULEaIg0oJXp
	FsNHKro/fThriiiFa4KGKxqWCEPNTO4oPD/HXRiqdcaFtncgtm7o4qSmdBURXfIBSLSEuSoU67N
	dHB2TNlcjWiIfhcv5fgfDQL49WxMS8jAsCWHas0uicn7Jc+VCsEuHAKaa0wjl7oiToZ33dX2JEz
	FjQIwpMk/AwWcAn7PIVtMJt3czypT5MlcuhUuQ==
X-Received: by 2002:a17:906:209c:b0:b97:7616:3362 with SMTP id
 a640c23a62f3a-b9b5094ee03mr278168766b.44.1774678790291; Fri, 27 Mar 2026
 23:19:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327193002.423897-1-aravindanilraj0702@gmail.com>
 <20260327210408.430908-1-aravindanilraj0702@gmail.com> <acbxX-8PPcXg5y1C@sirena.co.uk>
In-Reply-To: <acbxX-8PPcXg5y1C@sirena.co.uk>
From: Aravind <aravindanilraj0702@gmail.com>
Date: Sat, 28 Mar 2026 11:49:39 +0530
X-Gm-Features: AQROBzCLCeL-kPI0habZO2WX2KzascR0kwLXYrrIJjZhbzFkwiw3xNNVvdY8QG0
Message-ID: <CAPf2Ut12e1V9gABaciS4GQWpVO=aUOTW0KVXFxTp3vrPWGX7=w@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] ASoC: Intel: Fix MCLK leaks in platform_clock_control
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, cezary.rojewski@intel.com, 
	liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com, 
	yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com, 
	kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev, perex@perex.cz, 
	tiwai@suse.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

Thanks for the feedback.

Apologies for the confusion =E2=80=94 I sent multiple revisions in quick
succession and incorrectly threaded the newer version as a reply to
the earlier series. I understand this makes tracking harder.

In v4, I have:
Split unrelated changes into a separate patch
Added return codes to dev_err() messages as suggested

I will send future revisions as a new thread instead of replying to
older series.

Thanks for the review.

Regards,
Aravind



On Sat, Mar 28, 2026 at 2:36=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Mar 27, 2026 at 05:04:05PM -0400, aravindanilraj0702@gmail.com wr=
ote:
> > From: Aravind Anilraj <aravindanilraj0702@gmail.com>
> >
> > In three Intel ASoC board drivers, the EVENT_ON path in
> > platform_clock_control() enables MCLK using clk_prepare_enable(), but
> > error paths fail to call clk_disable_unprepare(), leaking a clock
> > reference.
>
> Please don't send new patches in reply to old patches or serieses, this
> makes it harder for both people and tools to understand what is going
> on - it can bury things in mailboxes and make it difficult to keep track
> of what current patches are, both for the new patches and the old ones.
>
> Please don't ignore review comments, people are generally making them
> for a reason and are likely to have the same concerns if issues remain
> unaddressed.  Having to repeat the same comments can get repetitive and
> make people question the value of time spent reviewing.  If you disagree
> with the review comments that's fine but you need to reply and discuss
> your concerns so that the reviewer can understand your decisions.
