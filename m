Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.250
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517766;
	b=aoiGq7rSye3Jy1QrOv/Ojlv5tyxa6vTcb52xaanXv8BhXiKx+oASCjveyEfqeGSg0XEG
	 1Y0fkKC8KPZcYy9W3YhrX5sli7E1Jl5+hmqCQg3X0a62y/EXe5z0CF81aIXRvFt/TKcKo
	 1oEj3PHmDOBPtPuXhQ2kuI+8mUFL6zV683UiHJhjm3JnHiWY6LyPzaZGMe63P5JhslvQN
	 Hgyi0KLIoZnUwwESvSu/3iWbunlAxIli7L3Gz0o/dfbVkaBG0bHAgteQPUUlKrjwx/XE1
	 lTOT3hE9swEEDsLseteLKLfu46mR3f3+YdN+xPbHjrIDgaT8lM8WsWDNn08b0PNWFVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517766;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:In-Reply-To:
	 References:User-Agent:Date:Message-ID:MIME-Version:Content-Type;
	bh=MKlAVf8pJTxm7y+S0FoVuXl8SacRXsLs8tmOYBmHBos=;
	b=YUtFkdmX+1j2yrigOpA+HrEMHAH4GiFRkTZTbzWAn/TpJsFhWHxK4V7Mk7uam6UI1euo
	 I/0YXSdImbQMrx66hoQopRxitk2Aw4VzbDoOxty9WnsojeeZ+fm7wsFizAXQKCezlilha
	 mBTX0PqlET1YPi4mx9sqFe1rU1pWgRTdrAkWctinOzTivUObVzG1caPCSkyvCG0RJNkTe
	 Pjkcn47vTWomg4lF31YZpQR54Vdoy81X8Uz2V0FoCPSswjhnYLLD6tjcNdkUT08Zwhpx8
	 EwtjbxKlDxvyFaIfCkeqBnNZEWWu8EtNsJjF4l+pCvRcHUvnoLbpr/eQmZbkpJl84RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xphcqVEU;
	arc=none smtp.remote-ip=95.215.58.250
Received: from mta1.migadu.com (out-250.mta1.migadu.com [95.215.58.250])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306F2606A31C
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 17:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 306F2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xphcqVEU
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MKlAVf8pJTxm7y+S0FoVuXl8SacRXsLs8tmOYBmHBos=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792517761; v=1; x=1793122561;
 b=xphcqVEUlw+HA6OnaTr/OMLv8yY6edL4IOXQXypiu46gaB1DENL11UFao4xp9QXR9kSTsXn5
 rlqzQele0lTQYhnAVoM6dOAk+FZesXrGDnMZjMi2dD4jgg2+WIooeeNHKwRsoZg0pdK2fY8fy3n
 E/gzouyYTENuqE8LRk4BUQwU=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 85271f9f13e6b2e8;
	Tue, 20 Oct 2026 17:36:01 +0000
X-Mizu-Trace-ID: 85271f9f13e6b2e8
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Takashi Iwai <tiwai@suse.de>
Cc: sashiko@lists.linux.dev,  linux-sound@vger.kernel.org
Subject: Re: Enabling Sashiko for linux-sound ML
In-Reply-To: <87bj8oh7wf.wl-tiwai@suse.de> (Takashi Iwai's message of "Tue, 20
	Oct 2026 14:29:52 +0200")
References: <87bj8oh7wf.wl-tiwai@suse.de>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Tue, 20 Oct 2026 17:35:52 +0000
Message-ID: <7ia4cxt48ebr.fsf@castle.c.googlers.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Takashi Iwai <tiwai@suse.de> writes:

> Hi Roman,
>
> could you enable Sashiko reviews for linux-sound@vger.kernel.org?
>
> In the audio BOF at the previous LPC, it was discussed, and people
> agreed with the enablement of Sashiko.
>
> The preferred configuration is author+list.

Done!

https://github.com/sashiko-dev/sashiko/commit/b063c144377b569c39eb3c7d2f689478062fc4f1

I'll roll it out later today/tomorrow.

Thanks
