Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.252.153.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795857799;
	b=RuuOWGjvpxVbEYoHotwjPFb4cHhiCM/G/K4gToiC8LUOvzSHFUidzIjWsmrVVRZ5fvyS
	 2e4P2ajYXlw1WQt83hER4UYXpyqiTbpBD3IjATfcQh2YYT5x0e3NT95DPMSTONoAxMj/X
	 soYUzh11AfAEh4kOrz87eCC39YtHliiSrpjuhpCVm4Lhd7uZ2O1B5yPkbKZ5XEUc7oQKj
	 uRkmqGs/+Kwmif/eHIpYWxihMmANl2xtBjgS/2Pn2rTp6Tj/nQ8juAIRWKqDzrGJLUEcZ
	 Hv93dKYCqnKba6Pe+WYkQsY1ti6ImJSAvelWTz1tiJmtSUj778xtjmHh1vOif44GgYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795857799;
	h=DMARC-Filter:DKIM-Signature:Received:X-Riseup-User-ID:Received:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f5YZa2473cHDW4eG31Vhv01UDWeA2ysueLs7OmcxzUA=;
	b=aNEuyJts6/Bd7Zq+E1mW55AxKY9kyYDi+Y4PW5gArw1ddil8L4jXgVyxOGCJASDfJcjp
	 c4wcgGY6lICgXkc4jzSHLNSqD9fSpnxFz26th16/OhI56IGED3rbwQd5Q6DvSMObR93x4
	 BqTDy52ZaFe37r0s5/d3mfaObWufW4qnPG5pC8i6Jf3CSaOY334Z673b/G5lyeLcr3gcn
	 7oQCebx0pj+EaWIsYpwyUpDArhga6PG1IHkuh1ul3OC+r7ebamyAkbA5Zu4fcEXkPxb+4
	 +YDbVq62i0ZOoAxZAjf0VJ6BYm5n2zALK1PHuDDLgS6hMVZH78nRTfoQhvKtSBzu2sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riseup.net;
	spf=pass smtp.mailfrom=riseup.net;
	dkim=pass header.d=riseup.net header.i=@riseup.net header.a=rsa-sha256 header.s=squak header.b=BjnScGIv;
	arc=none smtp.remote-ip=198.252.153.129
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DC2606A31F
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 09:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88DC2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.a=rsa-sha256 header.s=squak header.b=BjnScGIv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1795857799; bh=f5YZa2473cHDW4eG31Vhv01UDWeA2ysueLs7OmcxzUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BjnScGIvg1VGyQTxAJIyo4qPvVeFW1rhdwnPWOQQYdUy9iA6eOdmW1AzgwZDz4NX6
	 SQXEoBgJNbCkZGyZLtXlg6wVGBdKfEcRwuChcDfL48M0qKz6MX5oOKTNxcR3dmZFs+
	 LHA03cf1e+Rm/6dw+lZJv4XdOfVk2zxIwgS+VU3E=
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4jc4Zt6ddwzDr4S;
	Sat, 28 Nov 2026 09:23:18 +0000 (UTC)
X-Riseup-User-ID: B0CC81FE637A5AF3A2C97B63C0D004BCB7A9E15449608D99BADAB9C7A9B8FC81
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4jc4Zs1zSMz1y76;
	Sat, 28 Nov 2026 09:23:17 +0000 (UTC)
From: Rafael Diniz <rafael@riseup.net>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH v3 2/2] ASoC: wm8731: use one sample width for both directions
Date: Sat, 28 Nov 2026 09:23:05 +0000
Message-ID: <20261128092306.1566199-3-rafael@riseup.net>
In-Reply-To: <20261128092306.1566199-1-rafael@riseup.net>
References: <20261128092306.1566199-1-rafael@riseup.net>
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

Playback and capture share one interface format register (IFACE), whose
IWL field sets the word length for both directions, as SRATE sets one
sample rate for both.  symmetric_rate already makes a second stream use
the rate of the running one, but a second stream at a different width
rewrites IWL under the running stream, which then carries samples of the
wrong length.

Set symmetric_sample_bits, so the second stream gets the width of the
running one.  Its hw_params then writes back the values already there;
rewriting SRATE and IFACE with their values under an active interface
stayed healthy in 12 of 12 trials on the hardware below.

Tested on a Raspberry Pi 4 with the AudioInjector stereo card, 6.18.60
(Raspberry Pi kernel, where the driver is the same as here): with a
32-bit capture stream running, a 16-bit playback stream is refused as a
format not available, and the register trace shows no write to IFACE.
Built with W=1 on mainline.

This patch and its changelog were written with Claude Code (Claude Opus
5.5) following the review of v2.

Signed-off-by: Rafael Diniz <rafael@riseup.net>
---
 sound/soc/codecs/wm8731.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index d2f65f543..0e639c319 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -606,6 +606,7 @@ static struct snd_soc_dai_driver wm8731_dai = {
 		.formats = WM8731_FORMATS,},
 	.ops = &wm8731_dai_ops,
 	.symmetric_rate = 1,
+	.symmetric_sample_bits = 1,
 };
 
 static const struct snd_soc_component_driver soc_component_dev_wm8731 = {
-- 
2.47.3

