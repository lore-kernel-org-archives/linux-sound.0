Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA2F47CC92
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 11:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509674; cv=pass; b=u0369ci2yqH9bSMbgLmdxKIkR9oL3KjGQw5zlLOIap9IBsA2TTBVAOl3xI8YDU03YmXI9xtuAl2886PSxe7PDAGitVgBtAkDG83SDKj7w3otCcJn1q85+0CIsNKM0cLH20c/RUHpaqSqx10t5f8Qm1vfGFSuZ40tHYiorCbd+bY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509674; c=relaxed/simple;
	bh=sxTm1fV0wN8yufOFAAA23WvJefkJ/ggYcteJQQdtpw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lqOnUba0U3D54HsJKRufW+EEpDaDrivVLud7QqGyWCZYql1Di880uivnmcIPXvVTZ4HG1iidH9kK24GAyWzhkWF8lIr/8W3SFTJ/ejUPPjCUXaK4hOwoM8IAhp5Ss8S5ZGaUXNxS1nGbwjmide9B5CxwKaT51tmrqdKonL4Gfz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPQKB3n8; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPQKB3n8"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c1297f37073so64208666b.2
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 04:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783509671; cv=none;
        d=google.com; s=arc-20260327;
        b=ZdMxNNtDMFq9sLj2HGFOsDFn5zZ4jUD3UdYO1PITpE/KNZt6b1a9rrz7gJ+qMXNdG0
         xAo/gpwCV16RBV65A5aNJrHUSFVoWvZWo+VokNiL2ii/JARUnNhnazIUZ+jBK6Ns8qyw
         shWVmVFXb2evTqt7ug5JbkD/e1/YlPX7EUNzgZEFd/D08oA6ONpbKA17F9rEEAmOGGRL
         1NsxbQWWoJSrAxxccCcWtBq0RapiWbDpqdwsMpWCZBwzOuKF8v8NaG/7VirLlXCfcl3z
         p/By4K79bYkxNocmzeHP/jiRko/HV5IP+YHEjNgUV4qwy7QNz7W0nIITVMQ4cDAJMcGc
         sgOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wg1Pltfpu5Izl1NFsHhM5RN0Y8llAXCSZAgh063DTEc=;
        fh=0zqn+lbWgO7zvddwWWixmKpaefc2WX2TLzouysCxOso=;
        b=KdxUKWwDTwQaTYN28GGhz53q5UiR/7blyT4zKU5ybpA0yA0RQjtZO4+KOBFxrqZnY4
         DAPaSbbEKtOFa6ryezlVNc6BxcKtjRiSwThZ8J4FTrJnmyyuHCon4Z1nvS5TauEU20ed
         XEMyhToF65FUBgcuZSI+OJuzoUqWLKgFtYGuMYSxFibpQu+kkzoFhQ1QY8ooLDVd4VXR
         eL52DfuEqP2t4bvAcDU4ZirOk0ieyjdxGyG+wWCTbREK6U9I/2ffUThB1LJajw5rs1h5
         1HD2Sx08fTEDEUcl74ccw1G4SPg8hs+NICKnU6xZFpCg12U9qbuaH7LIg5hTg6sWY3zN
         /Itg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783509671; x=1784114471; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wg1Pltfpu5Izl1NFsHhM5RN0Y8llAXCSZAgh063DTEc=;
        b=hPQKB3n8GMj3BEhRb8Z9uAkISVMBXposI+fqwptxWU2nclVwrqpuOPHz16S/W5zZSX
         cCvrR0lHr+qwOfqbjDKG2DRdE2O3W/Ew4+1wU96O2BKE6pdUPdKXGXFhTW1mm6GyfwwB
         L4pkI6bLfMsWjk80WPAOxuWkQzWUD9ADwUVXd31sheH0CGRnRhXag2SaE+39HyrmNFRn
         BaYCgU/E9MISCAkkhpYdCZbpIUYFK3C+YkRpg921V4NLkSHpWIUbsGA4YpMLzzIHsbho
         0Ne+YT9N+DdVzsZa5A/wBC5aLm9VgkHjSUt2nShgHwixAYED67rXDzkejWXs1+7ZTua6
         RtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509671; x=1784114471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wg1Pltfpu5Izl1NFsHhM5RN0Y8llAXCSZAgh063DTEc=;
        b=WmK85AcTyij3grtKj0a+NbJrLHMwX78jU2vUENMI9n04APxetkZuUk6hqhFfSWO/+G
         0lpHKFbPRXBnwgVARJ2P7AENv6x/tEdiL6n0ZrwExlTCUZU3w6Wf9xFe7YXwpyos+plO
         lUrJBhkee/9YfBQI6ElVa5K33+clMXeXfAEYFxd9fnz7gRh4j2rvlQdpj6xX+X6D21sO
         MiyhcOL2eZcbRsZtMOittpVNtA9c2RozkmkY/Vt12pLB4odLxzaeRJm4lzA8DIXXCSwD
         SKLqy/ZIFa7s6Dk1rMpSkHm16VxZ498X9v03qSKOU2Mmyk82vTF7i14YS+FL7+V4f39e
         3hjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp9/X2WPaoGDC/qlx9Vqo0Bw77zOFvF559QU/THt3eO3ke6sKuGnhCvVzAhSjEsLMqpsr0hf2f2KlI7Pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcTqYlWrUZrORBx6elDaappV4ruXr90SZr7HqKehWQIH5Gc/zD
	ujg3kwXgIDcDvRpzxO58g4epPKCDBNd3e1mEWv3AJDFbHXFOzoyJdfB7wdsj2IPhGon4KpTvCY3
	YlH3SciVEbJAHNkG2y9SaHJxqwDx3AWo=
X-Gm-Gg: AfdE7cnaOJNGJsORm+fZmShH/dy0ig8Ta/F6RFPhHWjUKxeWTSqia3UXUmvbNXF0tN6
	NWmkqI1ye7daT7LOMZsPdwrImxzrleUZOOC6Ixg3evAAAh2hBOwSgVS3k5Pz6G7ohmoKqpZ9IVA
	iE4t2IZZf7ia/tXjWOGaCXPu7ssDe2toxmsLPfWVPhH8jRZf/7kgAQBKcd71ORaLJy6AQVMKK/p
	FmD5Jdhn+wJ01fEM07XwvA7P3xeHahwVKHmVsDPUEGhmN11j9GdFQhvUaIiSODMJehdiZ7DqUHL
	md+209UyNY6ZyA6VhJCNZuFBuikvRkSeGoGsvv6uJw9MgVaLHsmmawGyJCCmAKF/tHChEuQg6UJ
	e/Pep5Jt/W+82QA0lBU6ACuP6T5GZ103CvxNyEI4ZbLkdInWWpCc0cO9AYoW1/b20z2dP
X-Received: by 2002:a17:907:a286:b0:c12:a5fb:ff22 with SMTP id
 a640c23a62f3a-c15ce1e13b4mr91075966b.50.1783509671143; Wed, 08 Jul 2026
 04:21:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com> <ac8389353ee128d3841cf91c27ef84a8cfa3b5ca.1783507945.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <ac8389353ee128d3841cf91c27ef84a8cfa3b5ca.1783507945.git.u.kleine-koenig@baylibre.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 8 Jul 2026 14:20:34 +0300
X-Gm-Features: AVVi8CdHZRQ8JDdQAY9urGf77kybIGx_VhFVrRtDnRlB9kd2FPJpqh-iIUTt6R8
Message-ID: <CAHp75VenO8ZirZt1DPsrX4LVhFe4cBtbJ8QNN98BRqeuQDSs8g@mail.gmail.com>
Subject: Re: [PATCH v2 18/23] mfd: Unify style of acpi_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Andy Shevchenko <andy@kernel.org>, Thomas Richard <thomas.richard@bootlin.com>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 2:17=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capable H=
ub)
<u.kleine-koenig@baylibre.com> wrote:
>
> Update the various acpi_device_id arrays to conform to the most used and
> generally recommended coding style. That is:
>
>  - no comma after the list terminator;
>  - a comma after an initializer if (and only if) the closing } is not
>    directly following;
>  - no explicit zeros in the list terminator;
>  - a space after an opening { and before a closing }, a single space in
>    the list terminator;
>
> Adapt the few offenders accordingly.

You combined different type of drivers into one patch. I don't care
much about this, but personally I would prefer PMICs to be in a
separate patch, and the rest perhaps per driver. In any case,
Reviewed-by: Andy Shevchenko <andy@kernel.org>
it's up to Lee.

--=20
With Best Regards,
Andy Shevchenko
