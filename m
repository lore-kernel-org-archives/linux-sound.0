Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2574241CBA
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 05:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749533363; cv=none; b=Q1GnVapOOOSSIKrcGdS2CV/P1Tb+NInaLHaPp5nKWIjXx2+l3QlS7fzuu6qDIZYvnAleA19RSLCxHie9gJpoEp1nxev1j0k6XwEjCrz9Qsllc7KKR5J9Cud/piIC7YkSkwp9ApyWUTr4uXyE6Oeeog1wVmOwj45sBmzODXyfC70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749533363; c=relaxed/simple;
	bh=dbQoRbu8bw3SwlzKgna/42qSxwpbUze97q6wZR6+/Fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=abBccwaqMnN/t34TDgDMVE2TC4QErnUNbRmztQ8oko1pupSXMVgftV3dNS0yFmn7VMxf+5Wr2nRHHiAJfrTnR+OXgJrb/8rtmFDdWyTiday+2KzQvdJNq5DCBSOHP8tp55h4xvS/dV+GMnck7XLo2qCAOnDR/yZ0w3uZAQ19tNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5535e35b059so4802748e87.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Jun 2025 22:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749533359; x=1750138159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dbQoRbu8bw3SwlzKgna/42qSxwpbUze97q6wZR6+/Fk=;
        b=quwBiPxMtVX09/pbALUF270OvcD8xQ57gdJ2fp3eRfJTADLBfMW6bP5Kf4CTaQpZN0
         gZB7gmatKj1UrqPhuTpW8bgFT+zie6tZtplYrJuI/OS8ZeKrb8RdyNRZ1p18L5cLKfHq
         MUz116F9j+jF3LbNUx5/R+zD62su+Rw0XKDLj22JqQxiDrgZZortW10xLRWPjx6IYtCC
         hQKAvPA2zF4V0ZdaN8YxlINmvfarFAxgUIQW29J5k0eHO0ugEdQasd7ca5NCbZldpBw/
         ToFPZy70gaRcdkWup1IDQ3Uzc0izjoa5fgveS2l4Hm0muIxgffhpvKd8Dyeo1bZHnPnL
         c95Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjcH2t0nD/+r2Kr0Fz9Ox3qYzNA6OHZk4YCU7IeRqw/2t/cgZruoxyO3NLKEL8ievVDOqh1F7OA33MMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy43K/Vi+FMa0tM9yBemMzFD10JhJjBiHh7bOPKoFD6j2H9Rit3
	IhYQtULOeji/LuY65PfRqV2viE8tisyZNg98ZleXZDd8M5xrjqpx+hMx/Dl8aQhf08M=
X-Gm-Gg: ASbGncvoucouko2vcbuTAfi27FvLA1VVBc0VPZ2jH9nxmopk6N+eruG68weA5KTc+uh
	+V05qa+Z36DalaHKR9b1UvK+7UJxO+1EuecsK0cuGkqJBsm4tSud0+CCMFJF6nwgvG1HeF/31Uc
	NwtTNBhcqj2NsfDnvNF4+MHHDWMyfjctzs8dtpWGqF+2wf77EusvnK6tCIWlbXpmLGMdKw3cb0U
	lqCzAVjSFyKZori6jskkwZpqu4qpd9YIIUcRnYk4/u9VLyUUjL4gST3+71dxjvCHKQG8ncXRM8Q
	mI+wfQ7FYBDt+c8UWRrHqNiJR9tgIRy+iabosRPMJqbJXqFD33Q9rjtK6jLDszD2AOinMfu3u0o
	yRODHykMmfhEihcAjJi4=
X-Google-Smtp-Source: AGHT+IEaht127BPxyV/WomxcWdSwMkqTzd3GXMAu/TNBdS7b3Q3TYPDChXGa39smfK0QyAGZQRG0vQ==
X-Received: by 2002:a05:6512:3e1f:b0:550:e692:611b with SMTP id 2adb3069b0e04-5539319f287mr704755e87.16.1749533358513;
        Mon, 09 Jun 2025 22:29:18 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d77aesm1406868e87.88.2025.06.09.22.29.18
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 22:29:18 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32a64f8480eso58140541fa.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Jun 2025 22:29:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+WUWNbbgL9GzoTjsR7+XGiPP+Zl6xVOmoDbC4qBCTgY2ewLaKn3caxA/vNpGNt4tkz+s4YjMp41cllA==@vger.kernel.org
X-Received: by 2002:a2e:a547:0:b0:329:1550:1446 with SMTP id
 38308e7fff4ca-32b12c5e810mr5685311fa.0.1749533358234; Mon, 09 Jun 2025
 22:29:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com> <87ikl46xar.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ikl46xar.wl-kuninori.morimoto.gx@renesas.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 10 Jun 2025 13:29:06 +0800
X-Gmail-Original-Message-ID: <CAGb2v64jmnFYqzEBqpsoi1Evq4V9-CYubkz7Y4=xXy6C5vtOQQ@mail.gmail.com>
X-Gm-Features: AX0GCFuyzK_pfgFmr1lYzWlrdGmWd3rkJt0gGDBDq03REYhwpKJghf2ewZJCPdc
Message-ID: <CAGb2v64jmnFYqzEBqpsoi1Evq4V9-CYubkz7Y4=xXy6C5vtOQQ@mail.gmail.com>
Subject: Re: [PATCH 20/37] ASoC: sunxi: Standardize ASoC menu
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(Dropped non-maintainers from CC list)

On Tue, Jun 10, 2025 at 12:22=E2=80=AFPM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> Current Kconfig menu at [ALSA for SoC audio support] has no rules.
> So, some venders are using menu style, some venders are listed each drive=
rs
> on top page, etc. It is difficult to find target vender and/or drivers
> because it is very random.
>
> Let's standardize ASoC menu
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
