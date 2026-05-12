Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31893175A92
	for <linux-sound@vger.kernel.org>; Tue, 12 May 2026 03:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778555365; cv=pass; b=LU2ws5e3G57o/hjRaeWy1XRk5RfWmKwC6mFdmJAw1KdlYzxzSsb0Puktd7p3DfEcjjpto33ZXi7uEgL552YooDWVJeHk0NfDr0Ji+3ft/DnxJ/vQkSEqVbFmXq2D8TfWooYO3Lr7Dl3phR6OwLDBzluL2pbTHR35z/uJEvB7/m0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778555365; c=relaxed/simple;
	bh=9QKYX+S6lwwCw+mTheY9a+AJP8+EDfhOnBM9LIQmtAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFNWf9JVXSUxXDF8KviARaJMfSp+2ihTV9DwzTor6gffi+9E1HycofEPjK0yIE89qa8QhzwLmVDDAR1doKtqdboCpLOeEYetgRaUYizf+sLy/+PbKhpFgakpDrWwq0LJUJTjKzKgEn7pdegU3jE51m+c9uLIS3Tlb9YXH+5c394=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ddnheo1k; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ddnheo1k"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3660ab73adbso3133129a91.1
        for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 20:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778555364; cv=none;
        d=google.com; s=arc-20240605;
        b=Es3nrzSxwWEZnDcgwDZuTmDYBaSXfc6GLPmquRvdQ4DPo8UK0Mg4kv8Ff6l8LaiHml
         Simxjs9Tdc9VJe5J+GsiOow9l0eWF7MxoRn8z7oxa+LB/oynMbNbjawG1+l9fgOpLtPa
         xca4gWkLKBwUhIYapVtZszbiKn+Dobn9Rq3BPfuuDoMsCbA+tLSl2mpgZJrThG0w4BYt
         JLpqRrZOcMlchrbnKq1BBBEdS+fE2tCEMfIKFQpINsuRk2P2uZlxjg+ID2q0ol+lAz3S
         YLyYJ7NajBcm2oN0vaunOYbfvuVSI+V7AccK8fBKfMS7A+fKX87LKLpr7B39lmb16g3H
         A/sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EVqJBMgrgpMjKXDoG3OlirV/gMnvN8dDwKNZrZpdCCc=;
        fh=H+/n9g4t0C5yuwlBkQ5pXmOy8pzvPSZt+UCH6xQyPCo=;
        b=NI8DC2oLZxiPtgZbWuY86upGgVF7HXfbtBgJHhKDhWwZT9RfqyyYVLTi8R+oS34f6U
         JcsN/kr6k3+0C2F8kcHcqbo03dUDfQfZVpOsFSrYcvnsbUX2LOXsfNZzdHDkD2p5rHc9
         /8DBYiKoNyImGAXasym86KYNH6AhGmXHrqgcxfyrVu40s5D30hNH7x4QR4KfkYDmm5yC
         UrXUvw0UzPPBMtipSJWuNE8FVFOFEks4zm2ajZF7w9QAyRsIf/bbS4U/g/X752TXIwZv
         IWjklAe9BBDbGYrMcq+fsWMfIUF8w26ysExAGZVsNd21WRicXhp2bNPYOH0Ra8R237R9
         81uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778555364; x=1779160164; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EVqJBMgrgpMjKXDoG3OlirV/gMnvN8dDwKNZrZpdCCc=;
        b=Ddnheo1kcPdtHY7nXGvQ1mOQTIIxk2Pegk6HQEOWV7GNaDBnpppFUqAvZ6IE1DcvZN
         FFkPSQYJLXiTTYLV212K37Wo2R3LWY7+d4rON3tWs2LV4CpZ8Pz9X4lFnwkYp4v1bZoh
         oLJjuUEPaF45YPueJF0/eu4ZXn1S2XYVEeBa6EBzlqOhGkGqRFsizOr1rdDTk6ThnqRT
         DE4xkUMrxErQjhPEniJxM4qhap8qRyaY4mixq2wlGE1MToVDaQ6bILfWhhOkg46dETQ4
         Rf8wN0cLtXKDxxOBoT5q57Xnl6w/ny/OnIpTwY5a2I2feU0abYWn9fewpeQRQQjdoVE4
         Taow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778555364; x=1779160164;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVqJBMgrgpMjKXDoG3OlirV/gMnvN8dDwKNZrZpdCCc=;
        b=WMhfbWzz7odR1nfb0Ybwdvvdue+nK+gRgn/lOOFHEuqE9koxgr3Rn7HPSle1ViwRWS
         NJABNiRBfFnJLaxEvSrwwDpvU1Lr6Me3NgcjFClguVQ1CXpoHQme2WylXdof/n8kNO4E
         iFeI7j1C0DAB46Acq9D7HqzWK1VEwwIU7q1xzICpOXoZ4mubf9EHFW5MO3J6+z2rZjLO
         WFTMuTb6SH4YM4q2LFvwRV5oqlqEoRGzLmhGpGDhYGled0gs2AW4i8mNy++huZcbN3lm
         EyMWlNHQxRKB+NGP8D0JTsjJC+XItVSCuyROskWy6dFGihoOi7Gg3H8VyNoAxd6jJaen
         NY7A==
X-Forwarded-Encrypted: i=1; AFNElJ/1tUAb1mFoUWVV809k032zJmQX7U4Yo0LoZ7lXJKwvYp3vxQ0B7gJYAB+tnVeJQx1tKD7a14BaA0kTuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQy73josdmC9xkVhpOGt22wKE81aGcuNPLukSskp9zAtEvLx/o
	Vmb4E4dKPO3oJ+cRKPpztfQcxaQw9USktvlxV3vVe3IiyHWwmDYeZtMuKUoie9JmDa9zfOVoCdE
	Qj0mTgOfasTJgmD/pRbfVFnWDbL2K9hA=
X-Gm-Gg: Acq92OHTXtVGJMnr3QhpgPjWT9wEaNr8PRQdVEAbe1MhvON0Bo/ZRe/Bg4wbDPful3/
	HHW/q2ZaWoa/Ls91KcsgtwvjtWfP7lz19kcLHNQF8f8ZQMv4cGi0m31qc+vDpJv3D+/X8ENrmMu
	k3xJ5jH6XcTtXBOowdjEqJsYG2UwfFFoA+18NHNrGnaCWb8sIOdzzgx1eIU/3xLvlYApKhQb2Pl
	A94lkJlKcbjYOBI1VCnCZ9KFHj1QVIBuk868gK3KhFWbA5DoUVxkQVEOzHfCg2UbIwky9zuH2af
	R8kYPA9K+zzXnzHf/Eh9bjifrHOKG02PlenX+g==
X-Received: by 2002:a17:90b:5344:b0:35b:d795:cf5d with SMTP id
 98e67ed59e1d1-368ab8638d2mr1858065a91.5.1778555363550; Mon, 11 May 2026
 20:09:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
 <20260510084303.122426-7-phucduc.bui@gmail.com> <87bjemn1yv.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bjemn1yv.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 12 May 2026 10:09:12 +0700
X-Gm-Features: AVHnY4IsmAqqmxNkupkaRxtbCeEPAZIEnld7T-VRBsXE0b6nsq7nw4VOw_WWfjU
Message-ID: <CAABR9nG4cxwX_fjF3yihRbDP-qb4AxAeZdSww2ENY4eE5ecHyQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/10] ASoC: renesas: fsi: Add shared SPU clock support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	geert+renesas@glider.be, krzk+dt@kernel.org, lgirdwood@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, magnus.damm@gmail.com, perex@perex.cz, 
	robh@kernel.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hi

> Am I suggested this ?
> clk_spu   should be merged into [07/10], and
> spu_count should be merged into [08/10]

Thank you for the suggestion!

I will move clk_spu into [07/10] and
spu_count into [08/10] in the next revision.

Best regards,
Phuc
