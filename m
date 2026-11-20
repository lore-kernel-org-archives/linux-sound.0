Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795206659;
	b=j4gOtaJkkIAQlFzh6txw2a3EVD0pc/fGnLTYDpoQ7jmxj8YJttag571qKGblMK4zDz1E
	 GF5bG0z0OVOSXJa0SobHVSwjMvDl1f8fLXTyp9kGu966SQ27L7Wc6Of+RAGcJGOgzmoQH
	 IP407PwFcCWWiIcUo7l/dQyWkmEYN1ssB4nuri/ATp8M1NMKubH71llyLrKitVyFDgP7J
	 zX5bBIJ9DbDaMM0enHFWFT67DprDT81Rkn8X2joB+YDkhzBBhQKgf6F8ze8N1OCmfGSp6
	 kFm2SL/u2kpZixJwAujl6cEtRRDQRJSd5xK7KgWFvn2L94ahLpETtbVSTenuNqh+dmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795206659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=SmOVzPTxZLEPzBlb9pJmyycy/swtGBBs1iU1TcCQUmE=;
	b=KULJmxOIA1lOREYgLcxuPMrzvQSOl8qh/FyHLG512FqZl5q0zOunh+sN6QYDKFSLWIUk
	 ebhD0XgycpNjMZkr6TcqDWuR2eZFSACDaebbO2FD98NbjChvAWA92XSPcsaXV1usJOu1v
	 DUvKvva/XS4P7mT34tSjlu+PFJM1COioozG5/EA1YuDfPalceGkI+hXmmGCA+2v6ZFw8S
	 ppxc11ppzLi4NMXHLKv7SZdLyj3PStYxei3QPh2CU3uYlZZSKg0JQrwV/nxtHWHzta/qd
	 82XSihTNaXkGkuTdV3FW+JJC7c1sgVSx2AFtZMrodDF8Zo+XvQ9mCSynZm1rQ+nkL6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XnTyMdLM;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B97B606A6FC
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 20:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B97B606A6FC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XnTyMdLM
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so19383795e9.1
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 12:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795206655; x=1795811455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SmOVzPTxZLEPzBlb9pJmyycy/swtGBBs1iU1TcCQUmE=;
        b=XnTyMdLMQViLqocCLy7l53u8I41tA2MqvkXvE1ryN5Z93y0PQUUVutNe+V0SYZODNo
         IXOp2PMyTFBKAByn+kk8n+1UM6AsOe9ZTmGeo7szboOffqEXblHUO5/NRcnuIetCktYH
         IiOYqiGnV8VWUNSpsxYnxLK0zHHALVlrtZ+PlfrfkCt+Acv4JzpuHR5FFmBKZEGQ1Brs
         KqSV6GUXCPjpvKYW9KcNc6JK7RoukrvbWJ+3y/SG0u3U1+ascXEK5zVPE1a5R7j98pRi
         RebOYAbmMNumGz/ScnXgseJWEUW2jR272d1b479fCcLrbmUktSCblyWUrYM15Yqey69/
         XMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795206655; x=1795811455;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmOVzPTxZLEPzBlb9pJmyycy/swtGBBs1iU1TcCQUmE=;
        b=gPah2NvzwfnWdydfSi+HAMHrvIzmow5gn7r8jM5T7CqEbzXFh4eFGWMgwZycVPwvFN
         905b6HirX5/9gsW7g4PPcFM7pZ14yo8QDuS6N/jCR5GJE84trzbvIuTgaGoOdBugNSm0
         nt1/Qd1px+6ZQUfPM2UisY/rqUgdr1+F/Iy7d8uY6nDAE5+b29z9NRGWFkNP8XQaVL1b
         5lY0cFzXOkET08HoE24KA14NZ7babix8pOxnbG08IVT8dBopbHJBwGurHrs/oWQGhppm
         s0injgYopJeixppjG9RYzsq+FnPdJS/zAhPO/CgHrTYB9s6W38V4FM4q4f3ZfqfwlvKj
         pT5A==
X-Forwarded-Encrypted: i=1; AL+hErF8zHcALt34E+ZXIJoHpH/9/ubaWjgMU5h7BA4v+EGXZb3D1D1dv6aNKxdG3DydY5igY/IPrgbKnsuBvg==@vger.kernel.org
X-Gm-Message-State: APuU4Z81nkyJD2sEcO6ggL6yB6NjappwGO5U5wwplbBCPBE9FSzduLQI
	rLRtgHBlRYS8hIrlSvnZNlpcUbuJRRIbRJPa020KLDZWi3I1mPCsTBo6
X-Gm-Gg: AYBFou0I7OkM2y3xu0WeanWv7TpzkLNZKNHJPnRJDqOGCh9qAsSme/nkMCLanRNxQ3F
	z6HcdFApRe+IpnkwYC/aG6KnZna1SWQP1hifrcMO1HOMRAlkkIwyE0ZPfrfEwlRZCDpOBRN2Hpl
	7dn64bKIbgqrLAr+3x/87HIugF+6GxjqBHPom4EZuSQC+bVAsNdcuPCdcfCIs6obJQbAg7cgxiy
	8WdPSOuggqOWhXv3wXhFKb2+eqfujMA2PohddiQFUBHXqINjJZlHx1ywkCPRXIi2jqosmRPKNgG
	xH2L91LetkUJf0ADwIYhcee3ZBxIMQupxbgYM9461K2Kcv05kha9ZaOm9g9qhXB4mzgBoQ58aHe
	cLCzONsG+3rXWiWan72XCj+X094CKEXmx26qvEKwvJZOMZww9Roxoxh+0Zd+wOhP2PjCYL/2uOH
	7c9nUUB/PCJkFnk8oF18g95GzQFMtKAjxlrz0i7SkQ+e2LRIR3mbncgrvE/RBO5k2UyJa+nNjzz
	dj/EDw0iiGVRRKXkoCS1N4b5eOh/SMs2Lz8hhakCC9giY3dV3TDUZ0L/JIXTeAR7RtEiMkCjFbf
	Z0sA+KZr1GqsQy40IniE/nsxs5c2mz+GwgShkR2+
X-Received: by 2002:a05:600c:1d83:b0:4bb:687c:4fbe with SMTP id 5b1f17b1804b1-4bb88805c26mr86419975e9.8.1795206654499;
        Fri, 20 Nov 2026 12:30:54 -0800 (PST)
Received: from foxbook (bfh118.neoplus.adsl.tpnet.pl. [83.28.45.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm113647955e9.7.2026.11.20.12.30.53
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 20 Nov 2026 12:30:53 -0800 (PST)
Date: Fri, 20 Nov 2026 21:30:50 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Gabriel Ilie <gabiilie95@gmail.com>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com,
 linux-sound@vger.kernel.org
Subject: Re: xhci 8086:7a60 (HM770) skips ~9.5% of isoc OUT packets when
 hot; HDA on same PCH underruns in step
Message-ID: <20261120213050.18641baf.michal.pecio@gmail.com>
In-Reply-To: <CAHJAn3zOCh8oKjE9fVbeD_XbnSG-h8psZWan9qkNji_mps8rFA@mail.gmail.com>
References: <CAHJAn3zOCh8oKjE9fVbeD_XbnSG-h8psZWan9qkNji_mps8rFA@mail.gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

On Mon, 16 Nov 2026 16:05:13 -0500, Gabriel Ilie wrote:
> 1. Is a periodic ~1 ms inability to service periodic endpoints a known
> behaviour of the 700-series PCH when it is hot (PCH thermal
> throttling, DMI, or something else)? Is there a way to read the PCH's
> throttle state or temperature on this platform to confirm it?

No idea, but it seems you found clear correlation with temperature.
Maybe the proper solution is more heatsinking and airflow.

> 2. The controller advertises CFC (hcc params bit 11), so as far as I
> understand the isoc TDs carry explicit frame IDs and the ones whose
> frame has passed are skipped after the Missed Service Error. For a
> UAC2 async device with its own buffer, sending those packets late
> would probably be inaudible, while dropping 1 ms is not. Would using
> SIA instead of frame IDs be acceptable here, perhaps as a quirk or an
> option I can test?

Somebody recently added quirk flag "PLAYBACK_URB_FIXUP" to
snd_usb_audio which submits playback URBs with SIA. AFAIK there
is some way to try those quirks with a module parameter.

It may reduce the number of missed microframes, but I doubt
it will make the glitches inaudible. There is no such thing as
transmitting an isochronous packet "later", it must be skipped
if it doesn't make it on time.

Regards,
Michal
