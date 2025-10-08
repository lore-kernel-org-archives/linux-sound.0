Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F28230BD9
	for <linux-sound@vger.kernel.org>; Wed,  8 Oct 2025 14:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759933110; cv=none; b=OzcM654dIDlpECCV8mUQDKlbZx/9N1t3uSbZsob9VY4l3cqMpIPeJjCDNG8OBRtEFIaIKT+rA/DHzcj9dputdwdXxGX1+wRJps0jQBwYrty6jSxfc3RG8wJQQEfdEgtx29HW2/lpeOMGYQ4epTIzW6SJBzbCtybKutOyryDy+1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759933110; c=relaxed/simple;
	bh=02xoZOIaqCUk6gy50ED6DchHmI0JFVyHynhA2+ahuyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XFefBtoyqnJzCMKpk7j7K+9JMtFbnTPTPb8SxCwfbqe8QMeCFVZ0GhpxxQCB5ibD614ea4jyK3/zh6lFUFRYOvYidls8k4PHyH5RgMTJEg/b+6SOn/0zzyphkTDDg6FXaMDmMtzRkQlz4LlA5Skqw3pGVUpV5OKHoU7SaMyQATE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IaGDGj46; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IaGDGj46"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-30cce892b7dso4455549fac.1
        for <linux-sound@vger.kernel.org>; Wed, 08 Oct 2025 07:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759933108; x=1760537908; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02xoZOIaqCUk6gy50ED6DchHmI0JFVyHynhA2+ahuyk=;
        b=IaGDGj46XIEWM6dLd2386Af36ZegkUCptIovx8XvpZKTl+wVuoyOBQarAhFN1G+BgG
         DJ8tC6ckKAikqfIPHPej61PN9Ivr/3SeYnoAUVNz+oSTmHy/9SabA3rEnKbo29O7Wr//
         7SAfsAPF0rEEdKmRf79xEIM7Kfj/BxvAJ6zn5rBd5vNVdMhcCV+SIuGSPkN6CDaoAqea
         325UYRVXgFkOC3zN81ATwfO+SiFziKqJunpcqvnCqK/5HFKX9DfE/0LMv7IsCULDI1vB
         OHs5MrCqnO4WWti5qToq/Zr4hgCsQmfqh9gyxXmrdBDwhPoZUCCKi/BYpoUNYJq5afuI
         GyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759933108; x=1760537908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=02xoZOIaqCUk6gy50ED6DchHmI0JFVyHynhA2+ahuyk=;
        b=U1t4J9cofloAIjMQe9CGx70asbI5E8NcUwAOHsugzxELM3ho8h4W61qte3QY8xSLdK
         yTx3MB5lmbYMHMSTVyI15ji9IrXAF9EQ4Kg4MvB2ThBEpJSX7OmABvYMgqA6xzXMXkSI
         /8Ia14xlzsRfVZJDJtBGLlCNvLA1j7oFZrJMS9d4Gj8SrE5FKkzBaUn6+vdm4rjmDFNI
         NjmGTRdLTNYjxIn4TmAaHoUAcr930IiZtF/bXZ0CosoZYNqMiZ/Do9G6oV8+K3fp+afB
         nRbAwVCpI0JjwOX6lueLkI57RzmsALa8t1m5N6FqhSyLBIOgKjcdTC22ldklP3URynl8
         dqtw==
X-Forwarded-Encrypted: i=1; AJvYcCUTTHbWSbpFln+d4E7Qh3AFnYPTJxa6k4rmag+wfssNXZoWp3A9RF2k4JciHR658BTUNzE6+tLOv+Q3MA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5euZcTrAeSjUtPNtQnx9hBPdEvC20kNt0qvAELAMFRbUrZxS/
	ZhoAeECWO1tiMla3w9WE/RoHOt4TDJJzM3xExvQrZY03kxeC9OlIXX463O3aAYufK6RR+RIRetd
	3g4anGkNEN5FoR2S1G+eVuXR+fyDi20A=
X-Gm-Gg: ASbGncvSgEcVzKuLqPgBPhYbvIjbJN98h/tLKhM+03rZkT5mR0X5+tkwqjSESvCsV2u
	CfSBShEMLIThJ2T75hFcrASAfEBPDMhmbyWWvepR+KmWdGeum5K/rCkSrgAmTHqiFKihHx1LzH+
	4M83K39DPDIzHQtTUh8eSNu3U2fVWDu2ZHu+0DwkgWQd7G7kYjSB9O5SogJx91fD5MSvAlFdKUT
	2/oMtyWeHnDp66KMGS6Z99Y3lC8PgEX0tvu/WdZyA==
X-Google-Smtp-Source: AGHT+IFNFjVUAWMHKgGHXBLdjL+z9UZVnH3ivOrRi96WUbNTNIl/wqUCLJ3Eqxp4UI6lqYQhsmLvNTpljrWMA40Zw6Q=
X-Received: by 2002:a05:6871:451a:b0:315:8b80:aa4a with SMTP id
 586e51a60fabf-3c0fa86713fmr1692388fac.48.1759933107602; Wed, 08 Oct 2025
 07:18:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007145028.1845-1-briansune@gmail.com> <aOUv69rMkyYFiHae@opensource.cirrus.com>
 <CAN7C2SDUiuMfPs_X5r0RDC56313aJsfhfx0-juhZRKGTb1OKuA@mail.gmail.com>
 <e78c9cc0-4a1f-4a22-9cba-a8213a7b9301@sirena.org.uk> <CAN7C2SDMB8_b-m0ZMzuSmhHxWpA10mcxxxDMKWuNe6wfiEXo-g@mail.gmail.com>
 <58756837-9be7-4027-b951-401ceeb69e4c@sirena.org.uk>
In-Reply-To: <58756837-9be7-4027-b951-401ceeb69e4c@sirena.org.uk>
From: Sune Brian <briansune@gmail.com>
Date: Wed, 8 Oct 2025 22:18:15 +0800
X-Gm-Features: AS18NWBAo1priwf20NfbC-WLbiCJ7RPYiCQuSQkiocxt57LiFHPz_plFqnbPsSw
Message-ID: <CAN7C2SAHy=9S3_DWCEijr09KSc4s516XAcfVbwMhNoFr_PYYrA@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: wm8978: add missing BCLK divider setup
To: Mark Brown <broonie@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mark Brown <broonie@kernel.org> =E6=96=BC 2025=E5=B9=B410=E6=9C=888=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:40=E5=AF=AB=E9=81=93=EF=BC=9A

> This is not OK, BCLK is 99 which is less than 100 so there are not
> enough BCLK cycles to clock the samples.

What you are questioning won't even fits under normal operation scope
of this codec IC.
This is simply arguing and I really hate these type of conversions.
This is a patch for specific codec IC architecture.
Such automated bclk seeker just runs on expected operatable scope of this c=
odec.
And such patch is to fix missing proper bclk register load from first place=
.
If there are cases that is this codec is allow but could generate
wrong result on this patch.
Willing to update this patch and learn from my errors.

Any one could do what you are expecting and could runs on this codec.
Happy to learn as much as I can.

Brian
