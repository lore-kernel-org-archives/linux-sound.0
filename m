Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437564ADD99
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 16:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784045367; cv=none; b=QOT6Mw1sWxu4Uw3wYh27aZ8T1IGIzZEpXa5waeJKugJF7R8J+qKvcCpQ+au4kdMciT5S9IE/Bgb4j1eM42elNTX4pP0o0n1pqS4YpJZG/93x6ctjPcR0wj53iistShS+6Dzj6Qf5F99j32t2L6PtDFf2l2xLaej8fiytoQMQiEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784045367; c=relaxed/simple;
	bh=GXVI837g1ct10qWkXRLUJqSubRz9yvmaXF5e78qaF3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZpHLuBa9NM6jLW1ex//uADlYX7mJhufF30kYTka29Vj9WXKF2UP2dzKUoKp1tvrH40eCStk9bLFNX+6DIXEf6JOQ7gbol8qfF8NKlGFtD9f9galLIuH7Jcs7JkYnTpIL1KulZwb+LgImt6x3JeAU2yToe6jVuvGXf5OEsIBfkIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQXP42vG; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQXP42vG"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493ba701891so8962605e9.3
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 09:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784045362; x=1784650162; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GXVI837g1ct10qWkXRLUJqSubRz9yvmaXF5e78qaF3k=;
        b=bQXP42vGotjRRP9tjOFC0xo9KIovO8vUbLzQb7dNx54DZsdFcvO1cM02Sk0EvyN78L
         3OmCF3D3Z9XwO864vaBRGG8lQt1kV7wNlnvg04LtGVbmc5QjjutVcAEhJpuapAu8/yNR
         3KYC83UNGA3DnEkIMB5aUZDjtyOs0alEiwHM7F5sTgRSzx3R4JL3rpHrnvVXbtX/vX22
         6jrqif1ZRwCYFqCG/OrpdT7K8/DPU2Wx/osAhQoQIq+dJKCnve/oBUUn8dtIgSoOpnMq
         tzTGRNNKx9yBKogUQt/+b0VKXqVcnFCy0WYqs7MUfV0mROPSSJcaeD5dCKa3RmdM1nJj
         +Pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784045362; x=1784650162;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GXVI837g1ct10qWkXRLUJqSubRz9yvmaXF5e78qaF3k=;
        b=qa0caGa/cuU+aAkBGeAsM29XkjyM737TQ+YCJH3+DFPZGMyOGNFVgWg33GsRn7Kov6
         vbcyX6DIMktKaC5/t4ZWwUMX6W4AAd8/Nhct1j0JbrwBELkwvd/EP5J6q0xo9kM8wLh8
         xBWKlnzJ2OWFo5DFvhy4lUbqZO5SLAgBgf6GCtCqmZQmCeUr0BrG+yYU0NUTJA1KHldv
         XeTlljrvUgEEpT1F9QbUrjkLVyRIKdS6zlXJIdwTAIViKsNRGAJfl+Y6RSGbyX/+1QSU
         k7KXhguBS40x36Rgj0vX4Fj2KXuQY9J0SmW8yXRHj+JcLIWSTzPGTmuWZzjMQiDO/+f0
         MkMw==
X-Gm-Message-State: AOJu0Yw9fZlYPjCaDF2+4WM2x0YBD+zvixa0DeDLKUgSgXrtpO4XyBKM
	Imkh1DgQHxbkica/cN55Idz2rv1bdpr31X1eJLFg1/UiqvDici0ojcSK
X-Gm-Gg: AfdE7ckqzySYzlvwdLUYv1PPG8mjoQzgZ3sxGAoMChHA67rgKtAuI2vIBn6/RQp5Dp4
	6EA6WOfXhAzcVoYNP6M4Z7TfY8dyQ0C0h+jvpSWQ4KH1zrg1B1W+yeSrV7trwhJmMjFoQIFfzRb
	wvvsoT0yPioeVSVVJ/Pek1ttB0BuOBgs4915vB+4yXG0kJFbT9g+rWs1vzdH6LATXVlXEw3DgmF
	0Mgn95MtxFIeJcTwAVETNKNRyKDf5DxHxwSqqIA6IbihnGPbp1pV+Boc8WgqtJDpQaTzco/SnKD
	HyP+xCxRmO7QAr3S8+yRh/LjMTgrO1i3iF/HW6OJ3LVO1FPrKxs8FECBpXjNOPjw7Xo3Z2+vFc3
	vpy5NW06hZmODkCHQ/qUUwqPR51Hsat4GqEW5AZFoN+byF0cwFlZjqPjK+cfPY6qMbYYriuTKsV
	T4gXdhNpK1hWo/I9Vg3rHVxxMZS/7qVo5zbp6bwtO6eHvRen5QArwU5JS3Pl78b+SCuGJI/RIB2
	sY5NWba5XELvDJbojwdsihBrySC5/1KxDLMUJ4lydbfMxsdB2LtO0dz5tRkMRLHh+Sf37BYzeVl
	bTeeJI0OvppuwqQ3edvYzXpm8Mot3pOHiMH99D0mW/nfASYR15sy+5SvcrEg2yyrgPZnP0foHzd
	i8ZxXzS57na+qZJ6mOlF2292uQLwYHjkw3Ra58PEf0Fg=
X-Received: by 2002:a05:600c:3e19:b0:493:f28e:462a with SMTP id 5b1f17b1804b1-493f87e6ba2mr149120795e9.12.1784045361917;
        Tue, 14 Jul 2026 09:09:21 -0700 (PDT)
Received: from jernej-laptop.localnet (213-161-4-244.dynamic.telemach.net. [213.161.4.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2dd8376sm228065035e9.2.2026.07.14.09.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 09:09:21 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: sun4i-codec: Sort sound related #include statements
Date: Tue, 14 Jul 2026 18:09:20 +0200
Message-ID: <ptJh_8TPQY2jXW7OWRlEFA@gmail.com>
In-Reply-To: <20260714151950.316035-1-wens@kernel.org>
References: <20260714151950.316035-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 14. julij 2026 ob 17:19:49 Srednjeevropski poletni =C4=8Das je C=
hen-Yu Tsai napisal(a):
> Some of the sound related #include statements are not ordered in
> alphabetic order.
>=20
> Sort them. This results in no functional change.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


