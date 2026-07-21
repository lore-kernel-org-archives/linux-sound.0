Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442223BFE31
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 08:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784624296; cv=pass; b=fpNI4iIZoG2RMjIdq94I/cXZLMpuRm4XSdksw4lOCXlLJwX3Je7y0byH5ZyrpCMNxKPKgtYJQlgArji23P5phesmYTZpIBoTrWlUy2dZwvX3FcEC8xZOSriT0iYd/OHa8dg7NqtWP5YMNkL0fteas3IAlstObvqnsqRgUMxbK0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784624296; c=relaxed/simple;
	bh=o3orbY6NhqfjfstnAFooB/Z50XxpaSPbmYmh8aGbV/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t5bZCqDPi0DVz/oh3Sw6nZBwKfPW6g+YmgXxfHLfkx2RJCjNc/YliHei2eLE7d8jAhQLWFFBrR39jnyj9dd7mP3OErq6KiWrejyHj0KjmmPYpMYU6mL9Wj7Kk/eHufTiPbsc2Z88TH3rzJ44uhzhavJhNKzEunxAxTVmo3Im7KE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LxL0a9/D; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxL0a9/D"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c999f162c9aso6930787a12.3
        for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784624294; cv=none;
        d=google.com; s=arc-20260327;
        b=IhIDcNmA6tEQBBtC2P1Vm32nN1uy+uK94XOqNC5exmhHzjAwVLFV0ARKFUXBDT4iQ5
         kn74Hog9w8f/4BNkNCHBcAg2drziRioPAk8uqSK7v1ZcQWIyKdEjRpBF6N8oYaUULaBR
         5XqtsJWdFSQDDSBa22TCm3ZkI553W4STjw354HTflXww3H4/JIEZHETdNUdihUykEOIf
         gBLwBjG9fb5ChXi7svaNPCxaH9HAoeUEVV7dJ3AL1W3MtNFQPDsYOs2oAX6dboT0S8w5
         jQwlTf4fWmFCOWgISBg0xDldtP6C4ezGhNiMHunBnYaVIwEyExKrcArZXp01CwWtpiwH
         Im8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o3orbY6NhqfjfstnAFooB/Z50XxpaSPbmYmh8aGbV/4=;
        fh=MZ2CkM2IRr9eia8A0bQ3tBzaN3hZPoaF2QBmLRfPh7Q=;
        b=jaeunpcLrf7jVSai2th2GPJCjb1y6lZRlsREy5Gv1V4TA/xkVXbHF5X/MryXagXZ8O
         hy05amsk4PWmDRl2qzo+iCz7y2FCCGmDMRnvd4oPXxe3U8qN7rVkZ5XSMTXmvKBXkic4
         Twj5mCnTqge43q2x2W01NHLj8gv9lPdaRbsQTfY9dy6r18lRYomexe9Hks3RqAwTtpLI
         R0JcNNn5d6Qk95KDgs7s8jf3jYjBNDIiDp7MZk+lYt4l2IIWB3XgQYfKB3Qk/hz3RoP7
         df3t61cbkGERaxLr/0TL7/ZIzsov6FvufIcEfpmTuR1E48fPYZwAqwofi3UvSYoAqOGy
         SeeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784624294; x=1785229094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o3orbY6NhqfjfstnAFooB/Z50XxpaSPbmYmh8aGbV/4=;
        b=LxL0a9/DFlIrk72VVKtWZfnFf97H9o+9GsVmwWk4vcDneFP7p9kl3GPNVDd6H+u/zD
         F+C53FJpDkJzez5gk/awiXkvEbHkND4khZNVndSsBu20+O+o56wRIkIeDejphwaFUJvf
         9WvA2gqKh5eFjMou0S5s7SvfmnI++Sk00al4XgfBQNG3xsLx5zgmpdrLOp0YU04Gnll4
         nRgGAhoAvexgcWq7faoFbUsHnCllKSqGCEO+XvZO7zjymWAw/GGlnsbs6qWNDc4NasLo
         0G5tMprhCVfut1/DcqHZrgGkK0dCzw8aSH6C4BOqAEP+/ldmS0mXfxbzd33kEB3g2woA
         qnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784624294; x=1785229094;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o3orbY6NhqfjfstnAFooB/Z50XxpaSPbmYmh8aGbV/4=;
        b=olHDhPkLQ14EjmRHpOgOJMB48FfgOouNcm0dFBjelFVSNrpPmw2381HQXzHJOMnKlr
         IS8+vszrC1oaZpxdEBvHSG/1nx7CbR28wXmqroPncZ6tQERIbchMXwLMZguNlVe6dEwN
         wZt791KQDq0rCcF2L141HIDcRAhLUk25d0IZH0JSXAG1pD654nFA+TWYpzHrbfgv6NTk
         qJdXY3KCyqwl8ugJ01YrZLZedsWbQ5XjqGM/etRT+ZnsQ5eJuruQ6zNzTYFxj0upzwBG
         wDlnE/hhm+EVJJdPiwy53FbpKP4zN2L1aqMmQkx6C2058NHrJ0keu7ZHfQWs95P1AF0E
         Q2EA==
X-Forwarded-Encrypted: i=1; AHgh+RrJhmPEaTCB2vNcfK59KLg9/w5yxSnFhaHUt0MonROfHBXN3I54yOndT/87Ld22RW2LQDEI7McMuqMWYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5q9shPnnhsjSXnHKhjf+pRRFRRB8abFWFdOlAWfFL21v1V7l7
	Sa9QuoWJkT3PxbIRoFkOkb8xcKW/kl/iWMD9ubkCjN/BJjHgNL/uMgAKlYLkQcxzjsJ9gFRLUrw
	lj8GdJONfPxSRZZ8pT8cHVv/4Y59kY1I=
X-Gm-Gg: AfdE7ck4Q0nFNpMAFgYif66hH9R45FQN+VTtrAHEOmmnMhzs3Pd8lwyOKp2ADdroGU/
	Fgqi+l96E+8jp7tKrll1WSamB9D0UPzE5ifeb0LKrdP/TSg6ZpT2I16w7g8meI0nRJYtcxbbzHl
	L1QRRU49+SqSAjHdjY1lTHqOVcZFXoyRRc1XAORWI5pi1eIYZorHJBJtFQknSY9DhGYrZWRnIKR
	P63Rm073/x6TqEM0NLPFnr7KBH0iqgrahGGtv1RXDSQlhY/DgimZFJIuKtM3TpswdhcXlBm
X-Received: by 2002:a05:6a20:734f:b0:3c3:6af8:ab24 with SMTP id
 adf61e73a8af0-3c3ad9d5fe8mr19173494637.56.1784624294467; Tue, 21 Jul 2026
 01:58:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720095450.1618747-1-shengjiu.wang@oss.nxp.com>
 <20260720095450.1618747-2-shengjiu.wang@oss.nxp.com> <3ce4bfa8-b051-40af-9478-00540019680b@sirena.org.uk>
In-Reply-To: <3ce4bfa8-b051-40af-9478-00540019680b@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 21 Jul 2026 16:58:02 +0800
X-Gm-Features: AUfX_mxyjKglcWDGiHlL7pHojtmA7GYBRqbKLhdnlf4NA0C5KwDC9Zvpc1PZDyM
Message-ID: <CAA+D8ANTBSgzhEQ-fsj9jpKnOBKCQiJeY5pv2-zck0O4DTM04Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: sound: fsl,imx-asrc: update port binding
 to support multiple pairs
To: Mark Brown <broonie@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 10:28=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Mon, Jul 20, 2026 at 05:54:47PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).
> > The existing binding exposed only a single generic audio-graph port,
> > which cannot represent the individual pair endpoints.
>
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Thanks for pointing this out. There are also some comments from sashiko.dev
I will try to address in the next version.

Best regards
Shengjiu Wang
