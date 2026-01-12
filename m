Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3338D1B81A1
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 08:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768206418; cv=none; b=Enm5oNIs8OOmC3QG+ku2D6X+OZQDI6c54uD8OoQyYdD5qIORRllnHHY4r6LiDLWesYb8yNwpFcjE8kE6PEqPskaZCHIasGw3yte8lUe56X6TeFojnk2Fi2VE5MxMvGErUOBRgPGTRjQv7tjbUYmNxCFj0j2RRQnQD4jGGQpt3Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768206418; c=relaxed/simple;
	bh=PuWAjjq9YrXOY/YeKxnLLx/uXIvacM03hu0GiN3MDm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwCGI22m6LJjSoVZ+sVlCaKPQ2Fb/UrvwlLx1gUcfz3mYzPdNJZtQO4IlUVaCRApv3LNzXAq+riErhpyUQQ6ffFnimn/sUSE/x928S0nxBjMjGIcT/8f5hLcmi8qiCSo/c0uT4vEi1JR/SYuExVQFgeb7HDWtkkcUAwTrxOHC+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lUuvD9p9; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lUuvD9p9"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47774d3536dso42468695e9.0
        for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 00:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768206415; x=1768811215; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZC0DHZS+P3sGEVCdfDj7Y+FJ8IlnwpNEuGNXuXov+ic=;
        b=lUuvD9p93wARKiODPXbE57XAAteBQRm7NXnoZXJ0cw9U1I4to/6g+DmmUlChdA7kns
         SJ6/m9uOhWcgxuUvuqdgl2oEsu0PSzKAXkNKCd5g8gThl7zzGWCvYTzpO4vw/NDNJlLT
         R4cjeUXzJHITeeK6/gNSvCPR0XwOEeaZwNdPsl1WlulUaT9TLdllqqvenxZ+2r3ZyyTG
         iPqluX8go1PX3MobkHltR5Xqf6TTgDcTHpBp5rbEvM03Pz2digTvRQ7kk92c7xU7pxLJ
         BMOMpAMmhmdHQPNYrxERjK7Fw14yRnVqkz7UQFs1WWDr9g7LdzIMQQi0NgxnwPzZXmkv
         VK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768206415; x=1768811215;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZC0DHZS+P3sGEVCdfDj7Y+FJ8IlnwpNEuGNXuXov+ic=;
        b=gIR/xhTAUdTXjxzW7HXS/HUjV1bgvF5NtI5IyJtz3PH6xxzcik+50IkVG3L8+goDEy
         b65dWwQUMmsXNAfhpQrERkWxBBWhEPC/+NGCzp4CXOOTqKpm1R3yhzFWMMzXu86GOsnF
         yABsY59nAG/PpE6Qdpzik9FfMGD1+coA+dmqz/pFhbzVhF8wxrKvlODK/zA9hmrt9BNL
         x1NX6VX5gOp2aVKzyNO2NZ7TTcei2wN85IkG52hX9HoBE3y4TAGlJuuhDvdZbDgIbEtd
         lq1KMgCGHQvARjIHX8Ow77G05utPt2vfzu5610LXLj9wojz6TZl0z8MEFyz2gRpQWBCS
         jo7A==
X-Forwarded-Encrypted: i=1; AJvYcCXnBzJvwnWHTBfvO/CEQkym8dVK20VN9gjjrCR2DpDp86UbNVXB4nnuY8GPtBq6pDmgy1WNJ/hY9nMrdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLcLXvKPT1zRLFplgALt2HaYR7/jp6U6wiG/Lz/h/R+czm4aSF
	BhOr/6QaJbTE9siDYgu6PBY5ME1rGJXhiPjubdmkitn1HqDu0dGvgNdBPCk5MH0sefo=
X-Gm-Gg: AY/fxX4KncDVWQxrFmLrRtemJemMhwS4BlGzp1rLxFKN+7HSbwLB0junq/JaSWhSciS
	AsA2dpm6wgRyxuzSdYGgGaLoL66Fe1OwC/ec3JGlqvMCcj14f1UnRv9Wtt5jeiLog0OBgfMRTav
	oEy6OTzPyc0noQQeuUoxcT7iLOeaeYEwPPhebkA7KfXq0UwzjvoWLnnt+FzRlQtXhwOFg7w8Okf
	CfZTjqEu5KMRx9d7viTEsYFJ7uflKop8I1HRKjrgANTWvqqvY3J0erSYZbxE/WzZ3AlsHW148V3
	lZ2976ctrF9mGeqsJbYyttT/IC639kRVXuZ4NniySgkshKKsNP2DycFOLvTjeYr1PRO2BL5Cnmk
	KewV61J4P6ijaOMII+01S7kchPOQ75hjT8II44kEz2XTQEC9nKQIuoL8+j5LtZqOySi/jCw+CGD
	4IuKhsYpJVXESEZewK
X-Google-Smtp-Source: AGHT+IFbBbC9fKaRkOJtSisp6obozjfPCjhneka9YIKhPUP1zuA8mpyRuSMy+JSdrPF+1j6pMtPRHQ==
X-Received: by 2002:a05:600c:8b6c:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-47d8486ccebmr166152255e9.11.1768206415540;
        Mon, 12 Jan 2026 00:26:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f69dsm339349495e9.1.2026.01.12.00.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:26:55 -0800 (PST)
Date: Mon, 12 Jan 2026 11:26:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	linux-sound@vger.kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vinod Koul <vkoul@kernel.org>, kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, lkp@intel.com,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] soundwire: bus: fix off-by-one when allocating slave IDs
Message-ID: <aWSwS0PQHumb2TJG@stanley.mountain>
References: <20260110201959.2523024-1-harshit.m.mogalapalli@oracle.com>
 <732ad24d-d88f-47dc-bb6f-bd1b64ad354e@web.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <732ad24d-d88f-47dc-bb6f-bd1b64ad354e@web.de>

On Sun, Jan 11, 2026 at 10:27:08AM +0100, Markus Elfring wrote:
> …
> > Using SDW_FW_MAX_DEVICES(16) therefore allows an ID of 16 to be
> > allocated, but the IRQ domain created for the bus is sized for IDs
> > 0-15.  If 16 is returned, irq_create_mapping() fails and the driver
> > ends up with an invalid IRQ mapping.
> …
> 
> See also once more:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.19-rc4#n659
> 

Markus, please only comment when it's a bug in the patch instead of
wrong advice about commit messages.

regards,
dan carpenter
