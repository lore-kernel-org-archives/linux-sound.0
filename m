Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C936234FF4C
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 10:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762858012; cv=none; b=ptZUndcFoYtkTKIK7+7VSqFoVepMeUS1tzfJHUXlir4bGwlIEm6I0nFK3dgsET6LPin+MgmivDSPwXJgXb1d1EfYAXNsNFnjH1/qb6FA5AWCM1/CEhCux+z1D+mf8gqeiU0bCvWvsuZMO+Xcvh2P/X16CMYvKasnt4t2SuUMxSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762858012; c=relaxed/simple;
	bh=Vzxu8qssjIhFl+4HzQqYw3E2J9WYZzlt8qmmQpR/9RM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=scEm2tAIMXlZlcqZrRjcyjwASJ8xyR69UbkT6TTahBikL8cPJZlh6iGiE0ffs05ClCOdOJvIo8WkfZRkGwVg3gvETqiTyUN+RhURp0RpGX4NdUUOQqwMCthSyUvw8/gU6fdlLVlSXw+ZeDyLexMQjPW2eXMqyBS3qqJSxpWPx4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zCzix8om; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zCzix8om"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-58b025fce96so3395049e87.1
        for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 02:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762858008; x=1763462808; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vzxu8qssjIhFl+4HzQqYw3E2J9WYZzlt8qmmQpR/9RM=;
        b=zCzix8ommVmBggohX2nU+Nx+FqVGx4/zUmmK+OjaJhvAI3brORS7qwNax8HvXSpXh8
         CcJa2oGucKwgAfdrStMagzvTnzRg7Bv65JgpYOlGqq4MObFK+/GMg4fEFgp2K8zCGhlo
         DWMiqIcU9N0+bL0z8Ft3BUIe1kSxP1tqyQD4Y3BHzWK89xnN9Fv14T/eU9BqR/EGOB6l
         HyUfRQHjhARMcL/wJNAimVU6ufIpLIyk35vSx3x6liplpDrfUXuklPWOcfdqusBZN4Q4
         b2tLhUe5Aw93PhHJN6fET/FppHDUWA8owqFT4k0oURldYsDci3275Vya8GOz8t+zI+wc
         ZEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762858008; x=1763462808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vzxu8qssjIhFl+4HzQqYw3E2J9WYZzlt8qmmQpR/9RM=;
        b=EpK9TDZ+7/aFz2sT6zq2FduekinGNBAqBLcKuaia4He81ZpuO27JeF/B8+q/pBiWks
         KQDYUUUpAKFwWiDsfu8Ms/+OtY/jTkB9WzozlbMPbPkwNoFxtmXj4MJNCkfgRrJe2t7y
         iGGW/VnoxbnnJWuHQZgM6OjWXftqmThD3WIIH95ZIVR8klW/AOguuEMPOWgrQnbzn6C0
         uL7qix/jrytVxihhN9WWGKxVyTWwnmNgkV+cDmmzOJOIqgLLSmpW4E3feDdK5lCbYLAt
         KZ3eTykRrRllsdm+sUZRfBSvG2xl/KRaEyZDe3gN9DGbw/29TSS/A93VyW4m5PGNev95
         95+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXcppzBZMJftrKRC88EE8FRFcYLBwfKwqQhDH+4DCcbObWkPnjJZyjhrrlEe1NaV7uMfApje0NuvWwhzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKnNfp6OLDAEk5DaDU8Q+m1lzaPJQJ8QHdkGbcfbfIo69WXqX3
	I/Gf6iW2ox4gtIBsj7Fter1yl/O+UZx2G34qIxErls+5c3z5ZFcFuPkpaT1FOScU3mwG/zxrR8a
	VPcF6FUlS2n0CZRtb/31SduJGhxY0pFxDaJlcKdLGJQ==
X-Gm-Gg: ASbGncsi9Beibuzo0AHt3b4j6Ct4KMuipEcYRflBenF0r5J7uTwzQOUl7vM7qTryrxl
	HkAk8WByPZaA1CthEJHgZZpJ+VWpu4R4WD8vJVH3La07yh47/eiuDiXiTLDGVDRs9Nqc6NpfoNq
	q9tzV1nzL30Qr819XpS5oMrAkLMv0I1uEfDFPTQPUswK/SQlZV2Wvos8D2UQGATEE6OWLt+Z19C
	l34iDAqguDissO9NAgKAmjr4XVyqw81qL7eNT7Y8+hv2LOiHe9V7omXjzRA
X-Google-Smtp-Source: AGHT+IE/zC5OMsYl03Nj0mPJmaD1a2IXwBvVIbEcz3pKu9CsBoN95WeMpa65Ti7xOQGESKhkoy/5byt8ZxIuQV5LRlc=
X-Received: by 2002:a05:6512:3ba6:b0:57b:5794:ccd9 with SMTP id
 2adb3069b0e04-5945f1465b9mr3570547e87.9.1762858007876; Tue, 11 Nov 2025
 02:46:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org> <CAMRc=Md4X-GWpeRgun6zv6dddKFqqrjUSveq3fNOe5AboLAcXg@mail.gmail.com>
In-Reply-To: <CAMRc=Md4X-GWpeRgun6zv6dddKFqqrjUSveq3fNOe5AboLAcXg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:46:33 +0100
X-Gm-Features: AWmQ_bmu8Uv97qyqiqkPQLTOzsrjTmZVCm9AYfJGSsxfxSYvRIGYvQTliDsDKgo
Message-ID: <CACRpkdYBZQJsptXhxOHvFdNwU5_-_QDfaLN6tiDqgL=bBWoXmQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] gpio: improve support for shared GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 10:46=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> Can I get some Reviewed-bys under the GPIO patches if there are no
> other open issues? I would like for this to start making its way
> upstream if there are no strong objections to the concept. After a
> release or two, I'd like to start enabling it on more platforms.

I'm convinced of the soundness of the general approach so I have
added R-B on the gpiolib patches, FWIW, for the rest:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

You clearly have an idea and a plan here, and it looks solid to me.

Yours,
Linus Walleij
