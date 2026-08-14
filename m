Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39A13B2D00
	for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 19:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786737055; cv=pass; b=bzFsTw4ec2V6umOTZrDOqoxhMrKj7tPSsHhzqcMqx/FjnV2o0+2LdBg5jBK7nQ7kK93nBK6BFOqtsAfMJs2L0BVY0dipv5GPZd6PLgHeX0iIWP7XOEZQbxrZvgWz4czJBq/zcMWFZ6zlemviY8LNNdsNiw1To5tomFsovCC/MfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786737055; c=relaxed/simple;
	bh=Jrd0fjqkKwjUuvXwMPL4xRhGf4w3usXC6PKzGA1FW28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XYteJKybe6o0Ht0gQ32fE/Yl8tdad9kRbaIcdCHNX5R1l4S9jUPZ4pMbyBnwjJnF4KqVvOjXkXamDobB2sfsUCGfBrgZjQ/6a7lZ/h4PQP3GMHhE5xCe6Ww4Tdb/p7Orp6dnZpMOr4uJRwCKY4hEYReDyeQ6svBEq9Mp9T2cb0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8hAyzMh; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8hAyzMh"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc61541f8cso32057975ad.0
        for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 12:50:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786737054; cv=none;
        d=google.com; s=arc-20260327;
        b=kMbPMrSZER7izH8LOcKRm2xvMzoEmWYcp16nW0o5UeX5ByAtqz8gwBgg4Dd7519a7Q
         BNj9bmSAUguuFhV4y2KB28z9R/EJYypv/CyXqxQ040+rTBiHgEBXVetqoTWPp+Uygh4d
         ooL8D2HWVMDMBcwrbuHAmpieXr3FYDUktNVff5/dul7w1bXjPrawJZ8X4R+NejeeEQwx
         Mb0cNfiPOhFwclNu3IH/Sl9rKw5Mp/oLz4NKvqKQA3Y557pW5sIT642N2CRAX7uECrjf
         RgiHSp1eNHpbLhuaWIuMgGKZf2WF3woqAviVqqyiC/RN6i4lc1gKCu3Z9LsHaM8IVeZ6
         SQ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=20QuREEYPrUoHZLa/Vm7IT8ZlPWhCCE4NmzHB0Ei2ro=;
        fh=PV1QNevnSoJIqjw3SSQobqKL488l35tgVeCa6MVaJqc=;
        b=DlHLGJgbG3Y/FNlarZtfQrGGNnAqsk18U1u7Vrr49NB6vyALvA2hj9gf4srV/E9E4x
         +OBJ8YcdTbgrrZV6Rm/VSu/Y5Sjt7NOH+ZqyfEfVNU9lYIE9o1UgDMKKP7XpelwasX14
         /EOrqF7LiVWW6eC8t8sdiRBB9XjYWKXGbF/zXaqn/SK4+Z5vb4AJArtR/wQSiFbfdpwl
         A/ImXveH6hSIAY//Hn+4KouQRvSdpdUXUpW+zp5VptNv2Zl0z6CWAMtonzp5jkD+SdFT
         TfrF8yYscNI5IHuSKtOfkzxynJEVqoxKXpMvdPyiVESsUxz9UcXdN5p+jz91H6jrAejx
         gfFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786737054; x=1787341854; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=20QuREEYPrUoHZLa/Vm7IT8ZlPWhCCE4NmzHB0Ei2ro=;
        b=j8hAyzMh9o2bm5p8R+Xr+AWtWUWOfp+6kmQ1TP9EpX35y/IQSi9LAobMFmgdUmsnEK
         hBRsf7OAdHg9LWnomyLn5Nb1qs7uTwNDNP/HGKvpkew4n+iN7wcUGShXsMgxGz3XzwGX
         oe/LDSHIZwCVnEovxSrJiobw1V2qtcrMMwzM3sqk+11OkwPxyXzHkPxNKPsvwnb7xObO
         5YOOEigEW30bfLpnd54LTc2P4xJAKT2/nzruNBNjRwL7eR2K/BBvVvLZAsa8SzlB26th
         pI+gugdsz6wbQdsdDsmePnlgEzuGVNnLXDVqYvWbm5vHcLy87XKCjMofWA7hmNqFyJXY
         jKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786737054; x=1787341854;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=20QuREEYPrUoHZLa/Vm7IT8ZlPWhCCE4NmzHB0Ei2ro=;
        b=EbJTVN9QXOc2xpHEeBGn3I6hzhBrUm9r3v2PCPrngXzWX9+oNSAu2KwJjK+x2fosiE
         baf+J2zd6aqi7oxRxorjxEmBp1f37/fBiJqOt+2yHADekZjH44mU6v/qyOPPZS8zHoKG
         DWSidaxAijbOtA6z9FXtMjKrJ5RLwRGbigNTNv7+sd8AkXtYUFEBLjJwW3U8/5Xt9KML
         b2QrVwIp32M0ZY0kvN2ANS53vXiKHd2DsW16SJZkN7HRHtIWJeVkhnVL2+nKQKwLbrJH
         K3mjNVsg0kusI4SUtwzo7wEd71jtkmRW0yDLA5ldR9ihwdIgJG/c2R/7YI//nWc5MaoN
         o6Ww==
X-Forwarded-Encrypted: i=1; AHgh+Ro6k3TG75aNZ8Y7gu3Wu/XcgzAh6v7emQcBnqyui98GdZoDkTIG52VjOapvbd6u0x5bN+wzLopwzoJw4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3DSltRRJ93pjroiLEJzhhFzScaBIczKiQTnY5vcpLrU08NuPq
	j+LezJxR3DOw6A/DDxq03+A9ydqaybyB+VKZry5eC6w9L8Spg5zGgDbDc4idd7ykTHZP5cNCrAG
	KB5JVgMfE3Pwvi4tExtAWCovL4LcrnD4=
X-Gm-Gg: AR+sD111jhdpPlPKTiVZtyTm/y2VNpfSwtI4YPv8ze3rz3QYdY1AF6adC1MIKvnzkgn
	bIaDzdeWdnfxBiD6eEbve7K5ZoI1BB3LqaxVcmGqMopKLPb5sEv6eHqDsGVa/x22y30LX8xghNN
	zkVETIYfcXjFCanzuKDy8bwtiRxKpQhqUCEhbj8o44uJL5Xrp8DLo10Y8Nhf5hc/vjhvxugFsOf
	MNH3fh2ent79a0JonRHu9SRy1Km8f3lzbd+v2zONMzj7Msxy2hnPxgFxq2RWk1/23rXHvGizVXS
	bLAkWzkWVTbgNGQFzLfel18EGnhGJRqg8edXoiLnJQCVWwU4PRNIukbGbMHkAGSd6gY83VqUB+s
	qtWfF3R4Uwg==
X-Received: by 2002:a17:902:f64e:b0:2cf:70d2:da7c with SMTP id
 d9443c01a7336-2d37f77fdfemr182703285ad.12.1786737053583; Fri, 14 Aug 2026
 12:50:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANd6bg+B_fZUpy4wwU8HyQMeo9-GKMEx2FPBem=-e4yr4eU1uw@mail.gmail.com>
 <945b889d-0e05-4f4c-a6ed-2d8172554d5c@sirena.org.uk>
In-Reply-To: <945b889d-0e05-4f4c-a6ed-2d8172554d5c@sirena.org.uk>
From: =?UTF-8?B?5p2O5YiZ6Imv?= <lizeliang.linux@gmail.com>
Date: Sat, 15 Aug 2026 03:50:42 +0800
X-Gm-Features: AcwNN1WFrEcpFEpRTRhWX9LIBVd5KoKj_7mwEFCJszn377qjqzzzddPDI_Z1XeI
Message-ID: <CANd6bg+GsxB_rrygVO4j7gkcGe0+PisJJkgv9uK10=VFWp3pNg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: tas2781: Add delay before block checksum retry to
 prevent deadlock
To: Mark Brown <broonie@kernel.org>
Cc: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, sen@ti.com, 
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Your mail software has mangled this patch so it's unusable - at least
> all the tabs have been replaced by spaces.  You might want to look at b4
> to send the patches, especially it's web submission endpoint which
> avoids having to configure mail:
>
>    https://b4.docs.kernel.org/en/latest/contributor/overview.html

Thank you for the guidance. My mail client indeed corrupted the tabs.
I will switch to the b4 tool and submit V2 via the web endpoint
shortly.

-- 
KISS == Keep it simple,stupid~:-)
http://lizeliang.org
