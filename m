Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254C822AE75
	for <linux-sound@vger.kernel.org>; Thu, 16 Jan 2025 15:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737039993; cv=none; b=nfnoXcw/rvdDjwlyHr76Xue6HVgCSGOQ6HEey2pCxb/2JEoivnVRhmRIn8gtMBxY13wMorI5+Z8ISr5wtHUZ1obTZM+g9Jzh/Ho6Dt2qeUdwsvjrbEkdkcw6VUePhXfZd90NzUc0lFzUEwJuWfVA0QTSuukY5Z0jQouR5YKg/Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737039993; c=relaxed/simple;
	bh=oG2F8xXGtIwtvCB2psTNr2rTBTy0NoXrjQaVcy/VBS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OAWKnoYvp1rRY6Ix8rVUzSASCOnHiHkgihHc7fDMo/ZKEfIH5JWgrc/AMAOGehRy04KcN7jXKq2BzJD/n7v3wMrr8+HK9ODeNHBq9rYDkXakBcFQ6oAiYUbp42CgriukeChchVAYLDMXj2zM8t6tkm32OCJzYRvJ/S8RpUIl4tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=sH/VnWpT; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="sH/VnWpT"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6dd5c544813so11890596d6.1
        for <linux-sound@vger.kernel.org>; Thu, 16 Jan 2025 07:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1737039991; x=1737644791; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0nAZJMInzyGZTtSyDilCukDk7rI34qxFCU+Z358ruI=;
        b=sH/VnWpTpgKen++BGBMCB8e4RlTVosfVzShLz3+364d4FUwbWI9VObglhIYuf8JjhU
         RWcPr1pZ3ti4QbamOS7PlE8LkwifcDV90u4fVrv9wBmtZ57pPL21n2u0RnTC0GhiMxzG
         ul1xUFxEJ/3S8Qnd4CqvzJ8O+BDwwAa2uW1fJxjssWDhn82lG5qbgRNzAvPrwqCW06RN
         XwXPjQGWnxGW9Hvv+OfRol9cdBIoyznSe0RaQDRchRFjokoi0c87DsHVq1UAovi1w3sk
         rI9sKjVTRMbItbmDOKfW9gnwrKVHUZwKmJG/GF1cWFEaIcNDlUe0F6iR1MuLXCcY3a69
         Bs7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737039991; x=1737644791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0nAZJMInzyGZTtSyDilCukDk7rI34qxFCU+Z358ruI=;
        b=ZnD1M6+TNAETSxqaEqCUxbbyXORpcavHzvDwN5OuE5foCRHWgzaPOj2OI71XwrxlP8
         wLKAiJU09LPPpIQdmi7AgjJPqwur8YB5Plt09bFBLAJOV47Sfd0BqBA16Ce0eugQjdZE
         jv8F0nIzqeihZ7xDD1mww5HAj8GCxprVS2daFBv1brV/36pR7BhKSdElOBiJovXxie1G
         R4IuwcITiIJ8xXJipaCnhnfmA1w7tJw/Eiy2RPrLRE2KW9Q/vogtDrytc4oDscSvjVfF
         t6bXGsvP4O4tshVSqrg0rvnEv2A3NvJVk3gVOYlvkg1K6FMg7tEalDq+hfC0Fg2RimmN
         L5Rw==
X-Forwarded-Encrypted: i=1; AJvYcCW/hNubgQ2XbalKLXS7JSuF7nEVKOmYJKLdadkp6hm7erC/tpfrZpz2stASsLgOIjXd5Zu3qdMTji2KpA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw29jKFEjvt1gQYkTVk5L8oio40wgN89qmZVrNKWA9PZFsXR486
	EZ3uNhxopENcU3BybDey4ZvrE8Q7cBcjblNIJ/9966Du7ycAWwjcMsUS8+9Gtw==
X-Gm-Gg: ASbGncuTjPj958T7GLqpsVFMEosTNCalK0N5F5uTcuIynbhIHEE6KJyrH6mzMvuRxr1
	qL78OolafUv5dBLfIU4IeZ/HfUACQ+Mun0B1Ygz/TF4VYHnMcbYUxO57XlBymygjZJKDZHCokiH
	cfjTyCaKv9v1rxXygPHWEmzvWcZHQMikuUPOU/DmkveMViRJ8mlyZspEt23fr4XM3OvOjKhQ9Nt
	y2a3lO+1NcC6yVk3OazSRgSc2y5OfKDHrGei0z6vxkQf0HCiBMojP+XBQ==
X-Google-Smtp-Source: AGHT+IE8qovXuuvi3CKjkFHljYmIvNkybJE3IrpSuCl/AVPhp93pJK7DzHsIz1p0ZQINBJZvJPkaNA==
X-Received: by 2002:a05:6214:449f:b0:6d8:a4fd:d253 with SMTP id 6a1803df08f44-6df9b22d70emr555753786d6.21.1737039990992;
        Thu, 16 Jan 2025 07:06:30 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::5bb3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afc117a2sm774686d6.40.2025.01.16.07.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 07:06:30 -0800 (PST)
Date: Thu, 16 Jan 2025 10:06:27 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
	mathias.nyman@intel.com, perex@perex.cz, tiwai@suse.com,
	sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com,
	ricardo@marliere.net, lijiayi@kylinos.cn, quic_jjohnson@quicinc.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v8 5/5] usb: host: enable USB offload during system sleep
Message-ID: <47efaf4a-8237-4030-8386-5e67a50c3030@rowland.harvard.edu>
References: <20250116135358.2335615-1-guanyulin@google.com>
 <20250116135358.2335615-6-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116135358.2335615-6-guanyulin@google.com>

On Thu, Jan 16, 2025 at 01:50:17PM +0000, Guan-Yu Lin wrote:
> Sharing a USB controller with another entity via xhci-sideband driver
> creates power management complexities. To prevent the USB controller
> from being inadvertently deactivated while in use by the other entity, a
> usage-count based mechanism is implemented. This allows the system to
> manage power effectively, ensuring the controller remains available
> whenever needed.
> In order to maintain full functionality of an offloaded USB devices,
> several changes are made within the suspend flow of such devices:
> - skip usb_suspend_device() so that the port/hub are still active for
>   USB transfers via offloaded path.
> - not suspending the endpoints which are used by USB interfaces marked
>   with needs_remote_wakeup. Namely, skip usb_suspend_interface() and
>   usb_hcd_flush_endpoint() on associated USB interfaces. This reserves a
>   pending interrupt urb during system suspend for handling the interrupt
>   transfer, which is necessary since remote wakeup doesn't apply in the
>   offloaded USB devices when controller is still active.
> - not flushing the endpoints of actively offloaded USB devices. Given
>   that the USB devices is used by another entity, unilaterally flush the
>   endpoint might lead to unexpected behavior on another entity.
> 
> Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
> ---

> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index 1bbf9592724f..6441742869ff 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -1413,19 +1413,31 @@ static int usb_resume_interface(struct usb_device *udev,
>   */
>  static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
>  {
> -	int			status = 0;
> -	int			i = 0, n = 0;
> -	struct usb_interface	*intf;
> +	int			 status = 0;
> +	int			 i = 0, n = 0;
> +	bool			 offload = false;
> +	struct usb_interface	 *intf;

Unnecessary whitespace change.  Please remove this from the patch.

Alan Stern
