Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9CD54706C
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 18:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669670; cv=pass; b=VCgdnOG9zuwhbY+uOKRrQzVavqoRiwIJjDgwQ9si09Upcvxv/toFf4hRfVaMuU8nBiP0PQl/pUJy0l4ChDF08Odq3KxfzuIaluGF/wrFYoEj8AFglTXozixxLA48yfa7kTsoou2RPn0ajjSyUaGW8q06BfTUWwriTVrXKCYBBEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669670; c=relaxed/simple;
	bh=rYE58RTx04dPphYH1qsvIJA08dXH52av8eKhBOXbJXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=st27LDZEeP2l26KotHBKCqOK6eG7AAbaX4Sg5EehYgRpILbjAtP70KoBdsYVOqcNk5j+tUM2uxQu68fhJsyfsCXVEtefp1YoH8EsUSctEM828KrMxvz5SmokR16NZaArUS60EYSSmqXF/aBvNiqAXmgwWQwBXPlheHYxL3F8i7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3n7K5d5; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3n7K5d5"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f56039dso174797166b.3
        for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 11:27:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789669667; cv=none;
        d=google.com; s=arc-20260327;
        b=qnoZgmuOITmnOO2UUufWXC0yMNV4oVgfVkUu7X//eCvZ3xuYk1PmxjKjUBYCqlOLZa
         2hbbCHjc7bFVuygaY1ur239W3uTDm/g1giCSczoVE8pqPbQg0oLpe3TAri4FFBVwmHTF
         8SaYYC3PEdWWgbGpqFO9oIiGPkYK7lX0UmRNorZng2ltfcBDmiIqA4Zh52fseApPvJth
         WrtExZ8bqLu/eFEuDW2zvpBGbslu862ihNKTkKBCYstUQ+ihtJoJC497WGIWYXbcXItl
         zHxFz5mpHEwjrPFlOv3pCo/XZjaLXh1YXWP5d/xW9TKxluiVdQlmT/wfx0+ipW1AN7QZ
         bEaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tRt72PUf/XZ8nyXh0XsE8V2EqRfTqojcjnaq5ie03gg=;
        fh=BnpHl01GuIm2JwC/u2Adpv5hyElpUUspkiHIbTCeo/k=;
        b=mJrNltSVVDavG5Ze3oXA3YB+UkSEdfcKcrBEIVTZAdJdKz4m/4eIYAzls9GXwO0osG
         i/5VhrLEwgA9qpplXzqivY8mPr4cTwEZ0FMH3KRvgnOZg7Oi/61RAl8zf/quSCt8syJG
         24FP+G8zRIJElt4Aj461YxwlRb73bXmfFHSuN0jZRRZAesy3edEtp9DtFFI8VMO/xl4I
         IO9Wv7iSU++KIdxgfzisLDcuYBtBc09AwI0V8aXekFCGYrhYD5q7WBhaCJBrpT+5UbVf
         xQkVartHZ3cQKM+w02P11AHy3PrgmHOy+Ja51DL+Q91MTS4rnmuZzhvFd9O11iUvza3b
         NNyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789669667; x=1790274467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tRt72PUf/XZ8nyXh0XsE8V2EqRfTqojcjnaq5ie03gg=;
        b=S3n7K5d5T7S6fpPM1REt59qtJjaiX4TqKX/kt1yLpxU9XM5dj+OrhUy+LOcfbxOK7g
         ppl4KuFzeTz0MInfb2o7RrvEDBYhE4ZmM1wc47gowMJDqimodS/bJtIx8VFa3VjTjEs+
         ofW1y0RjM1LQ3AVs3VskP7mj0aVSUMptGx4YUei4Q7PR0n4R0JBWkOs/+TWqEaTwMPKE
         YmTt3dyxh0uoQy8R2ZWoDW5jCXGLQhlpAuk3ELFSPnHvlA5/4fFlS4IE2b2M+VPehD3B
         7rJkjqA4Mg+gE9laW85QIO+PDiF7QOhO7PicqwwuoUKb1i6jYTp//Nhq87ybsghCU2s8
         SmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669667; x=1790274467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tRt72PUf/XZ8nyXh0XsE8V2EqRfTqojcjnaq5ie03gg=;
        b=dhClgY1CwTFVdNnNCe06qqrfZ8kW6JpqwXuXnHAgC9Qx0vMmCbWHHgnscnhg0OXehh
         ooEZOayOeG3zLRNcEEEJn2yHn0TyZOub4yMdRS9qqIOUIQ4Rown37k+8AERZuxXWHpjm
         M2Mes6fQ8i/of0mZLPYx1hlIpCPp50oKRKEBpHxe2LTGrrPSfHsdMjt9Fss5vxSUpYcj
         nkDm0ehz9sjnbA5eWqClzGMW3RW+VO7jeOZih41J6pcPut0EcOdiplpJoQAYDSbs7QTB
         3H141vjQbGNSzu7BmycT0UXBDC3wmn6WCSaVZcKo4EmZ+WZhqCyT5fJYg0bPzZQ/8sy8
         AuLA==
X-Gm-Message-State: AFuF++m+Ak04hYiDnj9rm/vcScZ0pB90LdOF5Ky+JsQD1ILYfYExwvsR
	z2rs2SN7F5nCKqmSYG1VDKGH4CJte+0r7MSMfCAQKi3bSD+y9gaFfwDNldfZ1vQNaSVvekqlDId
	iKjLcpjtq9IRuNDFnhA//5HMSB3TC7tULLVe2
X-Gm-Gg: AYBFou3VwwFkVKMHg0awnEB+jtTSBta/BefeudT1xcGrQVtuIKIZSwNZbSq72SosUQf
	tm5gv429aDHXAets+r8BIS+ntOxwL9tial64wh0c27SUcuMOFa2BgSiCeo0GlLxF6ZTaDOoFRx9
	rbcGDJsfKHomm/Hhb28TDtLVFfEuvpyCA7N4LrHbbL6r9rAuSAfQUo/OhjEjsv1MtFbOYwd+xqz
	XNgcMM/cP94ZagBdmtFFtzgls/npIN4lv2qiw/toqIQOA7fvSujo1bmBvErXKfLHjrVTMnerrIZ
	SDHaTXH/t4lwt7QWqsv4R5JilkvS/X0qYALl3eEviiLloplsCRlWDkbd3i7/Ti0Yz33LcSy/Ofk
	vn6PGCxbA2z8YuE8CvFkPpD9GD0BlRc3vpwB4QfscCObdXEi+Zr7+oUoBAvfzZs0kQatDNfxh33
	IqAIq67Fo+8XAjZ2Wwc9Kxs+ENK8P4n5fpEKGtRRnqkuBkZpVG/syue7RucsSXIANPMw==
X-Received: by 2002:a17:907:3ea1:b0:c29:60c1:7e55 with SMTP id
 a640c23a62f3a-c2a157f77c3mr4807066b.12.1789669667374; Thu, 17 Sep 2026
 11:27:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916220453.260472-1-rosenp@gmail.com> <d76de06c-9cae-42c6-95a8-91c9ed7e8f6b@sirena.org.uk>
In-Reply-To: <d76de06c-9cae-42c6-95a8-91c9ed7e8f6b@sirena.org.uk>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 17 Sep 2026 11:27:36 -0700
X-Gm-Features: AcwNN1X3stN8dmVkRdFt39pftKBfSqreD5Q4cCV84jdTqZ1Ue-KVCVd7OglK40A
Message-ID: <CAKxU2N_JqRtBckSr+CFyOLP3vVk=ndE4UE5ihYtBUoK5sd-F7Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: mpc5200: gate AC97 driver on PPC_MPC52xx
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 10:24=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Wed, Sep 16, 2026 at 03:04:53PM -0700, Rosen Penev wrote:
> > The MPC5200 PSC AC97 driver only applies to the MPC52xx family of
> > SoCs, but only depended on PPC_BESTCOMM. Restrict the driver to
> > MPC52xx platforms so it is not offered (and does not fail to build)
> > on other bestcomm-based machines.
>
> >  config SND_SOC_MPC5200_AC97
> >       tristate "Freescale MPC5200 PSC in AC97 mode driver"
> > -     depends on PPC_BESTCOMM
> > +     depends on PPC_BESTCOMM && PPC_MPC52xx
>
> The DMA controller has:
>
> config PPC_BESTCOMM
>         tristate "Bestcomm DMA engine support"
>         depends on PPC_MPC52xx
>
> so there's something else going on here I think.
It was requested that I split up from
https://lore.kernel.org/dmaengine/aqrxFTWEsJmFIrel@SMW015318/
