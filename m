Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDEF6BB5B
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 13:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774616552; cv=none; b=hVnzbswgmV2YP874kqvNZJtFA4FQ5L4D1UrAcW/wQWHJWaLmZKuUeV0jT653SxPubnP1wCDPgczs+Oao3KnImg/9j/RpQQ6PcCE4MJ0Uk+0djlhqiW1MAy70uNJdhFeqces1Rg2GeRRaPnWtpTeARh3kZyuzyha5uJjmAQK4lP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774616552; c=relaxed/simple;
	bh=ekRqrmgO36er0Xs0Kt1pJg0O5rj/Ehdb4z5ngXmQuOg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZnU7Z4dOPNrQXMFSwFrimhy08ThC/XCHnIo1NQVKx+XvlmPdFibk/sp/Zn5030wjLeSxeYUWF805W1nLXxn3Q0o94jQxnW21+nplzTcQdlhWgx6+R4hYJjxhFR/nDfe3c/Vr4A7OzSmQr9VqV09YfaSAxxjpgiBqsi0ohq6rib8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cW+g76Nh; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cW+g76Nh"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so19032845e9.1
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 06:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774616549; x=1775221349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUqj/oygBBYW4RGDHbnaFnZl+BQlqdz4zEZhM+FMb2w=;
        b=cW+g76NhR/UrJcBzC2AKRGN13SkUSWToJB8bIg4Se5NTzYtAPA5CWbKD++zTEL2GlT
         KWwtF2+wyNZOvh/r9o4DItkMBcUW8RCIcrxKDbQjEIDQSsr7jq1yTYOYYimkfrLPWbae
         cSccEi3sf5/Y2/xl30pnHOJ0Lv4nDydglnALIctZ7QDCx0LAF/RmoSy0OYIvt5Mz8XyZ
         NB7X0OjcgmFYyM8NMB639IJp+FKGuQ8qqKmw3G+jDu76Gkk+fIsF2qOnJIY07gb2QOun
         T4t3zYnbEVhOP1sq3fkSHnT4pfQmgWKcDDMmnlhzBDlmWghNoBwhbpg7QEriKLtF0U/h
         zksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774616549; x=1775221349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rUqj/oygBBYW4RGDHbnaFnZl+BQlqdz4zEZhM+FMb2w=;
        b=LHadF1SXtD4KaogB3oc8hp7dPKc1cnJ16T9KF9upMQ3HkAaGc62R5/NGI1deYfcOLm
         cps61heKyE1nUWlDMlg+uPzyHE3qz/3yZDviuJnSdez3/mmNDhzYSZD2Iibo8LoAUiJx
         yn1RHzJYL62WImDOlJvlZ1pCmRibqUka8ypGczKDUNRlShPD6GZM/c08F3SJMd+pFi/Z
         7flo7GnCPKV1N8BB2K6BnWfnDky5gFK6mSPX9roKR3QTcF81c+pHF9IlyYCCv36y4uP+
         P2+X3nScaqaexgq3vXaax4r9bSo04yJ1PyFMy8kRI/4TZL0+I/kIZ9HywGkbLvsE3b3k
         IqgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUt3rGoAzx/atsWqiIS0n13yquX3dkvIxqwLFJdzxethfCIyNcmmvwuiBnxnIzgj93CFUaVXoYW+KZhVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEwWkZAk4gWT9CSETdsv9wFcXugfD4yuYx2+ApuVXicPSXTC5c
	6DVmo9aWinAJNOZ99iU7e4+5p1WVRGaxu/NJ0BlCaP4gNguJs+jRY3kr
X-Gm-Gg: ATEYQzytYEFpVA6QoanBoEs+jnphgVRYgqUNpNzSgLGe9e8uLghTRlY1fCp88Z1x+Yc
	rKXnVJL6g7dNHwUdVT30PUlmDZvfuV/bRJ9GFEW8LssWu0kLR0REeHcp/BbC4LtGwipaffSYBgu
	ziNdFRtDXa56pPqRTIeo2HdyDVB1mWuV3xV1tPM65lYQP6kWgDRx9/IzeNEON/09fq1q/iEINxI
	hiHUMNPDq9gHZkVDI7tu63fT/zAUw6dJKbYjxw2XalBvhE6jLSs1rMseBhsPHT3dmKHAyGxG2xQ
	0lGTHq22KFx1WjX2liJiS0qkNWjH0pPJjPBj357rzbId2ZDTxGvi7gkoW5TvaLxmfc6rpNaf4SU
	wDir8PKNl/ibTvFp7qhsbwwkO2FyQYalgI6UaZYLMeKrWUDQKnGcJ16vsaqF0HBPUcEvHA3yybm
	bb4OVGZleBydL4uH1iE1Pji57UCVrR5eoz8Sn9LRIHbCaUv3tJgHkJB0W7LFPF0dFp
X-Received: by 2002:a05:600c:8707:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-487290a9c71mr31192275e9.2.1774616547728;
        Fri, 27 Mar 2026 06:02:27 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487270ea4bdsm30210755e9.6.2026.03.27.06.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 06:02:27 -0700 (PDT)
Date: Fri, 27 Mar 2026 13:02:26 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Fu Hao <fuhao@open-hieco.net>
Cc: perex@perex.cz, tiwai@suse.com, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH 7/8] ALSA: hda: Fix single byte writing issue for Hygon
 family 18h model 5h
Message-ID: <20260327130226.1e239670@pumpkin>
In-Reply-To: <b978ca224f7c9a3c30efd69abdac5df395da63fa.1774595153.git.fuhao@open-hieco.net>
References: <cover.1774595153.git.fuhao@open-hieco.net>
	<b978ca224f7c9a3c30efd69abdac5df395da63fa.1774595153.git.fuhao@open-hieco.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Mar 2026 16:11:13 +0800
Fu Hao <fuhao@open-hieco.net> wrote:

> On Hygon family 18h model 5h controller, some registers such as
> GCTL, SD_CTL and SD_CTL_3B should be accessed in dword, or the
> writing will fail.

What's a 'dword' ?
It is short for 'double word', a 64bit cpu has a word size of
64 bits, so a dword would be 128 bits.

On Hygon family 18h model 5h controller 32bit accesses must be
used to access registers such as CTL, SD_CTL and SD_CTL_3B.

	David
