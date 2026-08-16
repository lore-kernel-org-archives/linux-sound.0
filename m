Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828693D3336
	for <linux-sound@vger.kernel.org>; Sun, 16 Aug 2026 21:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786914722; cv=pass; b=RiOx1u+xDI0pjCuYGIMiOL7KRQ2GCXH+/skxTJv9vwdpDXB6BCC+Z7q8WssucAkLnYxB1Lv6TMoBOdaGwBGqyyr12U9c1HJn2VW1fzhPDRmEOBh/5CJGjNv7gjGfh6DFE8PPbwl+Ena/HMjUfr43VqqevWNeiBEUtW6hbUoDc7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786914722; c=relaxed/simple;
	bh=tIoWNN4/QvawhYFMjLg4aiQbTxjSdS/iLQfDWoyarAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=umqCK1lXNPSHV1XzfVfj2nvkus4xh/E3WMPsHZDmF5SUuDfEywyJD+TmlNfuW9EPhtr17pwb+RMRayKRmJc3CD1r7j8M6rsPVT4eUUz9Z1sTsBui8/3TIh9C9iSpctyl81yfBAI/fZRNMCwTKFhPTB9YRmbnbi3pux98DJZzo8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3UC4jf3; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3UC4jf3"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a17211b9ecso6055526a12.2
        for <linux-sound@vger.kernel.org>; Sun, 16 Aug 2026 14:12:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786914719; cv=none;
        d=google.com; s=arc-20260327;
        b=V6uqwWizcUQws/bN+JKuBH+rYJF7YzQbehN+2ZkbnjGGtQtOZvmAhqeR2+dLbdTHfY
         ulqi1rOr9OJdEKyABiKqlroI2ipvuasnnIN+6S0gJpWrR3xAxCS88A54vGdHozofmBCs
         EIgTLdtjJ5lyNZod4xsZMtxwZzDtQYkLwLMAzR1C0qg84QyAkiun8pbMnLSw7bFpLYjO
         M6UObnHF6Pro5SRVpaiog0A3MNKjX+WgeBEkDIaYZSSuk2na4Pb0p3MBQDoxBUDEtDgw
         e9JgWUVhZ/UaYI+yI/gUhb1dFGpzGqWuOx9eCIpkyNghh6cQEdJIxprlyuzQ7mIRpr23
         Y9kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=piGwFWwU9JIYJc8ZqfFGe2WuXLHUeUkmz9gwepBmbbw=;
        fh=45FKfjwwrBRULsD1CCzKXGSKx1modyv5yvWx9dXRTTk=;
        b=bicmkRY4bgKm0TuGWULLwS6vdDhWjm/olL+VusLwcWGq8VkWZ+aKDQCH211AXg3OF8
         cYmMy8ZSZHyRNNieVERyZsZUORuYCZjCd5WPqmyPMFYt21j0LdMcSPgVZ+/cXYVFwRch
         WxVnK6Qopbvvn0PRKkLLAITF8wyK0Nti/QrPFd/YmI+fPVun3GsJzXjACdbXn0752gcz
         Re0rsRNBJwMF7nFzIbPmLjMAP5i/5V1i9OJ1LX3J3YmTbaeY6eSXRXa36tXsgULGzy6s
         7qGnUY9KEHyMKBL24bvHMMDN0hx8IYBm4k6MV61OZ2owKRLf7VJYn5elmAV4I1mDi0Me
         4vEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786914719; x=1787519519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=piGwFWwU9JIYJc8ZqfFGe2WuXLHUeUkmz9gwepBmbbw=;
        b=J3UC4jf3dIW7nEICr3NSx8le9mZHcxHv+Urw3t+48RzVHzXjLtdSnyuEVfaR8jAmKt
         djgJ4o7q+YRA3+X+qp0InplznWiRx1pRP9vMhxESETJ7JEUq+CP7txISG7jVuyE8AXZr
         bNPfCcmdFji+gOB4Lq7tB9hurqXs2dlVgyGsmW9I/CKKb2+9xbJ48DtwuMioeIizyM59
         DGAw84xYBfMbyybKyY98/s33KUjeKXkiu1hUNQnbEvlshDGjFyFzM0Xk1kdEMQPKx5bP
         keDM+3UYNk/RUAOJmzn3UeC9WbQXrR6cdOuwUPZABD3ZuR+w2Uf2PE7q3LZXdfvcrqe8
         WX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786914719; x=1787519519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=piGwFWwU9JIYJc8ZqfFGe2WuXLHUeUkmz9gwepBmbbw=;
        b=Wh8oZQQxzTqKfiQwtkFY+p7D8CTo+bzm51l6ZYE2CcF7sFEEIYKLKphY+ASu83E2/2
         TMtahgJv1yWP7qKi7Y7Hz1f/2gi+z0aVc3vYXr91+yxpqsvdlcIESRjU0rnyXxWXr3XX
         QeAkwCT6MrLt7RrNf4m9EOOSMM9mbJbiIySJT53a7twure0skmbx9OFMqA7Tqn1pD4EP
         6mIMwaRQeoFrr8W4jivoTu0Wh3CSMtOqwxRJaqOUPDlYUPnRwPsgXLKBZMG00PmfNIX0
         ov+vT6zLncoDgho+1IoZMOBuDuCyk/9+ZS70piFOsWCUsnowU1GA/Keyslv9He4aLiXW
         T+QA==
X-Forwarded-Encrypted: i=1; AHgh+Rr5VSEapatsRBQIizehl4WMKsk+LP3X4KkGviKmGL/ecwYRu0i6cifk+2oS6usVrw9Rh1r/X9XKJ1royg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFNS9U8sGUpI8tfHo0eu6NykWpRmVzySAsqu4rm5RKdCFFGXBS
	IE3RIi2pUjWM8klWfDgQ5uLaHFETw2FFwbClMujilACWXRZsQFNVVVD6+6NiO423M+Ibe2JTNVv
	9CJc1awYtgax5AZpexR6w0FcpPG/MFoM=
X-Gm-Gg: AR+sD12Y3wgsQ9CVQfcGSoWaeSLzxqwENupB//sB3WXPjp8lWb1XeN32CqQ7i4YOYfJ
	PFkZOfbKDPGHKxq4zB2Fmejsi3GoLKdV0HbROZidZsQ3jTcIGM2Gzl1g2ExQtq9MAhOmt2ym0fa
	NeZxV36GMiYCPSqAzCLiRDAHr0FCSfQYgY15DDcBDqBMHgtE4kYpsT0ZxhCvrpiaDHy8spgn3ji
	LLP933ZrELCS2OEka2TwmcgUvVowsiNElORWbyyjveNGGmmrZX5iRAK39UkqCtfTQekawuALq+6
	exnlE58j1+tDNUC/WdELrd6jSQyg2m55GYSkX1DLE3TELtVaN3/ztBz0rceVMpEBxEj0foAg3VK
	5J7UypZAuMus4ILbBfet7x0+QN3lmTPxfSb+IuT98tLBf5A3inpvcYpr4QQ2y1wHTDcKI2fnyep
	d2KvWGjA5nOhMZdfO20Ef2rrz0DgP4Y2O1PD1iUgVxYVRQthFqdAqkfHQ=
X-Received: by 2002:a05:6402:4282:b0:6a1:284f:7891 with SMTP id
 4fb4d7f45d1cf-6a38a8f4953mr9146604a12.7.1786914718527; Sun, 16 Aug 2026
 14:11:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260802144855.3596995-1-julianbraha@gmail.com>
 <CAKxU2N9HkStUEo+iTa6xc2BJGe6KE==vARDdHPEhRH9yKOMLuw@mail.gmail.com> <999edd39-43d0-4973-96ce-a205283277ff@gmail.com>
In-Reply-To: <999edd39-43d0-4973-96ce-a205283277ff@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 16 Aug 2026 14:11:46 -0700
X-Gm-Features: AcwNN1XxqBacDGACTiAaEjorHNh7Xt50dZ2sag4g5i3K_p7BCynQnau5dtCepOU
Message-ID: <CAKxU2N9mD7tLH2j7p-mV4B4eGcfVP2g52DZViMGELp0ds3VBBA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fix unmet dependencies on PPC_BESTCOMM and SND_SOC_AC97_BUS
To: Julian Braha <julianbraha@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	arnd@arndb.de, chancel.liu@nxp.com, jonsmirl@gmail.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 15, 2026 at 5:01=E2=80=AFPM Julian Braha <julianbraha@gmail.com=
> wrote:
>
> Hi Rosen,
>
> On 8/2/26 22:14, Rosen Penev wrote:
> > On Sun, Aug 2, 2026 at 7:49=E2=80=AFAM Julian Braha <julianbraha@gmail.=
com> wrote:
> >>
> >> SND_MPC52xx_SOC_PCM030 and SND_MPC52xx_SOC_EFIKA both select
> >> SND_SOC_MPC5200_AC97 without ensuring that its dependency on PPC_BESTC=
OMM is
> >> met. This causes unmet dependencies such as:
> >>
> >> WARNING: unmet direct dependencies detected for SND_SOC_MPC5200_AC97
> >>   Depends on [n]: SOUND [=3Dm] && SND [=3Dm] && SND_SOC [=3Dm] && SND_=
POWERPC_SOC [=3Dm] && PPC_BESTCOMM [=3Dn]
> >>   Selected by [m]:
> >>   - SND_MPC52xx_SOC_PCM030 [=3Dm] && SOUND [=3Dm] && SND [=3Dm] && SND=
_SOC [=3Dm] && SND_POWERPC_SOC [=3Dm] && PPC_MPC5200_SIMPLE [=3Dy]
> >>
> >> SND_MPC52xx_SOC_EFIKA also selects SND_SOC_STAC9766 without ensuring i=
ts
> >> dependency on SND_SOC_AC97_BUS is met.
> >>
> >> Let's resolve all 3 unmet dependencies by adding the dependencies on
> >> PPC_BESTCOMM where needed, and selecting SND_SOC_AC97_BUS as other, si=
milar
> >> options in this subsystem do.
> >>
> >> These unmet dependency bugs were detected by kconfirm, a static analys=
is tool
> >> for Kconfig.
> >>
> >> Fixes: a9262c4fd404 ("ASoC: Support for AC97 on Phytec pmc030 base boa=
rd.")
> >> Fixes: 6ffee43ecf8b ("ASoC: Fabric bindings for STAC9766 on the Efika"=
)
> >> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> >> ---
> >>  sound/soc/fsl/Kconfig | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
> >> index 8ae59c094878..a5d7cf534391 100644
> >> --- a/sound/soc/fsl/Kconfig
> >> +++ b/sound/soc/fsl/Kconfig
> >> @@ -243,7 +243,7 @@ config SND_SOC_MPC5200_AC97
> >>
> >>  config SND_MPC52xx_SOC_PCM030
> >>         tristate "SoC AC97 Audio support for Phytec pcm030 and WM9712"
> >> -       depends on PPC_MPC5200_SIMPLE
> >> +       depends on PPC_BESTCOMM
> >>         select SND_SOC_MPC5200_AC97
> >>         select SND_SOC_WM9712
> >>         help
> >> @@ -253,6 +253,8 @@ config SND_MPC52xx_SOC_PCM030
> >>  config SND_MPC52xx_SOC_EFIKA
> >>         tristate "SoC AC97 Audio support for bbplan Efika and STAC9766=
"
> >>         depends on PPC_EFIKA
> >> +       depends on PPC_BESTCOMM
> > does this really depend on PPC_BESTCOMM?
>
> Yes, BestComm is the co-processor found on Freescale MPC5200.
Just took a look at this.

--- a/sound/soc/fsl/efika-audio-fabric.c
+++ b/sound/soc/fsl/efika-audio-fabric.c
@@ -22,8 +22,6 @@
 #include <sound/initval.h>
 #include <sound/soc.h>

-#include "mpc5200_dma.h"
-
 #define DRV_NAME "efika-audio-fabric"

 SND_SOC_DAILINK_DEFS(analog,

compiles. That header indeed references bestcom stuff, but I don't see
the driver doing so.
>
> - Julian Braha
