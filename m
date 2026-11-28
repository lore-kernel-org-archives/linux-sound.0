Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795869449;
	b=ycrN3DkDPnUbDemSR+2eB992HKe3g8oTBEWsAqkQqChMSxR0khCqo0MQTg4leTPdK2AU
	 JXfFqn1aJXx/j+9+kBOyFOCwUR8s+E5FiX4h6Cl03cFzy2GuxvZ/d20QviHkWODjrnzgX
	 l8pOthRx+g6s+J+iLS9XiN8ihqscksuEQTuwPMzTe+C/ZOI3HRqUl6xIRmUOPcGNUSHTK
	 ypiArjM2tbKQ79fnPoM7lmf4LKt/2JdCc1gmHL8/HMCuX1YaFFdyf5Tv0f/qxfcln0HPM
	 dsx0zdX6KftNtlBcJcpZXbbT8sKVPLGe6QST2fiLSpv7M8svo1Nc+2qX2ZRV8uSpM8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795869449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=0RO3qiD5tktHmu7hVGvHm1czmbnEy6csWv+ixUNs694=;
	b=ZvrP0drk6e8UagCxi8s0mZKsOSZ5XX7qLJPSqfOJMdU96Jm0wbtA8h0ik/ksF1LFFVxk
	 bDx9aAUAH68JIJ0EsRRTLXNRwUKTpNNEGLZqNcvOQO48vBbz8FDzNILXAxELtzmkG8rYK
	 5Bbkqx2PepiGSX9eL1DiolW7kBoekjE7mcd3KQ13N+TsR9kZjgSXqi61FPfQmIa0bi7xs
	 +4iiR4AdXE6sq83MKoDsjenAkD9LFinKhYX3Z7rb8ygpus6A/1+RSWdLD56E0Tt0e3cWs
	 oChH3jvaf6aZexMwloLto1WSlY+XbVAuAONuv0guFbEmA3xMhHJQTsjzN31uqHUua9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HtjWqBUi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210B7606A321
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 12:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 210B7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HtjWqBUi
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f05b465cd1so8126805ad.3
        for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 04:37:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795869448; cv=none;
        d=google.com; s=arc-20260327;
        b=shmJ89qMQPi6VVrv9A/OPv99Q3CL3iKoLFJLL1yVtuiSVaB3PNV10Bq/XVfyqsmsN2
         fQIuaVC2KdRtYdsJAizJDnGIspsAhDPVBoEBBWTUzJ1wObaEtZEJuoD0c6cLovlywqrO
         3YDjpYeEjIMp+CO6OF26lw+no30mxQBqawObSxHHmBLtMjV1NAkTbfEPZGx1Jsnp0e2R
         nMdvDmUlYWvuE97t7nTUV2w1IsfXxtWPPEG1DCQyz2MBDEhgUoIaW1uqlUt0+ExRQaSe
         NXOU4dUxogT1UuoYdkZgqwMcHf07MPYBGUGqEyKBfSJ6dJa7NdbJFpCTZavVO4JkARK4
         X8hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0RO3qiD5tktHmu7hVGvHm1czmbnEy6csWv+ixUNs694=;
        fh=r0X8++XN1K4nFSzCbo+LQR2UH2PeMgIKWQpLnaOw3jA=;
        b=g+LlYbV1knPRCDDthoGegPk5VHNpfdLSiBmKBr/DnYijhUaRDrjKaa3Xt01Q6TXnoU
         j7NePQJKnGjdXJVTx17gupvst/SazHzdMuK6vvHhOqqMe05qtqUndbp4gp3jeC401rZh
         /AL2VIOIot/68u81zrWxm4WS3D0BeEnov5jT25YMH9t8KYP5WphfsM+3e71VwN5+EOZ8
         IWsYXBCGMXG1q/hD2NO/ViE7vBJIcsZJvmT+X/1W035BhfNlJkTDqA7QTnalWUzuNyCA
         qNA4zxNTdNaPtLJ4HqRezN8kV7EMHWfJVviSgU0Lwy0JwaXX/FFSYIAsCQed+uu41qDu
         xB2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795869448; x=1796474248; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0RO3qiD5tktHmu7hVGvHm1czmbnEy6csWv+ixUNs694=;
        b=HtjWqBUi/ObNpoi7wivwwM0GNQV72QiyyMkr1yL6NBbSTlQxsXMwBpoILtxzu6K+Pb
         LLSgwBj6jrKQOAG02GJYQh19Si469jIkik1KYSbgIe3rLc8UyIACmw0s8quigOU6Ijvb
         73Kddg7fq8SHTiIDQNPsL/B5fgw7d/Ppm6BBL1jzvapZ8NKSrLk6ds08BdNbNWNbLkjI
         qp0y4BtaHoH9t/WJITSmGBiSCWXcmwcModSXGhziUihGtVDgzbptIhaAhKB4tQ91bJDI
         UlLnXwM3NNqrJUBpJ6jNaWQ4IYxGFmoq3jZN07p2RHRrBPjtBmyTS+DVC/rnTR1mEe/Z
         DveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795869448; x=1796474248;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0RO3qiD5tktHmu7hVGvHm1czmbnEy6csWv+ixUNs694=;
        b=Lva0SjcfsK5WTN2Y9v4HgFp/O+gsI6occNATHf2r47n7gk8VYlLoUuyZ7w113xMITm
         ebcdm7zu41YvSxC5762tDtkinJvCeNvN2TikI3P1fqjETWwbNWlkYi9XD7q93iMssIMe
         Ej8pltQG3raqrJuuf53xRtk2ulMHbuXbafbiuDC9P2672uhGDnaxKpxD3+nXIpnxm04a
         UBpziYd1NRyY2OLZDSe4sl3F632hEGea5AA84FNtZBxiSjdzfW5MygY7T7wGWPQovRwO
         hdcfvUwrdaeSeSyM+bQHT5csLZrugdVbpNZVwJfCWms2JVtSA80Jc5GTjr5K1m0mKPbF
         h21Q==
X-Forwarded-Encrypted: i=1; AL+hErGRhywxp4BwjT37akRh3merY7ETp7LfE9KWO8INV2Nm8v0tbADMRfpzCQFlYezu5Zl9xEr0krnEb225bQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z983ODSQYpUaOHohaY+saSn+OK4kzpczeJ1FOIdFebSdsk3UAx5
	ZfgkctNmsixSoRd+JN3aWXU9HnnMyslpCU/wMdZFAzyDr9tJEBFW2WnUhYMVKct9ZzHi5cWjIIi
	+cKONFMgNtFTAtNuqzoeR8xEv4fIenF2tr9dr
X-Gm-Gg: AZFdTZfek7ijPAUV+jAyh85SOf+UuhTKALx61Pbg+tBqARR6o650yvnzVe6xU0t/My3
	toc7xowb261jkfWzd38jegRLiQsTjKMZ+mbriEcOg0AOJ8lmx4n6szvD3T7XwSw+OFhcDvMcG2S
	vq2xm6hpDGTsZpenyii+QUx+FjR/upzUflDOsAE9nX3wzo6RQ7bLtws+xyJmc1nEfFL23TzmnyC
	5KKkQ/CGr+JbiOFOlS61TpvGjuM36SorC7GAmhBXBfAIdijxToOJBzQHOY/Hh9l1e5WVFQAYblC
	cwZWsp9PNGvETwPhPeLdERAPmI9LO1pjo6N/rlhyN5qesKiV2+9KBHjYTlRXQNbwUKtcmHdUjOf
	NWc8M7nJfjifFbN43wCt/yEC3CGfZAjK8Ku0NTOVEle03wR9kyTs4hp3WEYEUWMiC6yg=
X-Received: by 2002:a17:902:db06:b0:2ef:efaa:17ae with SMTP id
 d9443c01a7336-2f03f1bacacmr250134215ad.71.1795869448227; Sat, 28 Nov 2026
 04:37:28 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CACKiatc1Bj2et4kcXDJiYx28XXxoo6iHPc9nYt3GhTCxUmdnsA@mail.gmail.com>
 <20261125203211.76029bf0.michal.pecio@gmail.com> <CACKiateKEggvx60zugZt_C1ejcLv55OiL6Hyv=DkF72370FU1Q@mail.gmail.com>
 <20261128064331.7324a947.michal.pecio@gmail.com>
In-Reply-To: <20261128064331.7324a947.michal.pecio@gmail.com>
From: Flavio Giacchetti <flv.giacchetti@gmail.com>
Date: Sat, 28 Nov 2026 13:37:17 +0100
X-Gm-Features: Aa3M54o2QT3QJIXfLvvkR3OOeoo-XJZUArKHTXl-P5Eh7Uw_Rs9h21sTLV6aurw
Message-ID: <CACKiatfenfh_7hOHjuAaY0DptHG2JMjQ0r8Zo6E0bfawFpXXxw@mail.gmail.com>
Subject: Re: [REGRESSION] Creative Sound Blaster X3 (041e:3264) fails USB
 audio probe on Fedora 7.3.4
To: michal.pecio@gmail.com
Cc: linux-usb@vger.kernel.org, linux-sound@vger.kernel.org, 
	regressions@lists.linux.dev, regressions@leemhuis.info, oneukum@suse.com, 
	tiwai@suse.com, perex@perex.cz
Content-Type: text/plain; charset="UTF-8"

Hi Michal,

I checked the historical kernel logs for both questions. The same X3
(041e:3264, bcdDevice 10.90) came up at 480 Mb/s with cdc_acm bound to
interface 1 on these Fedora kernels:

  7.2.15-200.fc44: 4 boots
  7.3.3-200.fc44: 10 boots
  7.3.3-300.fc45: 6 boots

I found no disconnect or re-enumeration of the X3 in those boot logs,
and no sample-rate or mixer timeouts of the kind seen on 7.3.4. There
was one later 7.3.3-300.fc45 boot at 12 Mb/s, which I excluded from the
high-speed comparison. I have not yet reproduced the failure on an
upstream build or identified the first bad commit.

In the meantime, would you and the ALSA maintainers consider a quirk in
snd-usb-audio limited to 041e:3264? The setting I have been using is:

  options snd_usb_audio
quirk_flags=041e:3264:skip_clock_selector|skip_iface_setup;

On Fedora 7.3.4, skip_clock_selector alone restored ALSA registration on
two consecutive high-speed hot-plugs with cdc_acm still bound. The X3
has one input on each of its three clock selectors. In the failing
traces, control requests stopped completing shortly after ALSA rewrote
the single-input selector 0x22. Adding skip_iface_setup also restored
32-bit playback at 96 and 192 kHz on 7.3.4, verified in ALSA hw_params
during playback.

With both flags, the X3 also registered at 480 Mb/s and plays normally
on my current Fedora 7.3.6 boot. The current playback endpoint
advertises only 48 kHz, including for S32_LE, so I cannot confirm the
96/192 kHz result on this boot. The flags address the probe failure on
this unit. Whether it shares a cause with the xHCI warning is still
open.

Would it be useful to start with a device-specific skip_clock_selector
patch, with skip_iface_setup considered separately once I can compare
the rate tables on upstream builds? I can collect more traces or test
a patch on this hardware. You can reach me directly at this address.

Thanks,
Flavio



On Sat, 28 Nov 2026 06:43:31 +0100, Michal Pecio <michal.pecio@gmail.com> wrote:
> On Thu, 26 Nov 2026 00:17:40 +0100, Flavio Giacchetti wrote:
> > Yes. The earlier Fedora 7.3.3-300.fc45 logs show the X3 enumerating
> > at high speed and cdc_acm binding to interface 1 as ttyACM0 without
> > the rate-query errors. Audio worked.
>
> I suggest investigating which change in 7.3.4 broke it. And try
> upstream releases if possible, becauase no one here konws what code
> actually goes into some downstream kernel.
>
> If you got kernel sources from a distro git repository, it probably
> still contains tags like v7.3.3, v7.3.4 or v7.4-rc4 created by Greg
> K-H and Linus, so simply use them.
>
> > The failure also reproduced with Fedora 7.3.5-300.fc45 and its stock
> > USB and ALSA drivers, with a different known-good cable. At 480 Mb/s,
> > the X3 disconnected and re-enumerated, then failed to answer USB audio
> > sample-rate and mixer requests. On 7.3.4 the same high-speed failure
> > also occurred with my experimental cdc-acm module loaded and the ACM
> > interface unbound. Please disregard my IGNORE_DEVICE RFC as a fix.
> >
> > On the failing 7.3.5 run, the USB hub worker was blocked in
> > usb_start_wait_urb -> usb_control_msg -> usb_get_string, called from
> > get_term_name during snd_usb_create_mixer. A 30-second usbmon trace
> > showed repeated endpoint-0 GET_DESCRIPTOR (string) and class
> > control requests. For several requests, the next completion came
> > about 5.12 s later with status -2 and zero bytes, consistent with
> > cancellation after the timeout. In a separate 7.3.4 run, the Intel
> > xHCI driver logged two "Event dma ... not part of TD" messages at
> > disconnect.
>
> You should *never* be seeing this message, that's a bug. May or may not
> be related to other issues, hard to tell with the information at hand.
>
> My best guess is that some innocent change in cdc-acm (or elsewhere?)
> triggers a bug either in your device or in xhci-hcd, possibly related
> to the whole disconnection SNAFU in v7.3. (Some of that should be fixed
> in 7.4-rc4, not sure if 7.3 series backported it yet).
>
> Did the device disconnect and reconnect on 7.3.3, by the way?
>
> Did you use 7.2.x or earlier with this HW, any difference vs 7.3.3?
>
> > I have not isolated a bad kernel commit or reproduced the issue on
> > upstream mainline.
>
> Officially, kernel.org only takess report of upstream kernel bugs.
> People will often make exceptions when the bug's cause is clear and
> reasonably believed to exist in upstream too, but this doesn't seem
> to be one of those cases.
>
> Regards,
> Michal
