Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D7B463B6A
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 14:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785852183; cv=pass; b=FL/Y1LvngBx0Y7GS2/9SNMGzYTlx/9I0mMB+RXwMfaY1lTeGWLN6D6mFPozQjsweMniibI9iJ3n7CoSVG/DGWnkRN7laNCdbk2JriOxy2hGvmA+f8ZHmTTmjt+GIafZVFw/J2jgMi2eYKW1c9FtkbUSWOjxBh0wAEeLzY465u8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785852183; c=relaxed/simple;
	bh=P5scZ6J5xDN9yEl9AQQDaHeu4mkxUBenPxH0xvTaSlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fijJIGkV0o8f86OCjqVrSXc3OmiVXHnH/whnwU52BNpp+p+zaDYFNe1rNne83HcvV8DJ6JDjyufWmwOVczrvR2FfiadUG3YEc0zqEJ9joYnZskUo1uQqYGFqyorfVF7bUc9FvLEqHqAclBFxXDXiJxGg+TNQ2Sg9Sbdwk+rqJFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hrmRqGqp; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hrmRqGqp"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c99eaa1f020so4502812a12.2
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 07:03:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785852181; cv=none;
        d=google.com; s=arc-20260327;
        b=V6b2Nqh6taNMNL0/15jlkYeRZUbC3zMmIZIIf5HG5aMrq4U1gJXb4QyNJ/VtUBYwhw
         Eak0GXZXWPk3BUFkrqDCR3TVz6a5i9eYS+tSt8KR4B3TSGti6OL3K8wSbG/FEGS4CNhQ
         mujoRRFDub7OOStkktpkKzLIeSClybdvMP1NPCh2Txl+qEYlKqWG5t9s4TsR+TIGWC8q
         Wjot8daFxqcPFpwtLXCIjB6MZVc9Gq2RPltVWc32BAAP0lfzCwNiga94cb3EGXrAU+8L
         i4HC/Kurk19ykpujI6NxnDUyBs9qhvwJqTXcx9MEHWSaO3IYoNj1G1aeiByYVxBrllMb
         gwgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=P5scZ6J5xDN9yEl9AQQDaHeu4mkxUBenPxH0xvTaSlI=;
        fh=GZIeDYatAXZkZov1S/rApON1h5hCvx+iEsDci9k5IS0=;
        b=XGXnLW6a7gbEvGFpAosw1Px9ikyXvSlSWT6Z4dltwy3pkSFfhpa8V9/mms1odnhTER
         n6O4pxQdVfYIU6ZNiGBWfI6BBa3x6LsHvlJeiz69GkWbtLS1tX4GyttD57/b4wKgk/9h
         E5dpqp6b2UOKEjvNS0ovNxFG9jfTXXcMH0oLO9Iq4wYo5rZxtH5+xpycGepmduf4tcZ6
         I4uNSXXBncCNmm1/8x/NITOJ+4wtfBWcLv53lCt12k6TNhx2jcIQ7Eopctqkt8NCiPVQ
         b58sw++ikSY3UJpgwdEog+rjO2kfxht6EoYxSKoNaFvm/bndqgzXi8uBGS3OKqx51ZKa
         NzHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785852181; x=1786456981; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P5scZ6J5xDN9yEl9AQQDaHeu4mkxUBenPxH0xvTaSlI=;
        b=hrmRqGqpdonBBd68wu6lX0M9cVWsLsMRK+p1OzS7e1JrT716NsOEnFptMcMxGx3BFA
         Vnam650+0j7ir1OaeHH8EUx42A81cRDupg7uJld0wYHLFcaC8PT7YWC4QAUQUEqDA4pB
         5y8ksJgKSMtNQ5rUWUmtPvbOWWOv4Df+GIvV/Ysaxr2KL3zO9D2IWrFMAe3bw4ScLNk0
         M+QcCkbuFAh0EBKIDdxEiun7yowQwac/tr6lw03TGqKpWgz5QSlEPukjiEg6shBfYnNH
         8dADJwHMYnX8kdLiWNcOuOvIFw0srqmD4iBNhAk+ttyiTacQPLulJKSMmtPnZFeJkC/T
         /xZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785852181; x=1786456981;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P5scZ6J5xDN9yEl9AQQDaHeu4mkxUBenPxH0xvTaSlI=;
        b=Sv2fVe++6L9I+rT6qbmMrqltPavDsgnfqg0sUEw7/DSAi6HGlE07AfUtCcgk8ZHg1i
         f4VG/GvvPYEA7XUmys3rlAgWMgINl1zpvMqy8IwbzR7B2eXeDVJ0xAtUnav0PKFYOEJW
         kOCAwPNm/fAhtv7p2WVZ8+S3fuhrDMDrMB+t9A2Zx9mmMHQkxD3e9Y+nu7xj/7j3Be+r
         x78LNOWl/0HwCz76pLd/4X7FHKAsNXPDtxo1q3Tsd11Bc4Qv8fNRK788lgmGlvPJXEcq
         MqpPd7nMtF9DUNw+m1IzF9GSe4CjaQPTAMwM+blsPI/IeB1yaH9DAtSogpaMent09Ows
         s7KQ==
X-Gm-Message-State: AOJu0Yz/uZC4bKhVst0VPZtMYesc6wkwrO7TrMms8h5oqJIf4a7s9Lel
	O69IZx9lfyHIk+Qq+6yXclghaB+lAEQcJrf08cYlXNJ/DDJFaye/YTLHaMxj92dzpbqH0ZDaUYP
	+ew7y01cF+tPXp6f6Cfep9IIzLB56AZ8=
X-Gm-Gg: AR+sD13F+Yh/DcRVvtJA+IghNLhUHyq2MtnXRynxat/XnnjWJltlUSCTxtGxhBlGFBg
	FK/6Nhr0Rk4kep0DvZukDJ2IeDQ/ABi7CtgJjki+0P67j8aL4P9fZDybwjC3JHJ+par01c5iid4
	K5sAAVh8j4ExfY66dLlo3A0IyqKtczd0Az7YZP1jF3xP0vs/drslFHaeN9DdoXLNZHSyiHCjli1
	MdSXvvtGB36M8KV5OIr8Pd/e5i3/Ccu6CmLO6bu+oEwKnGWppIhXoa27xQJTGgA0n89KN9J9YPF
	DJ922h35c2YHoNBQRph5qvkOKvXHiN/AS5Rrht4oS96Jeyrq77GwLgijpc9ROdi8/8gL2V6e7Bs
	/LLaW7XCF2hsZtGd8jqWIjvgklEVylYC3lOOvP3GdIsY5sbGXSnmXQP2euHfrsdBULIrGp61M+Z
	dQtcRJbqZS0TVXs5g=
X-Received: by 2002:a05:6a21:687:b0:3c6:62e4:91eb with SMTP id
 adf61e73a8af0-3c92a5e1641mr15324294637.24.1785852181322; Tue, 04 Aug 2026
 07:03:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803102739.55569-1-phucduc.bui@gmail.com> <f7c2eafb-84c0-4c4d-a359-8c80ed989c24@intel.com>
 <CAABR9nHynGR4TjdpGW9-sjEC8p1x4D8omq8ouPR6E-3ifDhBqw@mail.gmail.com>
 <61910d04-6f6c-4c99-bc96-397163cfc31f@intel.com> <CAABR9nE6Jcfkj94ABPfyua5bBjaqE-ZNQp43uHc5d8fo_Xu-1w@mail.gmail.com>
 <1b19ff26-235d-4715-b7ff-0bd440ed8da6@intel.com>
In-Reply-To: <1b19ff26-235d-4715-b7ff-0bd440ed8da6@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 4 Aug 2026 21:02:49 +0700
X-Gm-Features: AUfX_myXGu84xYS_IQh_bYFhLQ2vaAijoHar8y6SLZB2yyMlywwy2reqySXm3SY
Message-ID: <CAABR9nHA9oTuTYa=FMOY=vsWaajH+ZFdHX+pvzqViuZeyfv1LQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: core: add snd_BUG_ON() check in devm_snd_soc_register_card()
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Liam Girdwood <lgirdwood@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

>
> My message reads: translates to WARN_ON() (..)
> And WARN_ON's doc is what I meant.
>

Ah, I see. I had interpreted your comment differently.
Thanks for the clarification.

Best regards,
Phuc
