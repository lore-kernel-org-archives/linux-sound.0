Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513214;
	b=lZHr0tFI0yOyydjwQUyw7jQEyfgT3qyf8K++nCcHIdP7q6GBnDM4HbT9mQAkc6Lq2yjf
	 Fg4i1ZsitMPTmAGBTk7eDmwAvKMMfaYiGN8IkHoxqj89gXYiKWxFnYiAsXcF+VfW09BX4
	 NnrvQJEnUzSmjyYKls4NpfZELwv6F7gqcLmu7MtCKd4yd299J3dJQSeCOEwDeAraLWvQs
	 MSLxVeEiNnoN7uWzHvor7+21Y4M/pm/c5n7EYti1QuNz8vqdBFNFbHUUU1/XhDEGkpB/Z
	 q/+jAefuupwsmZCzxN4Hjo7zmTk8tUC1qLaJGB6vpsWY4msQlOD8fPsPWccsNulgQaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s6J8UzkbLV15LGL0oLAQJk9/vn7+grYl4GUZDfRGgJE=;
	b=lRhLiJbx1WA1nEbTv9lNnabFyDCr75PQ2YCyaHKobfHShj/UYp23yJvQ6M04m7DTXUSw
	 4Tk/eT/A57+gCMZzFiUIJg/EG3CFadEVsTs3VVQZPoEgzD3t0R6Q0q65O7zi3uVk695K4
	 c7urTufYPWctRXd2d7O6trtgWXVGYIUoMyQYS5QIcRBJSozKaMitQXTRTAc/MPoewl9vV
	 tk/a5juVoYCALPSOz5tcNcY7dMRZoViLPs8jL+w5ZM/xfo5+dzfCgNKwLK4/bQSV00bzm
	 9MJLghqWEXKOgr91TLgeb9u8wqYLfR536tKaCWYAoqiFyLYGF95aILMW0gW8FMk7CGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eWGKozKA;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83638606A69F
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 09:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83638606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eWGKozKA
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-170135e43c7so6244793c88.0
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 01:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795513206; x=1796118006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s6J8UzkbLV15LGL0oLAQJk9/vn7+grYl4GUZDfRGgJE=;
        b=eWGKozKANII+Rz9RAMODyX02fxfRFZDdMm+qH7cLm86ZlqKniPTp6Xgy9L+Liz+VMH
         yxlJ3EZP14Th7dP8mickQ9yfnLqxmFAKwnARWEav0gs0chRlQyyir77roVD2FxCMMnqY
         7iZpy7G6Y198ny1E7wPkdDmjC2WLOBuUoSc7zGKaZhluL2RIaQJFa27OVXjnrSb2Ya3D
         jgmNxMoxisj3XqgJONGXOdpXUKcAaxxNQ+uI6tqXMpsEtLG/xTIPFW6/pTvC/Th7JsBf
         DdK/uKFCjaskI8/sfGm+5+aDUHnFdBdsppn4HZKgIV1pO2SsvTRWX2S1iVb1OQuenbU5
         bI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513206; x=1796118006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s6J8UzkbLV15LGL0oLAQJk9/vn7+grYl4GUZDfRGgJE=;
        b=SLhpwisl339NyqBFxTMRD/RTQftviV7f7BrSnnSvmJ6O4JBYmVvfwMmWd2TkFAYncF
         R47aPkUpCJW7M8VGcHLGlI40I7oUl9TE+vy8Kv0vtfmzWVm4N5O3rHMCEAgVBYvF3FMZ
         4CNcFtjtlGr+DHN+96MFLvViZA9tx/GGWnpDzTb0EndfU+OVrSHiN9TLIOTkReybhUBd
         gGRWJnQxLzrvJJK4epSuV/misicJr5Em0sL6bWsOJxaCOrZqYjIghbK4Ah8V9Hu5+mc3
         lGAvU9XymUaeSuwQkO+vPJCWXZuTTzQsiHywGPPi1F53dDUsu5yxp7Mb2x7TNWzWovSq
         39/A==
X-Forwarded-Encrypted: i=1; AL+hErF+jzqsLKD7zS5g/LFzYrwhEO7HzzSfiP1BhVE5xV10P5j121d7cKMI6rViu7U0BDgNONePKukd9X2OkA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/JUlNIZCtkpYcOneAHW+Fnjzn84M/S/S8RMdkJnHf6bZV6BLa3
	qtyuA3bqzguN7JEJT1hPEYRg5adY/a4csEbfZZ+hsRv01d0KTcJIFNnk
X-Gm-Gg: AZFdTZdH8o8G4gWVNCHTjO5JZ5cT8yTRWKz6+pW46geESjwE3OxWy+xWGPDKZmPZQB+
	H/ZQfxUGRe/nSTAGjkTXu8iGXrwzvMvqX8FIT1W8DrFdao41j3/Ekx/uH/TIHs/82wPBBKhd/x6
	ThWlrNMcGQmTEV6ZSv7BDjEoANRDs8KcBfyHgv8tNQF5CwcGr4pU2eCDXuMaQwkDSA2rT5rojK/
	D0EcXclSwdqgYh+U119fF3LD2luXilJ9IS2mj45zN1c8cl6U0Y8pIWc8OJKgSXd0f95LixsiCN8
	eIr92My6UFoRtP6mroJHm31Yy8/XCERZqib/e2fqM/b3KnviEbuX82KrlV3mjn2abjFZq5UMXd2
	I/U/sOaPt6f61/Cd5DynrlL6M9RlRxEgeH/lzdiYNiKt4mLwRfWkXlfz96pAAWfGcBtlBqaU3db
	FUujmR4qjxjkb2sNKl7AL+FQjX9YeVrOfRxqx+KU/fmDf64WW+IcKRX27P/33x1BjqQLFWObo1M
	yHcVTB9UVuUhFoJ81m2cDsJurFXFMBoUC81GJwER/p2j+1DHay6A2ewFn5HiRowQmxrog2Y3eho
	44Gi6AfxMFPmWDpVD25z+rogzzQH/onLu0PoOLrnJ6YPwXYcYaBA
X-Received: by 2002:a05:7022:294:10b0:19a:bbe8:41a8 with SMTP id a92af1059eb24-1b5568c876dmr14069138c88.20.1795513205570;
        Tue, 24 Nov 2026 01:40:05 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.105])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm33847116c88.1.2026.11.24.01.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:40:05 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: xuhx@hust.edu.cn
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: sound: core: jack kcontrol is published before jack_kctl allocation, and the failure path frees it without removing it from card->controls (null-ptr-deref)
Date: Tue, 24 Nov 2026 09:39:42 +0000
Message-ID: <20261124093942.2963-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <28bb004a.2ad18.1a2023a6d95.Coremail.xuhx@hust.edu.cn>
References: <28bb004a.2ad18.1a2023a6d95.Coremail.xuhx@hust.edu.cn>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hanxiang,

Thanks for the detailed report and the KASAN reproducer.

> The same failure-rollback bug has a deterministic companion path:
> snd_jack_new() can fail after snd_ctl_add() has already published the
> kcontrol (for example, when its subsequent kstrdup() of the jack id
> fails), and it also does not undo the publication.

The companion failure path in snd_jack_new() was already fixed by my upstream commit:

commit ebce20196346906cfa33a84a021ce8f9bd91880c
ALSA: jack: Fix jack control cleanup on error paths

https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?id=ebce20196346906cfa33a84a021ce8f9bd91880c

The patch initializes jack_kctl->list and routes the failure paths in snd_jack_new() through common
cleanup, ensuring that the previously created kcontrol is removed using snd_ctl_remove().

Could you check whether your reproducer still triggers the issue with this commit applied?

Thanks for reporting this.

Regards,
Sreeraj
