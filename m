Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401F03D5655
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 14:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776780468; cv=none; b=XiyszUVnCz5JxcceXZleSqgmnzfDEFjUewwGYRJqO/qNGbTdGqkMco6J805jsWowdzG+Cs26HeXK+eat5gF6EMLhmPAgMocvMjMASbH9F7XufLQ37f+U6QNgmxJRezNjEOh6nsLH/riOtaphJfxHU5+8d83T6xXsTUUznE5d/o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776780468; c=relaxed/simple;
	bh=iXvZpIDtiDVMOXqvAIyOvgyFeK3ICWB+lQtmXvDXzmY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eH6Pu8p9SYXtw4vAdgnBubvkUDQQLoXP7b28NYCRx3PY0MgTJjffharHnHB0HtvFYPDCbF97xPCADFv2NwuzZYbr2/xL/dV4GpuQmP0vi2TtvKDE9QTNShLe8WI1JnbJoLKFhBNo7fiy3gCc4BkxyoudCcC+N8W4DJoyKO/qIsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=XGmjy9MD; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="XGmjy9MD"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so2667334f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 07:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776780465; x=1777385265; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AExN7SjG5fnghrQ28nIwXiaJ2dUdbcwwWp/bbQPokmo=;
        b=XGmjy9MDWUgYwWNUugi3JC++xcFmkdjTBpjs/CgqpzcYQZeNOX36FbyIpMpYZ0Ce7D
         TRSaIOkmRITPSXOMMInpBELwGZS8bOxAPTc7C4XzeAP9XAi0Q8WwcwjYih7ApZQUiJmm
         siElZwkZ5k7oTETrPR0hLUACu4oTUT9nUfwuvILYBfCrsV8hWitOoKZearT41DUa3pl7
         G4CIuvZNivHUhFmTczYWVs7GE70PEfqgay4uSUD1IVdmkh0XEY8pPWKRYFVsf9wOqsiJ
         8Nk3q9FPBq7BaH0lJ5bikwVAK8/oJhIWzGcEMVw+PvhT+9ea21ax8LNPW4CK8mPssE9/
         GJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776780465; x=1777385265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AExN7SjG5fnghrQ28nIwXiaJ2dUdbcwwWp/bbQPokmo=;
        b=JeRQby9AYvKjpS1KG9pEq/E6td8Awyyfk/gU0APFbAcIyRFhZI6GWrO7MedTp2/WgH
         uC2OrblscG+pqgGsXbBUNqgAo/pO2IdY5EaldI6wplLEJ5+rlNZMxpLPTubyw6nxHBdi
         z5AbPPsr0h3ykgp40JJd1q/CjToqCA1OW5irX1BqW0cXAWplYtx5YnLeH4oesDrCPhPL
         MbBk71bxBAMVNi3G8A9YQWRqVvUiEPU5HKGCo1VP+XN64rEgBua8Gfmzfqi3+/s8SDoe
         XYfjjH6odvPfqcw6MOX6bjCoKPtN8HuKmi/yHLcr4kp/HGs3nwsCSrXtlaRCCqgOjquV
         iZEQ==
X-Forwarded-Encrypted: i=1; AFNElJ+QOwF+ThsNTNKysdj+tYder1XQjmMTnVEFJEepGBis1WnxT2TLhgjeweqE/nNDJddgd9bX897ACqjFIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoMdBioOVOC/jVYGseekdnfla38zFLzpF70GiCDYk7sTSdRB9s
	gV0ew6xKkzM00ABZG2t5+7713ddIvW1PlGcOwYK7vCzWBWZ80oliTGl17hGjKuyuFwc=
X-Gm-Gg: AeBDievQatJ9VDyixzCZOs0802Qp0MqjI9489f1GrV2Hq5lzpeQscRJg7IVGVw3lEnc
	w8Pkz74eyaRSHGtLbWhNLM01tK10T+XOaaBjm/pWv6x/gqaqzsb+2raQrCwwk4vqvF2EbICc4dz
	iLnDEPa0n9C4dlPX3ykQcjNweOPcQXICzr4Hu+g8XIrEuDkt7/Qcl0PBz7wwNGd3WR7skErAuKB
	aPOhdZGKZkLwMXKsS2lGmC7scBtB8lluTsuJsuPmLrkCF7mH6yzhh0KeB9QkjtkXXbwchzPb7Tm
	Or9jbzHiBL0u0XowJuCT6lnTninSzxbu28FNgvyWNNMsjV9uj6ap8XQquoPXvuXS0dNVvCRZx2y
	9uEDyDjiJ653rS+gY/0aglVh9kroqU6AHIBeyaRDUw/rHfd2biPguZaIgbiU/M9s3Eh1c97GZkN
	l0qatt+JLJI9HN/qU/qULA2XSfWsZJk2zAHuqcT5c/ssv3LAMU8m1F1xN0f2la+/dNh28lyRDLH
	SBE+tzzGTb+flJr3CtMChArTU26czeGdPeS
X-Received: by 2002:a05:6000:22c5:b0:43d:4b00:9ee7 with SMTP id ffacd0b85a97d-43fe3e10b0dmr27747675f8f.33.1776780464471;
        Tue, 21 Apr 2026 07:07:44 -0700 (PDT)
Received: from localhost (p200300f65f114e0838b25d7f2f2f49cd.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:38b2:5d7f:2f2f:49cd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43fe4cb1365sm39562828f8f.7.2026.04.21.07.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 07:07:43 -0700 (PDT)
Date: Tue, 21 Apr 2026 16:07:42 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: "Christian A. Ehrhardt" <lk@c--e.de>, 
	Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>, linux1394-devel@lists.sourceforge.net, 
	linux-sound@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 0/2] firewire: Simplify storing pointers in device id
 struct
Message-ID: <aed_ZwYj_ruoTAZc@monoceros>
References: <cover.1776579304.git.u.kleine-koenig@baylibre.com>
 <20260420090816.GA11108@sakamocchi.jp>
 <aeZk1I3DTmyx_ZUL@cae.in-ulm.de>
 <20260421125357.GA46532@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xdwet7gxvj3jtobv"
Content-Disposition: inline
In-Reply-To: <20260421125357.GA46532@sakamocchi.jp>


--xdwet7gxvj3jtobv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/2] firewire: Simplify storing pointers in device id
 struct
MIME-Version: 1.0

Hello Takashi,

On Tue, Apr 21, 2026 at 09:53:57PM +0900, Takashi Sakamoto wrote:
> On Mon, Apr 20, 2026 at 07:39:32PM +0200, Christian A. Ehrhardt wrote:
> > On Mon, Apr 20, 2026 at 06:08:16PM +0900, Takashi Sakamoto wrote:
> > > Just out of curiosity, what does the CHERI extension adopted to RISC-V
> > > architecture require in terms of kernel programming? Is taking extra
> > > care when storing pointer values in long-type variables sufficient in
> > > driver code?
> >=20
> > That is a significant part but there is more to it (entry code,
> > register size changes, the UABI should better be CHERI aware, ...).
> >=20
> > But the issue that a pointer does not fit into an unsigned long
> > is an issue that pops up all over the kernel while most other
> > changes are more localized.
> >=20
> > There is a working linux kernel in the CHERI alliance github here:
> >    https://github.com/CHERI-Alliance/linux/tree/codasip-cheri-riscv-6.18
> > That definitely needs more cleanup but it does work.
> > Previous work from ARM for the morello project (another CHERI
> > enabled platform) is available here:
> >    https://git.morello-project.org/morello/kernel/linux
> > These should give a rough idea of what is required.
> >=20
> > Fixing unsigned long vs. uintptr_t issues helps a lot with this
> > because it reduces the diff. But it is also a general cleanup.
>=20
> Thsnks for the references. It looks like there is not much to consider
> outside of mm subsystem. But I have some concerns if supporting
> ARM/RISC-V adoptation of CHERI extension in Linux FireWire subsystem.
>=20
> Any structures in UAPI header of this subsystem are defined with
> an assumption that the size of pointer in the existing System V
> architectures is up to 64 bits at most. We can see many usage of
> '__u64' type member for pointers (e.g. 'rom' in fw_cdev_get_info
> structure). I imagine to need defining specific structures for this kind
> of 'fat' pointer. (The same assumption lays on compat ioctl.)

The Standard C answer to that is: The assumption that you can fit a
pointer in an unsigned long or u64 is not generally justified. This is
"only" given for all current Linux archtectures. And if you want an
integer type to store a pointer, use uintptr_t. (And my position is that
you better try to keep pointers in pointer variables, though there are
some situations where you don't come around the conversion to an integer
type. That's why I introduced the union instead of converting to
uintptr_t.)

> As another concern is that the padding in structure. As long as I know,
> any 64 bit architecture for System V ABI has 8 bit alignment rule, and
> any structure in UAPI header of this subsystem are carefully defined not
> to have different sizes between x86/32bit/64bit architectures, except for
> 'fw_cdev_event_response' structure (see 'drivers/firewire/uapi-test.c').
> As a quick glance, the size of pointer in ARM CHERI extension seems to be
> 129 bit. In this case, what size of alignment rule is applied? Is there
> 7 bit padding after pointer member in any aggregates?

On CHERI pointers must be 128 bit aligned. Unaligned pointers yield a
hardware exception on usage. But that the ABI for CHERI is different
due to different sizes of some types is only a concern for CHERI-enabled
platforms. On non-CHERI everything stays as it is as
sizeof(union { kernel_ulong_t; void *; }) =3D=3D sizeof(kernel_ulong_t) =3D=
=3D
sizeof(void *) =3D=3D sizeof(uintptr_t). And there is no state that needs to
be maintained on CHERI-enabled systems, as they are new.

A pointer is 128 bit plus a validity flag that is stored elsewhere
(which is necessary to not give processes a means to craft valid
pointers). So for the purpose of a user space program and also for most
parts of the kernel, a pointer can be considered to be 128 bit as the
additional bit is (mostly) managed by hardware.

I see the challenge to introduce CHERI in mainline Linux somewhat
similar to the time when the first 64bit architectures came up and the
kernel still contained various assumptions about pointers and longs
being 32bit. Assuming CHERI keeps traction things will be addressed
over time and for the purpose of this series shouldn't be a concern now.

Best regards
Uwe

--xdwet7gxvj3jtobv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnnhKwACgkQj4D7WH0S
/k4lBQgAukzGaT3v/ioMCVK5rSUHCT19kx7VzpDUWI/LRvTy2wX9+ft17rQxeik9
UwAOcEX5RVnBVFLOPrZcMFLNnIq+Parn/K8MBprhZX9MdNbd7v0KjiQEv89cfkBv
xUnBrq0rcuFwTarlTUGasAz/R3fXil5PCZ9tnF9XNlnrUEWcIvMxvbo5a+CGto6H
7UCuYIkHDVMqu+YxkSJDKva7tKtwstw5a83iRKBfjFD36Ny1uRHdh9EFWEPWhG+t
1Mgxdoxc+L/AtaTdlDpfKELSALwvIGUqHZJdR4ITwTUYwxsmq3M2Gh0G7jWHFgTv
OjsiOJERj8ZvAABlFvdjgS+m4fSQ4Q==
=X8o7
-----END PGP SIGNATURE-----

--xdwet7gxvj3jtobv--
