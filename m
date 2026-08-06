Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA4838E8A4
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 05:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785994092; cv=pass; b=UToD9LD81cCdXcUSoHPpiFGqOIUlKlZgsd+WFnSdsuXiXmF5vDc0xSaHjzBJ4+HMySh6/hpkOUM/Lmke9sAxi4W4MbCPqGXdueCsNkLS6l6xwJznxe0zyoTr8EhCBx2LqP8Jt6CANFSLHcDKnut1rOEtpyrNy4T/l37kcSyvzvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785994092; c=relaxed/simple;
	bh=eQ+aEV/7pu/3GaCoFwag/RdEt/0S2Jc3568qzh4F/UQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CEbB2BMqBnf8VrSs12LFuyYP9JTg7Ik8g16PcqtCb4vV9swqrvDh3gj817mzawrgvgn5YRwOts6I7X1ykY54DFX8OytzLD3xRCo9bfM0sAUnieD+zGAuaSCMN2u3Eb2FESFl2J6C65lNjg+4+4lGDTtlShhCkdYsMPP81F15jDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFkhIWct; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFkhIWct"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2caced6038eso6806775ad.0
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 22:28:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785994086; cv=none;
        d=google.com; s=arc-20260327;
        b=jrn0xC9H9aIva3NPdtfkzas5hsgYpOEX2qVU13nHJt98u3Qeibc8TDZ9HayW9T08kv
         Ov5KJH6QzR6JXUvDbmmASC5wUTkISsU1UZyGGgWHDpjwj8ceQENtpfqpn3YlrigmwhAH
         PTJruiAY415rf/2wTPG1S+f88JJH+G00ueTThKE/EjKPFAHTDo4dpXceybClKq10hApq
         AAGnt1wkv68bS9sxYVoBznvQDP77Nk5aScnRXu+uUBRfYZgM0zgOKqJMOt7GCOFqbUH8
         0ljXfpFF+pqxknroPXReSeqGNgLxvwVzysvU8IU9u43DFv7JmslNUPmyGdIMz43c9FEX
         xclA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5/chxC2eDdGa6xrgCohNp7hs/WOpE04paX2N4M4f+KM=;
        fh=bddB6esDO2pQxw9BIUk8ZQ9BgCYt5ltN8ShJZjZoqlU=;
        b=DGeZsOm58SM4jcYCwlsi/DzqGwCyCXqaS3ZKgnC4/p0VEUgxGCj+BqhpVOigXew/EW
         535L6ubgUMRpp6RsBPYbKsz7EqzhQ3TIoxFWPuw/6p1u8po3LObrZtEjUhHV7pzVFapT
         nYjnW8SdcpDVkxcNgu56CbigtZIbsS8E99hB7fUy/gOJ7yWSLKT3ef3zT0ne9CXIoLpZ
         HEEyRagtcHDfmWcs7g5G0+IcsPJjyCAks7/8+qZyINak/KxUEIGOkmQ0zofr2tuRIpEI
         fHJKXepmrl6y8ZYQ8QnB4R1xXAE03rxNdw7GBsR8ldDFUcaLNjEB1bDyJl8GQ11dyKhr
         ZM1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785994086; x=1786598886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5/chxC2eDdGa6xrgCohNp7hs/WOpE04paX2N4M4f+KM=;
        b=SFkhIWctl6AMl+XMhiyiRjSQiVZuYa6fIc012iOUhcYGp/J8lfkiaC5/8OKU6mNGVg
         FfHrapp7wDvoYnAo3glm3wVqL7VkpH9IfAzwypBatMRjpMiZsoOcvOc/Bvu86xk1EnOg
         KZF3JCQjZrL1VKQf6K1MN/qnFvPIIIUTodctl5+pDFbGT7CjLMJxKqEfhL5CbXmD8P1A
         pmjo3Xs9u20fX+1B4KqoRFtaEXianCzFMERV8sgNUBOTudJCjEPoaFsIJZxoEGgHZTpy
         wvcFr6TJjMtEju9XDiGaP36qe4EUNNe5+OYpAHy0m8HBo4UIU+92KCnrAVqNrJ5o+0jN
         o6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785994086; x=1786598886;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5/chxC2eDdGa6xrgCohNp7hs/WOpE04paX2N4M4f+KM=;
        b=DtQDPms8KpOlxZVcymgnT39JUYDNrEO2BNCMz7kKiBjgj9RagyUHQDV/qnH28rJOSJ
         hi4PY9q/evQ4gmL9oBmM3ad7vnqW16WLl5Euniiae7uzZ0RtYu+XZuES9qNZuXrQCaOs
         NtydJu1W7Ym36c6jEp2bmiMb1yQrdbUiLY6LCJJY10trQVX6yakH+pTT8B3W+v8E30VD
         N4MWDipFtcjiryWgs+qFAZiY5tyqUyV5cDsYoBS9deFSgYJBBvGlVNllPfPFU+P71LZn
         R2qvKv18MIu6SeW8U8wCfqDOeSzmZHnlFiHKCPvD/DXbnNX3y/oj/7p4mZ0cvu92KTIw
         8oTQ==
X-Forwarded-Encrypted: i=1; AHgh+RqogYL3/uG5gTGuJJE4LZMHSwh02YPSu6jzndtc3+X5X6hI1j4U8vRHrM4pzeK2wIvlo4mByaNdnseVjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDn6d4d2N0P6VzW1Obcjt6/iOqoj8kG3Th5LatBObnqXOsjlhT
	WrrUaPw+9vgG8aE5HcpZ9G/NeF/lSyWnhjogApzlcLdLVVAp5XNNShBv55LeFtuRM1z77yxevJq
	i56uUYCes3alH5weHX0HfUwNw4HX4Neo=
X-Gm-Gg: AR+sD12KgOvgvKnQxndyErVoYhWXO1dvou3lQwU+UFusmoeByq0RRTD0sr7VAHpe2Ww
	fozL10WlsHAW6FDtZbTbrZGR2fi/u3smy0AaE3fzJZf3XML+7EhYfD8ckjMqnCVOsvNfMPhbgJI
	9yqNjR24rdV0g6KM2QzTIX5dqSMbeC696bRnNe1lJknsTXcq8phjQsEp+WvnyMwh6s9+4Hfqin2
	kGxP84g6wJ4wHo98UkYVwfAa1cMUBiHODGF4Y9VAp/BDJEd/PDvLMHecn1XXBMF+Af6/ljqDzJC
	GL8ZvuRLDKFgPgqIne3JYeOCh+V1tfwUtWT8qSIHnZ/8
X-Received: by 2002:a17:903:228b:b0:2ca:eff:ff58 with SMTP id
 d9443c01a7336-2d0f710991amr9793645ad.15.1785994085793; Wed, 05 Aug 2026
 22:28:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-2-shengjiu.wang@oss.nxp.com> <anH5i7y3JkB1moee@SMW015318>
 <CAA+D8ANCoc5qOUvTQPRNkvrfqAY3n6x_fbfUveP8Sfv+SL1NVw@mail.gmail.com> <anNtgkZYhoWsSRr6@SMW015318>
In-Reply-To: <anNtgkZYhoWsSRr6@SMW015318>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 6 Aug 2026 13:27:51 +0800
X-Gm-Features: AUfX_myhLzhOuWWyjCG9X66ATeLQftPHIJVdiIW_bTxwa_fBiVstKxt6vFHm5B8
Message-ID: <CAA+D8APMT2eSgrc37n_YZ4PsDZ-_8h4gHsyhADGGYDpTob_g+Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
To: Frank Li <Frank.li@oss.nxp.com>
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

On Thu, Aug 6, 2026 at 1:06=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wrot=
e:
>
> On Wed, Aug 05, 2026 at 02:57:59PM +0800, Shengjiu Wang wrote:
> > On Tue, Aug 4, 2026 at 10:39=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com>=
 wrote:
> > >
> > > On Tue, Aug 04, 2026 at 06:02:14PM +0800, shengjiu.wang@oss.nxp.com w=
rote:
> > > > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > >
> > > > The i.MX ASRC hardware supports up to three conversion pairs (A, B,=
 C).
> > > > The existing binding exposed only a single generic audio-graph port=
,
> > > > which cannot represent independent conversion paths when multiple p=
airs
> > > > are in use simultaneously.
> > > >
> > > > Add a ports container that enumerates up to three sub-ports, each
> > > > representing an independent conversion path:
> > > >   port@0 -- conversion path 0
> > > >   port@1 -- conversion path 1
> > > >   port@2 -- conversion path 2
> > > >
> > > > Each sub-port references audio-graph-port.yaml as before. Hardware =
pairs
> > > > are allocated dynamically at stream open time; each active stream
> > > > direction (playback or capture) on a port consumes one hardware pai=
r.
> > > >
> > > > For backwards compatibility, keep the old single port property but =
mark
> > > > it deprecated. A schema constraint (not: required: [port, ports]) e=
nsures
> > > > that both forms cannot be used at the same time. The binding exampl=
e is
> > > > updated to show the preferred ports form.
> > > >
> > > > No existing upstream DTS file for fsl,imx-asrc uses the previously
> > > > documented single 'port' node, so this change does not break any
> > > > in-tree device tree.
> > >
> > > if no existing upstream DTS file use it, you can direct replace with =
ports
> >
> > That is to avoid any downstream use of the 'port', so not directly repl=
ace it.
>
> Does downstream strictly run DTB_CHECK ?

I don't know if anyone downstream uses the 'port' or not.  so keep it
in this file but
mark it is as deprecated to avoid any impact of this change (add 'ports')

Best regards
Shengjiu Wang
