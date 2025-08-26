Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9554111CA9
	for <linux-sound@vger.kernel.org>; Tue, 26 Aug 2025 05:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756185410; cv=none; b=Ef3K6+eSilJSwjd35N1H/Is/DoSaJgfUbELXtyiQskanUNPFDOxyEBGoVfOfA2aiT4H44cM5kz/FnGvZkJNbwExVRTwqO9EowkzWi4dZ6gkU0RYx0awymceze6gnKzYukUT8m6ra7miTrCi9BdYWUV+4f9Ah7ZLYQFFKBvReAI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756185410; c=relaxed/simple;
	bh=3FhjRy2es/oOFZdHwyiS4hthTz3SWQunVt2WiiMiN4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BHTbgFDGN/DzUTa9B5KZOwtVtwbTZ0SqMkgeG6DZxGpYVcU4LF6okjNhk5JLjjgzlcWINlqrE5bvg04PtQPtpZYfeJQwkNgKTgdJiSOZ1aAZngMyV2MjGngzsSoAdlnch67yLc74HGpPEmeC4N5nc/pgh43Sy4pJq9elOOIUNj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JLLz1q1t; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JLLz1q1t"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-8921eb4befaso847551241.2
        for <linux-sound@vger.kernel.org>; Mon, 25 Aug 2025 22:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756185407; x=1756790207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1JIZerC9XYjkBh/CdzWClGmJGkTit8bSTofkNpBRWI=;
        b=JLLz1q1tSDgul57Z+7GHbbFTYRsUzrICfInd1EfbwkbWpwgDIlN4Wk/Z3mvM8Z1hXG
         dsiqljejZE6DGEg1oWKyHuFuuPIXNNrKkLSzDI3TzqxckdJBFgLOkelPyKxZ9MEinJdd
         tgsN9ETlY0BKxgw0SqqMlt62/tWLh0jZbWzTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756185407; x=1756790207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1JIZerC9XYjkBh/CdzWClGmJGkTit8bSTofkNpBRWI=;
        b=CZjmqcTP5Ga6BaO+eLaKSIbVbDn+L+Tb56MDKIeF8odn+al9dfq25yiAorHb8ZUfpW
         rPQFD7tzEJ7+BgJiaTUKPnHp28uEoBj85Y2JFRAPxo6lPzIaM7xt3DhvB4X2W6QEBeDF
         6jOj1iNqDlSVU2L/tlwCkJwwAp6T16/bLboKGePZkJBowfRT9NzWAd8/4cPX825quqvd
         ETVWsMIl2II3olVLlvyDBoILZC9lfTwLbsFN04ELffUBBEU6D/FISyp3R4t0Be3WjYR/
         G/0c7qWWoBFeDXRHu5QWc6RGfTsstBw9Woe0kCZa5PV9tKUkWom0boX79iVNKCGikw0j
         66BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDTYoekSaqZDHmy3+XixB7Tgv63tHxu4xR7lA5GzDxFisgFNjndR2dY5RtoQT5tpAfRAUowH1HAwUz1A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4BS2DPhCIDivZDIAIGV/4RGlcVzqsNYqGB84+oTDzQ2ir4W6K
	iNcvKrQZgGtR6mE/Sq4DO35dgJo6kRkz026VEi5FveNO8vmeqQwiZepwOodGu9xtRMWWZ0R/oBY
	XCBo=
X-Gm-Gg: ASbGncvSv1wPFaNDR0ocTcUlBRN6aXFQDMSFyle4RBbkMZBQO5tOdO4gOdsp3Ob4QDX
	gZLFxbdUfkix77KRV2igxPRKncE35OGXLnmROqMfcv/dmGq7va6wkUzqGD3wa7N92rq92N6ZImJ
	dkiKk6NcluxXWskkphUDMp43vkwTAMEtqhZos5g3sKF2cs/qhNEZJX2b3bGXPu3ubmujkVE4Mwz
	6NnbDmmBi2caelekmYGn1uNOILfrshbKvX58F9TNb3eE5w797rEC8Wk12MKdpWvWODh2yRqptIy
	hF43VZcf9Jrk605ZOdw98MVTAvCx29gEyFVDrl8PJ8uZmPoQB1iSxMdxv0xqEHslibbA9nEN6hr
	h/041hAz67UmYNVMtcEVrL5jwn4XFpni42NYifeHJVCgSotCr1z/uIvaK2ub1DjHCZdrU
X-Google-Smtp-Source: AGHT+IFcdGYxCQ2gYysfPDoseljYRHlSvkqeC/Yh6lAP/z3nogEvnsioWAdRpglVIDCjyfrS3eqqZw==
X-Received: by 2002:a05:6102:2ac6:b0:4f9:69a9:4ec4 with SMTP id ada2fe7eead31-51d0f2f13d4mr4709294137.26.1756185407226;
        Mon, 25 Aug 2025 22:16:47 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-541b1dbcffcsm880061e0c.4.2025.08.25.22.16.46
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 22:16:46 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-52252e9e907so445581137.0
        for <linux-sound@vger.kernel.org>; Mon, 25 Aug 2025 22:16:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWj4Hqz8to4qMma5omO+182V/EkmXiZaqSjsFKh2dm94g7vgUbXSsxX1GKKdlvtcA9BmMniDxZlCELWmw==@vger.kernel.org
X-Received: by 2002:a05:6102:2b84:b0:4e9:9281:85aa with SMTP id
 ada2fe7eead31-51d0cde292cmr5071231137.1.1756185406133; Mon, 25 Aug 2025
 22:16:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250825151111.3696404-1-wenst@chromium.org>
In-Reply-To: <20250825151111.3696404-1-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 26 Aug 2025 13:16:09 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhJpGD5ro+QiNTkDn90Nbw49jDQjVvwRT1XFQJbwA=z8A@mail.gmail.com>
X-Gm-Features: Ac12FXxPVcynR36QGxsqlVXBYl9-P7WGDtVc3IOfN03AppRsLVWt_DvyhTCcM3g
Message-ID: <CAC=S1nhJpGD5ro+QiNTkDn90Nbw49jDQjVvwRT1XFQJbwA=z8A@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: mediatek: common: Switch to for_each_available_child_of_node_scoped()
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 11:55=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> Using for_each_available_child_of_node_scoped() allows us to get rid of
> of_node_put() calls from early returns or breaks in the loop. It also
> fixes issues with missing of_node_put() calls.
>
> Switch to for_each_available_child_of_node_scoped() in parse_dai_link_inf=
o().
> Also drop the braces around if blocks now that the inner block is just
> one statement.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Dropped unused variable
> ---
>  .../mediatek/common/mtk-soundcard-driver.c    | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)

Reviewed-by: Fei Shao <fshao@chromium.org>
