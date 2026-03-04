Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A1E3CC9EE
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 17:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772646322; cv=pass; b=A7hMx1wsRm+Hddi8n9nyNQVh5d+Id1LyztPxeIBKxgbpN2wWyNR9PVyRbJBgmxxT8bzhKAG//3wqCKrkz9XBbH/rLPlmVx6to81K722DGNQVL1dnXL2nZ1t4IKTx/4OKuxMsx7lc/98j0RbmbOw9Z4fmmGE0Gy/CB2WQZ1A5D0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772646322; c=relaxed/simple;
	bh=EF+E/wqY5Wc23+tpujXfUg59jTVQ/jcfXNKQ50l8ivQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qLRqzbsd/BOW0q2yRa/IQHr5o3VxBla43cnuHG+Z38cK+NynueJ4YdUQPolCZq32gELNoZa/5ULrxn5ofe93sVVGqyd36R6K3cR1MiGMhwPnZgxCUeNhl2JhBqUJICxACgdN9drWly0hTtx3Wpx6z0Gb16JDljQdIcO3uFseKC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lcgj35Wp; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lcgj35Wp"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b93718302beso95092966b.3
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 09:45:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772646319; cv=none;
        d=google.com; s=arc-20240605;
        b=AlWcNF+fjyQGrDLAZjXFobpxVXTvA0JdR/1bm/m/7o2fZ/O/hmyx2xmiU2mnIKajH/
         +Lt4lC0jvsjcOkSFESiRWDjEALR0Gv/cYp2mkj+2TfLbmikCvLFiOiDgRV73xypDKnCK
         7eWBTCcPn3uKk874p/b56RdEPbgvK3pdDMJ+KAfyrwZ7k6UEKuhRTqKEO7+iPp2vHSrU
         4MiscpptT8tQWAVKlkZLAo7pkJ2FX2rtsEMD06z+2PUh4IgN4hhjPBxBEy0JEbsI+vWM
         5fZgzMd8W7dfb2BmR0oRL5p8M66Q/zQPCs1n3ch2h6PDq5oIQV65Vntqt5d2feqbOFnn
         oXZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=SWIPLDk1f23/2Sybtfp8MEQHgfJpb9QbRWzIDfvveiE=;
        fh=JE/RksEPcbgn/8byCKvQ/CabkzqduB8lb0hsd7eW1ys=;
        b=gcyVKyl686/LL9eBgafnNrLcCbtbkene7rXogCJR6s0NbjJdkPDE67CFUwFbUzauRa
         8F2IpK3dUmKBtK7Y5O4ej+q/jsgj1FQouFdD2cHKr7q8glyjtXzkE/0NLCqGGgxVyUG/
         JVY3Vl44Vuz6cwdQCIxUfZpbmgAV33p71jJCZEdkE0U/Vz2j/EtqR5HyZ6Q348T5KVsl
         GN8arpqnIGEXU6Wq+C7ecnkKvbZIPbojToo48OhrDPQddb7UvG4vpqmSIMnvqWAy+S1w
         fUp+p3+3z/NqGN8+f63tTlJoNpSMm3SDrPjATjLQIAJWP35o+qTC/fXEvO5Zcruz3QZY
         E5yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772646319; x=1773251119; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SWIPLDk1f23/2Sybtfp8MEQHgfJpb9QbRWzIDfvveiE=;
        b=Lcgj35WprkY7qKqtPep2lnS15SahC/YpUIjxA0dXmNHMs+nO0riIJn2ov/ePoU/fxm
         CZy8/mjqX0lUao2uPEaAB2u8gvBoDUiitR3SPWjXfWOah3oc3I/96J+xcH1iPxU3bYKW
         tJzx0+cHHsn/GkQLVsAttThRzyYrLUHUquRnJQmzHroRrr/cpouw5Xaojeuq/ZR79h1O
         6wGYZ9Wv1AcezpchjSPihulYOeteKeGwbvb0sYu1k6dS86HpNZeiEgdRPK3cVXftYEpL
         7HJxZz93ZC7AKj+qpMOSg8kOZhugb/Yt6fJVOzI4qK1HIH3VACxjmDEW2BRtjcvy6Tug
         H4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772646319; x=1773251119;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SWIPLDk1f23/2Sybtfp8MEQHgfJpb9QbRWzIDfvveiE=;
        b=Q9R3lsdHGlFJFzsUD8mlyXOoe53Xc/TU3dJg/eicEB68mi/4iQqqcukiZSq9WJOvHg
         4huEPt+LRQ+POetAsbI4W99nVnqdwKiD/cuWzaZnRuhiTnzTk/xCtZZfaOSoCl5y3jDi
         zpiIbWV8U/ncSLn/U0gI9dhOD4iurO8GDwL0BkWccyxbg8hvMUfcUpnaSFoslT6POwLn
         XFGmjeJNna2mmgno7FHxnzcasGtixDc4CiFOM/etmxrqIjcL+EbkhhEr6oPrEmNNCtR0
         4eD3yDqK9p6vVawjsTD+ZBf0noroWy21ogcVamMU8b+62bj64fqofPTyUV/8FXGgZ3q1
         J9ew==
X-Gm-Message-State: AOJu0YwQSQpIQDKlcFfselJbYsVcO7R1EES6ESqlqH1Lb9cJExTENtKM
	Hi5trVTNvB9qxmgqclAzy+UKssZr1LA6/79pSkorDZN/R5wgeS4HhBChZXuABh/YexnVZoFrOAe
	b2QBEYUSjn2TLvx5x9uGq7+vhIS5LJNCzhGGVHEM=
X-Gm-Gg: ATEYQzwb2y7cKPaLi+X27YiwhTsjm7Mmd4k3jSVNqjiYGVgylzmPaAAV+ClEcGLzXln
	oX5evGLYAD2TbTVh8IOL++oheviFty7msXGt/wuzyBdSL8tC41a4KRFswfdDWJOiJ12sDRaImtR
	uBQjC7f/hUnOHsuDjmeuP59XclgB5db6z0g39gkLlzsBxCl2z308fHdCR0ksItbuUFCKaOoW7QM
	eMHJEmYIx7lkjwUxeDlIL8iiepeN2gfELDBGQPWMce2Kpydvdkks7Rjz63RuUMn+2hOF6cu7+Jp
	sFc1cIyoQDMCtqAQws1ibMaP5RX8iRY5sv2Lzuh9/9x8UrzOYsxLP+V6Vp3FP5MHWZaaDJKlZGn
	ECNdaTgTZ5P3r+8EnePmF0MszMolvgPclwkUOBgQjRkH9ErHxZfM=
X-Received: by 2002:a17:907:7f86:b0:b87:756b:cfb3 with SMTP id
 a640c23a62f3a-b93f119d454mr155960866b.19.1772646319161; Wed, 04 Mar 2026
 09:45:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: El-Hadji TRAORE <elhadjiboubacartraore@gmail.com>
Date: Wed, 4 Mar 2026 18:45:06 +0100
X-Gm-Features: AaiRm53STQjGpuwR0VmbV2NsRjMEZ4wjvWF_2pyUBWnxxyPBD71zijBvSuXnNfo
Message-ID: <CAEk54sxKcSy0i8R8+khKoR1mP2k7QknvC_wF5hEF8K1ySRa4Qg@mail.gmail.com>
Subject: [PATCH] ASoC: amd: yc: acp6x-mach: add DMI quirk for MSI Bravo 17 C7VE
To: linux-sound@vger.kernel.org
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000002ab902064c3662f0"

--0000000000002ab902064c3662f0
Content-Type: multipart/alternative; boundary="0000000000002ab8ff064c3662ee"

--0000000000002ab8ff064c3662ee
Content-Type: text/plain; charset="UTF-8"

Hi,

On MSI Bravo 17 C7VE (board: MS-17LN), the internal digital microphone
(DMIC via AMD ACP6x)
is not enabled because this model is missing from the DMI quirk table in
sound/soc/amd/yc/acp6x-mach.c (yc_acp_quirk_table[]).

Add a minimal DMI match:
  DMI_BOARD_VENDOR = "Micro-Star International Co., Ltd."
  DMI_PRODUCT_NAME = "Bravo 17 C7VE"

Tested on Kali rolling (6.18.12+kali-amd64): after rebuilding/installing
the ACP6x modules,
PipeWire exposes HiFi Mic sources and the internal microphone works:
  - alsa_input...HiFi__Mic1__source (Digital Microphone,
api.alsa.path="hw:acp6x")
  - alsa_input...HiFi__Mic2__source

DMI:
  board_vendor: Micro-Star International Co., Ltd.
  sys_vendor:   Micro-Star International Co., Ltd.
  product_name: Bravo 17 C7VE
  board_name:   MS-17LN

Thanks,TRAORE El-Hadji Boubacar

--0000000000002ab8ff064c3662ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>On MSI Bravo 17 C7VE (board: MS-17LN), the inte=
rnal digital microphone (DMIC via AMD ACP6x)<br>is not enabled because this=
 model is missing from the DMI quirk table in<br>sound/soc/amd/yc/acp6x-mac=
h.c (yc_acp_quirk_table[]).<br><br>Add a minimal DMI match:<br>=C2=A0 DMI_B=
OARD_VENDOR =3D &quot;Micro-Star International Co., Ltd.&quot;<br>=C2=A0 DM=
I_PRODUCT_NAME =3D &quot;Bravo 17 C7VE&quot;<br><br>Tested on Kali rolling =
(6.18.12+kali-amd64): after rebuilding/installing the ACP6x modules,<br>Pip=
eWire exposes HiFi Mic sources and the internal microphone works:<br>=C2=A0=
 - alsa_input...HiFi__Mic1__source (Digital Microphone, api.alsa.path=3D&qu=
ot;hw:acp6x&quot;)<br>=C2=A0 - alsa_input...HiFi__Mic2__source<br><br>DMI:<=
br>=C2=A0 board_vendor: Micro-Star International Co., Ltd.<br>=C2=A0 sys_ve=
ndor: =C2=A0 Micro-Star International Co., Ltd.<br>=C2=A0 product_name: Bra=
vo 17 C7VE<br>=C2=A0 board_name: =C2=A0 MS-17LN<br><br>Thanks,TRAORE El-Had=
ji Boubacar</div>

--0000000000002ab8ff064c3662ee--
--0000000000002ab902064c3662f0
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-acp6x-mach-bravo17c7ve-dmi.patch"
Content-Disposition: attachment; 
	filename="0001-acp6x-mach-bravo17c7ve-dmi.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mmcbtp220>
X-Attachment-Id: f_mmcbtp220

LS0tIGEvc291bmQvc29jL2FtZC95Yy9hY3A2eC1tYWNoLmMKKysrIGIvc291bmQvc29jL2FtZC95
Yy9hY3A2eC1tYWNoLmMKQEAgLTQ4Nyw2ICs0ODcsMTMgQEAKIAkJfQogCX0sCiAJeworICAgIAkJ
LmRyaXZlcl9kYXRhID0gJmFjcDZ4X2NhcmQsCisgICAgCQkubWF0Y2hlcyA9IHsKKyAgICAgICAg
CQlETUlfTUFUQ0goRE1JX0JPQVJEX1ZFTkRPUiwgIk1pY3JvLVN0YXIgSW50ZXJuYXRpb25hbCBD
by4sIEx0ZC4iKSwKKyAgICAgICAgCQlETUlfTUFUQ0goRE1JX1BST0RVQ1RfTkFNRSwgIkJyYXZv
IDE3IEM3VkUiKSwKKyAgICAJCX0KKwl9LAorCXsKIAkJLmRyaXZlcl9kYXRhID0gJmFjcDZ4X2Nh
cmQsCiAJCS5tYXRjaGVzID0gewogCQkJRE1JX01BVENIKERNSV9CT0FSRF9WRU5ET1IsICJBbGll
bndhcmUiKSwK
--0000000000002ab902064c3662f0--
