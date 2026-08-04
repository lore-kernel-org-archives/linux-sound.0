Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5483D8104
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 21:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785880522; cv=none; b=TVpo1/+0X8aXnd9LMhabTacm4WeugDcAdQtauE/efmGkZcYS0y0ETiKl8Ciy4U6NZQHrtIMIbPEFdA9RNLbXaTS2Vz+9xacPsQovlc+FzeOxyVJ4YyTxCJfCF9BxVgO6iJcoqalL42FNoYQUhkQ08l3uKWcIiGCy9UnWqmIW0Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785880522; c=relaxed/simple;
	bh=VcXghrAhB28hZ63JHc+li4VuYTF9Q4tapRVuVrwleyI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QnWnposBh4oXJEZOaEZ3hBGh2l4XXgEDMr8Vi+kDsUUUeoNLLzhvh8D6a8gz59Wjd9aTWKcIKyMXqmHWnZr3dmUk9KU2aVZPb/i1lahTckoROe7X8kSiTeKN4/4l/41OFjzxKXGs5dMXMA+BeoQhP0/uviTflRz0jvSmhRRQlCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5GSEToz; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5GSEToz"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f9ab7ee38so126194f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 14:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785880519; x=1786485319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CT5ygnFX3duegmSYoauH/2qxh9pElLeKq+ounJYqRiw=;
        b=j5GSETozw9zH66x7ZbNNdvGUy07JSracQlkCBPyg43N05NJ7MrtA17KKLC7uS5hIwa
         HQXcPgSgMoY/Mt+aRn2kcCoYlMgSFq88MRXXS1cS2E/BcEie4GAdfLVBPLCtMpKh2kr0
         RDymim9kZB7qaXSPwHQf2K73gZZL637HW4HvMT5RZJMYyraFpMQKRwTEsCTy+Ui1Z4QU
         +Wqnsipurox2YV+LTGiTaA+dSEy8LiuoE2GXu6i8c49JaTIHMceqrjhChEm2OYCokKg2
         V8eODwkJ6ToBZlZHvXApzrbA/YXhBC6EwGErL15RTsgqZgkIcjooYe1zBmp79LBzHdxV
         MS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785880519; x=1786485319;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CT5ygnFX3duegmSYoauH/2qxh9pElLeKq+ounJYqRiw=;
        b=CH6LphXc9Tc2Jv+i3DOC36gTZN+UWUpkxiV+KXXuGy7v/diGonpRHN0hu/YiTkguEr
         r4nV8NoN7WPeMewCeOD2zE9pq/jnP0EHrixVB86C2ABqs8EPQ1ny6CfhNEw1a9RjYBzu
         U84BDl2U22T+FQaMChZ9L866f6HAWvQb4xfM92eRS+zd3vi9fltphTWE6RZmCkqbvV80
         2/9MMU94R9tpLgaPge+mY/UnexFCJUnTKoCn8r4yjcoIgHAFr3kQ/+ylVIUKO/mFFwMp
         7KDgnxR8EwM57N1XnPa42s7/q7awUzQXsCn2FKyvMJS2fVOtMqet0mivwGchK+ePS4uk
         DkeA==
X-Forwarded-Encrypted: i=1; AHgh+RprNuWwzOPBkJfi6BT0MExxYZU0wi5jTCRTmB4aKKq35dNnu9GlZKuLE9wEOYGVCsziaz8t2K4zeip7Gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAe1qrTZzbocYBpB5/g3i7WJB9/3XngBeaTOueFJ8ixiw8gQDd
	dLyrF1cNvZ/gkHGQmA3H3pZTBIKIs3FUOhFnSLH8KUwkLHfGcp74P9jer11lPw==
X-Gm-Gg: AR+sD10XqWJjytcUiKZjVDLelp6X1y67Lkd/sRJ/PX1jr3qAGK7+uAU/bl7lsttPmxA
	rUN1zvSfZPNjM2lKs4slZl/YaH3hR//h0xskVw7oPXwzrKkSb71s5RkCBk3KtwaX4j6Iqf70QQI
	9RbHHNVsvJ3L/o3T5dHA6etYvsv8B5Xl/4E63KWrMw9371Q5itD/RR8ZL7C2qZWwUbI+KX0vFry
	nBZT6+Bk58gCdyZX5UOvmlMqOQawkVubogMKVp+LbY+Uzj+bzOmdyTkz7z/Um+k/VxbBEnKPPo9
	j192GCRzhVinqDy27jDNwIA5dYoO+SeDyTZc+e+Q1/7fYfCt7ZYsxpjh4lfi4zX+AuxAh+XVwKn
	7v+7bL31BnTY1rtuu0dec7OrFV0ccPMycaJKpr9EUzfpeusBuwqDd8WT1B6MG713v/G8RT4xEKP
	LzicWq0WjLQbhoVfuPLVedzhyJbvUlUEjLQQQgbnPQiVxKsrhnCAKHDdtMGQ+27Fl3O+21lSVIc
	jmn207AMK8=
X-Received: by 2002:a05:6000:4715:b0:47f:9752:3277 with SMTP id ffacd0b85a97d-47fec509a9fmr3964105f8f.2.1785880519319;
        Tue, 04 Aug 2026 14:55:19 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febfda0d7sm3340581f8f.2.2026.08.04.14.55.17
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 04 Aug 2026 14:55:19 -0700 (PDT)
Date: Tue, 4 Aug 2026 23:55:15 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Rong Zhang <i@rong.moe>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Icenowy
 Zheng <uwu@icenowy.me>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ALSA: usb-audio: Do not expose sticky mixers
Message-ID: <20260804235515.7346606e.michal.pecio@gmail.com>
In-Reply-To: <20260411-uac-sticky-mixer-v1-3-29d62717befd@rong.moe>
References: <20260411-uac-sticky-mixer-v1-0-29d62717befd@rong.moe>
	<20260411-uac-sticky-mixer-v1-3-29d62717befd@rong.moe>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 11 Apr 2026 01:49:04 +0800, Rong Zhang wrote:
> Some devices' mixers are sticky, which accept SET_CUR but do absolutely
> nothing. Registering these mixers confuses userspace and results in
> ineffective volume control.
> 
> Check if a mixer is sticky by setting the volume to the maximum or
> minimum value and checking for effectiveness afterward. Prevent the
> mixer from being registered if it turns out to be sticky.
> 
> Quirky device sample:
> 
>   usb 7-1: New USB device found, idVendor=0e0b, idProduct=fa01, bcdDevice= 1.00
>   usb 7-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>   usb 7-1: Product: Feaulle Rainbow
>   usb 7-1: Manufacturer: Generic
>   usb 7-1: SerialNumber: 20210726905926
>   (Mic Capture Volume)
> 
> Signed-off-by: Rong Zhang <i@rong.moe>

This appears to break (yet another) device, as reported below.
Not 100% sure because both affected users ran away to -lts and
appear to be of the "won't compile kernel patches" variety.

https://bbs.archlinux.org/viewtopic.php?id=314220

My $.02 - was there no way to deal with this in userspace,
or to make it opt-in rather than opt-out?

Regards,
Michal
