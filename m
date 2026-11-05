Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896382;
	b=vz/GskYBl19XDI+LMV7MPj+iCQ5ER4NBjJ4h33zn2r+an35Y/GplP/GIab8K++hvfuhr
	 l1OX/hOCPLK0k73Tp/cu7sl1BBMUU+xEznaXcARTf1r+ruLsFT4GmHBI8VDJ55iTXnwCo
	 zMPdsCl30J2tqb1qJyUD2GgDEeYVwHyxF5ZWtgo8vuU703eY7YV2bgntBOXWXzPNP9w3i
	 jB3e9KP0peVXCoOiou2/AuiIfJ7DXr+RvwAPONeopiUmWRWXUH2Pmlc4baOyY1f1VBVlI
	 6PH4/TJ7hDzjhvvnFLoI1TYWBCTGKT0fTFpDncMqsljazpRxEwZA0wMQvY3aRYUs5xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=XUXEvm+x/520Y7mG6qCOQoTpy/YNPEI1fZRb82iDonQ=;
	b=pOXEcrpHJdQQHuieb5UNrHgfRXOlVYqYNhOZJCYBQBWAUUuo2VARa3tNoK4ixlAW/EuC
	 ES7LsQQ5udWMMzbvGS7gADfPcdVYbAKkz5iAjYuie0xbLn5CBIjuF24RHpb4TDxy23aFK
	 aP3kbUcvLCRin2+HTrVYTjVwvBBC0AYniOosf+VAAMc9rPBJiTYQnGHOz22WJR3x4FUGj
	 SdILgSSSCFMteO2B98ViFhC2LLd/AtfivA+sjn0rHt0RoQGhbLqkTBX44FO1ITb9OCvAA
	 2eEFakheYsuIIXKKFdMUiMNjxhCMdSmbGViUqfZk3NX8FnL9tXfvItml9pQPec4wAww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=debian.org;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZIDijORl;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE8560A262D
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 16:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFE8560A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZIDijORl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so16966445e9.3
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 08:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793896380; x=1794501180; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XUXEvm+x/520Y7mG6qCOQoTpy/YNPEI1fZRb82iDonQ=;
        b=ZIDijORlWOpzf5a5XcnQtJBxUwIcwKG495iGPJKkK+btm9KAOoMOJwVJl4OOHzOkNv
         VWxmpEQTIdri9U6c8WWbxcXNdpeUw7vA9OPev399E/jszK+plXaFgpJneHuAT9UB/QYc
         oZQKRyn/c5tdDgoK8gIZ531hHmOX34tcl7834FGOGGKC7cpupdpVs5R56d8tJw/2TpP5
         AbQDLVyJa8Jj9FU8G5RKk6vUXCKKFfoM0q1hbpUVueP/yqKs7fOGIJm0k1b/7wDIuroo
         EQPeQ6cSNvq14gMMADAmzQG54E3kZGA6/qrKmYDUhE+HVZ3E6G63QM7Pch/AbhaWo0Qh
         D5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896380; x=1794501180;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XUXEvm+x/520Y7mG6qCOQoTpy/YNPEI1fZRb82iDonQ=;
        b=o6TCafTROUZ5BeuJblkhFOK45T+Tk3QnxjkMJZBkR5B4PHiQLHTEHNXzfhQRHcM5u6
         9LzB5BIZ+3S20HIv3C89jpdb/fr+ldaWMo0aoQq9a7Twhujj0eqbUn5gnK/ODVTReVRa
         jLmFopznGeyoVdI49wiTrw4BmNSl9B4ZLiEy1opn4WyML3ot3XV22eV63Bl+7n+S19wa
         yhWreiDNU2oraKGBUOFGyWCvyHBu5KD+1GYKQnKg/USb6Kkp/65NXwbtifRPnjN4cGaP
         8SNGhrMybo+QS1oAe2Kb+JStAlMDEyt5+tS5YJ2VEyMNy3OMLeiUHByxriM4fFLm3Q8U
         yZig==
X-Forwarded-Encrypted: i=1; AKwUvBxz6tQ8fMfoquRhVjlCan4dQAoXGMXeNTiaFHKcjoxZtly9cH4tOj1KKw3HGtxdriC120y0GgCkT34tQQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+n+gu+F6OP5QSSB7T6wHpjlPUtOTQPq1XeIs4wts5AGkh9B6Al
	t3qxZMRjQa+SUiEoRkR0iy0JRwG4R0g+GFejEGM6BlYfSZScFPIoGR8s
X-Gm-Gg: AYBFou1gstfIpb0Ca3oZ36BFPWc8FRZkw1bzN1M44tt6NYn3rnXYbVMRwhqNPDyKbOT
	1USTXCFNbtj1zyO+gb5B2z0eHjGPLBkMmZR9H9pprAPPfC61mI+deJ/9BdidakB1IHmYV8ucRmS
	OzQhk/sPbYRkDIhdhdX9RwnfHyos8/DZ5Bni38QHY745EcygIrIykINj7KZFb649E2xshth04IE
	c/zW5WAQ857Qi/K3UZXD9H+Ji5rvdOcR0iAnJdZ2A12q+FPlgqhRfP2aZyGxlmVuvDXPChOjgBz
	drdEQtZ/xXuAvg7gDWQLh6FsD4V7auwTcGilDRl7nZ2uj+gf7YX2ONRLbe0S6rPRKJnqNp95F+V
	LhVqw9UJNkOckShecd36jHkgGuXfClrVJ7noCVH2BqkzrzUl+1+SL0KK1FJ02W29G/AZNF5epIW
	sFnOzKtw6EBLkj3Abn+SS2YR51x+/uky1uopGFpVG+VjL/pEsUV0/7ElF/s/rC35RNWMyyJxp3z
	fg+N8OUMLKqFodiFoP9dqcQD4SVieOXPv/nmVo6gDU8MbC98wRvt53ND2BsphxDtFJx9Y+gKHhu
	m8qJNhNeJ3lrjJmN5mtNfgFawXu0/+cfpYsGR6RwktAozj5QMHf00SMTsj8Z5x8=
X-Received: by 2002:a05:600c:a41:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4ac150b2136mr409947835e9.4.1793896379969;
        Thu, 05 Nov 2026 08:32:59 -0800 (PST)
Received: from eldamar.lan (c-82-192-247-196.customer.ggaweb.ch. [82.192.247.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56fca22f4sm125983355e9.13.2026.11.05.08.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:32:58 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id F032ADC02C5; Thu, 05 Nov 2026 17:32:57 +0100 (CET)
Date: Thu, 5 Nov 2026 17:32:57 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Sasha Levin <sashal@kernel.org>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"eadavis@qq.com" <eadavis@qq.com>, "tiwai@suse.de" <tiwai@suse.de>,
	The Darkbird <thedarkbird@protonmail.com>, benh@debian.org
Subject: Re: [REGRESSION 6.12.y] Please backport 70b4db7d2581 ("ALSA:
 usb-audio: Use the right limit for PCM OOB check")
Message-ID: <auyvuXTfDDGcCTZN@eldamar.lan>
References: <shfaXkZCI7FtyNr5tS4kCC_d5E4uQFhc0MtwJa2CQFXpNMfSw7Ub6urwWpGrcoRnHuoneJEi9mLwtnvVImMhz1Hb25iwNJxx8GZZsDCV_HE=@protonmail.com>
 <2026-11-04-1-daily-reply-0005-re-usb-audio-oob-612@kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026-11-04-1-daily-reply-0005-re-usb-audio-oob-612@kernel.org>

Hi Sasha,

On Wed, Nov 04, 2026 at 10:03:14AM -0500, Sasha Levin wrote:
> On 2026-11-03, The Darkbird <thedarkbird@protonmail.com> wrote:
> > Please backport the following upstream commit to 6.12.y:
> >
> >   70b4db7d2581 ("ALSA: usb-audio: Use the right limit for PCM OOB check")
> 
> Queued for 6.12, thanks.

The commit ef5749ef8b30 ("ALSA: usb-audio: Prevent excessive number
of frames") introducing the issue was as well backported down to
6.1.191 and 6.6.160 additionall yto the found 6.12.114.

Should thus 70b4db7d2581 ("ALSA: usb-audio: Use the right limit for
PCM OOB check") be queued as well for 6.6.y and 6.1.y?

Regards,
Salvatore
