Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795264350;
	b=MWS4CITipOLrt6BlNicquofuWxm4XiOWJ1l9wToK1yxqRAMAqMZXa6y7+6OfsSfv4WOA
	 1pLmeTwgi54RqQDVSwZ1np7h/EsAxmPrlJqSpbqOsoKkCwZEqMqZsHt7+VVQ9xc8n3qwy
	 rx4au461HcYNTTIHGRdp0m8ZYvuukZ3A+gxj52R7zRcU9JYRdtDZu53aE5lrokXOmCc8s
	 n6RPNQdOeISq0cCvPBajBuDm+t6El8OGU5P4Og4V+x73CpSBRwHrWa/FxOsqqWpds6X0v
	 ijBk9qSBInUbP2xb6fR+d6cujz+rp68yh9JG/b+oVX4TB3AUEHxLg0nKRBuaIEVvB9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795264350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=2ynCEdy2r19iqoLml8U4mhsqUQ1vpqQavQdEGkHxCLCvg8TBqw4AYBuTeMHKE8iEGZbs
	 FB/kPinCChwsMA/BZUj9P+ONsLJYKbK7z+SW8Su3BOH9UX1Y9O+5GEj8JSw6fLV8J5nsN
	 YDRKQXE+1Tzcf8hw5aejOs6byZQdyXWbKHuVYqerEtsB4mLTZqGtbgna4fWsWUuWkU65R
	 x6+dgA8dJNFzCcmRv9OnZsmCr5bCjhs+y7L4wjqcwDnCs+MORYml6/3aFmckmlr5m9sCj
	 78jAbxPLX4cPjAYx+nTpscF77dqn884JJFdtGpTCiLWx9ZDvq+5mxQM22AlAdTCxiZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zidJU8XG;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F849606A32A
	for <linux-sound@vger.kernel.org>; Sat, 21 Nov 2026 12:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F849606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zidJU8XG
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38587f3de36so2170958eec.0
        for <linux-sound@vger.kernel.org>; Sat, 21 Nov 2026 04:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795264349; x=1795869149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=zidJU8XGwlInRgNFlDnHbYyvZQg7juUChuYfGxr8zXEJWMtYfa+jaG4vlUgks8DuPT
         8FXKl9esRTfhgrwEphHK5FYuLiNo4NhvGkfezTv8ZNMH3xScboO84/TETFVMlsHKrpf/
         i2blFZW3pKgpg98kYFvedNLTgI/2/442Pwuir0dBEKQidrI+ajivm5gKoiab7RDUOTeQ
         z9tVkK9HU8t425JBPx9hz39vnfBhOgJFRE4mhPTXtqUEbO++F2ps2j0ixBAfwEEWmRqN
         bzPEovXYWN9RjN0E89khgqcwyZSgZMPI03I/aLehnrStBQr/yllBdMMoFg6NVBKpng95
         RuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795264349; x=1795869149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=HZbq2xrTdgFRH0PKjPL3cWQzFFQgzTIrrJu7ER7yqdJ02V2rr6PZEiG+oGd+/bYebZ
         4qb4IYc500CEBVqCt31nnk8cvwGYcpiNiRXPLFQk7jHsRTmaf3yH2vheAwe0tdcOoWJY
         fPqdqIwcd+Mb/T4f4jph99gOJftf+DiHSJjlFJ6Gqzr0MWyCMOZ3c/9flGzg9smXkCEw
         NP5h8Q0LU+Br4vfM3WP9lAiyWR5veszmlu2uAYWFtjrA+DL6mdTle5I5HORkI6RHo1Vb
         PuAFez6rew90exuUZ3fiXnBMIOHocmhy21jxJ/XK4ML5viLrg9HAXgRBg0Bewhgutft2
         nC2Q==
X-Forwarded-Encrypted: i=1; AL+hErEwMFCoK/QYQSJ3KqGjVQR9k6qMVZg/z6GVjpCs1TjZmO6nX7M/REukGQZGjBSbGs7ABe/w1veoXYNlnA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Dg3+jgQRS1BQwEhQcCrKW4ZqREfwcOHZjrokKEvPnqmX1n+os
	p4c47ztWOgbwdH7+LhmqPnfXaoleu9jf/MWRm4v4j3x6wT+2UbzqrfkG
X-Gm-Gg: AZFdTZfGNZSkoZcRBmejtRwGLEQB/NdutR/nfsIKk7bUPYt9Mup5hcHvxXr3uuEUTow
	2W1YONu56CLguq3MWKZH49ezAuYpeFaOZMrF3XVgSyqDgIyAE0BYGV89Cc99NAHT4mRAyqYTDMQ
	2OWo3k5UTf7y9wK3VbBl/arqerxbICfvysOFCsRWvkL0lPnPF3lXrD2u6KUmvcCM+GebfM0yoOQ
	JurHiDcvRngzVI9TD7ZwlQzKFX3egMYBscTk5w5VbaQg/fyyIRwKddckyMDVs+4fDv96rhJ/50s
	oiQZqyuCKIk75K6E14Mp6AYYRm0zllkWXsem0Z5SNVFYQ+TBlwO25FnUDq/7pkjideaZO0YqR8t
	UZs2kRu8CyyX0NsiXrRWFdjVnRwQlG7Ca0saRTCIa3XuZBfJGjK4OHk/9W/Pdx91gPO1X+jK3J/
	DAnOzuBGClDgQnRF6xTdvy2TCTammSY4prkdKYRxmQrFDhBl0bH/gZSUYJWoT1qZ8DY5wJGfREq
	/Wyqjm7hBEFrwQm9zR2RdrL2LGgaZG8LhDmg0uCG+kmewlIJ/rzjyRIsoeVAU0lkPQ99OL4G2qd
	JZ/OJu7WjHpiEDn+CbKortp5ahor41+rSD7Lay1vIUGfRbL8gpU=
X-Received: by 2002:a05:7301:dd83:b0:386:5adb:ac29 with SMTP id 5a478bee46e88-3865adbb03fmr3662487eec.7.1795264349132;
        Sat, 21 Nov 2026 04:32:29 -0800 (PST)
Received: from localhost.localdomain ([103.179.231.88])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm16506569eec.29.2026.11.21.04.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 04:32:28 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH] ALSA: pcm: Fix incorrect numerator selection in snd_interval_ratden()
Date: Sat, 21 Nov 2026 12:32:05 +0000
Message-ID: <20261121123205.2574-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87a4n3wi2a.wl-tiwai@suse.de>
References: <87a4n3wi2a.wl-tiwai@suse.de>
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
