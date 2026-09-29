Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F75442135
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 15:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697504; cv=none; b=dOlOoBDw9INxG4u5JNWPureok/d4vmZBL/zEz9C6QSAsFyZGHCbeIr74yPwvnieYBVhkMJ81t8nMoXR53SpzDm/T6fbHeYC512xupBghgktgy/8ARrl+6h/A87ZY8T7K/o5Z4R48zgzqsmnx9lWmZdNdNsVwJN/rkJo464HhZ7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697504; c=relaxed/simple;
	bh=nR4yrTOIgVgspvjCPgKKmvkm5cZCrViKQN79fpTorck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQGnW1gJloY1pbEPWzCYCd0FU/AXn30hWIkU7mJXnNjDOnIfcA0B8cBMBKsmnsA0dS0wiaxjk/V4uiX4gdR/XetFrnigL6rVsvZc8wrwhbTt1JyxcmMuE1VznSPzjDwtDB4l+Gc5ApwR/WIWGUEHYlszufXuCYfHfbBLFHXB6so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=TGjFZgg5; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="TGjFZgg5"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso33281455e9.2
        for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 08:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790697499; x=1791302299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gf4CL38l7K7zHB2Jr75kV3VIF1+DE+Av3C/FhqhlLqk=;
        b=TGjFZgg5lUHeZxukRtGDBpWWXiPuev8gp7o7FIX6qFXoKC2EajqRD+/ExUDCSfZjoC
         i4OrZjFiZGSOtA6mpUM4f/v/zeZAXWCL3g41cedVNWBPRLuxv+9Dd+SWUiKp5re4pZfU
         jJ7hvCUY3S01HlnQisdD/KK+9JhEQayTnTWsXyOQs91JsZXPSkOOZZ2+4l+vktxu61vb
         8w/OE2ayTWQXiV2FZWNafA6HdPrYCAqgm4k0PQXdk1/Vwauf44GR+0YcnVQSOaFVxjpB
         d+/mHzpjlC5QOs1jyDU2SN5c6YrW8WpQYyg2fsMt9DDG51eS4rnjRbgfKV2Dql7KmKt4
         ocqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697499; x=1791302299;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gf4CL38l7K7zHB2Jr75kV3VIF1+DE+Av3C/FhqhlLqk=;
        b=Q1WjfEaIfV+5CQJVxfumHqADJXBtJe/I96l8baYGG5M8rY64NRkRAMxB5g8Zq86WKV
         laZ+W/8leD8PMTr0l9w9oQbT8eXmJT34N0eh3umYbaG+MXOelmpARhnM3W8KTYMQ9PgH
         RM/A3oH2LpDpgpJYucZ6OfsfvHWljIuhZmNZb57JFHjYVF8wnZfNPej7IXCQ/LMPQkR0
         nYhpwMjCeII5aJ+8zhlhQIlj7txp2aN7httdBBlEQp74uiWQTyesjW0MAgYxjibq8Wkq
         /69OES+3P9ryHr2nvleokY0vA1q1FDWAVxVbpxDXISCQ9gSRhmubt9sBSzElnzwJV0Fn
         ViIQ==
X-Forwarded-Encrypted: i=1; AKwUvByYR4WMPJQ5EKwftpWluwwU0o3FrfPiBFJpC63U4odLOmlEb1/5N2DkQzYfTNCILLNCbtCU8i21H7hSCw==@vger.kernel.org
X-Gm-Message-State: AFuF++lb8A4OlwOQ5YIsiy4gd4Dbm3WumWhhbZALCzh7G/9d3NbNi+WT
	/dTLBRLrqMvYxkVpxHh0huEfDc94dhMiJ0djoRUfvxajFKx3IcdmP1aOT/U/voKJ8/Y=
X-Gm-Gg: AYBFou14R64bGr8eqFUaUq+qZMgbUGULRf6xYhHfYgHVM2a9vxOn+Huej2T2gfc6mjE
	uyCjQN4Up48TDKO9iJjgOmoXFLG/iDUlNM0+aeaK9he52wB8jfBWplDCx63XJNsPXXzeisqoWC3
	1GbAoL8YN//ljbzfsrMb72Sl0U9GYnSgqsQiHsp6a3Jld2QTqqeRU6a+iyo63qHKxGyb41YmM5T
	N/F9ijxILLXJcHMXqCFny/q2c2zn56wudYeEFDAT1laQPIn8aN93eXRbCfuIPA4NuqqoVSULa2G
	n17gR4zV5gj3hliyatB5ysCY3Kh+JYzNXlp8najNTeYjUOWRMa9Eg2n0JVZdwHZ1mUVhnM2y/Xm
	acTCo/nXKFBi+x723JBu4u+I0V4BgfFjEZErd7n5eCeJcFBtawzUMGV1+hrcSGGYUO45F6ZoTzm
	YJMRjOTgs7igqlR42fjEI0JlNASYx0/H4tMXJiBCQ5x40JrWLvw5ohWFrIMlxKk3yW2jRUcEcY3
	0Gx
X-Received: by 2002:a05:600c:1d1c:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49fe66c9ae3mr284330975e9.3.1790697499193;
        Tue, 29 Sep 2026 08:58:19 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::5:5c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9dfdbsm127631095e9.1.2026.09.29.08.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:58:18 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:58:16 -0400
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
Subject: Re: [PATCH v3 06/40] mm: make map_kernel_pages_[prepare,complete]
 internal and unexported
Message-ID: <arvf-dEnIzsXhzkL@gourry-fedora-PF4VCD3F>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-6-4583d8a23bca@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-6-4583d8a23bca@kernel.org>

On Thu, Sep 17, 2026 at 05:22:15PM +0100, Lorenzo Stoakes (ARM) wrote:
> There's no reason to export the symbols for these functions which are only
> called from internal mm logic, additionally there's no reason for them to
> be declared in mm.h.
> 
> This patch therefore removes the exports and moves the declarations to
> mm/internal.h.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

