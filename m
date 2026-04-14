Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680FC3D5642
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 10:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776163276; cv=pass; b=uoRXAtzws72EmEWYDtNbfJsTTlqJfh3/vXpggTgu7Pm3IDKx0tfqDrsLNu/tRRFOfMNCq/VZ/Ox5tg3ZiQxyw6m0Fla/Bgu8XB6oxV16VboM3n0KlpJvyfSYkCVXO6v9GJeHPDAVAiaMsXLEDEfu/ClzSIrdAOpwa0HoqfMJK4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776163276; c=relaxed/simple;
	bh=FRJ1V4Rg7H7FZyF7SYOEYn6+kpQ3Ohx/3Kg30U4brH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RKA4Aa7nwxiCRtU+ajuyHhm+ER6VuA8LALcTkyn8D3s2qkKPQg/yC0L+0jEW6gbByHVbZVb+xkaOwFXO1c5Ajxy5QU9hyqVzp26IsxZOSg4njKZC1MPq/L3BIQaNKdPN/+9z7sUjmU7dxVV7dp+g2CtLDg45EcGQJQXbcf1mI6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcAtfRjM; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcAtfRjM"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35d9f68d011so3445949a91.2
        for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 03:41:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776163269; cv=none;
        d=google.com; s=arc-20240605;
        b=EPWAXlEj9I+UuVZnqXj7UKeZoXWKq4xep/at1+Udqb6gv+y/1zPsYysKk48rW0kS+G
         6YAcj4gjbgcfDuCGUeFc+f2oQumVLsDy24+Ak3rlCwa51QERVFtjo+lpBZ+FuxSFWi1i
         y0Zn6jUcWP/GhTlg/GfrxYo1gn0So8dINmv+9RQHvvhcFigRZbuC8Go0qb2m0qJjzij5
         19wJ6cnObrdM9qUE4zyVoSTXrFeyvJFNKNk2lTm7j8WhG+B8anAeNLFgmAqLIr4k+z6z
         4B7MqAvfPkiXTqPgmS9umwrxF0WpfhjOvu1EwFE9yvSj7xVRRZMBQxxOF//ShJZWAa8b
         i5Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vDpaKgtvK1gesz/aQw1mjbgT5u/KzUnIhgbKYhPDE5I=;
        fh=374rX0djHedlqFdda5MRxovtIDZ1AWvzyXn5Bv6LGfg=;
        b=lVmQLRS040bI9PY2mxgD5ipYLwchiy8ckudfTQqKiTVbUErVfBulBuZ+EpoOTwWO9V
         AshZPaS5/94vx+Hfp/XoYRdE7GpXVwW5635Zv9OdainhYQ5hpOIvOZP8PCQfCHOl4LN1
         ojH+OEWaFOPH5RpJfC/Ta0P2nPOnm2JjIHoZK6jObSniA3ZTBnq44HSHI0cc4NCeiqrC
         VdinRKSdrO8GAUNQdsrxZcg/vtCKJLRf5pH71CarylU9W3Yp2IR3ZloDorky9FmgaTZl
         4lLRYhtRCFky88VOOjK0E6n05VrY3UT8VouKQOMKGGOVf0yGCcoNkzaPGY9sEL/pWcxX
         oNTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776163269; x=1776768069; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vDpaKgtvK1gesz/aQw1mjbgT5u/KzUnIhgbKYhPDE5I=;
        b=hcAtfRjM2dJeBFRpJuxJpdNi+e623wV1TUB/wleAZufLFl7Z8aNx3UW2Y4Ax8rDVzc
         n4gUUJK2OV632+nekcK/1piRet9gbGYkg55ll2+g3LTd/ZrsQj2SiODm9TtSnF0yE/n1
         Qi7USEY7dcC/2rLFNCe7M4PLBpyya1DFiVN1T1X2XDyqrlTOzMbPnJJWoPCQNvDFp29P
         e9Of8oR7pPN9qORbiyhAoyGwg8+SrwE+Y4nCxqqLbtIeDThfy4V7eTe4IVbsHNQBh43t
         lSsrobZPR2L3go8lb6FIB0+n2QNqOxGQX8sMOM64Sc93Qsokbvq6jV1QxBWwYM3T5xUq
         TYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776163269; x=1776768069;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDpaKgtvK1gesz/aQw1mjbgT5u/KzUnIhgbKYhPDE5I=;
        b=fWoUE1udrwIeRZtv9RrBQEoFpIaCSm+9ZHotMwj8d/KE8zJOijtnt3i37q64M6AAbY
         3254nxSFAjkMmsmHfCv1FmCJ9BuqyPZRdu657FI6O3JN5KxYDqREWvI8HRMkEtA3qndi
         NKJTBHKfbPjYQ6lITmAoTUWkHbVE2zzeHRMZY4OYp1gMIuL3D0SLO0PwPKsIY9QwnfSN
         HvtTcjk436JsbMXmMt2zoH6mmeVwMvNsdfT5VYDHweh0H7Galy33aQTopz8qNXoN6OKC
         maTImRRA0mWV+F1eE2DFzOWnylTTYDriYVRgplCnJM1N88Q3CyjgR2OIfkdY0HVH9c4Y
         nIgw==
X-Forwarded-Encrypted: i=1; AFNElJ9kYnso8cplUiPGxriXC30FBZ9PZrUuJmLS7RRX9m3y1pdEbNopY0/5vQCaCbmtCn46YyTkJx3Ge0Sjkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+q57O5HH3MTMSnFu2ZKTOgtM/+ux7BnrmZXkvk769gbI+n4db
	z8Ek8uLXnCl+3GXTxCgy0WC3xMhza77cLYs8wP5hvRW0DdRpkqFLB8jzURstav5dpMvUUD4QSwN
	IofNjYPJEqujosx1fYZQFR+eqkHHs3Ic=
X-Gm-Gg: AeBDiev52QOleGfI7FkLB410KjA8ceoO/3yJiYXuJR9bRwuzznGcnGqs813xNPdIbSJ
	+hB823IdGLHtvF0FcI8IZBS4DxoGCTOGk0rhqAHIFk51x6/vTfspY2s7klCEtWROa2y7Lah5FE5
	gEbBRZgQcLbdPaGJ+02gzzbbXbOIvs0v0jKMjAw/uxt+Qg/51pu7cA2f9pNx8kaWjf58LuBvKZz
	CcBDm4vnPhi9qOgYQnHw0pSAtLQPbZHdLIx90vzDLDL6nu3faB0DBGl/Z3OuwHQMf071eVp2jWM
	1LP81oiCEnDYzGWSnzqbdj9N8+3HByFydNwnJQ==
X-Received: by 2002:a17:90b:3950:b0:35c:1695:24a3 with SMTP id
 98e67ed59e1d1-35e4281374emr16834509a91.23.1776163269477; Tue, 14 Apr 2026
 03:41:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-7-phucduc.bui@gmail.com>
 <20260414-funky-sincere-polecat-20b0bf@quoll>
In-Reply-To: <20260414-funky-sincere-polecat-20b0bf@quoll>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 14 Apr 2026 17:40:57 +0700
X-Gm-Features: AQROBzDyXFYNs7TrKIvlK_AGlBy9o7qpqavO_nNuacnjcjUFmQX1mxW8gHCuSbM
Message-ID: <CAABR9nEKGSRNp=eK=ZHf6-MNsj=6cDCy1YdbzSPrHyuc3Ux0Ow@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] ASoC: dt-bindings: renesas,fsi: add support for
 multiple clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kuninori.morimoto.gx@renesas.com, broonie@kernel.org, lgirdwood@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for your detailed review and feedback.

> Flexible is not allowed. Provide reasons for exception.

I understand and will remove this approach and replace it with
explicit valid clock combinations.

> This goes to the "clocks:"

Understood, I will move the description to "clocks".

> > +    minItems: 1
> > +    items:
> > +      - const: own
> > +      - &fsi_all_clks
>
> I don't understand this syntax.

Understood, I will drop the YAML anchor and use explicit constraints instead.

I will update it to the following structure:

  clocks:
    description: |
      Clock driving the FSI Controller :
      - "own": Main FSI module clock (must be first and always present)
      - "spu": SPU bus/bridge clock. On R8A7740, this clock must be
        enabled to allow register access as the FSI block is connected
        behind the SPU bus.
      - "icka" / "ickb": CPG DIV6 functional clocks for FSI port A/B
      - "diva"/"divb": Internal FSI dividers for port A/B used for
        audio clock generation
      - "xcka"/"xckb": External clock inputs for FSI port A/B
        provided by the board
    minItems: 1
    maxItems: 8

  clock-names:

    minItems: 1
    maxItems: 8

allOf:
  - $ref: dai-common.yaml#
  - if:
      properties:
        compatible:
          contains:
            const: renesas,fsi2-r8a7740
    then:
      properties:
        clock-names:
          oneOf:
            - items:
                - const: own
                - const: spu
            - items:
                - const: own
                - const: spu
                - const: ickb
                - const: divb

Best regards,
Phuc
