Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8CD22318
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 03:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749527225; cv=none; b=LlpltLiUNfujOVAcw7WR4nKeTcvjhdeRp3G5Lk0HHBUtURRWnbY1sq3fedJVFYllLhv6fqRfQXsxeHBYEoIEe7oNomiPsbFyoeQUzvs7KvT6Rx4xU3SJJbUeMWgHStxxKcZ829EFI+hofpzDRIqyNvUPyFpSN9TrFwq4q1/x7A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749527225; c=relaxed/simple;
	bh=cmrQ39pGJJcn0WXQKdjiZ8R3H9qA2z+/hJbFKCtS0qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=em+NQTV0CNRC6e2gKXgqrLAbZijtu0yv+jmGJa7Fgk49JzJ4XoszlKmcJeaqrGsgs+w6s1d1NLh3oYrZtiN1hJqYBWhi+W/di01q6MmyxNXjZG7LxZZ+DCmL21CUe7phrv9vPzKEygN7ouP4f02ZOincINcg1tbNi/5c4LOFI7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJkkWAcN; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJkkWAcN"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4e5adc977ecso1610675137.3
        for <linux-sound@vger.kernel.org>; Mon, 09 Jun 2025 20:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749527223; x=1750132023; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LvAhRww8iyagbYmSYh3bhDQWwzoBxl6Ej6RdGpUtvOw=;
        b=XJkkWAcNSyHRh9rJzsUomH8mBYnVYGTfHFr/TDAW/lFhVEXS+lla6mu1l7riK6zgMf
         j7QlXT5uZ2xcztufyadEVfUzHY1dW/vS1QdHgA3zL6z7CWqIx2O1MwoagK4+SvzC23N4
         qCebkCEKYZ9LwkCHiEunQFsf0lzOZKlcsS2oDm4FCEtmNW6aWkOem8hedbXBIVZjwSag
         WabY2P7fObjk9DLUKs2yrEoMTFfxhKaRccl8S3E0sDjAt4rk5BBhmntll/KBEelEH3q9
         6s9qlS33rYl/AUH5GgrXI/BSrD5jw3AulsYmGe6fa8vile68hOnn58IivNJ5T+JJbzI6
         KBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749527223; x=1750132023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvAhRww8iyagbYmSYh3bhDQWwzoBxl6Ej6RdGpUtvOw=;
        b=NR02D28/LiGsSXyfv+gLM7QL02usfo4bTY8JCxqtYxhpggeMOnLNGYxEkKo25nlgHS
         TPpsAz1JL+BabP5N64u6IhCG5C0+f8481h/49A857H2Ti5fxSkYXx8VBCRQRDVTzVVzv
         tA+xhwPneTu+j6WjcQpLY+JyDItC6pHVZK8LYB4P444ANji0e0txVo1N6QILJ1fVE/45
         QQdeeKVNl+yynz4ec0qa6VDkPC44mV89SYL5rCZxeiMIxcTo68IxjVTUk+HeE50f25Jc
         jUFSEKmK3bUiyl2yftP7jKlhES8ZVxafKaeFIVUNE8a5zGP//Bt8tWgul0yHtGHlaNxt
         KV+w==
X-Forwarded-Encrypted: i=1; AJvYcCUkjks6tNujJHdGsCO3qNVJB2TT6t74J2arEuxd9zD4kDoHGoU7f8ZjdYml24YqA6o1WI0nqi8Ufw9bCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyswDUN9WMnVAcClVUybAknwnNAEg/qjfodNZx//9yFjJoZyi3W
	CH/tMtQwcTuhiYig5om6P/lg1LtWh1S+NLPdw+i/JZdAN7RAN+23U7u94Kx77XQB
X-Gm-Gg: ASbGnctTDvKFSgiJo7cDzEZ5NtiFuQOay/XxgI0ax/7pKIb9lKurPJjIv00bybb9s3P
	E6DczFr6AOrrXUW6ioQPHFeCWj4vOYAnFV+LHGcwtzPak2DHyNT2nWtlbJ/r+aMuza3DczfKKF+
	8IAmCti9up4yRdk2rzSIE4Hmf+gUR3Q0LCXAeSEMkuKdmEJJZ2pNPfIHwEIc/etewqGPNN50SWU
	VNa6DHLQW0GH/MKgEa3wJ0ga72YKEXIDrzhlSLv1xcAT7tm0lEJy0GrAPly5btp1Kx07hLNEP/b
	cDX37ycxQaTyIb+reZgbBaL7MUlDN9heDXWUucPUEHe5vXOp6Q==
X-Google-Smtp-Source: AGHT+IFkzqQdgNm3mQv/e8tNsr6pA2NF9zUytRzNwK+6FA95ETEuq9qARNsAxYni1qi3GaUOfai6SA==
X-Received: by 2002:a05:6102:6f04:b0:4e7:7787:1cf8 with SMTP id ada2fe7eead31-4e777871ddbmr7771091137.7.1749527223116;
        Mon, 09 Jun 2025 20:47:03 -0700 (PDT)
Received: from geday ([2804:7f2:800b:478c::dead:c001])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87eeaf9612asm611422241.30.2025.06.09.20.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 20:47:02 -0700 (PDT)
Date: Tue, 10 Jun 2025 00:46:58 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/37] ASoC: Standardize ASoC menu
Message-ID: <aEeqsul4gzxde4Mx@geday>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
 <CAGb2v66xb9duevXtZf=YcUM8WvoopG76_yud8PHXOnYD+i=kQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGb2v66xb9duevXtZf=YcUM8WvoopG76_yud8PHXOnYD+i=kQQ@mail.gmail.com>

On Tue, Jun 10, 2025 at 11:16:22AM +0800, Chen-Yu Tsai wrote:
> 
> It seems only this cover letter made it to the mailing lists. None
> of the actual patches are there.
> 
> 
> ChenYu
>

Chen-Yu, did Morimoto-san forgot to Cc: list or message was dropped
silently (like by spam filter)?

If it's the latter I suggest to contact postmaster@kernel.org and
report the incident.

Thank you,
Geraldo Nascimento
