Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A002EA173
	for <linux-sound@vger.kernel.org>; Thu, 29 Jan 2026 09:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769679468; cv=pass; b=NLfetVowrczD0D1ZTckL7BJhI/yvwJ5v7Xot00Q+3x6GQrIww+5l/fmraGeamNpetxil8pUHNK5QfMX5ItBNgCzsBiv4OcXKqaQTzS/u5Fe8f4UBkFBtXjeadPD41ONqqApQ58UEgwbYhpcYhgNvRQB70fMV7OPTIWvJp61mKKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769679468; c=relaxed/simple;
	bh=zcM05kpdQ+n6MUDgSMAvFhhgb3WvkgEVy1gJ+6lV2Lk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MSHpHaLlTCWLlnF31wXmPXlmy189lw9baBx7P5y9rvKDX8lJBDtn3S3Ed0OUAwGjD7HSl8YcBt2+AD/4ekMXqa1nnJlQogDcmps9TR/pWgzSqI5diDPuef1fuk7k8kqEVcJTLDRgG4nXOeUqeZG5IS6dKBZtkI2HbnX4AWINwtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IupRH+bC; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IupRH+bC"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c634c20be90so289209a12.1
        for <linux-sound@vger.kernel.org>; Thu, 29 Jan 2026 01:37:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769679467; cv=none;
        d=google.com; s=arc-20240605;
        b=g/zRIwu7ls+kHmfkvNsNn5mlS+2c84oNgMnCFuBTRA+ag/9jqsEFsLqWqFIGxAk/Cs
         gpWxdpaJrQgI03IEGZJ2OIYqpTB6PYaQcL/PCF2nki5kKNRWNCl+1V070/NLJ2R9Q4Pa
         OgIzYvQ2hiF/r5Dov2HmLlbHhrCbdr3U+yhKLk5BN53rKb/OqYNMSkUo0OJWBbrbYO2E
         0VMpKcq3WZBerXRh8igi5hlSc12+8XRMGsDnHGbv11x3Dwa3RcHrsLaq/3WerbjltaXp
         BlY4yxDANZwP4TdkOVlrxKb/0BtlCMiaL8RkaFVKhMr39uiqwd1V9jLXDfwHuXkdpSg2
         8j8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4lU8GWlv78rS676V94HHH4zs90Fwj2GtCQjzXirgDFE=;
        fh=Qcg/HMnpZ9EaT60beXR8GbAp7xFHcrJ8b7kod4zXyRE=;
        b=JLJroPo+ilq4QMmrDDf/z6H0pEE5iY6DbjCgj9HgDTXtErZeozUBE7YysuyvURedNz
         Zkj/8z1CAS9ZU5H0Xzru9slRPbhwX7DO+J+aSr9YfwYto69WAyL5uNFH5U7H/NNeJT99
         i/E3KIHwcugIpIHyOUalNi86fl3b7S9WaVkyxFsCnx+LdrME23ppps6G7HRnf14mbo23
         eYjMoVfll+SqFf8W3EMFJwCU4oH9JkfNbs2Qip+drYGjWIyRUe4GjQerpIEOzGmAH+jb
         VXU6OocCDsm1EiXLg0SY/FC96ynpGrsoNymKp4rpGRDe3QgSR7asUUuO/0wzw6wHSMsD
         eChg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769679467; x=1770284267; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lU8GWlv78rS676V94HHH4zs90Fwj2GtCQjzXirgDFE=;
        b=IupRH+bC7ADXceaiuWcRMEqTYyuuwhAxQTdXZfoClNcyIngWwnlSGH2eW9R3dJQMLt
         uQODnWTkt70DBRonwuIBb/MFzzyvD1uB16tc3+Nx62ewnMX0WJrQ2rFDHQKrwaOhp4EU
         BeJ64piEsAKb3icYfW0n4PT89JJKN5cf4RCqyk1tN2V7GnetIXofufD1U+D4EHDLJ70C
         xKz6qeWdVTxARg2uFUWVh/lVzMUZK5oSSOKvjCoufsEagm30kjvQK7GAp9gR+a+qbeud
         WnAE8y1uZbKzMOFTvFwQiw/cMds4vpozYFE4TkkF9SkA2aV8kB7wnSFMY3HIYOVbBGyo
         w39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769679467; x=1770284267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4lU8GWlv78rS676V94HHH4zs90Fwj2GtCQjzXirgDFE=;
        b=bpg3mNtHThuxoz326glL+AEedip5gd8OZgHZe8OSs6pYsIKZCNXAlHfYF0lzDuu5nA
         vb2Hzjz/MT31MbXHoTJ++GJsj7eoQ1W15n8ub9PVkU0UU2gd4M5NTPyJ5Zl06mU6ad3C
         bHFcpmwt8jZHJJ6eIFnS9uP4cJaopsf6XLY97xnIFZvheGMMCGGsYiqovKOYB+J8Mkh1
         0mgM8khzFry0hFBXPgK0/ACbyWI/MdP7IgqbBownKBkZLgeSRtVQNubOgOnnt1vICZFt
         h5XBqNn0brdPvz4b/6dZyaRfOaMWMA98DY27vCzpazUSIXHEdLZO04+fGQI8tglzQx3i
         JeMw==
X-Forwarded-Encrypted: i=1; AJvYcCXMlTaWHG5BpZinYzbATJevPmQCV8SYfx755FoMa2msCXqC2Lgu/Cj2Ug72USQcT5FHndOOT25L7a/lDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYXGOtBHhXgWWI7cfNrrxpwXBPdqs9sWKKze1I17EqA07lXtQJ
	ahmDaUlQNuilqMmQL7Kf7TBfrpZr0HDOmvPv/cNGK1AAUvDdXzwTR7c5JvLszk3KSG78r9Ky/eW
	lslbe1kftsa3yY6YJP1v154/Q/F3py4Q=
X-Gm-Gg: AZuq6aKAZPuiNG3qv/UTcWZj2v/H5HBPXdRhg0XFop3kk+sBFI70w7qqjMYXHzD5V8M
	knivaVzXxwD1Abps09MEuKmurmPMNwo0meJv30XOX86fJ2zV4jfyo43cLTus8zEz3bdyT4ryRKW
	ZXfcr6e5VtXorvXXokJHXeEG/YbL7cpthYUG4Qom7zpaT6E1Ccn3qrRXaPnSYBGwPwibWfD/Bat
	fUyvUQHdLNOsyFFCg5WW/9/PrX1CQhKenBQGF4/HH6GLTqGEhc7CmSrhyD6dXMqJYV9PSE=
X-Received: by 2002:a17:90b:1f8b:b0:352:c9c9:75b8 with SMTP id
 98e67ed59e1d1-353feda27ddmr6746159a91.36.1769679466914; Thu, 29 Jan 2026
 01:37:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-4-shengjiu.wang@nxp.com> <7e34b098-bdab-448e-a34a-02bdc643f700@oss.nxp.com>
In-Reply-To: <7e34b098-bdab-448e-a34a-02bdc643f700@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 29 Jan 2026 17:37:35 +0800
X-Gm-Features: AZwV_QjhsaT3WGqHFWhY63rZWE_xfRO_5posf7-8hnrbY9543Mu3MY60Z30GXKk
Message-ID: <CAA+D8APbzGCSHOwGyBZjf1TYqo2K0s0dvoLjHS+FsT_RLGrb2w@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: fsl_asrc_dma: allocate memory from dma device
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 5:22=E2=80=AFPM Daniel Baluta <daniel.baluta@oss.nx=
p.com> wrote:
>
> On 1/28/26 09:18, Shengjiu Wang wrote:
> > As the dma device may support dma-coherent property on the i.MX952,
> > allocate memory from dma device to make asrc driver to be compatible wi=
th
> > such a case.
>
>
> This commit message refers to imx952 but the change in the code apply to =
all supported platforms
>
> So in not really clear what is the intention of it.

The dma-coherent property is used to indicate a device is capable of
coherent DMA operations.
Which is applied to the EDMA device on i.MX952,  in order to support
such EDMA device,
the memory is need to allocated from DMA device,

The code change is compatible for non dma-coherent and dma-coherent dma dev=
ices.

>
> Also, it is not clear why do you allocate a pair only to free it at the e=
nd of the function.

As the comment in the code says,  it is to get the dma device handler
for memory allocation
. After that, it is freed.

best regards
Shengjiu wang
>
>
