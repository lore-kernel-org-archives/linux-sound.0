Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D67A478E27
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 14:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271645; cv=none; b=PMhKa2YQc5istqhKbK/bS0LnS2OrP9wXMr7OgcPh1alPgELQtu0oLo+xMPhKGZZs9Gq5U93Sh+wBGQmk6bahkGHgz6inNxtwB+tTfAAeXiATRilZgd9tU/7MG/aAwjHZgXRB/hafamAoARsxAf7kNv/dShMMXgbVQ9aP9PD9Sm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271645; c=relaxed/simple;
	bh=8dbuh99N1XaDbBH5diUg3guiV1slhS+7uThdi0QBWkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oLc/4grsoBwqrUaUDkAP284TqNQGHSCiQ4/0b0ji58dUUbEe/CKDW4zidBQrgpWhB3JvUQkittmGZQ/WDR739Bk92MERomR/XcWRV61INPnOThYEHMxIeNDdDm5lInMBWtDMrOOW6IcSHO5F9ISgtL3/U9LoX9+o6RgYc0nhjaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oU58bUK1; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oU58bUK1"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbee846deecso1429705a12.1
        for <linux-sound@vger.kernel.org>; Tue, 01 Sep 2026 07:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788271643; x=1788876443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g40qfLHL0Oj8BSuCLOFYazR0XabGc98fdwfYz+rGZo0=;
        b=oU58bUK1GcD+l+kkPUw2BMzAVYtoZonlkJ2/kQB6p8CdSrVDe3aELYYYu02czg8R8D
         7FoyY5zbPzUhNbE/iv7k5u44FLq2vfRq4w/khnelmpxKwLKQe8t/pwhhiHcNhzbY74kz
         Xl251cIe54UzbQ0S3S0YCNd1owwB7CO8KYvaLjhjd2VOA4jNHgJf/oWGTh28VCD4IkKs
         YQmMIm8ylp1tHpfvK5jP6J04ajkZG6CSd3Xzl3/FAy4oBjTXGQuxvrnp0RVBdAr+2taZ
         CVZagQjW+WCPRrYy+uVA/5t1M9CXM09SWzrggy6zA9DmTMdTIFZOXHtbYR5+frtiYmeb
         DkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788271643; x=1788876443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g40qfLHL0Oj8BSuCLOFYazR0XabGc98fdwfYz+rGZo0=;
        b=Dw8N3GF6md56OFXH5tHsAlIbBi6Q1zlaCdoigvQIHDgWQhFlCrAK6Gw0HfHf+3ldrB
         rgJURumOprjeMeR/iUKDLMIBl9314sFrVFLvAk89fakvIWrPyBqnztldh28sHMQuZXeH
         Q5Q4LsIDenTUaG4kyN8YnAt3MFt/fdb9PPnhHX3sX1vVTCLc6GfTES816yeGGlPCojTM
         OXzLttjE/CwMSJgTPdqO6k2ofWIwF6p2nN+Or+T6jJuGq7EVza4xW+nzhscvcBGB7C1r
         Y7gM4n490AElsBQeG+gjCr1Z5uuu3usB5BJYUR6JewQXvT/37qKVcMi2KwHiocqDTuTp
         QMug==
X-Forwarded-Encrypted: i=1; AKwUvBxw4uUMNAemAAi5HbkvFX0V9dTFF126jstjrQh3ASq5jJ3KfGmkgQUNXx9N5jOxN9UrT8l5nyGnEcBjuA==@vger.kernel.org
X-Gm-Message-State: AFuF++lFLXS58S3ob+1IYCIykGhUX4ODz1POHip9fO1oAsfhUVZJ6/2G
	GCUgO+jMJUPvrJClhaD9JO0WhWWOHB1TwDfKSshFAWuqD22+YDpGTIsj
X-Gm-Gg: AYBFou0UNH4FfRHvD65tOFDGh/pPd7EXzR/WUcG4mdNSnIdPzhNtflVsj/InK2IL4gN
	GpT9fYrxf08bWPOmjGrtX2i7Q77qYw0nKQdQhK1ozxg+LpMzFR82h5wPGP2YJlvFmb+rrRfMlKt
	pcpLvXFRteOl0D3TsMHdbUqdPClpz4nA98hODNu70xn6QYjdHFH8YzFdafaKpoJCwlPnpD/mWOC
	Oy5FcKVuU6sfhXgJ2AqKUA4A+Ashm038cXOv/T/ZBHd3jrJ4gYle//0SwTURS5m+5g4JUBhp9oH
	X/0k2Z3vxyPaAsldIRYUXHMuI/bq9GzLWhp/oIMWLASPHUjIKIb1uDTwci8jBBDCpkUjkeUNwEJ
	pNGfPf4boM8zbMe5lrfyroSEtujS+UpLLhjnVNLL8AwVAM46LHGR+wjCZQ/vyTI5/TRPuQ2mdEv
	W3mwg9pC2xxaJdmhKhoCUHdg4ka6IJL+UfQvKtf2duIb2c9I7S6e7esPclWXp7asycC9PZ8vwWs
	xs8esc/F4tmzdsoa6AGN1yv2iPZBYFlA7HMJKxhMY+kBHfDwM6Cdw==
X-Received: by 2002:a17:90b:1f86:b0:396:4cbf:45a2 with SMTP id 98e67ed59e1d1-396d0ff5bb9mr56582677a91.14.1788271643256;
        Tue, 01 Sep 2026 07:07:23 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d7bb9d7sm6433736a91.15.2026.09.01.07.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:07:22 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: tianchu.chen@linux.dev
Cc: broonie@kernel.org,
	baolin.wang@linux.alibaba.com,
	zhang.lyra@gmail.com,
	linux-sound@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: Re: [PATCH] ASoC: sprd: validate compress buffer sizes against fixed allocations
Date: Tue,  1 Sep 2026 23:07:07 +0900
Message-ID: <20260901140707.1516083-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <4386bc53631b052c1866a91061715b009d98b04f@linux.dev>
References: <4386bc53631b052c1866a91061715b009d98b04f@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Aug 31, 2026 at 03:13:36PM +0000, Tianchu Chen wrote:
> +	if (params->buffer.fragment_size > SPRD_COMPR_IRAM_BUF_SIZE ||
> +	    (u64)params->buffer.fragment_size * params->buffer.fragments >
> +	    SPRD_COMPR_AREA_BUF_SIZE)
> +		return -EINVAL;

I walked the copy path.  Stage 0 writes fragment_size in total and no
more, so '>' against the 32K data area is exact.  '>=' would reject the
32K the comment there calls usual.

Worth saying the overflow is reachable with the driver's own advertised
caps, not just a hostile value.  get_caps reports max_fragment_size 128K
and the core never enforces it.

Reviewed-by: HyeongJun An <sammiee5311@gmail.com>
