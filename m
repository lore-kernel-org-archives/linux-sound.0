Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8CF7828D
	for <linux-sound@vger.kernel.org>; Thu, 29 Feb 2024 16:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709223628; cv=none; b=kiEciW6OG/oAhBMoXpMKM3nUxpt+7ZCWQq9uyrHUq/IYH6bOF0J3fSOo7/M8aed7QDBXj8fxED5wxt1NbQSBk3MBAO6wKwgg/Lm+MnvuCFNTQwiwvqQyMhx/GKVbWlBupH/1NEtlZYANzJg3YnR5c+wNkAcvzoR/oahNXLAgSZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709223628; c=relaxed/simple;
	bh=5akJAYIzzDJf3+0III/J1h+mlaUltOxaG9R8wmii+rY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnOrZMWMfXoEfhM3gfbBwDdOootEiJ/PaTZG3Fg1dcDNAjtINLh1gE3IA5bsXwbMzUVe07Uc6A3be9Wbba8uYoIzQkesKGywYGTIcicPT3CotQeu8K8uq8kXRy+vLnBjYn8nn9zG8M4TkjYeiYoktdvqOzJpLwozEYNguWBujBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fh1o4r5V; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fh1o4r5V"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-36524116e30so4574055ab.0
        for <linux-sound@vger.kernel.org>; Thu, 29 Feb 2024 08:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709223625; x=1709828425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g8Qq8yPD2u9VlGqCnCi7K91emb+vPhb1JZTph4xZca0=;
        b=Fh1o4r5V3NV6hYmmXDVU/Y9GxmzQ83D5o6s0cyDo2DHoJk1KKmJDqFr2UDN2ZYIuw5
         +fFl6JK1gnZPmrRnL2r7QcPTwpF4NqL2lVd3JndkE95TcMi4NzER0qnmk3LnjG29orAM
         wvdW6KZUuiiIjVKXMiJ+sG91PCzkhW8etUvXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709223625; x=1709828425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8Qq8yPD2u9VlGqCnCi7K91emb+vPhb1JZTph4xZca0=;
        b=c13O2J1d/YquBPFIvF4/tcMFggdoFLksvxZopXNTbidgORN5HUbt8CDcMs7Fo7ZF8b
         vF7lfVetp0pdyZ26jNzTO10jOkiL1UIiF1o4s/pZEIcGEN4n6MlIZq5kQ5AH4vtR87NU
         cqznXnM2wsq7XAaTg6Tpgz1nU5dAIFq8DcRCqtBSf4jUg3o5mtbRw77A1bDKRwiW3iKA
         YG6KuGFNK4tiI0MuCzAKfR2I1/o/5G3cIstQodGXIh6EWh1v39rr8V37HCixlOEPofEu
         gcFVf1t5gGx3LbhIdsMoUbIUTgQqfON4jETO3bxkMwI8w7YnB8psGvgBhufh4EF7ZUxd
         hbYw==
X-Forwarded-Encrypted: i=1; AJvYcCW3BAkxcxhqfU8WhTNud6oZtk74N23t8L6R4zgnm8CQZyEDvjSOLWYWoIQ8/APsdxIwTJD7P7Qxx/br+VUkAX+MpMmSfPfCcO8nUlE=
X-Gm-Message-State: AOJu0YwM+KKp5HSc0DtV7bqbsgVsGkv3dn5r91nJ/9DGaiP+Rnet8KPb
	CS968Dwl/6ezU5/uko8Ip0T1e9LYFKafJiSi1VPydrXZlC/Dw9gek3ckT+ItIA==
X-Google-Smtp-Source: AGHT+IFreo0hr/9MzkZCTngz7lMqfGeDlbi8HZb7O7X2LxBPXUVABjMPoOBmX8meMjGxInCXYjaVSw==
X-Received: by 2002:a92:c7d1:0:b0:365:1749:cae0 with SMTP id g17-20020a92c7d1000000b003651749cae0mr2946229ilk.7.1709223625514;
        Thu, 29 Feb 2024 08:20:25 -0800 (PST)
Received: from localhost (144.57.222.35.bc.googleusercontent.com. [35.222.57.144])
        by smtp.gmail.com with UTF8SMTPSA id s17-20020a92cb11000000b00363d8ee8cf7sm393454ilo.48.2024.02.29.08.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 08:20:25 -0800 (PST)
Date: Thu, 29 Feb 2024 16:20:24 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helen Koike <helen.koike@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/9] usb: misc: onboard_hub: use device supply names
Message-ID: <ZeCuyLeC9SBNBkk_@google.com>
References: <20240229-onboard_xvf3500-v6-0-a0aff2947040@wolfvision.net>
 <20240229-onboard_xvf3500-v6-2-a0aff2947040@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240229-onboard_xvf3500-v6-2-a0aff2947040@wolfvision.net>

On Thu, Feb 29, 2024 at 09:34:45AM +0100, Javier Carrasco wrote:
> The current implementation uses generic names for the power supplies,
> which conflicts with proper name definitions in the device bindings.
> 
> Add a per-device property to include real supply names and keep generic
> names for existing devices to keep backward compatibility.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>

Acked-by: Matthias Kaehlcke <mka@chromium.org>
