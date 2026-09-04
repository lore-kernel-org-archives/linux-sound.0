Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6B4470EBC
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 14:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533187; cv=none; b=U19vhwSocj8Qmjud/LavYfmw7S4dNtzDEbq2lJrCQUlDNnwpyj9SNlmaqftLPWxXbbGLuS/IQs9WoINsd19ro5uKfrVTd+dUbGZztxL0nHTr0NY2yx/2zxiJqb7yCVR0IQrlvwhx4PZrvlOTTG93Gu0YIVXoqpEZjYFUiRpEQQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533187; c=relaxed/simple;
	bh=Yp8tYgPNpTXxsGy5+609I4e13nmE8B0dM7UajTEg3zg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O6AunFVCIkUTV7AmGLqeQvtaDGnSmMM6CE/OCGKCVQmQExLqiDhDD8mAzfVBWIM1PE04Yu6Wo1Errbxhk4ApjMi4RskbM0QgCm9QWE5kdmtd+8hnw0FJsEzEWUtjh/nc954xAzqTnjzgCQZtqQsOLEcdmLlp9fkDWXd40Q6dOt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SL6JFF9F; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SL6JFF9F"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so12450765e9.0
        for <linux-sound@vger.kernel.org>; Fri, 04 Sep 2026 07:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788533184; x=1789137984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vhyOjz0WA8Xf+6egkRqkIlMgMHYt6yHAudWT2EhHeng=;
        b=SL6JFF9FbCbhl7XSPM2iAz6g+px0se8rMnFhIZCKftFOr3N3ahyj678/VTUAuygI5/
         Wstq0g6y7TXHnvFm18XRtlww1SWc4kj02HtQypjf6WEkSdZvOvz4za8uO0MAcSbxAw8a
         5XODuleKOr7K7venGXbKhPFRwAm1n5pNyP1B9UlyexQ1p91gEbhOI3mohk/RbaXs6R9N
         kwwCk/FrkEpo3l9LSP8obDmQEEtCk4wS4OBhF+Xp8jStWFK8sRiw5PQ60kJbrcyU9SwS
         sHNNU4asUeFlVX0BxaGD8Lbk0cF9f4Z2pml11tUDjz8SfDDkuQiVZqrC5yWKL0jzCUAc
         MVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788533184; x=1789137984;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vhyOjz0WA8Xf+6egkRqkIlMgMHYt6yHAudWT2EhHeng=;
        b=SPEdLELYEM2aPMNARhuLFwYW6f3uJeZaFaWC8Oj2lhraKWbtG1sh50HF1ho3YPjuIe
         WVzn8fT1dIhqNvKhkmDD6OHL0sIxeh3vsy5Xpc4tEsGmpNyl2JPQ86ta9M/0JDpcTHFT
         HLeN4D+8Lk3aW2udY9RykA8yS2N+/T8lQU3HomLjmRxvqSvwe/mfeh3gezW2em9vDqfj
         pOb7LXEwBcrcpDz5hzLhlVImzPp1WRjkgxxH/aCMZ5gqFgwYfDDvNrcmGEL40Gq5/oCo
         iK8HE9Pr/+T45yjIH6Ibc4Jp5iG1jzCyToASuW/xtseLlzfNih7uzLK5LEDTDE3CFuHl
         yO+A==
X-Forwarded-Encrypted: i=1; AKwUvBx77DfUxNPNQPKPCFr5en/IMcciJe9oCEZM/NCtWR+DLx6lEkHQyNpEnGufkraMJkDHtLery6XrIZxAdw==@vger.kernel.org
X-Gm-Message-State: AFuF++mIDLgIDH9zXmxmyoga+XLZEnJm4uBFhHlj8RfP5+HLoOSKj26x
	NeHzHQNnYYTXNK+ey6it9NwX4zngWd4kn9sWTFJZmn38WoetHyVpcBHt
X-Gm-Gg: AYBFou3H/t5ErnJRrm3uN13cUFj1JWuwLOgGGoylX+7i6HXVheelGPxPglzuUmb+L0i
	2y24QX/EXeoi3doHHpZjKxiUKHshLPaWO4PcMEiiARnxjyv2DcJzT1XVLEMeRCaaXDTpAmeMaHJ
	emiZCK9Fx2Ivu48lxhj8LDdbhIt7sZkbf77YyLsbOvGs5SOvA+0ueJZgt5fQyUa9aN3rAKkk1BB
	XEfIg/f6SG+Jnlv+k97KxLQDZ+4sx2F/EAoIeMjchBRatMzJCjZxP9Nx3OguOWgi3mhHINje3k1
	knHi/g+O+rGOg4CD4nMJeDENdrn7nAFXUESPEqnv4t7TnXzEsCkTVjjFjumDirnnbIeU0yhaHrm
	beDaFtHJc/w2cjFb5LxBGN+xaOmyS2ZfyOgUsU/fzWLLVaWS2isQBN8Bm3u2H1Wa8B3ZfUAmiKZ
	zFAzJVdfRz7cJw5IPuiA6SGRvS42v4CK93leYaBtKAhpYYxAkFNfGopPo=
X-Received: by 2002:a05:600c:c48f:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-49cf825d507mr65851075e9.9.1788533183474;
        Fri, 04 Sep 2026 07:46:23 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cff81c9b5sm10582275e9.4.2026.09.04.07.46.22
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 04 Sep 2026 07:46:23 -0700 (PDT)
Date: Fri, 4 Sep 2026 16:46:16 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] Add larger page size support for USB audio offload
 path
Message-ID: <20260904164616.12abbe13.michal.pecio@gmail.com>
In-Reply-To: <05117737-8793-4db9-9815-f617ac085d82@linux.intel.com>
References: <20260824-16k_offload_v1_b4-v1-0-49a6be60ca30@oss.qualcomm.com>
	<20260825094327.606072e9.michal.pecio@gmail.com>
	<25ebe180-a620-4170-92f7-fda6c55a4129@oss.qualcomm.com>
	<0bf654f3-51c5-4555-8cdd-dc9d25dd9f78@oss.qualcomm.com>
	<20260826122552.5761dea2.michal.pecio@gmail.com>
	<05117737-8793-4db9-9815-f617ac085d82@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Aug 2026 14:44:42 +0300, Mathias Nyman wrote:
> On 8/26/26 13:25, Michal Pecio wrote:
> > The part about memory being "owned by the audio DSP" made me wonder
> > if it would be helpful to let offload drivers allocate their own
> > memory and then just dma_map() it for the xHC. No new rings would
> > be allocated for offloaded endpoints when they are enabled, we
> > would point Endpoint Context of the xHC to the sideband ring and
> > leave ep->ring as NULL.
> > 
> > Offload drivers would have full control over memory allocation -
> > size, number of segments (it seems that qc-usb-audio only uses one
> > out of two allocated by xhci-hcd), alignment, anything else.
> > 
> > It would become impossible to offload an endpoint which is already
> > enabled, but is this an issue for anyone?
> > 
> > NULL ep->ring will cause oopses/panics when somebody submits URBs to
> > offloaded endpoints, but I think it wouldn't be a problem otherwise.
> >   
> I have similar thoughts.
> 
> One idea would be to basically let sideband allocate the entire ring
> and set ep->new_ring early. This would tell xhci_endpoint_init() that
> a ring exists and a new one should not be allocated.

Actually, my suggestion was more radical: make the ring NULL for
offloaded endpoints. Driver core would only be concerned with copying
some dequeue pointer to the EP Context, which pointer would only have
meaning to the sideband client, the xHC, and maybe xhci-sideband.

This would be a new special case in xhci_endpoint_init(), but little
other core changes, I think. And yes, it makes sense that sideband
support shouldn't exclude using normal URBs, but they can't both work
at the same time. We can restore normal operation when SB is gone.

> xhci ring allocation would need some refactoring to create helpers
> for sideband to allocate and initialize all the other parts of the
> ring.

Helpers can be exported if clients need them. But it seems existing QC
driver has different idea about segment count (I think it uses one) and
hence it probably also writes its own link TRB and doesn't need ours.

Even segment size - does it need to be equal in QC DSP and xhci-hcd?
Today it is, but one or the other side might want to change it later.

It also seems that QC DSP expects the rings to appear at particular
IOVAs in particular order, so QC driver maps them one by one through
IOMMU. Alternatively, it could map one big block, divide it into rings
as the DSP desires and pass pointers to sideband_create_endpoint().
Looks like less work for the driver.

> This is something that VTIO (xhci spec section 4.25) would also need.
> There an endpoint can be handed over to a secondary DMA ID (second,
> new PCI BDF), that the normal xhci driver can be excluded from  with
> iommu.
> 
> VTIO use case is something like trusted VM accessing a secure usb
> storage device, preventing regular OS running the xhci driver in
> another VM from touching it.
> 
> The secure VM needs to allocate and map the ring to this secondary
> PCI BDF

If I understand correctly, that's something like Qubes OS archicture,
where untrusted VMs run drivers to contain any failures inside. Then it
seems we wouldn't want the xhci-hcd VM to have access to transfer rings
to prevent tampering with protected devices.

Hence, no allocation, no initialization. Only opaque pointers, again.

Regards,
Michal
