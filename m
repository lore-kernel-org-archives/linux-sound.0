Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB9635B138
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 15:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762873692; cv=none; b=cGprhRc8tLTqvLxW49iq9ILRxA6XtikGfRoK+u7ZOvCxieWddugU8m5BbXRIDbTQ4dxJFVxVdTbZ1dywNNraxBIz2uhXmKvHb19Aup837k6sSSqKTPAFnYswYQkZpHUANBOvRcsy65XovHjLpExtpsyFJUmCddKxL9DNJr32lyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762873692; c=relaxed/simple;
	bh=DAt5LtmL6m5oArkUGnBm1bgOgLbg+gEeBc0aZ8x0sF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OOqV0GBk0N6y64qCsjLy7lVF0gc78OrBgr4b/9Fgo9qd8W+tqLIaxpTGTLs5GDHYJXtZkx55SGf3eLZVeFezv+BlquUDqYmTdJUFTrJlCdHE9WYrFFVJURntqfDZ3SkC4PyH+P0uOq0VePej5pm8dKD1nt/BVQF37svVgUooiVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=EvsOj+aw; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="EvsOj+aw"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-882399d60baso26807726d6.0
        for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 07:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1762873690; x=1763478490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3lJT5ZSJMOrp2Um3w1eEC09oiv0bY1tvU8jyZkoYyro=;
        b=EvsOj+awzYxqnrvFd6n5fZq7wZzm8A3L839dhxHDRubaLMqTaTVRX12uRGeZWJQfaJ
         KVfWVKuP1rR6ie8Qd/v21QGdospewIx/rru2tnr9eKwM922FYblciRcWIfOyGsE7W8XL
         ABk5kYiefYFBFGHATQtxaQgf+pU0mR5ZSsqmVXSZZACjExe3Mwc5/kYLgxmUVIFZEYtX
         UHwjKcJ+AxP/pOdO5weKSL+QJu7N2KteNoZWYNGz6rs4kwKV5wGPJPOTZDXh8/xEevdv
         wPVaNQj5mv0HieM96Qh/net6EzHVJaXiZnXHvOAeXUmfU4KkU0x7T0F3wxJLlwynh+3/
         k3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762873690; x=1763478490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lJT5ZSJMOrp2Um3w1eEC09oiv0bY1tvU8jyZkoYyro=;
        b=vHR7At0K/PG5vaBEHG0fOFtPwbpvFrAlJUjj6pNITBqVqKa1FaoNwzrzGRMin5tT5l
         ZnNSCrfNVyFY/qyPYZeHFypj9SLA955EAXGH7SZh1c452NJgP1W5nU2B7Jq/JUwphP6c
         n/oycZER3HPPpw8g+OxH7Ec3qUd2XGKI1ltRHwfUdyxXczUUt9DHTwgwDZGiI0BnmE+O
         3NHmhjRDnhtOQpKsQu2GK8rpvPjIJSLN7+V3CPrUfom9PM8JmlrBpnBrQvhXQrQVBAPu
         71nUTWLZnS/38QEb3i9dHniampHTm1i/g8Y76GYKKau0V24jmD4qXlPPWxvnqOy5ELno
         FQ2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAr0NYhh7/5gaKjqwSO1CrtlZL5axoUsfkg1G1ytrHDFF9YSq/lOXOEs+Ok5s73oLqzfeffNsjkkTGWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YylKjuEhoTRLAy+JbwyetTTJ22YK/3PabY1Lx0Npb4wSAZVibJi
	NzmepJZmb1okkyMurGHuM4gJkawQLNhpanwahF0UDkev06VlZLpfjgMsYa6eqEldPQ==
X-Gm-Gg: ASbGncvft6iB9oYeL3OkmQM9T5XFTEwkHZchaUsytqstpVkrXFZB/CA9cwC3jWm3gmS
	5u1EdQ/zXb14YjkKBF8WLRhAT1O8shP6fZbdZ2S/RD4/h14WPxh9RzvxoK/UUZuKRV1+upq5K1s
	abvULFiCPanqr6AGsRskL/UiSMSBu6sgLgUwDo/GiATPJbBrHEY0F3kytXGCeC7tsz1zC9ZhMOA
	vQeUtLkleJhcvFZ5AjeawGA87+RXtYd20r1+e7QJhwXNDseo4cSenYO5WErDDF1uth4ixq+tvAZ
	W+6hTMT2sjWwgNYBOdppzPC/XC/k3ZFkwWVe+QAeEACNzYuvSiaQbRNPPUV+5eS/P4GexM8vmN+
	pQXWt7sQr+Z8m7Ci/dDlTC9ScPwcc65rHhzh0mdPCAj+i75SMjxLr87MGaVUYZX0hnN84Kvw96T
	gJNA==
X-Google-Smtp-Source: AGHT+IFgUb+2Gl34Fb0q5W9YamyNK7hzqSSthFYGdVLDl5NkdFz46yfwatDwjuvgJWFBBIQqtTtPZQ==
X-Received: by 2002:a05:6214:240d:b0:880:4d78:89ea with SMTP id 6a1803df08f44-88238702c86mr173354936d6.60.1762873689882;
        Tue, 11 Nov 2025 07:08:09 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::ba76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88238969ca6sm76561276d6.15.2025.11.11.07.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 07:08:09 -0800 (PST)
Date: Tue, 11 Nov 2025 10:08:06 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>
Cc: The-Luga <lugathe2@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	Terry Junge <linuxsound@cosmicgizmosystems.com>,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
Message-ID: <732b03e1-ff0f-4428-8b50-725758962ad3@rowland.harvard.edu>
References: <CALvgqEBD05PwMpm00cAbFkpSWpCFP9jaBU0r-8+op+RGPtkktg@mail.gmail.com>
 <7adc816d-169d-4213-bb67-9d070af3c4a7@cosmicgizmosystems.com>
 <30528153-95f1-4ec7-a6bf-5da396441f86@rowland.harvard.edu>
 <xrfmda5rohporc3bjax35fc7xjziai6cmdt5svjak5rps6y6jz@k6h4zlt3jgg2>
 <CALvgqEDZ=g+uvdSYqbD22sL_VP+n6Pda2xXuFAJyKkh3bjm6HQ@mail.gmail.com>
 <CALvgqEC6UW96NEYOCM5v0m4x8Si0A7AwPuMpwXt3PMqkO3eqww@mail.gmail.com>
 <52fc4350-2930-44d3-b844-03f00806f142@cosmicgizmosystems.com>
 <1ac9d1dd-822a-487a-bd42-45c163dfbfe7@rowland.harvard.edu>
 <CALvgqED5NCNjrtv_YSfg9rzerK-xWAE5TaJjZtMBMcY=8MSk3g@mail.gmail.com>
 <c6d506f7-f13b-4d57-a522-a2ccd09e7a1f@cosmicgizmosystems.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6d506f7-f13b-4d57-a522-a2ccd09e7a1f@cosmicgizmosystems.com>

On Mon, Nov 10, 2025 at 09:11:25PM -0800, Terry Junge wrote:
> 
> 
> On 11/10/2025 3:48 PM, The-Luga wrote:
> >>> Are you sure?
> >>>
> >>> HID_QUIRK_ALWAYS_POLL = 0x400
> >>> would stop suspending the device.
> >>
> >> Actually, it forces the kernel to poll the device's IN endpoints even
> >> when no program is holding the device file open (see where
> >> usbhid_start() calls hid_start_in() if the ALWAYS_POLL quirk is set).
> >> This is exactly what the speaker seems to need.
> >>
> >> As a side effect, it prevents the device from being suspended.  But that
> >> doesn't seem to be the important thing here.
> 
> Polling for input reports is handled by the hardware at the interval 
> requested by the device during enumeration.

Only if the kernel tells the hardware to poll.

(Also, the interval used by the hardware is what the kernel tells it to 
use.  Yes, the kernel generally does choose to use the interval 
specified by the device, but it can use some other interval if it wants 
to -- and in some cases it does.)

>  There is no intervention by 
> the kernel to poll for an input report. The only way the kernel can stop 
> polling a device for input reports is to suspend it.

This is simply not true.  Consider: Where would the hardware store the 
report data sent in response to a poll if the kernel hadn't given it the 
address of an input buffer?

> So ALWAYS_POLL means never suspend.

As Oliver explained, that's only partially accurate.

Alan Stern
