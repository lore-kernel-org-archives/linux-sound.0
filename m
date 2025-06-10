Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5975184F
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749528059; cv=none; b=XNwIbCUuoOJy+zlTwrHNsOnUzo5itCm9eTkN1/qCawFfvYV9Q5Ajy+zRc6RMVYr8I9sniV4gOGpbeW64cbGdqic0jtFxXyzHcfKtda09c+0g1UJQz1TjUwgSXdmu8CxPIigp1/kjEsTR2wvQPFVim6ZsuAy+yq2KA38A4lS/PSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749528059; c=relaxed/simple;
	bh=YAurbecaYRsct+rugx2mAIWASISL6/lbf/PEeBU0mJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WTmBMDiLIqMkiqnr/Hl1n6iaNpkC87AiU6UW8pB6PJ2UJ5bG608W8TkzEBZd7UXcd29R9dkcyQUUJUOYcTtBn7gpx0dYbBgeRGLb4lc9LS78pvdKdt5ONJRm0/FL92wkWMOkMS/LKhRGdRD48xB7z4dKsUbOq/SNIYeHnlstTtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4NgW2st; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4NgW2st"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-52b2290e28eso1340146e0c.3
        for <linux-sound@vger.kernel.org>; Mon, 09 Jun 2025 21:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749528056; x=1750132856; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RhXTVgaWWyAyM+lV4ljQfunJhYzPB/v7lhlCebgDfzI=;
        b=c4NgW2stTdcAAc0/V5H7GV+0ZK0xDau/U/msER0xIsIQfaKZRTXgEfnwTFiRm9/9jo
         jaZ+Wm5EUY+wTVsJA1NT2iiDH/qN5wDaGSBjfHCGrTuFYrXlufj3rTtEaUDS0B9l41xf
         ++FSGIsx6cjtG18hCCAbm4UFCzgflbRsA+iZrQZqmmyO8+1ws6zOsHKJNHc+Y10gxYRT
         gYA9YNqnayPlXxqiL6z+2nds81b50lCnwYeRfTi4kphOFhkHx+rQlpqYQ5jGB6mTXA9D
         aKDJ3RNiASb4zeczIP0C/MMvdhFipgFStec4Rt6xRXCnR1Od7GUs6hWytrFvs/oRlh3c
         Wn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749528056; x=1750132856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhXTVgaWWyAyM+lV4ljQfunJhYzPB/v7lhlCebgDfzI=;
        b=dLORxiO2C6S+4zCwwZZkrQTXnGygpKEigsyaM7u3srzkpXC9rxy29rMjy+iMIrWDDo
         lof9fmz5R+gNnHtncnx97Ak3iKiqAReffnWn5Yyz2Tno6TINKgs0rcr5Untz1kte+LoU
         KbpXzVtkmuzzxEa9s4OSN0j+kVULu4Qusn7oCr5L+vw20+AVRotGezWXIH41hNs7uij/
         3HTOM13zyhjF96GfVXHf0eO6lQBwrL2RNjM3sXwMnbogXFBLIqO3SiIHARnR6XW/pQnm
         jxtdmiGuaWR1OF+prRrVNXuXYHLaRk7jyC2ZiFf0lCAx7jsk4RqQTipLv2zLEiahKtJk
         h/Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWwUJ2H6aGPKX85hcLRMZNQt278+6yYbHDz91sbnWzUqiAxSx4psMhCL7YB0JCC5DNbZFTuFCHZrtLSlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGsnRcryqNhBEe3fplP9mub1X5v3iaEqxS/zgJb98VrXI0jza3
	JfYLckpYHIeJ5wNOCSy3o9u/mWYYPTtXOJ7d/TQQhB2Fb3/37vF2nkNB
X-Gm-Gg: ASbGncukfLw83+PV77WrAgU5OS8eyjCMU5Es3zcSQ6jIvRJ3y8eN0zvKZNkvB8Xrr+0
	It/+g6iVDfaSIALgmpi8/zRxdHgunpCdH07vCcMuTHB1nLI15NVl6/BRSfnUND/MamBApFpSKuh
	bciY6IZ4APxSEXoniT2HU1r5Abnx7p+Si5Xp7Hv5SGvl9hfMC+6HY6QYotVfvu/w0gdYCcSE9bD
	8gkSTboCqeUTIxkfbR8VNRORfDDBe6gZt+JdNmFZhmFQdsLITapTSNK54sXGVjsgeM7N8TdM2z1
	hMf0N/hppslRtBpaBvV+iKhUXye4JowjqJe7sz/+6UUr1DIBlg==
X-Google-Smtp-Source: AGHT+IHPs+N8ws5P//lxkvDZ5fD8rWhRAzhX8LvH9gxz0P+yGpUBQxw8HanZe0+O4/QGrUHQbwZP9Q==
X-Received: by 2002:a05:6122:926:b0:530:533c:1f6d with SMTP id 71dfb90a1353d-530e48d2947mr12374555e0c.11.1749528056651;
        Mon, 09 Jun 2025 21:00:56 -0700 (PDT)
Received: from geday ([2804:7f2:800b:478c::dead:c001])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53113a7e948sm691007e0c.8.2025.06.09.21.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 21:00:56 -0700 (PDT)
Date: Tue, 10 Jun 2025 01:00:52 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: wens@csie.org, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/37] ASoC: Standardize ASoC menu
Message-ID: <aEet9HP7WWBTdz6P@geday>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
 <CAGb2v66xb9duevXtZf=YcUM8WvoopG76_yud8PHXOnYD+i=kQQ@mail.gmail.com>
 <aEeqsul4gzxde4Mx@geday>
 <CAGb2v66MU_Sz6bVPrvMacL-wX_XU+JPWxMWjsfN=vPkzRsRoAw@mail.gmail.com>
 <87cybc8d0k.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cybc8d0k.wl-kuninori.morimoto.gx@renesas.com>

On Tue, Jun 10, 2025 at 03:57:15AM +0000, Kuninori Morimoto wrote:
> > > Chen-Yu, did Morimoto-san forgot to Cc: list or message was dropped
> > > silently (like by spam filter)?
> > 
> > Looking at the Cc list I believe it's the former.
> 
> Hmm... strange...
> 
> I have checked posted patch, but all patches includes your mail address.
> One concern is I added your address on "To", instead of "Cc".
> 
> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto

Hi Morimoto-san,

Sorry to intervene again but I think Chen-Yu's concern is about Cc:
missing to open list (linux-sound) not his own address.

He was referring to the (likely) fact that you forgot to Cc: list...

Thank you!
Geraldo Nascimento
