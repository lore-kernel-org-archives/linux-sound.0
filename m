Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C754A14BF92
	for <linux-sound@vger.kernel.org>; Thu, 31 Oct 2024 16:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730393004; cv=none; b=VnIqSsMr5L2lmy8yTmXh6uN2oDlZtdRzR0p7PytVcAFmOBw32fQ1r7O7o6MBjkNnty2Eef4iX2/Lg7c0/DCxDKvVhQANz4rUcJSjtQ9Y5s9pdZphFP90g7evIqa84M6xP+qhy7lkuckUaSIngXKn/nUMemt2v9dfjmX/Mj6rn38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730393004; c=relaxed/simple;
	bh=x8ofpP0SyRxeFJstmmtlxXBuoY2UEptwbIjDkDMfFac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ol+JgSFj0J0cUeJ2N6sqzZtmJA4IUUGhpgSx2koh4MeuIWhSCTvqI/reuoQ1BAzppMEKCO2CUPuu3q03DvpsYoWHApx0TorcTDkrRe1YMBIby4VS5J+lS2+4/qmf1yw2MT96AOriFzetMmHo3Lc69d2uPy+CmF2HtehREhm938s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMKsNYrE; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMKsNYrE"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a99f646ff1bso136795066b.2
        for <linux-sound@vger.kernel.org>; Thu, 31 Oct 2024 09:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730393001; x=1730997801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+a7AABlQZQW79PyRmlwotO4VO3IWVREnquqR1sMDHPU=;
        b=bMKsNYrEdWbYqJybXCH+X81nei8wstWJqRtGyfABIBvUSHxyOdtss29nHCP/S8qdMi
         8PK0qrsfGPzwH9fL/Z6zXvpK7OU8qvRcoQ9/LyHgv/fjFNnSr1zePWMEcuDNBFBWW2I6
         ppuludN/UnROyn4NCmw7aV/FnYX7rTiIEy90UCkOM/biAcYeqL8FVRTYgTdmiieqs96e
         mc07CZggcHZtbxflj98ttZ+qYpmA0bfsyeBrZTZb3YvI8g4wxBjE0tCEJLNrp7dyEFyo
         xdJNHMJ+JqFKVV9t3Lf+fHfW62tX/oGbigBTaCKPN1TSeP5jBFaXe7h2TLs+yjpqK7Rc
         z1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730393001; x=1730997801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+a7AABlQZQW79PyRmlwotO4VO3IWVREnquqR1sMDHPU=;
        b=g+5RILOIoqK1mSwoKDrfpo6xBtd9RaAjnKeaP+4m/wj8KHFwpJ0XZ5cm5aKd8ilWjE
         YRX50PvlckT1IyUpcgZk2DtvaIRfAy0VxF+JPZpNsXhv5xVKo15JMrCvo7zlnHZ56KS+
         x1Kj2/PMFfePZR7gDSNOPGzwnrT2sUY+G0xPjfnim5oRcO+MQlhnag2g2DC7c4cxwPhi
         MYtvj/SAzig8a7WELuudMGKmu1DzXgdMyn2EfvjlsshxveyzJPtA0r4LL2nFcvRQhgWw
         lYGuQqdghPLIqjh/Jex1whi+6K2ETZTfJFi/DkXkEKGKs0MjgK2GaptI+ljc9FSiCpcx
         i8zg==
X-Forwarded-Encrypted: i=1; AJvYcCXZQ0Kz8lsJwa1eTPAMl36DFAtvloOtv9HXKvOnoiV3sWEaNy7cPtTt0USAUKLwzXimo5TwE6XWBgrGjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpNf94fZMklMAlAd365LOJKUOOOpLZYN55AUztMTJI+n/NstCE
	yh+m9FBHavQ+q6pGZATHuQTco9Xoh8C8Xv5If9accDx+8y08D9mN
X-Google-Smtp-Source: AGHT+IF906bFcCavW1JbIZe33Bw8x/FetUTqSjFrLpkpMYZiCnbMvX2pPHI1pueVdD/8mJ0+0GLFCg==
X-Received: by 2002:a17:907:e88:b0:a9a:16b3:7dda with SMTP id a640c23a62f3a-a9e3a5a0e0dmr712515166b.19.1730392999777;
        Thu, 31 Oct 2024 09:43:19 -0700 (PDT)
Received: from [172.24.224.254] (adlk52.neoplus.adsl.tpnet.pl. [79.185.14.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e565dfa75sm85244066b.136.2024.10.31.09.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 09:43:19 -0700 (PDT)
Message-ID: <5a5c8b8f-13da-4024-895b-25a1b9040a5f@gmail.com>
Date: Thu, 31 Oct 2024 17:43:18 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Fix beep notifications by Thinkpad's ACPI firmware
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
References: <20241030171813.18941-1-jaroslaw.janik@gmail.com>
 <87r07wws4j.wl-tiwai@suse.de>
 <5683a485-5a5e-473c-a82c-d5c8817742bf@gmail.com>
 <87o730uttl.wl-tiwai@suse.de>
Content-Language: en-US, pl-PL
From: =?UTF-8?Q?Jaros=C5=82aw_Janik?= <jaroslaw.janik@gmail.com>
In-Reply-To: <87o730uttl.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.10.2024 17:21, Takashi Iwai wrote:
> Hm, so the beep works even if the HD-audio device is runtime-suspended
> before shutdown?  Also, beeping at suspend/resume works no matter
> whether runtime-suspended or not?

Well, to what I recall - my (current) Thinkpad has never beeped on
shutdown, other than that - without your "extra muting" patch - yes -
beeping in every other circumstances works no matter if HDA controller
is in PM suspend or not; this is what I've got used to for many years of
using Thinkpads.

And one more thing - with your patch - beeping is not muted on my laptop
completely, you can still hear it if you are in a quiet room, it's just
very "weak".

-- 
Regards!
Jarosław Janik

