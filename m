Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E65B306B12
	for <linux-sound@vger.kernel.org>; Fri, 24 Oct 2025 15:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761318073; cv=none; b=fNDxrS/5F+uUOkGOEcLJBfB8BbTGw/nF0UgIqK4xRBBCcIrPK02c5wTJ1aGAi+n//HJJnDhv4D6gaZh15xheBLMNqH3Vi5TPLS49T2xvzVJH/vMPI51ToBiACeA5XIQgt3TvCycC89FkIJ+PYeS+PtDysE1g85qKQLpJHKUFX1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761318073; c=relaxed/simple;
	bh=Ipd+fJKM54dwFhjqVqY2/vt0B0gPimIr32J295wlB+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACbxnFKvWujxKLbq6aNrSXYfb7+SfmmsK2iJw1bAvvR0R3KyJLiWEsbVOF+mQDuYPY+IQG2N1eDLw11Gz4feqHMzdgOBoZo9oQQzoMxl8djEU1zI6x2d2suZikPX00dmGJkDAz/TP5/cYl3WOjLx3wjOfipcUsryDWaVRmxlYUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eapkqcC3; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eapkqcC3"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b6cee846998so1432831a12.1
        for <linux-sound@vger.kernel.org>; Fri, 24 Oct 2025 08:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761318071; x=1761922871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ipd+fJKM54dwFhjqVqY2/vt0B0gPimIr32J295wlB+M=;
        b=eapkqcC3gDLEE0fjFzXqlUpmKvq26CySDN96HJfNC9kv7HhsNAtnUBRYeLKEIXbAn8
         YpOyEvQjCfQqLXG+3AqChnWMtVXL/diT3BurH2Zn/GeJulkqZMzRJpiuxH87jI6ypO4A
         oHiC2s2yTaPotu4xCvggyAwl+uMapNTq8fzLTNMT2P9YgB5b8+VnRU74JGrCCXUQ3K48
         ujKlTu6HCge7RYxJ6Fa1VzZehJHT1IwzdKhr+ZX4bOX+Ax97uIeYdwgv7jmgUUZs4ZsA
         /QWidY+fOpUplPG7CXpWIjQHF7bKNjHU1npOH6gc5sgpAxtau9u2Gj35C3JziPlBeVJE
         jmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761318071; x=1761922871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ipd+fJKM54dwFhjqVqY2/vt0B0gPimIr32J295wlB+M=;
        b=FvnYzs6lJcdHdduev5++dVE3aCwg5cxyH8S/WsW/cQ+7e5AdsGpMx+3Bg4MX2AtoBO
         MaCxtZN02aNOaBeDy4TGQEGZ2OH+eXJ4YPXM+FGe9FWybyOxp3zV+D0Cti6YKUP/Jybl
         6UFte+4EoenO1EMNuwk+jxEtbYmYTFj8FfmMIJ6Cxkuhdc8sNGHKEEZZjd02MHXDv6Ki
         YHwWIYmj9fFrJl6AzyJZ4eZLMYguJhWECPCbiUQQQSVaP7N8awZR1zRqHG4mpI5bEfq3
         TT3K+jvYy8TJvqyr490anh8imAUC/WuSME+z1AeCkQYTJB5fpv4gl/K3Fhbwe70UNzOA
         o8lg==
X-Forwarded-Encrypted: i=1; AJvYcCXB0PzsZTUIU8Z90nMRyNhGd5Xh1h9JYbEiplcWwCmBfBsZSlus67WqznaVyuDYkCQyfmCdUX70nP9nLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOJsM2QMxBfZbSTfE+Rf89eSsj0U5AYxZRmMbOAzq+7lpu34ZK
	qbY/nzKWQMvfDgv0K3UKzHE5X0rk058CkoImY8ISFzYTMCdRsADEzJyqGq7Mj5Z6Ngc=
X-Gm-Gg: ASbGnct3hk2QJqzah5irt4220tH3aJqcRC56Ul0T8tzAR59ZV6Z/dv5EYuxFvOzIlF/
	jjgYz+/I5Z6YCMV3EnKACLKhsvlZDE93UEOuGnHRxE8DOy5ykAW7sZ07BbHEaE+ltrWP7Q0akmy
	fcZKDNwOhkiptoZcznqQHkvDZYX+LFbS5lXUhIzWkIy1Xw1f4XYFwoKVpz2qmL0peKvPp1G/m65
	sp14zrqTGcHJoHPQL3QIweG09TXuph/6Q3ODIeUnbG+9458Tyo7vo+dOMpg2ZvfdzzJ4R7ho/xM
	AOGaG09YXmduWEShajRCe+9q3M+L7rUcYHb3X4P4ppp+q2nenjdobHPmz7g8xX/6ROCLtHbpNaX
	HKAwQLf7OolCJQ7gueDQlQHUU28S68MWaYmUx4EtUaRy9aw6oXlJs8XM6u3oHsaH2mVl3gZ8/L9
	n+HhU=
X-Google-Smtp-Source: AGHT+IHuDfyfb1rJHT8ZJBZDENWXEuZEgoATFw7kevTr6Wui6O5rdZfaFJ1o7hmkdy/EeXDSX0H8pg==
X-Received: by 2002:a17:903:8c6:b0:28d:18fb:bb93 with SMTP id d9443c01a7336-290c9c8968cmr381787975ad.7.1761318070419;
        Fri, 24 Oct 2025 08:01:10 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c4aa:f655:2dba:5bb5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e0f3794sm59537715ad.88.2025.10.24.08.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 08:01:09 -0700 (PDT)
Date: Fri, 24 Oct 2025 09:01:05 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Guenter Roeck <linux@roeck-us.net>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Georgi Djakov <djakov@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Joerg Roedel <joro@8bytes.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
	linux-pm@vger.kernel.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
Message-ID: <aPuUseub-Z60hrOx@p14s>
References: <20251023143957.2899600-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023143957.2899600-1-robh@kernel.org>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org> # remoteproc
