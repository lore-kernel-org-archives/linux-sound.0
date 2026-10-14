Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F9947F3BD
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 09:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969429; cv=none; b=gfoer1dim5v7cDpsFc0YVZe4DEs7Bv/U3LTxp0vyV+S98rCXmbCPLD147tYMl3Ro63PvndMjHL8UtGRTEahLuopKvFqBu9/AhNm1Y727jCYsW7wkJ/UyqpBt7lBCmJjWjTEYZ4zwXpvJNZ5Xw+Am2jRISkm1N/BzGGyGr/PddRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969429; c=relaxed/simple;
	bh=oKJsVFLubvLsj5D35e53rnVR+8UYd1QDrDrjPrGaDLY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I2riFwmE1SD1sdldBBBaQbvD7WXUFnulGteUp8iw+jmnQ1EH9ZqBXJEhjWCGA6kbkcNndnE4XLhKFU1wap9Sl+OAWQzVe55olRUL5/Xeqg0N/rQt7ZjX0r9mtJd61E3ZOPVrUElINOCxPwOswKKUBarEkzgWABbD4afbjUyuBPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKOSo4IU; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKOSo4IU"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso6286745e9.3
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 02:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791969426; x=1792574226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jo2PRIALCUq4kxjl1uc95AJMEIZIxh5cvF+ejGasI4Q=;
        b=YKOSo4IU5JgAX2Bqfd3CM96RMVR3XBacvjCZY3O1iXBqXvwJz4o/m02SbAJTrzIFYY
         FVmuJ91aaX2I16rVnwYWVQsy/hGL8f5M+90MPd9tz3bcjkL78tZXgqT5X/XkfMkZq4g3
         PdHVudlmq9DjMBYcoKbgx+e2pb7IMP5xmC6j2DKZurLGN3ieLieRPXLBw2UzsUBLSFvI
         aHJdKUOasw/33EiTK/CNqI3zzCV2mYMUOnbqpz2vkxbmIXXz0MkunFD/kdiQ6K3IHQdM
         zKz0bwv1dgTaYNCkWLp+mCii5blpfPDzWsAbigJACe+VMqILVr0aP2Pca3uhP6yU5AZK
         palA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969426; x=1792574226;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jo2PRIALCUq4kxjl1uc95AJMEIZIxh5cvF+ejGasI4Q=;
        b=KsHaV4QvOoYgCl7GxmBg9rdRJ+4RKGStggPKtp7TuPgIFQMSpMFmqdme2QMki/ejP1
         BWMMSDZBs74xPk75utEJ2hyhMwtlcVzyBUOTKQ/s9x7UyVW8c2oUYg/XicDsSt+0VrT6
         2/rezh/pyx1llmdb997EbA82SKX62/F5rylXImmZ46Y/Bdfz08W24zFkffW9rlx4vyVQ
         p9Cr/mH0erv78yOvCD39P3oxwuR39HGU6hN8O0/93Y41oWQycRDRV3djnLkU7GWpCR7Y
         8Z+TLGjctGKKwWe4RL7Ej51zTcHw3zyesD6Gh+FqEl+ZfxdrY92TjvZdEyqMpA7Kn87Y
         MUlA==
X-Forwarded-Encrypted: i=1; AKwUvBwggW6rlmpGRmqaKaZb9DYmzBivH7gYJFNhpymZMva9zbP9jIWM0zobLpBt+dviF1E95e7Q+ivHlneDkw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIYj0HJPEvjRNYgLU39y8R8zEikOFzkP7vAYoEujUAbhjDrrTg4
	dt7OblsIDW3mwkWrvwQpgHy+lZd+He0ybcPNE6KW7Z6u+6O8bNvHqiVX
X-Gm-Gg: AYBFou0pk2XJLZqYVRqz0w4Zlul1UBSJnZvD+GKwxvXQaCP3pYyGDIzcAgDHP3tBkmR
	6aLC9tdOcrnVL1iKyLNSj7sgd/IahNVtrKm2j6Y6emOnFQI7is6a0gOUUfuDS/Lux5QHE58n1Pt
	RvG2abE8tmyv7eInhjcRzR8op3hjcMKjIMUDB8jGBq8X0I27a+rh3ZmGCmNB4f6ryKki/IE/JNs
	beuddKHv8o45bgh+T/0wWOc8YBgf+PIYznEwB628IhVMCsjx9zvN1CUdLzIZnFt8Jz8ENSSYQ6x
	D9Dy9eFU2NsxOdAeyzm08KnuCn94E/nMzw7cmFVB07gz0yjiLqRXV/mWn6g2ANkX2X5RtJ0jgq2
	jA8X7dFjlen1QOaRboZb9h+Ll0OM4F0gPfMphPT5zNdP3u9frK6N7+Uh0QKIpJrKkYgcDQ46uaS
	wl3+KWQv18xIx6FHVcxdyKLbBSahWXws+PhQUMYJRdYEOFxWrw14ZyqsWJLGiEBNqncP3hldYBX
	5h+LGjt9Q==
X-Received: by 2002:a05:600c:8716:b0:4a1:62b8:9aa1 with SMTP id 5b1f17b1804b1-4a18e44885dmr310815675e9.2.1791969426406;
        Wed, 14 Oct 2026 02:17:06 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf214a1sm489997615e9.7.2026.10.14.02.17.05
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 14 Oct 2026 02:17:06 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:17:01 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v4 3/5] usb: xhci: sideband: allocate sideband ring
 segments from a dedicated pool
Message-ID: <20261014111701.4a63e9ca.michal.pecio@gmail.com>
In-Reply-To: <5cd85c1b-4bb7-4f30-930d-6c6451f09395@oss.qualcomm.com>
References: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
	<20260909-16k_offload_v1_b4-v4-3-f24a86617597@oss.qualcomm.com>
	<68b34f04-f7e2-4468-8a18-ac97decb987d@linux.intel.com>
	<82e0b9c7-3b3f-4dce-a72e-64989b08ef98@oss.qualcomm.com>
	<20261013111110.423dd0ff.michal.pecio@gmail.com>
	<5cd85c1b-4bb7-4f30-930d-6c6451f09395@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Oct 2026 15:53:39 -0700, Wesley Cheng wrote:
> I guess my intention was to see if we could leverage the existing
> memory operations within xHCI as much as we could.

This means xhci-hcd needs to be aware of all the client requirements. 
Today we are adding DMA pool to allocate segments on separate pages.
But people may want more - say a client wants different segment size,
it needs to adjust the DMA pool, but also to add another patch because
xhci-hcd would try to create Link TRB at 4KB offset. Or maybe a client
needs more segments. Client allocation gives this flexibility.

To me this is the main appeal - both sides can evolve independently,
without needing to update each other when something changes.

Maybe the sg_table stuff could be replaced with something simpler.
Clients still needs to tell xhci-hcd where the segments are so they
can be mapped, but it could be a few xhci_sideband_[un]map_segment()
calls instead of constructing a table. In principle, a client could
even grow the ring dynamically, without any patches to xhci-hcd.

> The only concern I would have with having the client own all the
> memory operations/allocations is that we would need to carefully
> maintain the transitional phases between offloaded and non-offloaded
> scenarios to be handled properly.  At least in the audio offload
> case, we're only offloading data to the DSP when audio is active,
> which can be for a short duration, and we have proper checks and
> locking already within the xHCI mem/core layers.

Not sure if ring ownership changes anything here?
What sort of existing checks and locking do you want to rely on?

> Since I did take a look at the other issue that probably reminded you
> of this, without getting on to a tangent subject, it really broke
> down to two scenarios:
> 1.  reset_resume during bus resume
> 2.  usb_device_reset for recovery
> 
> In both situations there are requirements that when those
> happen/trigger, technically, the bus should be completely idle.  For
> #1, since we're coming from a bus suspend transition, there should be
> no pending URBs in flight, so if reset_resume happened, xfer rings
> aren't being utilized.  For #2, there were some changes that weren't
> properly handling the pre and post reset callbacks, leading to
> problems in that situation.  I think that series showed us that there
> are corner cases where referencing vdev could potentially be
> unreliable.  I'm going to assume this has no relationship to the
> client driver owning memory, please correct me if I'm wrong. :)

Right, ring UAF and driver data UAF are separate issues and changing
ring ownership won't magically fix driver bugs. It seems impossible to
avoid xhci-sideband keeping references to vdevs, because endpoints must
be stopped on sideband removal. So these references need to be found
and invalidated in all cases when devices are freed "prematurely".

But does this need to go outside xhci-hcd (including xhci-sideband)?
Are those callbacks into the client necessary? It seems they wouldn't
be necessary if ring memory is client-owned.

Regards,
Michal
