Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE74C3E0C6B
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 16:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773246766; cv=pass; b=ERlCeh6QaQCA545MCEGp93g/87h75Y51aFJ2gMPF74CNpMeAMIB/cti89ns2JCEIhlAXgQrHcTS/R0RST1HHlgdyjtIRKA/EujYdFw2osljLO8iSiJReaBKuaWx+JhbuTkcP8ADrXLjZKoXxmF1Lrur9dCZ1yc2nKce6EK5a+dE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773246766; c=relaxed/simple;
	bh=xoIx/IeDKxcNVyUw1oo2Va09MhTndz06USTW40+3Rcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ipPE8nuuAtEq4qsHtnqjycon2lajTa3HMYT7/7XtMZqMtJX42jjUW+clBBDzQyuHaf4YWwliIFy9VFIHXRyCWgIPlnSf3zXx7xrwVCF6Ceb1JOrKka00Y0wLFgdfXBQT+RL4BKL1zzoBaExC6C1ZupUirQHHJ2SyDii/gi4hCi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a75xJ2MA; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a75xJ2MA"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38a32d36396so1332801fa.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 09:32:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773246763; cv=none;
        d=google.com; s=arc-20240605;
        b=FX2hZNgdRxutXl7Wky/3fDRGNvXTKVEu0LJHuG3X28prhBnuSz1SgpcbxZb2SGdkCe
         clNz0MV6IV0laoufF8TjR2eV5VeqZUvvSCVCdjG6nlqAxNTNGbmCf6uyVJqNomAwZBCc
         +Sy9TmpETXf2CB1gJRSaNbR0BXP76zZWbs8v/96kIp26ajiHC5EZ+C88Hp50CB0kb2uu
         hiIerFWQoOZMSab/pcZCSuDfoZlBjePICOaiu3bksJ0a16uDN2l/INXVaRxi329Rbl3f
         vm3wIktA0MjPlaPQq/0ups1VvByNV+loPRTBdDyM/rb31ByWaWBOrL/2Oh9pM2ef2+FT
         M1ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KfJnFrnSSEVCdyFslZ9Mt3p1y+wlhdyW3iFJCntf1nI=;
        fh=ADYdplIJBvqf+ge1vzMCyLh/ni3biL3gyrlcAMQt4TU=;
        b=M0t1ERWqSnXhxL6qgpUc85zt8Ze6Jaf+3dkzRibnzf1Ggozd2C7HQcL4bwxtm9XHE7
         kbP6QyM3XiaA9eM/ouyS8nqSemjy4UhhrQqOOXhwOM88K0evWtCH367oQR26V/rHvZnB
         wDbQRXdDs6QqmMc7iNAdMxcnxaVDuuNAD0hTR7BgTxksT59JF33fys3INisx2d7col6B
         0Nbe3jFG2jcc2NYGXc40mTTTKt04fEz5G3FciJrhqmhu9SPLfq1LUgw7bdU2DGe2V4KB
         WlKW3TquEDs+hnv/DZ1pDGmT9Wz4cuoASrt4AWycBXwkYzi38zscTtTzlRuHcJIENPz/
         KzLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773246763; x=1773851563; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfJnFrnSSEVCdyFslZ9Mt3p1y+wlhdyW3iFJCntf1nI=;
        b=a75xJ2MAPdUuhjH0Gjz+J3jaWuD/33OOAaw1oOtRqQcBPG7VgZDFfdwAwHlvNLUbCb
         yZ0nnfV4pfkk6ryEC3VAROsnBin598m6U1Qb5Uk/DZVuMP7lieVQzA7yxexeIg5udtH3
         boOH4ZQelPDsayAe7Awa/cgli/QOLnMAT0Blthp0Nil/nu7eQnQQ2p6LAGqBqSZobWq/
         3ZYknlfV9QUjwT21JjNnTyHU9s79yu6Q/5U7SLqtqImLMGY1CfScS03Th7cy1vFL1eWM
         LWM3fFL6d4gH9LpvVt+jXTho7AZiOCX88s2uY6xh6rfH0DOQ0ySwtNTaK5G8OsEfoDAH
         wkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773246763; x=1773851563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KfJnFrnSSEVCdyFslZ9Mt3p1y+wlhdyW3iFJCntf1nI=;
        b=jqoFGbQz23/ckROkQMY2qOm/SiQ8WnM0nx4CtYVwEYb8ie4DN2rO7PiLfm5fsnAPOZ
         QG2YeDPuvdYpaw9p/zUKGzYRrod4AoZYgJdIS0PG52dmgJ6p5DW+wE6mLRYCDPQd2K/O
         OehxipHlVCMWprp37Bff0ewYdd8glnS7rW7x0GQTMiBJG8pLbXLzsGOn5iItHqvFRor5
         YktjPSZkAjuW5V/eKhOoxiJ3vN1F/vwyRtOh9rg8Jy3Kqqcq9a+/rYWCzQ2JyeRZtr4z
         tQwV/BcULVCOeELh/HMj1HvMrM7hjndwg9uhkUnM/sfCfjo7itdOBQgp2/KJ39Rx2ZM2
         E7yA==
X-Forwarded-Encrypted: i=1; AJvYcCXhSKc5sTchGICXYRCRt1xGVNsj9Sqo5s5OvrjxZZnFrMbuCiAyVTq9WfhG1EZB9fXUBLmJdVTAmvh5Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YziTIERkSVyHY8CNaeaZnVlCpRChlD4UtAvx49wvrEstxTl1SvM
	e0DJhQC+JjKtaT7isr9mhQLDOQKXq5+8UqyyR0p77HIMiL7PvhX4Xn67W4ZFJfaHxkuaJXHpPmT
	KEteEf89VFonOEI35mpjq5IiqB1CdGmY=
X-Gm-Gg: ATEYQzymKvfMoj0ouHj2YblRuMpdl8rIFXsp1U1nNAOCbMDtZAP+uyhQXDdIgZ7D2Jf
	iTHG3PMkBp5jF4cQ+lPz/x2mWrd/EOp0jlfgti396BUNErT+7lz6+8a6Z8dewzXymgF7RO/8QIT
	6uMLkKHbcHj8gN6dIJkww0XVUm2PJQU4O5eonRrxmFpV50ZFHu4QMm4udwTwtzH69RQnSCMldQy
	kCrSC5uB2wKdc+Bw3Unc8aAWpFY6BXtBUf53+YbCFYtkWoybDJT765e5P2uIl3Ioa/VRMNKzF8X
	m0Z7r+6wg+SuqrwNSK3eaWN3YwDlNb9mNIswqBRaLozb4MHp1Gvrp1IDU10nv40dj7rH
X-Received: by 2002:a05:651c:4092:b0:385:c1a2:fb7c with SMTP id
 38308e7fff4ca-38a7287d70amr453961fa.18.1773246762784; Wed, 11 Mar 2026
 09:32:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-aw88166-fw-v1-0-2777563bb673@gmail.com>
 <20260310-aw88166-fw-v1-1-2777563bb673@gmail.com> <20260311-liberal-reindeer-from-hyperborea-40679f@quoll>
In-Reply-To: <20260311-liberal-reindeer-from-hyperborea-40679f@quoll>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 11 Mar 2026 11:32:31 -0500
X-Gm-Features: AaiRm53JU5eY_8-OuCCtrfUj4i53-fpfBLqYKU0kn2BQ42DRMO-zltOgZD_34Hc
Message-ID: <CALHNRZ9L7gKpO8=KAaFsSAvo3g66v7ZOVLwf7yRHH8o-PxZfQQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Document firmware-name for awinic,aw88166
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Weidong Wang <wangweidong.a@awinic.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 8:16=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Mar 10, 2026 at 11:43:04PM -0500, Aaron Kling wrote:
> > The driver currently loads a hardcoded firmware. Allow devices to
> > provide specifically tuned firmware, so the driver can use that instead=
.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/sound/awinic,aw88395.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/awinic,aw88395.yam=
l b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
> > index 994d68c074a9f221576a5bfef6ba125e3e30bfea..e12d030475e24dd11afaa3c=
9af4b53703f25f981 100644
> > --- a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
> > +++ b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
> > @@ -48,6 +48,9 @@ properties:
> >        Flag bit used to keep the phase synchronized in the case of mult=
iple PA
> >      $ref: /schemas/types.yaml#/definitions/flag
> >
> > +  firmware-name:
> > +    maxItems: 1
>
> Duplicated patch. Please work on next or maintainer's tree.

Noted. I was working on -next, but a couple weeks old. Will rebase and
drop this in the next revision.

Aaron
