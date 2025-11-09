Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F471DDC28
	for <linux-sound@vger.kernel.org>; Sun,  9 Nov 2025 20:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762720253; cv=none; b=VBtSlwW2f3nS5KteYfXAdNmUNxRoecqYpScQzaYOv6m+v+DDG6/u+gyLTlasqUwfBusEa2Jlu3bi+ceVlPc8/zMQxHZlaoJV4qMRhglJLH1FH4QR6BuNRKxbwHGBPrNHux/2bDwqXObHi6XG1efpLNh0Qc+AM6oFgs+hEKt7yRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762720253; c=relaxed/simple;
	bh=Fon7bVBHqCWs7RZgnZ1+1vai0j+ZDPjfvC0UsNzMFyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXNWvwmWsYGou9dNS8Lnd3R3/krRAMTblN45euR0p9SPsYWku51BigutWzErxmpIFViBvYSxKZf+Pn2uikXYjj0HYAXmRluf42svkonRg090sHYQAedsXUP7chHjBZ4BCxZuMW3k6T/ufLgEV1Z/V1s6UmgI4WseA89OCtjMJPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=j5rEQe4G; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="j5rEQe4G"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-88044caaa3eso26606886d6.3
        for <linux-sound@vger.kernel.org>; Sun, 09 Nov 2025 12:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1762720250; x=1763325050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T+zoPi7ReVo4yKaMu58q1KOxz/re+Q4m5E7lC8bmcxI=;
        b=j5rEQe4GcgXHW2Z+Ys9MM3TW3sOCHRDF+7byq+HVppjYW3WKJoGL8yFDvhO8N1d8KE
         eI0tzspCNFt5NXJOH/dqQwqi5ZYu+SUPgoaMUmXc+YvSga/mrV8x3nw/vqJs+Zibt+XG
         WXF9aJf7MSLPAn46IaYHxERA0Z5JvfLXaJoDSJtzIyDg521cJaqqr+FjaYBzhrWKRDJG
         vly81TlwvRmxsrCRtCXJSGAlhYHQOP+KqkcdFxsGnnOrjby/TdHTxxSeYtG0Um9VJLOX
         xtZpbKqvGgOZ42IB2LIZIYxw0jf6rWHom/+zXxv7Nl5Mp7/fmPmSKqu5e7rmtHsex7hW
         nWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762720250; x=1763325050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+zoPi7ReVo4yKaMu58q1KOxz/re+Q4m5E7lC8bmcxI=;
        b=VIEDpxH9zLd3MCBuJXIPZrA2JncmH6k9jVms9WKexgxp9bcB5rZvJcY42oZv0EFMVf
         mA5iG7nT05uKY59bM4dv+oBeHSh9fK9Pq9oTU5L4RasVYzRBLSU7LsQ5ZmaBNir9QuB9
         JvQJVx1kCVH8JT94ikM7hFqwvYav37e+FWfLGRsIgY7nfdEuN8s+IaRnIatg9pUpiqjf
         gBnCZv2y/158T8j1orPo5YXR4hP/jytG1ZQqa0iFICtRxJvBru4uWxIxnTzN23xgeeqS
         kLPNzV+ZrYOZrAsD+6Cv8RtiBYO41UQwma+z/mIUHktaEG2amACw2qyVu9a8Az0V1WYD
         uqdA==
X-Forwarded-Encrypted: i=1; AJvYcCU3eDuTLjW9OMeAQFmcduqDu+F6AWhWcGpRLM5gthvdLRz2d5g8exCPmKVZ4sfrfCAbfc3vaa9EG/cb1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPQRlVZWTso0NuX2+5ye4FDWzQYXAmnlNk4cfXxt+LqWMBJ0cw
	zImU3YDI17oh676YHYmtadcVTnbV60QYaULYEbV17lFE+BMSxcoBkd1z6P84kYDaJg==
X-Gm-Gg: ASbGncsK2jVr2q064zytPA/YRmlJkd/LZtIUrUn1t2pFMeVtYTE3AlC6CVS4h45oHRT
	G3VC2IfEmYoUgPqQCv0xY7f7gHWuY9Wh/je6iwuX7dGnNeNssGoM5Pwt8iR8juTsFKEfBEvzael
	rBZFHMSoG3JNpWzUglIda54oWX5LV8Lpjv41NXHxy9MDs/LwBMtBugZvDuBECRfjjA52l1h1y/A
	8BPu2u/JzIah9GC5GHVe26FO+4kSuzX+r6mlijMvZAyVm5U6HauPrHzKJsFreRhetTj6n37peN2
	KX53xsw6A5ZxOme3SUcUFdyX8E+WZ/VcEmlkkQV/sBXA2eWWQvF1MVleQRfb2/etnaSx/SymL2S
	mfIBhlr5bhJR5Or8oxDxogpxJefnR4Buodxm55Kewrk4iHfp1NwJgSYEIvd9v/DX3SxkhPX481O
	Trfw==
X-Google-Smtp-Source: AGHT+IHHifTVv9Ze79r9HQWDPss+Dk+gNK4gj+p2SjnA94jCI+5ReaBS6mbIyqbtvcOiDvcGREn9xw==
X-Received: by 2002:ad4:5761:0:b0:880:46a7:b1c3 with SMTP id 6a1803df08f44-88238622d96mr90879136d6.28.1762720250249;
        Sun, 09 Nov 2025 12:30:50 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::db9a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8823892b84bsm38367086d6.10.2025.11.09.12.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 12:30:49 -0800 (PST)
Date: Sun, 9 Nov 2025 15:30:46 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: The-Luga <lugathe2@gmail.com>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Terry Junge <linuxsound@cosmicgizmosystems.com>,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
Message-ID: <6999b5b2-a242-432e-8100-5d8ee58bcae8@rowland.harvard.edu>
References: <3eb2564d-5008-434e-9698-99b0cbe4d1cc@cosmicgizmosystems.com>
 <CALvgqECkMdntW2He8C7EcvOtCL-PpiXM9xNXWHzGtgimDxezHA@mail.gmail.com>
 <d7e888a6-6a65-40c1-84af-058b97ca0178@rowland.harvard.edu>
 <CALvgqED=rBkNYGkFdOXjUi1g_vbLac5Z38Z9xCRfpF-Vmy4Mww@mail.gmail.com>
 <c5c863f0-1c68-4d49-ba9b-b55c0f71d30c@rowland.harvard.edu>
 <CALvgqEAo8-MhE3ievoDkq4AOxRZ2E52kcko+GxYyf+WZE2H0=g@mail.gmail.com>
 <20251109092450.693bcbe5.michal.pecio@gmail.com>
 <CALvgqEC1EpJy58LhppgLYkCyaZL+qv34b8PmvTvJV8DYfp=gzA@mail.gmail.com>
 <25f2419a-ee91-41eb-9446-87d238b4c7c4@rowland.harvard.edu>
 <CALvgqEBu_RzQYRSJnbu58XZt5wHX6PRD8i-J7Tovh7+KuhOyag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALvgqEBu_RzQYRSJnbu58XZt5wHX6PRD8i-J7Tovh7+KuhOyag@mail.gmail.com>

On Sun, Nov 09, 2025 at 01:44:31PM -0300, The-Luga wrote:
> Sure!

> >echo 0 | sudo tee /sys/bus/usb/devices/3-2/bConfigurationValue
> 0
> ```
> Here the device is disconnected (unconfigured but still physically on
> the usb port).
> 
> >cat /sys/bus/usb/devices/3-2/bConfigurationValue
> 
> has no output.

As it should.

> ```
> >sudo lsusb -v -d 2d99:a101
...
> >     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        3
>       bAlternateSetting       0
>       bNumEndpoints           2
>       bInterfaceClass         3 Human Interface Device
>       bInterfaceSubClass      0 [unknown]
>       bInterfaceProtocol      0
>       iInterface              0
>         HID Device Descriptor:
>           bLength                 9
>           bDescriptorType        33
>           bcdHID               2.01
>           bCountryCode            0 Not supported
>           bNumDescriptors         1
>           bDescriptorType        34 Report
>           wDescriptorLength      66
>           Report Descriptors:
>             ** UNAVAILABLE **
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x84  EP 4 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               1
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x04  EP 4 OUT
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               1
> Device Status:     0x0000
>   (Bus Powered)
> ```
> It seems that the output of lsusb has not changed.

My mistake.  Unconfiguring the device prevents lsusb from accessing the 
report descriptor.  What you really need to do is unbind the interface 
first.

But never mind that.  Try using the usbhid-dump program instead of 
lsusb.  usbhid-dump does not require you to unbind anything or change 
bConfigurationValue, so it's easier to use anyway.

Alan Stern
