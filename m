Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635500;
	b=GWORjQDFu0irmM/w4zxgMKegVO8xtDI2Fe5hrbUZbF0grYVhnwI988t36r3Yd/FOqZXT
	 5Y7FePWsmlVr2P3hOCQTRKG8CN08lraJo+H9W8Kcd5A+TeNP1qzUdBJeJ5Z6na9I0ABSs
	 +Tn4H6duzmaPwjJc+2nfyH1P5ZAfZqdGsjflCESTyEsEH82tbu+V7XMaz0wuYHLVm37eZ
	 zRO+BntL5Ztlq8udQpBQh3LsAbuDW8vL6ub1qeBKvU83Uqe78MSeLxKnaDe7d6P7Psouu
	 U05ji+nDcifE1G/tu0f6Quum7XXHzqtUz+E7vjlSzb0c+00PNBRZhDATPoFcZP6o8DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=dXKYI3EJxaQV5jIHUv9yi8G36X/Qj3DOc1D0IScmz1Y=;
	b=vqdgojxlz3z1v+G5gNLdS0PVMJv1pgU+U/i6mdjQyQwGP871Cd+26Zyh0pH2oRwmn7Jz
	 kqb8zuKbxIwRVqptRTyap+HGFGVOtkT/UbvFMbJZLRcEK8bMy02HHRg/Tq4WNXF7Y0rBW
	 10T0WliW87RaW/kgWplJkVv8j7OGeDXMRnUtt7V7nedfo00tJYR+0aS1mxXQW53ViWt0T
	 LXQirhda9BJLQ+Svzk5lMRLBY8cjf5Ne8YZ66dV+OcNWojrFASXFOj+oCzM4GuSwn4rIQ
	 +UVYLDFtbYq06s2luNaVuScUdK+JL8EzTwvhAKc34v1g+HMlrAwp3Pb+DNU+F2LnskA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MwpqHJf9;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AB2606A333
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 19:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9AB2606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MwpqHJf9
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso2849847f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 11:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795635498; x=1796240298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dXKYI3EJxaQV5jIHUv9yi8G36X/Qj3DOc1D0IScmz1Y=;
        b=MwpqHJf9Zki+TsDgpLUnfz3iPp40YjADzk8uJKW4iaX/Zwuc4txSCT2qW0hS2BEx0g
         /x3x00L9fmJk9L1f3P/+zNZgVjAK7GGPAHL9jBT+GA3jPx3nQB9eBXxZwvr3N+gnJ25E
         tpHQbwzTSIeeg5HB1JboF7LiGiPMCWAFUBCpIn17A1jiKAjPJaid+SYLvzVCGPHySIAH
         Afslz28eQ9JW3GidBgF9AKbS4Jtxw3FLREt8UnXWrX4dta9VcZnn2M9Pwcp19XNVXK+X
         wYHW9PG5er9VAQSOhaovy3hIrSQzULFNUcJhK0a29YC6TicyUh2bwN85kNEBLTxwugTk
         mxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635498; x=1796240298;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dXKYI3EJxaQV5jIHUv9yi8G36X/Qj3DOc1D0IScmz1Y=;
        b=vAelOASHLvbWHNbf8EAp+Cs410dwXUzbd1TYoawOz9SW3Uy6cGoa98pm13PiHUVPmY
         zEH7KSgFa3KEk/IMl2h8pUAYcVfC+n3G/euu1IBSz435hT7LeZcBxzUTQbt4W8Bbt4Pq
         O57KO7UJe9jNW1JYzYD6MvceNQKIfU9q+vMEcy3dxSBLqSgFMcaXHrcO9+yqAWlhIPAV
         WxmY5m+a9TeACayVkTHdCzvkW0Q1mTlLd89pEyIRtgygLCoO8NSN0vhI1896V3ecZgc9
         680EdcrYGqeI8g75u9iKIzkgm2m8ZhIrthVe3CwvocoHPCV1o2SUZPdgI5JmiwAsJ25k
         uU0A==
X-Forwarded-Encrypted: i=1; AL+hErFl8ENDgjwSsW8rRY/qri8Ibst7Ppi8Qhx4SatZ4pwIMtVjLxu8Ks5vuj0wk5TStjIJ86rKsTW8/5O6zA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/4C7vXURO02TX8A5uYW+vp9L8wBEUMIPO/l+DwCckg50LsMwEM
	YFQRYJb20Wn2K7Ws5DZ/DIy9aDgWwc69ub5xeeB+R3K4CjoQA0KB5RAn
X-Gm-Gg: AZFdTZf/JkIc3+kPUa1iGlytwNDxGavF6HR7L9/GQT6TRIOnSHHrcE++8sRVOz/k/B5
	4vcUPOCMrGDdeDHdbbsNl0kncQXHPY+KfKhknB/oPlGjNlo6Q643/i86fty+G5fH7Ehb/Bh0dGm
	pS3YZ17XbZoTV++Uo8olMWEOlCz089F0xue4oT6x709Pc6ZsAefnIwLcNUSskdNyTTusUrHpxzE
	LmXX0S9CzS3KowLenQw5klgNmBZJrK9g7MpGjva3RhT9sgIUOc5L5wwlg9nnGlEtFaLkQcpef4T
	P64Q/uthwpXd8iuegTZW/DFkoZl12rGkM7sU+/ifkqC7kH2P8EFMNSiVY644fqa8qASQCqvkCoS
	hL+ZHH1QztxVOPAFiRV3oIiedwfhhles86MVrUIujEkCrKL2A7mqh4MLC2l9Iz3N+pv+FfoLocs
	CFj3jOXxemiyD+jNxo610r2mFX+DTOIhih8HwpYIwJi6oIKwzQUFF0v8vVggiB9CycTYVZd2WZf
	XZ4RWMf0SpjCvZHqAw2RmBvSNdIt3OrW2UWhvEjkCFamw+Ez1DeuteD/HqnmL+jdRCPczxct6zQ
	TSGRLY0KWCbAMIBCWNPkupTnZ7HxK/qUxzQMJoF8KQ==
X-Received: by 2002:a05:600c:1549:b0:4bb:741d:ea8 with SMTP id 5b1f17b1804b1-4bb8880ad4amr366178805e9.7.1795635498187;
        Wed, 25 Nov 2026 11:38:18 -0800 (PST)
Received: from foxbook (bfh118.neoplus.adsl.tpnet.pl. [83.28.45.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm848261515e9.14.2026.11.25.11.38.17
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 25 Nov 2026 11:38:18 -0800 (PST)
Date: Wed, 25 Nov 2026 20:38:23 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Kettler Christian <christian.kettler@stiftung-kifa.ch>
Cc: "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Logitech BRIO (046d:085e) stops answering control requests when
 hot-plugged together with a USB-C hub; usbhid probe blocks hub_wq for 60 s
Message-ID: <20261125203823.15fc4478.michal.pecio@gmail.com>
In-Reply-To: <2ced9c1fb45e08a94f56b0f569b01369044b5553.camel@stiftung-kifa.ch>
References: <3cd5f994a6260960cf7751d6383f2b9afc1baeb5.camel@stiftung-kifa.ch>
	<6118ad01-65a0-4357-8118-3122479b554d@rowland.harvard.edu>
	<2ced9c1fb45e08a94f56b0f569b01369044b5553.camel@stiftung-kifa.ch>
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

On Wed, 25 Nov 2026 15:09:52 +0000, Kettler Christian wrote:
> The timeouts are not limited to the BRIO, though. During these runs
> the hub itself (VIA 2109:0824) once failed with "device descriptor
> read/all, error -110", the Realtek LAN adapter inside the hub got a
> -110 and was reset, and the hub's card reader was reset as well.
> Re-authorizing the hub (authorized 0/1) never triggers the hang, only
> physically plugging it in does. On the laptop's own ports the BRIO
> never hung (14 plugs, 4 of them on the USB-C port on the same xHCI
> controller, with the same cable and plug adapter).
> 
> So this looks like a problem with this hub rather than with the
> camera. I'm using the BRIO directly on the laptop now and consider
> this closed on my side.

Hi,

Multiple devices misbehaving could be the hub or perhaps the xHCI
controller (looks like some Intel chipset?). You could try a different
one if you have an opportunity.

Though I have no explanation why the camera works on the same port if
the hub is removed from the chain. It may be the hub after all.

Regards,
Michal
