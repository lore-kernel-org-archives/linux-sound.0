Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E483BCD2B
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 16:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790267893; cv=none; b=Agg8tVgCrzWYxIPUW2qvQEZgKaMnjeFuyewgnXhMcitdg2xZhoqRl0e3MRaP86M3+XxtLM+I6mK1tZuc/Y1jCv/HizwLmvX3COQhWwvF6f6nTetm9Vq6n/ytRTKmw02aKjja3WQdUxW7X1tKjwnSzcjgb+WTPAz5GVOYpS/Yv/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790267893; c=relaxed/simple;
	bh=Y6dfgoDu9ENyHz35342iESy0PYqePxl/sIn9jSurkUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfaQxPSxHnwurn2FjhkxtjPAvAf4ikKoYBfifFUFvEXFuiMIgCtNaB6OPyQ+dSl5HuSQbLhmBFFN+x5Nw1WL3LAHZLOFcc8jI4SC4rBIvSgtTWq6/obp9wCTU219ebd6QZY5exH8m4oQkAyJgPW/ak6c9CcJjPsO843LgPEZiH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=DELaQ6H+; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="DELaQ6H+"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76543e2so141241cf.1
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 09:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790267891; x=1790872691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LuPrvXBzY5FQ+f/5fzbveR9yF272P1V2+jsIcGJNdC0=;
        b=DELaQ6H+GoqYKhSPbbw83I2UghjOPLUKt/HJzwYXOl5vd4By1b/ewKsZIbd9ahXhZb
         TJDLBT2drAnq8j1D4gtZjKdZE54vfhHIW07z7SMjyhNrpJZ88lIXL27llafwJKgt7Hvw
         zeqWn52o1fsiwmzoo4rrDQZv3h3IiFJnFO2iuBnkUsGA3ktjvtFHA3Jr6K2ZEcGMg8M1
         1di2ZTIAJ2yTB2V6zmlctv6zG6tcG5IvMF9RkWmI06r7tX+skZxDuVThBB0MSr3NZe3S
         B2+XxiOTA95Xk/3/+mlBZ2rpvQSIcAx9lD43yFxhcrOBvTesr5mE416XkZK5Fw1vsdLx
         5Q7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790267891; x=1790872691;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LuPrvXBzY5FQ+f/5fzbveR9yF272P1V2+jsIcGJNdC0=;
        b=RNQYUM8AfMPLiYOpazIW0zze4a6FZQstZPWGdx8yYvBCQXPIl395d4fjTLHhnX/Xln
         T8DrqVPO9ZQL6l/ohyj+/ZblhRpdTkqkM82NItDGo2OrGdGzLcYBqwpadQvzDeBcH+pB
         fLakASjX2fAhbQcqcGwLi9ErRiBGDh6I9Hhkk2vV2xjYm0eywv87flv93pybzXL6XnAx
         r2G7BRDKMIngiCGYthGX+2Pr843RMjvugDZlPglU1qKocl30tVE5eIE9xI6xcpIvChNA
         yKSmegNtfHJnMHfQfkR/DAdrVFHZiyfO9OhTj6Zla1qpyn8o9Hx3B/vpFFnRBtKOWhOM
         V8VA==
X-Forwarded-Encrypted: i=1; AKwUvBwRB1RnhNH1RZk71/tF9DvMq2ItvQpt6MMM870NJuS7uC2+9BpLjPo0BfAaasgr1tlWJ+/XP+E4+OGcHg==@vger.kernel.org
X-Gm-Message-State: AFuF++nUDIkanhdsx0L3x9qzgTZZtv/yKemYAczRhY3DOR9QLJfr8xgI
	lE/mQHp2BwDPeEIUV1faQDzvg6QdcAqBxRZxKuWFiBrovWX1umEaEvpo7CX/cT/B/70=
X-Gm-Gg: AYBFou0GB+hx8DK49FIUvJ/4bdn+qsJSweEOGNet3belLUJZ9IoUT3YKbBp89LAwri8
	gKy80FPgqvfCowkf/wNuHMF3/qSS18X4wMGIwdo/V5/dtWvfG8xjw4vJHz1BbkjHf1Zo1NXaklR
	GzhyfqjBStHikIR4X9W6L0Dtot7hQ3bBb5McQS1HPMdBNH4D8IaBiTm/zDrLtCKpnOkupUxvUED
	KtFIJDRL8vlSQhvNmgnn16A9HC5act+mn0Rcfq1M6hWWhu5XwlWJv2s4yqYU4Qu9KLyWeUUqFVu
	EK29oyK8whtWoGc9gRB06wdegL22BAFeTOqwTxaON8Xq0sEgz3MbSI0/hqyV5KvSzbbMDlRtbXb
	056HMq1eJ2Ik54vko1l9ZrMX/mAOBaBEjk7QJwlu2hlYPVQMBTPSrSqVUkyvanTl6iE/WIryXVf
	WhvZaSmFVC2IAk+BSRp2/5cpeQTN2bitM+v4X77yMz71F77ynD+HWSQ7JyZHbIlFMQ06S+jI/YU
	IjwNDAn8UqogtP112BEF9/7Sj3PHZhy/eB4uHvMecgiD9oFkKMyCpE=
X-Received: by 2002:ac8:5743:0:b0:530:d860:ffba with SMTP id d75a77b69052e-532fe9f05bamr29797891cf.6.1790267890993;
        Thu, 24 Sep 2026 09:38:10 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb32f6aasm45064551cf.16.2026.09.24.09.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:38:10 -0700 (PDT)
Date: Thu, 24 Sep 2026 12:38:08 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, 
	bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 03/40] mm/vma: introduce and use
 vma_[flags_]can_merge()
Message-ID: <arVRqJZkql6sGunt@gourry-fedora-PF4VCD3F>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-3-4583d8a23bca@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-3-4583d8a23bca@kernel.org>

On Thu, Sep 17, 2026 at 05:22:12PM +0100, Lorenzo Stoakes (ARM) wrote:
> Replace the open-coded VMA_SPECIAL_FLAGS check in the VMA merge logic with
> two new functions vma_flags_can_merge() and vma_can_merge() and update the
> merge logic to use the former.
> 
> This abstracts the check and expresses it in terms of the desired behaviour
> rather than an arbitrary and confusing VMA flag.
> 
> This also lays the groundwork for making further improvements in VMA flag
> usage.
> 
> Also update the userland VMA tests to reflect the change.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

