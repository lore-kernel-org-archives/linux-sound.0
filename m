Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262112594AD;
	Sun, 29 Dec 2024 09:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735462952; cv=none; b=kWvdcZ4KOC/1EVYalvF+cczwHLnTaLpACgwyGQLVCPVPThZo7iflVnzKhMVA4wxqpy3/cFnFOISHSo0nxcf7MStC59Yy4M55+VzbZ8ql2JjtA5TNVB9g5dFnuIxxUqTQpwGMb5fSPCi1v8ZT8gjSfytvnvT9H4GuN9vZAeP/J5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735462952; c=relaxed/simple;
	bh=qGQ17v88ArQaZtJqkfxjB5R+5zjg8kABbg3aoQNaHpI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jfbXMSgNd86YpTkPtaYRpeZDFe5yGmNRYrlXsK83mH8uu+1AjUlKQZpml00O92KyhGPFHWJFCEUFHpHU/qayDO7gtyjBs4ENcq5Y9MfZ4IV6cimguELa72HxmYwAZ4yjqRLwpxiZz5N+oNzwsdsJnzFhu4e94YilI9EyP1CZts8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hlcU/rUl; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hlcU/rUl"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43634b570c1so60226855e9.0;
        Sun, 29 Dec 2024 01:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735462949; x=1736067749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJo+4hEkig7xYden08+xkjckSGWgXyHMeRUlvi18oZw=;
        b=hlcU/rUlhVcO9HtXvV6rkXnj/j3adFHqJDqTzOja8blEXcOb6F4iuDPTzZs5DLPqFT
         sjbzzs/4U6EdmlR+Pq0yd6ocvailANwMFXnjAAEauRFMJXsRggtruFKm3BBQ/hbozoXH
         VIfpKsA2wXYRh91Wgf8Hr+AwE21lMbG2o9JKPNt9wYcV4GHQBjFL29EX4O/t//D3XHza
         ck3FzWCwmewG5qh4krvz7GcYcAQ2BQDgWVsBLn9NJ1L0cqd/bRD6jn1kNBREvoj7/KNd
         //2zWwr9kIcp75xp7775xeb9sIU4O6YQ2PsVqS5v5l1JaP2XxKVePWrs8XDgYalK9g5E
         5FDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735462949; x=1736067749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJo+4hEkig7xYden08+xkjckSGWgXyHMeRUlvi18oZw=;
        b=Qod+/FKvwgPZeomcB9jmr6sEe8UkdkOmfskDwcAphEzzZvTgdV5jvMQ0KezXYFfv2o
         3Tcp65+Qxe4aTUogNfGkWf7E53LDZ/LEgWf2nNogaummC5CzMuYuR9DAKRRfH3A/yjSo
         Tv8Rawk8CcCPJaGOqBnj8UQW/LkCVPupMrA/0jIZzihB2/Kw08/XT7VzdDj21zKIQy4d
         6/2uUdH3jfLXTd86P0FSrt7KdMNhPKf1fGeoFP7e8l8Upu1Hoa2paMtTWN3mAAGdxk05
         1gOHK7x+Cms8fLNNrlZ7SUnQzEJA43boykQBjtKhG9fTAWTKFX4TwpQ4ut6a4Oa052yd
         hgig==
X-Forwarded-Encrypted: i=1; AJvYcCVb7bmsY/11kVqog0JyY3VUrZkTVH5hHF3M6GNa4k/2VdYQrn8H3S5lPOck0FYD9E6iQtEvlEH6wKDAqBA=@vger.kernel.org, AJvYcCVm9jugnQ75zcCmSMGQJaKBYgWF1SpXXuURsajldIT0uhW2b0fP04B4wyQ275PYw2cpkHnvdfIzctXIPEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YylQI4Ewdl3kUuCj0QE+JMjJTvS49gwePjiswuH1ZglnrjqibLL
	t4Pfb2g7Bl4D7D0SYD53dvUuFoTojlaYnPwP03zO+8wGbAY5f2/O
X-Gm-Gg: ASbGncvTvQBowx0hsuZft/h729Nz5MXFbSs64KXUQA/BwM2Br6PX9B1oLVGspTjjLy4
	/jGAC6uEXxJriLA8KmF5/7jgbHaPRBvC28cbcZdMoMmzfQb1EKiQG0ccqMBYYrqMGSquDna65wj
	zwY3KMWgui1S6c6w7oBGqiyO/Va3eK/uIhHshwGyerDudcHoLuUUFXqs7rPlt4TUA5gIjo7CHyI
	jRsUr+T4mo+kKQxTrtrywvWMS6k4l6NiCGxriIqLkvnJc0WWXjWvEYjNP2xnnJFiR9i+hXJHOW7
	5Nkb6dOXOtdauBOumMMzZkc=
X-Google-Smtp-Source: AGHT+IG5oK0rKRdwDb5NSQ8QOJDHSBhnZYAmkonggAhQR7uz8cYihM2UhK9KfgKvgzRIZRFio3JmWQ==
X-Received: by 2002:a05:600c:46ce:b0:434:fdbc:5ce5 with SMTP id 5b1f17b1804b1-43668b78d1fmr256561255e9.29.1735462949361;
        Sun, 29 Dec 2024 01:02:29 -0800 (PST)
Received: from dsl-u17-10 (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436840b35b5sm172586545e9.39.2024.12.29.01.02.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Dec 2024 01:02:28 -0800 (PST)
Date: Sun, 29 Dec 2024 09:02:28 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: "wychay@ctl.creative.com" <wychay@ctl.creative.com>,
 "ryan_richards@creativelabs.com" <ryan_richards@creativelabs.com>,
 "tiwai@suse.de" <tiwai@suse.de>, "linux-sound@vger.kernel.org"
 <linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: sound/pci/ctxfi/ctdaio.c: duplicate function removal question
Message-ID: <20241229090228.75f8a3ba@dsl-u17-10>
In-Reply-To: <NyKCr2VHK_xCQDwNxFKKx2LVd2d_AC2f2j4eAvnD9uRPtb50i2AruCLOp6mHxsGiyYJ0Tgd3Z50Oy1JTi5gPhjd2WQM2skrv7asp3fLl8HU=@ethancedwards.com>
References: <NyKCr2VHK_xCQDwNxFKKx2LVd2d_AC2f2j4eAvnD9uRPtb50i2AruCLOp6mHxsGiyYJ0Tgd3Z50Oy1JTi5gPhjd2WQM2skrv7asp3fLl8HU=@ethancedwards.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 24 Dec 2024 23:16:17 +0000
Ethan Carter Edwards <ethan@ethancedwards.com> wrote:

> Hello all,
> 
> First of all, happy holidays. 
> 
> I was browsing the ctdaio.c code and I noticed a lot of 
> duplicate code and functions, specifically:
> 
> dao_set_{right,left}_input and
> dao_clear_{right,left}_input functions.
> 
> The functions are pretty much identical. They only 
> differ in the side (left, right). What was the original
> idea in doing this? Wouldn't it make more since to just
> have an ENUM (left, right) as an argument that would 
> determine the side and just reduce the function to 
> dao_set_input and dao_clear_input.

Hmmm... you'd have a lot of conditionals inside the function.

They also look like a memory leak just waiting to happen.
I guess that an earlier implementation used a separate kmalloc()
for each imappers[].

Why is imappers[] an array of pointers not an array of the items?
Each is just 8 bytes plus a 'list_head' (2 pointers?).

	David

> 
> I would be more than happy to send in a patch doing
> these changes, but before I did I wanted to ask if
> there was a reason the code was written in this way.
> I am pretty new to kernel development.
> 
> Thanks,
> Ethan
> --
> Ethan Carter Edwards
> CompTIA A+, Security+, and ISC2 (CC)
> Ham Radio: AE4CE
> Website: https://ethancedwards.com
> 
> 

