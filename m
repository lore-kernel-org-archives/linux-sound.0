Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795253437;
	b=p5YS6KFgziQkyqAufwOrdQBw/Ip4Nt7+TxjQe2zChpbF2druIyDJ4E96jI86Dj5/AAuc
	 0OIq3zmb6Nel9w3n1Pj3XMcRNChkn1rZhmfkfAwlWbyULSN5aIbIK6929j4E9CdwZLKA+
	 hVO3X9GhzGWWQ1M6HE94RClNlxUHZQm4e6yaKwiW042erOg115fkcNPRTWAWRjHYFQjX/
	 f8NDXbAhhDxVV1wyMJyUjLixMG+aVW0T8cAmCP3i9HrahXnZfl8qKpPYAPqR9ytpZEIAB
	 A3TG3M68fG7F/02wbWq8ZF0S0V2VQ/h61C66bbJdhhHQNwnuSLj9KxAHCdYlfrAJT5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795253437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=165M+y67FGU92liuL0BI/yTTwNfE/BM37g04ys5KH88=;
	b=KCwFhL8fksuVemSTRaeKjUaZam5mZ2QKynoGVHdJu/SJ30R2cuF5OA8ZTaw+hIm5XcXP
	 /yu3LVW/UgLsKJcT2M15jDEqDYh+wOpt+bLnC6bnFFlWXGNzqbqR1/N08yMmwPj8h6TKX
	 a0r95lX9GcnM/2ElyqPvDTGVoTUeQQhhuKDdHcQVJ10qQYQlpM24O7jHHeeXHDn4PdnVU
	 vx4WM0GyBOOdG6VTKMWunsDRAmnaYSU7INmRUFlK3kLPrm1ElwEBz6DKkq7ym3RSXQD1a
	 ZY+o1A/G0+3GlN9/2AXunsnZJY0NNCz6AGQwVnGSXz2Pas5Tu8Udlq231BsG7O0HfMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z5fRBvPR;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A830606A687
	for <linux-sound@vger.kernel.org>; Sat, 21 Nov 2026 09:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A830606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z5fRBvPR
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so20574245e9.1
        for <linux-sound@vger.kernel.org>; Sat, 21 Nov 2026 01:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795253435; x=1795858235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=165M+y67FGU92liuL0BI/yTTwNfE/BM37g04ys5KH88=;
        b=Z5fRBvPRvoNAHlTMNd+dxXxJjbgWlLta51HewPTOxJIZoF7VvFc/tMzPwtxfHCVH5/
         9GzZCdaeIRUU+PkFsrbhuKKIAD5koBjBfYYPoEeInqPTXH1Pus2vHs3w8Ytb+b3GHxVL
         sabss1un3a+vcTTkeKuDqWZ0pbfHqwpKjdPSzdyDMx4W+T7cmrr7uJOEkyOy3LywiBKj
         P5B/U7GQ1g5TH8fXNSghU5/0uli3h1haKa9w0A8RCtyn0YyXm04Lb0sJEkoWNbmIdBR4
         h95u/6WoF0XYcyQT34Ub+gi1RTB6gTYmf122qkoIMe+Vgy171J3PftY+DjzGgdW6m2gN
         8VSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795253435; x=1795858235;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=165M+y67FGU92liuL0BI/yTTwNfE/BM37g04ys5KH88=;
        b=rNROoSqC3PVWVj8vsbMWD/iMVBF5FdFl0rvLmfeFZRGnTHonUgmLmuUW/NOyDu+GuV
         p9SCzFLYZFaNKv3YSjM/mUoCGY2vikYY8VSzKPl1Lan2GmwOhDlUfubncAC611VKMMPo
         thRyiheMGbiPEvN3aJ02i8KXL0G6eEMw9nNgwT+BYVd16fQ4qEvCn38uBRMLVotz/cgF
         t/lKyOSouq6xH6o8jtfgeWi6KFBbfu4lmuxwtW9RKRA8v+xdj6l12m9MAUO6I+ci4tSY
         hh/QNMnps29Cb67mscGvc9ZyE0RVESro1Xj/cxMpObT+JLIPz0scirVnCm04s46hE49O
         vF8g==
X-Forwarded-Encrypted: i=1; AL+hErGf7hQijnN72R2UGO7LyeGap8X0O2pTpk0PhqJtC8D3j/JdICmLK0iTQmAgRt3dZjIn9Xp2G5qVmXeoig==@vger.kernel.org
X-Gm-Message-State: APuU4Z+/D3NHZG8njaK/BNves/Z37geknWnzxMm1mvfamsaW9fOftTkT
	qzfwrZLekahHawzqPf/2KZiMiXzQw2kVLH2SrzZBnuVFmQSaf7LtxBuT+czPzA==
X-Gm-Gg: AZFdTZeFFmcghMCn/vbmYE0Q76OmM3DUhu1Nr47uBjyS0o+Y63qvC8fl2oy0LtqI9Vm
	/h40NbNIRzFy67YeycQG3k/uAMjveAGwRcFrGTbEOas4qlpxvEQloTmSBlDyTwqui4iC1h0mMnv
	w1ZJkvC/tBTP/XJSqzkyJDv0QiuJuLURLTWgEwwRBu9nzL66ftj18/ltXWKXaumzH4M+T3PXl2J
	62UIWcQWweQKJalB1F5hYop6v7FqKOVvGxjRfSzGRF+Ax007OwfHFvU51dYvKg+tPenv3Bf5hkC
	yJ9Cw+ZBKu25dLYCV4YCCTzBj68XvhKKiWgYFa/D+RLzVLaDuuHP6lbFPlTV63u5HTHU1WjhQBU
	IDwHmrzsjMSuDAHhihq9Fjvlsi5+g1xlvcVkS+C6ofWOyLF4cn+UENgUzDoUz6GUSv5iLXZYBe+
	uNq0tABCEVTCXJVqIGsvuPSL/FB696vYJZvFnX59YC+W++5ghr3AxrFhWXtHBHlfavDyYpsTAUX
	LeNnmJSjcVKKh+G68hXxTnMtQ994jc16xjVFeyjNxYk8LtuRAEETElw/uQq9IDtiWOwtdQR2h2/
	PLoGNPgDMRfD48lE2CZLmvfcArE=
X-Received: by 2002:a05:600c:64c7:b0:4bb:68b9:f610 with SMTP id 5b1f17b1804b1-4bb887ffee2mr119899625e9.9.1795253435290;
        Sat, 21 Nov 2026 01:30:35 -0800 (PST)
Received: from foxbook (bfh118.neoplus.adsl.tpnet.pl. [83.28.45.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm215995135e9.11.2026.11.21.01.30.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 21 Nov 2026 01:30:35 -0800 (PST)
Date: Sat, 21 Nov 2026 10:30:29 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: "Alex Kononov" <alex@albefly.com>
Cc: "'Mathias Nyman'" <mathias.nyman@intel.com>,
 <linux-usb@vger.kernel.org>, "'Takashi Iwai'" <tiwai@suse.com>,
 <linux-sound@vger.kernel.org>
Subject: Re: xhci: unratelimited "buffer overrun event" warning floods log
 (~7000/s) with USB S/PDIF capture device
Message-ID: <20261121103029.7af20ec4.michal.pecio@gmail.com>
In-Reply-To: <001801dd7985$c068fc60$413af520$@albefly.com>
References: <001801dd7985$c068fc60$413af520$@albefly.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

On Sat, 21 Nov 2026 01:58:44 -0500, Alex Kononov wrote:
> Good day Mathias,
> 
> With a USB S/PDIF TX/RX adapter (Savitech, 262a:9123, UAC2, high
> speed), the xHCI driver logs an isochronous buffer overrun warning
> for nearly every microframe while the adapter's S/PDIF input has no
> signal:
> 
> xhci_hcd 0000:00:14.0: WARN: buffer overrun event for slot 2 ep 4 on
> endpoint
> 
> Rate measured: ~433,000 messages per minute (~7,200/s).
> systemd-journald sits at 100% of one core and reports "Missed N
> kernel messages".
> 
> Setup:
> - Intel N100 (PCH xHCI 0000:00:14.0), Debian 13
> - Kernel: 6.12.117+deb13-amd64 (same code in mainline 7.4-rc3)
> - Capture stream open continuously (CamillaDSP), 48 kHz S16_LE,
>   EP 0x82 IN isochronous, adaptive, 125 us interval
> - TV feeding the S/PDIF input goes idle -> no input signal -> flood.
>   With a valid input signal the count is 0.
> 
> The device is clearly misbehaving (it sends more data than requested
> when the S/PDIF receiver is unlocked; it also reports its clock source
> as valid while unlocked).

Either the device is buggy or snd_usb_audio driver submits wrong URBs,
but that's a sound subsystem issue.

> The driver handles the events correctly and audio recovers fine. The
> problem is only the logging: the warning in handle_tx_event() for
> COMP_ISOCH_BUFFER_OVERRUN is not rate-limited, so a single
> misbehaving isoc device can generate thousands of lines per second.
> 
> Locally I changed that xhci_warn() to dev_warn_ratelimited() and the
> rate dropped to ~100/min with no functional change. 
> Would a patch rate-limiting this message (or demoting it to xhci_dbg)
> be acceptable?

Not Mathias, but I think it should be xhci_dbg() like all the other
conditions which are device-triggerable rather than driver bugs.
People can still see this as -EOVERFLOW status in iso_frame_desc[].

> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ handle_tx_event()
>  	case COMP_ISOCH_BUFFER_OVERRUN:
> -		xhci_warn(xhci,
> -			  "WARN: buffer overrun event for slot %u ep %u on
> endpoint",

When submitting, please make sure to avoid line breaks like this.

Regards,
Michal
