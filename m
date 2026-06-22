Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4605A3290BA
	for <linux-sound@vger.kernel.org>; Mon, 22 Jun 2026 02:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782096782; cv=none; b=Nayg8LGiNFbTmT+h6Ty1rjQDGiLdF2bC/t9e8j5HAtLN0lqonOvoyxnJh+h9ZJR8pgH4LsbNGtbH/90Zu3wQB+e7Mlgcu0gzZfjEpXFq8Rhwg1etd+UPBiiaZ1ijDLcHhef4uunjAtWrs/AwDLEO6cVd/IuzidbLtuYL1f6Mcvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782096782; c=relaxed/simple;
	bh=Te7Hb6ZeHfewLmCXLOt84MDrnLPBIAtc5upNKbgCL5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PhOup0GNl+U9FvaK74axVJRt1jhNwlKZgSwAv8brvFzaEN+ZVbJTsrRxV7fCZ5W8iUZ7XDpAg4KcrcskVTQq+WptsbCi5SzwKLldZII0/DNG+AJHdlekpe9QIObtgY5dld7ugzW06Jh/dsKepk1heQCKNc5HhEyNP3JH2estR+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZNnLkg1; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZNnLkg1"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-59ebde7d704so1199746e0c.2
        for <linux-sound@vger.kernel.org>; Sun, 21 Jun 2026 19:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782096780; x=1782701580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Iz6vz2U70Lxq5ZcyU1Zt1hi3mtfnGe5Gf7SP0pIxb0=;
        b=hZNnLkg138FepA71S/zOEyhgMmWR1BO6ketXvcDROhmtvK+hIw3HNwedksrJRGHFD3
         el1pxGVIHhNUjFrSyB5UmaqyQPS8fHDaVqUqUOYiNGsZ8QG9DMGRXOzjJiCT1Kf0YH3f
         vqDNUgJOJtDbwcV1Bp53UQwK6+avD7WUrfHKOqypjyuPkXUm2u9kgKkMhyF75FE1nR8f
         Lb7CFvq7Q0GexX4mYb/znDywPcN1lcmzpra4voiIj9P9O73D4BHxDyXAJVAFrdNTn/6+
         BgPwPx0Q/zyF8Y1bQLxiPKsF1yzaRlcOgzCCVT1itaZa9K2k1Bl7AhOllEbCbumqJ/It
         vsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782096780; x=1782701580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Iz6vz2U70Lxq5ZcyU1Zt1hi3mtfnGe5Gf7SP0pIxb0=;
        b=YT6tma2+lHvMtN6HpuorpPNEr6wwpPPR7gkS5n+n55Eisr/7g1ACPrLFRP8SEFK12Q
         XtNOocmtGECkvIbErx486QW9fXPs4/WfDubfmHhlo8jzJedfPzWo8PkVbF8zTsR3M8A9
         1XgsFBXTwmKcXTbwVpCFESZ215C1MI3KBK5UutVhLKPRe7QWWoCePS18G9d9sfl0w8D1
         taIBDVmWYbNitqTXpelMHAd1MCIHxKPBa70oYZQDcDhZmY67E9YhX7DBzU0U+9TfyQVu
         q7klRFpNCF/AFaJHh8o7C3PaO6Paw+IIAiGA3zmPxQksvB6gJ1qp/GHcKfFr/iMzfnH3
         /WUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8GCm3WItjCghJEZAkivHswTVWEaiWh9bkWrDj80BwBuXQoVlXj6Y72W5vdSys6zlJrp4h6Y/ZPVdRPRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcIKa5NbefcxSrlumHxTyMlb6VODGAKU2uCW+ytu8CpJkNw4EJ
	Gvz7G47XDx/chB0o74Z1QXh97dOVzIPnDGzwNplrcKR6f94e2T0FaFtf
X-Gm-Gg: AfdE7ckg452c49nGEDCFCPbOb5jPpAujQ0uFhX5hPRJdZjNkglE1Xf26l/ZebBvHaQp
	Ms12cP32mZuTtgJtMW+Qc2c5aVMkLQJaVIlBx918M3ie72JA1w0ezXudWUe7SnVHM0g3667gVOW
	fYc/YcW5jiPGpRHlMjARXyXcDybiudBvImF3SAl5ckTYIihKsN/xF2oDufRENWR8Pb6iIMn1cWs
	TbmqcnvZfH5RRcw6JUn8TaIXwf1+VxXIv2p0ZyboJqPAqwFOmay22wjWS/JCq8PI78uxcQaQ+4B
	snKHW2RxQHT9Z8h9Zr/Yl/JIae36YL5CG/BMJ3/Xqra29nZiWDHsaAbyDmo+YsUxeeCM2t/vw6L
	vPKGLQLLxt508ieYMxq+/a3POskJaJoWmdbz7uoxM1bqvcxnr0FLeiFM4VlLAzsA/k7gFO6z4sy
	CcdyN2Z1IBY0RTnL1gb16EDXdg1VyBAfRSRM0i4lvGZGvCpqv4zrqVflCZ3+qHLjMQDDkarDFkN
	dCBJsvfM3Asjuci
X-Received: by 2002:a05:6122:3a0c:b0:59d:6004:d453 with SMTP id 71dfb90a1353d-5bbeb9d323cmr5439885e0c.2.1782096780103;
        Sun, 21 Jun 2026 19:53:00 -0700 (PDT)
Received: from alsa-dev.int.suenodeluz.com.do ([74.244.193.74])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbfbaa60dasm5591425e0c.16.2026.06.21.19.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 19:52:58 -0700 (PDT)
Date: Sun, 21 Jun 2026 22:52:55 -0400
From: Frank van de Pol <fvdpol@gmail.com>
To: tiwai@suse.de, perex@perex.cz
Cc: ramiserifpersia@gmail.com, rmxpzlb@gmail.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] ALSA: usb: Add support for Reloop Jockey 3 DJ
 controllers
Message-ID: <7q5bteijophsihzwiorfnwbkdd4kjioy4sac7v4pedcss4rgka@w2dppbyu7bsl>
References: <20260622011131.1748298-1-fvdpol@gmail.com>
 <20260622011131.1748298-2-fvdpol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622011131.1748298-2-fvdpol@gmail.com>

On Sun, Jun 21, 2026 at 09:11:30PM -0400, Frank van de Pol wrote:
> Introduce a dedicated repository subdirectory and driver for the Reloop
> Jockey 3 Master Edition and Reloop Jockey 3 Remix USB DJ controllers.
>

The Sashiko review for the latest version of my patch has quite a few
interesting observations/questions...  which I need to have a closer look
at and likely need to correct.

https://sashiko.dev/#/patchset/20260622011131.1748298-2-fvdpol%40gmail.com


@Takashi, please let me know if the changes made to reduce repetative
patterns and improving readability are going in the right direction and/or
any further comments/observations.

Appreciate any feedback,
Hope to get ready for a v4 patch next weekend.

Best regards,
Frank.
