Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70433932F7
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 10:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739961; cv=none; b=XS0EsKlKXNcdYZ3Xyzh7HtO4jsNqFEs9bCY3VIKm7DR6+8jOk/Tiwy8X6OdmPcfR7fRI7LJTr2+VyJN7Ntpmrza4fV+uzIYu9nsDOLZ6xz2x5/Edb3lDklFGcPv3LRhCTDOps/bk5B7ugzA/bSUbgXvcRoPVQtLE4hJlUSVW3Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739961; c=relaxed/simple;
	bh=wEDTJJ7W8kiwxLRX1+enWo0Pl+M9+VeM0mUaKzfEPJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J/GCGhZjo27kTcmSKBJOuWtqK/j9knmF3A8EUsi7NzINBtEU+ztc6Amke0TFxplUax4jzzorjqd8Sep8nde1mLNZ3YdZdm5q5abh5qLoPf8vbCD2noZ7o6ZKTd0/LWq8eEskbAC9wIhtcv0xHuG29KE0rC6RSHIoy2/N9vyILjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9AyZFMT; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9AyZFMT"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c250a2bc3b3so94703366b.2
        for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 03:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787739958; x=1788344758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7ZF4eI1OEh2v4DHesaWp67R2xMPuMRHeqkB4bC7uF/4=;
        b=L9AyZFMTPLVgsgN/QDMGCIjX76X9TyCv31wnNPTuF0SyjUO639QZDm+CiBFbYGFOZV
         mF7TmrWSh6Ryg554P/HOfzY76N8xLe2GXafJcXvApNBMHQHU5PLU5xTpgT5AeMf6Z4Oh
         Ch3pjhHOJ5GdOgpw+lA56jwB67U6uwxTrmfYPKVsee6odPrH2SCyaZMfUfAUVR7HmMnX
         Ucc7wAf6sGaUNlukYHxHbfKahV8GCD6+87pOCh/12Jdkfka6jKYyGnyS1Id5u6Uzs4A6
         bKr8yNLi4HOTAfD2vqYZh04SW8VCEZhI9OgQddtPqqPXuXszXVLWl53pOiJhLwPlsI2Q
         NAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787739958; x=1788344758;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ZF4eI1OEh2v4DHesaWp67R2xMPuMRHeqkB4bC7uF/4=;
        b=iAOe4rYjo9AeL4cX58DMTWAbO0I7e6SeTeopHaHjT1AkJyvznrOjTqt7CwX2GGHsiz
         21QC8Ut35+wE+8e8epmxhdjcAqTIC8NfGe648LNbrLc0pBQPARR0Swfag3Gp5r345X1A
         4/k1ZA3rN5xlanEbNhdtvFIewYhKtAakBTEtb9/2qt7blwl+vEErnIjp+OWJ39n9CJ2i
         xWNxSVyD27IytEK16h10T1nzmWxHfeyAxITJyb9bbfBlgNuawJKQd3Mr+XaIVmk5knTl
         CA3vyGbYtrZ6eMqu/H/h27b9wEstgrtEjyjuw83UobS165aNEXT1wNNfr2E8Z1CIITZg
         BuCg==
X-Forwarded-Encrypted: i=1; AHgh+RoBHyvshKN0q0HLeNldEa+5Pzx+ALgnHHSyGE/1hq2tBQH0tTRZ46kujw3CGRc2xy+BHDqs88V4DCBBUA==@vger.kernel.org
X-Gm-Message-State: AFuF++kaNZTlqCHGf8k4bShna7cmx1kqv6N1aRjrGnhRkReiQSAHNdaL
	1spmH0vBx8c9GUiufnPcdY0Vzdl1UIN1N0B3uVAVVBmFKrQK7hXYWXiU
X-Gm-Gg: AR+sD10wJ0M7+4EPUrqb+h/NkOs9UMwb4VJd4wQgUvtVnDyry9ZbJw5xHUP5LDxmvLI
	CY1FOoH4X1m0egKtmBPER3NyBa17Iy1zDPr3nYINV/M95PKLTv+fWNwCJrU+ucFufHP4ZoGEgZv
	an6v5OkH48VS/DCo5BMbdPSBiTT/elyiZ8wn6jMeMPMnTE1sEQ1YAOnzWFT16Zly3Te0iHe82D4
	LbMYEEaLGm7VxS5jd9jkUC5yR2zQMj0fC6qhzjUiJ5+wVnEfx01kQoE9D0Jgyu4H5OgHXzdjbnU
	loPtg6pt9QHaHqrz9tpETgIteVmS1xJjPKl6Ct2c8peyepqiv4i8yUQvC7x6wqRXCf/js7S4lRm
	00WwF/2GL5FA/ccIrKko/RVMvC3qVEZDXWI7nGCaZFdV7+KFxLHjSv0o+HT4UCgEtYSm0ZYna3C
	BBkfU2PHtbcbXTB82p4XkmKTvX+Gpyv9Gd1Ow+Fsh7yZfLC0ho3S+uhn7suSpeDXjggfCWtkyro
	+J9Hg==
X-Received: by 2002:a17:906:478c:b0:c24:6505:8f67 with SMTP id a640c23a62f3a-c250bb556c2mr665876766b.10.1787739957750;
        Wed, 26 Aug 2026 03:25:57 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250dfd6e6asm307762866b.19.2026.08.26.03.25.56
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 26 Aug 2026 03:25:57 -0700 (PDT)
Date: Wed, 26 Aug 2026 12:25:52 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] Add larger page size support for USB audio offload
 path
Message-ID: <20260826122552.5761dea2.michal.pecio@gmail.com>
In-Reply-To: <0bf654f3-51c5-4555-8cdd-dc9d25dd9f78@oss.qualcomm.com>
References: <20260824-16k_offload_v1_b4-v1-0-49a6be60ca30@oss.qualcomm.com>
	<20260825094327.606072e9.michal.pecio@gmail.com>
	<25ebe180-a620-4170-92f7-fda6c55a4129@oss.qualcomm.com>
	<0bf654f3-51c5-4555-8cdd-dc9d25dd9f78@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Aug 2026 00:50:53 -0700, Wesley Cheng wrote:
> Thanks for this suggestion.  I think it actually makes the overall
> design a lot better.  So now that the sideband driver has its own
> segment pool (per sideband instance), we expect that any page
> allocations done from this pool is technically owned by the audio
> DSP.  This allows us to still utilize 4k ring segments, while mapping
> the entire 16k page, so it helps conserve/optimize the memory
> allocations.  I will do a bit more testing and review before
> submitting a new revision w/ these changes.

The part about memory being "owned by the audio DSP" made me wonder
if it would be helpful to let offload drivers allocate their own memory
and then just dma_map() it for the xHC. No new rings would be allocated
for offloaded endpoints when they are enabled, we would point Endpoint
Context of the xHC to the sideband ring and leave ep->ring as NULL.

Offload drivers would have full control over memory allocation - size,
number of segments (it seems that qc-usb-audio only uses one out of two
allocated by xhci-hcd), alignment, anything else.

It would become impossible to offload an endpoint which is already
enabled, but is this an issue for anyone?

NULL ep->ring will cause oopses/panics when somebody submits URBs to
offloaded endpoints, but I think it wouldn't be a problem otherwise.

Regards,
Michal
