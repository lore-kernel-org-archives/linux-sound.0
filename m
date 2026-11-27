Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795743822;
	b=ERT+DzRpTw+cRZ9PS7eEyUQJjRKSsjbCkt9gzkVgAfw7N2HkSLD3RcUR3/TMU1d2yt1y
	 gE5Az9CQidKGyR2M5VYnuvSWn+C7Yku0GwlzwZmBQCeka7rGrUKwcojee07Ui5f6T3Ad7
	 1cvB3pfGKz2mL+s1iFCB7Mqle3+QEVz7PzTlDnGlogITTKOz0SN3F2QqYICWPviWxBEnZ
	 CSji0wv/pcfp0gkMejDDP98JJAXCE+aM+ziLD+S7qrCY7lxjjIWFfWVC6LzDN/vqw+59H
	 5wHhIWLKasFoxXprtr5t+UU9/yKdInCuFBisqaFwTlSJGqXjx+h0BMDGLms9G9ApfbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795743822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xo3KnX6pu8TstZvZVNZC/xXKsDzkxxNmibHn2OhPFZU=;
	b=hMtPfBRaatTu0jb7hDDzp5NQ5KrmymbSne7oDmVfFIwlkdotiu017eI/ywcdJtxH3pe8
	 1IhEH2ZrQ/BEQNQ6FMljWxmH9SWoGGa664m//RILtoePhnZ++FquxT+2fXj0rQOYZhE5V
	 1gkfndMis2xfLMdbTx+sksSaJWNxbbC1q/6u4fV1ivZqIeLQc+2VTPCFPzpMbGpQwebi7
	 s1MyY0dgQawZqxG0Rcnv6298gYmWJp87yH/0FzTqQc8748ovVPjTMYn0zU/YRsQI+Odec
	 DWgZR21vtb4KbWYFuCQ/dRfgiV7iZn6XLqZqBba9lbjZ7QRhs/XzJNyf7RUb6xDvOZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Td6SkLxc;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA46606A31C
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 01:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEA46606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Td6SkLxc
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so49465185e9.0
        for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 17:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795743820; x=1796348620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xo3KnX6pu8TstZvZVNZC/xXKsDzkxxNmibHn2OhPFZU=;
        b=Td6SkLxcn9eWYx0TTZRt45GBCpWkmCEJasmmahp48hZWgPxdYfJdvOHzacpPU/9DXP
         gNq9/bFDP8dORUPZ1cBHnlLAZmVhbXrWhmbqZPCFbFNYjmAvO1IXFi9i/ihyFfplemii
         US2zzb7xLxpP9FQ8gJv7pDTCDN6whHEa9ZDKgq0hMHiUyQ7lUoKwogpfUpVnGJK5BNz3
         wLjhg37j4qXQgpdqgOcvwK801IqvW9ftssKIYrr7KB8ACJ6L1BnV5oRhGnpRjl25fYX7
         BeP2HSDicJ+NuvDlU9hUWJKUmpebuY/d1TpiSSS3d1IFvUOKQH9pgQ3sjQRoLPFhZrcO
         0RIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795743820; x=1796348620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xo3KnX6pu8TstZvZVNZC/xXKsDzkxxNmibHn2OhPFZU=;
        b=EoI4JgRQzosArOEU46zHcWrlOL/OPR9O2BsmwOYqXl7QKuz+oH3QP6eoxWmp7jlka4
         3Iku1x6h4izUQUtk9fa3v5727GR7THgjYwlALtCDIfeMHiZauA9Jd63jXPbTItPLcSvh
         WgTPl5oA0swr1CE9aOnGNVhAMt/U8HrEPw9Mjfs0xWYk6FwiDesMJbfAO0wthlDA1Wd9
         FDQjA7L/iDG/FTYC4C8s26Tw6k5ULmaQhU+SU7Jtdwkw80AeP5Ie5TG8f+roK+bbW09e
         hq0LekG/I+B+k+Wy4szAHPXZXMe0bJ+cYWOh5jF0OXctzwqEXzfHotSA9VuT7dSZyuwj
         DVhg==
X-Forwarded-Encrypted: i=1; AL+hErEwJZrv/jkONhQSpKToGUXJa9wchc6wYU+AvbfNGTe2ocUZatCFQrnCd5p6/wFr509NhN7Fxhf6BpMEyA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/RwZUN5/6uKrriQ7auZ0temszJFST0XTOJJQdnQMeWN3QnZOh1
	P+DoTCot1q8IhEGcPrN8VAed8mp3vXbU2KDLcw467aY3tx/5RYIWpWaa
X-Gm-Gg: AZFdTZfZ5yFxRBKR0y1xiSzdfHcvEn9/2YkhtkrAjirZ8U8STB5WDSitl+ILE1cLgO+
	/AmGu5EWvFl4CcNjcGzi2LiZFDuGOkTf1kvovuJOBU6IsKdU8NlB+fkx7ANF+Jnr8lgY+uWI+ru
	1yKFPNt5rLLHUs6KmZTECD81ESaFVb0yqAonXJ9Lw5U/98i6gUGKZx/Irhz9H66C4YBoQ3+2Dkg
	AQhb/CEU2F+nC6GpAGQDMSntRpCL4ZWU0PZcNo6wz7M0CVdAFI4bMsCVDyqCTH7J0XldsB5LOWv
	WjZAi9bODghCmfEQ7M1nTV8WRbxuqz0HZ6WZ0Yy5U8ybfx4s5mqMqTlJlyTFisgBkXsv82pwS7n
	KNrqzzlpQxqgtT5ncmt0jnbGnX8v2ZPNpMKzbsxEoc+qHrGf9WiuzrAaGEX1AMHjqmWUw18q/iG
	cQfTicZahM0AO5lW2itdk50GgnkA9RWWXFkPc+MryFUO52qaaGPttPoBAK9yp7TxygysfZvRykH
	jHJQagFUsuiSq8ptrgjLBvH7IkrQFiZ5ZpdOG/xHhpo5p5wQ4mRx9hHQF4TxXRzbDy3SbEBRowk
	K82qfNZuMBL7Pet2byr4kqQNqN8jOZkVLc73t2iedmfbYuIUzAdh+wceL3XeM2aaW+Zy2f27m5Q
	4QpZLastpNrCGcvJHPvmxaome4ATB/Zy29XnCcEZEDjyXcw==
X-Received: by 2002:a05:600c:3b88:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4bb8880789dmr521380065e9.13.1795743820179;
        Thu, 26 Nov 2026 17:43:40 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906817ccsm385176475e9.5.2026.11.26.17.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:43:39 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH] ASoC: sun8i-codec-analog: Add the headphone inversion control
Date: Fri, 27 Nov 2026 02:43:39 +0100
Message-ID: <20261127014339.1611234-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179476597358.140154.17606905713832103924.b4-review@b4>
References: <179476597358.140154.17606905713832103924.b4-review@b4>
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

On Sun, Nov 15, 2026 at 06:06:13PM +0000, Mark Brown wrote:
> What about the configuration with both set simultaneously, so HPL = L-R
> and HPR = R-L - that's fairly standard with an actual mono signal (ie,
> one channel as opposed to two copies of the mono signal), doubling the
> signal over the speaker?

I tried it on the PocketGo S30 (speaker amplifier bridged across HPL and
HPR), 7.3.1, plain stereo path (AIF1 DA0 "Stereo", headphone source
DAC). Bits 1:0 of PAEN_HP_CTRL set while playing a tone on both channels
and another on the left channel only:

  bits 1:0     both channels    left channel only
  00           normal           normal
  10           louder           silent
  01           loud             loud
  11           silent           silent

With both bits set the speaker only gives a few clicks, for the
one-channel signal too, so on this codec it does not give HPL = L-R,
HPR = R-L. It does no harm either, so there is no reason for the driver
to forbid it: v2 will expose the two bits as independent switches
instead of the enum, and the S30 turns on only the left to right one.

Thanks,
Romain
