Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EC014D28C
	for <linux-sound@vger.kernel.org>; Sat, 30 Nov 2024 10:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732960916; cv=none; b=uUHNDAiXBymDSX8PqYcCvq79ZA5m6Pag9wf/8HhKsNMGvG//x6zRxvu0RGYIEbXdTVVEuVp7mLNVkJOCQxp/d4tmYrMMHHFHKb+gfNMKo4cI1pEmA1N1IyTBMFvOa0FCfWeGzKmZwsVhvkZCpebNrO1Tll3winEgg4Gv+Ex/2p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732960916; c=relaxed/simple;
	bh=J0PGfzHtc8eDImvBZL8pINDxhAaMXF7m1ba4kc4UTfE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XTD1xbAwU0wizjbLVBJHGuzWiJYH/YtMwLV4eifPhBYZJOCEfdcvRV4RMZZ0dCql88aAGYGZ32JEvlV/hTFrBcZfVYIvnVZyoxDblU0P3U7NjWFfuQF016MzTs04WtmFX38lnwUr0uQgo0UC4th+60GcYMgSER8oWSS/FHc/Ipc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fjbkAzmL; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fjbkAzmL"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa55da18f89so393012166b.0
        for <linux-sound@vger.kernel.org>; Sat, 30 Nov 2024 02:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732960913; x=1733565713; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eoQ54HwTU1p1rSg91wlPuaN8FZ/aS4BbzVLuUyxC+Ls=;
        b=fjbkAzmLuIPqm5jR+X1thWK007N001o/jdPeE9Ft9cuIw0GKQYsC23eCstoZWafxPC
         3T7v3aYHRE0mJ7fecZhJg36mfJ2GrwfxOe80pXGqTZXZmLOtqLS20BHuvlsp57ld1OqE
         N1K2LTOuWTKSOQllX1PNiAHjV9DUIevpdt4H6s9XMABIb42rGw6yZRbmbQcqKRLXQtzK
         fVlTRDOWfRHXIGqqwOQTIyh4N3w6rd11pxYgIwWtX1k5orCBiWUF1Ds0ikWrLuTO7qy5
         /BYuscqvJMja6R+LgLUyoiTewsspyoGcv1Znm+wDZjcLNt05WtdRsKrp6eKU8v3W1gI8
         LuXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732960913; x=1733565713;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eoQ54HwTU1p1rSg91wlPuaN8FZ/aS4BbzVLuUyxC+Ls=;
        b=mmaqqg3x19h42IsjptY3d/x+GbQAJwSlgITwkFdLEd7a+aLc50qkuh1Te5RpeOi6kc
         o8KXBPsTE6mEcRd5i8+ZuHtsEHmXoHrSe4n4VGKqc5c/QbTiWeAABq7LErH7uepyv/+p
         iX3a8g+virmBLyb1zLr6aOoTbytPnSepWLmTu2+oNb3jMp2Wh+ZdZ+DL/AUHfAtev2MT
         fIloCST6KdMkc/8f1k6hyln0e4lxRIpyN3LuS+owDYya0L2Hg7xzIvkVRkszjDVQomZ6
         HQ7ZVbPriXu3zX+L1qKcFx9DtBDtcg+KQIMGPfzWcdH4y5WPyuVbVKsH6EG3WzGjgkvO
         lPUg==
X-Gm-Message-State: AOJu0YwBni0V6XOkFUrhQDPJl4qfZ9OEDjMuN7dW8J2JUtSjxU+mVkgz
	f4rtPSuS1GZps11OFgEBzPXwcDuQQj6L/lw3mkmcWPx3uwvjwrVg6EgH7ypv0UoNBJjOpiPKOOw
	56oh/MQ==
X-Gm-Gg: ASbGncsOmQ7ves/HOdFkN2whREXti31/lMuJJfzryrprQr6ZA0UeCTa5gDavRps+a+n
	3lLsAsk4hy/T0zMoPxHF8rg08d83PKb/X9RYets99ZqGz/qBoAfOFHWLhRdcYYpbVNUWJlgageg
	S/BPxAOVI7e4W1NT8E7jnIQK2Purwrdb/pIZ12eIOVqo7wvXrmw1seBbU/TgSIOPzLZ+FyBH7AH
	BadmICu+nnPw1nP+MEcighIHhmpf+/lkpPd8/UwoDHARF6BEjGrhorCL5rTPDuLhZhANVBo
X-Google-Smtp-Source: AGHT+IEurzfGjdGLcibSSEULoQDw6DMviCDNo4pG/j74LwiiwS72Xu3K6D6uUUEpUPBufgrMpznlvA==
X-Received: by 2002:a17:906:3199:b0:aa5:3999:4ac9 with SMTP id a640c23a62f3a-aa580ed052amr1143774466b.2.1732960912826;
        Sat, 30 Nov 2024 02:01:52 -0800 (PST)
Received: from localhost (h1109.n1.ips.mtn.co.ug. [41.210.145.9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097e8db19sm2656851a12.61.2024.11.30.02.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 02:01:52 -0800 (PST)
Date: Sat, 30 Nov 2024 13:01:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Conner Knox <connerknoxpublic@gmail.com>
Cc: linux-sound@vger.kernel.org
Subject: [bug report] ALSA: usb-audio: Add quirk to enable Avid Mbox 3 support
Message-ID: <b53bc77b-6677-4dfc-b21b-77e725dc7541@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Conner Knox,

Commit b01104fc62b6 ("ALSA: usb-audio: Add quirk to enable Avid Mbox
3 support") from Aug 18, 2022 (linux-next), leads to the following
Smatch static checker warning:

sound/usb/quirks.c:1275 snd_usb_mbox3_boot_quirk() error: doing dma on the stack (&new_device_descriptor)
sound/usb/quirks.c:569 snd_usb_extigy_boot_quirk() error: doing dma on the stack (&new_device_descriptor)
sound/usb/quirks.c:944 snd_usb_mbox2_boot_quirk() error: doing dma on the stack (&new_device_descriptor)

sound/usb/quirks.c
    1259 static int snd_usb_mbox3_boot_quirk(struct usb_device *dev)
    1260 {
    1261         struct usb_host_config *config = dev->actconfig;
    1262         struct usb_device_descriptor new_device_descriptor;
                                              ^^^^^^^^^^^^^^^^^^^^^^
    1263         int err;
    1264         int descriptor_size;
    1265 
    1266         descriptor_size = le16_to_cpu(get_cfg_desc(config)->wTotalLength);
    1267 
    1268         if (descriptor_size != MBOX3_DESCRIPTOR_SIZE) {
    1269                 dev_err(&dev->dev, "MBOX3: Invalid descriptor size=%d.\n", descriptor_size);
    1270                 return -ENODEV;
    1271         }
    1272 
    1273         dev_dbg(&dev->dev, "MBOX3: device initialised!\n");
    1274 
--> 1275         err = usb_get_descriptor(dev, USB_DT_DEVICE, 0,
    1276                 &new_device_descriptor, sizeof(new_device_descriptor));
                         ^^^^^^^^^^^^^^^^^^^^^^
The comments in usb_fill_control_urb() say this has to be "suitable for DMA"
but this is stack data.  It has to be allocated with kmalloc() to be suitable.

I don't know why I'm only seeing this warning now two years later...

    1277         if (err < 0)
    1278                 dev_dbg(&dev->dev, "MBOX3: error usb_get_descriptor: %d\n", err);
    1279         if (new_device_descriptor.bNumConfigurations > dev->descriptor.bNumConfigurations)
    1280                 dev_dbg(&dev->dev, "MBOX3: error too large bNumConfigurations: %d\n",
    1281                         new_device_descriptor.bNumConfigurations);
    1282         else
    1283                 memcpy(&dev->descriptor, &new_device_descriptor, sizeof(dev->descriptor));
    1284 
    1285         err = usb_reset_configuration(dev);
    1286         if (err < 0)
    1287                 dev_dbg(&dev->dev, "MBOX3: error usb_reset_configuration: %d\n", err);
    1288 
    1289         dev_dbg(&dev->dev, "MBOX3: new boot length = %d\n",
    1290                 le16_to_cpu(get_cfg_desc(config)->wTotalLength));
    1291 
    1292         mbox3_setup_defaults(dev);
    1293         dev_info(&dev->dev, "MBOX3: Initialized.");
    1294 
    1295         return 0; /* Successful boot */
    1296 }

regards,
dan carpenter
