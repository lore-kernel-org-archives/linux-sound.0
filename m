Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883DC43E484
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 11:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433686; cv=none; b=nGvCBdDguaARg3DT52NdSaGrE3ljlnMGlKZu7npwh5qk7qAmTcaoiQ0ipnhIKH+M5BONZM+GbiINs+Y2fcLssZgv1pH6ZTKjHO2EKngPiUIbUY0rcC+iGW0SX/7FYUulFrvD1h14GiyN4UlrQWmk6mFJiy39C7mx7yq3d6KMpfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433686; c=relaxed/simple;
	bh=rvqfTzgF9DKFA+Yqp28q1VjR4vNSXYyHAnl0lXZrYB8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s6Bwl2yBnhalY73t1d6yrqT4a1gcooSW+L2NqHtz2gnP3gAgMAq7cp20yNsJhzLVkXJG4u3dg9L2dBbFluZtESZVXnnhBYJqmFZHSK7niRCVdVgV5WHapHDz6YuI/obR+aSB9iZkPbSqghNCAZIrUeMeUiBnv9qyUIFWlEyVC40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhg/cmb4; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhg/cmb4"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso17910205e9.3
        for <linux-sound@vger.kernel.org>; Thu, 03 Sep 2026 04:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788433683; x=1789038483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CaxK+DYJmfoOuwo2W3mmfOdgw6rS/SBlQdw3Z3QKNfo=;
        b=fhg/cmb4CEhcMhNc1UVyMeqIZt2ScWuqrUtYFHJjRtzZxVHkVDnNFA6dib2vRuMns1
         aXBCJM9cbZeVvQSJ5WamyPOAL2mlqJlElhULAPV3rM4AzBAZByiHh7lL9+J+mAjbdRPV
         UcPTAvzEKclChA0lEv8klicIXdbeNq78YgKHFNngtAOdQqGZsL0XWn3SBF1bC8sMD0JB
         VDXVYyY1cK/vM3wtxPepsEnuyHIYLHoFNHqbWFEU94NK9DIaSgCjso5JpDIZ1yq4b1Gn
         DyWQ/1NUHIDEtaV3kt60mt2MCGB0Nr0ZJ57rUt9dpcyA67Q+K748wIJXPQ601BYYh7OS
         BMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788433683; x=1789038483;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CaxK+DYJmfoOuwo2W3mmfOdgw6rS/SBlQdw3Z3QKNfo=;
        b=bJsIceh42fUEBerliUjYZIylnefDphqDQgnCShCtF356lujd2IXElwETTXA+cu0LCk
         pH+eOZJwkks6uxAf6O/1iHichotagJTzO6MEjSaawz2jssJu3Ahy6YBRZQp9mIm/+9q5
         vSB4+Qj8+hAOWbLC9qbmBv1u07CIS0dQkHRtxdLCxLu6vscM+JKwxGKPxG2aPrU4xp/W
         Y1Iy1O4trZbybNO1tbbqve6TTHLApuEvBdE1Uc7qZAD57ihY0iqkcSY3qRPM+mH3E0uC
         DB+eMiWaVIedJ8M2vqXBWFf3i61fyjvAKx1b/JAkwFmMCmpDo9dH2UHhx5cHSWAkUZ43
         PXDw==
X-Forwarded-Encrypted: i=1; AKwUvByAExMCBWoXXf+iIbjvCw53VWC3fzi/44yEWsyTUwqmcBCP8kvrSW6xH4kpP33qtMG5pgdHreYNi2aNkA==@vger.kernel.org
X-Gm-Message-State: AFuF++kf05l1V2EYOBO/vZ/fvkVxE4f/CaOrTcn873GmBroSSgrgkXQ4
	KTBJ7F1h7QtOyHXnyeWlj46jYXZKg/TGIY+Z3SjqCmCzSCD37njjsXbx
X-Gm-Gg: AYBFou083PMzRBJ7jJFx/HNGA+VNN9oBsn+XdIzSMSm6Xz2XUP3vkUk9LT0Jpd7UD30
	wpX5TOjR/PS2/66ou9+2EN1hhFQds+UqmAMxdE4uBZO9usId74EjFFRBB48RxIaljYjMtpyJEMI
	J280s4epFhcWZ6Fjap1tBJHv8eKiLVHacQtzaCP6wnC2suNzu02g0kBKPVHqDy7uWEVA1/f52Yr
	OMMLUK/YEtqMYUyxCbgwSDscsQAn1dVEdleIpxb0VETP02dSS1CA5lIbaj0ARcTiEtbiJ0M6rJT
	LW1QLg8ZAoxmSa5hkCSA/TpKyS9ztXsRTdZ8fEqJZz8FVLk0dnl6/HC4HMmsNhEMnSm+37O/td/
	raTlGdCLhxpMPoC25zjttGi8TFl/Oqrq1UaAwziOu5/9k8z2kixL/unpmf0MzJTRXawLfcpWGwT
	+597ywGzBYTemN9Omt8bpE4b9F4xHgyls1J3bYF+b/NeZlOJ1/69vdgVSr5ZHxUu0w19pmvA==
X-Received: by 2002:a05:600c:4ed1:b0:49c:cee2:a508 with SMTP id 5b1f17b1804b1-49ce582984dmr169781305e9.16.1788433682585;
        Thu, 03 Sep 2026 04:08:02 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea5b4sm13400768f8f.27.2026.09.03.04.08.01
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 03 Sep 2026 04:08:02 -0700 (PDT)
Date: Thu, 3 Sep 2026 13:07:57 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: syzbot <syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com>,
 bolewara@gmail.com, devnull@kernel.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-usb@vger.kernel.org, mchehab@kernel.org,
 syzkaller-bugs@googlegroups.com, Daniel Mack <zonque@gmail.com>, Takashi
 Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: DIY allocation or embedding of URBs in larger structures
Message-ID: <20260903130757.0668310a.michal.pecio@gmail.com>
In-Reply-To: <87o6ee8y9e.wl-tiwai@suse.de>
References: <6a6e9502.f794c993.27aeb.0018.GAE@google.com>
	<6a97af8d.27a413cd.1e878c.0004.GAE@google.com>
	<20260903112417.21b76017.michal.pecio@gmail.com>
	<87o6ee8y9e.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 03 Sep 2026 11:44:45 +0200, Takashi Iwai wrote:
> On Thu, 03 Sep 2026 11:24:17 +0200,
> Michal Pecio wrote:
> > So what happens here is that USB core continues to use a URB after
> > completion to implement things like usb_kill_urb(), so URBs are
> > reference counted. Then core decrements the count - one more use.
> > 
> > If a driver waits for completion or even usb_kill_urb() to return
> > and then proceeds to free the URB's storage, this becomes a UAF.
> > This driver embeds 2 URBs in its priv and does just that.
> > 
> > A URB can only exist as an independent allocation, core will free
> > it if upon finding zero reference count in such case.
>
> So, IIUC, now the URB *must* be always allocated via usb_alloc_urb()
> and an embedded URB isn't allowed?  If so, we'd need to address other
> drivers, too.

Yes, that's basically the case and actually has been for a long time.

The only thing that works is for both USB and the driver to call
usb_free_urb() and whoever does last will actually free the storage.
This means URB can't share storage with anything else.

Some drivers got away with making URB the first member of a struct
which is freed together with it. AFAIK this pattern doesn't crash, but
it's deprecated too because it puts a flexible member (in the URB) in
the middle of (the outer) struct.

This pattern here in caiaq has always been one race away from UAF.
Maybe it wasn't very likely to happen, but stuff like PREEMPT_RT and
hypervisors can insert unexpected delays anywhere these days.

Greg KH puts it thusly:
https://lore.kernel.org/linux-usb/2025120716-sway-hypnotic-8cb6@gregkh/

Reragds,
Michal
