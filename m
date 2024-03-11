Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C544D9E4
	for <linux-sound@vger.kernel.org>; Mon, 11 Mar 2024 16:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710173106; cv=none; b=mp3uR/Q+0tTQv1iN6xPmFR+MPd2FJJHdG6EFR81+VUkd4DAar8EMg6Eqc1bWZ66hBQrGtJqMqqTZy7QyoQwZa1mU9h/B4yOCk/9m+zOSMjsrjFQbYU47uqssEAgG/7jkmP8Bl6W7pmW4SfzP+oqeNHdEeSGv6+KheTTTggD5zp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710173106; c=relaxed/simple;
	bh=oK19NTb8OE8l64Py7Zc1M0zaN08fWIWIHLP6E5P+7lU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XR3RbUjYnwOc1m108GZmiXYlzZJVItBCbdkyZg3I6Oavcszsf89SVCi+ExyRilHk9IOoBPIZo2GTI9lH+PQA1yutxuNQ4JyXMhMEq0xfgPlAIyRI6qL+hahnQ9dfwU2WrWK63FShA4FUp8riZRo+MyasT5LQxrBxwc/KTFFOz7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ZUN2Wfom; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ZUN2Wfom"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1710173093; x=1710432293;
	bh=oK19NTb8OE8l64Py7Zc1M0zaN08fWIWIHLP6E5P+7lU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZUN2Wfomr/Bgyp0o+cl6o11ByQRgkCi/zSh4KnGA9kmO19UhoV9zN901ksb7EmPt4
	 pUtlLS4lrgycNjvtlBdiQbTcTfnZ0mggdECfOli6Ywvf3jDGIeF+6BuPHsq8vQp7J3
	 5OR2HmWYUcyhmmxrZ7XT54UAjDEsPJ0tWmaA6vdEAj71CxEC2sLSiZNsLOl9PYaCMQ
	 Yc+H6cWBYT40p+HiyAgGC9XyFjpwMUBXqkxRSCwmI8l/lYtNWDctero2Hy2UpsbyQl
	 fd/22Rw9YBX0Ov0vzljeNlf4F0rq3/v0sDcB9WIcN5fJSMBSO5UaQRKfM7qeCkw1CQ
	 D7A0yc2Mp0mqw==
Date: Mon, 11 Mar 2024 16:04:31 +0000
To: Takashi Iwai <tiwai@suse.de>
From: =?utf-8?Q?f=C3=A6talize?= <faetalize@proton.me>
Cc: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>, "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, "trivial@kernel.org" <trivial@kernel.org>
Subject: Re: [PATCH] fix volume mute and mic mute LEDs on HP probook 0x8a74
Message-ID: <UwvCaJlxd-Yl4F38jw51-h6pkKKDF3TmgctMT_FviyLpACTtzCTj_NSU3sp8LDuJrLmvpIo8maUyh_cZkjBcevtbucc859HnRV35h0E4nWQ=@proton.me>
In-Reply-To: <87sf0wrclk.wl-tiwai@suse.de>
References: <_svHAlMKMyPfAYW80GE0F2Nh_0nIyML552foHvCW2Zr7rT4bgt9wKaTVDP77iOL2CCoFzh0uuvwEXRAgSH-DqNwTyZaRY9fIs9bCb5763Zw=@proton.me> <87sf0wrclk.wl-tiwai@suse.de>
Feedback-ID: 76527010:user:proton
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> The fix looks trivial, but to be merged to the upstream, could you
> resubmit in a proper format?
> https://docs.kernel.org/process/submitting-patches.html

Yes, I may. Could you please guide me, as I don't recognize what is not con=
forming to the proper format in my initial submission?
I'd like to learn. Also, do i do so in this thread as a reply, or as a new =
submission?

> Or, if it's too hard, I can fix by myself, as this is a really trivial
> change, too.

I do not wish to inconvenience you, and I do not think learning is too hard=
. So I wish to try. If however you believe it's better for you to do it you=
rself, then why not. I consent.

Thank you for your attention and efforts.
