Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA102D9497
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 13:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759842230; cv=none; b=DM7UvVB1fnJGtG+969oFx5+xG/KwWJyBKvgpJokZ6EDBx2ohItCZ63LtdRkdDHAeBGHKiZPxJL0fJQpymXZFqcGgcen6cQXI1sGAaINFQ7ht35F4p0iIXdsv0a6WnbfPc+FkIhKt3BiAQTcUZDyigh5gyEb+1CuBYwOj+ZGYaYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759842230; c=relaxed/simple;
	bh=mT8VWekIFVcoXu/yqvLJuwobiSiZiiPaFFIOk5E5vVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sdcTRQrXlDV0lJa+MWtR+nuDJX7T6iSDKyQvwRfJfVQyNykyGXT6mLzOUSWx3Dy+g2A412u5qth6FRpTbE8ScRys8KAdYjy6ILu+ESG+WhM6isBd+0tnfzs+cQmTmljSJUphbgYOhELAQut+/WZAU0EewC6NKmNS15gyz4LvqxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c5XRvevG; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5XRvevG"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-646f75551e7so2461890eaf.0
        for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 06:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759842228; x=1760447028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISbSv/si7GhQxuZJ0+Mx59HypLlRtEwXTQlx2jMvq2o=;
        b=c5XRvevGt9uqwuRvPaqnBy2HvtboMJ1fF1KdreKNrlfTO6Km/oQ9nnOPZ4RKRwoCx3
         jAl94VAJidUNLXQshh7m6LI2N9ztpZ/0jJLU9lIsXwjzHnByW3UnrqMklfxXY7/zBu4h
         NdFtjapsc0xP9CfSXTBTceiDPq0x2/XOHEsW76aecs0A5vWtwvZVDEnZzmI6YqRO9e17
         aHolys5j3cdiG7FO5RdgY4cXLk8orCboOg2tU/C3OqZoDkR7arLY54PtnyHXjyE7SgnQ
         fcAA0olJ96PwYrGQ+7p6POj2aGH0zycjuLsAJqP2Yrdt8CpvmFFUnEzHhE3VQSfHM7o3
         JAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759842228; x=1760447028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISbSv/si7GhQxuZJ0+Mx59HypLlRtEwXTQlx2jMvq2o=;
        b=RvR0k3dDMjap05cRFD4343OoaFVr9sLKhUp9MVyCeLcV0qSpkRU8LYv8ySObq0hNYQ
         lXE72PUrXIhW0zu/ipsxec+N35OuU2ST73avwgbxUx7gV0bZUTzbFEoZhNH7tSKxtRKS
         lwQi9at8UIKXelytOvaueeV3brBazjIT793Q6WXXrjHhqFz+vTf0wmAxLsZ+yzGMqQXa
         O+adFq2vWAF38qv7T/T/7zoFkCqSl8Chq/gakOPY10Ke+uWBXWCTCQi+UBuxTvkGdQhH
         7nkgjlQhMw2sdrLezRSZ7Dm7QXYlt3YsJ8sKkOifgCLPMTT7wTcGa5OUR+NmaQ6FI+Xd
         w4Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXImqQWmgj+UBo3cVTr30jJpGVlr8QG/ZUaq/3JOtTNe2BPbTJJuABy4H/TkcKKoZgk+emRL8WQcLKZGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqh35trRmudsDxgB9luBd74LcQ7+aySzSJxZUGh+jM9J6+Ff5j
	i6cEgNLktKhiiqKmRi0+FGJKV+xkYPLt5+gLdkWAbQlU9aY+wL9MwlMoNYZW8Ua2eHT1WQ+crMn
	+1ndjDOW3s7FfJpWE+pahOkmeafavttc=
X-Gm-Gg: ASbGnctBmBhvJ8vKVSkNALi7WYKI83oUuu5EkxQo4uFTtZ59kGzdOA48Jy6wffnypQx
	ZJyT4wSr8mGJeEs8xaJMHJDfOg5+iWD9ySE4OVYRGD0CcS4E9z1jHxsKECLP28E2mUN1Yf/NW5O
	M+7UAuqGSjk8auiUJcivDLpmOs2elz3tTFoIzB73QSF6iV+E8spOqwkCJUSia3lZT0oU0Tr10fT
	lVRwU0tXdlsYbnUNX6YHpSQuMJtqz0=
X-Google-Smtp-Source: AGHT+IHMjaDzMJ+goOCNybWe+pEdxaMgHR3ggTEddsjk0aVtjGIjb5OoyVz2H4ioVsnpFH5rC2pWnOkHn8nS7zeZHDw=
X-Received: by 2002:a05:6820:612:b0:641:4a5d:d84d with SMTP id
 006d021491bc7-64e6014cc46mr7322676eaf.0.1759842228043; Tue, 07 Oct 2025
 06:03:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251003091304.3686-1-briansune@gmail.com> <20251007113305.1337-1-briansune@gmail.com>
 <5a71fdac-f6cf-4557-9bc8-d416a033263e@sirena.org.uk> <CAN7C2SCHirxurUA0n2VZKEEiYCt-NUKgspGFfZLNurHhACZkBQ@mail.gmail.com>
 <3266559a-8403-4a26-bbd9-c54e27fc59f8@sirena.org.uk> <CAN7C2SC96jZYYGP=DFrSKgtEfxy+MYpM7=-iW8YKhDG81ufw+Q@mail.gmail.com>
 <6963ab04-d0d2-42ee-9fc3-19f9c298849b@sirena.org.uk>
In-Reply-To: <6963ab04-d0d2-42ee-9fc3-19f9c298849b@sirena.org.uk>
From: Sune Brian <briansune@gmail.com>
Date: Tue, 7 Oct 2025 21:03:37 +0800
X-Gm-Features: AS18NWCJV2ZpDfSRZMrocjBbOFe7dIZ3vWKMlbjnLq4Xm4UFSDLeHAKB2STTj5k
Message-ID: <CAN7C2SBAPMG1-0huf+3NcUAULZmHTM4idcytShNDs-iiseZm5g@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: wm8978: add missing BCLK divider setup
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Understood, so in this situation.
What is the proper way to fix it?
Leave it as such or create a new thread?

Thank you

Mark Brown <broonie@kernel.org> =E6=96=BC 2025=E5=B9=B410=E6=9C=887=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=888:10=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Oct 07, 2025 at 07:56:31PM +0800, Sune Brian wrote:
> > Mark Brown <broonie@kernel.org> =E6=96=BC 2025=E5=B9=B410=E6=9C=887=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=887:52=E5=AF=AB=E9=81=93=EF=BC=9A
>
> > > > > Please don't send new patches in reply to old patches or serieses=
, this
> > > > > makes it harder for both people and tools to understand what is g=
oing
> > > > > on - it can bury things in mailboxes and make it difficult to kee=
p track
> > > > > of what current patches are, both for the new patches and the old=
 ones.
>
> > > The title is fine, the above is about sending the patch as a reply.
>
> > Got it, when title amended version is sent, need no reply with
> > previous revision ID.
>
> No.  You sent the new version as a reply to the prior verison which
> nearly got it binned.  You should send new versions as new threads, not
> as replies to other serieses.
