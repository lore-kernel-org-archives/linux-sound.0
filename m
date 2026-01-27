Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2844328B62
	for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 18:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769539886; cv=none; b=dWc1+2A8jWZJi+UpipisirH85H0ix9WzZV35mfxIZZ0F3FQf4k0WHJd3B1ZUg7iHknYiWwoxxp4MDU+o00kaJpPbFJaLKLO8IGZypqHNvUIyKPHfh4d+RuUBMTyCiVDwLlQha4hmV73FcR5ZOSRIZnZBZnapMU2TBrqneu1Z+74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769539886; c=relaxed/simple;
	bh=qArAMpZJ4F3qlkiildbqPjg4dSjEqJxMkuCNZ9Sgzbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onlZ9VM64SUd2sikkK7NHZMSrqLEWyczBUh0EZx0fjICNH49s3bN40D5bEF4zGktb2v7Wax5BlfE6lddn0Z0fNGBd8TxVEsgI/xM/yXSzT/MzHM9vyugo4ugY2HnpO3v8M5hc7xvUDTbZYI9lP/cfc227wLGwBIFe5q89UlUprs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUwJ789N; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUwJ789N"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4801d98cf39so45996525e9.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 10:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769539882; x=1770144682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkNqmPn4BV41VYFQxjkR3+9fZTczW5ysPjEroCIQMPE=;
        b=CUwJ789NsAQ7Zy91KoQ/FrAiF4e8y3c7tZEHsjBeksezwVE4sd9fKgdClf80b3ORbc
         U+4X9sjC/c0yhO+K3QJkSP85ggE4Eve1LdAEkG6t7uAqwPpWmhIlmzRB9lwoNqeP+W6d
         /nGwUvgpr1GqaSAW4Ub0GXSuYZt1qvOxi6GIL8XGy4H+QFT1rBj5fmZFJx8CQxW+0HQl
         mSsaxK8iYWVgZyNJxBXalOO8yz2HwRwtADUQhYQ1Up+71PmTA2WSTKgVs7Jmr0kZf6LL
         4m3NIGdOh8JeQoOf/rcZkWHLL7BIU57VslxaeNQyV1npw07H0dNIQ7MZKS03edDUZ0uC
         9muQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769539882; x=1770144682;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fkNqmPn4BV41VYFQxjkR3+9fZTczW5ysPjEroCIQMPE=;
        b=FwuUVbKA1whpPHTSgk6qFjwooip7dVpZGZhwZFBJ3m4i5cL1VrYIhpjban9cYmziOk
         nqWn5Xik6hUZCbIyX4UndRWiQhMB7ay7VCzDfmL8JyNr4/CQqc8xizUPIBDvb0REXGHe
         UAraPseeCCovntMJeRlS29GAcIN8mkelbIJgG77RP2JXjKuO570r2mA6IuhE3xifjDAB
         eNOftdDyyETERF5UCfiIC0ni8G0y/H9/draVE4gvbchNRGWakCHfj00CZ25vO35zVylM
         +kkPQTrz8xrLCvdad0JEUC4my/5hGDAWTbTFBWeCnUiFVIDU5cnZZ8pMV4MR4M+AKhcp
         t9uA==
X-Forwarded-Encrypted: i=1; AJvYcCU40sjs9uPS0q6faPDEMMjZKUYG9MRtQ8pabw1xjcAfmTJDLB/+2Og3PWPM26QsISq4hoIKFD/pQ1ofEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlHRc+YjOO7t4rcJSYwkJOZZsicwlzSWBZl5N2Zl7KHIECQHoc
	JPzwCD/AHNbI9yfr3ZTB4JvbO3anIEXkGIYqbpEocwQHuG4ba7F5cWF6
X-Gm-Gg: AZuq6aLTFvFxm1xS6TUevrNBgKCRkPso39RXTTzLxMNuKA7Jnt5mdhL+7lRV/mB7dAZ
	bs+Gxz4xS7AxtuZBxTwiDkckTHdwkSFk9c3qE5dyAX6PtiaMVJoi7fLpPnSPvh5A65obcrrUpY4
	IsIjhe+pQzV+iyipmEm2ygXZyRfHrOFP6sZ1RXrG7Q1mzJA/6VElIFtntqRlTiijxt0XbWe7xYY
	aCKxo7eNw006RVDikrpb6cdDsyoJycomZR7Ni8yDhdFC7DgEQ4vmFeRg1MRCRWpn/RmcpyGs9YV
	9+1SWAkebioqpTYfEOSP4ZMZPlS4sXRXGhPlZekNS5uPCVuKYudb//FiRsM4D3rJON/rI1kxY+b
	xD0hgWaOTKSQWkCEiISmkN60knKRw8B5uxoXq2n8UdS6SXtjxOhWq0rYzPM1P7BY68Ga96wpkVZ
	NpmE1Too9SycekuTQCU/hcP1YtmMyOJVCffksxirqg5VfuwrfQoXxMzME=
X-Received: by 2002:a05:600c:b8a:b0:47a:814c:eea1 with SMTP id 5b1f17b1804b1-48069cb8baemr40072695e9.35.1769539881833;
        Tue, 27 Jan 2026 10:51:21 -0800 (PST)
Received: from anton.local (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806d255f81sm1827095e9.4.2026.01.27.10.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:51:21 -0800 (PST)
Date: Tue, 27 Jan 2026 22:51:17 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 0/6] ASoC: sophgo: add CV1800 I2S controllers support
Message-ID: <aXkI5jnCEb1SLnlD@anton.local>
Mail-Followup-To: Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <50b16e42-2621-46d9-bb3f-5b4ea20aaaa5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50b16e42-2621-46d9-bb3f-5b4ea20aaaa5@sirena.org.uk>

On Tue, Jan 27, 2026 at 12:50:34PM +0400, Mark Brown wrote:
> On Tue, Jan 20, 2026 at 11:06:02PM +0400, Anton D. Stavinskii wrote:
> > This patch series adds basic audio support for Sophgo CV1800B,
> > as used on boards such as the Milk-V Duo.
> > The series introduces the I2S controller driver,
> > the DAC and ADC codec drivers, corresponding DT bindings,
> > and DTS updates to wire the components together.
> 
> I'm going to apply these, but there's a couple of small issues - please
> send incremental patches fixing these.

Hope everything done correctly here 
https://lore.kernel.org/all/20260127-incremental-for-i2s-dvier-v1-2-431b809c632d@gmail.com/

Thank you very much for the review
