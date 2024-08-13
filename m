Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82D717B427
	for <linux-sound@vger.kernel.org>; Tue, 13 Aug 2024 09:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723539838; cv=none; b=ch/82Fh7uCPqFgicvMCtuxWG3bCt7rBV8B7LVc0vfi+63zuzaVYCozpbWjzL5cTRocCsRvOsApOwPEZamqPBIV0l0Bh9i18cLg8BquzQhrFEv+ER2dt0UMCkVB9v80plXf1ofjKQNXTWiUdOOwttGd5gdpm/MdHY1LX0pNloIos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723539838; c=relaxed/simple;
	bh=Ve4jbSU7S9ExZbxJjtrrBtClvd5I5lhR/E8IhWEXAFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qX+79NQOIkIMJHeUVo+929zrxr51VmZ2CAsRpcZofiVnaoy+nUH7obky64quaSxKFEHleRqraEH4+9Men6sSdZSj4Tpikc9h/H+a2DGfgdB3u5ThhPw6UZdn1+q4WtWBtBQt9j8ansYFDRmBWOEAhFTNL0b/O9YOIk3BOy6NgrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ONGFam6b; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ONGFam6b"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f01e9f53e3so82070931fa.1
        for <linux-sound@vger.kernel.org>; Tue, 13 Aug 2024 02:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723539834; x=1724144634; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ve4jbSU7S9ExZbxJjtrrBtClvd5I5lhR/E8IhWEXAFc=;
        b=ONGFam6bA0iGA9MQv5hJOKYPZaL7w8lImm/rEfITGq291/kZhx4qFQnDwCWRJLuQQt
         1eVN3RHKeEQfGAoZe2SSeVsFYcFaJFJXyyOXCAYC/U8GPEsKSu9h0Pzo0Yl+HfAGJGUk
         wvf81LRQ8vP5o36JImmBcvGphC7nXgn2PAmoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723539834; x=1724144634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ve4jbSU7S9ExZbxJjtrrBtClvd5I5lhR/E8IhWEXAFc=;
        b=djV1RJtZGOfpZzvx+iGqQK6WYqziTuFNcjECW4uLGV+7kFQco4xowDkfUAwnD/JiVY
         kkGUVtvj+E9FZqKs+DDNUswzOXy8CFPI1swkl7XTK8mHmTafWDsT59dmU1K/XCckFTLg
         BHPE5K5LsJrm2eFVV7j8jLVOUX8y7MjTGxi6h/ctewsZ5s+LaPRNfrmnAl3emUE9GG7h
         k1jRzgCRFsBXTcKsS4faGYIyk0WohuLTAb0aABOL3vzJVxsiBjlYckcZGgemCyKLocMh
         q6UQlxY1FNs3h8+9UhiEPpBAsGCi6MSjoDGoPtbS3Usqed9H3sm8TWTm4VGb3RqIelYA
         GCDw==
X-Forwarded-Encrypted: i=1; AJvYcCXkrXyNVBeptmEjO9bghKWIgW2M7aZIFurHvbvaJZY38V5EsKIVlu2oe9qlu1a0EZ1aOUc6Z5n+lCKoE4VMy+cHwzZERC/0uJCzTYI=
X-Gm-Message-State: AOJu0YzWvosfKpiJLs4SLWB9smvd97Wv8ky3kRk7/10fpp5ICgFMcaMv
	1JtwmlFcHHacDloatFXtGFvIbf1sgONCgBHCKz+zAsS/rr3PrMVW0N5tlsuLdf69HBq2sy/KtSd
	as/zGNLBd3IBbZruLjlzy4dSp/2ujDlixOoy2
X-Google-Smtp-Source: AGHT+IG7NaoKLkQNmaW+Q8ybfg+2Fkm3g2gdZmqPP65jKw5bs2Y5MuNgZOgxthLiif5iORngSqZhzj93hj3oIkVu1A0=
X-Received: by 2002:a2e:3c14:0:b0:2f0:27da:6864 with SMTP id
 38308e7fff4ca-2f2b7150009mr22309211fa.17.1723539833287; Tue, 13 Aug 2024
 02:03:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240809135627.544429-1-jakiela@google.com>
In-Reply-To: <20240809135627.544429-1-jakiela@google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 13 Aug 2024 17:03:42 +0800
Message-ID: <CAGXv+5FpYxyANqp+uMoJP4my7e_yjSS7eFOodG-UuGG6eHCj-A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: mediatek: Add missing board compatible
To: =?UTF-8?Q?Albert_Jakie=C5=82a?= <jakiela@google.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Trevor Wu <trevor.wu@mediatek.com>, 
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 9:57=E2=80=AFPM Albert Jakie=C5=82a <jakiela@google.=
com> wrote:
>
> Add Google Dojo compatible.
>
> Signed-off-by: Albert Jakie=C5=82a <jakiela@google.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
