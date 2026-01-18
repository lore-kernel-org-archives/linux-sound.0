Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8002E62C3
	for <linux-sound@vger.kernel.org>; Sun, 18 Jan 2026 12:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768739900; cv=none; b=eGa4rzrv0DXk/YBzszv+RPkVn7rdUQyLMWlWv7fxADWUxB4Yr9zAOhAP8G5W2BSZZ6kXbZYX2z7Hnl4dVjtcF+571M+XoJ22YXbicsSGcL4TYluF9TTaCkNiPcrLxkvgElJ4mehistJlPca9Ma92ySI+mDvgzVAUf7kZHT7SZ/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768739900; c=relaxed/simple;
	bh=0hVyA2PCi5FEsxNH21GdDW7QN4jM9ZNzdMJ6AOp9Qh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X18sTi0VNnmAX3YV7iCWVcN/l/BPCficnyDEv6SZW/8LyhPDUoRnbxmMsuot78Fz6kJwVKEVHG01vvnKLTpnSWsP21mrKxoEtS0iomav+6JSU0tdHH2EA4BPmxoMyC4F0IoPkuUkf3VjVUkaE+ZHzEzA4luB96uzkBglxomV2gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdUutxVP; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdUutxVP"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4801bc328easo25951445e9.3
        for <linux-sound@vger.kernel.org>; Sun, 18 Jan 2026 04:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768739897; x=1769344697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Suqn9RTje01PunnIGGFhUEA52WhKnlG0PrdrAwNU83A=;
        b=cdUutxVP38NXVTAvZb8iLdTzcHVmKHkCa4snVlzuOItJVAH9mgcwi6ZA69QFjnrknB
         DyXrSoecCn0efnqhaGMf6DcYgBdTowbFS7CmZNNPWT9oE/KylEjX2aEBt6mgtnDOD7Lo
         MS3ws9bfAKdxcphdE/8wwOzyGImvtbmgWjaXrN1s1d0Pjc1gHcEhRlVvXJOcABERmNby
         TaPmU6WAPAUEBO14unEM0qTaCDPxBS6njVCBjvNp15MyzgeO7A/GT9pGNhyu9zmM7ENS
         NfnZOnEMhcrwpqAlt++xU/9IDsPcblviydPYyFaQQFqyI5gZCrWJ4PKbFQ5xVVZDjkew
         3euA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768739897; x=1769344697;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Suqn9RTje01PunnIGGFhUEA52WhKnlG0PrdrAwNU83A=;
        b=bd3rlX/p1uDlQaKqDvrHP1JjD0sWm/HfRGYdD0DXxxRfHbcp3NqSNhvcoPk5wjNqJ0
         W2ftbvgDjH17vZHlVBNCeG35+H0FSMlGArn7bfzoWCH84O+1mK0/dozxKf8YWsZREj8I
         fViRsg7qdKpUwJc7rxnLmsy3x6TYssTQdoBKeQe6kCynTFHZb0Bl1x8l4POZFiRNKs6f
         rP9bV3fUT9bolg1goD96QviQmEwam5dvVectVtwCxPdlwCdZgI7hjDHv2J4/o7CCvCOQ
         IJ3xxguQwZrP/Ch0fAcgCYyWdG1LDJn/u0TclAExWwbQawQqkbe3pU9xhOQIyOOrwcgW
         7xVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhc7/rvha9fVFm/Jm5npmy/PIrQODMNa19BT4hz88oGlJC8zSC9osMz/JQ24hZYoSLCMV9IXiYTtGyoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAhB6xzhQ/LbkCbXGA/UrqV0YTQiA/1WaL4ZC/8TUuJDERrnD4
	KqmDah79ehLcUcSc7XlmxIyUxcC//pNC/W5nbipGLpPxXOYmk/BS5nLU
X-Gm-Gg: AY/fxX4tqSHB//aFfN6t6YZquEHycca3+08NLgv562UfZiKchFCYlsL/eyUlIyOONJ1
	cYu4Abysw4x/9oKNIvS8ZfZuADUK5vUZdcrkwS8vEgxHgjqx+ti2owpYxmFG3Q97UBzA2rWUx4D
	o3XCDEbKmRF4gG6RHXUStzS/oTHNIJnf65FJcat1m2koDx7laPYVLgfgUTLBZmHfmkim+1UXKew
	Wnni2En4JxwmDW+UK6JvrpybTaAAJMu3z8lu1/3ZKSE4kZqtcnBHTGHWCxty55bogxmtQ/3T5wx
	5igMS929dG8oR+xYGYfpawBec1FXC5hGWeHq7gi6xERKBkcrLf1o5J7mps/pWU1LFdK5Np+8EWl
	iD1uQwpNX6Ex9EW6qMP+ajjzeMNjkxf0Pv+Fs2hLnSgVUGnT4NP5wx/ECtYDAVKv60abu66qY/D
	+Q2TDg9+RvQ5WJbWrTJXxTrEwk4P90hPsD87RRxypl57ExGMWkm0QpGA==
X-Received: by 2002:a05:600c:3107:b0:480:1a3a:5ce6 with SMTP id 5b1f17b1804b1-4801eabf6b4mr95429315e9.14.1768739896538;
        Sun, 18 Jan 2026 04:38:16 -0800 (PST)
Received: from anton.local (vps-58d0fbce.vps.ovh.net. [51.178.29.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8caceesm138596495e9.13.2026.01.18.04.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 04:38:15 -0800 (PST)
Date: Sun, 18 Jan 2026 16:38:09 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 5/7] dt-bindings: sound: sophgo: add CV1800B internal
 DAC codec
Message-ID: <aWzS4y82qkzJ-xkI@anton.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
 <20260118-cv1800b-i2s-driver-v2-5-d10055f68368@gmail.com>
 <20260118-magnificent-horse-of-warranty-e5fdac@quoll>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260118-magnificent-horse-of-warranty-e5fdac@quoll>

On Sun, Jan 18, 2026 at 11:16:15AM +0400, Krzysztof Kozlowski wrote:
> On Sun, Jan 18, 2026 at 12:18:57AM +0400, Anton D. Stavinskii wrote:
> > Document the internal DAC audio codec integrated in the Sophgo
> > CV1800B SoC.
> 
> Squash the binding into previous binding.
> 
> > The codec doesn't have any special configuration at the moment.
> 
> At the moment? Hardware is done. It does not evolve.
Will reprhase, thanks. 
For sure hardware is done, but I'm afraid I could miss some
functionality because I have access only to public documentation and it
is not full enough. For example there is some kind of amplification
limiter register field but there is no information for now how it should
be used. 
> 
> Write complete bindings, see writing-bindings document.
> 
> Best regards,
> Krzysztof
> 
