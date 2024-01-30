Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7586226AC6
	for <linux-sound@vger.kernel.org>; Tue, 30 Jan 2024 17:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706635606; cv=none; b=J/zT2SmHoib6TXE+23i8iihtEfeUwsIMtY2H2nJe5l6crXfDsV4w2AMh7xwGntmMfy8oHhARCbWuxiRFkxQkF85Xq03p22Vmu1to4SCEH0eMLmA8VDE1h91b8lxSCERapBsj7/kf7jKJS2INmoR6yMZOu05kBg5d1K95/nXmOJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706635606; c=relaxed/simple;
	bh=tujS63Z3WTO3HL/gA030RreduT7A4LeLdFjqM6yXNnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivfTIjZmMLHRDXg+22ISe8w48N8sKrmue3NVJhv0lFV6iKi8eez/gT9/OfaUWurPR3jbFJ5AOwLlF+S11yBVQWG+sP9qasyy48+u2dQgT3tt34RDHmPgu9qYG2/CogVnbwDZOe/Ra9zJyrWWrlV0KGb8EBCtYFM5x8uXdp3a4DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TGmk8Bnb; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TGmk8Bnb"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7bc32b04d16so184198839f.0
        for <linux-sound@vger.kernel.org>; Tue, 30 Jan 2024 09:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706635603; x=1707240403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XHEc5V/RfvIUcDqDPWtfK2Fbm134fj3EfnAyQgIeJsU=;
        b=TGmk8BnbaburrtVf4hxBD9barLu3slCpIOTxK0I4oHi227NxZRGS1T5we2C2WFoANR
         QIpUUJ5kOQiK12Y60RP6iV34x0aeYWLzP79OcH0lVZ9/b4IcHfDnHGZsYcQI28z482fH
         AijkXdIKZCcnaKvzjIm1u7CPEJ+rliuo/1e1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706635603; x=1707240403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHEc5V/RfvIUcDqDPWtfK2Fbm134fj3EfnAyQgIeJsU=;
        b=hKxT+LvLv9/KV8DBcwxJ2u69IjANoc+BWRbk7byMsGSVKVgr1fnp20nbnC+8V4fZmK
         +8ZhR+53WTTdCAaYl7TxuelWn0ZV3b9XasFmNOCGFkHbQKL64j/eT87dH76qDPqchYEm
         I0lND3RbIn3vyT6x6prMjOAebtD6Jhmd9DyAtNb18Stw83v6m/gsLmMMOM72SWdqThyn
         M7uGdUS4lZ+fzVIR9Ld9q05Cz8QPu3Zx4/Hp+ct3QYwllVx6dScsk9vWSYBp/m+UPTlY
         RMxVIrSAOyQGwMLUkZ5zjmI2sLbHlKJNzXx0C3GPefAmFkkxHUVp2y+VZEWbJbr0WHsv
         wFBg==
X-Gm-Message-State: AOJu0Yx4/plmB7OfyHt/pERBMsHF6zFzpIJHmGubnnq82qEB7+ikcA/H
	zWJST/cA1AxEpYmFwvzES5mLaUXyWVRIox/mRCb+/KryVnh/hlWajq9g6LShzA==
X-Google-Smtp-Source: AGHT+IFimfDfRCnK1E0ZunAlWv35M1YoVKRH2MzzR63F6QtSUlTwYNRe0SPuAy6cbeJgD5ssxgxk2w==
X-Received: by 2002:a05:6602:1249:b0:7ba:c1d9:7664 with SMTP id o9-20020a056602124900b007bac1d97664mr8268582iou.20.1706635603591;
        Tue, 30 Jan 2024 09:26:43 -0800 (PST)
Received: from localhost (110.41.72.34.bc.googleusercontent.com. [34.72.41.110])
        by smtp.gmail.com with UTF8SMTPSA id k28-20020a02335c000000b00470e7cd33acsm135832jak.27.2024.01.30.09.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 09:26:43 -0800 (PST)
Date: Tue, 30 Jan 2024 17:26:42 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Javier Carrasco <javier.carrasco@wolfvision.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: misc: onboard_hub: add support for XMOS XVF3500
Message-ID: <ZbkxUlFSKlUkcHaC@google.com>
References: <20240130-onboard_xvf3500-v1-0-51b5398406cb@wolfvision.net>
 <20240130-onboard_xvf3500-v1-2-51b5398406cb@wolfvision.net>
 <ZbkfsVr-1pOTa1ic@google.com>
 <2024013024-borax-enjoying-beb5@gregkh>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2024013024-borax-enjoying-beb5@gregkh>

On Tue, Jan 30, 2024 at 08:19:40AM -0800, Greg Kroah-Hartman wrote:
> On Tue, Jan 30, 2024 at 04:11:29PM +0000, Matthias Kaehlcke wrote:
> > Hi Javier,
> > 
> > I understand your motivation for using the onboard_usb_hub driver
> > for powering up a non-hub device, it feels a bit hacky to use it
> > as is though. Re-using the driver might be the right thing to do,
> > but then it should probably be renamed to onboard_usb_dev (or
> > similar) and do the hub specific bits as special case.
> > 
> > Greg, do you have any thoughts on this?
> 
> Yeah, this worries me, adding non-hub support to this driver feels odd.

It is odd as long as this driver claims to be hub-specific, but truth
is that the hub-specific bits are a small part of the driver, I think
it might be worthwhile to consider adapting the driver to other devices
if there is no clear better solution.

A possible alternative could be a separate onboard_usb_dev driver for
non-hub devices, with a similar structure as the onboard_hub driver,
but without the hub-specific bits.

> Why can't this all just be done in an individual driver for this device
> itself?

I suppose the reason is the good old chicken-egg situation that the (USB)
driver is only instantiated after the device has bee powered on, which is
what the driver is supposed to take care of. For the onboard_hub driver
this was solved by having a platform driver that is instantiated by the
parent hub if the onboard hub has a device tree entry. Probably something
similar would be needed for an individual driver, and the generic hub
driver would have to call the equivalent of onboard_hub_create_pdevs()
for all drivers of this type (or a wrapper that does this).

m.
