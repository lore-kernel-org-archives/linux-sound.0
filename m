Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176299;
	b=MTL0BYI1dlo8oz9IvouI11W4vw49mWgQaVmBaAMFKbM0ajTaongZ3pG2BWjBccneyNVw
	 oFBLBp1WakDXAYVDaiZPT/1ZM7eFJ9gy6gZUeM1YYSKODkpPdogsmdRtYakAKn+B57qwT
	 Wzw45DZdMChaO7u8x/kRMNxEo+2gSEey4OymFcx3gV3Os2cdfW4bnNqTHSHcQ4/Rof6J6
	 6OvJ0biJGTSq7p9ukvXew+3PB8jVIFE8eA1gTfym6r1pkAQvlW0j2jToUmdDoUpKayukS
	 UfSSYas/YwwHZXH+WwcnyP9u2sBq+gnaWK/Iny2yQEPCgA1xnMYc6FQnuHnVIn1rTsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176299;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=ntnwPFxxRgCA0u9ScUDkYiTKmaZx1bBmwr4auBXvMlg=;
	b=L673vmwfKpUPcnQZUrLqwAE4jyYvYRdtVW/1lmORMgpnYs4NBOs86/KmS7QG/mOMPrFX
	 Sqh6R5wFVbEuejOovUd4ULxRbx6YMW3jl8CFZsYC14Gp18sIU1UuFM8g5YoTn7WwcXdFe
	 cm7l3lJ/NG3J4gUVzBSoyWYi5+N+g3jgW9Nv4U8CU+7QmAZtC0MgHY/y9Tj1jKv8ls4y8
	 HavD7wMvPTHZunBZEexOyouaAH3AJP30gj2Cuz+GyoSNaifDeXnl+KL8qBMRBJNb7Mzk2
	 cDhicZD1KNBAwLBSvVjPJAqvHXT1DwBp8/Olv0TI5ce3E94k6Ax9biwvmevr8n3yw9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kode54.net;
	spf=pass smtp.mailfrom=kode54.net;
	dkim=pass header.d=kode54.net header.i=@kode54.net header.a=rsa-sha256 header.s=fm3 header.b=l5M4ajtZ;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=w+HRFUhI;
	arc=none smtp.remote-ip=103.168.172.156
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682A7606A333
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 12:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 682A7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kode54.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kode54.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kode54.net header.i=@kode54.net header.a=rsa-sha256 header.s=fm3 header.b=l5M4ajtZ;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=w+HRFUhI
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 85B9D1400266
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 07:04:58 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 20 Nov 2026 07:04:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kode54.net; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1795176298; x=
	1795262698; bh=ntnwPFxxRgCA0u9ScUDkYiTKmaZx1bBmwr4auBXvMlg=; b=l
	5M4ajtZ6/IByWEZJOXsnDqsaYzqIZo9OGG+6Ctk6gGmR7yok5TA31NJYb9tYbmHB
	h9SYdjIADreqGmEZV2gHmtcwG1QwYe/FE2NOk6lNaibgAGbUZUWCJ8p7GF2ASW8s
	v5N920/jitR9Lfih81gR7dBEXuG62PvXRJTyJZpYGZyESjnYWkp57kiyFP5j2tnO
	tiiMertw9WtqECIRD9hYBGpYQJoNv7Rs7RS/9z7kIyKEHzyJY+DO6dW1U81HarXk
	X6VPDppHRTX+9buxIok7/DqHl5OBC3pyzCRpEF4Srsgq9FYoCqG+fa6TFIM93+2d
	zK6SixGku6AZmqmtXvmmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1795176298; x=1795262698; bh=n
	tnwPFxxRgCA0u9ScUDkYiTKmaZx1bBmwr4auBXvMlg=; b=w+HRFUhIhN/PTzc86
	J+0fG6n20pmYep3SZK5HS3ASZSDSmXAD3+npwYvrv/xo92m/rpTxM1SITexBi6ER
	i3EkaV/mEK+ym/XbtlANSHi289/eQQg+gPXkTwe5AKa6z5QX9QTVLoFlQLu3G2Pi
	OBPwP+kyzaMnG6CkB+C57kObILhkGtGFQN2KHvxE3+czG0fQFLBW2jCbweAUw8RA
	gT71/ECSMV5iNDqKgxTsBEAj817js0PSPaUAeefSL/YWzQKAao2KQMUbRHDgLndL
	ARBCfq3pzrYvJt1KkuLcWM+zsEyB4wYQkOFrjIbnSIHOg1r8pZjIlu3B7CJ9wkiz
	IwwGw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=kode54.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795176298; d=kode54.net;
	mf=PGNocmlzQGtvZGU1NC5uZXQ+;
	rt=PGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:k8gPHyKKjER8XVq+x9YdP3zfHDBXHOy2txcVACA08I8FBwf
	czEZaaBvv3zQUji4hLu335C0aeyQ1W8m3AfnL0x1Azwf6nHiM4H+96+ELM4SZhZj
	iYEgEdJj/aDGS3iIrAHiTsQ7NzjpBEppgOJh3CHpySnxH0dgR4DM9L8PGmGoqdeu
	kTOOHpZXziG+QmIIRkUVXqY7jPOsCVcd8itwaZKTZuezD/9sCAuz+7+PiQpTR53X
	9H1gEzuQWaaDFdBouMl2v2PoikStAvyT88zRYMSDg5bh7hvVNxg65SETAOV8uaUE
	1vBlmRRA26XaI7b8WouSuOyGnha+fYhvklYyy6Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:4llmN+XFH+ae2f2pRIQoQhhf87PVOVcvF8J5673ujes=:roRJLkkKQxjciiTHtIhlQBm1eQJzyqr5xHJL1lNH8z0=;
X-ME-Sender: <xms:ajcAaxBcKBtgoPaqKgjbgGABfPDbEWsk5xeklm7dFP1TEk6Zpr6WeA>
    <xme:ajcAa40Ck3UBPvIxRjl2YvSBzTJHQCFj15Q_cTDvI1bY6PXDqnynfBcWQcnLQRGn4
    1Shn3DcSp2Pd9mik_wSh1sb2NGpSWcZOMa3Pm50Ve_lkq1ycfNW0RZi>
X-ME-Received: <xmr:ajcAaz2TVCpGhxEkS8lxkpyKRHX_dG_HPC2VzHjKUY3cZH2zdnnk5c5DtS0>
X-ME-Proxy-Cause: dmFkZTFKR1zDAhZmbHLJ7CVH7GHk9rjnGGRA+5Gtr9mou2+Vn3JaeFoVzM8Ujj942CQARu
    m2b9tEmGWOZfV8SV7HC0CDkzHJGWfKZxGhOIjXbHoUYbLp/BdKfBzOjmlllP4kFzhah8KQ
    mINDatb9zaGT/CMvEDNVVSLoLGmY8719UVOae7yrF3o05rj1xdAfbr1ixG2l7/1YC+GlN8
    jeFnGhK9NFrKmO2MzxwRu9otKIgw/Ks6L+p4QC1gqIdS4eLLuHaJvxIXhzjX9n0NBlYTLO
    OOwBj66nv+o2sFYi6avSAxDZeD8muhEjzZ14icozEGwp2p0nevSvuMV16m5WZT/D28gvEC
    P2EpZyS+HUMqyhx/jU0q5ZFw0hYuLW7HTURtzNKQMrLsrPJGA9oSKj1kJwF5w17P2Do8R9
    MQcrxdzTOuLlX3zcSDzQwMgBW4t7O7SUn0/Yjgrn/L4dNcsMapQE0a19WGTyAIIORoCBF6
    tQ7GpKS9hkY8uECCv1VnQPYIQWgd/NY6pgj/JrI4gGErxOuxFvZmJV+V+2PSEcgjjJF7BQ
    WHJwklPt7gWZ5XJhKhtvGL6nCXyMOEaM0PbASP4L+bEnbaOiVS/JGGjtu3T8rD6zXjRpT8
    4KEUY3/mIJEjmXIZZfhRk03RfF2aJOi7t/WW44HBOuvQ34RG3YX0j7TW9f0Q
X-ME-Proxy: <xmx:ajcAa9CdtzPEqH0BV98SjDKZF2HKqxB4_N5ilhKqJERXA8oiN01OfQ>
    <xmx:ajcAay6Iv-YktUOOy5Kwfu1Iw5HDzVTSuaM4NheitTBZxxznn5s9vg>
    <xmx:ajcAa-JTHMFS-Pu9K04Gha4ox4K6H9yKdkFJleb4ENIMgFNLBTobBw>
    <xmx:ajcAazufCOja_yEi5uBDE2-qQAGXm6S2_u97uvad76k137-GpeVKSw>
    <xmx:ajcAa0NIKPyhmbNc4Fu8oGuWOB5rXFHbCClfICWzIJQoWmBTwzIhWzQy>
Feedback-ID: i9ec6488d:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Nov 2026 07:04:57 -0500 (EST)
From: chris@kode54.net
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Christopher Snowhill <chris@kode54.net>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ALSA: usb-audio: Ignore trailing whitespace in quirk_flags
Date: Fri, 20 Nov 2026 04:03:47 -0800
Message-ID: <20261120120356.10909-2-chris@kode54.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120120356.10909-1-chris@kode54.net>
References: <20261120120356.10909-1-chris@kode54.net>
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

Writing a flag name to the quirk_flags module parameter through sysfs
with echo leaves a trailing newline on the string. The parser keeps it
as part of the last flag name, so a valid flag is rejected:

  snd_usb_audio: unknown flag SKIP_IFACE_SETUP
   while parsing param quirk_flags

Numeric flags are not affected because kstrtou64() accepts a trailing
newline. Strip leading and trailing whitespace before parsing.

Fixes: ffd586126a82 ("ALSA: usb-audio: improve module param quirk_flags")
Assisted-by: AI
Signed-off-by: Christopher Snowhill <chris@kode54.net>
---
 sound/usb/quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index a54fabce7920..cff10fac496f 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2765,7 +2765,7 @@ void snd_usb_init_quirk_flags_parse_string(struct snd_usb_audio *chip,
 	if (!val)
 		return;
 
-	for (p = val; p && *p;) {
+	for (p = strim(val); p && *p;) {
 		/* Each entry consists of VID:PID:flags */
 		field = strsep(&p, ":");
 		if (!field)
-- 
2.56.0

