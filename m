Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E2E44C657
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 19:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057221; cv=pass; b=QhRNnQHyYQdxkhSOWhz4KrvdtOcD0Sv91O5xXJT/i5jh1WdYLIRe2MTzJIS8N4V7McO3Fsa0yYgC70HzpE1DJ8tCV2qcsw4E5y4FHkrcTNRB0I8FtIPaa28pOgenfgtQppiRfveldJ3RFafqv8h7RMFAgvSMj7RsqIRAF0fmlzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057221; c=relaxed/simple;
	bh=IU0NBA61woHGXGeQi0zmH9m9DNZrOjegNX8jk6Ftekw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t/GCjeJruyzx1sP+k5DzR4bxMH8ZxVnuJxGDi9jcGESoZl1gypmrDjP8odnD5s0dicMdF3zwyemu+l5Yg4yIRlsKVW73zMZFVfd4PB6qAYc1/M4t4YfOUqfqUEqJ8SKdTECUK5bYXsZvW8T3J7eR0KQUT1dLEuLroSh5dssAidQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Gh10ET3F; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Gh10ET3F"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-664a09bc459so7449907d50.1
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 12:27:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784057219; cv=none;
        d=google.com; s=arc-20260327;
        b=JF/FcDW1EdvEq96i5kZrPq1blmmxrpkzdYMhjrEYjv0Wkf1n1xhWnMciy3NC3Muz/8
         6MH0BYRS2WfecsJme7HAMl6jEimatL7yn7BIt6+dzKe8gi9jyPU0Im55jIPjSj6jqNcM
         Q2hV6aGzDfzg/0qMSKROL/lDkEKzwtWpepUHrg5/DV596ak6ErpGr/KIArsdAIu5oYzS
         jOILs+RDvTT+sqBQRaPO79OHew1bSMFLnycv8VNrrSGX69ExVZ8UaL6cDxnFcVbSaT49
         hsRozvfm9VogvOib0IJCqx4Bjn+W9DbjdW4qUpcR17TsblJ/yWbmvqCEOhQ9Id3Y0tEe
         Fg5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IU0NBA61woHGXGeQi0zmH9m9DNZrOjegNX8jk6Ftekw=;
        fh=QILqXJmeHzv/U0EnnMJs7/nAyI5QCeQQu4DlScbhxmY=;
        b=JAGtLW7j2KzfK0/FU0lS/5D2pmI+GOtkUE8e9v+N0sklVl2NnUMRFq2if1B0EfH7K3
         LUlr7aD4NKATfhdkk7S/G189kGrVgUk/by45evZkAN6mGvrbZ2pM/nra7qLMGGF5uum2
         7zUiyXV0meaG5Nm9qdE59GWsdCsH5Mv60OGOqkrlFZai7Efo5T/9Cqx5GofhNOfsmKQr
         fkR705msNcvRkHVyf/dwUAiL7lM8MxONHSCpSeaG8rp/icw33b6MgHYG8/MvyiSiJE6M
         290B7VJ7TrpQtlYu/8BXwvlyfHKAIUDUiHpriUOjOe+C6eLgIWlU8zNwEPsSqp6iG7X6
         GxOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784057219; x=1784662019; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IU0NBA61woHGXGeQi0zmH9m9DNZrOjegNX8jk6Ftekw=;
        b=Gh10ET3FlcGEn8kdbB7QQyWa66NxfEIgAMPGd0EVvD0mhN48KFUoIwYceO3pZj5vtY
         piqLj0xmjX5aGSA4UjpkyzkIyTimnA7zlGvYgBcjCLgPmdByb7eTrn1zkwg1MkyKPQn8
         4AF3tGr5SMnnIgRaZHn0TI4lrOCHzAyZARamM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057219; x=1784662019;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IU0NBA61woHGXGeQi0zmH9m9DNZrOjegNX8jk6Ftekw=;
        b=qQhBySdtqo4b8nf0K6jc2cWTWZO1TzgCx+wrr/o0MqbHM+xKAGLU7W2li0X/bFuBnh
         Q6q0NKj9eGp4nI5TGJWV4MhI9/6jSMzYzlglOtExJDmisIm6Y4YWPPpDU2WnYnvmYgMy
         BGslG4r2dHlzeXe3j++sOWH85VcXXLM/goNpOO1RVth9pmG/awc2cW2d1YyNq6m/Os28
         ml2IqBwMC0NoplToUQCsTcRMxHiDMI6u1lbc4c+LJF8a1mzFab64rNicrPvGhPp4xUiV
         /pyQVSWh824Efkb4wH6VQJGf44v2WxR19OL7JpRPmyt04Gpl2y1Axt8iTUt3jX7Eu4bM
         ImdQ==
X-Forwarded-Encrypted: i=1; AHgh+RolVc458iMskKCtU04tp1nt0JQHHwgIHlGSmXhpMiT2X80fEfpl+ocUO0ZIVrT/Xhyan3a5IUI4TdrV0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIGfst55SiVy8g87t5kU17XHtzSmoKjVEuHReJ6B1fOLOqPK97
	+qx0k9MLCMXkVWiMF3VacM7qZUs/9XGBS3jjqQnLPF/i1oyH0mEFuHcXpN1Z+gEB5358rgPrZam
	psyxhY4YeW1MtyniAIeKLwGs/PZuXMpuH/gmxZvG9
X-Gm-Gg: AfdE7clW/V4Ovkms7SHHqs5ofVjvjmOmgmRVzfKJjKc+3r8SnZOZmZN06Nye28DsH/I
	iRW0qx1thkyucT3hwXiFm50tE+7p7khRF+Ok9UCA3YyQUgl7MFZM+9jE59iet6Plvn3NMkDJ7Ys
	yk8oM10BSZqFV0iLoYfm4UJwAQjluIFwBC3NqI97PXB4gWIQb3WMqmOh6Ar9S6kL4+uOJ1gISNQ
	P4fvcpG71SLuyTaaV82y1nvIT7r18B4mwq/g1OoCZ/TB1VnC4S7zZMCy4rCi9riFhSVeOxCNIjb
	cum2LUoi
X-Received: by 2002:a53:bbcd:0:b0:667:e855:ec85 with SMTP id
 956f58d0204a3-668132331a5mr135355d50.12.1784057219670; Tue, 14 Jul 2026
 12:26:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713-fix-headphone-plug-cirrus-dell-v1-1-3c5157cd45cd@chromium.org>
 <6cebda31-08b6-41e5-9335-a40ce2744d29@opensource.cirrus.com>
In-Reply-To: <6cebda31-08b6-41e5-9335-a40ce2744d29@opensource.cirrus.com>
From: Steven Kendall <skend@chromium.org>
Date: Tue, 14 Jul 2026 15:26:48 -0400
X-Gm-Features: AUfX_mwTybnZBZfX96USMQd9m5bOR04Eb746jcDxwXWEIddDvdgzw0ClNFRKsq0
Message-ID: <CAB1bpFAXpjRYgc1aeCZo3vhbRq3zsCL9HjohbPk-ESx_8ia5JA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/cs8409: Fix for Dell Cirrus audio jack detect
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> The original design on the driver relies on 2 different interrupts, one for Jack Detect, and one for Type Detect.
> I am concerned that these changes either prevent the interrupts from being enabled at the right time, or enable them at the wrong time, and possibly simultaneously.

Thanks for the info. I had trouble getting these interrupts to fire on
this machine. Have any advice for getting unsol events to fire? I
tried a few things but wasn't able to trigger any and resorted to
polling.

> I believe we may have one of these laptops ourselves, so we might be able to have a look ourselves, though it may take a few weeks for us to do this.
> Can you tell us which OS you are using to test this? This was originally tested on Ubuntu, but I think this is ChromeOS you are testing on?

That would be great! A few weeks wouldn't be an issue for us. I've
tested this on Chrome OS (Chrome OS Flex, specifically) but I also
noticed some odd behavior on Ubuntu even though everything more or
less worked there. Alsa wasn't reading the jack state as
plugged/unplugged until audio played. I'm not sure if that's by
design. I wasn't sure if Ubuntu had some additional kernel patches I
couldn't find; I was using their LTS HWE branch and when deployed on
Chrome OS I didn't see any change in behavior.
