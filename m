Received: from mail.zipdox.net (195-240-81-79.fixed.kpn.net [195.240.81.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F73D431A3E
	for <linux-sound@vger.kernel.org>; Sat, 12 Sep 2026 17:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.240.81.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789233707; cv=none; b=Rgh8Dv8G/S+qFPxPE1eDIDpdTMhtwwteoIK3mdZPNA0+4DN7Yn9Wcy650XH+PGCjeUt8w7T5ALBlSeZ8PTJlN87slnr0Eb0dPYIxv0vq4ly3HBWWul/R9MRP5tFqKM3jhPQW3NaVLluqgS7hGq14+Gr5zvHCzuJnCxKxwkZQ0Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789233707; c=relaxed/simple;
	bh=BkHlLJylMVfjtAIy77rj2tXUKSgpH1S6BWIHsdy0nbM=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=hWH2ztWFHLsJJFXA1SWorUbvHQSlK1QsyqBh10GdESEu7LPveTBSM/wnHRZpmh3DZppEF2jas0IhtZYHPXQDhGuhOc/yarutwxrNOY1f+K+4N/zzjoOiZ1QjVyVMPzmU27g/jCzN5M5nTEN9pRjgCm8uDQeOzpli5taQG/3sogA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zipdox.net; spf=pass smtp.mailfrom=zipdox.net; dkim=pass (2048-bit key) header.d=zipdox.net header.i=@zipdox.net header.b=qv0keJN5; arc=none smtp.client-ip=195.240.81.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zipdox.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zipdox.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zipdox.net header.i=@zipdox.net header.b="qv0keJN5"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6CA392106D
	for <linux-sound@vger.kernel.org>; Sat, 12 Sep 2026 19:21:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zipdox.net; s=dkim;
	t=1789233702; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:autocrypt;
	bh=G1UZs/gfVWguxrr1msNC+7pLBM30p1HUJ7g+HU4eidw=;
	b=qv0keJN5+mxOpISbF2tbdycC913hAqwylWi4Rkr/ZKRZcsj2gwH8YngKM7qOvtiyH1p+8b
	x/tHavbzfi92iEY/6D0pRkR2JO0U6bcgY6iGxmkudzdIW1ODCUZBCo1upHJu9dy9To0vml
	QwpCUhr6msFoOoNJJAbe2hzRR0kyJp3rROJHYvGA5BGWCeV8fHnGulMiB4bjVnYBxqz7NN
	/s++sXsroWw6dW4OX/LTaaD8YgOa9SgPrHkYDwUhZYVEPYPeHBCnWRFTN/S7H//Vehod0W
	ygV1H7jYqOhndHaqvny9ONGF9JDGzLxi1s149PDHcMGXHwG3SxkuMFBlqHr9Vw==
Message-ID: <63001aad-918f-45c4-874d-55358f318ba8@zipdox.net>
Date: Sat, 12 Sep 2026 19:21:42 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-sound@vger.kernel.org
From: Zipdox <zipdox@zipdox.net>
Subject: [BUG] USB Audio Class 2.0 support for Mixer Unit
Autocrypt: addr=zipdox@zipdox.net; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

I'm sending this message to the mailing list since it seems that 
Bugzilla doesn't really get any attention from the sound maintainers.
Bugzilla bug: https://bugzilla.kernel.org/show_bug.cgi?id=221969

The USB Audio Mixer Unit driver (sound/usb/mixer.c) sends audio class 
1.0 format messages to devices, regardless of the actual audio class 
version. This means audio class 2.0 devices will receive incorrect 
messages, stall, and cause the driver to error (e.g. alsamixer exits 
with a broken pipe error).

I've already written a patch that gets RANGE, GET CUR, and SET CUR 
requests working (check the Bugzilla bug), but I don't know if this is 
the best approach architecturally. I'm an embedded engineer otherwise so 
this is my first time modifying the kernel. It seems to work with my 
hardware, but I also don't have any other hardware to test with, so I 
don't know if this introduced any regressions. If a maintainer could 
pick this up I would appreciate it, but I would also be happy to 
continue work on it myself with some input.
