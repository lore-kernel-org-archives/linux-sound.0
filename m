Received: from au-smtp-delivery-130.mimecast.com (au-smtp-delivery-130.mimecast.com [103.96.21.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093C920313
	for <linux-sound@vger.kernel.org>; Wed, 27 Mar 2024 02:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.96.21.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711505407; cv=none; b=ZNok9xpI5hSGQVU0F15Yl4pxYPKj1NXBlmWN2TcV1Wg/ODEhBPUNpy9fFInSV9Fa/hEAThaPfPBcLi4w3H8gnlQEyAha2PA7ERqyl5/xY7f+IOFcoNl0sbwTQZeIVkcHwGcAU+TxyjcXC382nb6kOg8NAOqh0xJei+eat/gc2y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711505407; c=relaxed/simple;
	bh=KXevlU52oQPoeRk6/V0k++bkJTQXpZNn9OTyeRmV6Hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=M2yVtXAsCxUc55l7JryuUAbcyEyrnpYU72PZmnDVReI6i2HkJWXGWWHzWZWbpBFCX9A7VA2/sOhAodcFbBXAjGO2QxHIp1Xpu2xBuLkeWachhRhDM9nQhKxX6LSG+z0R3Dtc6gR3Gem/XaNciuDZznJTLA7epAtzwAz0SZOhHhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=student.unimelb.edu.au; spf=pass smtp.mailfrom=student.unimelb.edu.au; dkim=pass (1024-bit key) header.d=student.unimelb.edu.au header.i=@student.unimelb.edu.au header.b=IS/V9G8S; arc=none smtp.client-ip=103.96.21.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=student.unimelb.edu.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.unimelb.edu.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=student.unimelb.edu.au header.i=@student.unimelb.edu.au header.b="IS/V9G8S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.unimelb.edu.au;
	s=mimecast20230627; t=1711505400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1GmpQFr/5kbnwFByeTtEMVdByVQroH+pusGCYRim3PU=;
	b=IS/V9G8SowJuj00yWcCKvAnFQErpkzJ8euKw9ZWlauzECk73PoD3swpq41Y53SfTf1+yWj
	2mEjDEKGyE31D8i88yjKTiUeCxtKFoJ57+K7Qv4giwiRalEieJQbLm+iecV+D15ansTiYV
	0pDgcV9Xn+P9V+OZPwmk1rTfhMnxpS0=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 au-mta-80-o7Xqjc1dMt2dXhodCxUJEg-1; Wed, 27 Mar 2024 13:08:25 +1100
X-MC-Unique: o7Xqjc1dMt2dXhodCxUJEg-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2a04fe4fd15so300754a91.1
        for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 19:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711505303; x=1712110103;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1GmpQFr/5kbnwFByeTtEMVdByVQroH+pusGCYRim3PU=;
        b=hNnRGH9VtJEIJMtXIb3TYo28Xau+ZoQPL22VTazHe7NZHtadPvwgWkcS7x0Eg9YSTf
         VQLbgf6vrLFPSjo/La0Nl2zpy/U2DdMQUwbRL6FQmYbuHSgS9uaXV2CIK2z7tqRnd/i/
         +sypS+MAzSQodqH5R3iUChenfmQryOmyBWIy5D/2ZjmHsXo3k7X2QcjXnT/TKUVd+uUv
         9bLdwQ8KsEZEX7hIeW212NRb9JM0dj4ETi6/HqKXZMzrYvG+SyQ1dhNOLCvutrtw3dpp
         +v8Hmi6iKDJ8B6CB9cIhqfMQCjfmPctk7W/NLAnNYEgg24kcUYyfQu4tyZbr8UQKSVrk
         nfhQ==
X-Gm-Message-State: AOJu0YyjBcoPyftK39PcQfLis2wsmRY9oBKqlGrLCXMTX4WdJCNK8Kre
	iqx4x5A6g3e7/vUo1jlWUQ5uVA6RX3LOvkCHowVliOmcXwZsRfP1dIzW7v2Bm6LI9rkECQjfjb1
	R0ca45gV8Gi3tjnKPXiOVE3oz5OcR4CzG0lb4+73Cyn8RmGxPzl3IT8gojlFLFxxmVBe1iEd5Le
	iaI/6LmSeWJhR5VDVofN5ITqho5a+L1T12PfkCkzxjc+UGglGWm1m9dXB539pnHHkKVERiFfSmt
	WnFf2URDa6+WCP6By/kFrEfFpZozptnz13SAuAhPW1APcbrOKVUh85jkl+o4hI=
X-Received: by 2002:a17:90a:2f01:b0:2a0:8d17:948d with SMTP id s1-20020a17090a2f0100b002a08d17948dmr3764292pjd.1.1711505303281;
        Tue, 26 Mar 2024 19:08:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLc36uQKvXlMthgWL0XJ89uqVPBnEmNLJ/Ve5Ko6UFH8112n36hfzK+lL+giy3C/cPhtdM7Y5CZX4ME0/r8OE=
X-Received: by 2002:a17:90a:2f01:b0:2a0:8d17:948d with SMTP id
 s1-20020a17090a2f0100b002a08d17948dmr3764266pjd.1.1711505302791; Tue, 26 Mar
 2024 19:08:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAE1pm7Pn3p9-9N4CDDL6mnS2KBw62FYypvBVKPQzoS6_RSLJOQ@mail.gmail.com>
 <39f47d0d-337e-41f3-b110-2f6326f6f4ae@sirena.org.uk> <CAE1pm7OFXv9fC+Oxh3nWpxQNQCuNLZUGpmfY+aG+8HGhy4GFiA@mail.gmail.com>
In-Reply-To: <CAE1pm7OFXv9fC+Oxh3nWpxQNQCuNLZUGpmfY+aG+8HGhy4GFiA@mail.gmail.com>
From: Sukai Huang <sukaih@student.unimelb.edu.au>
Date: Wed, 27 Mar 2024 13:08:11 +1100
Message-ID: <CAE1pm7OGBNgpqOJg4DSLLd7g3JDm4iYRWGvJYkTBjHGUHF+2LA@mail.gmail.com>
Subject: Fwd: Request to Add DMI Quirk for Lenovo IdeaPad Pro 5 16AHP9
To: linux-sound@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: student.unimelb.edu.au
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this is a forward email due to HTML message rejection previously

---------- Forwarded message ---------
From: Sukai Huang <sukaih@student.unimelb.edu.au>
Date: Wed, Mar 27, 2024 at 10:48=E2=80=AFAM
Subject: Re: Request to Add DMI Quirk for Lenovo IdeaPad Pro 5 16AHP9
To: Mark Brown <broonie@kernel.org>
Cc: <linux-sound@vger.kernel.org>


From bfe53271fce81b87b8a0ff63c94f05dba2f39d43 Mon Sep 17 00:00:00 2001
Date: Wed, 27 Mar 2024 10:23:23 +1100
Subject: Request to ASoC: amd: yc: Fix non-functional mic on Lenovo 83D5

Like many other models, the Lenovo 83D5 (IdeaPad Pro 5 16AHP9) needs a
quirk entry for the internal microphone to function. Once added, DMIC
capture dmic-hifi-0 device can be found by `arecord -l`

Reported by: Sukai Huang <sukaih@student.unimelb.edu.au>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 69c68d8e7a6b..a3fd83494e5a 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -269,6 +269,13 @@ static const struct dmi_system_id yc_acp_quirk_table[]=
 =3D {
  DMI_MATCH(DMI_PRODUCT_NAME, "83AS"),
  }
  },
+ {
+ .driver_data =3D &acp6x_card,
+ .matches =3D {
+ DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+ DMI_MATCH(DMI_PRODUCT_NAME, "83D5"),
+ }
+ },
  {
  .driver_data =3D &acp6x_card,
  .matches =3D {
--=20

On Wed, Mar 27, 2024 at 3:45=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Mar 27, 2024 at 12:54:34AM +1100, Sukai Huang wrote:
>
> > *I have taken the initiative to compile the kernel myself and can confi=
rm
> > that adding the DMI quirk for the Lenovo IdeaPad Pro 5 16AHP9 allows th=
e
> > internal microphone to function correctly. This testing indicates that =
the
> > addition of this specific quirk will resolve the microphone issue for o=
ther
> > users of this model.*
> > I kindly request the addition of a DMI quirk for the Lenovo IdeaPad Pro=
 5
> > 16AHP9 to address the internal microphone functionality.
>
> Please send a patch for this with the code you've tested following the
> process in submitting-patches.rst (basically, format the patch with git
> format-patch then send it to me and linux-sound@vger.kernel.org).

