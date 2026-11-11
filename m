Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794394645;
	b=HPhKHZb8odAa8PQ2TANwpax6+uMBeMcKbHlCILRu2lcSiP6/TBsT7JyhlDOZ1fY+dvgP
	 O8V7fbdlt+d7b27hxSnkVIjFL3UzWCSwNrOEoP7sevgdtBVyrvf8D7y9RAcUAMuj5+KI3
	 y7AuUf2eM7TZK2UeFzjzX79TfveEa50gAqsztxpu+Mbvfa3CSLrm3+p1hwvls4AyslaKs
	 x/Lb4TM9rPm+Fx4RsQ7xXjpDxOW3qevgrIVxFm+wlYILq94SaaNwUogJqrFEVi5sbd71A
	 n/GqvIvjJtd6pD+U4dzzIqpIaJutvBc5A4nZJrIFGDoZRe0ht2cQDlLGu2enzb0dBnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=IxzHMdq10JENRproiNmZxhZa7RbTc2Hdct7ndwx4DD/WHBMBFOd8ZHO43dtTMQW/mniG
	 WYjIhhA7LkIJHQB/4wn/1C2ZNg/de21ktTLFjU57/UvqOuHzk0wGHD7dF+7ENJqWXaOlY
	 lx9BgNJwSkeLTBFs+yF4AhZqM/YR7xKmzRh0LJKkVj4CDLQcegxYBYrQvklH2K3X6Nl7w
	 rUiicjIow+yfuFQTLIAIlZQLwzZAbmtk0OQbU+FoATfMt0H/pVA/SF3QXiuy4upFUPUix
	 0zYYuzUTQT5r34L8uSOz60bnvs2DAyn9xzwwLE0GC3CCNXHyIzR1N72Los+IvKwuB2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tWEcqNGe;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEC8606A327
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 10:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DEC8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tWEcqNGe
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1ae58d17cd9so2373518c88.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794394644; x=1794999444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=tWEcqNGetUUFbX9sbTlXI5m4t/N02Am5f+1T4kUl+PmkIpAeb6yQBIxYOWkBVUj56S
         x03CnRFFeZMhUqPhotD3GD97UsBGKlimDkNhf4mSj/1dD6G+pQxOIBKP6YAeD3TZivoy
         ut3p/eru4XvP1prMY0pZE663Q2T0EsgcKi/7I3zOLdm+3bijmp7W71rN9GuSgRJkKRRX
         0hwTdD6OorC+8ggZP84Q5yMvRYbuORXPUUN5b3q9HgwEejwWuAjaqyYh73KKzJrBkI7a
         9OSN5sWQyDPZFJpkvS8UQktpkn5W/e7D5UaZ3kjsl6BzMZOYgcJtIjh3uxqJWqiYnKNA
         541Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794394644; x=1794999444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=XvnxRHlIJLdJmqQIIBxRYKRBfc5KCrxpyBLtHqQClFdJOeMEgwjXYLD7jVc0qlWRmr
         WbnUp48My2e+xZ0FHBvw4OPWcF1WFZoUaJI3FihfAg3wPDtDOqr6edCdJAdnqhwomA4M
         Xptmv5e0k7e/k3lc9/fEL5UBVIiJmqPR+BVCeTDUkER0z0hNvPYZ/q8puNED5kb6UTsg
         umrPWAU2GbM61AaDe02d1gEkPNSX523yADkTcsORWAwVCNQieJUJZj8QzvIw2SS85WDG
         wYLqq/HcT0J/V50XpdIAjvVvdezqHUyiHKjm4BL+AKuos5yYTrWLuD/yHOBczOJFkRKo
         VriQ==
X-Forwarded-Encrypted: i=1; AL+hErHUby3Xo3TadJK4HXLhNaiDZH+mYXH/sSuLDLn5Vq5iNnlu/JgKepTxho6Mh+1/0HnD8ypu0lENlPrJDg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+rvsD3EH0Hntc/aDhFeyQpjJxZZskwtMULByG7A5gWO3AV5Ey8
	ZV3f2nXT6pCrgJz0dCahT7SwbgZ0XGf7aBJ7SplEnL/7gts5R1sjQ+5/
X-Gm-Gg: AYBFou1DwJ5EiWkOmTnon31pQlYzYVEaPT8KWFzenk1R22LZconhpOw/V+hBT4SRcWm
	XHle3h8A2E4bWlvM7m3JgwJ3r34t6Z6R4dS9WqgwZGBZxY1cuGz3thdfgFffewqcyG1M6+6RUsv
	2wabJYLoHovyxCJtd6iMWxE2ZGYqe7kX2IvC54L3EZQQ0dZEH6BxrhDZe1pDAcrjfibzx6EPizg
	xYmcwpJBQfzMgfuel3f0mkJ0uX69q+3iLhZjvG00UYR6BvQTsKOcdPnvNGXwnMi+oyrGz/4a1c4
	RX2G691Ti/J4FlDhf8MXuoUKgGaFYz+SLLJr2ux3ox3YK3X4PcD894ufoDvifdXExfWg+XfN0zA
	ehC4nXz2cessFHjO9D7V5FzMpY8XuNjtqMTBVBmmcBz7Lz0wA5gSwi9LEKV162tourw3P9G/ADB
	gVEN3u6RPErEoXJDegpLYygYEV3D9owtlZ5oDU9QVGuG3dOJnoAUFiJG5CvgYW4uQYYqH9JXabI
	e+ciAriDfKkagiSiL3oHPZq1GrPMl22+R6+o9uA7b3FuolTbcSkgNdZV3Ega+/yn4D+h5bUyADk
	PiNhfd0Xdn6SLyWC+BwP1+ITVtBj1hrRz5tzXqF0tFMhIZULB6k=
X-Received: by 2002:a05:701b:2905:b0:144:e535:3ef6 with SMTP id a92af1059eb24-1b3c036a32fmr1764521c88.41.1794394644232;
        Wed, 11 Nov 2026 02:57:24 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.70])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm15261710c88.9.2026.11.11.02.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:57:23 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH v5] ALSA: control: Fix parsing of numeric fields
Date: Wed, 11 Nov 2026 10:56:59 +0000
Message-ID: <20261111105659.2557-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <871p8tvv4z.wl-tiwai@suse.de>
References: <871p8tvv4z.wl-tiwai@suse.de>
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

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
