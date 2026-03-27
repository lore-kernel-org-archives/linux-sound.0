Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E7B3EB809
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 13:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774618927; cv=none; b=k0CU6Ogx/ThSrU1T6/szyaIz0LwZ15zkIQOpPrtJjgPN36My0Ype2/EoPNwDduH8BGRMrMKgvkM2ulLM9oLQ69dEZcEEnCt+tnQGYuuMRReiv5R5xRU+RE4iVlmcACXFGJ8zZZHmsqjJSqH4p+L8cN/0yNPCJVoXf9uHASlDppw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774618927; c=relaxed/simple;
	bh=Ox+qrB5YDGUO/XPQDjXf8/8oRKmaK1JQE7MGbQk10Oo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qIglt33dRkVwRMAIXfE9hzqml6ZUEm3iDNr/0q474RPS/L4XhkLvX2dFI2y2rQ+qT+CujQRl4m0lk79RH9Kf/+BcabnHS/cGygNdjmYvZUlWMOA2zwXtKzCl+TrydEooTN6qDzVZviUvszoFD88EKxlH+tXJ5Q4fCDJEtzOxDeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=As05xZkP; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="As05xZkP"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so20951895e9.2
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 06:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774618924; x=1775223724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=on6G/EASuxN7jWALPPtJ63hmpgur/wp36mOVxcX27EY=;
        b=As05xZkPRHkYVAjtEzgSw5/y/cYquPAKNvPnYGat6fHZEU+vbfCdMdnc897fAcmYvI
         Wkoo+ntwAiJTrAsK3vSqMQrs67kazxijqrqWbORo5u6/7rCVHl7T1xJgBuZUgikMu/qs
         CfQ0vUv8CSKp/ha0liNJTar1CKodCkxm5d8XAf0C7GIn7mqYuMbw5b1DYl+HbMuZUZYV
         Q5XWaIt1X1FZjADaoiOG6j8+/8rz9iLNsGJ0/JES2HbrOg8lk4JpDACaTIRbUvZjHJIQ
         K8iNnl1uymrkS8T25QmXmeJ0H15kgksr4u3S8stWR+brgjPKJXXNJdVJz+gPwPp4HLNI
         2Suw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774618924; x=1775223724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=on6G/EASuxN7jWALPPtJ63hmpgur/wp36mOVxcX27EY=;
        b=e/VqogtcVoF7CzscuDkb/UmXaInnSOuRG4b0mPqLqnhsZwznQ0heVvIlw8cxF7yFSe
         yEd0VHVu+zC0TYmdLYVK7q5ZdkxMc/xXyYhLDzYn+nP3BISxNtgM1D32OmqTlF+hne0t
         IGD4R3jUf19jtILH1SDFBIi3rWEE+Ij5Au0cBOy0ujnkO3wo83pHX5kDWZRCsdmai1FF
         Bo+1E2bZWh4wGrDqQfi1F6LvURiy9+HFOWUcLZ4PuXlRD2Tcz92stKYOeK4IEADkComz
         eWoYMLAYUdue2n/+q5DuncwyLVGiPUd+NrKp2iE/7SiDHfCG1plfr7cZBR1RVAFM+tGR
         hNWw==
X-Gm-Message-State: AOJu0YzD+XQ8ydxU6o8DQeHW4FUNG1T7D6zVqfrtDIiT8bq04Y5VO50W
	k/aQoSBOh8vPl522ieduJXUnXJo03D665Z2w2r2RhYZnlgMPpWb6SJa/9Vf6YnCN
X-Gm-Gg: ATEYQzywgDRnrPj4UNFJorcW/il4sObqUNMDa8lHW8NlEPGdfphs1i2jxlRod1IdAiO
	AP+XBigWPy5AVvQRKZ5jZ/iyxh6sc+cRyLBQPvmH3zQ8rXSQ2xkWAbDmXAloO/sGumHEc1Q2Zx1
	xrOyOpg9bzLnusORv8ie0wE3YxjUF73tHM5E97zpPmqotQR+0zTroj5J5TiT8W0xvx6QFn+QO0r
	ru5ut+DIrD6MlWuTg25B9iXlHHlp/wDpcj0KGH3FWGTHiauT/oFbR9st25F1kTHmkMwfa2fR7ud
	j3rM4GXK32CgcsEWVpbAe6P6O0LU6O72Pd76gjEJJkKlRQRkDsp3M5oj7MVDNS/o2O1bI/3go2m
	dYqXXRx7VuumVeDSkxp7i8ZtTXxgEHlsfCw8wFvldshx1K9LibdTT+6U/IRQdvu26Gy91fRao9U
	u2/jUaeJiAe3r11+1b4m6A2a2wra/wcZAt7s0p
X-Received: by 2002:a05:600c:a31b:b0:487:716:2fa2 with SMTP id 5b1f17b1804b1-48727ec3c1dmr35473225e9.16.1774618924289;
        Fri, 27 Mar 2026 06:42:04 -0700 (PDT)
Received: from linux-workstation.localnet ([5.133.45.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c9f0afsm170597795e9.10.2026.03.27.06.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 06:42:03 -0700 (PDT)
From: Phil Willoughby <willerz@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: USB device with more than 32 channels
Date: Fri, 27 Mar 2026 13:42:03 +0000
Message-ID: <2026703.7Z3S40VBb9@linux-workstation>
In-Reply-To: <87v7fjbsxm.wl-tiwai@suse.de>
References:
 <F1B104A5-CD6A-4A26-AB46-14BF233C0579@getmailspring.com>
 <87v7fjbsxm.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Thursday, 26 February 2026 12:17:09 Greenwich Mean Time Takashi Iwai wrote:
> The current code has even a lower MAX_CHANNELS (= 16), and I guess
> more than 16 channels don't work perfectly for now.  The 32 limitation
> above was merely for fixing UBSAN warning.
> 
> Below are ad hoc fixes.  let me know if this works.

This works, tested on my 34-channel device.

Tested-by: Phil Willoughby <willerz@gmail.com>


