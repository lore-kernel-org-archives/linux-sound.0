Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F8F32F74D
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 13:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757078251; cv=none; b=a+HmtGSiy01WhtScN7IZ4bmADtppYX00ChRzwu+wRzQG4yIf362yPuqxyY6M2P0BCfiV0CCgmiz/XbyNUVnSWpRlUos41iMluAWjm1vRzpdrQJidqNJV2d2m5WTshbSHBqmd3T5Oks03qIYQ/QjQYClB92VzQF0eDv86YoqZz0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757078251; c=relaxed/simple;
	bh=Zkcfo2o+FE6Dr4HEv24TNQj8qmjc9xyPL7FgDWm8KHI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=mWhX4WkCwqyb+dd9v4uNDSGqhBQ84P5qVn4ADzejPe1Afr++/f+YsQ2GsT7qhzPefnk79b3JxnrTEQjMigBW61RH1CnFOAy1iydmrryfpwOOdvH4jvYmD3xtbtS7D73e7X1IAx1/Vo9ZcC/Y6ClFyG1I7yVyIMRMxb7h71ZscMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=c6xA49R1; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="c6xA49R1"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45b9853e630so19923435e9.0
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 06:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1757078247; x=1757683047; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJshM4vbpP3v/V9FLXmj0qYGNjvFFxUjZMAI3TJgc4s=;
        b=c6xA49R1lZZsa9lNUDxW7ls82CgEr7aqABHU7cnhytHRQvvj//CMif2c8OEQa4BhXx
         THk7tSxPunxlyjYbvLKIsVjS260BXBbW0Jj/fdAyaIs+IiNiPpjcXwADWzDdIx5nwumh
         CPo1EHeUrjeW9Bsrh48RPPPGO+zMQj/6FnGBKqnta9ArhlrFZmOpNFZHk3rxyl2VWG9j
         Q2wGQkmLdWYqBghfceBEFaNRcIQiA1sl+0NOWdS3IpzbLpbOpyd91wBpqU4Lqnvn6dHs
         X30RynKOlxgcK3UjQjemdGs0c1zIvyLo8lOcMSAqxXUt7Pr6PP8+kxVee6379qWWBTU+
         kKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757078247; x=1757683047;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WJshM4vbpP3v/V9FLXmj0qYGNjvFFxUjZMAI3TJgc4s=;
        b=P/YlWuodI9FnwU1Q2Vn4la3SWzYcavoZ/EY+ofi67EZDc2f5giUICO8pTh9/3Hng3a
         JVkc+/e3WCy1rVGSfp5vb/hyeQUEbu4GggE8IV7c2E2dDkSDXeP4zrc53OECEvW6Zasa
         aGkYZ1iP03ZP+rf/1FVbVbzQk7OrJqUvIhg6Lle31nXh/itgBYo6phmLm/hFV+BM075Z
         +fTkP0iWSuT/RZ9x5juZ4BRCTuNVmJNXOQLtNBeme7Yir8oCXds8P55jLZDMmZUBH3Kk
         3O4nDR5KRdjm/9L9VDNxjah2u2ZHmF9D4AqgR4vfUt8RHacbPGsA11kFKKgsjzyw+mgy
         f0Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVN70MwRZmGFjjwEwB3aWIvZBjMNl62FPBlQqRucyfHB0PAD3MBH4g648P+F+QFYEmoBIggEE4uIUKSTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqGVvCoBF5d51JECerkYzLLcuj23jf3bISpx+9958Ag7LApKbC
	lKnWes4MUjzykwOTn9jDtzAe782/v6qxTesFN86iWEb01Dd+/oFBbftvq1OKMsVvvNc=
X-Gm-Gg: ASbGncu/ksrVPKNnjXN9ISbJqa+eBEWAL4F0bzwfZmk3jOh620RU250/Vmr996EwSQb
	gKj+Ifle4LeQi4FG2dWGmY9VBYVd3RklVWcv/rjAT6FJQjc4uWJSif4/PmU7jqRHjcW+vR95JR1
	2UoHDPS6MrCPMtXWCf49FARQMxhNBgY7UFGwp3vi/kq4vwrc1+hT5s52VmikhcRkoCRM73iVWcB
	aKoYEqm75mey1FMJKKbZIpsBdo3g0zE2vNTShXmd4prrxER+247u7rLRgB2dT1Ed0QMR2q6aD0e
	E+aJsHJPJ1eUzC09k6AXB/IYvBMYRiKoTadetD3vmmlgzNIX9UxTjqNxZLwD74jZjp//73YrHpR
	d2+WcJYSCrxMw+xT1CATs4im57fh54pZNK+XDMHbgDh6kXqYNyM5amtRuHktCSOKjzg4OJizs2I
	A+CDrZ/Zq1gepf6B5A12UzkRXgiBi9IjA=
X-Google-Smtp-Source: AGHT+IEak2G8rifngU86etW0UMHLHxbdNZaCmkkUUn45TG2/kT+5jZbAiVE6FF/g7hrDJkNzPjebNA==
X-Received: by 2002:a05:600c:35cb:b0:45d:cf5f:cff8 with SMTP id 5b1f17b1804b1-45ddc315be7mr8083565e9.11.1757078246688;
        Fri, 05 Sep 2025 06:17:26 -0700 (PDT)
Received: from localhost (ip-185-104-138-128.ptr.icomera.net. [185.104.138.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d978ab6fc7sm16412039f8f.45.2025.09.05.06.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 06:17:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Sep 2025 15:17:20 +0200
Message-Id: <DCKW943MHDZO.3QJRSTIXDW1C4@fairphone.com>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 "Wesley Cheng" <quic_wcheng@quicinc.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Dan Carpenter" <dan.carpenter@linaro.org>,
 <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] ALSA: qc_audio_offload: try to reduce address space
 confusion
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Arnd Bergmann" <arnd@arndb.de>, "Takashi Iwai" <tiwai@suse.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250513123442.159936-1-arnd@kernel.org>
 <20250513123442.159936-4-arnd@kernel.org>
 <DBR2363A95M1.L9XBNC003490@fairphone.com> <87v7n72pg0.wl-tiwai@suse.de>
 <DBR3FZGY4QS1.BX6M1PZS5RH4@fairphone.com> <87ms8j2on6.wl-tiwai@suse.de>
 <DCKUCB8A1JCV.1GK0TW2YMXNZP@fairphone.com>
 <246834be-9e72-432e-86e4-e1c68262e710@app.fastmail.com>
In-Reply-To: <246834be-9e72-432e-86e4-e1c68262e710@app.fastmail.com>

Hi Arnd,

On Fri Sep 5, 2025 at 2:08 PM CEST, Arnd Bergmann wrote:
> On Fri, Sep 5, 2025, at 13:47, Luca Weiss wrote:
>> On Fri Aug 1, 2025 at 2:49 PM CEST, Takashi Iwai wrote:
>>> On Fri, 01 Aug 2025 14:35:27 +0200,
>>>> On Fri Aug 1, 2025 at 2:31 PM CEST, Takashi Iwai wrote:
>>>> > On Fri, 01 Aug 2025 13:31:42 +0200,
>>>> >> On Tue May 13, 2025 at 2:34 PM CEST, Arnd Bergmann wrote:
>>>> >> >
>>>> >> > Make this more explicit by pulling the conversion out first
>>>> >> > and warning if it is not part of the linear map, and using the
>>>> >> > actual physical address to map into the iommu in place of the
>>>> >> > dma address that may already be iommu-mapped into the usb host.
>>>> >>=20
>>>> >> This patch is breaking USB audio offloading on Qualcomm devices on =
6.16,
>>>> >> as tested on sm6350 and sc7280-based smartphones.
>>>> >>=20
>>>> >> Let me know if I can be of any help to resolve this.
>>>> >
>>>> > I guess just dropping WARN_ON() would help?
>>>> >
>>>> > As far as I read the code, pa argument isn't used at all in
>>>> > uaudio_iommu_map() unless as sgt is NULL.  In this case, sgt is neve=
r
>>>> > NULL, hence the pa argument is just a placeholder.
>>>> > That said, the whole xfer_buf_pa (and its sanity check) can be dropp=
ed
>>>> > there.
>>>>=20
>>>> Just the WARN splat is not the problem, it's actually failing
>>>> afterwards. Without the patch it works as expected.
>>>
>>> That is, replace WARN_ON() with 0.
>>>
>>> 	if (0 /*WARN_ON(!page_is_ram(PFN_DOWN(xfer_buf_pa)))*/) {
>>> 		ret =3D -ENXIO;
>>> 		goto unmap_sync;
>>> 	}
>>
>> Yes, that appears to work fine as well. Playback works again.
>>
>
> This does mean that the address returned from xfer_buf is not
> a kernel address in the virtual map though, and converting it
> through virt_to_phys() makes the pa undefined for
> uaudio_iommu_map(). Can you print what that pa value
> is that you get here, and where that sits in the address space?

Adding a debug print gives me the following below.

  dev_err(uaudio_qdev->data->dev, "xfer_buf_pa=3D%llx\n", xfer_buf_pa);

Not sure what exactly you mean with "where that sits in the address
space" and how I can figure that out.

[  130.124938] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba0486ea6000
[  130.141583] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba0484be5000
[  130.145826] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba0484bfd000
[  130.150031] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba0484c0d000
[  130.155437] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba0484ec5000
[  130.159573] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba0484f0d000
[  130.164778] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba0484f2d000
[  130.180878] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba0484fe5000
[  130.185178] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba0485005000
[  130.189393] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba048507d000
[  130.194323] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba04850e5000
[  130.198375] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba048561d000
[  130.202280] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba0485655000
[  130.215915] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba04856a5000
[  130.219701] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba0486f15000
[  130.223351] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba04870b5000
[  130.227881] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba04871bd000
[  130.231780] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba04871dd000
[  130.235432] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba04871f5000
[  130.249669] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba0487525000
[  130.253451] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba048755d000
[  130.257113] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba048758d000
[  130.261473] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba04875c5000
[  130.265226] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba04875d5000
[  130.268856] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba04875de000
[  130.283635] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba0486ed3000
[  130.287445] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba0486eca000
[  130.291147] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba04875e7000
[  130.295957] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba04875f0000
[  130.299995] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba0489fd5000
[  130.303607] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba0489fde000
[  130.317503] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba0489fe7000
[  130.321291] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba0489ff0000
[  130.324979] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba048a005000
[  130.329604] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba048a00e000
[  130.333397] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba048a01d000
[  130.337089] q6usb-dai 3000000.remoteproc:glink-edge:apr:service@4:usbd: =
xfer_buf_pa=3Dffffba048a026000

Regards
Luca
