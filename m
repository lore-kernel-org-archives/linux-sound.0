Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4732346E66
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 03:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762832580; cv=none; b=BLJuLV5HHHmgK0I0NJZJafy6RXa/chkESLRzSNcDvWotjTDuz1ld44nKzDIulWD0+2aF8MzzbhqQG823EzQpcWZk/iIHApWAlMVjGHyRTYSbnvMKJ0sN1YKxZMsGpJ+g2UCxgAZa3EoL44YNjZtYmF4hwUDxa18sFefd9w3KQ/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762832580; c=relaxed/simple;
	bh=g6jGAcvwVh/icnz8bdIbPAM/IeCRuZBYyx7sd28ajFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1sYFx36ae+MD0+WkNTxJzeNqgoJF+cgQROPTEftSDKfK7teNoeNRO/G7fbCtGV5jzWQ7PnTds3pHHTd0As7ml5dutYv3e2S3/pfnxup1f3I+0AdzglQrG5Yl9KC5LCEDgv9KoYQR4gFcBxrn4Shz/bYb7upafan9J3XpLJaUEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=k+bnOdjc; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="k+bnOdjc"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b0f54370ecso411296585a.2
        for <linux-sound@vger.kernel.org>; Mon, 10 Nov 2025 19:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1762832578; x=1763437378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k6/LD0uDQCSe+chbTWf3H4rmcFTKbJ4PUWI7IjCyqUo=;
        b=k+bnOdjc3h3fN0DBJEjWccRsZENJafZK8a46Jr7Oz61VgisSscX5Fux+Ds1UEocPgB
         gRuhd6Uf7C6Qo9/EKpKXbPiB/BJmo1avHlI96pNifmPGm8IFjp6p3FT3DeWBZtpA1BtM
         e+4vmt+/pJ+69rTzsXm8xi2isbDlHToGefxuwSifW95Mb4C8emAL711j09jVru44ugye
         6cdMwahbScmpiJZauCpoM5i8MO2xr3Ehk5lXBCtv6d0mj/aFADzR0g8YCq0zl/Lgu0Uo
         Wuvn6V6QrqHHlb7Mpp9Yj1I20+H13idjJi9E7B1ojB5ZOdJRUDK2oNL+BaVAYrXQiiRt
         clvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762832578; x=1763437378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6/LD0uDQCSe+chbTWf3H4rmcFTKbJ4PUWI7IjCyqUo=;
        b=lGX9vwoId8gJl49M0q3oOjYZaB/Deekn3LR6y7leSo8XWATkDDzy4j+lZQy2EiFn0Q
         Zdkkyzp9df4162r/Vt42OVtg3MSy0LzyTXGAlQficfHmPeNPOfBbevGtmxbr6PpN6tuY
         YBjoUBWfOVh9304Ai+agYSOQBWH/9lWPXeWuXlt5n4oNZYHGP5Qb0S8XdFAAaIB3UdDF
         yvFabP3isJuR+pl6ISMXvjykpAtv4D9tVHLbdcneIUp8cbGdRbDbE3BBjsHGXH01rUHN
         lT9G+Gr57fAwxfW13BiJke/AfWop5jCpBDM72hIvGnWgtsDbyR8O7YCaiQLni/Il9j0e
         Thzw==
X-Forwarded-Encrypted: i=1; AJvYcCV6SCRBVf6Cd5Um4maov1lkYn29T+mF0zr/I8ae+Tm6vFxEnuk4KMnr0+0vSQ1Gdwc6v/ZbJNooe6NjpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWCBAtsR7nC69PiMOqzBmT04CYRaWw5K1vx5oyB91jzrBNMSa6
	nteQHBWN7flaYVkSNS8Hrd3vOuhnZm4jhMI0mX09UektgYV/WLz3oQZvNgY7/V/AZA==
X-Gm-Gg: ASbGncuSFjI8Vzv5hN4JDTId3qZ9keDuHYp4ANjZXLZaquFGHz4V7qw8+TOBla6EIV1
	usPzYp55y81jdN8jP6G17jrt6YDutaSjMtTFreP9XjRIXpCUXvhnv4kFxcqOtrkiLaRsW/7kbfm
	1aLx84PFvHqJGv8ZZSEvW+hPGK2HzMwKwU3knztk9ZA8IOI8v4TVYHD58MQrrnkaGSdLBBN4bat
	+XYR1PUF2C8KiTjbMjBGgy52oZ5SS8hySrTs9lx2IEQvJQUvfE8/QgZCOA/nZJxtKlEJrl96+72
	g7RJidyXTUP+V0VmrlGDvYd6bm//4rIn//IYCnZgd8aiX/kZbjwgJRniiCPNlj6F1huQEqbvRBQ
	B/pzQY418q0lhorI7nlfnsFtpZtWLOuemzBzGhEurlskPhTIrUWL7RCkHgtCnv1qplSI4I7AWYz
	PhGWSANPQtdifP
X-Google-Smtp-Source: AGHT+IHYC3JVh4zkjwBpZ+raijFxCEzh4VWT1zLA6Gt658oaINkv6SV2JCD2CK20MPRQgCSoIXoI5w==
X-Received: by 2002:a05:620a:2a06:b0:8b2:77aa:73f2 with SMTP id af79cd13be357-8b277aa7784mr860421685a.12.1762832577612;
        Mon, 10 Nov 2025 19:42:57 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::ba76])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2355e615bsm1135123385a.19.2025.11.10.19.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 19:42:57 -0800 (PST)
Date: Mon, 10 Nov 2025 22:42:53 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: The-Luga <lugathe2@gmail.com>
Cc: Terry Junge <linuxhid@cosmicgizmosystems.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	Terry Junge <linuxsound@cosmicgizmosystems.com>,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
Message-ID: <46ecf459-85f8-473b-83da-99fc0ae78463@rowland.harvard.edu>
References: <6999b5b2-a242-432e-8100-5d8ee58bcae8@rowland.harvard.edu>
 <CALvgqEBD05PwMpm00cAbFkpSWpCFP9jaBU0r-8+op+RGPtkktg@mail.gmail.com>
 <7adc816d-169d-4213-bb67-9d070af3c4a7@cosmicgizmosystems.com>
 <30528153-95f1-4ec7-a6bf-5da396441f86@rowland.harvard.edu>
 <xrfmda5rohporc3bjax35fc7xjziai6cmdt5svjak5rps6y6jz@k6h4zlt3jgg2>
 <CALvgqEDZ=g+uvdSYqbD22sL_VP+n6Pda2xXuFAJyKkh3bjm6HQ@mail.gmail.com>
 <CALvgqEC6UW96NEYOCM5v0m4x8Si0A7AwPuMpwXt3PMqkO3eqww@mail.gmail.com>
 <52fc4350-2930-44d3-b844-03f00806f142@cosmicgizmosystems.com>
 <1ac9d1dd-822a-487a-bd42-45c163dfbfe7@rowland.harvard.edu>
 <CALvgqED5NCNjrtv_YSfg9rzerK-xWAE5TaJjZtMBMcY=8MSk3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALvgqED5NCNjrtv_YSfg9rzerK-xWAE5TaJjZtMBMcY=8MSk3g@mail.gmail.com>

On Mon, Nov 10, 2025 at 08:48:57PM -0300, The-Luga wrote:
> From: https://github.com/torvalds/linux/blob/master/include/linux/hid.h
> 
> #define HID_QUIRK_ALWAYS_POLL          BIT(10)    ->  2^10=1024=#400
> #define HID_QUIRK_NO_IGNORE            BIT(30)    ->  2^30=1073741824=#40000000
> 
> Sorry about that. I'm still learning and the documentation was not
> very clear on this.
> 
> Trying the 0x40000000: `usbhid.quirks=0x2d99:0xa101:0x40000000`  the
> usbmon stays silent when changing volume/button and reboots when
> changing brightness.
> 
> With HID_QUIRK_ALWAYS_POLL: `usbhid.quirks=0x2d99:0xa101:0x400`
> (reboot does not happen).
> 
> Is there a different quirk to try?

Why would you want to try another one?  You've already found the quirk 
that fixes your problem.

Alan Stern
