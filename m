Received: from mout.mail.com (mout.mail.com [74.208.4.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A15346FB8
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 15:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.208.4.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767886425; cv=none; b=SMkOSnMsZO0mehd2+sYirQDpuMR0qku8wQztb5UTlu34i6S2D9G5YomXPqlFVpuscW8AJA4kYEthO/xRWO0RvApHgG1F4jDUFk+fwwwTBbtiMY24AQTZIQBqGpKIfKvUJpVAKaPoQrsjuP9Po4A8WBci/KS9U8ielkkPCIFlGNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767886425; c=relaxed/simple;
	bh=64rwXsYRv48EZSS08rkgAI8YKEQMrD7ah7DjCobOAqE=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:Date:
	 In-Reply-To:References; b=TqznA7d3ZjfETAmmoN/xGHDxX7s3M8ghRLpRyoBfQG+hLhs9jOp+ndoQEwcIvLyMvrSybKloSoBy1uka8HUuUm3BpB0JCruDj8BOJP+HYWA42Yp0TWb+r99vm0V4MmIVVEJo3zTP/M/xaWJ1wGm9PxxOdI1/tDQE+eKNsZDzOaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.com; spf=pass smtp.mailfrom=mail.com; dkim=pass (2048-bit key) header.d=mail.com header.i=fenugrec@mail.com header.b=eaQa7Q5u; arc=none smtp.client-ip=74.208.4.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.com header.i=fenugrec@mail.com header.b="eaQa7Q5u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.com;
	s=s1089575; t=1767886416; x=1768491216; i=fenugrec@mail.com;
	bh=2wFmzZdw3TENYwSsDEjwSFF4Xymq3Qkvzj6nr6jjz1k=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=eaQa7Q5uCl1q2htweFde2asoio2nS7X4WT5cxo5lC5OVDNUj5rqTnkQTbTF0uCHz
	 BCiSZR5C9p+Jnx93WdxS+tH1rbIO5Wh/cS7ExgYcNJ/YiaKI2KdsECmNEnZcWbFPp
	 x5QyJI66px9Ug4kLLf3vUJkFlBJO58rQe9GtZvRqOnDTvmrqxKcSVN8pU446wMZk4
	 v4hjOSsIEc6vGlXDNV82Rb6XXSePcpv4NAWALejE8E+jrR64SsuJCRqMuPKPKJ41e
	 XrCr4K1Bhsv0OAajRx8iscidDzpf2I5ExboecvkJDvxv6DqZVkjCAz8b3ePDxAtN2
	 Gqaxu5hwLDrI5Y0JIw==
X-UI-Sender-Class: f2cb72be-343f-493d-8ec3-b1efb8d6185a
Received: from [192.214.232.39] ([192.214.232.39]) by web-mail.mail.com
 (3c-app-mailcom-lxa07.server.lan [10.76.45.8]) (via HTTP); Thu, 8 Jan 2026
 16:33:36 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-f8cff6e0-b542-4caf-bae7-2a84a9a58d59-1767886416445@3c-app-mailcom-lxa07>
From: fenugrec@mail.com
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: accidental revert of Presonus 1824c quirk ?
Content-Type: text/plain; charset=UTF-8
Date: Thu, 8 Jan 2026 16:33:36 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <87h5swh8m2.wl-tiwai@suse.de>
References: <trinity-0d3414bb-7704-4eb9-b805-01baaa2fcb8d-1767805061344@3c-app-mailcom-lxa05>
 <87h5swh8m2.wl-tiwai@suse.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:bD/ojmtBMkygG7KFjX0t5gv39tRYVJsKRwx9ePT2TjF8MiQ20YgLJD4wXTKLEbaURC5OQ
 3g6P0Xz0vb/CyDO7d4qBKOrHXLiQ4bQ80UJPb8LeTdNISGkeSgaoQcsSH+nNhpWbx4u+flEa9vhZ
 5Y4LejPhsyswaiP9uWCg6H8bQzsk2sn+MhweueA66sYPQ9d14GtG98MxvW/lQY0fUUVUIv3EYWwG
 iNgpttLKwrVKha0aeMa5uY3m36+pGtJdDGv7yVjhjlLopIMQqikpkdTWMquHxBn+KvNZ4UU9NDn8
 6g=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4TYaA2nh9/M=;crfKRnpVBoKrrmrfHOhIbFR2aXR
 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

> Looks like yes.  The quirk was confirmed to be superfluous for 1824c.

Ah thanks, I finally found the commit that explained the removal. However,
testing here, it does seem to be required.

Test command :
    arecord -r 96000 -d 2 -D 'sysdefault:CARD=S1824c' -c 2 test.wav -f S24_LE

test 1) compiling at tag v6.18 (7d0a66e4bb9081d75c82ec4957c50034cb0ea449)
  fails; interface becomes non responsive, and when arecord exits, its display shows maxed-out bargraphs

test 2) same tag, but reverting d1d6ad7f6686e208aba06b7af3feef7a7cba61cf
  records fine. Have not tested exhaustively.

my 1824c has fw version 3.11 .

I've BCC'd Roy here so we can refine our tests and find out what's going on.


Cheers,
