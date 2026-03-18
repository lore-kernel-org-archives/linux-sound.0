Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE9123EAB3
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 01:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773798829; cv=pass; b=Y9EL8bbD19wgeV7LSca854Ft3EUOONQy2DbFixtcWkpFxUZWeFSPQOwF+C9UU8KWwebIAUhdTDNkhAAakNuWQaDtfc787ViVK+Mxgq9k5EcZWXRAU/+YyUehXww7V1xYl+2aUVre0yPm92TVfSIADW3A36FwiyJNzDjrbOEQbbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773798829; c=relaxed/simple;
	bh=j/fbdLvsIeGkHXFDu5LJ9gF8XN9qrxlIYMkb21y2Ut4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QULoj0x//YrtnzvbnQFra+OkrLjewaH2E/82IuEtIbdWzu2I1BMCtX1ijkceHiek3nayuSJ9rVo+DtRiIVwRGk8AfYogXWb2WNTSEBcoINvKDG3OSJGjJbETLnEVnK81U2ZsaNqm/yFrHraE4zIoZDyHA4E7sBFy94o/11sS5ow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DxLwiHB6; arc=pass smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DxLwiHB6"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4043b909ed4so4106206fac.3
        for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 18:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773798827; cv=none;
        d=google.com; s=arc-20240605;
        b=FsFiSKJjd4SIJukyEKVwH9yAJwb/kEPMvFhCJiL/tJNiGQO+/mu65S/q0GuaARWf+L
         18IFdtZA0WUsoyZKVYZC8GcVbjWlDO2Ew9nRUhn+LN7VX4afAozrrkQ9/qpESKKpBwo+
         sFMBI/tixKTGVKEgyyQ7hDubJNeQgA97j6x/5XPZVUYFvCHMQHwv2XR0smNruxAzIAF1
         UqYqIZaAhHjg6k/rq+t9esquS/YcVaG8KmbBhLq/jw8vN/Lcp5t0nwfk4hTNNQEvfLnD
         /g48WuXifAv3xinnAx6A9FKGVJZaZ9pcDTr+AtvQNXYvveGNi2QKPqsX2IWdTEtl6VZm
         MrHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cp9Ep/hNNUKT/Q107TyB692cBkvdQAk6sieLmz8xQmg=;
        fh=7X/7ySfMpXqPyKqJDcv0s7mhO2BQolKo/8h28g3rMWM=;
        b=Uf3zMpUd+x1IOtnjHbrCflALGhygcmQFtPCgmTqkJKUmNseP99ObPEwXMkfiBz33cT
         oxqRwUb+6SKySPMJWeDfHZMviy9r0sGDucEJWgCXf6Er1lawEq2RqjblLU8y8t6FcT5r
         Dxuj+slt+CjQEFwuzY6IQgLslBRrJdCZs4hooNYazq2UJE1WWtA+13iTMn72BoF4oQE3
         mcqWSWLlNnQYF7IbmeWWM9DOFqgHavff8S5LVeWaBTuC3kcP/ZVQvNwP3elXCwsocQPU
         LojZqosTsZfZ6PgkKhCNAOT4sYMna9nGWhxcMWDi6gUO11uYN8wZj2G8Dsjzx/sA1wNd
         5oQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773798827; x=1774403627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cp9Ep/hNNUKT/Q107TyB692cBkvdQAk6sieLmz8xQmg=;
        b=DxLwiHB6s0B1UPECM4D5kZdxeCkOlzzd7GbPmP9ipJ/GaqycCvACw2PhYXDglbuztZ
         C5KmDxd7FBgjkUZlfYHtRUlUjUUvNFEF+uD5x68Dsm0Ndv2tIfE69UZSusU24JI3sK9Z
         tqJ+hwdAfBRWBtlkTk149iV1tK835l54Skwul9YHOeedBqpSHByeaNYta1sQlyrRFOP/
         wobZ0Om35v9oAxeTaxX+hpBsb5o2Nna25n/xSfTvOSbZ/Sa5ssKAjNcAsVo3Wquppm6R
         gHvFuczWX7iuz7G4+8uorEj/s7/4HhX46D0b5iqt5Fl5M947UknjL7zndEAU444CIFNj
         sINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773798827; x=1774403627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cp9Ep/hNNUKT/Q107TyB692cBkvdQAk6sieLmz8xQmg=;
        b=tF195CkRC3J/P9S4sRArVgYGxXJParQVVelg44VoXNGX3nWIsIBcQeGeZ9/tZ9YhOy
         zUf2zlNBO2G7ukIHUZry7ZbqKxH2uwdkkzJm89Av/a6DoZtLeELIEohGn5RA88TYLK+l
         3y0CukUxzWiAcX4e9Z6sUBN9eBw/oHr/v+dVmKdJGKrszbsP4lwkTMnJur3uy0fEjDU5
         8snmVccOe/KedZ21/AevilTVSNyp2cXqVO6qB+rcvOhsfD0btm5+h4+7VsZkEhwKguTy
         u6MVoOO5DoB0NCAigwfhH18U23A3X8ofpeZfQiuCyEAzpwfHRUySYvQMMYcD7gxB/dyI
         e5yw==
X-Forwarded-Encrypted: i=1; AJvYcCXrnLvEcNAQhwyEnlkHS1Vv5MZidlrdQCPoRYOa6Qr1Oc9CFKMWXStUHATgaWiQpfGyOdcELiWZw+vD9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5kNllaWCKVueGz90ZKiR/3QjEm1Ks783tr83NMV6tmM4chs3A
	DtR0fqf1cxZdRuj7cjLRBMVHgwHGFFRzBwktipKSEx1//y3eFuE9nhNXhV8aveHI2/KUYLLwDOV
	jZPg9VErVN1lEkjW6MITfQ43pRJDde9w=
X-Gm-Gg: ATEYQzyAh2+Nf+T6tEatdWiDDP/t3xvlyuj4GS9HgVEwdqj5wy8kFrZ8PtLmA+YszNW
	/kgp3L/fQMPSGJ79PNgYP+wOp8rzSLlsVLai9UWaxoz+7vLL4QYvn1kun8XFcYknciR+GaeOLTX
	Wnx9bnlGkQh9LZdKzX5n/dapz+b8v3TEBOdJDPlnxWN0lqXh66z5e4KoFUK9+q6gb0EV57ZGboK
	GTdZyF+4Np4LHMSuk1Qz7PM+Ftzpb22z++o13PW9vOlf1vSka34tXGWhQ0LVGOaZcnenl0amez3
	/UTJI9hXTsoNtIzYXKmiIO4gQtR4s27M7DxLpQW6CynsDGtPUAhGyjMTeIk8l7c/pD/vLnal3Tb
	+yxk7GAHYmQ==
X-Received: by 2002:a05:6870:ebcb:b0:417:1ba0:7320 with SMTP id
 586e51a60fabf-41bd41cda0bmr1126217fac.33.1773798826608; Tue, 17 Mar 2026
 18:53:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317185920.43387-1-hanguidong02@gmail.com>
 <20260317191538.43535-1-hanguidong02@gmail.com> <c14b399c9c6bf96f8c7d33615561b0d787ff175b@intel.com>
In-Reply-To: <c14b399c9c6bf96f8c7d33615561b0d787ff175b@intel.com>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Wed, 18 Mar 2026 09:53:36 +0800
X-Gm-Features: AaiRm52nR_v9OD3YNBiYZ0KMPL0_wApDenMFnYnmDk762NDAGBxD5i0lDEEX0xA
Message-ID: <CALbr=LadoX8g--rtU==HQfNQ9f1=KP=7AS-PGfooKaSbnYPz+Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/i915/display: initialize string params to empty strings
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: gregkh@linuxfoundation.org, dakr@kernel.org, rafael@kernel.org, 
	rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, 
	airlied@gmail.com, simona@ffwll.ch, gustavo.sousa@intel.com, 
	demarchi@kernel.org, jouni.hogander@intel.com, luciano.coelho@intel.com, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-sound@vger.kernel.org, 
	akaieurus@gmail.com, me@ziyao.cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 4:12=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Wed, 18 Mar 2026, Gui-Dong Han <hanguidong02@gmail.com> wrote:
> > Passing NULL to debugfs_create_str() causes a NULL pointer dereference
> > upon reading, and is no longer permitted. Change the default values of
> > dmc_firmware_path and vbt_firmware to empty strings ("").
> >
> > Existing code that consumes these parameters already verifies both
> > pointer validity and string length, so empty strings are handled
> > correctly. Furthermore, heap allocation is not required here: these
> > debugfs parameters are created with strictly read-only permissions
> > (0400). As a result, the debugfs write operation is never invoked,
> > meaning the static empty string will not be erroneously freed by
> > kfree().
> >
> > Fixes: e9913f0bd2e1 ("drm/i915/display: move dmc_firmware_path to displ=
ay params")
> > Fixes: 29292bc6cc37 ("drm/i915/display: Move vbt_firmware module parame=
ter under display")
> > Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display_params.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/driv=
ers/gpu/drm/i915/display/intel_display_params.h
> > index b95ecf728daa..0a8cad98d480 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_params.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_params.h
> > @@ -23,8 +23,8 @@ struct drm_printer;
> >   *       debugfs file
> >   */
> >  #define INTEL_DISPLAY_PARAMS_FOR_EACH(param) \
> > -     param(char *, dmc_firmware_path, NULL, 0400) \
> > -     param(char *, vbt_firmware, NULL, 0400) \
> > +     param(char *, dmc_firmware_path, "", 0400) \
> > +     param(char *, vbt_firmware, "", 0400) \
>
> Admittedly this is all very convoluted, but these NULL pointers (or
> pointers to them) are never passed to debugfs_create_str().

Hi Jani,

Thanks for your review.

Could you elaborate on why they are never passed? Looking at
intel_display_debugfs_params.c, the intel_display_debugfs_params()
function iterates over INTEL_DISPLAY_PARAMS_FOR_EACH using the
REGISTER macro. This eventually calls
_intel_display_param_create_file(), which uses _Generic to dispatch
char ** types to debugfs_create_str().

Thanks.
