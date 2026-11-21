Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.36.144.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795292693;
	b=JhXazWt3aoTDtartlcRypf4tzyYfK0kkb6rAMynZHFQ2aw7ofu3/Zspt3TXoYVDX11zI
	 o83dmCCtkYzTsz23sJuf+uEG8VHX8u2blvypJbe/IjjP80VpvMqAAluNytzd3FEDMNRJU
	 n8kNiHQWXz2bRMFpVBz11G3Gj6Y6yqgEcfR0ve02JyzqFGb3oru5dWZxDrkgCs/N3CPyh
	 dpVTiKTA1Kp5SioODlq6OEXGev5pdv2VpBBAht8Sf5S4phaYZdZgpuCVxSgJH4D486swB
	 aW9VOqm/Mx720hw/E4oVpPZU+9EIDrOrQZYqSweoonaBG/YdNrQ/bCh8Rr3XZ7LsYTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795292693;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=WQfkT4MrujOO32FCQLaxhFqpRYxXCCbzLiXB97R+hyE=;
	b=kIPdPamcQ17+pth7oVo6gNXx9b69RunFLkrsR3szeQ0lQJHttl29A+UqtRGgnt9m/mEx
	 YFhaZW48Uxet1V+l8haYHll9ahRzjZ9KeDaxQ3/IynPwq9RYUg9tVnta4AiT/yfjS6TK9
	 DspLrrc+fTFbwGqWBGf/tHvX2SqNz1TiEhQ30IEp9qtBtg5NYUqzVSBBIBOymY9oQeKCA
	 GX+hETohhBVhOSS/L6zoD9nX+Y/h3e4VFAlm8pJB0y1O33K1Zsg5EKxqhwVJFWcKJ+pK/
	 dgd5Bcy7mNJ7WR6lxWGa22TPy6MAC8umWkXSwQme2fSKmaXrAnO48Xa6ovrm47gRHGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yoxcu.de;
	spf=pass smtp.mailfrom=yoxcu.de;
	dkim=pass header.d=yoxcu.de header.i=@yoxcu.de header.a=rsa-sha256 header.s=dkim header.b=i2rD9oCF;
	arc=none smtp.remote-ip=194.36.144.171
Received: from morty.yoxcu.de (morty.yoxcu.de [194.36.144.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F19C606A32A;
	Sat, 21 Nov 2026 20:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F19C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=yoxcu.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoxcu.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoxcu.de header.i=@yoxcu.de header.a=rsa-sha256 header.s=dkim header.b=i2rD9oCF
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9AA41D827A6;
	Sat, 21 Nov 2026 21:24:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoxcu.de; s=dkim;
	t=1795292691; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WQfkT4MrujOO32FCQLaxhFqpRYxXCCbzLiXB97R+hyE=;
	b=i2rD9oCFeMlS+4JUPFD5ojy4B3Xv2s8WuHWmn+G1KazF2ppPsOtvwUa9YNS6WbrLFeUeqX
	4Ha1GJePRHxZ5IED+9MRFi7sW0yricCzQfS3qt/fODzyGsoonsUzU5plYZuU5fV01WyUca
	+yFdBeh6A8bx5E1W7ENxjiiIGiuX/cP8dz9SCBbXXTsJtqhJrGJWV68P9bNsUN+hGy086x
	AMebUaT3SuJhX3PMPL+oIQug3tH2+M14f0pGLclVAZBYDEh3Thm6K+HeCjF9+L9r/WzwK7
	TJR7j9mBu+UfKQJkt9BGN4n1YyY1X28L3rzQcUhnDu0F2YY+4/Ak0ZGhg1ZpYg==
From: Michael Auer <mick@yoxcu.de>
To: doloers@hotmail.com
Cc: linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/2] ASoC: codecs: wcd934x: capture clock and SLIM port fixes
Date: Sat, 21 Nov 2026 21:24:47 +0100
Message-ID: <20261121202448.841666-1-mick@yoxcu.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <TYWP301MB0087A59A3E6B025A3F03E2F4A37A2@TYWP301MB0087.JPNP301.PROD.OUTLOOK.COM>
References: <TYWP301MB0087A59A3E6B025A3F03E2F4A37A2@TYWP301MB0087.JPNP301.PROD.OUTLOOK.COM>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Shen,

I tested both patches on a OnePlus 6 (SDM845, WCD9340 over SLIMbus) on
a 7.1-rc1 based kernel. Without a fix, capture with nothing playing on
the codec records silence there. With the series, a capture-only
recording from the handset mic has real signal, and the codec clock
(LN_BB_CLK2) goes back off a few seconds after the stream stops. A
VoLTE call works in both directions on the earpiece.

Tested-by: Michael Auer <mick@yoxcu.de> # OnePlus 6 (WCD9340)

One thing I noticed: with the series, each capture stop logs

  wcd934x-codec wcd934x-codec.1.auto: underflow error on TX port 7, value 6
  wcd934x-codec wcd934x-codec.1.auto: Port Closed TX port 7, value 6

and the end of the call also logged "overflow error on RX port 0". I
never saw these in three weeks of logs with a local fix that adds MCLK
as a supply of the AIF capture widgets, so the clock is held until the
SLIM port is closed. With your 1/2 it hangs off the ADC/DMIC widgets,
so the clock may stop before the TX port does. Audio is fine, so it is
only the messages. I did not check this further.

Michael
