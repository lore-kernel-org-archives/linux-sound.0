Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794142084;
	b=16lTbo7VOxnbUNjPaCojstZWE/8d73mB4OchjIm/GrVokek4EvjZwmbJ5zQHJgefjJAi
	 5/3U8oEOg9GFplsKtQAJZwtN0qVT827hr5Wkx4oODXgkCNnmnYUnRZ8R9Vnh2fQICArTB
	 xs1+cpcEda7Eg2GGhhc7W4VVKJLQdePuKr/7KKqHmHB212n8dNNtwtwcL2345YicOOx12
	 h0TMN79fc4wprjkEIxc9jt/hfVfo6+8vh38TtAg69P0VMWWoEsxtn0uFznxLyUEupLEaN
	 c1NTJbT4VhLDR797szVSmNCMeWUHQaMSrRQJkk0bBQw7hYy2yQJu3ALItlmB/Tadm/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794142084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2D/poUrhJr51I0Y86mgG4w0NUbMq+16qzUMFR1+iY44=;
	b=lQlxRG/Jebt2I+5UkVmQKc0rUnNmH264EDsWW1cMdVNKjcEAR3+vADLE4lRpvUGZI3v4
	 zME8AK+eoD2gwhx6wUbelF+BGKGUCY92ntw9iXNB+/CI0Xx1MyhO6s4ftgQa6oDpJnAO8
	 pb6J+JZIXInMBhW4BFbHjxUNj0me09yUNDCDFxvQixWRWZBCdAfMRpRaHLdn7TN6BdVMu
	 yji4IcwC4mETfmSI8fkYwxE9gBzH9+PD8XZ+YP9GclZI5/8164POtrWYwecuiXaaDyJzM
	 SXe16JLLpE7pHLicyTe1isX0DZZ4TEGXjnIRU1zQnFn/YdinVd0jqezezD/wXneKn1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QVrtRzOj;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582BB606A332
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 12:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 582BB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QVrtRzOj
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-170135e43c7so101926c88.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 04:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794142083; x=1794746883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2D/poUrhJr51I0Y86mgG4w0NUbMq+16qzUMFR1+iY44=;
        b=QVrtRzOjy6SWobypTM9M+7x7u/LaX3HJiRLNHSgDGN+OREP6jtrG3aaK2j8QZOL6Vw
         MNCcDELrNEIKaCyK117SdD//ebYBQYlpPP4C59gqDthYBzx8n0kraRkMpbXZtnzVtjXh
         +ISvNrkcads5XEDSQit+/SawUYFO5KX7lMqKuWJp4A/QVoYlfqGNPc1P7GV/l1d/oRd+
         HMSfebTSnJBr7G9lS0gWcY6a5QaDNBb5Dj3uNru/KscZQTWBMyw5w7Mp9j7GDu/40itu
         bkVnMqQ4cjCRG60YBbdWqHP67x7jW49VD/dNnpqeLeXObg6XilSKZkeTntL4mKuUQ9y2
         K0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794142083; x=1794746883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2D/poUrhJr51I0Y86mgG4w0NUbMq+16qzUMFR1+iY44=;
        b=j/u+vKjm8rIRFPz2DmariPd2vHstzbTTcg81Y+08EethAHaeWXottlqxVp7TtA3in3
         RoSreR+KlPxsV6eyKI84PWCvs4u7DZnvGUfFH5wdKXkJAkd6VAIgjzkRfdwkcY3vPjnQ
         rPdiddBggos2uCe76nYYSdV2kE8pkgvmKefzp0SNUzxdnOm69Rrd6EESv4MKPvKdQZWm
         AKavjLia/eDVdBh9l3bRiRRIadMbzqslyC0GexHIo0YIi2S4j8PT2HDzzyHtNZGdavm2
         GsS27JZY3cqQQWsYEBJun2ltvq+ZGYmIiIreUPJV3FaeVUvoptc20PW+kflAqFOJRhdK
         E/tA==
X-Forwarded-Encrypted: i=1; AL+hErHHetU/LqG+JIw9bqzFL/kHKEbAoTeh9lKT5NUNbYsO8OYTpxrbwMV9RpmPWBAuI2GivnuVwQn/W7Bd6A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Lof08BuXVwr1XqoOctFpfb7bOIHH3EivAmSf9ELbw/rPeUkWP
	uwRdTx9Zoc9m11TblrsMLDixGwmtzpbFBirSVujMp69G1nlQU8+f50A6
X-Gm-Gg: AYBFou38sV8JBNo0r3h4gwSu5CLrg74nI09riwmHZb5dRpZEr5jy7eS82BfKCyvz8Sl
	DoZLrXnFlck6X0NuvOjDZVcpzlIqyW73C2HLbDynmoQ2Wk0Xz6HyKnLpEZI8SCRrK7urhWZRCKO
	rhnmcwY9kvhIqhx+r3jnIFA/sQXHignP1hdMzbcMZlJFnJeboCy0iGwGsQ/tNGiuuqMJP8Y9SL7
	QUwsT6I5fFPfiAH5SgnkREslClfmmpfEN+Ned0V8UwqAQefbFzd+N2Zupj35FVTnJz2ivtfhIOH
	lXFJJyP2PysjCxpb5zNzbaUnUGTRQJFNfuRN/mX+/x083h/T4A3ZOd9oA4EsBoQPOWtk9OI8Aef
	OsvjMJAYA5zDBGA0ShbJ6n86ijTzeHLQzhH6b0wB30Q8sqQvWISZ1+qVRTkwdaP+IPmMn/aqhCz
	KhYdSiwF9LIp56TNpCB7jgqVqXxkjeZYhPcSNgLI1rSgl2pKPn3e0BBosoigdnuGNx9xJ/uIr5y
	OZHSrHM+hoxf6+aXxaktwikTCCmD6mAPRT/BGh55Udre0tdWOUalBo9GHhuYVlB7zZUlc8ckdFn
	DCwVtYtPwd7cgyGkvXDMEU2z0wv+CaK2GG5W/v8+PtarlfXmSlU=
X-Received: by 2002:a05:7022:b045:20b0:1ac:9da7:e881 with SMTP id a92af1059eb24-1b39ff16e06mr2303900c88.36.1794142083215;
        Sun, 08 Nov 2026 04:48:03 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.80])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5202424c88.13.2026.11.08.04.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 04:48:02 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: control: Fix parsing of numeric fields
Date: Sun,  8 Nov 2026 12:47:40 +0000
Message-ID: <20261108124740.3032-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87zevjwmrf.wl-tiwai@suse.de>
References: <87zevjwmrf.wl-tiwai@suse.de>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Takashi,

Thanks. I'll resubmit v2.

Thanks, Sreeraj
