Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DF137F74A
	for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 03:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787630236; cv=pass; b=Fl+Iw26zFVksbXDJZzM/de6/tAT4zeEPmnaE4wohwbYwv62wLTi6TBZKyAznnsXIAbKqLfW3atDVYfNYA+HRIJWsBReQe2M18HSx5q0TVxSTi+WoUBHiHWr/cJAkD9/Tq6bzSiLcpPP3MIbx/gPhbAGSLDCMhi8fY7/pFQPXjQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787630236; c=relaxed/simple;
	bh=RXmFDfhWcTpQBrj7twWm9WPmpquLnT2VNEmn8TaEDVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rt4WhEdpvqVmDEnIwhCBPTTUrhyCRPxPp+xKVusDHw6c8rw1TR//oab9BGAnW1mZ8qQqD5xgDMhGGPT2SGv1azdhl4JmGJU+tK39j77u3cNsz8To1pkExzeNwNap/0wA+n0BB91Gz1dkgX1VlVfQPin5v8CHQ7T5QoZ/RCJhLdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oM7jaiZ2; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oM7jaiZ2"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d032846c95so51428855ad.1
        for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 20:57:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787630235; cv=none;
        d=google.com; s=arc-20260327;
        b=BywbwYCUuH9iQzCZ3VUnkr65zA1PbASgju3TjrMOO0R38tbXplg0jzSPlCh2wAHuR4
         JBcbTiQeJUGzInSsuURVczuKQ+e/522mO+OVmxwdJL2bvEwn++r+1rCJNAnzcxVGMUYh
         mkgpwCrwJnxE9nooyhyfQUAtvFd99LgFOUNeI2ci1NUB2aUmdgRbd8GbjfVK67LDH0iE
         oLHVcGCZBVuy5WT3eQ5ntV56sksWNAo2rofmCB1D1HybMWFN9Asz5+II+a4ZD9Ytqv+G
         slyehxG2sDGXLg0+m4k/JvsinFFfRtJc7MlLvxvJWh17zQqZQ0WnMMKe0LY5E0/gsSHo
         uA7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Mj2rFiHFmTvobZLOVzaNcgjQJ+pH5YwE1FlLD6AaG3E=;
        fh=iTdivhct2WzgwRGdbuiPYlNGulbMTmbUbX9AB3csOWM=;
        b=Yly9p09WzcsAiLV431fiKRB5fvcfnZjaSgT8zFIXx+quI2CXNhc50XAYjRGBuhLJ7g
         kqaMrMOihYioAocz82OtA8yAWvipRyF7ggBPWILfTJR7mmFhJiQbNoxxJEVRb8KUoaul
         lk0xbzilGmKsoUA64B6FesC86+X7+7thE6VHaTrwX1IXfCaN/Fd6Yp51xG+d6uZDQoTy
         15zChvmLclH2GkC99iaCcFz4c7M5xwGqlmafvhzdvcpy5wa4kby1LAlJYwb8J5agur4o
         P1w9VZj6rXXMUF9tYZUMWvA6Nu1N/LydOYeTlK1NVOw+uJ1O4ASbJ2WD0OBfr52uT/Yo
         54TA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787630235; x=1788235035; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mj2rFiHFmTvobZLOVzaNcgjQJ+pH5YwE1FlLD6AaG3E=;
        b=oM7jaiZ2aIDI5HiXer7Winp8lHFL1irQMOPmkGoPhdi3bIfuBxQ4jhXUyonxTh2cqR
         o2Vg5sO/y+ez5OJsqzVHT/3ZO2a7Ht7/Bi7WQQYgVFABePM0HVbMA6Ma7LcLOWR1yt3a
         k1Rwm2cI/j7/qi1Nv/X5hOYpiCehfjyhDdZcJ69qn+730LsBKzGfzCTAvbwbK+Z3IGAs
         1lF/ViI7uRLVVw8cFWGNeEu1AT8num2AxEEeWy8Uqo+ApNZy53aN2jdXwB0nODcyM3jQ
         a6LgYa/v1IiZhnqx6K28GrDtLurfdqHO8pX/G1JqqSeZiLC5YGEEyiHna94OneTS3bi+
         Nezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787630235; x=1788235035;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mj2rFiHFmTvobZLOVzaNcgjQJ+pH5YwE1FlLD6AaG3E=;
        b=UpC6h709f2lpUAO1TB9ACAZlE3xmyBjbaKE6ebyrpRPfo6xxFQ0yB4Bl44QJmkBUJt
         inIJ6vgPSixXjEiq37cOT3tge5cV83Nt3mdfinSpAmXVg0/qs3AR6z/z3Pvi1iJsz+i2
         9/NCtZZLk7xvTUAMsldrE1MYcOJ5nxKIxHce0QRLxVbADOjh80qoDFL6hSL6HLQ5xIcq
         SbKZ9R6wM8wqUpccMHLllyt8u2FaSoqmp7lAMjOUEVoPuV79GqAQQPsGsM97h325nc5C
         hof79XLErwSUhCdRakLcTugjxxmEF1UTsn0nsdoWWQqBtzDIPDcFjv6IO7z+Jd37wmO9
         YRig==
X-Forwarded-Encrypted: i=1; AHgh+Rqvn8T17SpWeWzw5W1J86BAX7lqxpzvLd/0trects3tRgRTzlt3T/xNe54vpBxQxRfTir1pdvCGA+CoOg==@vger.kernel.org
X-Gm-Message-State: AFuF++n5+MdJ6UzCDvIMIx0pT9hAHrdIkQkSGcdEtNrH+r86dOI7oLuN
	8fkGwMs46AEjpL6+IVgPmW1jAQlXQpY0di/8bICrCqL/Nfpvbm4tNbKErCa0Vz19HeIB/jHP5GG
	P8dEElZhUpvYbDzvFQzSg7C2SyXR+054=
X-Gm-Gg: AR+sD13EehWsNRvTPtlBBZh2QKoWe9zK7UpHu2gQXUocBd0IzuksSzAh6p4Mhg9+J4u
	Nm4ab/f/pMyk/0GmXMIkmcWQirOPgKshZm0sjGwEwHO6Qno8vIc/IxdLuhYd6sZPq0+Ljr+ZAhH
	3p12Ag/A7VWv+VwMRBoIyQzTZhQHpBYV1a36PRlqQKrAzPWy/i0ahBaSxzKMMcP6inZ0+elI95D
	iiry+RySaOGFjKEjcpphx31jNGUuusun+ZfIERnQl89ZAjOVLyj53TVLts2XLE0c3Dnnwww4q+4
	X1zRteJXIcV1mYyACwuGc9SVlMFhrHokoMqm4KfvuNAXmWefEd45e0oSKjRcRX6grfJu0QgnKaF
	emzZr7+DZHCA1/lBtv4H2wSi3z8abg2k0mjnh+o3w5zOo3r5FiXGFQUwd
X-Received: by 2002:a17:902:e784:b0:2cf:ba10:6d6 with SMTP id
 d9443c01a7336-2d64af6f8dbmr579072465ad.4.1787630234646; Mon, 24 Aug 2026
 20:57:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720064131.75156-1-phucduc.bui@gmail.com> <aoyBuho270dTWYBL@jupiter.universe>
In-Reply-To: <aoyBuho270dTWYBL@jupiter.universe>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 25 Aug 2026 10:57:03 +0700
X-Gm-Features: AcwNN1VgX709NuVPHPIHO1MRK8e5h6C55gRznHlOABgEJFMByB-FIa7JkcPYZN4
Message-ID: <CAABR9nEbY8++3VDX438QfCYwqRdqYhPWLHWMR3E9yV=2mN28zQ@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: soc-generic-dmaengine: Handle DMA channel
 request failures correctly
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: broonie@kernel.org, lars@metafoo.de, lgirdwood@gmail.com, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	tiwai@suse.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hi Sebastian, Mark,

Thanks for the report, and apologies for the regression.

>
> The new warning triggers for the Rockchip SPDIF driver [0], which
> is playback only and thus only has a 'tx' DMA channel:
>
> [    2.275100] rockchip-spdif 27ea0000.spdif-tx: DTS/ACPI name 'rx' not found, legacy failed (-19)
>
> This is from RK3576 Sige5, which does not yet have the node enabled
> upstream. But it should be exactly the same for any RK3576, RK3588
> or RK3568 board at least.
>
> [0] sound/soc/rockchip/rockchip_spdif.c


The if (has_fw_node && !name_exists_in_fw) branch is not handled correctly.
For DT-only devices (such as Rockchip), this branch can end up propagating
the -ENODEV error coming from the DTS/ACPI stage itself, i.e. the case where
the name simply doesn't exist in dma-names (which is exactly what
name_exists_in_fw is meant to capture), rather than actually reflecting a
legacy-filter-map failure, as the message currently implies.

The more accurate fix would be to also filter out the -ENODEV returned by
of_dma_request_slave_channel() and acpi_dma_request_slave_chan_by_name()
when the name isn't found. However, acpi_dma_request_slave_chan_by_name()
internally calls acpi_dev_get_resources(), so the returned error isn't
guaranteed to
always be -ENODEV. It could be a different error from the resource-parsing step.

In addition, for genuine legacy-path failures, find_candidate()
already logs the failure itself:

--------------------------------------
if (err) {
        if (err == -ENODEV) {
                dev_dbg(device->dev, "%s: %s module removed\n",
                               __func__, dma_chan_name(chan));
                list_del_rcu(&device->global_node);
        } else
                dev_dbg(device->dev,
                               "%s: failed to get %s: (%d)\n",
                               __func__, dma_chan_name(chan), err);

        if (--device->privatecnt == 0)
               dma_cap_clear(DMA_PRIVATE, device->cap_mask);

        chan = ERR_PTR(err);
}

------------------------------------

So, to avoid duplicate logging as well as logging with an inaccurate
or misleading source,
I'll drop these two branches:

+                       if (has_fw_node && !name_exists_in_fw)
+                               dev_warn(dev, "DTS/ACPI name '%s' not
found, legacy failed (%ld)\n",
+                                        name, PTR_ERR(chan));
+
+                       if (!has_fw_node)
+                               dev_warn(dev, "Legacy DMA channel '%s'
request failed (%ld)\n",
+                                        name, PTR_ERR(chan));
+

and keep only:

+                       if (has_fw_node && name_exists_in_fw)
+                               dev_warn(dev, "DTS/ACPI DMA channel
'%s' request failed (%ld)\n",
+                                        name, PTR_ERR(chan));

which can be simplified to:
------------------------------------------------
+                       if (device_property_match_string(dev,
"dma-names", name) >= 0)
+                               dev_warn(dev, "dma-names has '%s' but
request failed (%ld)\n",
+                                        name, PTR_ERR(chan));
-------------------------------------------------

I'll send a fix for this.

Best regards,
Phuc
