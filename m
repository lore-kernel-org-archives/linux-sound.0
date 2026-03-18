Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D323F38F231
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 08:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823635; cv=pass; b=TgJXzH5oAk5zdn0CfB45xGB/QMD7Y2FTE8sAs5+cTUZvrj/plXLnfcXWjRzMhHrTAE1aCTB083F21nAYH1wsdNrleLMr/WS7eFISzz6ndTmniVFZzF0M3nzQPq7DEaCmFhICJ7JOcPXwe13OQwOk17pPXG6kre4JC60oGzee6O8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823635; c=relaxed/simple;
	bh=/df7Bk5n0RRFbF0Mk7wFm4tbv9pefyTHrec0whGPKKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OVhc4VyzsZOxXCF8v77yaftmcvRfq39c53Y+NfQ5FdCJHlG0bqYh6S3fA3yzc1+Iel57SpLNxetZBDSbXNoakv2swBCtQt//kRMMyNdSPZ3oqXe+ZygIF5wmszOr/u3lU8BBJ33Ft8hRJZhT4avKqXreaWlN9oK7jlqVxYE8sB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tk1JBHRJ; arc=pass smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tk1JBHRJ"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-40ea611d1a4so2660012fac.2
        for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 01:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773823633; cv=none;
        d=google.com; s=arc-20240605;
        b=gC5Nxq2usNYFuvcWxRCrYl99cLsPMrAxrp303gAiDMguX5x+MrpqdT5AwUia/gqzBz
         2vHtz0o6rvA5qRRMHnYdsoJtDA4x9SrGRuLfkF1w40PCHma/X2KrT9XA7xlwHqllzK1x
         vu3d35K8ywevXWFP/Po26kuEIJ70RcfzvKC0ONntN7qHFYbyfT4lhaE4X24/0PTgBHzo
         eewE3O4FU/anjD3ygFvQL/vUSbK2HKTxvbve6+KiMb2wHYgwFVueVBSmAg4GB0kDVGG7
         k+1K2k7paMg80QMSM+Ebd0x7QV8k8VwpD/dxQXADBqJHFQg0aR8ibaFWhYaPOdDMhZYT
         A6dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=83jPdky0qKJSRYzsoaPc+e5EHJzCiyWfR0yebjpaYT4=;
        fh=GYMD4ECm5jh7OzipjBpogqSiaWAfAQiqFwwzZtKqfhQ=;
        b=dQdGBlfsJQsAr2BvqJeXBMqgOV4GBRmDldByJXT+KDwKZv8kDm9F9LU3fwWh07no4K
         tW7nOJPf2fcig9DaFhvulS5tulA5Vbvi0QrPz3ZN0TGDb/EdlqoDGvksgn7ePsebHwnU
         o5PKP45nzOS9mVQaWKRuI776ZpRUeyJYRV+7bRoN9l08j0kCJqx1bc2tp5N5TVoUggvy
         svabqsR73g0iUJtGsu0QoZqlaYbQ4lrahsqyUMrRDuA0Pzpo8POAFt+SpTsg5Rbn/rYJ
         2iFslXbMLvfRjK0aLUAMf6FKZL/207Fq7P6vJ/qDjnRCqHbzfOV9i5fcba9DGgfZgfZd
         Ajfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773823633; x=1774428433; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83jPdky0qKJSRYzsoaPc+e5EHJzCiyWfR0yebjpaYT4=;
        b=Tk1JBHRJmqkngoZZFORRZnndXJqvw60seoR7Gzi1w8gpo7xK7fKczp7g5tACJ70VCj
         QV/FqLPZ5NvfJqncWVKsYmD0ZBQrluQ4gFWpd6coDODxmLzxklVJADGJGrJkMW4KUUoT
         ZeltCIZMwNT/+nJZGejM8iIiu/UV27skGIVMIXWJnCpFe3UyNaF/CBwxSgJ4pEerNGwq
         9Dc3peezNCrdfjbOgH3UqlS0hQ2he5fCGnH1RFVFq9j3AipwVtpryi6piCPRfzepGJb3
         unYbc62Ak6ym0zirMArE3Wql+M0e+lbyLkaMDEQP82j9f23gKdzBv+rU9jsf/oOGtwtb
         vZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823633; x=1774428433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=83jPdky0qKJSRYzsoaPc+e5EHJzCiyWfR0yebjpaYT4=;
        b=n43fZBC6Fy+R1Uo/d0dBwuCZBB6gJZXmOU97jfwWlEwz6efxxf2GmYBoO5NxQZ+a95
         SnfW3JR8EJzTl9uC0RR19LKjAcWoTrjgMsPyQMCEWq7NnqxvWk5m6WRlvDfNOx2mFi/x
         Cd++/MjE/zFCFX7H+/+G12I6KvcUmq8EkWgu8+in0HYe+Et+xKGdo2rEeipIFED0O5XY
         Ghu1st8wxPt/TPlOtHWDdv+wzxpFvpmEjLCyREq/Sa/JxfG4thm70gKJ1UPAJFWogf7u
         gPBnmQ++gexNHp0iQXFaOmAOxEHSIwjtg6NhSHTbtX7qMqeibLRjm6j4ruufsDzzv8V+
         FKag==
X-Forwarded-Encrypted: i=1; AJvYcCX4+SkN+kK/8tF7jjhLdQnK4/FYFSAjJ7r+E/w7STpNuQZmKyGMbVf0BXnJUpCJJSwbqjitTVKj1inTHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJmYNl4je0lEHuTwvDIKsb5zhXuU8k7oFuplH2P67XqoFryYUM
	JTFcpOn0WY6z9agFvsSjCaVV9fgMBmTY4hS+Y6i4Ctst7Ll4OUHpwXWMKxWn6aOku1P2ZZrhxwB
	0hUA7YVT07teMtHAuzxklpK/0PQCutOM=
X-Gm-Gg: ATEYQzzMB3R05ZXRTQf4yzwCC7UsJiDR+9Pe1vonm6ZAIYazQ8BUGoNmQDvbWpnQ6b6
	ut9G7pIuVshu/lgz0Xlj9twYtk8PCQsn1AzFkz7usuwqhjqNmuJbgQzmzsuckxfwtiMBMUSgaT2
	VnidlaGOahBeinst87D93ibfiNnlKLLO2CRlYKJYbGaRfsn9dptZlqKE7AKS7vpImZjudwjxXID
	uVNuNsjnE6bMgPQgHBce2hM1ZKR3P9W9Amgq/nuPlFdmml0Y6HDWSIVN+Omal801cqPljCdUv1J
	h+yEUH15RZpKIZY4KBfP+xozmP0CK2+syvR7H72fUghWBv21FwN4hhj7HrTXe/Ikd86AQTrEGq0
	=
X-Received: by 2002:a05:6871:286:b0:417:64ba:82cc with SMTP id
 586e51a60fabf-41bd421a82cmr1862712fac.43.1773823632659; Wed, 18 Mar 2026
 01:47:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317185920.43387-1-hanguidong02@gmail.com>
 <20260317191538.43535-1-hanguidong02@gmail.com> <c14b399c9c6bf96f8c7d33615561b0d787ff175b@intel.com>
 <CALbr=LadoX8g--rtU==HQfNQ9f1=KP=7AS-PGfooKaSbnYPz+Q@mail.gmail.com> <8ac4b6ef2dfbc1dce0047dee55f2df609287a3ec@intel.com>
In-Reply-To: <8ac4b6ef2dfbc1dce0047dee55f2df609287a3ec@intel.com>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Wed, 18 Mar 2026 16:47:00 +0800
X-Gm-Features: AaiRm51Yf9dm9cacIuRM_2DJNr3deiXg0cux6KcppyZN1nJwEpt6FR9vmcrqdC8
Message-ID: <CALbr=LboxkVoFrRmZoq7LN=LTL+-ZgoUiTi6utSDEw7M_qX8bA@mail.gmail.com>
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

On Wed, Mar 18, 2026 at 4:32=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Wed, 18 Mar 2026, Gui-Dong Han <hanguidong02@gmail.com> wrote:
> > On Wed, Mar 18, 2026 at 4:12=E2=80=AFAM Jani Nikula <jani.nikula@linux.=
intel.com> wrote:
> >>
> >> On Wed, 18 Mar 2026, Gui-Dong Han <hanguidong02@gmail.com> wrote:
> >> > Passing NULL to debugfs_create_str() causes a NULL pointer dereferen=
ce
> >> > upon reading, and is no longer permitted. Change the default values =
of
> >> > dmc_firmware_path and vbt_firmware to empty strings ("").
> >> >
> >> > Existing code that consumes these parameters already verifies both
> >> > pointer validity and string length, so empty strings are handled
> >> > correctly. Furthermore, heap allocation is not required here: these
> >> > debugfs parameters are created with strictly read-only permissions
> >> > (0400). As a result, the debugfs write operation is never invoked,
> >> > meaning the static empty string will not be erroneously freed by
> >> > kfree().
> >> >
> >> > Fixes: e9913f0bd2e1 ("drm/i915/display: move dmc_firmware_path to di=
splay params")
> >> > Fixes: 29292bc6cc37 ("drm/i915/display: Move vbt_firmware module par=
ameter under display")
> >> > Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
> >> > ---
> >> >  drivers/gpu/drm/i915/display/intel_display_params.h | 4 ++--
> >> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/d=
rivers/gpu/drm/i915/display/intel_display_params.h
> >> > index b95ecf728daa..0a8cad98d480 100644
> >> > --- a/drivers/gpu/drm/i915/display/intel_display_params.h
> >> > +++ b/drivers/gpu/drm/i915/display/intel_display_params.h
> >> > @@ -23,8 +23,8 @@ struct drm_printer;
> >> >   *       debugfs file
> >> >   */
> >> >  #define INTEL_DISPLAY_PARAMS_FOR_EACH(param) \
> >> > -     param(char *, dmc_firmware_path, NULL, 0400) \
> >> > -     param(char *, vbt_firmware, NULL, 0400) \
> >> > +     param(char *, dmc_firmware_path, "", 0400) \
> >> > +     param(char *, vbt_firmware, "", 0400) \
> >>
> >> Admittedly this is all very convoluted, but these NULL pointers (or
> >> pointers to them) are never passed to debugfs_create_str().
> >
> > Hi Jani,
> >
> > Thanks for your review.
> >
> > Could you elaborate on why they are never passed? Looking at
> > intel_display_debugfs_params.c, the intel_display_debugfs_params()
> > function iterates over INTEL_DISPLAY_PARAMS_FOR_EACH using the
> > REGISTER macro. This eventually calls
> > _intel_display_param_create_file(), which uses _Generic to dispatch
> > char ** types to debugfs_create_str().
>
> In _intel_display_param_create_file(), valp is &display->params.x, where
> x is dmc_firmware_path or vbt_firmware.
>
> display->params gets initialized using intel_display_params_copy() when
> struct intel_display is allocated in intel_display_device_probe(). In
> intel_display_params_copy(), _param_dup_charp() handles the NULL
> initializer.
>
> Granted, if the kstrdup() fails, you could end up having NULL there, but
> at that point it's fine if your debugfs_create_str() change barfs and
> bails out.
>
> Like I said, it's convoluted. ;)

Ah, that makes perfect sense.

Thanks for taking the time to explain this in detail! Then we could
drop this patch from the series.

Thanks.
