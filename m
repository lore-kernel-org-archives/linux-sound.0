Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06173191BD
	for <linux-sound@vger.kernel.org>; Sat, 27 Jun 2026 10:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782555977; cv=pass; b=IgBEjsULhsbWfo+CDac1Lqwu+quH/+met3qVbICxrcuH220d/WqQIClYiYXVZefIiCojPdaJJA/omRGtHDMQmuFrKsh9+Kr8TSoP+ILhm+oZdugqeCYk2eIROd1WdtlzRVb6cWNuqM9WdeoJZxEbh9ETDXlEBFZc6C8wmNXa/DI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782555977; c=relaxed/simple;
	bh=Tyzwc5vQV/Bc9l6Q1lrrqMverf6XUl6aFPZAG6N55h4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VY0Wm+vANjn7kBfQlpZ5p0tk/wMQxpZwiKGL+jZfUz4miss0ilBYOM4DOOC7gGYcwS7gY7tjWjC5O+fqq1IrVm1jOfhiZ6w/XFsZmlnkq0L1jWDKr0db1rqCgcfgShrGUzAvCdtbaqE1Q3t9sdQw3K/5ibnkI6/3YO/kb6KCjTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIDeEt6L; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIDeEt6L"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c1226a096a2so184420266b.2
        for <linux-sound@vger.kernel.org>; Sat, 27 Jun 2026 03:26:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782555974; cv=none;
        d=google.com; s=arc-20260327;
        b=fItxd15Foo/Nepu2ZF7gUnP+P4SAkRJ6xtExQScRrjKIG+fKIk/tawEprcRdwrBSZ/
         j8hbRQO7GzoJ+U2PS73bb1GdxahJaWJu0RPoZzGhb//0Rtl+nPBaEnl2AbtldCzVNaDJ
         o1xkCkFUlE5Le+iXf+92971/OjzxmH0vR97vN9TcsJaLmtRFyqgN9CprQ1PPdauNfIS4
         g0Z7RFgGl4ucSBauvrJOVjTFqrRX/RJoyzko2vhGDIUeQBk8cNfYY/iNTDhYO5bjyjmV
         WB+1RMggZHzxc2La1pfFyJ4osCd/jRxxv80iGv3FHw4dWlPLmNCmFE9uDbjErLbax6UX
         WfVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dRhdXkzmky4M+xi9zzW6VsYPcQ71AzXk59h10EkBcIU=;
        fh=0oIAYrDNuBxASd+wwY/d5PwxUPyhQEPS24VQo4Wkuco=;
        b=k4CPAdwK/+gtDIW4M9BdUM4L1lFcKm7MmyiW8CTAvOwhYGxKfcaJJ7/SROxALhmele
         uExL6ZcUVOVn5b2gEu10RA89hBhaOy7XjF4d1zW5ZDi7p++9YK2iFXppTK9USfty65Gg
         iaFkBdk3yykTzCMJE5pVufNBc0vUa8lXgnez8vkHlnCvlwrYdJ4evj7ERwYy1br3TfNA
         jA7rGn85Vu4ZyP77vmei+3IZfTfW0zZQ8iseQLS9/OUDLscpZquHx0NB7LUnuwf6hjpN
         1jtHQErTrt3HSbqC3lgt4MsFvl68mYo2Pic83RBec0kgrGrGTr1BXRV9M6wdNPyncG6v
         POww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782555974; x=1783160774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRhdXkzmky4M+xi9zzW6VsYPcQ71AzXk59h10EkBcIU=;
        b=lIDeEt6L6zmwCTms5XMYXhD/cHQZEZUtSaVgKv63MB+5NJYOf9zGHsGy6J/Y7bfDDo
         EO0VN7yuesEuqe9LeO6AiZinepi1Xyqq2d3codOnxPj3cMSGVGFndgZ5a6Ima1Nwh0Wi
         XXYk+mzo+v/Gg1eVGT1C1tlmRDPzGtUyw1HNZDzIF0ZkgCqC6Ds5Mjt992Zi2N2OFFte
         ECG3hgg9VYPRtdai0WG+Q0SCErxtTPZb+qKT4hS55DqSds87JYYn77/yigaA5g8N4nyj
         3nfIbSJCcybXozl/gAjM0bT8StYVVf7EacFvZkFUJaKeE+09W4QySajm5skoFCMXzBrb
         8EgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782555974; x=1783160774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dRhdXkzmky4M+xi9zzW6VsYPcQ71AzXk59h10EkBcIU=;
        b=ct9xjJADJIggtu4o4ymhNTb4mvNx81CzhdzRshJHSCRuJ7e+htD2vTYuWoaX2N4C/m
         DtemwENTOQNqT+2vj3ZP3V1aszMwHaSfuZKAkFtcrxTkjzPhtJ9MSWz4yvwc6g1Eq1Ky
         hH7j2+b88/thuun8pk6pE7ZElWRLNMLCqeTTYNeiiNDL8xkw7x9SYEv8xDgnYQkYz4FL
         5R+ZgJOrry+5feaQsUcYItJmc/7SobkeU4+4j68hZk/NWrGDCiA8M8pRUxEL2gjOMSOT
         HviMsT2IlITk7G85e0ghAFdMJMkrwZ73IIRBUPvzTPCJtCQs1sTvDtu7BMHo70OQBk/p
         Hy8A==
X-Forwarded-Encrypted: i=1; AHgh+Rq2w7x6lMRITWDf47OlnlU/tgik5aIv+eEsVm3BBWS8ol3IOwwgYRlMq0IxJxkKJYgUjLqiQEIgMt4vYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyE5qGt+CGJ0qPYTGilRLl2MZuXrfbxBTZpZu6zHHDJeRTcflAk
	CcPIxfidLLRIeWGdpsaBa0RhNApPsKiFYYs0ZONQaH2e+P3EBQjcTNVyOpjrC+p2xJtkXw7noij
	/hkRn/JZzs301Sq+OQdIuVNul/bnQnAA=
X-Gm-Gg: AfdE7cmZWdyC1MK69e4xuTq1Z+dZekuraghBF/1G/Y117l9Jg9d1jIxQJGFubjdn/5n
	epMEXBHmyaVo3UkYhsNnplXiltMMDxhHMZSzu/Dyu8tLbyyYUo2r30aRVuH/AR9m/KACw+cpjxE
	I7obHgqYPmGeevkP5pVruLQSUUdq+BmkAMObi09Pd3EvkheHth6hFGreqq3PTgcT6UR8OBig0XM
	Dhv+fqGZcWEvVs6paPv/R7pL50smn+wEhEPIbn6rl5WvRGLwm4+XNugvVvZFKtW2Wq3aLXU
X-Received: by 2002:a17:907:944b:b0:c12:34cd:8f55 with SMTP id
 a640c23a62f3a-c1234cd90a8mr180840966b.63.1782555973984; Sat, 27 Jun 2026
 03:26:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782439646.git.zhoubinbin@loongson.cn> <71430fcee5951fb7a7d52e2091a87707db85e06c.1782439646.git.zhoubinbin@loongson.cn>
 <20260626-devout-vulture-of-reading-4fbfad@quoll>
In-Reply-To: <20260626-devout-vulture-of-reading-4fbfad@quoll>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sat, 27 Jun 2026 18:26:00 +0800
X-Gm-Features: AVVi8Cch4DTatr5qzfiiR0Q6wMEZ2Lh4BN6_B1AcmWk900bypd0wcNlkm8ktYOk
Message-ID: <CAMpQs4J=0i_kJHE_impCbKJHE8hVqDjNUm-cgkaUF_BsZ3QpUA@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] ASoC: dt-bindings: loongson,ls-audio-card: Add
 ATK-DL2K0300B compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof:

Thanks for your review.

On Fri, Jun 26, 2026 at 6:01=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Jun 26, 2026 at 10:27:28AM +0800, Binbin Zhou wrote:
> > Add new compatible for the ATK-DL2K0300B development board based on
> > Loongson-2K0300.
> >
> > Unlike others, this board features GPIO-controlled headphone detection,
> > headphone control, and speaker enable.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../sound/loongson,ls-audio-card.yaml         | 38 +++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-=
card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.=
yaml
> > index 8c214e5d04b1..dc7f4afbb777 100644
> > --- a/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.ya=
ml
> > +++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.ya=
ml
> > @@ -23,6 +23,7 @@ properties:
> >      enum:
> >        - loongson,ls-audio-card  # Loongson-2K1000/Loongson-2K2000/LS7A
> >        - loongson,ls2k0300-forever-pi-audio-card # CTCISZ Forever Pi
> > +      - loongson,ls2k0300-dl2k0300b-audio-card # ATK-DL2K0300B
> >
> >    mclk-fs:
> >      $ref: simple-card.yaml#/definitions/mclk-fs
> > @@ -47,6 +48,18 @@ properties:
> >      required:
> >        - sound-dai
> >
> > +  spkr-en-gpios:
> > +    maxItems: 1
> > +    description: The GPIO that enables the speakers
> > +
> > +  hp-ctl-gpios:
> > +    maxItems: 1
> > +    description: The GPIO that control the headphones
> > +
> > +  hp-det-gpios:
> > +    maxItems: 1
> > +    description: The GPIO that detect headphones are plugged in
> > +
>
> Add allOf:if:then: block after "required:" block and disallow these
> ("...: false") for other variants.

OK, I will add if:then block as follow:

@@ -68,6 +68,18 @@ required:

 unevaluatedProperties: false

+if:
+  properties:
+    compatible:
+      contains:
+        const: loongson,ls2k0300-dl2k0300b-audio-card
+
+then:
+  required:
+    - spkr-en-gpios
+    - hp-ctl-gpios
+    - hp-det-gpios
+
 examples:
   - |
     sound

>
> If these stay, because I have doubts. spkr-en-gpios sounds like
> enable-gpios of each speaker, so not suitable here but should go to
> individual speaker codec nodes.

Speaker codec? Sorry, I=E2=80=99m not quite sure what you mean. `speaker` a=
nd
`headphone` are routing options for the same codec (es8328), and they
are mutually exclusive. Of course, based on the current design, there
aren=E2=80=99t multiple `speakers`.

Also, these three GPIOs are on the CPU side. Is it reasonable to place
them in the `machine` node?

>
> Best regards,
> Krzysztof
>

--=20
Thanks.
Binbin
