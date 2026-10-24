Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=37.17.239.250
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792863223;
	b=iZs6ApKZMrNrz158TcBjZ5g0MU/NAas6+2+pTlxEBqJ8QOjsv0+2u8yIYaNkCYB/coU2
	 s64MN5vN+e2wrp4OxZfq9XVUnBQGlnREj13brMEqu0iV3pSeBvmeDk9wMK4bpZdPPQEfy
	 I6a2rdABluTXwXwN7b/9FRWtm3/VlY5QHZR/tjVC7RoP+8FUMINJhvIN8jGzzrfhNHHHQ
	 kxFZjJolRVuvReezXVAUOTTjCkN6W9Q64Av1YV35Y5R3a40bhD6Rk1EVghbo6MJkzYbM9
	 H5xWwwcVWqmJTqTscvdZIdtjL8J/RlVGEMkCATPW7NftHm/dqRNf7Q5kuSoVNvysK8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792863223;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:Subject:Content-Language:From:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=Smnr3DUbuqrqe2Dnp/7HXuPqfRNNihuvWt0aFAjJfFg=;
	b=3wPBG0VP7+fYnhnlsg3qBc6dc//NRIPWX7yrHU12l2bE318jf9RgD1GPTmNHtYv7Ykkp
	 zvqx3pWESUk2fipJsRHeAIUEN6f1BBI7g9IlKtG3fJb3I8FKwEeN0Y/J7qhbzdm39kB+D
	 +DyxlO80WAJGTgAtEZrukfst8qgVhHITm4y9Fu7RmlknDh/JrdN9M0EN90E2z4gzRVJYZ
	 dWwhcVLhx0BMvNtk6szSxib6KjG5XgJuF+2/y2U2iDFZdzblNrvTkZL1jyx7rtepItCH1
	 vwLNEsaQaBX3xrJVt+dU4IK04LefRCBJZfVkhbuiNzsK8fn6Q3k2qd2JN28+KS2Cakw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=elbengeist.moe;
	spf=pass smtp.mailfrom=elbengeist.moe;
	dkim=pass header.d=elbengeist.moe header.i=@elbengeist.moe header.a=rsa-sha256 header.s=dkim header.b=djFL5qJg;
	arc=none smtp.remote-ip=37.17.239.250
Received: from mail.elbengeist.moe (mail.elbengeist.moe [37.17.239.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34504606A31A
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 17:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=elbengeist.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=elbengeist.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=elbengeist.moe header.i=@elbengeist.moe header.a=rsa-sha256 header.s=dkim header.b=djFL5qJg
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3D65494497D;
	Sat, 24 Oct 2026 19:33:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elbengeist.moe;
	s=dkim; t=1792863214;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language;
	bh=Smnr3DUbuqrqe2Dnp/7HXuPqfRNNihuvWt0aFAjJfFg=;
	b=djFL5qJgPN86Ia2Rqms0u+GQLOtJyCSx4TRD7hSZxa6+jVgklpp+hXG2EK0bHxEDFO+sVo
	AjAlcu9eAycfFhWwYztDiakfinAhdLe7ZjBgKAKY+UkcU5RlbqtPC2fbM3hAmJF2G4/whh
	Q5AiPxSPunOKwkfCrwqJZutKRywr0tEiowgDCbnKVKL6M/I3zX/f1ESuz7VTvx0XPpwshA
	mhBvBzejDCPWz2lKH0vkhEkbWoPQRGz9/6j3YjD81mfJkLTvd+myZY3RzAlAFant/jHqmm
	bjJqFP4Xb3VcQU3LEzkU0zC7zpCIB72aqoyRk0t+YW3Y6RUsNuFO5TCCUGzl5A==
Message-ID: <dc0bfba8-e56b-4de1-b719-74dea6bdc114@elbengeist.moe>
Date: Sat, 24 Oct 2026 19:33:33 +0200
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Will Bush <will@willbush.dev>
Subject: Re: [PATCH] ALSA: usb-audio: Avoid applying boot quirk for Behringer
 UMC204HD
Content-Language: en-US
From: Zinedin Polic <zinedinpolic@elbengeist.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Good evening Takashi Iwai,

I have the same problem with my Behringer UMC204HD (1397:0508).

It worked on kernel 7.2.9. Since 7.2.10 (also 7.2.11) the device does
not work anymore.

The kernel log shows this again and again:

   usb 8-6: failed to read device descriptor: -110
   snd-usb-audio 8-6:1.0: probe with driver snd-usb-audio failed with 
error -110
   usb 8-6: failed to read device descriptor: -110
   snd-usb-audio 8-6:1.3: probe with driver snd-usb-audio failed with 
error -110
   usb 8-6: failed to read device descriptor: -110
   snd-usb-audio 8-6:1.4: probe with driver snd-usb-audio failed with 
error -110
   usb 8-6: USB disconnect, device number 58
   usb 8-6: new high-speed USB device number 59 using xhci-pci-prom21

The device reconnects every 15 seconds, forever.

I applied your patch to 7.2.11 and rebuilt snd-usb-audio. Now the
device works again.

Tested-by: Zinedin Polic <zinedinpolic@elbengeist.moe>

Two small things:

1. In the patch, 1397:0509 has the comment "UMC204HD". But 0509 is the 
UMC404HD (a different Behringer product, see the quirk table in the same 
file). Only the comment is wrong.

2. The UMC202HD (1397:0507) is from the same product family. Maybe it 
has the same problem. I can't test it.

Would like to see it in stable.

Best regards,
Zinedin Polic
