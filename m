Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9BD38E8A1
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 19:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784575984; cv=pass; b=BxsKZY2Lt7hLjzEnRMq8HzzlnNPJRvWUNnXR9NLKK80Q+G7ZX6e5UlXknZ0erZmJSNOchnuDPNAqm+NYj6wXJKVBipiCoU2hWESSQNDfAKbZODeLe4MdktYtGJ2CPfgJpwDZvi0O7/z79IwGKlLTsyTrzbb7pRzbSAlels7Wl90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784575984; c=relaxed/simple;
	bh=dNSBAb8XyKhiLO0nuR6CCRPuSh7CaeUeyVr80M08pP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OJWCFQzymy/1wLFQpqVE/iZQKe+ynD7FoBSj7QNnaFjnn/Otpbxg463ADzva/8KsRuIPF6U1il+MhJ7HVHm3WACE1RN22oIXZ2yHuZjlgnLxlIXeiOBmCMJ6wylzS0U74++tFkMKNqDn00I/KDfdnIq9k2pZAW2hGjUyEW6LRF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DOM3ngNF; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DOM3ngNF"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-664c6304683so5980712d50.2
        for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 12:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784575982; cv=none;
        d=google.com; s=arc-20260327;
        b=Z/QO/qq1DsXOpxi7/lfU19RHKKbbgzVzIu1aGlUXEDi6NWccZBxDcWLY3gAeCMT688
         n2QegXuEctYNdgVozGEi7g6FmZlEEs0/0iHqJ4VlBjQPusBvQf1i+oi0T0oOPdJYSVnp
         QQZ92OkQgtc9iUtCs1NaRK4MpDeXWdlhekA4+wDqqKaLplDXWK1rd2l+BwBezN45ggrR
         oTK9e2hUzYcCwODz96d+hfmJ9vqInXoNXcRTB0rnzAFBp3/N9GSclMppWC6LLlB7CVRS
         2Y4PbuYLMIFYWUzUU8k2C1Q9afpKS5jqmFj8hoJ5buvqzkW6SnzKYD8JE9QOQgAlwJS/
         2LWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HA0LCRPit061rcPUHtfmiZ0quvjP+0qqUiR8ovXvpJI=;
        fh=QRCM1Tt1ODhRN2GRxYjdgDTlx9s2SYzyJjM8y1F1M1w=;
        b=TPXXHTpWLLMUPPSMbkewoWJT0wqpdP2/Yau3fWZZSO1SZlJ0RZlctwl+Nf2LLvU2xS
         QSs3k0IMnGSRhTQUCm6n2Ta2YKi9ZyeAGlQ8IRRF+AJtyCvlHrnS2r9TdV/LMeSlii4g
         XZMVRVxi3Tvj6rKFjRKom4KQMz1K0otU3Un6P81MFaDzAdKXiHDc4NtVRhkls4dYqcWN
         wW5dLlBcLBUnbW2M2FfnaVVCByTY6zsxKbHSjgULVNs2ckOS7AwGdW6KWdFNPfknCVq0
         2whXZmoC2FkxOdwNg7xIX//lf9qHgiazQdakEDxthrrEq6RbWmmxOrl+rdlD8uIcVplG
         zc7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784575982; x=1785180782; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HA0LCRPit061rcPUHtfmiZ0quvjP+0qqUiR8ovXvpJI=;
        b=DOM3ngNFPxfXB2AzaM0yqVOdxTCzVCsKCJx0VSq1l6HTU5iFVCoFHNv22+SVOakY+l
         aqOL/6eDmwcaKQiLRufnV4knZLKc1YyPzw6U+2ykMfGghuaLNdKDDST+nqcoMLf5hw4E
         KJ5amTLhhgAsPWc7tYKoYFDLvG4+cacvsnoX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784575982; x=1785180782;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HA0LCRPit061rcPUHtfmiZ0quvjP+0qqUiR8ovXvpJI=;
        b=pZRw3zA/07DvN7kbyr3yS7bT5LxZ1RxdJqCZ4seKkicuXacWNX2+qJjh8Jq+fN0bf+
         nZAx765mA6KJtCffOdT5QaNC1KwAHlIaHjxUp/24sWGZgZS9EwUEqeLvAkxpPUbgab9g
         PYfWe+A1AJbv6EMcSajDjcYb16pnblIWFBXG2VRDYKO/4GKUMeTw9DUw0R8sYRSAtQb5
         RY95QHeto+KXYb7Dm4hjPYt7TrjKpXZHhfE0Z0dHTNufs3R+iPBbvzL4Ra1o0OeNOeZB
         s5bFjH+h568gao5/B9yNBL0ilXpSH+do/popopenBbvYz0czjZ2cpXvMHU8UehbyGaa6
         Zb4Q==
X-Forwarded-Encrypted: i=1; AHgh+RqFeBAN+KhG7AhIgYsIpnZyuCMU3wkSm3lgfeIY1rvNA/GIuRFic8VdnDY9OaUZiXudTpUGdFzcPFozBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBQs02qTf8l/Z6lhWToearRj3fBPAghlNCWzfVg3PqNRzeP7Su
	UGD4bY8WSagR1Bnh/XB/axlhCMxiox7Gm7gJTrW/3GQJCJ1raDsyYIQldnXz55IBL+XAU+PpZKs
	dnjI9Pn8oVgKmcPJC7UkQDjUjI/JxeMt0oWX1UosE
X-Gm-Gg: AR+sD12e6Jucxj4TM/FYjWyZXroMAdYCgXDE9gpWWW2Ws+IpTjJp1kijCXJ+t0CLn3l
	TK+MduCq4CezmIi/qsuTQH6bNbayHAAW0KH6z/GtDGpN81esEyHvcd5K4oXeWHBoui6LiOxxp3n
	ufmyKHaK66I/WAAPK0YsQ0U44wq0Uvr160SxZNaeBzE3McoxkuvKxtuzw1vEQnYolHe0rZ+0hrt
	9/XUW1RkKSwlFC4hAzhiL8Q7/VUlLZboyQey1E/KVzGjV5BBU7G72KYbMYAES4=
X-Received: by 2002:a05:690e:1c1b:b0:667:ba32:4612 with SMTP id
 956f58d0204a3-6683bbe7e2dmr3844826d50.46.1784575982339; Mon, 20 Jul 2026
 12:33:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718-fix-headphone-plug-cirrus-dell-v2-1-f88121570d62@chromium.org>
 <87h5lvs8zu.wl-tiwai@suse.de>
In-Reply-To: <87h5lvs8zu.wl-tiwai@suse.de>
From: Steven Kendall <skend@chromium.org>
Date: Mon, 20 Jul 2026 15:32:51 -0400
X-Gm-Features: AUfX_mwILK-aUna92LTQ3LU8ZnzLkjirveUmPV-MzUiYs-fix-_dYjgm4VLLSeY
Message-ID: <CAB1bpFDu7iXmo-uzhZ-LGg6XQ2GHJ0gqMX=ZiL43OOcRdUCrPA@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda/cs8409: Fix for Dell Cirrus audio jack detect
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > - I'm now using the latest release of b4. Hopefully this addresses the formatting issues I was having!
>
> Hmm, not really.  You've put the foreword separated with '---' again,
> hence git-am picks up only the foreword, not the actual patch
> description.  In general, there is no foreword in the patch.  And,
> your foreword texts are obviously a part of the patch description, so
> don't use foreword at all.

Ok, I'll see if I can figure out what's going on and then submit a
patch to b4 if appropriate. I've just been following the workflow
recommended on https://b4.docs.kernel.org/en/latest/ which I think
used to work well for me. Apologies for the formatting problems.
