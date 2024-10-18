Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C33B1F4287
	for <linux-sound@vger.kernel.org>; Fri, 18 Oct 2024 14:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729262469; cv=none; b=l8YNNZCWyDNqv33guqI4NIgi/6z6chktmu+yd/jrpgTq1o6ocCjRkDJ+W54e8ac79hjSZcXWdzcpcV91JoZVeTnvLDE/wHrUXKz51AAgdLinlKIxIPn4gGoNJldZPbx0skgleYV06UPKUym3QCgYjg0L2zELc9jJHGLapU0GhvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729262469; c=relaxed/simple;
	bh=IbhpVSRXoHp+AFpiEZf0r+beixbxaoTPmsDASpo3j0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFJGKtfFiC6Y2mQfXfWflsbbR71gyJx9akXj2riI3OdR3gpAjgecyxJxzI6mUecmFCVy4huYUqpfrmMvnnKxPFuU0agQKojA/Fgoi3HMa4NGJ3HBYo7tLJtdNuv3VQ09qt8zq3Me/zFZmE7KnIrxS8Bxagv4mAEQ+0b6PWhYt68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=jGbvE+Ye; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="jGbvE+Ye"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7181eb9ad46so238677a34.1
        for <linux-sound@vger.kernel.org>; Fri, 18 Oct 2024 07:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1729262466; x=1729867266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D8YdydRMs5ZuJN3KTpZl2ndLhC/IwZhLxMPrFhDw1pQ=;
        b=jGbvE+YezPZ4nYTjHw2nwZzny07zyJ9E0dbNL5qlgxsQLAohtiok9y+5FEraQghFWW
         d3EXR6dZQzS0QBYG0gzf8cHSpK7mEP5C1x0mPmSI8RSC3Y1nNsuWD5RoYE4bnct1rBE3
         xSwz9fhw5zTOwd3NtL/QTn1hU693/MjjevArv+nVtDhT4XUj+v860jJ/G1LS3fFop4FO
         TAH12BFGKfv9QTcynXctlkzYLsx1fqCVKYvJnkluQwrIAqDvFLpT0C23rrhYw4JFca6M
         acBqeJ7Ang0Cu4DcfeT9U5GGwnj0GcTbtgABivvxX9SpIukpZiyfGJpoMBmhNO7kkU6e
         gikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729262466; x=1729867266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8YdydRMs5ZuJN3KTpZl2ndLhC/IwZhLxMPrFhDw1pQ=;
        b=cSw3aEoNhUP7rrOXLeXvjNFWG28VfVNdIZNpEt/AEUzLD0WUQ1/LxateAgerzDF1wG
         h5+n0RViyMd2lga205agju5Brg1ZoSdSx3RbbSJrw751HZsT0P1Gtq85rmwnt3oovzM2
         yoaXqSikOhuylO5Niiy7ET8BJbOCTsRFym/OhiLXEoDgWsyAKUVnMs5ZdQYnxaVOI1B9
         ODClaonxEomrp5haRMSJU/3gFRSGrZ51kfRrXaIkL0Y0mziw6kYpWXdu83l5ZzwJXhvB
         DwSRWSi+0ck45ZvlorBiyr9tsonupnziPJMlJ3AoQuk8RWVyV0poJWk1Q4UVTQ2BKAIi
         1u8w==
X-Forwarded-Encrypted: i=1; AJvYcCVsINC0Xe2BncR6B7DEPwwvYfJlLiNuWQd5ySpTkSLoUJvsaM3uG9cOzf2Tqy39Dvtr6zRfcpXlVg1FsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl333aFEPu7OqL4clirfC/rEi4NxodK0LmgA8GzuIBe1goAScR
	3/DwPxO2tGUaOu53CHDBjTrMdhGOJwrlU9yKOoMGiVJpfOa3THatIi9nNZdLrw==
X-Google-Smtp-Source: AGHT+IGdvNRCnoIQrcGPoQnsogsIrxwKdaJB0XeTFqOFbVa0uVXdKHhq3gqEzGp12uvN6jIHUo3tgw==
X-Received: by 2002:a05:6359:6d4a:b0:1b8:3283:ec6e with SMTP id e5c5f4694b2df-1c39e046828mr101920655d.24.1729262466532;
        Fri, 18 Oct 2024 07:41:06 -0700 (PDT)
Received: from rowland.harvard.edu (ool-18bba9aa.dyn.optonline.net. [24.187.169.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b156fe59c7sm74426385a.84.2024.10.18.07.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 07:41:06 -0700 (PDT)
Date: Fri, 18 Oct 2024 10:41:03 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
	mathias.nyman@intel.com, yajun.deng@linux.dev,
	sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com,
	dianders@chromium.org, perex@perex.cz, tiwai@suse.com,
	niko.mauno@vaisala.com, andreyknvl@gmail.com,
	christophe.jaillet@wanadoo.fr, tj@kernel.org,
	stanley_chang@realtek.com, quic_jjohnson@quicinc.com,
	ricardo@marliere.net, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	badhri@google.com, albertccwang@google.com, quic_wcheng@quicinc.com,
	pumahsu@google.com
Subject: Re: [PATCH v5 5/5] usb: host: enable sideband transfer during system
 sleep
Message-ID: <cc900c5b-32e6-4147-a5c7-923bfa13686a@rowland.harvard.edu>
References: <20241014085816.1401364-1-guanyulin@google.com>
 <20241014085816.1401364-6-guanyulin@google.com>
 <9b5fe5d2-77a7-40b7-b260-856c35d9dcec@rowland.harvard.edu>
 <CAOuDEK2f_mtfiye7MdnOqEkq3pYW1kcdkwEMMBC5CkkQ1OGu3A@mail.gmail.com>
 <fddf19f6-d03a-469e-a56f-ef390c099902@rowland.harvard.edu>
 <CAOuDEK3mmR9052FWEJAVBkUanVJ1MLLebZoANiasUpD9TDBjfg@mail.gmail.com>
 <003263c8-c901-496b-ae04-7cccd7f3cfa2@rowland.harvard.edu>
 <CAOuDEK2U1Ok=a=X36R_xjkW7MJm2kQ=G7ohh_oC=+f=rGa2eiA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOuDEK2U1Ok=a=X36R_xjkW7MJm2kQ=G7ohh_oC=+f=rGa2eiA@mail.gmail.com>

On Fri, Oct 18, 2024 at 07:59:00PM +0800, Guan-Yu Lin wrote:
> Thanks for the suggestions, let me address them in the next version.
> After some local development, our experiments suggest it may be
> necessary to skip usb_suspend_interface() & usb_hcd_flush_endpoint()
> for connection changes behind a hub and HID events in our scenario.
> 
> Typically, when the system sleeps, the hub uses remote wakeup to
> reactivate upstream devices and resume the interface to handle
> connection changes. However, our current conclusion is to maintain the
> device in an active state while suspending the interface. This
> deviates from the norm, as remote wakeup is designed to function when
> devices and links are suspended. We're concerned that this discrepancy
> might interfere with the remote wakeup mechanism.
> To address this, we're currently bypassing usb_suspend_interface() and
> usb_hcd_flush_endpoint(). This effectively simulates an "active
> system" state, allowing the USB controller to notify the kernel about
> connection changes via interrupts. This workaround applies to HID
> events as well.
> 
> Which approach do you recommend? Should we invest in integrating with
> the remote wakeup framework, or is it acceptable to keep necessary
> components active, mirroring an "active system" state?

It's hard to answer those questions because I don't have a clear idea of 
how the sideband system is meant to work.  For instance, what does the 
sideband system do when a port-connect change is detected in a hub that 
sits between the computer and the audio device?  If the sideband system 
decides to change the audio device's settings, how does the regular 
audio driver learn about the change?  And so on.

It's worth pointing out that allowing two different drivers to control 
the same device is generally not a good idea.  More likely than not they 
will end up interfering with each other at some stage.

Alan Stern
