Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C6E2C0261
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 17:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790702561; cv=pass; b=gLhNVVh4Kk56ntAD7hhP3g2XtYG+b/mYPN9RaH59ik7MguJGhz5D+bA9OdLovqgWySwggY4Kirpxkzod1K+XLPdF2WjN1zeSsfws5vadlDOPIMBXQDMjWyu+yI+O2MJeDZCY4p0NoXVVYKATLiXaO87W0UnMZL2qtYUc4PNDusk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790702561; c=relaxed/simple;
	bh=eXyEWE550+ycqkkgf2Pb87Qz+oDiZBp//OZdYRPDZCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mL/cVd0kNWHZ+6EGZx5hR/gl4fzKrGoV2dJzldoaHDfqrhmG/dnFne8C4q5nv5YchMjueT/v3FGw2R/ew3pfsy0R8BK6PVlS197gbfNUGJlBVFs6PwHXlhnlsCxX4BS8fVYugjift5u4hSmhfRTM3p7c/FJbK1CguQlji2WESuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ON5ZjlVC; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ON5ZjlVC"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba31af822cso1037062e87.1
        for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 10:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790702558; cv=none;
        d=google.com; s=arc-20260327;
        b=BaCQAB5FbLeBFW/dSrMGerZObC8pWYYz2b8Kx7zeuxvrhHKgDvqAUnDHy1EkJ0bNsH
         245A2/S6aHKqkkBw3Et9z+17Ky9vuR7SbHkmbU/KMUiwT77IIxTB21lEvWEsVhbyI0xi
         JKEaIAdRNUVN/XjB91xLgtNmAUmiPGbeh7+mlBXL4AQrtrFzMk+hzGa7NbKr77uJZuiv
         XNDwnEW6/FaUBdHxtWXfz0MHZrl6o6dbaNsCzXCGVSFuzhM6I+cycJ0uLICEtHLg5xdq
         YMPEoF6PPxIRJjK0RpsiwqtRg8qnWwOJJr40++Cje46JrkSewNEdcr9HjlIwHDpgDdlf
         zXYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wC73nxIKsVnxmirOrWNj6owYWyTLWTGRvdPe/YEwMgs=;
        fh=n7dc7f7+jJr6B9EfTkh+8c4qJXw6s+0MSbie8xoj2GY=;
        b=WpxmpFmTCP2sjzlKXHmxnhIpvI9CFUZ4F60LulFdUcGcwSIhhXhcA1qKldb2Q3QGqt
         k+noLTC6UXObYPhH91tPX9zsYol/55I25c358uQr9giNJ7fCebR9xuEAoJhVvaXa5klC
         T7tZHMBzfq6NR4Ku8p18JVvGRwId6wklAherH2Obifuu0sfC4ngMCqIfZommLgK1WG39
         7XrbCG5IQgPWFCl9OB14k2+UQGMH7/jrzNGXa8DAGa7vkys42m0YoV5iBfSldP+I377U
         hpL+lHp8IMqjEHMePP855Eg4CYb2z5JqVAZAjQhHH2CVGi4UOTeqUSwA5BtBWk29WM/z
         4vJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790702558; x=1791307358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wC73nxIKsVnxmirOrWNj6owYWyTLWTGRvdPe/YEwMgs=;
        b=ON5ZjlVCqB/TYA5/JG+HIffUcoeWHrUc2YnR4RgoPO6MuTy4TVUSzDWTA8NW4GRVbl
         nygA/N/lNdMooKu58birVRuuHjv/jD9/SPXvlWO+7UtXhImZzyvHwy+EJPKFUiRsVRSB
         JLHTFE4v5Am8GIq0NyugClwC10zo2hQ6+1lPwpGIoqlbOD0k4KdQHogxTBHGk2fBRGzV
         uztfTA53KoFVgec9MCIRtY2KsluAdRAbUVgvc5evHqe2NQZ5+mZdnD/Uu0Lz+HdW9wmy
         fX4Z62p8IhCk+Ssh/y4zZcujA4e6Uw2u9D6PK0Z0479jvsVv2m1NIinONx4GrcxZTPnu
         IqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790702558; x=1791307358;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wC73nxIKsVnxmirOrWNj6owYWyTLWTGRvdPe/YEwMgs=;
        b=Z6R4kzn3H4CR2kpceMqM1TtNHGe2uPifCh+oIQXvMHpHbtOzBfS8CziAdbP/csDnQF
         +bz5GLFwv72V6+QKRVRJHrNjBzc1r871OAzAIXdS3pNYgzw/H5hBIntPPtaeTumLbpkj
         x3Ll9h+gZZ9vcdNTd/b8pSeKHoOsHKpINKdhK8F5JAE7OYHnS5ngndDN29UvVef9Q6At
         lFkXOzRDUlyQ+IMja1Ng2raP0qrqYbyxihOTzYFiBXUDiKKQcHL4sVVqryGDwCJpuVmm
         uKfaYCDRvCj6o6H0tvd5Qg7jbV0rVpxec4/DXR0wRkOuPu6hUAvZSjgPkpE4TVzqSq/0
         ZkGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvWDFygjhCVWetbFf3GIm/5k+ldAoffhsWq2ZlSZl6qa/t7BbD9hm8gZJYjAK+e09BmbrDrWfmhGs5MA==@vger.kernel.org
X-Gm-Message-State: AFq9FYITriKGHkdjIsEIrUOiTfzfnVlY4sv5ce2/YdC6wWejSSCbG6kw
	nhlk62nR9yXj8oY99/1qNYGvstBXcSOOy3azW3Axn0W2ZN24wf5JpGrlH/qVvkWiECKO/Q9kwXC
	a8RBV2Kmd+ka6zbceoyi7fA/u2DQu14E=
X-Gm-Gg: AYBFou3AvJBevqHZPCzqNRWgaRfazfQlVgHI8QRe7stqtU0RlRFi6h7kRsRGprHU7Ft
	TM4BfG3fLjNk914sS/Dvvapzkmkj6O2NvAY36gODsP0cmoxJc9ktNFgmeYBvwt3aVyId+aJMXqx
	0V5I92kQrk8bkCEgh64/hm0FJj7NqE9osrhfnkEnwoXW5XYfcryZIasCuAwitt07VyXRakgiHzC
	YpZlzNtkeKv229I1yD5JI3AJE+ZH1h+pREwqdcTpSvJy+LrZ1/EcMsn5PfAmfmu/J7KqkIgJ/l4
	lmx8tpJ1+26tFy1bDwSQIuhVyTjjt/9efsyNowWhrdFovn9ydpgmYUn+IDAtoa3+1P/wodQXZh8
	GPCr9DWWhl7ayRfj910ZXVG4siZuwcI5xjWcRj2UgvUSR
X-Received: by 2002:a05:6512:2348:b0:5b8:edb8:fa41 with SMTP id
 2adb3069b0e04-5ba3beca9cbmr77162e87.46.1790702557344; Tue, 29 Sep 2026
 10:22:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-tegra194-hda-sdo-v1-1-f7a636a07a58@gmail.com> <aruc3qx7izFQYOhC@orome>
In-Reply-To: <aruc3qx7izFQYOhC@orome>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 29 Sep 2026 12:22:25 -0500
X-Gm-Features: AclHuK9LkfgEQsoTN_f-0RfKykcFSMYOYJZq1Uw5H4JV_On6s3wU6oygXAoVMzw
Message-ID: <CALHNRZ8RLs6mXkYiZ4qRimmf4WzpWpnJ9racWTPH__Op2Nk8kg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/tegra: Re-enable SDO workaround for Tegra194
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>, linux-sound@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 6:12=E2=80=AFAM Thierry Reding
<thierry.reding@kernel.org> wrote:
>
> On Sat, Sep 26, 2026 at 02:24:19AM -0500, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > This workaround was originally added for Tegra194, but no longer gets
> > applied for it. Commit 615d43540043 ("ALSA: hda/tegra: fix tegra-hda on
> > tegra30 soc") changed the guard to tegra30-hda, which worked because al=
l
> > affected archs had the fallback compatible. However, commit 7f0ea5acfc1=
9
> > ("arm64: tegra: Use correct compatible string for Tegra194 HDA") remove=
d
> > the fallback compatible for Tegra194, causing this to break.
> >
> > Fixes: 7f0ea5acfc19 ("arm64: tegra: Use correct compatible string for T=
egra194 HDA")
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > ALSA: hda/tegra: Re-enable SDO workaround for Tegra194
> > ---
> >  sound/hda/controllers/tegra.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
>
> Maybe we should move this out of of_device_is_compatible() conditionals
> and into hda_tegra_soc instead. That would make the checks for this a
> lot more consistent and robust.

I received a notification from Takashi Iwai that this has already been
picked up, but it was only sent to me and not the list. Not sure why.
But looking at -next, it's already there. Not sure if you would want
to have that pulled back for updates or do followups later.

Aaron
