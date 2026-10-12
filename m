Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F80D318B83
	for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 04:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791779581; cv=pass; b=Wu/2ZKsFhlq9tYPvQYG6alHkGur2p8D45cHFt7RViJlUmBDiMtwKKZeCfp7ix8QPjrrYstuLn05JITJ4vKG4Lb15BWWHzbBIdRz7AoBDNo+KKmE0yGVUcsP27InYDqRPi2rjQZP0AzNiNM+vuw6xjr+3PdDNTyfuQK1JBjm9Na0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791779581; c=relaxed/simple;
	bh=4vtSZvaiOp1OqQGi4U/HKTevnlYKYeixt/Cf3xR855w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sp4RB38eM/0tq0aMyGehcI5FF7qjSXobVREMSmWg15eG1fwcFJyTyv5liggwaxCSF2ZCuX6L0Eq2XVF4JQLEKq3Q5XCe7eJx+EiEzLpCJI042X5nWfO51BXbso0B36gzVdrM4YenkmrJUwyzfeAQZYenMA5CwnmdUS11eGRzNpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9mwUMAQ; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9mwUMAQ"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-884062f3296so1014298b3a.0
        for <linux-sound@vger.kernel.org>; Sun, 11 Oct 2026 21:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791779578; cv=none;
        d=google.com; s=arc-20260327;
        b=GIoZMLDMr/C+eLCuXA92ARAF3CN2L8/69dUYBT//HtMBH/0Z563Nka7T2j2uybOx9x
         fli51Jp/HSrxVqYmYTrdvufUeZnGYVF5IizmebdEU090ilRRasefPCAaAlvuTaY1MMJJ
         PMylN4MGQB4rVHWl/t342rHlBbRMkum2qSvwV83xZdix4d49e/KmvVJSdz/gYKhruHe2
         rupaZpcCrckyzmcMVTdAp8RT6AkMl5HC1BrrX0wHK1bP6nNyvOq3+CxVWqfWnuh7TPfH
         V9nxaSMiyqfK5ysj11WhyJojasadIPlCyb1RzMoc4QpxtknJzeVeKzkuwgnfQUejGFad
         Sw9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4vtSZvaiOp1OqQGi4U/HKTevnlYKYeixt/Cf3xR855w=;
        fh=z6z7dPmy6+G/0Ekqs777a3ON8xPol5qwBO44O5anmqI=;
        b=Z41R2W2h4aEb9lmbqi7PCp3eAG5jAiMjqldvb7x52AgE02CaxB0TcpSQdvv64L20FC
         D5c0n5PDg3tHOYA/dPC69V8WyF01LRJ7+KfYDjrEdyOmc+6n5V88Rfgv2JPXKOJIFW86
         ajKpQNSgHmnYWIdBmZIfUQ5G+dAewcN2EqPbMEjYBHSFkjNTNDtJDK2tYllbGjwWnOYl
         IkZYC8XGWBL2R5zafPLhgIIvk92zN/DNfRR8MjDlwMogKs4eDC40EUGaF/CdVYHXxVof
         Q+WjWi+1ledkEYFVkwMeXwJnfctzH+H+aIGl9Hi8Vm4pacKWoN8szmfijmGwfZwQxr6Q
         m7gQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791779578; x=1792384378; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4vtSZvaiOp1OqQGi4U/HKTevnlYKYeixt/Cf3xR855w=;
        b=O9mwUMAQHfYwkh3y4UhmxjRwW3Mwe/llrellpRvDQSH+SvtnneWoKow0QRzh+D9x02
         +b6/4th60FUUi6xszCf9e2V6Hs3mpR3216Gn9Qbu477dZBf9zv203R4HfGLBPqx2A+sU
         GBJa99+zu+sBb3ZM80nxaKGi4+JRHwR7YYXs7ORMXI18oXQwe9w2ZSLPvRqWTbM9UT5C
         pnkg5h9WkWAjPrpqzsLTHr37kvbOM5MQdcpvRI+Llwb34FbaXSOyskpy/mKA+1o22PsD
         OUf43KVw4vrRjGseOLtSyGBgFAbXLGvEL3mqCb3W6IQI0ziZvlq5x7pXrSdnbHjhjq3w
         oGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791779578; x=1792384378;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4vtSZvaiOp1OqQGi4U/HKTevnlYKYeixt/Cf3xR855w=;
        b=sOn4MDt6raW/3ybgN9prie31rd1n296vN4ua9l7pj42AC3r/w5qtOAatJNe9Wyk5Zb
         jlyRiq8duN5vQHyzYyEdHhR6F8oAbPUB47bHdT7Tbl0GZMq5F1Dj96SnZ9Gv5XRJ4P0z
         HCZZ0h54tYu60atDnf65z3lTu770z4m2vUGf3V0pWfm66clFYdmteRrxxfOQAZjexWPA
         jQR6EYDCKihJ1cIEaR5273omJF6+Lx6TTaTK0cdfmN+BoOiPeZ4qmk6ghuECK9vq2ybg
         cmLYg1BdSI4/3pEr3attIboO3vIj65kI/14Qb7io6uQndiPnmvdo9Qp8DFJw31kKRLUk
         pTGA==
X-Forwarded-Encrypted: i=1; AKwUvBwK4bfFmiwMJeKecK3Iq+cY/KFrpUuVyEg/bY8YZ3VV0k+yt9T6nG5+TJb5lzxoj8yy1GtknHSMOGnfHQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLzIm5iFimjUQs/r39ptOTIeBRFmpYKKn9yyhO8P3QZizzFG4xW
	NsZbdSPiDTIEhtIobI8T27ZWleWsPymVYNzK+gJpFp+A7g/RSMTdJtiieyhUdX9eDxm2L9FOXdn
	lgtT9z6fGJbq4ZlnE/vPvg5KkT931Nfg=
X-Gm-Gg: AYBFou2yH1IwX/0nGy7phhUpVR46urFpS8MNZ6GTs/KC1szpQucDtl5FQoSCbkkoN07
	RyzB6R/ukgWZOdQyiEyRWpcm6EU9fmUkb83RQ+89s4c5zbGcbmzYDdI4OGQAE9ttTCWKT9ZttK1
	2QB+b+tmOum8/9kYxi//FvBOFzZZI14i5kNu19C9ul9e99YYMwi1vKluqvkd8G8AcE4Rdh2yr38
	xl+IP92O7im7UY9Jnz4DAO7b10CUIUnNNe3OejH8a9BRPkX8eXRNmJoSLGsmHsbUxusQ0eoM6e2
	GYbXkL+txd9uHd02AUlCbREe1OG7TfeSM7BxWOTL6W0/gArYUfi+WbuLQ1rL/qvA3PWhzPqLFsH
	dsNc3vnZaFV01/NEw/p+GRB7prjMT2E1FLhiuthoveqNxIiGXuMQ1y9vOMlsvR1VK63A=
X-Received: by 2002:a05:6a20:94cd:b0:3e0:ee68:77ef with SMTP id
 adf61e73a8af0-3e16bed300dmr7097496637.59.1791779578511; Sun, 11 Oct 2026
 21:32:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011221350.1690703-1-aliamemis@disroot.org>
In-Reply-To: <20261011221350.1690703-1-aliamemis@disroot.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 12 Oct 2026 11:32:47 +0700
X-Gm-Features: AclHuK9qFT-Zbd8AdSNUSMznPvdN-iVb15eTUFiLiBYW4k5-myRgwjK8jWKP-84
Message-ID: <CAABR9nHp0jL2fQ4w6rkd8Avfj9eD2=05TnxOYeOqGDWDqD=9jQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: core: Use the allocated major number with major=0
To: =?UTF-8?Q?Ali_Ahmet_Memi=C5=9F?= <aliamemis@disroot.org>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ali , Takashi-san,

>
> Since commit bd8f21876189 ("ALSA: core: propagate actual error code from
> register_chrdev"), alsa_sound_init() only treats negative values from
> register_chrdev() as errors. With the major=0 module option
> register_chrdev() allocates a major number dynamically and returns it
> but snd_major and the devices still use 0. The devices are then
> created without device numbers so no /dev/snd nodes appear and sound
> is unusable.


Note that major=0 has never worked, even before bd8f21876189: the old
code treated the positive return value of register_chrdev() as an
error and failed with -EIO. bd8f21876189 only changed the symptom.

So this patch adds support for a dynamic major rather than fixing a
regression. Takashi-san, is a dynamic major something ALSA wants to
support? If not, rejecting major=0 with -EINVAL might be simpler.

If it is kept, the Fixes tag is fine since the patch depends on
bd8f21876189, but please mention in the changelog that major=0
never worked before.

Best regards,
Phuc
