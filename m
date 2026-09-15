Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87310386C0D
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 11:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789470524; cv=pass; b=PXkcJVKiiH8rAyyxJPzVH9dgOeysowtxKCDKHn5oMoUfH0ME55YxymYu1B7CfSsbAAlpQJXC11VY/AGK4jJESJL4BEb3htdpzaxfnQrVigzAN7i9DFzqW6phXqxgwuv+8iexnljorvVSo9y7ngk4OdV+pCl3sStX/1y6xvH5l40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789470524; c=relaxed/simple;
	bh=l2vUXs/Y9m7FAAauf87jn6RGreEpIiaOkZ1dEyFU240=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ax5VG6xZQcVXmoQSm7kxjtm8f/hKAjjE8TAk9+Fh/gUBFohyN7r13AHRzkd/AQ0NYdm8tk1U/YYaLCvsEMBuPZlfG6Qb3Dy3vTmDrwykvCcoUE3VTdfis0KpF/Ad3KVmUP96OSTdXHt8gToSH7I0azGPwu5lai0kKHj+g6iH7o4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNDe+ujx; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNDe+ujx"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so2663049a91.1
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 04:08:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789470523; cv=none;
        d=google.com; s=arc-20260327;
        b=LoKXcNxzBTQ7pCaTXYckRgrdLaKnG94gMhh+gX3PnUsa81QfdNdcqlvXBsQtXfdpDC
         I+WI8Xc95PKIFO+VHPIxwzGiD7gY/9KKUqd9kLWP77FV7LoUQOruqp3LbU53m/r35ijY
         RdNchTkzcijTVsPQ63x7IHQMNZMAG6iLiPhovOIBne5/5uGGNEnjq9bbFduVDrZqMYCk
         gpM476ib5JroH2aEYAPNS79exBIzJ+N2rgIWDiSdqNnHZ3I5mNcIfdp3K2nfgVtNHeTN
         79lhCEBjkTcR4ubwFm3VPGlNucS2paPlyWNJBW9XfYx8hYMesNXCAQmgCc211Xu0hGzM
         P1gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HgKu983plYe17NxXe4nmZrE8ze0A9BJIC+fpvojd2BY=;
        fh=tKuOrf8EQ5ix65DgKVdnBoJlH4SY2pkUnXqGJlasFEk=;
        b=Dq137sgpFui/0C9z9TOU8FaSCauVNdmBRPwQOL8q3tiqejuq8zRrgI05fBBJHdQxMi
         WzqDBgpzHNM4eyVj2P0e7utLsDf6K+3qxxs8ssAK+KP+JE4W8bokbgL4/7kt4YEFueod
         1HOayusl7SwzcqeuJc47yhzBSeTGz1U97cUFfuuyVz9Mk1F/VXfxFZndS2OmdjnQh5UC
         B4DgtlD/NRQnTjwA+6SnWXMq3MI9/MT11i1QTnNw76SXS+C/N+UQVSFV+PdiTAw8Y0n9
         qga8ME28HOsIzfWQxmaMfi5ktZe9CFFFo43gpHGMzukUIK/s8nnDYCSEkjnmlYEEMTU8
         06Zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789470523; x=1790075323; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HgKu983plYe17NxXe4nmZrE8ze0A9BJIC+fpvojd2BY=;
        b=iNDe+ujxGHqhgxu2DOXa9VG6R6+NeQljFuroprLKUZnfaflpEtNALlu5slQ/i4yf36
         p100+HifeaNx7PSvsDoo/S2khJfX2CZuOFVUvyYAw1qHT3lI7zmBLgnp+Y58KQGJPVdQ
         p3fY7Buovtyuzkn4mEo/D1ZSNvkswEAd0DluIoQ8PlOZjEYGIahMk8VQMBPFSHmV0he5
         rVEWf0EeyhN6b2wyFsHkFTgxSxBnkJh6hmMfuLELD+OrQJxY6QbktHKUanwfJ7VsOz4U
         SYm6zCMFb0HecT6mR7biAwV8WCM3A+SMpk71KOp8+BKr+YS4GJdLlOD+WcoJawkda03j
         liXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789470523; x=1790075323;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HgKu983plYe17NxXe4nmZrE8ze0A9BJIC+fpvojd2BY=;
        b=umeiKX0fJHjOwWNapbH/EseRTXfECuIrS0JI3bXrkYFRgW7IakF1jDPD6Pk5FzePmT
         ce7nlfIsLzCE5c8JPtl2MIV5Em/C4bFsVs/0RENHlbTKWfZt1ub7IAp/w2K7eIkmEScO
         w4bkGqhwOLcQxn2igCaFIs+1aqegzO2IYS7GIyH5evrYrv6te0z1U1dliZZ2L6OrfSCz
         41dFdL4fbO23S17b6L056iM0fvfeFB4DFggDuF7z/VIzOv8CruQRG29TdppJnMZ29BQg
         CygFZCrFpUlukg/IMzuw7evXz4qtds76gX06SZSIPME2D3eJmQtQpiHZxYPvsXtRf+va
         lhJw==
X-Gm-Message-State: AFuF++mgLCOiTYLk5me/uDUimP3LPwHX1tqeF2ztG7h71p52gIRjXbeD
	zVGGUtJof2wOso55lRjA8LgEQvHmnxiA4306lhQA1jQLg+NGxc8TTd7qEWxeLzM09falt88kbZj
	50TeQrrDY/ew18ZIKdq66hmBU+I5YWI0=
X-Gm-Gg: AYBFou36NbeTbYgfNo2yIEmylIKDKR0WLp7u2k0ytcecncSlhn9i7mi4NUIyLAOyVsM
	Y+bWQSGeQ7fAqiGVVaLGekZgy0wpZ0WN5Q5O8BByxWa/HkEvhvIazeUq95u7qjF8M4tublWVbbq
	CSF3O7AQcexOVw7JJfbUFanSTkb6eiqJHb/PV0lrrxlcOoYrXRVJrYEGWqmOVwVXZ/IrYQHv5i9
	eZkP4AQqXGKTyZa5BErkWSfd0gZUF1iF4Te8T7KhGNte+0WG+YkGTTrMK+2nQHo4N3gK41wZXhm
	WLNQBkoGrxv3PGeWy4OI2RtbsGOQY5MZOde3q0x9pW21LvD3UMvSyM8n/gjmJGZliLMSc0yzTB4
	1Gr02Zt2qHj/JK/r687Qe8fbe8v1LEco2QBnn1E2OxXBWLn+IX72dpRSoVk8rGyaxW2w=
X-Received: by 2002:a17:90b:4f45:b0:381:1c96:829b with SMTP id
 98e67ed59e1d1-39debf6f167mr12732655a91.3.1789470522561; Tue, 15 Sep 2026
 04:08:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aqfHiX3pE-0BiCt9@stanley.mountain>
In-Reply-To: <aqfHiX3pE-0BiCt9@stanley.mountain>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 15 Sep 2026 18:08:31 +0700
X-Gm-Features: AcwNN1Xbei01AvaStCtGYRy2yjju7XEUCctMBExBUERozsqSeRWlgo_bunkCsKw
Message-ID: <CAABR9nGOKo1OSdTwTsmBkEj9x4jWBY0kXcPo-GyoYSjttRLSOA@mail.gmail.com>
Subject: Re: [bug report] ASoC: codecs: pcm6240: Use guard() for mutex locks
To: Dan Carpenter <error27@gmail.com>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

Thanks for the report.

>     622                         ucontrol->value.integer.value[0] = -25500;
> --> 623                         return ret;
>
> This was intentional, but it would be better to "return 0;" here.
>

I'll send a patch to fix this.

Best regards,
Phuc
