Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794864315;
	b=SQ83zsLhdjPwaUAoGv5uqsXo9moq9BmBycWAo3Lxf3EAU2NkYdrkev9DJ3g+7Y5FRyJy
	 NGYE3UpyvTpOrQ3r0qZspXoY/fwx2LzTN1Zz8hbvQPl6iH6SiGbyg5GjpG9zbcSz268Y5
	 K1Dc6Zkg4exNKvnRepcN9Dl916kl7gpAdZ6XkQB45EgKNXBcH3XETCYtibGgKob1lSYKY
	 2fJEtMOxoA/RzGd6ldWRdf+Ef8l33S6hULCsxavXwC2OVPfqHhOZ2W1tl2FP5L7NBS0qr
	 AoRhndCxYd+rO67SqZqvUc/LmUCVBR88Q+t+MyIFHsh4WiqlRfDyZV5T7OA+ZRYq/tQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=37QQkcP84n9nc2171r5Y3lfGKbI4kPRXOp5KQYndgO0=;
	b=ztutediYPqph/jOJE2KJY+D/1sa3pi/1ntoBy605+hfaeDKEMtLuGjJsd6ZBxLYayaBh
	 //TynJttbZpiH/3x2xwi76jdlcnCw54Y5t2hSC6cHWkRQkT5GMVQf6JYbnthKYjzPwG5F
	 jDFJIzgvis0uficzDlYwydxDi8k5hxiJ0WcReJHmfJ7E9ASniYaJYZKyvv7hqwlX00EEF
	 udgwUVnEkGMiIeenEtst06XrNi6PtLrZPIQ/OwSKlVVU8ZcDl7kaRK2EbUxhBHRfcVDFt
	 NO7H+f6OtWUdW6Djh2M2QnlFkj1HReZH+n5OP2F6ouuRNnsRs1LYkCPoJteqntFfE1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UVvk0Iah;
	arc=fail smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B014606A322
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 21:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B014606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UVvk0Iah
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b4d5e645d1so12049527b3.1
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 13:25:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794864314; cv=none;
        d=google.com; s=arc-20260327;
        b=QXiSqwdFd0pl6F7mgIAD20ZfbMIJlohV1ezUyS28MEimtaRyVAinAekxFMDRkzF6Hm
         3cBqrSaLrunkEQvO/+Nx5KOdLNR0ZbaXTFFxGVMrn+dw5kAnVcjlAiOgSPKDWJ5bWKSz
         Qn3kxxaBZ7zkCkYuP1fe404yqgUWNaNcM4dj+9Q3n/qfqI+6ay+0Is3PXA1HAUOyTvg9
         dshvF9XV0OJ1OUwCCsvefi9ogflMRz6mnC/YEeKqp6fgkO8gTOiBb1KMBCpdykYd6X4H
         sjVvZ/4+Zj3O3muNEylbXfUhRyL4luyji6T0rMMhJaj+AgczA6ll1JXylPjhH97YM1q7
         tnOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=37QQkcP84n9nc2171r5Y3lfGKbI4kPRXOp5KQYndgO0=;
        fh=vQb3egmPLrnXwqkPapL9Et1/X/9zneHbDcGjFleJj+0=;
        b=MOvgqbnQX3ivb3NjMXuzahebe39GrZNWvQxABeBgX2tb1oRAFE5M/0sWPvwJcq25FF
         L0uRSXT08mWV2ukUxqReEiJNv+dF7I7WynTd4uOpGVP42f4+usSkIfMSmogTMTxNjSPR
         LiZHZiURHWy9XWxm2101l/yGhqoyI2DxRVjanzGMa0HJ1OpTp7mGTX5buy8vXTuG1DBS
         dmlciLVYm7BOfj4g9HYrujfSKfQUAZn3sa2/+ZTcybCejmlBF+dPM7TvaRtjwGZkerRv
         LiUjtSxjJYQf2/BdBAeGJNu28EFhEZitaAAuaWWiPkeZDGHcIXSMUkqyoO9xHdmAbVc6
         A9OA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864314; x=1795469114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37QQkcP84n9nc2171r5Y3lfGKbI4kPRXOp5KQYndgO0=;
        b=UVvk0Iah07xXVM5KpSIVjrvf+3FbnKBeGw7iVOoA6D+fDoEvnkhFZ9EIXhYSLGNXyS
         +vmR6wMVmcRag/JNdD/idm8wYxm6W99drKBkO+6ApZlnlo53qydugF+wEP9xxcTIDAY9
         Z3Jeuqto+tA/UqENhoqvDAu3bHU/GN2TcyerT+KsexW8e8+YWS+L7WsNsqUx9OimNLSg
         Uat3LAxKrSS+9X/Ncm3OmUhVy5NhLwk5ClEBlq8LKd6v7iuZsBdJTGjJjnRW1/8NWmwo
         lc4ymKRUurUwF2nN7gnY6SKD7anWmppLFmV+Qk4OZyTeZyACjrtMMxW3yezE9LWWeP1f
         YNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864314; x=1795469114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=37QQkcP84n9nc2171r5Y3lfGKbI4kPRXOp5KQYndgO0=;
        b=PjZrA96stWhxvcja/zeXvK9F4oodjkdPHWmVpFz6AldzSZwRjfwkKJumvv+qmpQSa1
         lVue/LDr3iAgWb8kMskjDDsqGPg78RPqw8bvgUW7LazBBJ/tkhFdRctJJkOR5OgdQB75
         Bv1Vlwhpip4nryqB3ttcnRhEFvgQs5kKkt2JG8NsaOlySZqVTdybfJm+2+wq1uK4pUDI
         vGjIaiwaRCM9UD+kFKygBiup0/7JB+SpWmHUaQqwGb3XuRNv6PKHH/DwAV28p8AAp/9V
         eSodjArG5NaAk8CvmrcwMr6uVGM+R0fyB2DtzpzQhDDaNZiOzhauiQlY0vT5XrWalpsu
         cEtQ==
X-Gm-Message-State: APuU4Z8SMmTenOs0t9TzU+E9gnJ1UNVxHrgdJKT8tRtw43rUCbwI1juh
	T1jcjpvC5cNkNkZgSNb9nPKpZQskHwJbJ1KUDF6E0Jzv2WFhAIhdfDR4mK97/u7Ms+SuSDFiMwB
	6FIZMAMdK/K7USo900N9kFH32j547cx4asyni2d4=
X-Gm-Gg: AZFdTZdi4M50yy/0SvI3j0KKnxQRCpTsbmH8yV9i19KMOhFtCEGJY2v8BSOdsSEpvD2
	p6164xFgBJS9guJpIxBEnY4It3P+CyWJLdH80MSTCk2tBrEeFpmdL44PuFyn/2GMkLDPU5Mvdj+
	J28pJ4yjhtqcIXDkN34bIIjGeSnFWXN6qXVgikZwba1L4lTyJePXfOgS+Cpc/B0WQl/W+hDEOmD
	13hdCDS7Oa/LvDdnMXUJnS5K4ZcBpt/5O2uzMln1r0ZL8OH99C5D6vBvyMGQ1+TAhDFQpeHX2B+
	3nw6Z7ACxF1qJ4kw50MDELTNbBTrlLBiS6dRzxq4eo1eo0BkQGyeWLGlWO7Pd1UwxU/yGr8A+Id
	mQWkTDly8LMUjncz6eAuobKpZ1rC0bi8LUYiOjw==
X-Received: by 2002:a05:690e:b89:b0:67d:b299:df5e with SMTP id
 956f58d0204a3-67db299f0camr1859172d50.108.1794864313941; Mon, 16 Nov 2026
 13:25:13 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Ted Vera <tedvera@gmail.com>
Date: Mon, 16 Nov 2026 14:24:36 -0700
X-Gm-Features: Aa3M54olKYZfZ_b5P6Fxa-FoemJt0sPccEEWQj7dI_bkTw07AiGNwoiuCaGze2U
Message-ID: <CAFd_G9guhtVwE1aaFOXE3Ab43BAcwP3RBT=R_SdZ2KDfXB=LeQ@mail.gmail.com>
Subject: ASoC: rt5677: Do not apply Yoga Book ACPI GPIO mappings to Samus
To: linux-sound@vger.kernel.org
Cc: regressions@lists.linux.dev, oder_chiou@realtek.com, lgirdwood@gmail.com, 
	broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Summary:
On a Google Pixel 2 LS Chromebook (Samus, EVT2) running Fedora 45
kernel 7.3.3-300.fc45.x86_64, the RT5677 codec repeatedly fails probe
with Failed to request POW_LDO2: -517 (-EPROBE_DEFER). The codec
appears in devices_deferred, no RT5677 ALSA card is registered, and
only HDMI audio is available.

The driver=E2=80=99s ACPI GPIO mapping added by commit 0cc00de3dd5b maps GP=
IO
resource indexes 0 and 1 to reset and pow-ldo2 for every ACPI RT5677
device. Samus=E2=80=99s DSDT uses those resources for codec GPIOs (jack det=
ect
and mic-present), not Yoga Book-style external reset and power GPIOs.
The driver requests the mapped GPIOs before registering the codec=E2=80=99s
GPIO chip, which appears to cause the deferred-probe loop.

Test and result:
I built a temporary module against the matching Fedora kernel source
that skips devm_acpi_dev_add_driver_gpios() on DMI board Samus. With
that module, the RT5677 device bound successfully, the bdw-rt5677 ALSA
card appeared, and laptop-speaker audio worked. Secure Boot remained
enabled. This strongly supports the ACPI GPIO mapping as the cause.

Suggested fix: Restrict the mapping to devices whose ACPI GPIO
resource layout matches the Yoga Book, rather than applying it to
every RT5677 ACPI device.
