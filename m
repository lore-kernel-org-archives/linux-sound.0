Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794854833;
	b=JXJpn0FazKnBDazMmCsgXzQie7fLxecCsxfi1YCzRYaHHnF1YpzAfDBPTFvwDuSxLPIx
	 v2HHXfBboc9Hu9QWMUDaIPq2GR7jbjm1dtkdvJkcpDLzZd5HNPDkmGk+0X8IcrMu0MnFn
	 XZ591E5tefLuDVq4IlwcMyOL2IkCx0TT2IFFC3n0av2J93p7E5jX5TJPonMg3kE1JpR0b
	 T2BIKrpidUefxWqXmGPl3Q/lHiY3lYts49zeJW319QPSW0IW5FAb7+niaDxf4RVb5Shtk
	 FRbB89I302Grm/CoWeuubMKIBYfEt2IIMp9zO9Csd+xbAeojB9X4aLw6FWgcZLoDnyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=GW/pHuuYWOR+ZshctqkryBnlEK3zf13it4Fxoba41MQ=;
	b=2r+pChHIOzDptQ3cja/7C0ztClppfZV2DHGY/+K46FuDg2HgbyIIPmYw46d2iTWH0I1s
	 mOpZFG1efYG7h/1r+l5AJ6wEdCdQqfs2V/xosjVWSYQbBFLIJ4C8MLVeUJ6hNDfA5OeQF
	 KwPHfBk0jdsr+nsiUwcO8z4se1ikpr6YF3gWO7Y4co7afOBVupAlM6pKKT+T6uA8vF9sX
	 suQjLRdj4h557pQlQg6Y+tPX1L7Krw1DbYG4ClZW16Xj2HqXDX8vewUqY9rpx8x6FCxnd
	 3CM1q8iexNnUxVq+pGuVLMzNaJz9uTvFjQf7efBTTca9tT4rVv9KbWL0HyWMVSRmepw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SNf2SagU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F48606A322
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 18:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5F48606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SNf2SagU
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50a4a2132cso498653966b.3
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 10:47:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794854831; cv=none;
        d=google.com; s=arc-20260327;
        b=V6/H5rYW8Cf8CaFORoXPzvFnA9TeNvBvaSh+lLREBKyXHqY/pg3/nFtyRzPA2yPIKK
         u28f4qY9v7tYY3Ko9JXWszkUGemC6TfwRDNM+gWxHASwMVnftVH6TZjA3/DkKhW7pSe8
         Qr0NuQ/QjWMfUEZknFE3c/XIuFqJLFKr/LF/DW0mCP08oFHH6lCnZP1F7Ry7z1MJxyRF
         mxsVLKhgIKkJ1/QJ/BQZ2bHkSjbGiOOvyA92gIUwFCgpEANDQBeMzfiAnPU0qeeLI6UR
         IuNqCPvhuiYk+SMchumgrf4ndtKdgR5iIHX1d+oUKc9CRE2yVhra37RKCEV8g1Ab4BVn
         Itvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=GW/pHuuYWOR+ZshctqkryBnlEK3zf13it4Fxoba41MQ=;
        fh=MswZg77IhZfom9ATtP3oGmIZWN6jGRRjYCJ8nq4ko1E=;
        b=jFP6rEtwkQzy+jBSizUPufGSRmdKlQccHHQoFgV9QirVWy8yQ6Y0qazG4AHWbmUnkv
         sOvtN9eJ+AtUgZDz2QG/aEzVO/Ob5JBgtT/aHAo+STrzAuwNawFL+wmql5ah7YbUJT1J
         F0+SrW3HLTfgqd+RqJynngXyH6TzyyoAtKasJRCYpFM3zNE/kj6BYyucZHtiM9HZwsNE
         Bx+uUmyaeK2KKHuzSsX3LHDLSjHTTC7EDnX51tjw2H+MmYEX/ajd000Dx14EdemahMt4
         dO84yl1q0Q7ndYDtFXJVZ7j2Ato7EA3HGzrnSxH91185axio/MnPV16nYZDaZFLIa2d6
         CjKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794854831; x=1795459631; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GW/pHuuYWOR+ZshctqkryBnlEK3zf13it4Fxoba41MQ=;
        b=SNf2SagUQ4j+WMS3699LUIT5vKAV4u+w54AAX/o/atSdNZ5h+1x7PV2+MRtSIe0crV
         m/O6nROYBwsTsOF9zwT8m4vY7GD6ASHLWNyJAQs4nvRva7WvvWvEFyuscTzc+GDYO+dU
         74KM1pAkxwiuuTH7fs4VTWhzu6YaxDlTdf72WT8Sf6PNx1j7wFRVc+bqsREHWNPSeMzH
         beu9qP3aZCe33hto/jbi34U0NcPu/S32BznHwLfH2Gt4aH8JkBdBx/QUPpN493Aee8nl
         qQNT5hlKL2/OnweJ2ldKcT27M+EuwvFsr3lKDoCi0158bo9QLGWVXJeMi6HNmAmOVyt7
         Bexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854831; x=1795459631;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GW/pHuuYWOR+ZshctqkryBnlEK3zf13it4Fxoba41MQ=;
        b=Yvy9gWp9IokpJ0nvS76RW3Z09/pTHuPjULzOlBtNPVpF0XVhQfFpzCJFUn8M7m4yqo
         s6IcpfmSn++3rBFbciKyZc+p2ZUuSwShZyllHGYbMHD4q91jnMNGjptljNUEfxEVcuqb
         wU46cp1rHelIJbLhGb7xFQG9EXUZUR/w2w6MJDD+YZyaOrLgH5befQs8z69kPQQjcIM8
         BSnvKwedOR8SWTsEIwlHlbJgLfoa7Ch+ZCK/1Tvil4GgZEhjcHXQN5eLKb7yu7KRzDLa
         dma7X1Nc2KLRPgYmsuZcjq4oDlagIaA06UhE0BH4PBRV4kTJ0JNprjmU58FiSWUwXUkZ
         zcmA==
X-Forwarded-Encrypted: i=1; AL+hErHmS4aHfYJrA/iIsgpggXhehjXJ/7rlznKvHzIYfzW9VvQY+UIpolkx7HRf3trCifrlDauwlFN7LZ2MYg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Wh9Dyhyjz2XBZo6+vZUtmSN/oJ/aLyi2wssR/PxblBGviE92b
	guqCdnPdKE9YEhagH1vvArfae0jnWXg695hM9lRK0vgSCD7AkY/ysaskX3b+oUKTbzo3Jnpdy0h
	TeJyhvLehMMKvFr1gILbZ+GcCNJiEmMY=
X-Gm-Gg: AYBFou0J/mWS29dHXYJRhfaH3Hk3S0qzB7O+5WEyWCcRYg01VtxdvhRfRJjv8rJn1Dp
	NNMhDxYgvAoBkLw3LYvoHMGUAzZWQ2+Deiu2Egi311HPos6MFllgxDA24GvfFgNo1ijW5LQNTvM
	uEmYbJMJvD6JKTepQ/Q9yxbY85tWHSsXYPInMl1UGPnE4TaBPNzzDx40CAmKroGsTddlmLyoRvH
	0at8D1VarvRJ0Hm9mgZzcD6hGhw0vrsVLkWjRCL8Te3HJw0j4nwvzi5Ll9LvXFLzdbvr9vvcGaO
	FLjiO7yaTLRDY5+OgeZKsardFmdeHzJUKqzDXq+dq111uxxw/UW7x3e56YtMdgHQk9/QVsH29k8
	vcjs4h2oiAsy68fjvk/NAaIzpGan3c+/BQ89KyQ==
X-Received: by 2002:a17:907:60cb:b0:c4c:d6a3:f4bb with SMTP id
 a640c23a62f3a-c509634503cmr998452866b.10.1794854830879; Mon, 16 Nov 2026
 10:47:10 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: =?UTF-8?B?0KHQtdGA0LPQtdC5INCR0L7QvdC00LDRgNC10LI=?= <bondarievsergii@gmail.com>
Date: Mon, 16 Nov 2026 20:46:59 +0200
X-Gm-Features: AclHuK-fxAkVRwJId2Eokhjsy-D88FBa0N2EdTFzMUBQgtsulsFWgcd-UtztgpQ
Message-ID: <CAG+hB8Xo0efsrZMTNJdZhK0ob2eYO2jROs9hL3beSdXn=tOE1g@mail.gmail.com>
Subject: [BUG] ASoC: amd: yc: Fix DMI vendor mismatch for Evelyne_MDU microphone
To: broonie@kernel.org, linux-sound@vger.kernel.org
Cc: perex@perex.cz, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello, my name Sergii

The internal digital microphone (acp6x) does not work on my laptop
with the "Evelyne_MDU" board because there is a typo in the DMI quirk
table in `sound/soc/amd/yc/acp6x-mach.c`.

Currently, the driver matches `DMI_BOARD_VENDOR` (or `DMI_SYS_VENDOR`)
as "RB", while the actual vendor string reported by the hardware is
"MDU". Changing "RB" to "MDU" for "Evelyne_MDU" fixes the internal
microphone completely.

Here is the DMI information from `/sys/class/dmi/id/`:

/sys/class/dmi/id/sys_vendor:Acer
/sys/class/dmi/id/product_name:Aspire A314-23P
/sys/class/dmi/id/product_version:V1.11
/sys/class/dmi/id/board_vendor:MDU
/sys/class/dmi/id/board_name:Evelyne_MDU


Could you please update the DMI entry for Evelyne_MDU in `acp6x-mach.c`?

Thank you!
