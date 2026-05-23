Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5EC39478B
	for <linux-sound@vger.kernel.org>; Sat, 23 May 2026 12:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779538307; cv=pass; b=cNP56yKKaztKTbh2siiEFHqXVL11zH3tc8U+n7r/zB78QWEDjcYsf5xqmpfBZCVc1XAPZwRtBexYJfgiyB2as6ASiP+UajAV4XVYgrd/3UNFIOXYl4OBohYYb4r/DmSazzihaiKPT+BVoOM5skq7kW+94c+AfMJAGognxOuoQvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779538307; c=relaxed/simple;
	bh=8wpphr3zABAARr+Xe3rZOUncnYSZS0BnTX9QeRFwgyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQShm0rPKtwFhSQCQqwZQ6rgpEPKZa1d8+92oomzXiHcqC9OeOCtZJwjZwuk9yKgE0cDJBQRNPPE6Y3rNW47bISeJFb10N2C01q41XQfyChXIXXYyQMxIe1tmuCR2LMMmcHZIf1VSIziV0Gb03YJB4AZHqXf58OPyOafhqcu6OQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lr0pkXfH; arc=pass smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lr0pkXfH"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-837dfccd950so3915761b3a.0
        for <linux-sound@vger.kernel.org>; Sat, 23 May 2026 05:11:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779538305; cv=none;
        d=google.com; s=arc-20240605;
        b=PSOnsQYDicRkbo9ZaBFMA2c7uBKfjkoXTyptDQ74XNrJ/GOCXkscZP/lXpwNM9K+ZF
         Q/lZ7bWXML0H6JqaUKaBeuEkbSx90MDEY6Snfj9K4mVAXC/StwshRGn6V5SrdgS6t1XK
         tug/oF2LccSbh1jHOC9ooaV9X8CT+0LKLN69t2kavRsvy01naigPFS4b3ccL0nN/Q0eO
         R+6SylC5UJ4FjWyZPnfeMKu/SoC6u6Wm/njq+K0+PpNLFooEVM4PkrrrrU2ACAxObGHJ
         TMqmS9L5dMWBaP+5fTItMAsep2mmrhbmEjbdrzZcQa+yKIjPPdSdyEl+PU1VoZYFwXOl
         DuTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8wpphr3zABAARr+Xe3rZOUncnYSZS0BnTX9QeRFwgyw=;
        fh=29oRvPo7Of1n1uhDlnJYLBKIsuBK/M1EvSqLRsy9mdk=;
        b=P+ZLNSt2+G3cLsS+9nY3BAlf3U3dE7Oe1ubK5sYBCyEYVvzHwXgp84R2UeHQ+4eQJ5
         tusfknRRghAUL4qos5P8O0Edq2dvhOxU36ZpVLoPlCWA3VloiagTAzONO+GVNg8BMgnG
         tLGi5JRAg8CGkDTAF4NBJVjNMumNzXNBFJelBYOxhlPQDz6lUoAxnf4IuR+SYemhGLT0
         LREDttSq7WCU8r+7H5XW24ZWIDetA5xvU7aSLRplxFqqZVyPCRDuAtCmpN7P52/C7wQI
         Hzr5GATNhZ1iFcEZI+DB3qWMD9DNqB8d+0Kb4LwotWmyxiq/4siCjxumfKhwvJLJP+91
         ti7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779538305; x=1780143105; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wpphr3zABAARr+Xe3rZOUncnYSZS0BnTX9QeRFwgyw=;
        b=lr0pkXfHcJUZWvNGT0caHUT+CvFYEeeDd/ZfxlFv515lO+YMN7u/lgf9E8T1GGvh6o
         /FgDr3kF0DMiq+97il3ECTmcDY9meOBuISJJ1JMdbPJVYSWxmCNSTGbBKi/AMC9hT0Ng
         LyuR3wxyjcTHIYAsBviPbwA1cUZmKP7IO4fn5TLFaDeFVi0NMx3iKRBOPUqru54ymoUc
         X/Bwahkq/0lQNfJ7Gwa/uAL2SkiWnctwzd0Ai1O9jRuezrr2XB7fvMBikjrtXXVMM46w
         apL+K8X6TYeVhkNqgiu9M+N/9WfqieW1sAqEq6t2wZY6hHDnS+/c9UHpfek7ZLuKdjkY
         I6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779538305; x=1780143105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8wpphr3zABAARr+Xe3rZOUncnYSZS0BnTX9QeRFwgyw=;
        b=mn0RRGdDlwSG+cJfYF967CWNenMNbRljuRjHL2KgSapXD7IGIDf0l8DBpah0NIxY6j
         TrSRz7HiT18zGjeaBVT1eaq2M06tMr1lDPVtpjpUFDLOIU2zVjLByv3jdXjZVZ3Zxy/L
         WuQ+cdfbwMdwtA8NLAfODbkXiOLuh3pPikTflx0n8n794/JFLnZrXt+KGS/OFD2cZcpW
         iqE70VCVhkyHJU/TAjxg/zmTJvpZhw9x1TZ6hpGJxrfARrIOw0+tV92rjzW3DRi4HHd2
         4sx7Dw6CFUCa+ov0QiwjdBHNZZj0TnFNdPtCHarhNb0CpAxEiRc72y/lV55ZyoTKNpjX
         /cbw==
X-Forwarded-Encrypted: i=1; AFNElJ8Y4lqT2tiCCtBWudv/rbEXuuQM4hy97i6T43FODbjIWYmIrVJhxW2Yl8VPQXBETOvVDYA9SI9m1urUOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuUUxqVLaAt0C2jVhlh4bfTdwPl8gK+DLr6qFzc0iqPcWgIh94
	nO6WlxdjdaC3apvvTGxi+ieQyVjWNEtS6HYYMib9+ROmH5pA6fzgxOSNheyCWc7Y5ZJ6i16DveQ
	age2RLwSHulIpkTzKBIRZ0qIXB6IUTAY=
X-Gm-Gg: Acq92OFjLap/708tHrIfkzMoY+SwZvCmF5FO6DjB2idf39FNJxGb/1LiU45Uo6zVXpg
	DIc6cYdbdjipcv7bBRmXLiSyGXPQ0xq5Tj6gDCExyXj8j4wz2BOrDwS4ix+lYBEwVNx3BboENGx
	WXgHr3G0Pvo9iSfY4FeY2P4u+Ob0yoKU9lRgZiWUA+cQ2f3OCUDhbtSZ2UOT9/g0NXUMNA0k53q
	5vn63nbdEyHJlfiLoMqgNf1GaH067dLgCs0wF/71XmaN4ymH2LWb9wYnH89TztNZwzd8d8j1VHD
	DkVCNpIdx1XXhviKDuO3Mt6/bK9zFTD+OCyfx4OaLI+QmrfwHG9Y/tHVFsP2/+MdsTjoGElA
X-Received: by 2002:a05:6a00:430d:b0:838:af72:fb1f with SMTP id
 d2e1a72fcca58-8415f0e43d6mr7637408b3a.2.1779538305135; Sat, 23 May 2026
 05:11:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522095401.72915-1-phucduc.bui@gmail.com> <20260522095401.72915-4-phucduc.bui@gmail.com>
 <CAGb2v67aXgg8BmrtVVBi+_n32OBcQnQgEUe3XdRp6Jj=aEr8fg@mail.gmail.com>
In-Reply-To: <CAGb2v67aXgg8BmrtVVBi+_n32OBcQnQgEUe3XdRp6Jj=aEr8fg@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 23 May 2026 19:11:33 +0700
X-Gm-Features: AVHnY4LgJLcY1WKuBCvFOXhD53DeqFEBktLQO4t2Ke2wkQ_NwOIr1on75a8Arx8
Message-ID: <CAABR9nEFGOX5GnQ9qpJY-T-92dA_kDcVS+qBz1ior590G_x6gw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence
To: wens@kernel.org
Cc: broonie@kernel.org, codekipper@gmail.com, jernej.skrabec@gmail.com, 
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, nichen@iscas.ac.cn, perex@perex.cz, 
	samuel@sholland.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen-yu,

Thanks for your feedback

On Sat, May 23, 2026 at 2:20=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
> > Enable the APB bus clock before the SPDIF module clock
> > during runtime resume, as register accesses depend on the
> > bus clock being enabled first.
>
> That does not even matter here. Access will only happen once the runtime
> PM callbacks return.
>

I understand your point that =E2=81=A0sun4i-spdif=E2=81=A0 doesn't immediat=
ely access
registers within the current =E2=81=A0runtime_resume=E2=81=A0 path, so the =
order might
not trigger a failure right now.

However, if we look at the peer driver for the same Sunxi SoC family,
=E2=81=A0sun4i-i2s.c=E2=81=A0:
Links:
https://elixir.bootlin.com/linux/v7.0-rc5/source/sound/soc/sunxi/sun4i-i2s.=
c#L1296
In =E2=81=A0sun4i_i2s_runtime_resume()=E2=81=A0, the sequence is strictly e=
nforced as:

1. Enable bus clock
2. Access and restore/sync I2S registers
3. Enable module clock

Since both IP blocks belong to the same Sunxi platform and share similar
bus/module clock relationships, shouldn't we maintain architectural
consistency across these drivers?

Enforcing the "bus clock before module clock" order keeps the dependency
ordering aligned with the actual hardware roles, where the bus clock is
required for register access while the module clock drives the functional
audio path.

Wouldn't keeping this order also make the runtime PM behavior more
consistent and easier to follow across the Sunxi audio drivers?

Best Regards,
Phuc
