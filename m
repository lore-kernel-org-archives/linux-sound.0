Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50196303CBB
	for <linux-sound@vger.kernel.org>; Mon,  1 Dec 2025 10:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764586040; cv=none; b=IkXS4/jwEv10BMrvjkR++X7O0OtxgL1YfMV36nNHZvL0hbficd31MFHU24EpHziFsQZEJjnjN5EnVXE3q+EwRhMi9vCp4+NGE6PXRY6xWJ1Hujzv4ne3eGqG94+G09xMmfnaPtMyk4WIUczQg6pzB+cu9uc6iqb5ysZut1Ga1Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764586040; c=relaxed/simple;
	bh=ULD4yupbDE27rYGMxSf/jWwpZnWR3LhbXfbtdyZVFt0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d5SrDswn71NsJrugFkY6L2E4FXp3h5BfAJUnzRKc4RA9GauT1pYQDQ0U+cMLynfK3Qepzm5XbzwFa2OCt/1CctP/oqtIOXvAuAD/ZOZruRH0tRG5t4Eb1JYTNVu2o6OkloHfZhsfFFxVxhnDcFubYdFN8nSnz8fKTl4gd7hYkPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P7vS249u; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P7vS249u"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b79b9113651so11123166b.3
        for <linux-sound@vger.kernel.org>; Mon, 01 Dec 2025 02:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764586036; x=1765190836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V57w6qXgAFJm1uGpq7MxniYcmUVxpe3AE4JhOHgx7SY=;
        b=P7vS249uC5Era+J6/5voSrVj90DguQ6M3w90LlO1BVXyVFaaUVb4nIhhim3Q+B4c4l
         d/ognHb9fPwJO6ccim2VpFNS5Gog9nv7CMxp8MxD7UBYiKdgYNe2+fvu6CttHXRp0msR
         yPyg3kq1TvxXgwFeVy9/kR1z7Tn0U+i63QKPn/2YBVig4K5vDdfh8IHZ6tAdcwE7WeTc
         3JVMDMzZKqt7MQGL0VD3Ts6Mq2MotoFAZ4at5TXF8B8w5+pBuLle8oPrKZAxIkr1ZIvY
         N4SbYYotHjuEcNpUFawAmN3VeFnuTyXfQ155bCL+Jb6rocuniI9BO+a4Ipuq2kKMG9E5
         OIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764586036; x=1765190836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V57w6qXgAFJm1uGpq7MxniYcmUVxpe3AE4JhOHgx7SY=;
        b=FzFsT+hKTzO2BkU1JdZdJzQ74JxTzNltVphZ85/euyPuICZiKKl7CjjbRG6uwi/Vcu
         xtNSrgAqXs2PZ78E6DGuUE18z8BXYj3/f21QH+QRxYk/xJnU/a9MbMQQmpNrBix9A5Y6
         cAUYO5luIo+sQlzpzyF9YzBo+B6YuBu1nbV4vBw8z59MPeCT0LtyE7j1JCUhObbaqr0x
         OYHMUVmd7fl49w1bLunEBssmcxaoCNgcdgvRxTIlJriXS1cnvdEWy1GCXuso43m4+xhe
         lNa7tzPlye7GyM8qN48LieJpmrWq32QHe9Xv3mgYLfyKgFasJuafcWqkkK2yvg1PXsXy
         c8sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL1OhdBff1F8eDGHY47J6w3urSjESUTnDmLbvMptZidOYdOu/+kPaPsUKKrcxxVwzAvU2AL0+4LqvYYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJGvlEPG870lZc79RZ3rvwcAujva+8H8ZwNMEQ8abkSOpmAYkF
	Qms77S2Jk69Mdn2uZUnzIi6BRZUXL5VqKXdjNEx7R0DVyG17DcMjEGsD
X-Gm-Gg: ASbGnctR3ilfA+4O/I4gCwXoTvOJ3j/GBmzP06cnYYbpaFHi2mAqYtAfJ67DgpTWxSB
	Bcv8R4TGZAyIgiud4JijBSfqHEifGgapnRngI0yP7vNsI5n48sP32+bZNv1CAYUMgrM+YOtKQYH
	NAbqKtyIzd8vvWq5jcAwFGWkVAV0v6zR/7KDVZABcwebVUWmtmXViRTcMD+7ihJTlZnUIH2h7i8
	/L4ixslP9SNJCgpNLzAB1ZDHprNsgAMt/Qtw6bcxxJFoLZZZprdU6goH6X+P/QNsOX+8UaSQkqa
	cg7/XnF9p5k0M12Xz2kc2kjkf3P2Tl7m27BNkIuNJuwGHhkKHn0J+wxQkZqRMl7aCQCBZirYRxD
	hUlub2bdI5Z7eGntE6c3oroZx1TEc4yGVFKsKRiZlmZrpmwTlIdJlx1y1D7sdH77u5jvZKvqsNw
	22mQFSZdBmfTEuN4LaBM32ek9Y10I9iIs67g==
X-Google-Smtp-Source: AGHT+IHJ+rIlRaBl/+dxZ6W/cUfKTMrd7nfPT3/hTR/sz8+b2cY3NZEyeeFIVslJ/DYz5tNdaoswWw==
X-Received: by 2002:a17:907:6eac:b0:b73:42e5:a59e with SMTP id a640c23a62f3a-b76c5355c0cmr2647911666b.12.1764586035968;
        Mon, 01 Dec 2025 02:47:15 -0800 (PST)
Received: from foxbook (bfg212.neoplus.adsl.tpnet.pl. [83.28.44.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59a6a5csm1202548466b.41.2025.12.01.02.47.09
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 01 Dec 2025 02:47:10 -0800 (PST)
Date: Mon, 1 Dec 2025 11:47:05 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Dylan Robinson <dylan_robinson@motu.com>, linux-sound@vger.kernel.org,
 tiwai@suse.com, perex@perex.cz, linux-usb@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Fix max bytes-per-interval calculation
Message-ID: <20251201114705.470325f5.michal.pecio@gmail.com>
In-Reply-To: <87h5ubd8o7.wl-tiwai@suse.de>
References: <20251124210518.90054-1-dylan_robinson@motu.com>
	<20251129205639.48fdbdf9.michal.pecio@gmail.com>
	<87jyz7dc6k.wl-tiwai@suse.de>
	<20251130130035.6f44713e.michal.pecio@gmail.com>
	<87h5ubd8o7.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 30 Nov 2025 13:08:56 +0100, Takashi Iwai wrote:
> On Sun, 30 Nov 2025 13:00:35 +0100,
> Michal Pecio wrote:
> > 
> > On Sun, 30 Nov 2025 11:53:07 +0100, Takashi Iwai wrote:  
> > > On Sat, 29 Nov 2025 20:56:39 +0100,
> > > Michal Pecio wrote:  
> > > > 
> > > > On Mon, 24 Nov 2025 16:05:18 -0500, Dylan Robinson wrote:    
> > > > > The maxpacksize field in struct audioformat represents the maximum number
> > > > > of bytes per isochronous interval. The current implementation only
> > > > > special-cases high-speed endpoints and does not account for the different
> > > > > computations required for SuperSpeed, SuperSpeedPlus, or eUSB2. As a
> > > > > result, USB audio class devices operating at these speeds may fail to
> > > > > stream correctly. The issue was observed on a MOTU 16A (2025) interface,
> > > > > which requires more than 1024 bytes per interval at SuperSpeed.
> > > > > 
> > > > > This patch replaces the existing logic with a helper that computes the
> > > > > correct maximum bytes-per-interval for all USB speeds, borrowing the logic
> > > > > used in drivers/usb/core/urb.c.    
> > > > 
> > > > Hi,
> > > > 
> > > > Since v6.18 we have usb_endpoint_max_periodic_payload(), which looks
> > > > like the exact function you need. It is already used by uvcvideo and
> > > > xhci_hcd, the latter being particularly important because it ensures
> > > > that your endpoints will get the bandwidth allocation you expect.
> > > > 
> > > > The copy-pasta in urb.c should probably be cleaned up at this point,
> > > > but that would be a separate and unrelated patch, of course.    
> > > 
> > > Thanks for the information!  So we can clean up a lot with this new
> > > helper like below.  
> > 
> > Yes, something like that.
> > 
> > Note that there is a small gotcha here: Dylan's patch and the original
> > code, as well as usb_submit_urb(), didn't take wBytesPerInterval into
> > account, while usb_endpoint_max_periodic_payload() and xhci_hcd do.
> > 
> > Odd SuperSpeed endpoints like those below will now be considered to
> > have 512B/1536B capacity, not 1KB/2KB. Whether any such UAC devices
> > exist (mine is UVC) I don't know. My only SuperSpeed UAC device uses
> > one packet per interval and wMaxPacketSize == wBytesPerInterval.
> > 
> >         wMaxPacketSize     0x0400  1x 1024 bytes
> >         bInterval               1
> >         bMaxBurst               0
> >         wBytesPerInterval     512
> > 
> >         wMaxPacketSize     0x0400  1x 1024 bytes
> >         bInterval               1
> >         bMaxBurst               1       /* two packets per interval */
> >         wBytesPerInterval    1536
> > 
> > I also don't know whether this affects UAC operation in any way, but
> > it's something to watch out for.
> > 
> > Ignoring wBytesPerInterval wasn't right either, because xhci_hcd would
> > still reserve wBytesPerInterval bandwidth (as per spec) and URBs which
> > exceed that could complete with an error.
> > 
> > If a device is found where wBytesPerInterval makes no sense and must be
> > ignored, it needs to be ignored consistently across the kernel.  
> 
> Agreed, it makes more sense to have the common criteria applied to all
> places.

FWIW, I cherry-picked these two patches on v6.18 and confirmed that
my SuperSpeed HDMI capture adapter still works.

But that was not surprising, its audio endpoint is completely boring
and equivalent code existed in uvcvideo and xhci_hcd since forever.

      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes           13
          Transfer Type            Isochronous
          Synch Type               Synchronous
          Usage Type               Data
        wMaxPacketSize     0x00c0  1x 192 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        bMaxBurst               0
        wBytesPerInterval     192

Michal
