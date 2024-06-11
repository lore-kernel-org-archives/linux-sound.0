Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C5417332F
	for <linux-sound@vger.kernel.org>; Tue, 11 Jun 2024 08:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718092971; cv=none; b=KxatojgfMqe5Qrafq4RXNLmuB3dBpWwe0UtzJza2JwbPVwkwYLQ1hyYLAFaB3conOEZUKeEy2WaGs3VBxzsylYnpQTJjbf3IcHHMBjfIv5MFf+rIiF30QOyCq6srQdQKS3FdkQT85Wa6TVOPaK/4HafIveFQuvPaxOPHf/XMIDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718092971; c=relaxed/simple;
	bh=lWc2nHEexhFavmycz68aTW7hPDVLvdwoBeRsopX57cM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WDmdViMcOjxvu4x4KqPX9z9TAAyFoF+7KJ0VBzNiMnHDVK8MpNFeMBT1GEBnxRAlJgaYfFf/6Obo129yUsLgAX0eHLqHLnuwLrsmtjBIgvHKx4LvaQ8bQEZV1NvHq9FwdEfo50d1+Ul0ndPZ0bOV4RPPcp86o+LyxDw9UEhzSXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TZ8fVTbd; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TZ8fVTbd"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a6efae34c83so341086966b.0
        for <linux-sound@vger.kernel.org>; Tue, 11 Jun 2024 01:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718092968; x=1718697768; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=or+4NmGXTUe0vxNapTWhccRz5KiVpXdBi26BBe10Eio=;
        b=TZ8fVTbdG9WpjzND1NELyj7dDXFLvRL9Srx8fWNBdpr+sBINneieSGhP1Vp4SilxOH
         RBIYdWw+1DxXjcAlXkXcGoWjR5yyyUQTPYcKv/rbvnS6sGYGGeR6wf8NPgwDFMY4h9/s
         8E9MhG+yvC4zqcdlKQ0bfdxZUd/MVmkHQnDJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718092968; x=1718697768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=or+4NmGXTUe0vxNapTWhccRz5KiVpXdBi26BBe10Eio=;
        b=wqS3jFiqmLBozWPTB6xxUHpfTdavTofe2HifjRNIG+hSr/uNyBfByVEWPH+aCUs93B
         S6g3zfCPu0e93NYBfzzvQ0Ti4IhfqfICWzo2xIQosHwTF4mhAKmPX/T6QhGz1MUJPg8C
         7r5fAGTqsNni+ck5X241hnLCqM/FU4Fc6pTSp3oPMzylTkFJLFXtGTMAQvqdlC+yoCc9
         ORq5rY1bQX4rJYaAYq6goGzpT9KwHQU9dRLdPNXvYt2Pi88QcIqGZYZuIiHlDeQ45YvO
         8JftqNIYsiuxMlIKHSTpvmz0gKogRPiTd3NPYS6/M8womjmV5mwCTTmlrMwsN1h7qi/A
         A6sw==
X-Forwarded-Encrypted: i=1; AJvYcCUpO9GYYUdFm5r0BW1zjJDLuwCul1349mQbYBgN9/gq4lIGLJbzCo4SwuaCM4/sOggaTSIz6FsrwlOLnTJlyn5qmbFE2ckUyec3nSo=
X-Gm-Message-State: AOJu0YziPBLq7eChHg2lvSiO67a9MUefq8Xunrky0sWeAj1elKc8M5Ds
	GtITJweHhHbGyVWx5IB68Enj7PrjyCuZD8PQEMa2TGBgXd6p0ORjXs1cY/aWgaB6TLzIOr5XEbM
	=
X-Google-Smtp-Source: AGHT+IFcAqkQZ02JkLj8uFrHdAtFfJ+zoxYqaChGfT3xghksh6HFPxqvHOVa+IT08lvmwWnM69MrFg==
X-Received: by 2002:a17:906:31cb:b0:a6e:f3d7:4112 with SMTP id a640c23a62f3a-a6ef3f5df57mr565197966b.64.1718092966174;
        Tue, 11 Jun 2024 01:02:46 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57c69d06729sm5991854a12.56.2024.06.11.01.02.45
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 01:02:45 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a6efae34c83so341081566b.0
        for <linux-sound@vger.kernel.org>; Tue, 11 Jun 2024 01:02:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVzyHwsIcf7+seJUcFbH3/GOz1AASV1KuB5Vz4HvCtHepVBKwM+u8vGnIgImJyxsX2NRoWcO/XHJrQyahQJrjp1arQ5gvzRQnYvS8s=
X-Received: by 2002:a17:906:39ca:b0:a6f:309d:ec23 with SMTP id
 a640c23a62f3a-a6f309df3f9mr177781666b.72.1718092965211; Tue, 11 Jun 2024
 01:02:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240531-da7219-v1-1-ac3343f3ae6a@chromium.org> <171762153256.557520.12011428649748199502.b4-ty@kernel.org>
In-Reply-To: <171762153256.557520.12011428649748199502.b4-ty@kernel.org>
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 11 Jun 2024 16:02:08 +0800
X-Gmail-Original-Message-ID: <CAHc4DNJ3q=a8Wts_q12=R34eMbMq+d4PSEFe7YR+DDs=C_Og9g@mail.gmail.com>
Message-ID: <CAHc4DNJ3q=a8Wts_q12=R34eMbMq+d4PSEFe7YR+DDs=C_Og9g@mail.gmail.com>
Subject: Re: [PATCH RFT] ASoC: mediatek: mt8183-da7219-max98357: Fix kcontrol
 name collision
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alper Nebi Yasak <alpernebiyasak@gmail.com>, Hsin-Te Yuan <yuanhsinte@chromium.org>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 5:05=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Fri, 31 May 2024 08:37:54 +0000, Hsin-Te Yuan wrote:
> > Since "Headphone Switch" kcontrol name has already been used by da7219,
> > rename the control name from "Headphone" to "Headphones" to prevent the
> > colision. Also, this change makes kcontrol name align with the one in
> > mt8186-mt6366-da7219-max98357.c.
> >
> >
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-=
next
>
> Thanks!
>
> [1/1] ASoC: mediatek: mt8183-da7219-max98357: Fix kcontrol name collision
>       commit: 97d8613679eb53bd0c07d0fbd3d8471e46ba46c1
>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>
> Thanks,
> Mark
>

Hi Mark,

I accidentally added a Change-Id field in the commit message. Can you
help remove it before sending it to Linus?

Thanks,
Hsin-Te
