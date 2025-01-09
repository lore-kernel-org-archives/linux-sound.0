Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAB821C18E
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 15:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736435082; cv=none; b=CeDPvSEcTr8uVz6pn7EYRqRxya5o2humO7rWTFmHcR+8Twyp9jIVX6kEyqF+2aGrtlE6PL9VJLO7EmlL/d7dDaY/BhDjVaP0PiEay/tszbgF0T9uqB/MNdkApULvDovp/Je1yRZeYw7vyFSq0rCNJsYeklu5LiU1p+pnh+8zfZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736435082; c=relaxed/simple;
	bh=UFNF67ThvwKYGIr9LjvaeYK0LorhG5SMQymw4TUFxZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y08dIsiur3gtxDUaogWuBWjEe9TQLTsMCV/4C6VT6lwzHWGJu0Dd+POLoIyYY3+LYQEVbLIiv08FbsH+zgqr3zhlDi2RGnlUR6JibOy+9ub7L6d4hZPjqewW8F83OW6i+ApyKtKytQMcBHg/netrR7hmJFW12Z9a2jySH+J/KIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Bz20Sg7m; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Bz20Sg7m"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6d8e773ad77so6484106d6.2
        for <linux-sound@vger.kernel.org>; Thu, 09 Jan 2025 07:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1736435078; x=1737039878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YSdaJGvAnPm8sdhChaQOQ+WHVBjxyn/3vBNbnqfwbWs=;
        b=Bz20Sg7mBOJXvq1nyNoBy2DiS09LlnLiNcMOt0yOh7RZwAzFFNC0YGykYWs0mHr0KK
         sdrRv5YvgLLAxESb/zqzTn1mIZQEzAUBQfjgGwKuOdNDLDl+kXfVOoid+SOiw7fuaosz
         2ry2PXdZOl8JY7ssjbhNSyP1+WCDLLbuNZDGjOu0pvduWBERMN4tfCXXzNAzCVlsyAh1
         lYiaxWNUtCsOB+cgkN19yW3crzHiZqazdTnpHmFK/Nc0aCVq9dRacV6mwZWtRdZeXvrm
         t3HFONkhHR/7r4V9Lz2ss55uOwrPK8hTcSEHDZ7nu5GmxOCB8oIpEDot9UhFS0OMFHY+
         fUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736435078; x=1737039878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSdaJGvAnPm8sdhChaQOQ+WHVBjxyn/3vBNbnqfwbWs=;
        b=Ch1wELNKxB9esaVnTgwF8pk1g34ZflF4fErCUCq/Al2NTog1MwLh9iKLxX6im6x6K/
         SjoRWzLPy+V1Fv9aXOd2ksXoTI6/nCzvMkx8QlhOkuyEYNs0Zc2iXZR1oNXdo2r5G+EK
         Q2Wa/xVT7Vr3uXghuLADhrsAP/8aKKqfQO/OHSP9x53tb/0YhgxCtCW3mY3O4kGaAJkj
         tGm2BS8rIEZga/eS1UnwuuvsOYvz6VdVj3k/OJWwOmObx2y44FfaOoW42CKSXmf6yj3G
         XFNi+Gu16wuRRrfak72MCdwCMLgSWH4EjX9hm008GaHypEitYstNQazJEO+jtmNoC5fT
         Qqag==
X-Forwarded-Encrypted: i=1; AJvYcCVspd59Ebtl5cimQLpAXIpbfQSBhY+2Kn7Avoj1YoDFnV8V+Jqb6tQLJkCt/wuCK5uAmJaQN66fdHhHcA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6s3DKtJr4Yki0tkUXmHKupQ6NxiJOqrS6vU51GesxQ700fWS6
	P7h2INLz+BPq5+izFFcojS6oSZAggQ/xJIaGt+RgyTBgR6SKeyqE3zZZtNlyeQ==
X-Gm-Gg: ASbGncuAmx8Yk0Gdga76RJSoRiwSi0HOpSZFUMpQZtCw4V5eAAWeoNCJEOgpFOXjAou
	NjtNjEQFOJceYxlkHCk85sorjsEF812FYdTV6BwqbEZIscNV/PZLsGBR4m7dvR5P48zuOBxZ7rL
	XffSUrJI3KsqT+sfpH3NIDsNTFX/J+D4wRJf0fzMgi0+ptBn14D2Y7LJvOQCcPf2BTcBF5PvQ+e
	JfsyUQfqs3hheGD7Nzc9tmWNp8INFM/eWTzy1Bro4hlGUF+34RsrujC1okoR5+GjvcliNfdKRI=
X-Google-Smtp-Source: AGHT+IFWuR/I1Qj9IsiCg62cNYHbOpw4ZbRuDwHYPLvABR/i6xFAm/Oo3GgFjpEqHOwPMvDBxSIlnA==
X-Received: by 2002:a05:6214:3a8a:b0:6d8:8a60:ef24 with SMTP id 6a1803df08f44-6df9b1cb040mr136757116d6.9.1736435077495;
        Thu, 09 Jan 2025 07:04:37 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3e6788b3sm207136881cf.26.2025.01.09.07.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:04:37 -0800 (PST)
Date: Thu, 9 Jan 2025 10:04:34 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
	mathias.nyman@intel.com, perex@perex.cz, tiwai@suse.com,
	sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com,
	ricardo@marliere.net, lijiayi@kylinos.cn, quic_jjohnson@quicinc.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 3/5] usb: add apis for offload usage tracking
Message-ID: <69a4ae28-dbdc-48eb-b77b-147f58739913@rowland.harvard.edu>
References: <20250109035605.1486717-1-guanyulin@google.com>
 <20250109035605.1486717-4-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109035605.1486717-4-guanyulin@google.com>

On Thu, Jan 09, 2025 at 03:55:07AM +0000, Guan-Yu Lin wrote:
> Introduce offload_usage and corresponding apis to track offload usage
> on each USB device. Offload denotes that there is another co-processor
> accessing the USB device via the same USB host controller. To optimize
> power usage, it's essential to monitor whether the USB device is
> actively used by other co-processor. This information is vital when
> determining if a USB device can be safely suspended during system power
> state transitions.
> 
> Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
> ---
>  drivers/usb/core/driver.c | 108 ++++++++++++++++++++++++++++++++++++++
>  drivers/usb/core/usb.c    |   4 ++
>  include/linux/usb.h       |  19 +++++++
>  3 files changed, 131 insertions(+)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index f203fdbfb6f6..01f6287cf73f 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -2037,6 +2037,114 @@ int usb_disable_usb2_hardware_lpm(struct usb_device *udev)
>  
>  #endif /* CONFIG_PM */
>  
> +#ifdef CONFIG_USB_XHCI_SIDEBAND
> +
> +/**
> + * usb_offload_get - increment the offload_usage of a USB device
> + * @udev: the USB device to increment its offload_usage
> + *
> + * Incrementing the offload_usage of a usb_device indicates that offload is
> + * enabled on this usb_device; that is, another entity is actively handling USB
> + * transfers. This information allows the USB driver to adjust its power
> + * management policy based on offload activity.
> + *
> + * The caller must hold @udev's device lock.
> + *
> + * Return: 0 on success. A negative error code otherwise.
> + */
> +int usb_offload_get(struct usb_device *udev)
> +{
> +	int ret;
> +
> +	if (udev->state == USB_STATE_NOTATTACHED ||
> +			udev->state == USB_STATE_SUSPENDED)
> +		return -EAGAIN;
> +
> +	/*
> +	 * offload_usage could only be modified when the device is active, since
> +	 * it will alter the suspend flow of the device.
> +	 */
> +	ret = pm_runtime_get_sync(&udev->dev);

Note that this function will increment the runtime PM reference count 
even if it returns an error.  You probably want to call 
pm_runtime_resume_and_get() instead.  Likewise in usb_offload_put().

> +
> +	if (ret < 0)
> +		return ret;
> +
> +	refcount_inc(&udev->offload_usage);
> +	pm_runtime_put_sync(&udev->dev);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(usb_offload_get);

Alan Stern
