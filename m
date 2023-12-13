Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="nZEls2QY"
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75E6BBE
	for <linux-sound@vger.kernel.org>; Tue, 12 Dec 2023 17:59:18 -0800 (PST)
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F0FA03F19A
	for <linux-sound@vger.kernel.org>; Wed, 13 Dec 2023 01:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702432756;
	bh=h+rBAEQoN+2M3shJlkzk0yJXe+dflPKE6126HwVLSm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=nZEls2QYuQ0ok3uMe/ia+vD8Rl6a24NlvOhhbklKokPVXCocqPJBga8oaJFSMR2Wh
	 GYs0gy4+oMkq1fpM4vpzGYdJ4gOqk8E0ifbDfN78DhfHo0mV9I1ij3czkdB4JLGkPm
	 3ICP0arYYpU51yoNaOX3nSoooHqsjhzyjoaXLgGJvf/qFpUcMY01OeexlunRbWOBeT
	 3JU1+hLJsN0BOp2ElYGRVl5qSKtQGWffnL9tw3ZtphELl9dXTS1+UFV9wujY7e5v7F
	 dW3NOHe4s8kBz7P39KyX+UiBNkNBlSgo14VJpnJ5cxrjAlLHjp1nRrsHbd8eK3KO3Q
	 vnF0mjTkOrWgQ==
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-591315be419so1699019eaf.1
        for <linux-sound@vger.kernel.org>; Tue, 12 Dec 2023 17:59:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702432756; x=1703037556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+rBAEQoN+2M3shJlkzk0yJXe+dflPKE6126HwVLSm4=;
        b=lWxJsb8zbP26zVsAJb+j0lvTPZOw+bApHjm3U2TXBCdbIvOaMDl1+u5itSmx8Xs4Op
         0KqszxnNv/tTP8M0Ke2F6dMGfzV9ncPQ49flNEKkQhrnS2vvEYV1yG2+hEjUW6IhSHY7
         OoJ+MH36w1aAHAnfRzOMekRn+sJPU3KizT5WsXeZ5OejxQV7sCz3zkhVgljEU4SWaNQ6
         RwyhZpJXqukxSh2MUzwMbjw48HrvO/rjaNy+XvfmLEwObHfOsdRCG9nd/C9+S1iXlOAd
         bUBKKz0mPchOagwCs1VtrVPAWaQR+iWt12SipwjHpeOY8OKEWngawOuhIVLmTmD7F2HP
         lgzQ==
X-Gm-Message-State: AOJu0YzLecpoTUBfGpJcUOxC0z7ehIrQVsPjA2MfhnOnOUz4iVUe5hXm
	RFYPBVLXqLSGQjnHXYB4Utr2S/Y8kZIgbQdzqd4VZ0kPEAndbIdV5z+IQ+0YlzZvXFSxuEhxNgU
	9FwJoOK17sV1VwKDBZs2RPUgQKAhdhnhLg110rqHHEPgiYDr7T+JqLyfM
X-Received: by 2002:a05:6358:27a3:b0:170:17eb:9c45 with SMTP id l35-20020a05635827a300b0017017eb9c45mr9970520rwb.38.1702432755821;
        Tue, 12 Dec 2023 17:59:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVGVIpFGhZ31+0Gtn2n90aTHGRkaW10Hnysuv1OCKv/STHZS+/AcTiVm1fNJrknr9f3/yYiMTrMkWwLoLVEq8=
X-Received: by 2002:a05:6358:27a3:b0:170:17eb:9c45 with SMTP id
 l35-20020a05635827a300b0017017eb9c45mr9970502rwb.38.1702432755499; Tue, 12
 Dec 2023 17:59:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212064533.233748-1-kai.heng.feng@canonical.com> <alpine.DEB.2.22.394.2312121441490.14041@eliteleevi.tm.intel.com>
In-Reply-To: <alpine.DEB.2.22.394.2312121441490.14041@eliteleevi.tm.intel.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Wed, 13 Dec 2023 09:59:03 +0800
Message-ID: <CAAd53p7BEanFM-3Z257WiEZpnuLP+bn2owx19z0s7Vx2KZ8H0w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: hdac_hda: Fix NULL pointer dereference when hda_pvt
 is not set
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 12, 2023 at 8:45=E2=80=AFPM Kai Vehmanen
<kai.vehmanen@linux.intel.com> wrote:
>
> Hi,
>
> On Tue, 12 Dec 2023, Kai-Heng Feng wrote:
>
> > Kernel splat can be found on boot:
> > [    7.906438] BUG: kernel NULL pointer dereference, address: 000000000=
0000078
> > [    7.906449] #PF: supervisor read access in kernel mode
> > [    7.906455] #PF: error_code(0x0000) - not-present page
> [...]
> > This is caused by attempting to dereference hda_pvt, so check if it's
> > NULL before using it.
> >
> > Fixes: a0575b4add21 ("ASoC: hdac_hda: Conditionally register dais for H=
DMI and Analog")
>
> can you try this fix already merged to Mark's tree (merged on 7th Dec):
>
> "ASoC: SOF: Intel: hda-codec: Delay the codec device registration"
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/=
?id=3Dce17aa4cf2db7d6b95a3f854ac52d0d49881dd49

Yes this commit fixes the issue. Thanks!

Kai-Heng

>
> Br, Kai
