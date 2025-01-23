Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A6B20C01B;
	Thu, 23 Jan 2025 09:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737625032; cv=none; b=rIV8TATpRcxz6zq5FHMdVhc5Xqiljb/EsOhjS8aKAs6ZIc7CaZaV+WuBlCyl5KJNA5v1a8ZsDid52lqBRCKJUh8bMrIzxUbr5SJNtxQmGlZLHbTLBNo4AmFmbHKUhjQ553sIS967ee0f4ux/vGbpHVieTbV595ihpKgbLWDPic8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737625032; c=relaxed/simple;
	bh=ORES4doKXC6OgsgwMH6RHCDGLKFDrfrIs5G5ttL2Zzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C6w8S4x81EHvnCOAttdh1iAakoZGShkRtlSaLrwuTHaY6sgZyiDNEkuOSoBc7o4L8EqTD5/o4zvPQo+kSlwonHkkJOfa/QtOFNYdvhj88+34qZIk8YRhabKfapIh7N9l3RQ+aCU9zrSRqFYP2FZEI79MCoXUY+LLi7GdaB+26Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tue1gKsO; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tue1gKsO"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so968747a91.3;
        Thu, 23 Jan 2025 01:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737625031; x=1738229831; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGdtcyOuxt2RT9+lwZ49StADKtuaRGfqxJOX+UkuwVA=;
        b=Tue1gKsOWVe4V4Hqp7z2IZJbV+vOn76maGne4fwDDSo4oYDQfouQstkS1RwwQbkZXl
         GMx1/X+F4zUsFkBJwv4e5256k2GYfenh3YBxqekrFJFOGUTAW59E+j2dsDXHJpvr+TUa
         h8N/j6cG/rO0/rq/VyhFSR/x/LXxJfc3OgJ0YD19Jk/j5GccQs+v1cQ79/46mbk1/4uG
         BZ1my9++PLFYlT9bGiqhnHz7r/UiP07Eu/Tfn7gBSIZBCUmSVJTLHbSinp71zbfNGLGE
         OCNAWx0ys7vKAta3KPMer2aqKbO8K126cBlJgR2+TyY8kvZgSceLhE46KQwbmeGEa++F
         Id+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737625031; x=1738229831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tGdtcyOuxt2RT9+lwZ49StADKtuaRGfqxJOX+UkuwVA=;
        b=uttSEYFtGasUUirMAhQ7mzZvgKakXK2SZMmjN+4f56nVYQRa/7KJiKH4Fkxd4Uxaxi
         xzlzktsptisQB8q0IaJ2YjwE6ZjCLlOiFrNBfi3x4M6f4F8YiI05mLo3Hgowrs0hrdEx
         wvvDzzAeH0R49xM7DDIgQqv1lfVZ0rpttAE7DV5S7KK3r3tqPrYZ0CxsxCm7yt9yVneD
         dMgAs/nb83ACSm1UYKDzbj4cjW8bXeWxs5qcwPxqj4518dhqDvx5GKvC6fbco4/73lqD
         fjmXIYeLcYWhZVytwFp2RUSjBIBix1BDt3b3djVF+JqoqkJaMlzET69eR8y45PdQqBoL
         rfrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY0oxlpqrOUNH5tk1N3lfJtFiy3g9cJeM+vsgoC3f7TIy7EbK9WC1oICOdkBM+rT78yk5Z9sTuSXR/@vger.kernel.org, AJvYcCVUHs1GJhwG+JjcJexbiw3KXwC5yvWmWUiGkyV89CHFlht5A6EoWHZdXN+GjLnIA/44MNCHfXF9ePjDLR9T@vger.kernel.org, AJvYcCWYm38ZbV19qnEhB274cvSFxycqzi5jy+rZMawDNF0zBRANq6VoYSacdV6snF39mdbXuAvQoPqmhpH9gTk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx05ntIaTwhemhEzQCKZa660KXHxAs8sVO8AwFO1acH06a5PY33
	1nf7aRv6siK9dI7K2yvddFD+qYcGA9egXin9SpWVeRYXC5X5fdQ+8BFPalB57LnRw2sN3fGwK5W
	ZfnbsIGEYrF/wgLuqP4Nxq9NSCZs=
X-Gm-Gg: ASbGncvFfx8HOBjNpVcHuMstH982CAErnStXIXWFIc7xTc+S+SGwuUGxpyMk13gZBps
	JH1BKG3WVq6MTHSqFCBrzF3FD3ubyuVULU3io7XXAEPevY6rnT7Xe3G/dqTcdzsl39yQh
X-Google-Smtp-Source: AGHT+IEnMgFwe2uphGhaoA/OBA129gWwd+aCRTnCgaLxT5Yp1e4QddEuW/hTHVRtS543vNaOnT6OHl9roo9y4uSZvco=
X-Received: by 2002:a17:90b:1f8b:b0:2f6:539:3cd8 with SMTP id
 98e67ed59e1d1-2f782ca2291mr40437766a91.18.1737625030669; Thu, 23 Jan 2025
 01:37:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122163544.1392869-1-daniel.baluta@nxp.com>
 <20250122163544.1392869-3-daniel.baluta@nxp.com> <Z5FNHnwvN+KeUrFY@lizhi-Precision-Tower-5810>
In-Reply-To: <Z5FNHnwvN+KeUrFY@lizhi-Precision-Tower-5810>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 23 Jan 2025 11:38:33 +0200
X-Gm-Features: AbW1kvb34GC_SCM7VSYzvFkZxRTCBRs29V4lQG1E1goV8dBrP-L8T9eLKeGMl2A
Message-ID: <CAEnQRZDcjwK39Ed00+mJw-epcUw2BV3snXsOBQ6-Mk-DXaxCdQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: SOF: imx: Add mach entry to select cs42888 topology
To: Frank Li <Frank.li@nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	broonie@kernel.org, shawnguo@kernel.org, conor+dt@kernel.org, 
	peng.fan@nxp.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com, 
	linux-sound@vger.kernel.org, imx@lists.linux.dev, 
	Liam Girdwood <liam.r.girdwood@intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 9:55=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Wed, Jan 22, 2025 at 06:35:42PM +0200, Daniel Baluta wrote:
> > After commit 2b9cdef13648 ("ASoC: SOF: imx: Add devicetree support
> > to select topologies") we select topology to be used by the board
> > compatible string in the dts.
>
> I am confused. why not use "sof-imx8-cs42888.tplg" in imx8's dts instead
> use board's compatible string "fsl,imx8qxp-mek-bb".
>
> More and more boards will be added in future. This file will become bigge=
r
> and bigger!

Hi Frank,

So you mean create a dts property named e.g sof-tplg-name and read the
topology name from dts?

dsp {
       firmware-name=3D"sof-imx8.ri";
       tplg-name =3D "sof-imx8-cs428888.tplg";
};


This was our first approach but then we aligned with the community on
using compatible to match
for properties like default fw path, default tplg path, fw name, tplg name.

Now dts should somehow describe the hardware not the software (e.g
tplg binary) used on that platform.
The growing number of boards will not be a problem, each one will have
a compatible in the dts.

But the concern here is how we describe a hardware setup where we have
a CPU board + a baseboard
like it is the case for cs42888 codec?

Our approach was that in our dts or overlay dts that describes SOF
with cs428888 codec to put the exact
compatible "fsl,imx8qxp-mek-bb" and match it with static vector in SOF
driver that you see in this patch.

SOF core relies on the compatible string in order to identify the
correct tplg_filename for example.

thanks,
Daniel.
