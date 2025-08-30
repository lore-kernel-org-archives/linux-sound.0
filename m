Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5663425D1F5
	for <linux-sound@vger.kernel.org>; Sat, 30 Aug 2025 12:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756556049; cv=none; b=U2Qpj/PQCUeeCAPylhl3h60qxkm32TtwDq5RyHdaqF1keGt6eaCxxWnikhgiXayoGoXpOjXAwC8C8WuqLwnFt6LT6dWjbKoh73l+GRaX2yTmrBWvsvlo58iiHtElmbrA1GyzRkCZvnITG0f5PhhEe7fX8NNPlc1anywZydtfJnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756556049; c=relaxed/simple;
	bh=Y5ubcu185JxRyPLyMKOGW2j86hhYDLyAzlRdILh354k=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=h+utmgfJLUq7pHDJAXQRrEbxlrIY8PD/jMegq0UPxx2qvsrxp0suiZ1ARl3W2ZPhuijwDdvUbGSNsq4R6G1dR60eU+IWcKl6Ga6YbV6PiqI+TZBEs8Ib7g2JhKAZP/H3VJLqThhyZm3IXO9LP6WwwYMLS/NDrJow9Z0EDkwnVfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jlQcR14U; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jlQcR14U"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-248c7f955a2so26866515ad.2
        for <linux-sound@vger.kernel.org>; Sat, 30 Aug 2025 05:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756556047; x=1757160847; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5ubcu185JxRyPLyMKOGW2j86hhYDLyAzlRdILh354k=;
        b=jlQcR14U77y6JQFwmIbSezwu+KldkKkBVb/O2YXmDJmLKNR8emBTTXdNt60FOynCb7
         GyF3XHNeM8F9k1ZXuwE2ve8Pi6LulORSQqbc1EXZprPKJ30t5lYayYXaKffN6ucYa3g+
         u88rOxwyYdWeUCAdyGacDlP2K0F5w9/ovbcCA8q85YUoA9tomO/paszjkTR3l/7qJGiq
         F7y55tgJb8sqIFOws1wErXrkEv2pwE/pxTcz8Dre/pNhN1OOjH+j0XVDzPk3FftTJDLh
         CDOs/k47lc15OkpLG7uSuIAxrDBHGw4CcxZRFd/M+HrnlvoKXy5l0QPLIZfBSOObAPdp
         zHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756556047; x=1757160847;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y5ubcu185JxRyPLyMKOGW2j86hhYDLyAzlRdILh354k=;
        b=JGxPVKo11YanmiUQJhMteVZSyPsd8BRfktJwHTdMcuffBw2MAuqsIKr5Ei/cjX+eDj
         aSLOGuw+1OavGGv+ueY8f4YdDm3EJ1ktqRhlAzrZSmkN+s13Pxvz+xXpsDrrUxy8H940
         wdrhQUC7zLqlvYcZ7owNgGPYZy9Ke6ff+h1gTqoLfcx+M3HrRXW6uKzGTjBsMvaW7dCa
         835PsSDofy4k5CIPM0uPPI3wOzcP4pRiLMA/Czv/q9gyonuau4AH+y5QLM4xxIW9eaaw
         7QSK9Za8ksNuA5zMB4SeWMaaHnfcOCV7AvnB4apTOUvKjp3XFpRrtc9NjYHs1yvtlaTC
         xE/A==
X-Gm-Message-State: AOJu0YxRT2DA3YvRmI10Acn9Vq2wML8oyvU4o30mrhsyVFcUS/NB5maC
	x75RtIRwFKlWSmXUe81o+J3+ty1lD2lIZiAYdLxV0x38SR2dkAcdPtTyIZRVaS8j
X-Gm-Gg: ASbGnctYP45seTytRER+4S+0+ljQzWzOO18flR8VmH0wnlD6rnYxa5Rq2yJK/RuSCql
	LBjKPvppROjGU/PiskQLYCA2Qjj6UtxBqbSMBGcc0kNyr6VesnvCh1xH62tVfpAMS2erUChGU1P
	HGdTqJOrADG+nqce1++DRmA3EEnNCxmLRxKNM7YcYYMpqThMiHTF7to3b+ToEVtFnMPogykFxQ4
	T2vTe3NfftDOx06yzLji6eM0ACjg1uDF+V5hDygJAc8rcLaATTfVj1sV8+Ja93sF7LXhVhTxykB
	mr+Bgmk8XPw+l2RRAUTpavQhPmtZttZ2HWlXNwaWsWh6UCfUdYmSFD7pqUX+whr5ClSp5QdI3Py
	Fg0s3KOytB492zYLbuEsBrygqUBOpNM8d08gMaNKrxMT6M4gskYbUjoY=
X-Google-Smtp-Source: AGHT+IHlBIEG5jGsBrxgOaH+PLJLddX50N/mkmMq/2hbmNW5If8XFH9KZ275KmEdPF050Hx9PpShhA==
X-Received: by 2002:a17:903:244e:b0:249:3eec:15bc with SMTP id d9443c01a7336-24944a44010mr25128735ad.19.1756556046981;
        Sat, 30 Aug 2025 05:14:06 -0700 (PDT)
Received: from [192.168.0.244] (ag086118.f.east.v6connect.net. [157.107.86.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24905da47c2sm50308445ad.78.2025.08.30.05.14.05
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Aug 2025 05:14:06 -0700 (PDT)
Message-ID: <797f63ce-17da-4b51-b9d5-2228d67c6d70@gmail.com>
Date: Sat, 30 Aug 2025 21:14:03 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Content-Language: en-US
To: linux-sound@vger.kernel.org
From: Kalvin Lee <hikaph@gmail.com>
Subject: HDMI card is "dropped" on resume
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi folks,

Advance apologies if I'm in the wrong place --- I was directed here from an alsa-lib issue board [1], but I'd appreciate a bounce if I ought to ask elsewhere.

Since mid-July or so, suspending my device causes ALSA to "forget" about its HDMI output. (`alsactl monitor` / amixer see the card transition off on suspend and don't see it transition back on until I activate some workaround.) There are a few additional logs pasted into the issue I filed via Github [1], but nothing major, AFAICT.

(A simple workaround to prevent this is to leave audio playing over my HDMI output while suspending.)

Is this a KI? If not, is there any input I can provide to make this actionable?

Thanks,
Kalvin

[1] https://github.com/alsa-project/alsa-lib/issues/465

