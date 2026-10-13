Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05C23F105B
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 18:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917530; cv=pass; b=OhDyyYqCBOXGHkxw7+c7yPdaf/ReSmNTfP+VYWpadCGUNVLWheo6PXsDFF43qXCm0W9qQZrn5qJjoz+QN9++sIS8q+q48PpGJaW/gLoSm68TScL8fm7yiuWNp1DDmBtbDicw5e3Obg6oFmZQ0ZfuyALVoM94GTpB8seKO1grCgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917530; c=relaxed/simple;
	bh=+im+AEx7lmLFFl3TKmYtdweSJao3sR2Nj9klyra3ciE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OEdbu86lIdjz7rd6vZEN1KAQjaPlRNH479uU5Mzmg3CeDjXEwpuERJtdG3lzUCeqwu6k0pWlql/1gJIrGWo6omiblUCv7ZwC3sYlB9cqfFj6pYIq5xpfYMYMWsTdNZmXMdBSh8H64YP0Ze59380nfBcpMU59KtTIGJcPP/MEwSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PykzCV8x; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PykzCV8x"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33e6279a1d7so1611475eec.1
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 11:52:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791917528; cv=none;
        d=google.com; s=arc-20260327;
        b=W0S0PbUaWQkMnGR1f/HFwP8pCIV95g+AzC2MHBgbhVmFi4z+3qQ9YNPMKnwhGEhXOY
         PKOXq1PUxeMhwL6DXKWGO8a16+m3hS6x/ldFYCpvxf3S0JhpQBHy4jNSyfBS6oeIHGGo
         sVLnWRzhVA9kaA156HXvnKwQn6JBOphE2PT3Oxe/2KxIxnzfBaGr4PfhLP6HB3b6qcvz
         ROEqPyc9RIOTj1qHxMNJDAqwvpzobQyVtxModKZ3KbOroSgX4uVOWcnfsM+vpg03FDax
         xNjJJQQrUcNGn0RjasUBU94luQ2QkdqODfwLyF9E+pDIQCyK8i7sujF3QQrbca+euIZI
         W4TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+im+AEx7lmLFFl3TKmYtdweSJao3sR2Nj9klyra3ciE=;
        fh=79EX+k3Xjqx72eh6ldeCgLTwQX7DPHvvBnOuusSeKWc=;
        b=M4T6Hbg/piMUiWwy2cctNCHsrctwZEeycP8dYKHO3aLFMfuotCM+a4al0bZgJe4u+5
         EZpazxxz4E/dODEuKDW9sfOVRCwtMCm6rlu1ycASbd8d5NtzBf6a0ExEKykLWz++/jzy
         XrwOXVWQcS4ol7Luiw1Fj7dpmkxkFKVgRp49VD1ZkfaQBkgT1Rju/QnLSgxoNU2utlXE
         rOWW2HGqWD9cvBohq4DAyLNI/cqD2E6vlkPdeYpiDeXHFalaKtTzugb9eaBCbXUA5Hde
         qMgPNpsC9XgsEFEp0Bm4zpfXH3NvUO/Sc9u5s6aQYRvCtF/caG9ZFxw80waKGKIoDJg1
         gwCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791917528; x=1792522328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+im+AEx7lmLFFl3TKmYtdweSJao3sR2Nj9klyra3ciE=;
        b=PykzCV8xwXJqSXdgVUotqocQd/VuQdr26NM5/m7EPp1bIC5NZSM4Pq8x03fGAnniTL
         FHg+mSdlQ7C6wzK0+yLLcHF93JJ1oT9mfy2E1GHDoxUePwyiUXJ0hjswwWyYcoUWjmmi
         X9+UEeJwMbtLwTw4Q2sCJxxmZkBre1dB82Zf1kCBE9I8o/HvVW367tpnSj1sGarOvyb3
         jZt76q+yxQwSYf7USqjXNrr6iQieQtsqdRM3NVZ1xRDc7Zk8CKNtdlHyOJSJe1SY9ZCL
         CFQ0aZTT0I7pHiNhfNuHPATrx9w8+3kc4YAqfsBly4ED1YSmBQv/AFj/CwNl8rdd5Sfm
         GuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917528; x=1792522328;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+im+AEx7lmLFFl3TKmYtdweSJao3sR2Nj9klyra3ciE=;
        b=mH6qWnFpJYHGBO2XmQqNGmsz1NNpa4cv1v9raofDVKjRv8saNKaTO1Vch8ORC7dtQP
         joPvToX/u+8jhOY+iUEQKZaxw+QL05ul5u0Y8s+vqLIhhqmwTOTpjGyAE0gyP2neEf7y
         fb+1Xe8djldlIJV82o3dyplBKoQdpUF/DvC16+Eh2lMTKuWwd0WuXKHxokdjaYZpISj6
         wUqPLMAFCEz69xq4ZoXvByh/7ZoemEM98n4N7pTVSx/2Z6mdLtyL/xK5kdrdcUMRP0di
         vkCA+WL2MBU0b5FLE4naum5WLRnZUXuY4mRAktPPr/VdfpvaJbNsdA0Yy8o7nn0Vlz3L
         4zWQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0N05+h6tWxUBZPTwZ5ldrT8DzPIJ8YqFvXdo51veq/OVzl851SthExbZv2bzVE6n6b9BSDsBKvbsIyA==@vger.kernel.org
X-Gm-Message-State: AFq9FYK7qftbEZqIiQPpSlKm2MnCd+dZTuIVqpVAE/yw7Acgsho1Gn3H
	xyTXV5PSDV+/Sb7CFgVYiPur/pVed39rdXzQVxtpENDGQgH9SCmtfnyaKDz4ldQnpRJ5Qndbe+X
	04i1bkMXZPyeDuHGFyN3FGs0LAgoXH5s=
X-Gm-Gg: AYBFou3HtgyJSmSl/hs2ShHMzLyoILUfQp5GoQJvWdVtRGoRHuRswGkkNaOPLe9LI5j
	6XeD9LHgM6bzRUx6dxEChmNpHYAf9ucjsC8vxtZDwMLeSQNV7SX+lZfeFMx8OFWd1kfp2dyGIWL
	LTLs/TLypODP8a2OPaoTPgxa7rtQXmLcUBa1PsqVh8JADP1gov9AH2gA2LIid7HL5LZMLbe2Abk
	vhD/LDBLoSEPCAh3K+JtC87Q3Wjcu12tFKgP4fcoPvwK60wjHMhOC6wdEPhx/oV7Bttaym1yHfd
	jVliqoGGqMcL8i9RDdrk93+mitiX4BdrqRG1f5LIAtahJH4gj9yqbglwvGDFrPE7oqXBmvyMmlL
	YpcR1IZcINdhS
X-Received: by 2002:a05:7301:1826:b0:359:866d:5bea with SMTP id
 5a478bee46e88-359866d78a0mr11573580eec.21.1791917527892; Tue, 13 Oct 2026
 11:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013184755.530392-1-clamor95@gmail.com> <ebfcdeef-d0dd-4c4a-87bf-4ef3fd505b5f@sirena.org.uk>
In-Reply-To: <ebfcdeef-d0dd-4c4a-87bf-4ef3fd505b5f@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 13 Oct 2026 21:51:56 +0300
X-Gm-Features: AclHuK_7ZOUl5RxszrSY4QIAZk7C80MO8yjqs5R5Q896yo4MQyJphMKMAjW3tWE
Message-ID: <CAPVz0n2ZY1L=kwSkjLeTYNvDA2Gf0Oenetj8hK13g6+qf_xnaA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2 RESEND] ASoC: codecs: Add support for Fortemedia
 FM34NE DSP
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 21:4=
9 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 13, 2026 at 09:47:51PM +0300, Svyatoslav Ryhel wrote:
> > The Fortemedia FM34NE is digital sound processing chip used for
> > active noise suppression mainly on ASUS Transformers.
> >
> > Resending since previous attempt seems to be malformed.
>
> Please send a new version if you have rebased, tooling gets very
> confused about which v1 it's talking about.

I have not rebased, it seems that format-patch malformed first
iteration. Both patchsets are made from the same commits with same
hash.
