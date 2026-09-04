Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF753AEB35
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 03:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788491511; cv=pass; b=nvcsK4miWmWLHqt7XfyE+Uc1ZFfdaEk7TkepZ/+fPr5JCHGjDTaUbAPFPGwQrSi4isKxQQQi2Fzg8CJjXxGFwoigSaILlim2i8U3kwtmcUdw9AVzh5Uyna/V2X2o0CocBvDCM89YiLz4+kXRptp4yFkRCKXjLvzhUfFmSiUNYpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788491511; c=relaxed/simple;
	bh=vfRlFYrZG7tQcJDkEgmaPaaxAK6OS6eQsP+WeAvUDW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OIZf3h0FLP95eod5Ig13/l0I9HnP+83Bgg9mWgUJPF3le2OHIa0+B8fmk47K8Nd1kolGuR690ZoWXMd/G59Q3/YlG4n0AM8tD51gl+LuyiBQEyZIV5lSkjR6oY7mwUUbP/IO0bE5DIo8McAbfY0vRl3LXYCvfUQ7OxpJtkRlIJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cB9L74Y/; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cB9L74Y/"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d8f265cbe6so4486415ad.0
        for <linux-sound@vger.kernel.org>; Thu, 03 Sep 2026 20:11:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788491510; cv=none;
        d=google.com; s=arc-20260327;
        b=Xo94M7gOckSaYvt67zwa94ISH/Rz7kLIHJwQhfIN51heDre9HhY3W8QCBgBOp6fNXI
         /26SP1YSNE6i2Kj0QQNq18dbvqA/ygLfWMuAYI58/nE1bLqcia524uPjXFQnSzsafg9y
         0Bh6TFQ6vGEaCibBAC/9v8udV4yDayEpBvtOaRFUTAprpF1FIi8cPXXnkHJRqlP2nk9d
         IOtkknj9B/njiLS4b/2SZR286+2KxbWG8L/Ae/7p9HeGmoJgnKCLvNYwGZ6R9/2o8EtU
         fZEGUPyoCmuPaeyUq+bltTpixLL08e38pSsMk6f5VdLvsJCn/EEOmEDQMyvA7BtkRHsG
         er/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vfRlFYrZG7tQcJDkEgmaPaaxAK6OS6eQsP+WeAvUDW0=;
        fh=JVisvYrsNJcEhtLid9FVcS1yI5GNL1gklP0jsvaEDqg=;
        b=iZ5jdI0s3MQ2XP4CRFOLZSeE38Bz2zJYfeDIfpKsxh1QDWvyHodBqNQhrmaD9h8YZB
         dm8Ugp+XbXaIFqTgSjGBeBqqUHrWfCPPHOX0WOpN2iTXRlJWyjt0BoOcI8ytazdpewEN
         Ztg30GXqS+OG2l/yL10FSB0yr06YLbpNM148zZjFKHxLgIoG96qqHF4SQwfKBrb/FArN
         4ar6Y2wIJC1N14MTB0M6HtZltP1uJxuWehqEoJJCTb1HSaacOkoWeOuZM2GbKFLDlneJ
         JSMSBDaMemYRgUK3VYJUWNkgjuVHQXX5VKEsUttRDh9Um4e+kNsnIG2Vtw7yCGUFf4+0
         j13w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788491510; x=1789096310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vfRlFYrZG7tQcJDkEgmaPaaxAK6OS6eQsP+WeAvUDW0=;
        b=cB9L74Y/322y7ZV+mCRyplO5gjZFLkjeXcoQe3JNT0KFh3EcB958KWB0LSyvDdu8O0
         HImua85i7oVVPDUdlsEDnerGun9UFBx3klouyyJi7c7rTXcH4Gr0eFsxR5s3kji7Dk6D
         Xf1nOzWKDpkYg3srMPFDmzOJLIhsHsTaHCvctqWb6hhLOWTGBr/eub6cqcGKF7rtZTrS
         GLuu+M2ZhFLwaegHRJA5MIanOGBpxTDkHCccs2w+4JpY5yUY/zDbxnVia7+2LUQkUumo
         FwfwsY7y6CyIDEmJp8aYIWrJdcGkQycBrhn45YJm/U5SW9D7ECgq6pRhZn9GtUHIH3J0
         6Kig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788491510; x=1789096310;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vfRlFYrZG7tQcJDkEgmaPaaxAK6OS6eQsP+WeAvUDW0=;
        b=UQb2kANKS7k2hn/xap9ZOkLrADsv20bymNbN60cInk6qpr156Awm+2jnuZUuTPsa9I
         9C9e7qpcrP408+hxUTO2uYYIe8y6QAnQP54bx8wstjtmMr9/iV8rgw0l3+jw7k110KcJ
         9Qi/XuTUEyQ9z8j1RnIRFT9UohvBQgJPUvyj7TSmIU6HdojnwXYB+lmBwoqSeRD4UAAn
         PwdJlJKsqXP5o9V/yL9KXH84tKUbyQyynFBP1s/66GkmAsKYMEoSJMj75GNH+5VFNAMV
         INUymOZqVYsfqt53vTTi5DIxHlegJmzTAVvV6XW3AKIVg5EtsHGtp96TS/uMc191BmNp
         nkdA==
X-Forwarded-Encrypted: i=1; AKwUvBw14eXtScYTgxXYM60k0NgnEplqXatg2KejQT4E5oBLvEUvpw0eznHDWruF6O14iBjafJ9Dad2u5Ckw+w==@vger.kernel.org
X-Gm-Message-State: AFuF++l7590TjjVluFA8ztVRhSz3dgOS1Yt8nYF0yV7vn7mp0lGbR2hF
	Tl9TaZTiCDjfyMNnF+Qb53iIib9W3APbj85re+jYt90ZzGwVvK9FXhi9Edfael7ZCyWiNcuUdlK
	Mf5Iv22v3P7heHx2u5nAlR3sKbk27etQ=
X-Gm-Gg: AYBFou35LHUdf5RxY90CK6a2CurYweI/Quj0wcLFobskt99xQaasGL2T2D0LkoFielm
	c5NOGwzoyCo1XERqCPbEvfAd+rwq+Bmqk6QluQYJN62cXpBTQMmOsXva8FVgvDHjEXLyVm3BhHD
	QYQXvVg195O+RMQFr+5I+Nht3kUIYnnzq7Ub9AsFU1Nptm7G8ce0lU728yV8Fna/2IzvbRke1Cn
	t5DoUz3Q2JlebRfULsig3k4m0e4wTZ73TzZV319OuSMLaZ4FyPhbkGUdDD5yhPIpyhPFHebhCKn
	3bOjdyqG1U4CUh1pBR+QmK7uoh5qD8cCeK/4DXH/gcl7
X-Received: by 2002:a17:903:1acf:b0:2d8:da29:da41 with SMTP id
 d9443c01a7336-2db127509bemr55944165ad.15.1788491509602; Thu, 03 Sep 2026
 20:11:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813070020.719810-1-shengjiu.wang@oss.nxp.com>
 <20260813070020.719810-2-shengjiu.wang@oss.nxp.com> <20260814-lean-classy-hyrax-60aab2@quoll>
 <CAA+D8AOdF08PyOqQX6HTz-bWZmyB0bmKoW2DxYtnGS3g72aWrA@mail.gmail.com>
In-Reply-To: <CAA+D8AOdF08PyOqQX6HTz-bWZmyB0bmKoW2DxYtnGS3g72aWrA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 4 Sep 2026 11:11:35 +0800
X-Gm-Features: AcwNN1VSQJhguJNnq06i_90XVuMC-oTCxeandMzLTYM0L_HXyiYFRb-mCLJw1rE
Message-ID: <CAA+D8AN=ZSPDK0HahaD_Ki9=RSfofpTbphFz_eestpZvmFpYfA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 3:41=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail.=
com> wrote:
>
> On Fri, Aug 14, 2026 at 3:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > On Thu, Aug 13, 2026 at 03:00:16PM +0800, shengjiu.wang@oss.nxp.com wro=
te:
> > > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> > >
> > > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C=
).
> >
> > Each one or only the newest? You will be getting the same questions.
>
> Each one.
>
Should I refine the commit message with a new version?

Best regards
Shengjiu Wang
