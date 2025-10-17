Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41603332EA3
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 13:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760707546; cv=none; b=eg3I112nZATYWrOnEVhIYEUbuF0dv+goreCtSkhKgSY6ig/Cn0QhM8ygLmNI2TPflSa24B260p4X3PE+p8gyf6yCFX0bn9J1EBwj2txRUBxRGxPLCtflNdw2TL2zycgB1cn7ECupEDxlzfUf8tpUw4WNA2FeLoWuAgVcBRgF/ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760707546; c=relaxed/simple;
	bh=uSudNl+x6Xd9KAcDN+w65zp9X1SGg1eAjeVmyvdpkJI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OkIHJ/RNgarqIcNUjpk2RDZOsrfohI8vpFXhGQBF0aXDaANsD0QQnGIRjcTaY2JMsLGbig6CqxzFe6uWKI0m7LJelhUQ0Ciql362QabUVSUl0GMgsaj4aj3SGQwDQZB46q+E08rPancWhvQNz+QQt4mB159amBJvZODMtuSWZHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ua+b4fGY; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ua+b4fGY"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47117e75258so7502035e9.2
        for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 06:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760707543; x=1761312343; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K8lM7ZvUp1zMap3psFDgRuhP9QwjcdKf1uYP4pIRPcI=;
        b=Ua+b4fGYoR5K+ZC9JxJYlVCgD+JJqB/rKOeti6faznbQPiJ9kcY08Wf9PxWFHJgaj2
         oUelSQ8hcff8sYGhYugk8QaiaVjNGiiJz+DQ4CA7H+7yz0q/qqkT9UWtpGMlstWk20GO
         bMK2oGCkmLOWM3FA1XNJMvyBhlGUBI8C8daVcZ4Wg8PB2N4D40E73WKi3+9SuCHNAO7Z
         C4GFSaBnjgslN6iKwXvrhSHGf6RWKWLc/RjulCFXlg5xvPYdRePt7pSHuhjh1sJWOl+l
         i+lF+OIe8PL1003sSMRokG/A2NdzVB8ATtKBCJ7DH3pM8pjEYjhqrx9mwvro6VmDcTrl
         SdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760707543; x=1761312343;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K8lM7ZvUp1zMap3psFDgRuhP9QwjcdKf1uYP4pIRPcI=;
        b=qpfsYRGK758IIm6vNgAcyk7qKIY9ycACRL37wbpotn6Imxxy37kxfU9QuMDqPB301u
         KrOFy7810Xqzr0qisdineGKrXA5P6JSyQksjW0rCmTyEaU+z2COUDSB4PNb/dbpCjn3F
         YtLEyzmbQEZIe8LLoUm8qo8+AVBiIdIuMCvCFTFocDTN5sWfqZ0aDOKU1Dhwa0T2vBwg
         rBhPcm4eJ/r2LRtaxUr7jOg/bd8Huxg2RjdAHmYoszoUSQeHkaF4khCYQZ8vUrrFHn7C
         lrm5Bo+L7AGM2ImOz2eutoWZAxQ/g+uQUVDhkzU6IGaLLzadzhwiu79E6M3jK4QIlTos
         A07g==
X-Forwarded-Encrypted: i=1; AJvYcCWZkLykh1enZlCRVoIFkl+xIao5IcVEHz/yD6e4/V61uydQMCVHbHKVvm5x2DQkTZGzgJA/6BNhAHwgjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4JzgWJg9E8pR5PjSkuGAWUEFcmXBZPK7Syg/JUd8P1hsFxh9j
	fsuCAC0cfgQCADR+pX5ACyK2zxXPdEIA5qJP4Hr55hPf+lzl4OGn2HP4
X-Gm-Gg: ASbGnctrFbVkGG3fXl6WYLbPvdhr49ECt0sSXUNMv4haEC9hHqKeh8muZsqOYEgzpVN
	vzLMRsJBI1gAPrA6onwCAPxq131icE6FVDuN18yi5xlk1UkQ+3tDiPbsKudZN7rBcbU3wGuFUVi
	bCKt/p1E9voa3fUcxEUJ164orE9pzNkHN0HZQzNfWAnunDQAzf4uNC5w1hRfnyVwRcmLxMR+wmo
	PGF6K5gf3pMK18Q9FEZBbN4qGbta/I4uSZHWNDTL2jt5O7lV+8UHFYEaO5+dcbqCE4i6n9+Mi8y
	FUnVQFd4bzpRFwzW8gDcs4uURrRcat41aXL26DpXqe1c9xGjzvrkJxQ/bXltz4Bpdn5SpUP8NM9
	ra3ywtXQA9WETFrC5RBYSl1YXeC59YOWK3r9WfaXbqtLhzGMoKL54gnS9Lb/hw98giEi2D5XosQ
	3xyf3eSsnIbvweGsB4JjiAT3Szi1ue
X-Google-Smtp-Source: AGHT+IFMdil7b1DloC/aeqld8spghixzfaWyFDKRDf9hEI4e+WmQl+joRe2vmtjhz2LmX2ADYNftRg==
X-Received: by 2002:a05:600c:474a:b0:46f:b42e:e39c with SMTP id 5b1f17b1804b1-4711794902dmr26568555e9.41.1760707543361;
        Fri, 17 Oct 2025 06:25:43 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710e7050c6sm51417735e9.1.2025.10.17.06.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:25:42 -0700 (PDT)
Message-ID: <d6bd466a5d11b016183db0ac3c25185fad3036fc.camel@gmail.com>
Subject: Re: [PATCH 1/3] ASoC: cs4271: Fix cs4271 I2C and SPI drivers
 automatic module loading
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald	
 <rf@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	 <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela	
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Nikita Shubin	
 <nikita.shubin@maquefel.me>, Axel Lin <axel.lin@ingics.com>, Brian Austin	
 <brian.austin@cirrus.com>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Oct 2025 15:25:42 +0200
In-Reply-To: <20251017083232.31e53478@bootlin.com>
References: <20251016130340.1442090-1-herve.codina@bootlin.com>
			<20251016130340.1442090-2-herve.codina@bootlin.com>
			<60fbaaef249e6f5af602fe4087eab31cd70905de.camel@gmail.com>
		 <20251017083232.31e53478@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Herve,

On Fri, 2025-10-17 at 08:32 +0200, Herve Codina wrote:
> ...
>=20
> > > In order to have the I2C or the SPI module loaded automatically, move
> > > the MODULE_DEVICE_TABLE(of, ...) the core to I2C and SPI parts.
> > > Also move cs4271_dt_ids itself from the core part to I2C and SPI part=
s
> > > as both the call to MODULE_DEVICE_TABLE(of, ...) and the cs4271_dt_id=
s
> > > table itself need to be in the same file.=C2=A0=20
> >=20
> > I'm a bit confused by this change.
> > What do you have in SYSFS "uevent" entry for the real device?
>=20
> Here is my uevent content:
> --- 8<---
> # cat /sys/bus/i2c/devices/3-0010/uevent=20
> DRIVER=3Dcs4271
> OF_NAME=3Dcs4271
> OF_FULLNAME=3D/i2c@ff130000/cs4271@10
> OF_COMPATIBLE_0=3Dcirrus,cs4271
> OF_COMPATIBLE_N=3D1
> MODALIAS=3Dof:Ncs4271T(null)Ccirrus,cs4271
> #=20
> --- 8< ---

that's what I get with SPI-connected CS4271, and this is actually what I'd
expect (linux-next as of 2433b8476165):

# cat /sys/bus/spi/devices/spi0.0/uevent
DRIVER=3Dcs4271
OF_NAME=3Dcodec
OF_FULLNAME=3D/soc/spi@808a0000/codec@0
OF_COMPATIBLE_0=3Dcirrus,cs4271
OF_COMPATIBLE_N=3D1
MODALIAS=3Dspi:cs4271

> > If you consider spi_uevent() and i2c_device_uevent(), "MODALIAS=3D" in =
the
> > "uevent" should be prefixed with either "spi:" or "i2c:".
> > And this isn't what you adress in your patch.
> >=20
> > You provide [identical] "of:" prefixed modalias to two different module=
s
> > (not sure, how this should work), but cs4271 is not an MMIO device,
> > so it should not generate an "of:" prefixed uevent.
> >=20
> > Could you please show the relevant DT snippet for the affected HW?
>=20
> And this is the related DT part:
> --- 8< ---
> &i2c3 {
>  status =3D "okay";
>=20
>  cs4271@10 {
>  compatible =3D "cirrus,cs4271";
>  reg =3D <0x10>;
>  clocks =3D <&cru SCLK_I2S_8CH_OUT>;
>  clock-names =3D "mclk";
>=20
>  ...
>  };
> };
> --- 8< ---
>=20
> i2c3 is the following node:
> https://elixir.bootlin.com/linux/v6.17.1/source/arch/arm64/boot/dts/rockc=
hip/rk3399-base.dtsi#L732

the above looks OK to me on the first glance, I'm really puzzled what
is the reason for "of:" prefixed MODALIAS in the uevent for an i2c device.

I still believe, that the culprit is the creation of a platform device
from the DT for an i2c device.

I don't have any real I2C-connected CS4271, but I think I could fake one
in any DT just to verify how uevents would look like on my side.

> About the related module, I have the following:

I assume, this is with your patch applied though.

> --- 8< ---
> # modinfo snd_soc_cs4271_i2c
> filename:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /lib/modules/6.18.0-rc1xxxx=
-00050-g4fa36970abe5-dirty/kernel/sound/soc/codecs/snd-soc-cs4271-i2c.ko
> license:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GPL
> author:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Alexander Sverdli=
n <subaparts@yandex.ru>
> description:=C2=A0=C2=A0=C2=A0 ASoC CS4271 I2C Driver
> alias:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c:cs4271
> alias:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of:N*T*Ccirr=
us,cs4271C*
> alias:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of:N*T*Ccirr=
us,cs4271
> depends:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snd-soc-cs4271
> intree:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Y
> name:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snd_soc=
_cs4271_i2c
> vermagic:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.18.0-rc1xxxx-00050-g4fa36=
970abe5-dirty SMP preempt mod_unload aarch64
> #=20
> --- 8< ---

--=20
Alexander Sverdlin.
