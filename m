Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315F228B4F0
	for <linux-sound@vger.kernel.org>; Wed,  3 Dec 2025 05:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764741310; cv=none; b=Df76kO3SJaKF5jgaKDFXPp29qeiQINn/Inwt9gla0t7uXZt0jQOI9QcC49kZUDa58E5CCt4h7xwbJgziH8dYIw96WvipT7H+85G2ygrfE6RC4CBsqsHhTUpzd+t5ccT6WGSAzNSaafnSj9b+V5ekpvCDjtgZkyaZyABPtFzwQiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764741310; c=relaxed/simple;
	bh=0X0DDNFH3Ev9aVYRbKGBfspeldcgABI3ElaelHXqkTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HDQ7+ejcHVfEyiQ5Y/SHWJgo4fgM/xnkcuPwOTGd0oRGXIytuhNp8IM1ELQ7E70EcxAJfYP+jYPntNqfrErPHqdBP5gicy9O4P9aqvC0R1PgCcTy4YXQj31+sttAXJ/jqaSuYLPY4FlS1mhczwdtmtJIFkf4s8Ph1O94EP/YzEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzMtvuKG; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzMtvuKG"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-297dd95ffe4so55845255ad.3
        for <linux-sound@vger.kernel.org>; Tue, 02 Dec 2025 21:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764741305; x=1765346105; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0X0DDNFH3Ev9aVYRbKGBfspeldcgABI3ElaelHXqkTw=;
        b=gzMtvuKGws1eSWGAuq+PAOrpjYnXSEWR1923QSHVzqc/szvr9Xr2kJJ020AVaowwZM
         A5HtM5Jc+zPImXspecbkpBgDgiN61pjkxspzYcw6etxTedWcqJ6RtXoiqWPJFh37wVG6
         l1RyGtpJ5HzY1Sxm+l+va3oqS9HBtRI9cGJYgMocvjFO8i+zu8Gm7ZbwdEXS/hDfrEag
         eLOYthrEKrQ6r18vpIRQGIPOo7pHLgIjMwHqKPGXMeWIw0ba2NTS0aoY4ib611+lqy4w
         KAFNToYwgneiXrpNHTEGmf5BgOaYjIamv6Kir8mFD74YlYaFAzjId5O1VIvJGU1xJE71
         +jwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764741305; x=1765346105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0X0DDNFH3Ev9aVYRbKGBfspeldcgABI3ElaelHXqkTw=;
        b=OHOjJAftpNP+LnecKwwPKAvwkK6//Fj3y4lJeS50mVNiuwiB8g2EK1IQskz1+TdH5D
         L6kz8ltBQZ1hQbVfvlvbQlqu5VWSk3k0jbQ/KYbz4I4oKpRT4QWgwKcOHUw3quypwGQy
         pCwwop8Y56A039Vv1dLdWJoDzBymXlLSlwydWoYZBbf1s5letUQ3SW0JoRKKDDGTSzrY
         FAUbrNDKsEf+4OjGb7yVBliZtL9BPtp1z/bUkna4Q1E2aSnIyU/SaY25RJ53rmklBm1l
         Ju1Fe/he+9k3v3k7Pt3cnQOjg4cNURta2hHG+ynGxVALF7yOnJNqA2NrYbk97vtKNq2Q
         5seg==
X-Forwarded-Encrypted: i=1; AJvYcCWpgCch84G/2BzObXG0xKeJNXowC5zJunRg4TdZsMri8srtaoIm8w0i7TkwjJ7iO5faVIjusk9584SBXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2p4boLhFwpVTTWHwdDxwd8AyLcaA8XHotXGGdgkVaKgyJ5nYX
	7OyNQtNd7rerXpa7Wg+pzXc4iTI72ubAT7LMUW4qEDAcICRPXn26quZXLb4u9bnKoeAH7IZWH7+
	DaNDMyTjhZCVW8pWgiNGj9bkdMPIlApB9pLW4
X-Gm-Gg: ASbGnctq/QUfy+8cmB4Y8M4HO7lJ/jiM1ugcyRWJVpwVK8idbUr/7w7JgonyisGt+uX
	l6j07zR798fja67Dkh8CPAlFPPBPf7Hav9ReUQGloKwevgXYGHOvTj4tYEROwGsuWHOu1iL36Mm
	Q8cts6NmyZ8vC8j6pNIBDFfLsBkxxnVMx8OzCR+1N9454vvyaQ/mXlbC/c6B5ur8bUhI8etjrHU
	5odODRhyyLP9eWiTuQt+mn+WRUjLEXjmyQuLVs3wkm0fjYIlk6DtTQTQre1ib4TqxYckIlpA63h
	O3xKPw==
X-Google-Smtp-Source: AGHT+IGlBCnAtK53Fk8wZM5iFBeVBzZOXmCrnKhJ1FO8Z5h+6EI5r7eB09cypqHALV0pwNkVTP+iK5FPn5ouvpjv7Mc=
X-Received: by 2002:a17:902:ebc8:b0:295:f508:9d32 with SMTP id
 d9443c01a7336-29d683bb11cmr16122865ad.37.1764741305338; Tue, 02 Dec 2025
 21:55:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202061157.1710163-1-shengjiu.wang@nxp.com> <47e32ef5-cfcb-44aa-9045-52d84f7686d5@kernel.org>
In-Reply-To: <47e32ef5-cfcb-44aa-9045-52d84f7686d5@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 3 Dec 2025 13:54:53 +0800
X-Gm-Features: AWmQ_bl9yg-cNfOsr1ZElVdBAxzvXXRK42GyUZlfUtv0M-hIMz1ZXcfuqHhfSek
Message-ID: <CAA+D8ANHFOi5ksBEyZSvFhmp21XbBD1Lgyg+TJgjRX2xBcc_4A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: cirrus,cs42xx8: Reference common DAI properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, david.rhodes@cirrus.com, 
	rf@opensource.cirrus.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 2, 2025 at 4:06=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 02/12/2025 07:11, Shengjiu Wang wrote:
> > Reference the dai-common.yaml schema to allow '#sound-dai-cells' and
> > "sound-name-prefix' to be used.
>
> ... because CS-foo-bar device is a DAI?

Yes. cirrus,cs42xx8 is codec DAI.

Best regards
Shengjiu Wang

>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
>
> Best regards,
> Krzysztof
