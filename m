Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A6713340F
	for <linux-sound@vger.kernel.org>; Wed, 24 Jan 2024 22:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706135247; cv=none; b=mY/HQF1PJ0vuNmyi3k/txs/ugH84+GQuqWYctGjYovuYGb2hPMiMJw/CGZEAaqI8ZMpc/3m+6GNg5bsfYmsx//zOftI+xaDXe4GXfV036lDgG9VeB8JUDO+XbY8Evvy0MMxTNWs7v4DcCA5YliT+YZ3rUZYQd72VJ08cNs2fTk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706135247; c=relaxed/simple;
	bh=89crywnmr1xs48BOI0V+iC4WXYruG9vOY9OOlKZaWIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=afUPJ61pcZEK2IdWKYocPvuSiHqAPzpmgflCSn/lYbTZ2rSGLbtc4bIxfTIdHjejp11Hef2DRFb58tCH6b6hS5p7eQ/GOWxmPFPcfenlvWkIENBsqm+C5IV+kMs8DXIBpVo4uen8wMZjry8b3IMzU+seEBnjqycBqNnjUF9NNBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kaCx8wCj; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kaCx8wCj"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a313b51cf1fso26204866b.0
        for <linux-sound@vger.kernel.org>; Wed, 24 Jan 2024 14:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706135243; x=1706740043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89crywnmr1xs48BOI0V+iC4WXYruG9vOY9OOlKZaWIs=;
        b=kaCx8wCj+rbMiABeKGjV5YOcTN9RVBqVvxLvyAjT+1lutuDWYFU3u/AWlAiV+vv4GM
         XvGR+iCPBgS6Q4zQfesxYZzky899QxW5jShqQku88LOE/3tDWf7Z7KD5Xp1cUXIY7820
         erPoQxFPGvMZXY7i322fVHFW93jNrJ0rvoi7/IYh1oa+/bk8ORhiqpV46C+O0hu2sKdm
         zckhjyiIimfKZS61NZK9BpOhW09RxU8lDVT9LhjiA0g1GbeTWoFsoi+p7VpcX7y61eeI
         tcDNkgM7JWzOvvYrAFxxTuWlxU1AU3LdAuIT9+Kp9DLpCHwuSeJgx+9hmY6rDku5nClX
         4Y3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706135243; x=1706740043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89crywnmr1xs48BOI0V+iC4WXYruG9vOY9OOlKZaWIs=;
        b=Svhquak0hkA9NEXSMiQ3McFE4CcYtPozLorU4lA8ly8ORBvAQVGO7BonJw8SFu9Ii5
         OWs8csByk8JcRo2Gmq/tuOjIS9fgzDuG5QEXodMbzGo4E6MhJHzCa+RV3CLelszyoChb
         2ez8yRmXegRAIrMy7Z9X2lCl00UcVdU25Zdtk61u02Dd1TrV7rrhFpOYauKUXYOPxllL
         EALFWtlSVnYo2MSbg7QXsCD3mNp/Sci/ylscaAgZUhDxe4gYKdrarxFQ10AvjinzGsry
         UmCzE/sdkh66UlWA8eEg695q8qYgrqL7J71QVrTpUxDJ+YAI11wuxwEmRVNNyg0oB0eu
         nEdQ==
X-Gm-Message-State: AOJu0Yx/0jco1YAhYz4zG6A8btmP4folkzbVi7ViWHPAKby6b9krMjUI
	O5x0D3ZTbElC4OEN3DpB1cKOTSbjEZmJHkWqr+jTyaINYbVuzMec3oyJoPm7ynyACA7lTgKzwlY
	10j2zaPIm6THc6QbSb9NNhAEgXag=
X-Google-Smtp-Source: AGHT+IEKFP+9CdEJ6ZlaragyzLH1oN6tQOkJ1h/InCTD5c/jvcIyPfEiQKx84pxSzv6bhBSGH9GJDx9T65nEbYAPVnQ=
X-Received: by 2002:a17:906:c44:b0:a23:62fd:e2f6 with SMTP id
 t4-20020a1709060c4400b00a2362fde2f6mr33964ejf.30.1706135243371; Wed, 24 Jan
 2024 14:27:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com> <20240124165558.1876407-3-ckeepax@opensource.cirrus.com>
In-Reply-To: <20240124165558.1876407-3-ckeepax@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 25 Jan 2024 00:26:47 +0200
Message-ID: <CAHp75VdPP=wv7azY_Zi2VNAd-iiMDLpek7tcjTPMPL00xdD-3Q@mail.gmail.com>
Subject: Re: [PATCH 3/7] ASoC: cs42l43: Check error from device_property_read_u32_array
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 6:56=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> Whilst reading cirrus,buttons-ohms the error from
> device_property_read_u32_array is not checked, whilst there is a

..._array()

> preceding device_property_count_u32 which is checked the property read

..._u32()

> can still fail. Add the missing check.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

--=20
With Best Regards,
Andy Shevchenko
