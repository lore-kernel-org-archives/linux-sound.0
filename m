Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F5A254B03
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 03:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773027622; cv=pass; b=YSn37KQQHrYduiQyh5KanvM/hUo57nuVPdTELNfdbOsXuC34qHbXZWtVIPIPoqE6TfJAXSDLcsUTosBzeAypT4BVzSUltxX9oRmN7wn0ZAcNGURSABm9UBfjGhlzgYYqond7qmnB1kdF8w2v5rAVE8D0EsCxK817qbsdY6b2D+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773027622; c=relaxed/simple;
	bh=gbFjA4BtZaKaC8NQ9F4CXhw4uIQOwb1y7yKyLOTKDOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aolb5jkTp+WQbe9HCJn9oVSEEEYeTI6FdJ+6i6xMqDRiWQ4UyTsuKDgNPnQY/Tq0Czy3J6LV2AvVt6sICJgtReGLUoTwhHbpw4nMX0JFOL0cs46oDe/vwiX3sSQ/FBFTx7RrU7iY1HcbCwxX7mKdig+q19h3SWXsqXj+KbwAyX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4mmMNCy; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4mmMNCy"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-359866a1d02so6850282a91.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Mar 2026 20:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773027621; cv=none;
        d=google.com; s=arc-20240605;
        b=hJsWfi7vF1MdTG5BIVLZEvi7GlCanq9ydngRSn3sV1YCWuaz1vRW8RZn7Sf/HkKvqI
         uHaiVQe5QZ770EKE+/9g9Q7Te+xGo81Fb3EZptGXZQvSQ7sBHD58NhcA+9Kb/zpKSPHW
         YgiwyVvmxKjDPhb6CbOAQy4U1IVKAmZzTCk0mN5tKL1uJxFXuEXgdruu8UiyFBX5TX2J
         HxQ7AtzQfBL90utyUGeHCWPU1p9e5U6rsYH/rii1bgrBL0Ku2r7/7rkNU2pF6GDJUq9B
         6Vy6858UIVguZNmmztx6d3QvpmoT8Ya8YDCVUbd8es8BVhQwye4sCUIVRPemywwif1s1
         F2Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FKiYlaBVKzKkQ0fFD3dOHjGBjZMlXmQaDGVeIVxSCw8=;
        fh=1vwhPdhrcqP9oribSLzAKZQ0TjXHZm/xm8EWgp5OQts=;
        b=S7FrJSqubjAkClRRDvCT/8Dqq6RxZWoOclhmluNy7Q3hdZA+w70m/l42aNNLP78y0r
         JB4L2R3bsxJuFZ7Exhz0z+wE1bIsfVRcqCxsgGF/4n6ObcsAePptvWP5I54VWEr07Zcr
         oYRoycKZC/uuQ8ofFiggr6QIvs6jJputhUIiFgrlNSo9x96KFw47aRFtFehkdv4HLkBU
         fdLJyoucn2tzgzoLDjPzTXfhJOUOn6LR2b2o+cHlQqfUZk1/BmskftYmGEJz7vSp3laM
         B2Gw7Eq7yJEIyZIyfLJ62Vj2TSkbuaRPhqZ4jpVW5iLt5yAkoPGYTqB2tR9DE+EGskGc
         chDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773027621; x=1773632421; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKiYlaBVKzKkQ0fFD3dOHjGBjZMlXmQaDGVeIVxSCw8=;
        b=L4mmMNCy+rK0BA0UsA4ikQB0nppcdkZIufFUkuBqQsh1M0RwPSz25FYZ3fPuIUCLL7
         wSxmu8nezpGDiO+vesaVJC0G+pT9W+VnbnYE0csc+VpQq2ypBxWfsDOI7GJ0L3XW3WJV
         RaHhgz85J1x48TwTDdTGQoz+iFYrpAoAcVhsdnMlYOn3h1MVJFaeMCtwoUkuEt9Jrz7n
         Wf7G2nLUHa4peBNi9Vsw0JHSyccnHQh3i60Q4fXg8q7GW+wVS/bMcuU204MpA/K7lax1
         N86HNSCN0kx8lFYZ+PDKEje6TGXkeDXsDqCWpGPbk08ayY7ThZKK3xJ6OyEGuZIXhaEC
         wc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773027621; x=1773632421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FKiYlaBVKzKkQ0fFD3dOHjGBjZMlXmQaDGVeIVxSCw8=;
        b=ZBU+yNiOESunaiH3ZoCmZL+IfyMLxsYqE1X8sefLGZjmlneuaDq1zVXVIOfKp9dudT
         UO/idw/I/ZOWq06CRjOluA/ZTL/P+JjThCrqLwXobD9up8HIwxWEOMjbckv5kjiJCD49
         UhYgVXfAOp7vl4XUkrQb7oyRw3ANBRSBuraSsxKjDcE6eFc2tlP8rXC634CNkow5Gu4j
         z2bkB3e8PH2HIrMW5jpsYXsXuoyR6vV9qHyv/v9gR+PJdEu+oSmMr3sKBsxzydyLXhWO
         J+veqSVYfkCLLC8DOenxqATxWOKppmcT89msKTk6xY6zzMhjRdgK9QkBKKWAcN2FJzzE
         snZw==
X-Forwarded-Encrypted: i=1; AJvYcCUiofsEuLWxk1/8b7NpMtUY7QDQ5DZATXVk6zif/+AWEnanFmNw6X4yK2fKFchUXCUAnhycgDazdk9W/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9/TQdDM3ta+N/WAWIA5gCVjoyLyQkoqHZu/3gb4VG3EauW5g0
	jYuPMXQleGLFpB5NaFOMdD02PYXo7vacvbPsHoHHmmPDmOHz/LjZ/IvsrJeaw+WEMqGM+QTsOpo
	OaLzgGortpl1ftnlqo1dPiGNZkJhIqyE=
X-Gm-Gg: ATEYQzyIW13qlhlZdNdJIoMIE0ADseWqhGrQCJlp5hydLP/wSCq8Ohy3cCULxjeiMK/
	Zwqx06GHfst+hKLGpGgG1Lxx/lGofng7bgiKd61f+siEFwELNz8Bed+pWy3et5NyHuTfU4Yb9Ys
	x+Vk7Ibwp4NAfTMmLMuFOPF6e83o2ANaHVQLuPkS9H2VO0AQatqjba0caqpLwkkJquvAk/oUXmE
	vj9wBYCEThbbRKXpfAw4CGFMR7QpttPUgHaOn13TO87gp/V5UxsrT3GrudBaBnEtOQDTsV+KKDZ
	wCtkIIQ=
X-Received: by 2002:a17:90b:3f46:b0:354:c602:a573 with SMTP id
 98e67ed59e1d1-359be31e12amr7562851a91.27.1773027620836; Sun, 08 Mar 2026
 20:40:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306093949.1647452-1-shengjiu.wang@nxp.com>
 <20260306093949.1647452-2-shengjiu.wang@nxp.com> <0b110f10-dcc0-4573-803c-4dcf21643c3b@sirena.org.uk>
In-Reply-To: <0b110f10-dcc0-4573-803c-4dcf21643c3b@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 9 Mar 2026 11:40:06 +0800
X-Gm-Features: AaiRm52wW7uO2soGEpfwj9NXlS5UrI1EZUcVw7BAu75E0A6zzAyAyjbuUGgZVeU
Message-ID: <CAA+D8APr18xrX2ftRH_evVby5n1VQ1MSzqAref2bA9GnJUveeQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] ASoC: fsl_utils: Add snd_kcontrol functions for
 specific cases
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 6, 2026 at 8:04=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Fri, Mar 06, 2026 at 05:39:47PM +0800, Shengjiu Wang wrote:
> > There are some registers which are volatile, at pm runtime suspend stat=
e,
> > the regmap cache only is enabled, regmap will return -EBUSY when trying=
 to
> > access these registers.
>
> > +EXPORT_SYMBOL(fsl_asoc_get_xr_sx);
>
> Please make anything that exports ASoC or regmap functionality _GPL, the
> underlying APIs are _GPL.

Ok.  I will update to use  EXPORT_SYMBOL_GPL.
Thanks.

Best regards
Shengjiu Wang
