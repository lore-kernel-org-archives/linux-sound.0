Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93DF37B028;
	Fri, 22 May 2026 13:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455965; cv=none; b=J7gdMu8CTNrhmbo7nkkUr4ammSEx5oP7tYL/GgGjGM7sW/JRrfxbXU7oj6hGmB9gh6XAUwi38uORAgZVQxeoksSmSIC8BDYQe5vp4N9s04VJu7Jo2cGV0D6aeYj8VQ9Sm451xkrm9QNy+5ySIRFJKXuQoqS0x9nW5iGqSrN7I50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455965; c=relaxed/simple;
	bh=hoxYxDOo7QAuogJQa2VoEG51iVZc/JJgdD98O6Iq2Qk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=k0R4qUPsuaxDsPmfAYv0dydcIMpEFuJ5gTo/jExqViVwP+9YActGRXO0FbC9vufdjYD3fuZNg1qOnRnJKdbYWbPX0iid143fAu2t6rXXtKb5+i5bNziXsWMy2z5YvVlUb5J6+sp4aKf4U7Lyi1chEcTvUXNN/pgUbXuF+vVr3Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=pIKIhg09; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="pIKIhg09"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779455879;
	bh=4RACIIvqwwKv5OCUQdl3TRRl83JS4BtgYtRCpIVcu3s=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=pIKIhg09gROL4RrM6IF9QMiAOTuibpCjCOeDLpcmw/qk9+NlkEVtpXr1DVnpoxGk1
	 d/TSAkY6lHswwupW1gYVxg8DHHM2hpr/orzJsnXx2qDmya3jF9vWhG7gIvYYlc0WGe
	 Z9gsJa4wle7rRHHfFUWiYp3tU9XHrUZHgbv8o6t0=
X-QQ-mid: esmtpgz12t1779455870t569a11c3
X-QQ-Originating-IP: GqlVLBy8xuQxz5FB5yHZfEci69R+BINM8B+fRDdGZKQ=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 22 May 2026 21:17:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3995857162579613603
EX-QQ-RecipientCnt: 11
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 May 2026 21:17:47 +0800
Message-Id: <DIP8GKFQOKZL.9JA38OXBFMIA@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Mark Brown" <broonie@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Yixun Lan"
 <dlan@kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <jinmei.wei@spacemit.com>
Subject: Re: [PATCH v3 2/2] ASoC: soc-pcm: constrain hw_params when DAIs
 share the same BCLK
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260518-i2s-same-blk-v3-0-2ba1c4f41db9@linux.spacemit.com>
 <20260518-i2s-same-blk-v3-2-2ba1c4f41db9@linux.spacemit.com>
 <be91aacd-2e02-45d8-9293-e9551f688c68@sirena.org.uk>
In-Reply-To: <be91aacd-2e02-45d8-9293-e9551f688c68@sirena.org.uk>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mi0NhBPPe/4RLI2RuIhAfkCN6237JtruPC1Y0HM8JNh081CTP6BFBOEL
	B5EWbccDmtX38n7OWDfXe8sS0RUyC8XVsqq6GeuGIiHIW6BvjnchrXUAZ/icvRiyeeP5aGB
	fjq248nWBYALBn51JlW/cQMJ1UWaFu93f3hKEoaUJ59plpj2u++hAu1N7rc3CsBQrIE9wYJ
	yANDhlWsIR2BplIgfx3YMWvIMsGMdYThxc2EXS4gYZJPJJufPtGvnwErLOSnH/FZzYzs1R6
	PqkS6Eg9oasO5fuDizzAu9YS+MK+Lv1UAoJiaGFfLz5xBHWhEIno5kDJ8c2ehY2IF9wu5OV
	cwbPhgLkzHFawxtAzDYMc7UTW0wrHGEpGWEQc9uzfM5nxgUYPCv3yvz8mb0HKZN/AeVEyec
	y2nlU5RgR7LreONWwux8/SunxpaeRikBBwehvo4+qhuetbbOW7tOXUcW7zistLXqy3zdwCP
	R/PT+WDGBDj4nBUt8RRAMVC7xkZ9NEvhIW19ustPrC+ndhs0X8lqq1ud/y8ysvQrxId6SwA
	npsi6JMnTcgH2j8Pxl9rlyasjyqbU4Qqh8YCOzO2R4cRhXlG2i4DCjKo70nd9X8dc6oIw/p
	LKz8KIR2zhFoSGX8xT90m+ksjvnXUEfeswpi9OZScTKN7eO8ymFAdMSv6pINKVOtOU41hoD
	MOjOF5dcRcCIkGZief3tIu65E61hoDuF8XH45nN2SfbvPp+sDcvs/AKDvYsGa5WbAcK6WJN
	ej837wLU6yyz4whksGCa4wvn17wFZ+7w8T7dQjkD8Of6M2Rc1zjB/yH/ZxVKlYkcK4zUpAz
	RV64P22cbjsorrDoWwGkdzl18O34MSvRaWfhOvijADX7/D+KwhXYbK5GG4m/KdMSZWx4jcr
	r/YUuBgf9aR7SxxfzXVg20eTlHBKq0Dmmu6P+ZXBQ+mGnUFqxc595UGrREjJ1J1dpKHeURX
	ObpCMf/cCAjXpQYHhovz6Wiu/vSDgo+lFu0aQLp0YoG2pRq1Ahjpqq1EFuvCmUTxOYZXhTR
	vt0oIO5jLOs5XOYFSzqDDCcRkXur4TDOBry27nIRscYYSIT6HIqBAcgdtJAyIa7LniwZpeP
	8HcjL+9xNlb
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

On Fri May 22, 2026 at 8:58 PM CST, Mark Brown wrote:
> On Mon, May 18, 2026 at 02:21:09PM +0800, Troy Mitchell wrote:
>> When multiple CPU DAIs on the same sound card share the same physical
>> BCLK, add a hw_rule during PCM open that constrains the sample rate so
>> the resulting BCLK rate stays consistent across all sharing DAIs.
>
>> +	/*
>> +	 * Protect the rtd list traversal.  No nesting: this callback runs
>> +	 * from snd_pcm_hw_refine() which does not hold card->mutex.
>> +	 */
>> +	guard(mutex)(&card->mutex);
>
> We have helpers for acquiring these mutexes which deal with some lockdep
> issues using subclasses.  Either use those or provide whatever's needed
> to have the equivalent thing in a guard.
Thanks for pointing that out. I've added a local DEFINE_GUARD wrapping
snd_soc_card_mutex_lock()/snd_soc_card_mutex_unlock() so it picks up
the SND_SOC_CARD_CLASS_RUNTIME subclass while still getting scope-based
auto-release. Will be in v4.

                                      - Troy

