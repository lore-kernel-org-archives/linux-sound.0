Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33683AA50B
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 10:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778494986; cv=pass; b=gtXUyxhN5ISZOu3QjA8mH4Sd8f8fHn/OfJkrMYeNHDhgeW03WgUFIbUicPOj5sGuP9iUsoan1iNHOdb6S87cSnUtgEk8Ir+avjC1H57umoR/tSFv+dtZJDJcGVsJTVh5eEQkj4Fa3xm7ArHIn1F3MZcjuBguev98wmiUJbupgkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778494986; c=relaxed/simple;
	bh=xXjo6IWfCz/xy4VI8+IePoDrGofTt+dOYDT8TY3Agwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bx7SVxAWzq/WMeV9cfuDNvb2lSHZqedkWuGpzzZeAzdQr+H4sTzuBev3vRDZ8qB335/TeNHaXMeSfpnnw/4gtV+bAUqRXL4VfdOyqE8A3YypvI52sGqD4eL+XhqpVkl3hSCa6mbME0NWUvp0HX1vxVxJYybjklWVlbmQa0j6fjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffeeMbcB; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffeeMbcB"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-367c26471f5so1397059a91.1
        for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 03:23:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778494984; cv=none;
        d=google.com; s=arc-20240605;
        b=kYN6YPfatFHJNQ4lZ9VQzl8RdWwUq7izGWFQCYi6ZtNNtAM/D6cBFQVr8FDXw/FnRY
         fAE7vpXz+nyrsaKRfhCKpN4ttsbCqvwnb5lAc8Ob0C579TrAvgqDQzhAxmIXwtXBI6Oj
         96G9rwE0WQGksBIIcwRmJIsrz+NTUpBNWiWhD38JaTlLWpJz3M2vgPlgDBJREUckAQTI
         dgV6Nytj/6DQ7BRaKDQpD0EVFCvW0fmEyNZ2Nd9eStMtH0sVtwH2W1CtbmeJSoaftVRM
         0Gqk2jLoEnaYj/mMzwu2Iw2aWwYAFcI6aMfNl0RjLgcLgwGBqed0kfJMFHm/FE5gcFe2
         5T/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HPX1tgQdYajA8sGK8tGlT/Biu6abj/wZDamRkoAL5J0=;
        fh=PndK7HEgwLW1GE5dtps70T9hFoW98A82NRDJ+CDSN84=;
        b=XMoaPT52bnxJaA33vA/ubIpl9ANBZw1qBWN0ASNjiXvO8iPITc6bfM04XsrSKl02PP
         4UUFUWHDtXW9efPPmf4p1Nk2Xl7s7gb/voPojUqbmik7wkv6cYCWL/P9AjB1z3myYvdv
         QtKQiYgV5veR6h//InYkmiHlJzaHW5iQYEl3PUnWrX58CykkhLnnkkG9YWWp087RT0Zv
         CF2Oy6TZN1jRdEK12u7lbxNt1eGpcCnLtc8jQjoSOA3M2Geo+AF6LBKxz5Df8REqKG5W
         fBzGTvXiANlaEuFU0QriqLzoh8pmmvgRI1PniBD71RyljUex7bEw//nFMp8Tec4rFVbX
         N8VA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778494984; x=1779099784; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HPX1tgQdYajA8sGK8tGlT/Biu6abj/wZDamRkoAL5J0=;
        b=ffeeMbcBye+XbIdAqackXrlwO3lnbT5Nw4xtXd4rRWKnFfRK/AO9bJvKYlpvZ9eE1D
         ozO8LcXfY30TijrXbiz9P4AD77OZZGK+t6Ig2EL1+gnZBJK09wBtbxQc+899bb3jK0NL
         gWa0sgK2+egOsycEs+1bxtKd+1aIbEVxqLSt0PwtgbPBTOq89ETyrD42xw3szoZq8iJe
         Y784dP4fYbebecbLTYLjBGvxrItNseXOGnf7nAoRjHskklV/I2ZhpEc1a/TA/JLaKXfn
         HVu4AdQWQpJPkTioMqH9BuEe7LqEwzPqk2kNIbA8BavYoDxZotfoUysT7QKPeacQ1jx9
         ZqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778494984; x=1779099784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPX1tgQdYajA8sGK8tGlT/Biu6abj/wZDamRkoAL5J0=;
        b=RIH9hbYyX2UycwIoS8KTEi80j87vQWlxqh4WWDJF5CjuPeWV3tlmUiPVYftrcpXy+4
         ZAtXSRYMcTi12Tgn0dE7A1tJf5pcR0cgzmkbxZkjWRkNQStppqZVNHyoXgolr0F8wY8i
         eXQxe2VGd5wL6HtOaSNLBCQ3PXEibZ27PzDKUCH+/QwVUekwtmDrGXeeiQKhswjR6sGR
         ZPLNt61g2TyXrGHLR5kOF2R9z19OW4TwmVXuAclWJ85NxlOOEsv+oh7/JK9o9wCFNTrp
         OqyGe3VDwBNEN8NYhtQjwrv14dJpmgi7KbUxOBy7cP6BHMb9y0Q35w7OhcoOeMfNXs/0
         2rBw==
X-Forwarded-Encrypted: i=1; AFNElJ8mfpsDqucrYeG3Jk/1vxTfcEM4tFtrLDY5Egvc8ZyUbbbTONzzkCpIJOLIgCJoiXDNRr/GKs+/NDB0xA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfcMjuydQhEIepjE1b4/4Kz7/XYUTrGvROW8//xhzGutqSi6D9
	dWS6fJCD0BdvnpCZk0VQwfKQibiFHOaoUpRH1wlkazZaq9YZkoO5V/z55pIckL+VR/tNPaX6u6o
	X5Es6TFsWuMJMJJAjzb8ENxC+h1oGjqQ=
X-Gm-Gg: Acq92OEBTHPIAOB22sHJ67d0L5XYxKLl3tDH61l/ZuZcuW9wypQXTOSazDnexikpjvj
	XzZor6TjuGaSPuH49ydkMIogh36DNRJn6MhPUCGRiC5UjczYMF5u2l6BS4aSfbnGhHexu132mkl
	8xy6wZKJJGtSj7I2evEQcv2zAXi2dE59vvDagewNdG/sdfBz/eABk6spUwGrYZTlePMXVvGBDVx
	KDYZmNRm7BcwJ79Df6s5ci6Psjm7WU/zGWpViO9WHZ6BGcrtcr/la+giIOdR8WqnCNJaH+Omjnw
	20JZFXuaYpFtIH+k2T58QoZ+UFWziB5W0MzOhCM63aKeptFX
X-Received: by 2002:a17:90b:5484:b0:35e:3afb:a3ff with SMTP id
 98e67ed59e1d1-365ab9b8beemr23214081a91.3.1778494984218; Mon, 11 May 2026
 03:23:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
 <20260510084303.122426-10-phucduc.bui@gmail.com> <877bpan1l6.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877bpan1l6.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 11 May 2026 17:22:52 +0700
X-Gm-Features: AVHnY4KeZdeHiYzmKMhvfxrwvLSvsF523Nansp1muFCl-srjK4towjDma_7cf9k
Message-ID: <CAABR9nGTnDQHceDT5=Q49WwLf9EPc52TQSKe=PrF7B2jxsrTSQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] ASoC: renesas: fsi: Use clock prepare handling
 in startup/shutdown
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	geert+renesas@glider.be, krzk+dt@kernel.org, lgirdwood@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, magnus.damm@gmail.com, perex@perex.cz, 
	robh@kernel.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hi,

> fsi->clock.count check can be done on fsi_clk_[un]prepare() ?

Thank you. I will move:

  if (clock->count != 0)
      return 0;

to the beginning of the fsi_clk_[un]prepare() functions to make the
code cleaner and more compact.

Best regards,
Phuc
