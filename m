Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794394767;
	b=26fzEg5POP8SSMpHgYSYGgd4YRLAXNPhRpOiKAlycvvAjxG5KDshS5actvcV3X8faCtc
	 9nAPqQBeObs8JVjT+FCM2Tw0qeUtTWPNxSBS39ffIFwQqjoY13i8N4gOXDCD8RK8r4z3g
	 woyAc2LXnxFqN7EHCGebBTRd6bs5aKq0SGMxaJ1mwqhwr+O8UEL23MYAZgq5DT86iYEFs
	 sfED2MhehUtHrIDNJNczItVbabJ0rAx//6dlB3Qe51vM5lUL85ywizUczq9hEZA81OzgQ
	 q+AlcJKtoZidQ2dQUrqoREhDmxC/y0wUOWamOUQuNdUmvgcGfaIg//VYZ2s4V07OBWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=oVpkRJVWW4wqxHumuNL99oRUdIe3CoafoVHbNJfURFFyXgwzOFTYnoGtBPy5Uv1jjslj
	 T0oG4/JYt6PdYo0FInq26EiPbTpXXc+tn+3ZnPuv85fV6J8PZbDoGQd5OTN8f3mOMgw9q
	 ZBnanTV0u8YgYdFneVKnm/kYn6DweswmkLhx2qamO1idw+SWIeBQY50L8l1tr6b3U//BV
	 rMqM79L3OsmHBPm4VB7Sr2qG15uVyXLBV3pXcNaCr5hT1AR+LuqoR6d2miPvs3f0ZZvZc
	 gwfDu/iLA7HuA1bayxtP07cbqGspJ1UYk9z08MDaXjqBngLu+VPMORom/5ZuUnIhyQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jzgJ50o2;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBE5606A326
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 10:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EBE5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jzgJ50o2
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so5963898eec.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794394766; x=1794999566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=jzgJ50o2ITwSxxgDaLwhe9bWux9JjZB0ky0fdJgTV8MPlZSI6BvT8RWM/D5Y2Cvrjw
         zTUcVE0qM8i6YiJ407eD9cbPC2rOAVeUgk2AwaMHcCSRh/Bi2twfEaG21xlovSMrSHmR
         BeqjPW3UYLWv0lWappN+SgtRs/yznVjY3y1Tbf1FF+360BGSoD+Jf8dVTKb9IuH16jeb
         srXj6/681BBaHaTA7jYQHg7SgwJYl7IqdcBWrGFq6FeSQKJqDcE0zbuS/C+DKYUw/2Kt
         ixZCSYxcTvMNrwlTeHU/OsLRoQ38o8EHJyiVhkDz3YNLgjV6ZLAursqaffEvur8+rI6n
         zLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794394766; x=1794999566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=CcM91ZY4gZkyTrYy9dMVh+pILRV8TV1gcEKHHnGXVtkLZmTHpdpX84IMMxvK6XjtBW
         ZDD4ocL0ybMwG0PX3Q1mFrAHJ3YetFNtE2hB91Mf9ncVVSq8Fh0aBO6Inv42YGt3kOUR
         B05hHAhqZQuZMQ/x/z+vxve22HTpH4ahMMjHjNaLSav2IDJQxjWPzjT454AB6Bh1o+bw
         x6RDZrVa4t3i7GZY+5mANQgIlKUkt7g15/MCvlIYlIL6MEk2bMgw/sbYeyYWuLHk2/bS
         9Twkzquy7L26Sp9WGwLcD2Lgj8qtPaM0po1TSHUbfVci7emWmeT1hCqLG8gF1vy+gDoY
         BY1Q==
X-Forwarded-Encrypted: i=1; AL+hErFO3jjTmA85VwyymCbXZZVOUYOaHhaa0VDpPJrQqLw/FaJWaFxgrXGrGFBj/MEBt/V7eP8G9t9P+xD2sg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+sP1etxrT19ImncmrdPStAv1KSgQrFOSyJN53ID4U/pAKZ38gP
	cTtwgM6qzYNSc8cvkbPfdpPG+y7VKpQE6v1QbwEXojz0Lxpb2DIZCPtIcOfe8abr
X-Gm-Gg: AYBFou00ndUq7wmEQT1WFP9FAD3yJn17tj2u2aT9Ft6JGoPewJqoAB7YuHQWd8Qwxd4
	GudpKFKG5HSSloj0c8xVQmNyFOQb/c8hOuF6NIOX4FgDU7agXOrVBT0XkzvmO7sazgF25Vv5l3T
	D+eNUz7MniFtvBHnK3NAv34094ob48p3zswu+rGiPD0m7QV/RV8rvHFIYTlKaHId9hJ2h2UJuhl
	rizyryP0MOaRPrtarRnZ6NwULwkqirLa1/pKpEWQyhkaXpiPfTc9oqH4JsJD4RszkMu7ojQD0pi
	qFIfX3RWmAqUvqLWb28EEpNK+62Vi+NOrv9fOMUDUFMCsiB2k1pxKFW/i9ySUgIfB4b5JUxPf4W
	8OUpBQrHZCL9ZSOkZ2FG7SAlEEVY8iyHICE8M16CHqK/BpRz6I6LBpVMMIiBUei4qDETvpFJON0
	oBBhXnIVvGHovM3/8DzJeRCtxN2EAwKtI1eUwwwegn9YSiLStoa+Vz+jTrF9mKJNZ39EtsrDPjl
	HF/mrA3jgdQFZo7tLHpIwfr6jXncy03CbNMjdmGd+nuCkgMP1qy1De3r4tKz+4/yoPOVQiYg29J
	drfnnxEi9esBbN6ZQf8ukaBQ7WAprLtoiokjuYpua5+eb3Zv4m4=
X-Received: by 2002:a05:693c:69d5:b0:36c:d1fe:84ce with SMTP id 5a478bee46e88-37686d34204mr3123191eec.33.1794394766119;
        Wed, 11 Nov 2026 02:59:26 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.70])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm15880508eec.7.2026.11.11.02.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:59:25 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH v3] ALSA: control: Validate element info in compat ioctl
Date: Wed, 11 Nov 2026 10:58:58 +0000
Message-ID: <20261111105858.2619-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87ld6zu4oa.wl-tiwai@suse.de>
References: <87ld6zu4oa.wl-tiwai@suse.de>
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
