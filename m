Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534A234B1AD
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 02:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778640449; cv=none; b=Fm7iEEJSS6OunE08MXMYc8v/nkGOh+j9Rmv65Cj6y+YAeghVAGew+QcZWjFzGTzOynfJe78kPecNji4MGx60z9ECV2kbgdOynlRxM1WLHtOitNKm1/KzKuO4cHHbDOmRJjuBShOs9KAFNutf3D9pu32c15DGXjZhoq7nWOmwhBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778640449; c=relaxed/simple;
	bh=YyxjHoNZmctSnpTbMbDjVyAyhsyyMtSY1HrBTTZ/7xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iZeDrYjND5SRDiDZvYL8Jqk5Us2IpqRM4W5YsX+Bh5LkfBcrtyiJBmU7c/i+ArKUWNMBDrEjacV6mryEyNYQcEvnF0HQnlZavpWtGJeOpQbNJdaBhrT9tAGXUqHctGXeTFchdnwgtoDHctNKqKscmAaE4WyHW/FKndVIPsoSsr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oZZkpX7g; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oZZkpX7g"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1335cb20406so2930500c88.0
        for <linux-sound@vger.kernel.org>; Tue, 12 May 2026 19:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778640447; x=1779245247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jmIuo8bkUjiYENYqCNUaWrAwyWaDl9jULEVISer03UI=;
        b=oZZkpX7gkovYIBcxR5xekOhJ1wYVzNW+rAU/7pgfqstpjbdPkWHZX7U+y7tXwEC1FL
         UCgsreUn5Y87zW911scBuhivmaDwDPxDOW0Ad8uSsIPLci6iQMh2JTU+dlQS1EgL3vma
         1l1oQIvcm4krMT9bP6nP48qeoJFQzVd+dONMJ2mi8og+spdmpvNpNoCE+hA9Ot+X//KB
         rvvC60bjyDoutGrVNnA6s1m8JEnN6tlnrO6c6XCJcYWyXsBEiVC07gXuRGWeY2Rc4+Xu
         zW32M2H5VS8BLUXgg9D1/usxlkNkMyxtsSdvXG2arEmpc0+J3TNNkGve8iOuZD9jCIff
         qLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778640447; x=1779245247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmIuo8bkUjiYENYqCNUaWrAwyWaDl9jULEVISer03UI=;
        b=MxDYIwYmg4b/J8tMxlSSNYbEimolF9tl3mbWNyfoE9gdV6Uz9EF7eLG6be3sVvN7u7
         PfmDxy3HMj83eweRpsao74EBRah0h/hIZP6gM2yBs6a7ZZweIrvFqrdaii+SnTIpR14L
         P7xYvH2T8jrRU/2PLsWWEIlcNGPMYbbsmSwQfCeAn+lde+uKLWS2uAGE9+7tfakh3CRt
         1ZEFQ4+lrucJzrSYS/AlNRNfcugKI2WZqUKPouYlN1J2qwaX36ztC1BvaXr+pLpcEcv6
         YQXyV+VnpOIElsa8Kk+uCzAUkZif/xLxCAnF71qsMhzB+sn6mYFl/AcDicofnJ4RTfTL
         T0zw==
X-Forwarded-Encrypted: i=1; AFNElJ+DGTtPtA25C9+8jFtPs1+pJTIV3M9/P1zwe2/1ylMnp3b7lSCSAMI/hcseRFiYYTdP+nBdSJvc8776fw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/v3oRWQykfxds3FJkRL3wczam9zKN8ITRQ1vXb3QwUgJcdXBU
	+QO+YK+DK6c+rrCno6GZ+XVL0KhKVCBcbqi0MPG044AsYZUKlc+D6JhJzCMTqQ==
X-Gm-Gg: Acq92OGdX8jCzt5/uqyx0Gi1eD3cQq4AGROm5EW2PbDlAfep4rpAOgPchmIY0ozkDlM
	gU/LMZlCsVypGKOvisWVW2OE3ZJ2PMX0CTB7qU00YvXrhJaewCTh+njAi8I36838FOOIPPuXyxN
	78YmBT4JPtnPCFsSYqRx/vInZjzBVTWHnPXQCAfRCeyJiqnNOeN/tkiLDy+y9+y+YVGbfgJyLzb
	Y+Qd+Mm2y3Z9B/6C+nlS6v1uhpK0gSZf4xj/k9L9+xopVuNLwFmMbcsn2FOpz0tpWOBG9jnENIv
	CFX9MYwwSZeEik7FrAEHeDsQ/3yHBqHk6YV7BuEQY8qdcwxYeTU8QyBAr3rpNgfdWBu3tfNGOLy
	nWhAdXwmwe+n2BBKF8t8LutcsbNgekbK+tTpC3XXss6YdFqPb3zw9/g89/RCz8DwB0SuCAHo8+F
	Mb3rRQp5Sdgg==
X-Received: by 2002:a05:7022:438c:b0:133:1ba6:f42d with SMTP id a92af1059eb24-1342ee42543mr896288c88.3.1778640447382;
        Tue, 12 May 2026 19:47:27 -0700 (PDT)
Received: from geday ([2804:7f2:800b:ba0c::dead:c001])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327810ff4dsm21253470c88.3.2026.05.12.19.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 19:47:26 -0700 (PDT)
Date: Tue, 12 May 2026 23:47:21 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>,
	Nick Li <nick.li@foursemi.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] ASoC: codecs: fs210x: fix possible buffer overflow
Message-ID: <agPmOSjHXOmpy2FJ@geday>
References: <01092e5d-7cb9-436b-82da-fe23bb68f530@al2klimov.de>
 <agMeMXwKVrjJZ8Tw@sirena.co.uk>
 <40e04485-3d2f-4359-9d7b-5b530d0e01da@al2klimov.de>
 <agPVoN1zSjzYPqpt@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agPVoN1zSjzYPqpt@sirena.co.uk>

Hi Mark,

On Wed, May 13, 2026 at 10:36:32AM +0900, Mark Brown wrote:
> On Tue, May 12, 2026 at 09:07:15PM +0200, Alexander A. Klimov wrote:
> > In fs210x_effect_scene_info(), a string was copied like this:
> > 
> >     strscpy(DST, SRC, strlen(SRC) + 1);
> 
> This doesn't apply against current code, please check and resend.

Do you mean the codechange must be explicit in the commit message
instead of a generic pseudocode version?

Plus, is it acceptable to send v2 in reply to v1 like this? I'm a little
lost.

Thanks,
Geraldo Nascimento
