Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CC11F8AEE
	for <linux-sound@vger.kernel.org>; Mon,  2 Dec 2024 09:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733130289; cv=none; b=PSuYeoT73X8uQ3xjgJd1tRcbI90F4Ctk1vDVX1aNiFEYR2Tq9gQjPsS6ISPhqE9seKF87cznDLmDP9zSnNdAH7CI/VMWQEx7ek9nAJrVGorZpXZNk82Uig4k6aO4rSl8Ei+30VJaomtbjELFflM6cDsRr09OCN0yYVQNopWZ1xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733130289; c=relaxed/simple;
	bh=pCoUNa2kT0AWoGP/1OCIwJg6AWvTWHfuekATG+8YA+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDEl/fOby4yFRDrioaG365oOyAl75gu8exw2UmFllla3T1ykQ0PVVXTXKuKE+QduaTof1HghWx4n3dS1Dek/7K2ym5ajxKe8Cd2P1jXRIz14r4r/te6udWwP9iDT/ZnPQZXKJ+JqoxEBK17efyPfuG9Tb8wwlTDgNDOqmxF6hTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M87IMzlk; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M87IMzlk"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385eaecc213so593308f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 02 Dec 2024 01:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733130286; x=1733735086; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vlQh15A+lHadlghSFnXQFTF4Tzu6Jw+lWivtdkBo4Kk=;
        b=M87IMzlkSSw3D4PI/S5SuUlLgXEmdMfDO89c1KOJEYUbEnBULCoRuX+MBdRTosWBGn
         qAEPFyB5z3+DjwVkZ0PMztXjkoi0Z928Mx+WzfvpFPvo6P9xsrjcYFDfJOQSu5sfcCod
         j8E5XVhkafDtpyLfNPLD/q4pO9t6jNfZNFUVPOYwTKJRvrT6bk+rDYXs1+g7XEdSKnab
         BodvFr4GhjO05ZY9xk2jkqfE2QhQOgLlKKDQujWesQLlOkjN8OLP9+ar9pheuGQ6TK1Q
         oD10OQn0IUpxjEwTIbuheZEi99uqLlmRh4BYE72hSn/dq6mFFu92geV4ToQcr7DZ8Uyg
         1PUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733130286; x=1733735086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlQh15A+lHadlghSFnXQFTF4Tzu6Jw+lWivtdkBo4Kk=;
        b=ArW88HnAfIn+h43W2pndgzi1Fp2fcb2qEzAr+OfTlP/yMjOfvTtLCuE8lIpykA1LkP
         rGB84F1r1jil+43980/u5vNqY9hABqMy4dybK2P3QMLpFlicxsm36g07t1C2Fws6y+FT
         jHdcWKsNvQm7fSSsVOFpD64YfEurgkU9IC8Uxt0ONV7+JGA1GHpgpV58iIHkMpWCb9oa
         RABkEgxYSMeGU+AThU2s//jDQNeyWEXx24b+JbxJtPVODY7kdfUqs4syDp+H+7z6T4Pf
         eXv6aHbFuj60GoBwoEFFDPkwhvqqrd42E+GFnmMNvORF1Y5OM3KQ/c4JtRM8KDpAvDap
         tnQw==
X-Gm-Message-State: AOJu0YyWL9s1BLlWtMbWBl1xeZkYB6XxZg5FgPBGd/+03p9yD/RGf7+I
	tAu/ik+itYDCnE8dsAqN6cU/AypTB/p2X88lvUsGMNKch/zKMseJAET+5Kio8ZA=
X-Gm-Gg: ASbGncvsz258vuXPAeLTlhVrz1CHGNuP+eB9iVhQFH5aiSyCNg81ouiG0yh7hx+LQLD
	KmQa8cNcDF54oK2E40Y2kjbNgf8LQpl4oqoyVmY7Ic9yz3HHzt0jwarP+GL4qm8l4yyArFvtiWJ
	cUR78O2XWsde6xOXWbFNFN1HgsdHWiUxwh/nBmZc2ReVff4PWQ0TeeOT3LSa7K+iFuCIOGe81hB
	77+KST3yh9Ep1+91NCpFbVMbxSze8Y5OfxShomLv+FhRKBH+DYoI2g=
X-Google-Smtp-Source: AGHT+IGcdcQVUiEsHkpBeQzoFKgoyN22HR2GKTMM618wangxZOVkE3Y/BakJ8maxl2VxISuTePmQsQ==
X-Received: by 2002:a05:6000:1fac:b0:382:3211:6b7e with SMTP id ffacd0b85a97d-385cbd981a4mr14752945f8f.31.1733130286356;
        Mon, 02 Dec 2024 01:04:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm9589689f8f.1.2024.12.02.01.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 01:04:45 -0800 (PST)
Date: Mon, 2 Dec 2024 12:04:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Conner Knox <connerknoxpublic@gmail.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [bug report] ALSA: usb-audio: Add quirk to enable Avid Mbox 3
 support
Message-ID: <47c421ab-f50a-486f-a7d9-da4df8afde1b@stanley.mountain>
References: <b53bc77b-6677-4dfc-b21b-77e725dc7541@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b53bc77b-6677-4dfc-b21b-77e725dc7541@stanley.mountain>

On Sat, Nov 30, 2024 at 01:01:49PM +0300, Dan Carpenter wrote:
> Hello Conner Knox,
> 
> Commit b01104fc62b6 ("ALSA: usb-audio: Add quirk to enable Avid Mbox
> 3 support") from Aug 18, 2022 (linux-next), leads to the following
> Smatch static checker warning:
> 
> sound/usb/quirks.c:1275 snd_usb_mbox3_boot_quirk() error: doing dma on the stack (&new_device_descriptor)
> sound/usb/quirks.c:569 snd_usb_extigy_boot_quirk() error: doing dma on the stack (&new_device_descriptor)
> sound/usb/quirks.c:944 snd_usb_mbox2_boot_quirk() error: doing dma on the stack (&new_device_descriptor)
> 
> sound/usb/quirks.c
>     1259 static int snd_usb_mbox3_boot_quirk(struct usb_device *dev)
>     1260 {
>     1261         struct usb_host_config *config = dev->actconfig;
>     1262         struct usb_device_descriptor new_device_descriptor;
>                                               ^^^^^^^^^^^^^^^^^^^^^^
>     1263         int err;
>     1264         int descriptor_size;
>     1265 
>     1266         descriptor_size = le16_to_cpu(get_cfg_desc(config)->wTotalLength);
>     1267 
>     1268         if (descriptor_size != MBOX3_DESCRIPTOR_SIZE) {
>     1269                 dev_err(&dev->dev, "MBOX3: Invalid descriptor size=%d.\n", descriptor_size);
>     1270                 return -ENODEV;
>     1271         }
>     1272 
>     1273         dev_dbg(&dev->dev, "MBOX3: device initialised!\n");
>     1274 
> --> 1275         err = usb_get_descriptor(dev, USB_DT_DEVICE, 0,
>     1276                 &new_device_descriptor, sizeof(new_device_descriptor));
>                          ^^^^^^^^^^^^^^^^^^^^^^
> The comments in usb_fill_control_urb() say this has to be "suitable for DMA"
> but this is stack data.  It has to be allocated with kmalloc() to be suitable.
> 
> I don't know why I'm only seeing this warning now two years later...
> 

My script looks at the line number for the function and not for the buffer so it
blamed the wrong patch.

Don't stress about this, I'll send a fix in a few hours.

regards,
dan carpenter

