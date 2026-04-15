Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00775330649
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 09:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776245068; cv=pass; b=amHorC8jM+CmKcStzNC3Hxw27kQIokyLsNes40eW/65VoRE9nV/RtOHJfJCPIMdjoY/qzHvg6+avTNoexcf1RiaLcQNvclFQZ6szVy5icdHSU726ggk8B8mxfFka9qblr9dep0s92hwrJ6yi1SE5w6bc56L3UZCzXF4TG8pPPFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776245068; c=relaxed/simple;
	bh=dJmT/w8H5lCvqR+3MrDYaPpMRfkvpZilvwhihN3HnHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iuZ9TEgX5T6GPdr7228K7ByBz80JxUe3W+lcd+Uh6IW+pqgAuhWCM+OCEDeIhC9lVDj62kW3Ut/mwdK5pykDVQNHsrzDS/4WNCbXpJy/AzKBfPJ7Eawwls1vdYJqvByQiTjoGQyCStNZSvHxyq8aDPgkyCsWHcJAKWfSBfy5TGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGUtTM38; arc=pass smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGUtTM38"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c76864f4e58so2120025a12.1
        for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 02:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776245066; cv=none;
        d=google.com; s=arc-20240605;
        b=A1tYzDk4vWpH7eLl5HITHt8fjy/FzBaD9bp9amv9cUE3t3m6KC/C0riSq9SK9Zb0Cp
         bb8g3k0Z4ChrVHHxT4Z467Fcd9UZDjebkjwEhqBW8dizOxxrXW3YPJcv23mRyeqnTlqj
         TNmZn9xuXraWheyGyMK97iEhgoTSpsahmWVb2E9jS+B7bBqhluVwMYKQ+97f0aw4GnSE
         qHm2F3ky7fQG0to2XHhaT9kMwq0jWuz+JZX6N93VxJx0yEhmtZC2qdyShrAdh7qUAp31
         xJVV60BDS2j7xUEAL9oHQAlA8ga/mLO8OU3znsRsKIHRcoFix8VrIAkH6wElEHItq5ep
         nAKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dJmT/w8H5lCvqR+3MrDYaPpMRfkvpZilvwhihN3HnHM=;
        fh=zGSG3cYcChFRGWRQ3H6p71NR1GIMIy6xYZoNZTjXZzk=;
        b=aBwIJ+916C4KwnjwnGXDFzHkV9BE/Poweo1vNOaBEb50xoshyiykoX6+HakTuSyDBD
         9VcRGy5vk4JrZK6VeRnxMeK/hYmxCsGO8/Fx7JrcDWUIzgnHrD502NqlZ/gJtJn/pQ3D
         KNlMfkaRxUB6CmEtjrk8srsdp8yPjTLSYrq5jOdTo1mxzodjDdieNXIJbUGfetVkXmZf
         ms4ZbPD0d+Cx3OGFF+kez+TzUuxzctiYWSlZJyj+LCeOWqPFa8A1OCHbCymUSOex7GYy
         e+M8eoy9FKTuNE/1JT4p4bUIzscThRAAvdc2u0z6MztTJft/wnNrebY7uNF9f7ye6lHj
         wQBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776245066; x=1776849866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJmT/w8H5lCvqR+3MrDYaPpMRfkvpZilvwhihN3HnHM=;
        b=mGUtTM38dQjb75GEAeiwxhmUL5NlyG1gzCAw7jlKl6mTO1mfirlejc/yKhKmZ+O6nI
         ldKOi4dJ0NXVmoAGKTc9PhsVHtOlMfsM/BkjIC/pio3hZ5Bgur1iwKMiFSpZ29xnuVGD
         BQ/zweB3qMHtXQhAdG24HQmUDerReb0YDmkwIJ8EdDKFz7X9rKcN7FDhQzKzTyCzBwmY
         IdT0U1PADUwQ8XCXCJG5ssz41n6OpxfbaSnCy9ad1INr4J7sNOCskXLZmyp54h+kOoFk
         p/pQNSRqtqFjjwDtLes5lPtlDrLtMzsLqHRuXypDnx31WdKXyWwLFHRSuzD9xFxi9W3R
         OAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776245066; x=1776849866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dJmT/w8H5lCvqR+3MrDYaPpMRfkvpZilvwhihN3HnHM=;
        b=bo+YdX4NfgTsSyTSabXl1fl30dRIZ9zliERYxobDziRJgayY++/6zCOPf4saHp5xnK
         547YkCd7cj6Iqjx24Wcwlx7dYX3pY/WIKIGvuSQogtI2VYPBVDzWvqAE7bNrtVgPJI6F
         RCA5RcFo4UjETVGysCa6l8hnAxTw9CE7crGnuSTH9K/6wvy1pZev7LDbQhl5J01Jt+fs
         nyBDM9rym/gudzmv8d1/MreaBqm0pQOREuYopS1f1p7J5FMaeHvF8JLOoc5nQJL75Bbl
         asee/mEVEy31yYfOV4HOZ1tWaPD0S6aYyuuKkkjJWnvJpTsortXH4KcyplHpIt8Xvfw8
         Z9SA==
X-Forwarded-Encrypted: i=1; AFNElJ+QkWjzNZmJpsuioxcF4A7yRcTY/E4937tfG8hM65A3u98JHDtKA4H9s+T2t2tjIq5dtdyZEBBM2GU2wQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsb14Z2DcbMbYNlbO/u+vbgrXW06O+aKBUM24I3RUYEAe9NgaE
	eUxCMzNactxYBl8teRMbDrBdyIMu2zW1er3O04MBun4xB5MPlDDGMcuudEj1MI3S3c7pOMqlU1p
	6galeGSjjZPnF/xYR+m+xiVWdmNBLNAM=
X-Gm-Gg: AeBDievYPLhrmPEnT3ZcGJCjJbuvueygMI5HkN7J/caf5ZfCO5ZCk3p7VqeTwdTagpx
	grCvsz6F3qilwynEXl5JLtHOJZmk4Jk7jb7QI/0RXlusj0qAZtBS6L1Wu74RRBZfWacdjdmJLza
	lLfUHdJyXhkAqE3xaLcFqlzC7VHk2OqqbPVRxgcD+8m9+kLHDw9W25ReA79wMS15DjJs8vH2i0m
	/sU7KMRHYDijP7h9kzKM6v6a5rI2Vs/l1lutbp+OpWl9Z67d5DUUEHoGI8TD5r9wJo59Jrc9D4M
	kwY637zm40ZQaK4nT1xkXIzO7QX4K1PeH8SyJ2PR98AQ1/H8
X-Received: by 2002:a17:903:2cd:b0:2b2:420a:b48a with SMTP id
 d9443c01a7336-2b2d5a5b40emr221045375ad.32.1776245066382; Wed, 15 Apr 2026
 02:24:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-5-phucduc.bui@gmail.com>
 <87qzoipdo4.wl-kuninori.morimoto.gx@renesas.com> <CAABR9nERzKW=2vZTWNuTcjz4KuVyc+eaCKBNP6ZGb4UAYw3qUQ@mail.gmail.com>
 <87wly87rgg.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wly87rgg.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 15 Apr 2026 16:24:14 +0700
X-Gm-Features: AQROBzAxV0vtDPyTesfAsCOTSD6-ZvXhLNdBVP4mPf3ihKDvrCGQY99VGP4P4-k
Message-ID: <CAABR9nHApZ7KWjkeut_2oR+AmstOfbYnVe6ad2W+EaWRGPbt=Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] ASoC: renesas: fsi: refactor clock initialization
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

> Ah, OK.
> So the patch 1) moves fsi_clk_init() and 2) update it.
> It is including many features in 1 patch. Please separate it.
>
> One note here is that /* clock function */ is for all fsi_clk_xxx(),
> so don't move it.

Thank you for your guidance.
I will split this into two separate patches accordingly.

Best regards,
Phuc

On Wed, Apr 15, 2026 at 11:55=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Bui
>
> > > I have mentioned in previous mail to just move fsi_clk_init(), but wh=
y do
> > > you need to move it ? It works without any issue without moving funct=
ion,
> > > I guess ?
> >
> > I moved fsi_clk_init() below the two functions fsi_clk_set_rate_cpg
> > and fsi_clk_set_rate_external because, inside fsi_clk_init(),
> > I assign these functions to clock->set_rate. Moving the function was
> > necessary to avoid compilation errors.
>
> Ah, OK.
> So the patch 1) moves fsi_clk_init() and 2) update it.
> It is including many features in 1 patch. Please separate it.
>
> One note here is that /* clock function */ is for all fsi_clk_xxx(),
> so don't move it.
>
> > > And why you need to call fsi_clk_init() twice ?
> > The FSI controller has two independent ports (Port A and Port B).
> > Each port requires its own clock resource initialization and configurat=
ion.
>
> Ah, yes indeed.
>
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
