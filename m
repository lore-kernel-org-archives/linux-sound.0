Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212F82FFF99
	for <linux-sound@vger.kernel.org>; Sat,  6 Jun 2026 06:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780727982; cv=pass; b=Cqhhow7l9LLZoEBcX5glJBUR7hh5U9KVxvWE06hf0kfFl+jYi/8zGLc8Jkc2vq+FjMeJyCydMore/HwEOFXpFLBRn9opo4OIgK3ZYT55j8k2vYi/JVRIz3E+8aIWhiaCcd0lCPNISysxevb5XiR6RRd5eTwyGVdO/LT9+wxX0+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780727982; c=relaxed/simple;
	bh=nw2fodJT+5Wo9YW6pF1TC7cMx3symmS/TuugS5g9JKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DtATkfNYjmIKJDljlh/aRJdhpGBKBlvoHSIBiY9QAp/cFnTwTAdBnyb9yetuycv4yrbAYYO+sT0Ra+TOv/2jWRvvu/pM6hinEDn/am4nxgpIWVDvznQskvmtqKIA/jbshw76cayJzo2JiPLBLk2A5XL/H8sYu+KsMqm7SfpVz0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IOk2s/kP; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOk2s/kP"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6608c1a4215so3339145d50.0
        for <linux-sound@vger.kernel.org>; Fri, 05 Jun 2026 23:39:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780727980; cv=none;
        d=google.com; s=arc-20240605;
        b=G330Pex6LDqSC3gIPXMZtK2J5Smxf73pv9l0tae9FDJbcSnNou1NXjcbC4M8uQ7fKZ
         R1QNO8Mctl3o9SDArnjjT/wsubEQK8XNdwC0V+Zc2WpuPbB1vwt7GvGB1nsiY+2theI2
         6Mh2rPyd+GDpfml7+GBo9tTt30eFfpPSoNEXrypFnauRKAIhOyH5DO2ackhdN64mUgnS
         vUw/xKv3Ej+Q8oB9344e6HzK/wXwAw9aJlCmYawXFGDcqOTkWNFdRwkaxeIBgEXRS9GD
         UWnqHWHyIAYHeltfg+R7Bew5/RJdYAYcDksefn+mjjowtWZYuuVfm9oAca2bsCLLza3G
         JP/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nw2fodJT+5Wo9YW6pF1TC7cMx3symmS/TuugS5g9JKY=;
        fh=5Pd/d0wGhrsCOd1L2XcsusZIVAARCPAUL1sbWVVtXN8=;
        b=Se3jJwVYdwuk/C0IpFrA2FEfv/ZfStJo3eN8td/dYzAne6LLL8h/LpbSxofSMLLM0s
         g9iEqyl5PDowK+NrtTmc0GSPUGx8Gx2pOwQQc2ZynlpfTN6d/r6PqhrQFSRY8qPdk9NV
         u0MbH4U5FBPFMBdJPTiC5NIwyWU6+j1Se8YSSS33xf8swossRj8FKMeQAunft7ZvnbqF
         e7RzkalY7e7TsERxTKCOEF5BuESm4o0W/mo90QJyMTowVUC+MV1Yb2ct1XHmJ/HEk8lT
         CgBqLAlZyJp2DUpG+Q7r0HPBJkDD1qcjBmsUOZeNJ4AWwLQG+JuMj2yw4yCOkxjeIMbP
         t5CA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780727980; x=1781332780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nw2fodJT+5Wo9YW6pF1TC7cMx3symmS/TuugS5g9JKY=;
        b=IOk2s/kPEvCZTYxX+WayVnrqDezYV1qRin3RMIy9ZDkfF64Wg2HSnCW7Rp4N1l+3DD
         ImqLWM8eF48+BLYQpCAb+i+Is0MCBF+Ms6U4nV1YGo/RT63d9PPW5WPvBglWYfrYZixk
         OtQysrmCxYQaDpKQDLh1lXRfq2hVnfYFvlqW3HipCdBwGzYTBsYGzggDaJXUF3Nlwy+o
         y9jSFHxQL7TsMvKGxiQnukriPCpeJIjTBdJ9KMdM44OWq3I+Uvk9IOlLISB0/wqwjSjc
         uJi2e1YEO+pThGV/MzTapxYVPX8yh+rMT7YpJqdql1CiT5TwFEkj3fcrhDHgQX50rTya
         QZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780727980; x=1781332780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nw2fodJT+5Wo9YW6pF1TC7cMx3symmS/TuugS5g9JKY=;
        b=eKaKzCl6lduYjBcJS0r6NOe4v22zBy24XnqGGsSJrhQozcUN10LuC1MOvEwtYxf+Gq
         wF0nGlKdIAI1qd6HZ8bXX+hjiu4bDRU4Xw7rW8S5284LMtbovexUy2GOMbLztqbVzpmg
         VZZDlBMIcJmad6PsGcnrPRyZJ/5qwUUv/AVFr/SR2+yiBmHOaoDyDDT1HnWpJNXJKpLz
         e2kyUyfXeJ2FVf14Y+OANjVv85dHvfd4NIyDuLIBwDbmsikCX+qOJCQViaV3wMkBWXgc
         MeGrqy62W7WpBsrFCgMF00qD6gTcsrzfAuOCUZ4RplFxFgLaKtlnsE/Ir9a/eoGDnuIX
         ljuQ==
X-Forwarded-Encrypted: i=1; AFNElJ/TI/LEVa2EgxE+BJStdL+YsMjg7jp9A3RLemRbgIAdGLXIhA3aI6P4FKkU5xt1owgZtKs20f/ZM5VK/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBYljctybpMp4nDsJwJTs0lJUMIIyRAlPuXfLsx7BvWu1s5qm0
	0NLk5US6yEMec26uxf0n37Evnwh1TSbydlUyZQkVc/+o8ktzSvQw/EKJKYZ5nlaUX40jBwAfbEy
	vzNeO60d3v95xHyQde2+7C1Lp6BjVmK0=
X-Gm-Gg: Acq92OFE9/hnhtsUDkdQc0tnspxXBCRUZTkndGGXHhN9D3221kcnkun8lnAxMeQo88m
	yjH8rUypq+1ffeJnzvsGru7TwCueE1KYdiUlObeY0UDH9/Nr7EyMQPlIR9dNQQyfS9tj8vqjr1z
	sEy+7w+l7loJN4JTxt1pUDAfFVHFkNQgRALclyDyd6SGgMA5+Tv0oLq3Ff1/iKRTX7Jt0m2B01h
	JBLAn6jkCtt9yZ07+IpkF9+Z/1SNWPWoUR/zCmHbeaz2dMQie1y/Ln+MR0DyxkqXS2vnKAkD7p6
	h7yGhJWTCp9uHWqlEjs=
X-Received: by 2002:a05:690e:1183:b0:651:bd7e:c04c with SMTP id
 956f58d0204a3-6610a6ddf47mr4012236d50.21.1780727980224; Fri, 05 Jun 2026
 23:39:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421085635.4490-1-chaitanya.msabnis@gmail.com> <98e79ef7-1a0c-4392-aa9d-ccce988593a3@kernel.org>
In-Reply-To: <98e79ef7-1a0c-4392-aa9d-ccce988593a3@kernel.org>
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Date: Sat, 6 Jun 2026 12:09:28 +0530
X-Gm-Features: AVVi8Ccj7u4XYRUN8w-cgWUbHlOu0vYAuvIAg-MJl6lvBtK50qp2GlY_3CQJsk4
Message-ID: <CABjkosFAm17BfURDq2z0AvMNZrz3=QJcLsvxhVZbrZkKwd0rXA@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: cdns,xtfpga-i2s: Convert to dt-schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Max Filippov <jcmvbkbc@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,
Just a gentle ping on this patch. It received Reviewed-by tags from
Max and Krzysztof over a month ago.
Is there anything else required from my side to get this merged into
the ASoC tree?
Thanks,
Chaitanya

On Tue, Apr 21, 2026 at 2:32=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 21/04/2026 10:56, Chaitanya Sabnis wrote:
> > Convert the xtfpga I2S controller plain-text binding documentation
> > to standard dt-schema.
> >
> > The hardware requires exactly one memory region, one interrupt line,
> > and one phandle to the master clock. Verified these constraints against
> > the driver source in sound/soc/xtensa/xtfpga-i2s.c.
> >
> > Also explicitly define the '#sound-dai-cells' property, as it is
> > required for audio routing but was omitted from the original
> > text properties list.
>
> Ideally you explain that driver uses it or in-tree DTS has it, but I
> could clarify it that earlier. Anyway, no need to resend, it's fine, than=
ks.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Best regards,
> Krzysztof
