Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB3C313522
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 18:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764182646; cv=none; b=IFyON8GQFWKlPp092LEnM5puZG8dUMWZy0hV+c6mVl5dyL2sGG6KBSyJL7FS6QZhOIbsmj/1q6HezhGS6eFOBjDPMBqXkuTpvgoZR28xLr+1G2d9xZts1N1JCJDB+upSW+lqTgncq4lzvnUqKKYF4qxE/B2Eg+ayqBjyu2sf9Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764182646; c=relaxed/simple;
	bh=gODucceURXLAZAeRwxxIiFVKMzlCXxDmuBNn0+OsE2A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=sXeVQULTodCj6PwKkezPDmuLKzEDoQVzMYl2V0G8QEgVH9QZtfh2iIlW8u1zBrpL5AHUFmiOoSvbvsCHIHZWTzGS5L3RohDbkoon/yEc1UXy/xxzBQytxNIPnNsRS1ZjNkr2elmP/otKOXeWvNSWw/PzRYCIaQfQ4nOF4ASFOzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sOoUDvg9; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sOoUDvg9"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b32900c8bso109770f8f.0
        for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 10:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764182642; x=1764787442; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xv6F5N4oE/AmW5+gi206/SuXoxVH3RxFlJrHQKwWM8=;
        b=sOoUDvg9DWQXsPrCh925yBopoEx1L1BqOFEja/UiuHhPxpfWR99nSgdz+9LX9xVSaS
         VaFnLBskRYmrKdzB5XO+Cd8uPTZW7pWf3NQlKdYwK+NiPiBl+J4y0s6RJGop7KcQtNlL
         S9z3nsJbHe2BAGrjG6tOSncgKS29f1HuYKuWU7KDzAq76ng6AEB2pjjJ0rnXj81m7l8E
         wUlfqB0dqbzXEOjspyqGYbqBnwcdj5+lcNvTQ9vP0EehPqmRPTPWiymiEGXDFnBlHX9T
         GCp1zejLdtj7nW3oakcarK7vOjppqHqvVkkFuWOfzCTbypgeu+itXr2ckLOVr8IDyqmG
         i/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764182642; x=1764787442;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0xv6F5N4oE/AmW5+gi206/SuXoxVH3RxFlJrHQKwWM8=;
        b=iRssBTtnNP9MRcXFX7pxtjosHRQQ2P6PtXaJIo27DbvIugGWLDuxhs/7UUg7JGEDOq
         y9RA21KQUWWKhmpUPQfWMBLwJYYj0pDRvg0iXyKsM7PfPnqhazSS+5Zqcn27yIaWlS8Y
         87KShy0QlTLTw480SChYJ+xe95HRM6JaBPGpjfe0bSXIxjtIl0ephyTc4viU8iNx/GEa
         MwA0xNpOJ6zp+dcMHfNSKkgESnmCV0XJNGBXsRqLzqYjIL3sFzFlEwRBi7tDV66MuY3v
         dq44Hsz80dKbfW+q3SzgtlKEaIabXtisuSffpcA24VSuKKjxlqFsPcJvDVV6l0rZzlkd
         ai2A==
X-Forwarded-Encrypted: i=1; AJvYcCX5yOVhkfcB+EYGcgyST9HD5/dgU7wHihKmUeM0BSpH0esBgOBOEDqYHiIOxQMZ2hWiLq7ajxSEcmb0lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmORpvsiHIU5wi9NonKv89btqCaL8ro+35jJOO3Q6ipaL8XXw9
	pWLPCQWw0HeZHZx+q+/S5oJ3O5l7N7gNtwemNY+BiJ1Kk66PoqCstWG1DQYWiQJwG/vmFGdu46N
	K5ULl
X-Gm-Gg: ASbGncvcAkiSPUire1F2UPK63n+vE6BBmvg6jF3MKg4tLgcVbrlToG3h2StEv8mJdT0
	nTggmAPRMFBWL+dP9EiglNvZTSNOStjmzvT068ZgAksiiQlJwFL52i7LAy2aTNl6Bh/SKIgqdSE
	uG9pmQ0i7M+ydxamwhb/h30lfTcOISMJljql1xOlug3RgPGspv9DeeLZDZPXIoEz2QLpBUPJVYD
	xJ7ASksvYwOVvXU1euOF6BZfnZKhRFtZUTVX2OUUNECORfE2Y/nPlMjUxb9dDjVGPji3+OLouEc
	2nFJHblwdvPcGpGdFwXFijeytoHcJGWiOMfKU/W4QIMpFA7RFuSjhttjINDfFtGwkueUKVBJV+6
	C1tPfrgKMerVLgWpTFofUHhc5OC4+mpvY1NjxzlDgIEIwRA5Fo1Fsf+UYGVlkwu4sOzQUoiAZJj
	q4O8BRMA8DSx+f1GQ=
X-Google-Smtp-Source: AGHT+IEp/IyLELcI0uOZQfhum7V44+vF6YOIJkzlS9XBmb/UdkI5bYp9WJHzf72QiNHrX+cRfeCHAA==
X-Received: by 2002:a5d:64e6:0:b0:42b:36f4:cd20 with SMTP id ffacd0b85a97d-42cc1d2e292mr23068136f8f.27.1764182642424;
        Wed, 26 Nov 2025 10:44:02 -0800 (PST)
Received: from localhost ([2a02:c7c:7259:a00:a911:f33a:3163:4511])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cc231dc6esm32613035f8f.7.2025.11.26.10.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 10:44:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Nov 2025 18:44:00 +0000
Message-Id: <DEIUJWR51WIX.43GDTH9RA8UH@linaro.org>
Cc: <linux-arm-msm@vger.kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "open list:QCOM AUDIO (ASoC)
 DRIVERS" <linux-sound@vger.kernel.org>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/6] ASoC: codecs: wsa884x: remove
 mute_unmute_on_trigger
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Jonathan Marek" <jonathan@marek.ca>, "Srinivas Kandagatla"
 <srinivas.kandagatla@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srini@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251124064850.15419-1-jonathan@marek.ca>
 <20251124064850.15419-2-jonathan@marek.ca>
 <2758401b-e9b5-4f10-bb01-0a1fe4e09430@oss.qualcomm.com>
 <5f15fc5b-375a-1e75-b32d-0d543fa1014d@marek.ca>
In-Reply-To: <5f15fc5b-375a-1e75-b32d-0d543fa1014d@marek.ca>

On Mon Nov 24, 2025 at 2:55 PM GMT, Jonathan Marek wrote:
> On 11/24/25 9:08 AM, Srinivas Kandagatla wrote:
>> On 11/24/25 6:45 AM, Jonathan Marek wrote:
>>> trigger is atomic (non-schedulable), and soundwire register writes are =
not
>>> safe to run in an atomic context. (bus is locked with a mutex, and qcom
>>> driver's callback can also sleep if the FIFO is full).
>>>
>> Thanks Jonathan for the patch,
>>=20
>> We have nonatomic=3D1 flag set for all the Qualcomm sound cards, Did you
>> hit any schedule while atomic bug?
>
> Right, I missed that. I'm using a different driver which does not set=20
> nonatomic. But this driver to not need nonatomic -=20
> mute_unmute_on_trigger is a hack, if there is a timing requirement -=20
> then it needs to be explicit, the different timing with this flag is not=
=20
> reliable).
>
>> In-fact this change has helped suppress most of the click and pop noises
>> on laptops, specially with wsa codecs as they accumulate static if the
>> ports are kept open without sending any data.
>>=20
>
> 28b0b18d5346 is important to fix the click and pop noises. But the=20
> useful part is the rest of the commit, not the mute_unmute_on_trigger=20
> flag. As long as the mute_stream() happens while the soundwire stream is=
=20
> enabled (between sdw_enable_stream and sdw_disable_stream), there should=
=20
> be no pop click.
>
> AFAIK the pop/click is because of PDM: zeros (soundwire stream off)=20
> represent the minimum (negative maximum) amplitude, and the soundwire=20
> stream needs to be enabled to output a zero amplitude (alternating=20
> ones/zeros). Turning on the amp while the soundwire stream is not=20
> enabled will cause jumps between the minimum and zero amplitude.

>>> -	.mute_unmute_on_trigger =3D true,

FWIW for wsa881x in analog mode on RB1/RB2 boards I noticed that pop/clicks
sound behaviour is much better when mute_unmute_on_trigger is false.

Although, for wsa881x in soundwire mode the mute_unmute_on_trigger =3D true
gives decent result of supressing pop/clicks noise on the devices I have.

Maybe it varies from platform to platform and from board to board.

BR,
Alexey
