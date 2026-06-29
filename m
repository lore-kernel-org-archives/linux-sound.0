Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C417E31F996
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 04:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782707752; cv=pass; b=G0U6AdDaphy7/aJI1UwoxUf6srcbuxbs87C6bWCPn0SU9elfvhGwaMK4w+OW9BIFWyMS5BkL+fdfYW81UVKhV6AjaW7xF0scxuHw+HWHzb9nLUf5k41Ihto4wiU1GKyUWD0TIJVnwkyFCaAvE1wbgACkGkSnqq8AbUupyZdY62U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782707752; c=relaxed/simple;
	bh=2muzAUWj5D/JqlkRo9dFGKRFyLdNfyC5bWBard2rmAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ErY/c8zxIDzzdw3/3qks7CFU6upoDygs3W4p28VW+5lCMGFowIa1IHU1Fs12wcYpGcsncT5TW4VKrhG8IzLAhVnrE+tMZG1RT+SAZLiKjpnqfzJelCcgoi+NxZVAuItfvdTEW1Pcv8ZRmfdVuYHskcoeijrElFdMWPY7YVdAJMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cke7R4uC; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cke7R4uC"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6983d3dae7aso2755138a12.0
        for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 21:35:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782707749; cv=none;
        d=google.com; s=arc-20260327;
        b=dED5iKAHig8ry0mcMmDdxIaF15b/xSSqFKdSTmVNAf/UYR9tSv+ORCfm6FrIByCdAX
         G/7ousR8dcXlFjd55Rc1vNmloDN2GmazGpb/0COzBYHj/E96Axf5jT/n+jJ+35lO/0w7
         LkjiAFaHNWe8byYylJ3m0hgsI1rnPBq7szE2GAGCELMYO3OymcyVAzC2vceIxKIiyFZq
         q8RlGuRqNEGly3zrHL21InoGb7TCXF/ipJEqDZy4PoXbFnJoAAJ6bRXByDBQvkxxEKbl
         MtUV/gc5NN5TQcZF68fXZxrAdGxPxPTmkIV9TyJtK2WhWDIYkW9womVTNdR7ui6F26TL
         qgUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R9/v7FkvKXdZj0GFin7tsYJbb7xrv9WwRRAkYYJomJc=;
        fh=MSQQLJy8IIfuCT6mDPGU6Au1bBSd6VsWsdVlAFO+wVQ=;
        b=nfRyzPjvihnZMew+DbP5L0s187RE3V/6nVwFN0vmCNo6l434M0OBltGoB4dmMhvh/+
         wAusM3kstX5zjusL9+h900nmwwod7QprChyKauEJopZM9xme3mzwMSk1Ro+gbJI0r5Mj
         2Z9GTkU53PCKJ3gPAIvMmpcgkOe5+V+XW2pVwlkD+QSTagRYSWPpHlbPPZTw79eYNvkI
         1LwfYCd8U5Zkhw55zGQ0zSfU8a60L3I4ZEnjybYNbfI/80Mw+lGruQ+lKNSBTM7/LzfL
         Z819FG3J25sfR0otgPibBjLRTIhbyG59A6VZ532pGgUhc43GWW03Mes5oDIA0vQK3iBS
         3u3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782707749; x=1783312549; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9/v7FkvKXdZj0GFin7tsYJbb7xrv9WwRRAkYYJomJc=;
        b=Cke7R4uCG1vhbqBjXCjc/v4EXI4YMpkpKD0y0w4636tspXObYBtpGlC4aBEe2m1PSR
         0z9gMrmgV1B/4hDQiOKyWVEanoxXOGL/TvSU43KeTXaQeHR34s+aJU+kFZkm1CJ6S1Mr
         KN32YdmtjNVD5lMlvE/xhK2kERmVNDFwLLXzRp3M5XXaTU84yysbLbCDb+bzJrGDAQ3q
         5+RpC4loJzXCXg7Qqk91hkC53ozjXgk6a+XEG4zufxSx7Mmqc3VpAVGsttV7DqEJlRpz
         gFEF36PlCXP6LH7S6kwwuh+NhlC+JqDv6cS4ZH3zU3v31Y2s/I43NeJq/0b5KfnIemzf
         KbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782707749; x=1783312549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R9/v7FkvKXdZj0GFin7tsYJbb7xrv9WwRRAkYYJomJc=;
        b=UpNlLYzuiZr5DUt1esqdC4n/5fNieicG+jiuFSdkOqoAs9JBEndAFlv/2pIlTi9RQ8
         uHSgjMsVaf41JRUUqKYgHgtpz4fxAJ+InhkpSGnwgvXiQXex3qegRa47RV8p/87aZJTG
         AsCqc3FLdI9wKHqS+rdBoVcjixb1CpFL5oAbAmJQCebjEN8sUen6gku5ekPUvTilsEWs
         0Zzq20sbBF9Ef4r5K35Wy60b3CZREs9Qo7h2GeDV8C0mF8dhFCJz8XvH3TF6vlGKzF/F
         MrwiYzY7N3UWn61CEzYVvVOuVwtSwaLFJULSzrihrha6oEtLDRrOd2azLYB3JM7W0iPh
         hKaA==
X-Forwarded-Encrypted: i=1; AHgh+RrJDyF3yc7/pI+sDF2+SprCEX2Smw+4+0c1iwQ3djtYOszZQRN9xkQAQnSyXH/bq1SDjX26fKeKk8b5ZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrPsm3534dtG8xYIydSoporPr7GCQO2FJtw6mUJ35DbpecuzYm
	ltYBQJxx7EB8Z4CErTDWoCDC4Ujdo1e7DhggVaI048cb5lUQ3CfdEOxkCeMyOTvHZ+f3832Kz6B
	z6nuE9WKT5KaqbIay4VqkjyMDoocvuqY=
X-Gm-Gg: AfdE7cmYhFqPqS54TA/Tr8BtWtB3d4ACPM/yzTnAgPrLU/eGJmR+PojNYSYQaeHrhxA
	j7Qlc7pF13EuYH2BZulVReIrxoMNYf7Ef0n+upmIB9UNIgk4/fx5YBVu+RxJI3S+pzLb27TqOMZ
	2+AKahs0t7TtM4bP90+mb/0LS+20ooXm7P03zll1Hm9EmH0oqKUQBUHIIkw/ZOXe+EXWPh2izLT
	t1cKE0+sYVa+zoATTKz5XP2brisWvHcf/Dz0Wi2Xv4ksbWyS7XDRKbOdaQLWObYa3YoRgnZPqhb
	M/+cIxLY8Q==
X-Received: by 2002:a17:906:9c86:b0:c12:3bce:c3c4 with SMTP id
 a640c23a62f3a-c123bcecceemr304395966b.3.1782707748954; Sun, 28 Jun 2026
 21:35:48 -0700 (PDT)
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
Date: Mon, 29 Jun 2026 12:35:37 +0800
X-Gm-Features: AVVi8Cc7WMGsN5EZIx98cF3b5b5_LIlSupnHTYu_LzUQSZvj-OZPI5GWvv7BNrU
Message-ID: <CAMpQs4LJkaLOPyiATEdEqFNNooUue7j6uJfCA68f0TF1=Qp2fQ@mail.gmail.com>
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

Sorry, the `allOf:if:then` block in the previous email was incomplete.
It has been corrected as follows:

@@ -55,6 +68,24 @@ required:

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
+else:
+  properties:
+    spkr-en-gpios: false
+    hp-ctl-gpios: false
+    hp-det-gpios: false
+
 examples:
   - |
     sound {

>
> If these stay, because I have doubts. spkr-en-gpios sounds like
> enable-gpios of each speaker, so not suitable here but should go to
> individual speaker codec nodes.

About this, please refer to the previous email.
>
> Best regards,
> Krzysztof
>

--
Thanks.
Binbin
