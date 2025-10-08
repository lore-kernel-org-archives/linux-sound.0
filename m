Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6B3283FFC
	for <linux-sound@vger.kernel.org>; Wed,  8 Oct 2025 13:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759929990; cv=none; b=lG/2ZFf24qAKuo0FSntidf4Zl3sFRGwDWbya5AuxSb85kqw65FHG33Irk+Qa2vFxLwTJZlY3xTqdYbxWPYRvfvPmKXaOPxdfgkcAaDUvGg2IMQto1VUo7yVafqAw2HdlU2bfAV4IXHYKMd6aYmlrvdBANWNRg/jvZi1BmsqlepQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759929990; c=relaxed/simple;
	bh=05Djfz/fc5yLW+hWwXjLSqtCX4jNJikbc/xDMtKa7K0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u51VZYZfzREPYCUpSr62NvWCkLkgAu4nsu2NliOQMjc+sAtO5LD/5ncSP4QXwacXYz9TexNaAwS7alVfQWztRFqMbqiIScv5sYCZjhoXTeppRQBOSS6MM8QgB9CxWg2feU+lRADdlxGPGXM2+MbBoHAKPEID6J9CTCGvA/Txe9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tqyu4BZP; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tqyu4BZP"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7b97ce4fc60so2264379a34.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Oct 2025 06:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759929988; x=1760534788; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05Djfz/fc5yLW+hWwXjLSqtCX4jNJikbc/xDMtKa7K0=;
        b=Tqyu4BZPcfx9jW7BYHnNwkYOpLcrSi14yfPhcd2/wDhCT3OsvUkiPTNyHfL2EP+Y3Q
         QgufzhdETph/iHEFSa44whMTT3bnNHuNPBasDsTSb4lvvKYpJPapJDHcsKK0BDkQtqfk
         X3tZfy1ZDQOc1gEsXRWD5pnSTh5uhCEV3GGlZGTxsNaG//CLuf2QvGewrVafIRA+zVo3
         wDrnW3Bs7Qhk33B7EGvdkVadRI22XM+j0hEdWjFnbZUmaJlC1rGfKpJKDu5NaM7Jbxyk
         7EqSXovUfRIebjKGUDhFWfZ5OM3aBOg9VVIgJui2iGVlHLptG/NC2oPbj7E8/mV+QMI3
         mt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759929988; x=1760534788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05Djfz/fc5yLW+hWwXjLSqtCX4jNJikbc/xDMtKa7K0=;
        b=MKePdiJ0ZRm+/kNsJSAt8xC40T777fAPhoo71SyRzCnThhVz9pEgK9Oxw05nzVELnt
         rZn3Y1UsmpeJPgilz4qKnYmWxeK+qOzwcJH7jks8weXwnU9VoEHEHjAtIuMDUWRnjXBF
         MJbFxtaLauKq/2Jqe2vRTg89t4OlRtcuU8kjgVOE3ojKEOx+a9mqg9CPAWFA2O5NKgAT
         IhAUdFFtW1jiQP+gf5PHlyYX7Gs5HMUw4XFqgvBDTHxU6bKcfBQxuOuT9NszoCwNdcZm
         HMJEJniwDqpTXAL6N4ntyUwaUcgktQVqypus4ar58a/kiV/2zCmq9VjdZ4Bw/2J5Uuxc
         CCtw==
X-Forwarded-Encrypted: i=1; AJvYcCVIAgiNthxD/3CNBnYa6TIgYnbdS0qlfQh41Hly402uJyJuHbBYeWv/iretFHjifrmW0LpssLd9sp/4eA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbnlROYoEyEMwuzCfYj/X9tygL5d/bEUe4cMBCifCW5YMyqt04
	LpsE+EbA55Jw7OTn+CWtp+cyjY5/6O/rJSi6Zfw2nXNZAInCzg/LpXW3zR000Dg7ayZz8d+vBn3
	mXAb6FmkcHcWfquH08jUJoVE5cpu7/pI=
X-Gm-Gg: ASbGncuJZ/VkrteAzzf5UqD6xDLqcWB55VsHpNjlmSNbJeIFB7DyUQpWK+n0zZTXo/0
	z0YdS5Ic4/cJF6jqPPvTKt/fYE3u6GZL+W9EQwE7kskrgk33UoFghGhWewCE0cd9A1eLrV8wuBF
	U7Sv5yfQcmPF8WBeQTdGduVJnO0EA2zX7VyMq7J5Os5pZYv20C2xzWSuJkrECT+0LgQ0x9FoetT
	wByIKfH8SdkEofk1MFpd2XGBWBs+ztqEQbwu2qlHw==
X-Google-Smtp-Source: AGHT+IGM/AtY5qLsYbBJ1vutlWYaPLrr0xadRxoxXcSHvhcZOCjpvlqjLspgJsuA10qAd80/JQ7NUhN/HiyOQcTpX7Y=
X-Received: by 2002:a05:6830:6481:b0:7ad:739e:446e with SMTP id
 46e09a7af769-7c0df7f5fe8mr2306555a34.29.1759929988314; Wed, 08 Oct 2025
 06:26:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007145028.1845-1-briansune@gmail.com> <aOUv69rMkyYFiHae@opensource.cirrus.com>
 <CAN7C2SDUiuMfPs_X5r0RDC56313aJsfhfx0-juhZRKGTb1OKuA@mail.gmail.com> <e78c9cc0-4a1f-4a22-9cba-a8213a7b9301@sirena.org.uk>
In-Reply-To: <e78c9cc0-4a1f-4a22-9cba-a8213a7b9301@sirena.org.uk>
From: Sune Brian <briansune@gmail.com>
Date: Wed, 8 Oct 2025 21:26:16 +0800
X-Gm-Features: AS18NWCLuOtZcq-UX1FDdMc0FIiE1oQFFC-_uppp7SPL3NBQzzcP8YR7rHfCt9k
Message-ID: <CAN7C2SDMB8_b-m0ZMzuSmhHxWpA10mcxxxDMKWuNe6wfiEXo-g@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: wm8978: add missing BCLK divider setup
To: Mark Brown <broonie@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mark Brown <broonie@kernel.org> =E6=96=BC 2025=E5=B9=B410=E6=9C=888=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=888:12=E5=AF=AB=E9=81=93=EF=BC=9A

> Consider the case where the BCLK needed is 100 and SYSCLK is 198.
> Dividing by 1 will result in an absolute difference of 98 and a BCLK of
> 198 while dividing by 2 will result in an absolute difference 1 and a
> BCLK of 99 which is lower than the required BCLK.

for (i =3D 0; i < ARRAY_SIZE(bclk_divs); i++) {
bclk =3D wm8978->f_256fs / bclk_divs[i];
if (abs(bclk - target_bclk) < min_diff) {
min_diff =3D abs(bclk - target_bclk);
bclkdiv =3D i;
}
}

Cycle 0: min_diff=3D0xffff_ffff
bclk =3D 198/bclk_divs[0] =3D 198/1=3D198
bclk-target_bclk =3D 198-100 =3D 98
98 < 0xffff_ffff
min_diff =3D 98
bclkdiv=3D0

Cycle 1: min_diff =3D 98
bclk =3D 198/bclk_divs[1] =3D 198/2=3D99
bclk-target_bclk =3D 99-100 =3D 1
1 < 98
min_diff =3D 1
bclk_div=3D1

Cycle 2: min_diff =3D 1
bclk =3D 198/bclk_divs[2] =3D 198/4=3D49
bclk-target_bclk =3D 49-1 =3D 48
48 < 1 skip

loop done

Final bclk_div=3D1 LUT=3D/2 198/2 ~=3D 100

what it the issue here or I messed up?
