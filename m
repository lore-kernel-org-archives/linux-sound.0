Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218F330F943
	for <linux-sound@vger.kernel.org>; Thu, 27 Nov 2025 05:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764219989; cv=none; b=Gkyj2NPgc2Cer7TwCOUVFBf8bgPOvId8Gzb5CxCoJ92IUoD2DzzrA7m2k56KoF6+c+xqRJHr5hs8CMv2wierTzYImJhFo2oOX0IWzVg/IVY85E4bsR6R+PTVs0d9oioNxinvtYOiNxFgnf/sP/bI8ArzJvFpxkW3Q7W5dueow4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764219989; c=relaxed/simple;
	bh=NZc1MMWRCiEHE4LU8H56I28YXiDEXnS+Git/yidvVIU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hcFkAb/d5MSs7TJr+h0jJlBuXz027NDGog/KEOD03fG/ryTsBiMmVlqEv6vv9eQjt5bpB4RPVwP4RpSc5paCXHQqAlUftB+IZAC24bfLSgzJ0L9z06b7m7TJQYPlLPlLZQZE/W9VxzZ24Ol2unA/7ea3q/uSDfBs3rka632kHHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DeChBcbv; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DeChBcbv"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b38de7940so202983f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 21:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764219986; x=1764824786; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NZc1MMWRCiEHE4LU8H56I28YXiDEXnS+Git/yidvVIU=;
        b=DeChBcbvSoqhBdw78Zq6q5HTPSqdAroByikWoCenm5DY/uWkMsxz1sLOAmEGRYnhS0
         EffKN76r6TFfCww48DYy2thlJ8vaiSDclwecDLKSd2n979Ec9PRQaiLG0Pl8HTu4R9qk
         8P82uffGhG/CR17uzlWxVKk3Zv3OjU2AbtNlJ3MOGVdPSUf/jsnncthnD1qUDwJ+IYbS
         MqYdd5C8u/pYfwmKaorYZIhTqOyYHwYvLW5ASMAMO/5SEvhVSWFtRvvoAxzwzTU6AFIP
         QitvpZdB5D6G2ubDISk0ehUDwRyDTaO92gAnjEiobPqcgjYFwILCNsirjPgIYNVqha5X
         njuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764219986; x=1764824786;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZc1MMWRCiEHE4LU8H56I28YXiDEXnS+Git/yidvVIU=;
        b=Ml5Wco1gAOk+SIhRotUGyv8QgXrwxdrxyegsb/MEYgT2H4rfVlyrZZqxcbiW0Otc5p
         uLBIpmsOdr0jwmdldSNdBdxW5xdbSpVyN1B9tQPc3YXDSJsjDhz3oett/ZTCWt4jlVPj
         W+V0On5cH5Xu9E9QObH8prKP+ZznaZzmcpeaaLOZsF8k/nzoWkAxi4urdS8cYmv6n7PK
         J++egOuME3OcrGG+7ULwi9luQTepvssVSq9cgj2loElQfSb/1h5ZWJTUU3QunGUL0lMd
         VTY8Ag2CE4s2psO3lFJNA2KlKg2i5svAV1XFsv/TBf+g/6bCnbv4dPZRpRAtPySEWQeY
         /OCg==
X-Forwarded-Encrypted: i=1; AJvYcCWwztuGpMiP00h8BXVAkovPbY4igMyVGcCGTNUUInd91FrzWv1XqGsiXg6J4cXNWEnXHL2jlKc3icZnbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yww8a/Pywphac7OefFR4xMzO6FvMlBzz405xO7jSKLs7RlTKzOA
	RQOH5/4RwyqCyaIdjI3AiaRoKOnNvBCfPh6mnZopEfkQzoXXTX/wKBtt
X-Gm-Gg: ASbGncvYR/YY/+prgKZY4Y9JtCbd0Q8CEtUKsmSRrJp9mz+wl6D6dI9SLPbj2h0akxV
	gvJWDsCviVdcTMMhbjPMYXlDs+h9MXiGNnuGU207wf2cDBNG5MCdw1H+KVaHW8ZzWZs/bHAhB+X
	/P9a3zy70vNfkG8ETfsIfQzY7SbeX/czWcmThOlG709RXaCSF+BftSxuS0f7BwsTJ3g0bzqcyqT
	Pq8sCn+V79Qq0HaTcI9fOZ8ZWHjGpaG03Zd9P/3KK6ND0iLgKNmOfmtyCo/3czuq5tiwc6jfHwB
	z3ZBDvyNG5su5wqHryrI/DuM9HMeEGxqtqPViFt55vXoyD4e2WI2YLCIQ/VYHlMqBZcxOwwhNuT
	jRmdHibegrNv0eM+f+so8Cuo6XSgpHxh15Am3HL0CbOxwFG0zdrTUBs4wLUP+WjNjnLhOAmtD7S
	5AWUQRYjljYk//Nm4=
X-Google-Smtp-Source: AGHT+IEwZQwAFs4fVh48ZmwxPNAo/iap1J+ycBnaAN40is3jXoyDpqFiAiyK3aDzOaHtJzvzIrgySg==
X-Received: by 2002:a05:6000:2085:b0:429:ed90:91dd with SMTP id ffacd0b85a97d-42cc1ab6bf9mr24403638f8f.6.1764219986073;
        Wed, 26 Nov 2025 21:06:26 -0800 (PST)
Received: from [172.23.94.183] ([136.226.168.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c3022sm1344354f8f.4.2025.11.26.21.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 21:06:25 -0800 (PST)
From: HariKrishna Sagala <hariconscious@gmail.com>
X-Google-Original-From: HariKrishna Sagala <hkrishna@gmail.com>
Date: Thu, 27 Nov 2025 10:35:34 +0530 (IST)
To: HariKrishna Sagala <hariconscious@gmail.com>, 
    Mark Brown <broonie@kernel.org>
cc: lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com, 
    yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com, 
    daniel.baluta@nxp.com, kai.vehmanen@linux.intel.com, 
    pierre-louis.bossart@linux.dev, shuah@kernel.org, perex@perex.cz, 
    tiwai@suse.com, sound-open-firmware@alsa-project.org, 
    linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sound/soc/sof:Use kmalloc_array instead of kmalloc
In-Reply-To: <9e808d38-c720-fd59-8bc1-d1da6255c59b@gmail.com>
Message-ID: <19d12aaf-99a2-3b9c-e1d2-c39a77c9e1b3@gmail.com>
References: <20250923142513.11005-1-hariconscious@gmail.com> <fad32f5c-f9a4-4cf2-9082-845deff309ea@sirena.org.uk> <9e808d38-c720-fd59-8bc1-d1da6255c59b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Thu, 6 Nov 2025, HariKrishna Sagala wrote:

>
>
> On Wed, 15 Oct 2025, Mark Brown wrote:
>
> > On Tue, Sep 23, 2025 at 07:55:13PM +0530, hariconscious@gmail.com wrote:
> > > From: HariKrishna Sagala <hariconscious@gmail.com>
> > >
> > > Documentation/process/deprecated.rst recommends to avoid the use of
> > > kmalloc with dynamic size calculations due to the risk of them
> > > overflowing. This could lead to values wrapping around and a
> >
> > Please submit patches using subject lines reflecting the style for the
> > subsystem, this makes it easier for people to identify relevant patches.
> > Look at what existing commits in the area you're changing are doing and
> > make sure your subject lines visually resemble what they're doing.
> > There's no need to resubmit to fix this alone.
> >
> Just reminding for an opportunity to check this patch.
> Thank you.
>
Just checking in to see if you had a chance to review this.
If it is missed in the box, please let me know.
Thank you.
