Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627AB257455
	for <linux-sound@vger.kernel.org>; Tue, 29 Jul 2025 06:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753771056; cv=none; b=rhUGhmhOi7dXE1Vdp4pN2pDcaGihegBnFl6U7G0c6R+sRNeUQ7fuZ8up2PMz1l8HXseevesdJd0lGzFDu2K+jaGVKKY9pwK2In1SKb3DLdg7JwpvG+oPDAxuOZL9gxuyBwlAxLJkovuNBX1eCW7EXzJ15cZmmcJ8sqEmwxqJiBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753771056; c=relaxed/simple;
	bh=+en2KZk0Ak4P22RG3nat1iP/euaYfhY+2DXhR/dGRRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cvSNQGMOo81MC1+wI4RYbq0y93/n4LGCuNoh2TAB2yOV6Eze4cEYn2PMtux/HqFZYDdU/2DY8DJ2ADKWPiRSdixmKEf990ydVJwzhc5pDpLBKgJv/xG1zcNi0zRbFp2F1MD+GzSj6Pm+PSZExwakEn1Tb8WzEYINvWAz6bXuvng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cgsQpUae; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cgsQpUae"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553b5165cf5so6505918e87.0
        for <linux-sound@vger.kernel.org>; Mon, 28 Jul 2025 23:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753771052; x=1754375852; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdQC/K3LIKSscNRyk8T2PgRCFaUQc02f6qftAleHQdI=;
        b=cgsQpUaekWkmSVOdseWqRCVXFi+ffbsljaMZYm8Wd93Ojq5OKjs+mPthXo9jLfNhYq
         JT2anshYfhZ4jhYhVb5y41HbovuHBLGTpVJali2eQNx6JJ7iOxG62jPor6hty+tmRICE
         T+/xGuX+swyACCFT1M9UtnMhFgZbxRucEs4Bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753771052; x=1754375852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdQC/K3LIKSscNRyk8T2PgRCFaUQc02f6qftAleHQdI=;
        b=s2ojrqQ+OocvidEJerC7qiVSqMXxlYfeg3uFuAub0pXK/TzNC2InnhlItrncig21CO
         HVR/0hherxPsPFUo3Z6R1/QEzjIRH4ojxSJ6a1TslKqaLwlll1tYhcZzZckTuT/62EF0
         BZckFSo3gbKfWxHzAKZdqYamSCj9wgqnoiMsGrUQWHMsKaL2ylFFZdv/ot/A7IMrmx9N
         63y3fG9p3Ust1lNb/m5OcO5TDTwGP/g9EHcOS5ZyLqF0U0+Kp8W0BPoUYLj5oRbkVbVx
         mo7vqs84SNCGof7gnPdSb2wAO5ehNXsGRrKI6k94ze5Ac9XjtZTbZfqkUHEUgtABdw3u
         G8PA==
X-Forwarded-Encrypted: i=1; AJvYcCVUajxDpYNKswxAX4XIn9CQaYUrKjNQRUOooYW07lH6aJP2sFleNiHP/bG4T00gNY36Ls884hcCo6lb/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY/g/9U9w0e5PH7R2zA6U8Nf/giyop8ZYUv+yx11wRkC/tcglz
	u3kadMAlBnTOMMBBwDTjo9H6YrFTCkvaILQyAtNiCRsq4SR4P0cSjB3QrlWysWbGr0/8HV7ZQbj
	+CwxuTkUcCtL+AeFUM/OHNFLVlk7rIhCgB8V6Sxxn
X-Gm-Gg: ASbGncvoRe27Wsz4BWnh/bxPaWzWrr2atMyWyARcNXeZBFrVFik6C2YMgKyOjEyQazf
	3dHI7Fp+lKs5hRO3yg10z0u0lMAv2nNU1l5j283oMz0y3JOwekhCK5W+0xL51CAi9JVHgKOn6Qv
	GzHw6Gsa/q8ShjaW7T78VSkV3Z/N+x7arzdVEZ5PCN0BqYEeVJtt3a6HUhAncYUsrAIAucu/R7h
	uRrw4n7/KvnV0NiSDXTJ+0iKsKJI9BSvKK115xSm4l/
X-Google-Smtp-Source: AGHT+IEgvlc297To6fHbXdTZorsH91fq0QGaKclycxBL1IjMJRB888ehZGOrD1mGdyChv8MiWaDPZvyajrhgWyt/Rok=
X-Received: by 2002:a05:6512:3c84:b0:55b:57e8:16c4 with SMTP id
 2adb3069b0e04-55b5f4abb78mr3766968e87.30.1753771052463; Mon, 28 Jul 2025
 23:37:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723-mtk-hdmi-v1-1-4ff945eb6136@chromium.org>
In-Reply-To: <20250723-mtk-hdmi-v1-1-4ff945eb6136@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 29 Jul 2025 14:37:21 +0800
X-Gm-Features: Ac12FXzoxBPnyvKXGXlu3ix-9ADJidAZNN4VQPkrQrPMR3ZfP3Di7o5rHnp5ZrM
Message-ID: <CAGXv+5HCnAXoPJmh4ewSF4ay=qRVM_BK0w17yvjbx9efktXX_A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: Use SND_JACK_AVOUT for HDMI/DP jacks
To: Terry Cheong <htcheong@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Baili Deng <bailideng@google.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2025 at 5:44=E2=80=AFPM Terry Cheong <htcheong@chromium.org=
> wrote:
>
> The SND_JACK_AVOUT is a more specific jack type for HDMI and DisplayPort.
> Updatae the MediaTek drivers to use such jack type, allowing system to

       ^ typo

> determine the device type based on jack event.
>
> Signed-off-by: Terry Cheong <htcheong@chromium.org>

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
