Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67531891AB
	for <linux-sound@vger.kernel.org>; Sat,  8 Nov 2025 20:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762634889; cv=none; b=Ll7yJipihK8mprsNQjDQ+ac0lzVArKtRo1gWnhBzR1+TSlPodv76MyT6NOhd9uF6rVqZ3l27ybO30/LTrU0L/V587F4F4uvlzAsNbzn/bTc86W8NAWyd+Xg6Ep6rj8MFxH0Z4i/gwt5c7kxzfK3y+7OFtt0cp6qUhJKvudKNzI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762634889; c=relaxed/simple;
	bh=QlR0B6N9BjTErbq8JWiIdrooqruUIOIdvGtkH+2nQNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Djsou98gnySvum5SoqXjA8fCuYp9pEkm7N1xyTbucO6s6QoqZp4bhgSSw70/TxIBUsBINw7a6ByR0dzmj/TGXbVR5Ntqm55qGX+OW9yAJTI3lbLoC9NLL4zC6OEiyBZWfk39pcV0PMYtHNjigjuALjjQ4bWntmUQ7M8aQdq29AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Q1Kpnx4V; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Q1Kpnx4V"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8b145496cc1so263687985a.1
        for <linux-sound@vger.kernel.org>; Sat, 08 Nov 2025 12:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1762634886; x=1763239686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qCYrdx1jDzo1jgoNSrvx+iisAmac061wFNMLeHZf7TI=;
        b=Q1Kpnx4VGdjK9/YN5UfIjNFboQYMCdgOLeXkwOz96HcKt7SqUMgvNrcQ8HvHdxDZqE
         rOSFPNI31h9BkiJDf7VRHTfK1fUJ5DLXDXU+X3fTgfUG9xYqc74tiY9/zEhR63OFDfaA
         lq97RYl/OK+PFWomTA87VE6jqLRw6F7W4KqQuKtaCBLDg+xFLDUO7wtNeBAHf1T78lnL
         dl0UFCxV3/764OJJFBocmEvYoXznFaaePpTixwST9CuODsnCXwUjL+UKnsHxp8GccBx/
         WuTWu4j5Vla+PsPKK7asvwgRzTgQaHj3mQCiL2k+5129ZypRC6YEfdVEgTraqyJEGVuO
         xdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762634886; x=1763239686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCYrdx1jDzo1jgoNSrvx+iisAmac061wFNMLeHZf7TI=;
        b=YIjVRdi25oYZDhwwEsVbmdLO10Bsw+fQuvStsBOrWBQ9hTcbscE5O8DMJtE6Imwmy4
         R3ZnkVp/+aR6WyAgtooXPXXYewn62bhIKkadCyqLIhul8R3leG6oUbDt0YJ0ufbXkTnm
         11DX6uudtEZD6962wJrEL6SghoJKSmoxSVE0DKqIjat9O9l3F1smKDyuoU0AUCvPzwGx
         qOiBoqOl0MOh/WNr4BXf2PhZK5/tqeyenzwnr+O7xAsuswCH+P/MJwHwA9SbIs0Vw0Wy
         4UsxuuBD2ED+/tUOGLXOAZ1Wz1tcCL26yPpSZWtyUzC0MwppJy9YFSHzs2W/ySlhVnyV
         3+fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvLWNFHulovxS9G7vd5pbut6xTgU2qMF83UCpe9rx8VcJFu/jx95B42dTtUjm3v08BBaqONnldXOl3uw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5RIvj88t9jYNBloPzt+lpqFoLt/leI+ZJBMNcgAAbxaGex3hB
	g4ZjYSlDW6OrewZ3QxjZnj3SPlj99p9mzohtvCW4fgrhta6jaEFGSJlJmnm0g1L6pqMlOII+rcw
	HxKI=
X-Gm-Gg: ASbGnctBw4FPRw/DFv7IIK/shTACEX+kmyYvAhuZb9ioDE6KFgbBshXHzYElK83sT+K
	rX8RtNMP7Pr1NxTkIpPsXLTHdWvJH0s8aU7Gk12v2yJ/Hz0F0d/qiFEFYFWobsQQ1eWWKtVGtbR
	oyOlU1iCXjiHOy4nx838UAHhQC+YsDRHLw4wgiNxyQzIeXVudCJHH0l7gwhWaBRNtlaztSK7oae
	dt6AH5e5UwdoGRcwDO+jSbYKGZ07MkGfXmk1LoQwMADghpjRF8hCqMc0MZUQK/fKQgA1GRU33o2
	7p2DV2xV3FlntX5DQNnOt1XoJTTq7GwbUtyjM8TCaJpLhI48pfgL99uUIhtqjK2/5lR686fsWIi
	bwAhfqkMGguS+KM2XgByt33RtzKN/s8jDqmzqno6BO6k+DVYzxdcLIsMS2DA1RZSWVT7CjKE6Fn
	ar3A==
X-Google-Smtp-Source: AGHT+IGVJnBaKHGM31qZ2OMIKVy7/r7gI8SWt96oc87GL1Lm6WBvCGhhnKi5OFoKYu+BZ/8J0Pu/vw==
X-Received: by 2002:ad4:5ded:0:b0:880:4ec0:417f with SMTP id 6a1803df08f44-882386120e3mr46827916d6.24.1762634885616;
        Sat, 08 Nov 2025 12:48:05 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::db9a])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eda563fbfcsm17586141cf.10.2025.11.08.12.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 12:48:04 -0800 (PST)
Date: Sat, 8 Nov 2025 15:48:00 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: The-Luga <lugathe2@gmail.com>
Cc: Terry Junge <linuxsound@cosmicgizmosystems.com>,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
Message-ID: <d7e888a6-6a65-40c1-84af-058b97ca0178@rowland.harvard.edu>
References: <CALvgqEAq8ZWgG4Dyg_oL7_+nUDy+LUoTXi+-6aceO-AKtBS3Mg@mail.gmail.com>
 <3eb2564d-5008-434e-9698-99b0cbe4d1cc@cosmicgizmosystems.com>
 <CALvgqECkMdntW2He8C7EcvOtCL-PpiXM9xNXWHzGtgimDxezHA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALvgqECkMdntW2He8C7EcvOtCL-PpiXM9xNXWHzGtgimDxezHA@mail.gmail.com>

On Sat, Nov 08, 2025 at 03:18:03PM -0300, The-Luga wrote:
> What I am doing in order:
> 
> 1. The speaker is physically disconnected.
> 2. I connect it to the USB port.
> 3. I will use the knob to change the brightness.
> 4. The speaker reboots.
> 5. I will change the knob again.
> 6. Wait for the system to come back after reboot.
> 7. Stop logging.
> 
> ```
> > sudo modprobe usbmon
> > sudo cat /sys/kernel/debug/usb/usbmon/3u > qr30.log
> ```
> 
> 
> A little off-topic but... Even though it's safe, the cable used to
> connect to it is USB-A to USB-A. Every time I look at it, I'm
> horrified. However, they also work with a USB-A to USB-C cable (where
> A is for the device and C is for my computer). They have a program to
> adjust the RGB Light, Equalizer and Volume not using the standard but
> something they invented (No hardware volume, then). It works with a
> pass-through to windows VM (reset does not happen on pass-through).

Have you collected a usbmon trace showing what the pass-through does
when you adjust the settings?  The differences between that and the
usbmon trace you collected before should be illuminating.

Alan Stern
