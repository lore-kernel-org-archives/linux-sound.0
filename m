Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B5D3A75B5
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 08:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777449648; cv=none; b=Vq/jMRcGSkR/iUrXt2xW9+EF4UM0KVNYNmM71MM/uSTc/OSoWVAJ4CffrQY8MbFdJ01ZC42B4n/RBQhGVsZvH9b0ph7Ibv5Ov7FLZ/vS3SKLFHr4+5WFz/WDWIYzUv5RtRD1blppeY2tV43WsxS2mZQBwFDQmkZ3mM7ViJ/5LSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777449648; c=relaxed/simple;
	bh=jUfv7BY18i0hzz1iwaD/eeJ7LRQt53qdiERx2ReGrsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g2oHXO/slLr1nj/Iqe2qQCxIBKLI7VMuwjDR386/NCRx6VqjbzHyKjd0fav3lxwP2OxJmuC327UrVfjmmwTcZOYzNY2dJuJNhjx9vRV3/ITbpeVy7wp2ce46+OAXFcAYR4srdAaJw4yNyzWayIGHe+geUlA/MrfF3P6fEzFbdRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UtJa0cOJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UtJa0cOJ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d7828221bso619211f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 01:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777449646; x=1778054446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sKt07qcPF1NidEM1dAs7s4kLamhrOjHwcNAU0l78/qI=;
        b=UtJa0cOJ2Ik+0qnbSPe4O4cQakHmMhkItx+4s9ze5KogBaWHBGCr3JoawwPTy4Hr+o
         OB/XHMKOdUenA/X7fvMpfos/E6HQiOKtKt4oefQ2kDl9oBu8hv8ZE4Wuw/Zfhv6rc0C0
         J2QO7kjSssKqGhCqD6iQhV2wQNGp0xmwOhcKhBDYQOb0ML89QSI3WsJjvX2+ZX818dos
         ry2TyQVwTC4xlTkqHrrEBKj+RvRwdCOaLks2dmtFPoqzc8e2wJggeOh3V0pLiT3IH4BU
         PvxTVMpscT1CLsem8eCukS3Ny8wl7xO1WClUgsql0Txktgo+GOmjGCtz+WVvpazhGvwS
         MvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777449646; x=1778054446;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKt07qcPF1NidEM1dAs7s4kLamhrOjHwcNAU0l78/qI=;
        b=hZhdqmmLppQg6RAQXTWJ1rc+QkM3b54HtyhQ3mdY8U/rbImw0jh+jtRi8VK30XPIuj
         EPsmLNp40GL7yXDTr0pGn2T4v31l2SUPCSl2lJpPoeA6eToS1gjCq5lubwx65rBOLSa/
         jwmGJSU8EYciwXnl9foulXWdZVx4GG1QrYYMu/YOFoQvHLAZQrG9AKimxNHUMgrosxC1
         bJ4TeiecRlI53PKYnMJOTmAJ5teMDLZrJHd/dKyq1dBkw5NL8Fi/zyYEXwBXPSADpFJm
         0/iOPAG0hGc2s0/0NN6Hf3cWyisywcMSgE1zmWPIll+NX9lm+3I5XCw2XEa4SouhQf+2
         bEQA==
X-Forwarded-Encrypted: i=1; AFNElJ8zHK6vFQRm3UnHAUhjzpmHrvwlk1yI7jd+yGRudEi939jkhcV8W5KC9+IVX7nfG5AvyOCK6ZVQarNEgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQlnRrfTCjyFAQyiIwwkxUdq5U6DlIvSru8ytluX7gWyyVqzV6
	QNT0W0JLcZKND2DJVj3KJEWMwL3YaHISo9lqVEE0zyoSCiIbdKGlJpmEoxxO6sKbcbo=
X-Gm-Gg: AeBDieszSwTSEfCShPqdldLFbrtjpVJvBq4u/NA4E0GpVEbBgy3MupbrThcgrrFjxHu
	sHu6bJJo5kmH44HGjou1SG6vg3VJJA3JbOVgSKzX4ywAkPY2d6cUMTZSFc+0/QELjVaA5d2lyL+
	veSVqrq07VBeMyR8ntqFKtQMbOwq8wTgI/adBqvxAZEEE7sV9zE9Ooqs7QADlwpooZX5aWj3vQG
	JZsrd1qui6n17xiqkOvxm870iwHJ8XPxn5bkl2uhP74Jxo2LEfkK4YCskUx0qZZQvufNcxMbvYQ
	SZpo2eSHhz70+Z9K6gfMjsQyXJvmrIBLbJ3Za5NCjVI43JPq173c6x0Qgm3xJNBlUzMkEQyXt04
	ht0yIeeWlPmUXnP6IQdbzNevwkYEpHGgtBrkDHciUTbKo4Yp8MbysjB80Joc1Le1TdqyutS2CuP
	r3CKHIXw1GrPvDTo1xrzAk74eMma49ShvPFx0OMUdBvhrU33JHG/WDj6jMfBkX3Hgv3GSy
X-Received: by 2002:a05:600c:3acd:b0:489:e696:127d with SMTP id 5b1f17b1804b1-48a76f82973mr58572165e9.5.1777449641184;
        Wed, 29 Apr 2026 01:00:41 -0700 (PDT)
Received: from ?IPV6:2001:1a48:8:903:1ed6:4f73:ce38:f9d4? ([2001:1a48:8:903:1ed6:4f73:ce38:f9d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c303c3bsm18098475e9.7.2026.04.29.01.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 01:00:40 -0700 (PDT)
Message-ID: <78978a11-8345-4b84-bef7-90d17f4c581c@suse.com>
Date: Wed, 29 Apr 2026 10:00:38 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] Documentation: adopt new coding style of
 type-aware kmalloc-family
Content-Language: en-US
To: Manuel Ebner <manuelebner@mailbox.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org
References: <20260429070759.309110-3-manuelebner@mailbox.org>
 <20260429071445.309733-2-manuelebner@mailbox.org>
From: Vlastimil Babka <vbabka@suse.com>
In-Reply-To: <20260429071445.309733-2-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/29/26 09:14, Manuel Ebner wrote:
> Update the documentation to reflect new type-aware kmalloc-family as
> suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj()
> and family")
> 
> ptr = kmalloc(sizeof(*ptr), gfp);
>  -> ptr = kmalloc_obj(*ptr);
> ptr = kmalloc(sizeof(struct some_obj_name), gfp);
>  -> ptr = kmalloc_obj(*ptr);
> ptr = kzalloc(sizeof(*ptr), gfp);
>  -> ptr = kzalloc_obj(*ptr);
> ptr = kmalloc_array(count, sizeof(*ptr), gfp);
>  -> ptr = kmalloc_objs(*ptr, count);
> ptr = kcalloc(count, sizeof(*ptr), gfp);
>  -> ptr = kzalloc_objs(*ptr, count);
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>


