Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41C619AA58;
	Mon, 20 Jan 2025 09:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737364071; cv=none; b=e9SjRlvE/6rEOklehwZMw/Fw9k9wxcoZ5Xsn99nOLVckhaX9Qx4ZyXNl10V02TCWOq6ULjLG8NgWZkMbZUmoytjqbh7iUlDuB3QmMerJh3EC2NnI5W0vDZo7nLlrSQCZlY9GcfIFK8TQwJ2GCvLlCyrEW7JH4SS0MjDClovVmlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737364071; c=relaxed/simple;
	bh=52/2fVV5SWoMvrc6ChA9+J/uYtj05qqjRJYzCTtckhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mJRMFezx0hJHHSOw6svL8apeSUnqaO3jtjcrcGt2jTIvm4t3ooiBS+BEFxttTXBKq31ObZPZwMl/klMSCMgvY6O5eBx8R+l8hchIb+2q8Q7V0hrElt+iXYyAGD9BLcKX6rKFMMVkr1upKs1U7/x6HSBEteCRzCg8pjMsDUReA3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwT+/nJB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwT+/nJB"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21a7ed0155cso65494235ad.3;
        Mon, 20 Jan 2025 01:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737364069; x=1737968869; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52/2fVV5SWoMvrc6ChA9+J/uYtj05qqjRJYzCTtckhQ=;
        b=CwT+/nJBoHdK4i+fq3mCwbEDC8rNYmwLJrfhGpxAa2h6dtTW1OZpF3AdNHHH76A+Hn
         I8DM0sjXDKaEGnBrMjuT+B1CaetR2UDjIlDK8C+JDjRY/6Qb/CiWn3/LRBvgui3QgyIx
         QQoKVZH1IroX18Nw3q8EbbkqA7xclqgLyc9tC+JlN+RBwAtomyXZjWTHJLEdWYMJtNBR
         /8EzUFmjsimSZ0OQUDtJBQ7KNuS48IBi8MU3LO81xe2hvEie/rJppQtJyoQWbddTzJfo
         YSzEZNYsVPjL0Yy4PJ5hS63W0fNlYXdQ4TkDtJVaLRl4GUfxzN7XR7dZh6lGQBFjgkWf
         1AWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737364069; x=1737968869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52/2fVV5SWoMvrc6ChA9+J/uYtj05qqjRJYzCTtckhQ=;
        b=IesDGHPJTfv6/rKLSZyLC+d3vqu2+T1lfOCb0i7uDtapBQz4fUkwZNaYIl2EMqc4S+
         0doHwVNfZlIGLo9boAEzXnGXKNS13ufhWDW4AynmsZy7BNT2BYjRJyZ3VFsZkdUfw2ys
         QskvQLIvXT71C4nAi+uC+5lP2wM6cLcQwZJTN2VQdBQRCvrdAYgo6G9Y9zrWsxzOoA6U
         Ih58+Z7X5/c1IHbyUUSYJ8XPIb2IRBT1q5bSc5SJIerhqu1J3U2HSLhBV1+IV9JCSm49
         MJQ9QxyKNQUdA//k0T5jx/gF8Jq+W36X3Iy2UsrhfPLPjITQ/ZXS1b4rU6KeLoqEHW8d
         mTAA==
X-Forwarded-Encrypted: i=1; AJvYcCV0Y6rzEuLBOL8xPhwiB/+IxAcxfK/KD9mKChbL3UOMIVlDJarEtJ/ztci0vhrx+/WBrl4GMWGRCdOeHYQ=@vger.kernel.org, AJvYcCVSGYkXqQV4zrvwJYCl2LsBB8DVdZI8OGCZj7OmDdFI2v610qKFQ8nYMveR+xLQwc4fsy0kEDV/O9vHLJo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXkHSsfT62h/gLiw1d83eeo6ANR3+OBdaej/QLwz8Zph8P8mhf
	uadj2aJOx4IgGtXwLVjNgnVrG8xxc8pwwZu5anw8XQig/bMHJFeqadJ7arHx1izDm06fqYY10Ut
	IAUk0wUvgkdpx+eS2a1D5VUy+rus=
X-Gm-Gg: ASbGnctsEOlhiPch851cIMcWRrplV6sj7whpHG82fCuX6SdX0EmLNt/56wj2FDuAjcT
	A4Zrv8Ou+SVpJjhiDK39IdV0DzRfWCifKdS7qqBL7S98FhEY=
X-Google-Smtp-Source: AGHT+IHe5MIHadjWcYey/5+/xFnMBA4DeGGjtKbmZfnOT1Ve8uaz5/90NJmfB2awua7DXFiy9OPz4KEkZJ5o8UsnGwg=
X-Received: by 2002:a17:902:d582:b0:216:2426:767b with SMTP id
 d9443c01a7336-21c352dde25mr203745355ad.10.1737364068992; Mon, 20 Jan 2025
 01:07:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120081938.2501554-1-shengjiu.wang@nxp.com> <20250120081938.2501554-2-shengjiu.wang@nxp.com>
In-Reply-To: <20250120081938.2501554-2-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 20 Jan 2025 11:09:14 +0200
X-Gm-Features: AbW1kvZCx3vGJxz_1PUUiV114VWPotPp0TBoiFnJwKBv6RQYYbVD_JtK02uPgWc
Message-ID: <CAEnQRZAc95=eTPyn-9=yUwnOUkQ5HHypbLPE6vYe=zjk-T6JNQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: fsl_asrc_m2m: only handle pairs for m2m in the suspend
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 10:20=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
>
> ASRC memory to memory cases and memory to peripheral cases are
> sharing the same pair pools, the pairs got for m2m suspend
> function may be used for memory to peripheral, which is handled
> memory to peripheral driver and can't be handled in
> memory to memory suspend function.
>
> Use the "pair->dma_buffer" as a flag for memory to memory case,
> when it is allocated, handle the suspend operation for the related
> pairs.
>
> Fixes: 24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>


Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
