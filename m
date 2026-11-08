Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794171857;
	b=VX6RUvEMQUJuzSCuZYB1ViLdzMs7AVIyiGsts9PiEir5ygXjnsRKL4YX/65oTKTrTmMD
	 iV9qlgl3aYCEGPnZnNFbjweeCSq3bz6vy4aS3V5lNDvUDZKvwYXBrsbWDbWnc8k2ykIYl
	 KAHpQ0vyecWdBFj2f/bf9AI/SMmNXbCixPcMzauN1EWoKcrSA80BNr070Bs7FjKWZupnA
	 jKfjCrCScLD8BYnAyOX2wM1hLYVCuFDhFvj+YBzI53AdqjTEGwLaD4mj9zLPeGOAaEROB
	 EbC7iBe4jadmDQ+XIFQIOBPR7SbYKBQfpf4L7XztXOad/kBbO0nK8SnM9pcycOs3IhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794171857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=aD9KkTYA+V0OgBJo6GWeq/EhlcUOUcqXixNkfV8LtUk=;
	b=LrecZq27OMZWbed8feUZx1SF7mg08wTYWDM0jrY+fae9wcyAMb1u0bV+u+T6RsUFo8AF
	 GE26wXKghKb7u8Tdr7x69RDK7MoaorO3Pgs4M+6C9T/mFwtTMEbLWcVGDKtSNXg9ujR/G
	 sHntSInfauHvqMrNUX4EG9QU3fReL0mfWnhHfyAHY/Wq8PmxDP4xJMw6k0UKEBETfK9be
	 8FU9Lkpp7HBqVwGij+n9a+XwsoDFvx9zic3ZCHyMexKZJ5XdiyUIkBA72aRC7AXTva4m9
	 gZF7OFvL2MzXOMD2QXFnhultbaw/g/cjSSJrvNsIuvN7oZfp4wzhm+E53oRmcr+NVNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G++Gzkud;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C05606A321
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 21:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60C05606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G++Gzkud
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67bf3c6654fso227841d50.1
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 13:04:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794171856; cv=none;
        d=google.com; s=arc-20260327;
        b=AeCurFBSQIN2HRgBPGQcnEV7QTazFOfcmrOSax6uJW3fzjTpIixKxpKoE2rEJo2Qpe
         2ZfAQZtTrz3Y/4qpyJzz8UWTcmDfeXkUiuLqVXlfSkYtK0qNtZidx9abWqbabR0Ocqfu
         jHowT/9JOh4Qsz6Nhk/3IyR9pUUBhwMkjVthvMBAK8BUKYNymbkWGwIaMC2fJH5/Hap3
         fHv9rgJ3fdLu7IjXXboE+PlefZae1laQQKfwJYuKy+MKGTTUrv42Fww8FYkFgGrnj/FP
         ZMs9yUhT50JsmGrKqHkiiaFPRC3dXW5R0Eso4ZWOY9CrWsljP7m2ZM0pK1u6BmcGLqnf
         fu2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aD9KkTYA+V0OgBJo6GWeq/EhlcUOUcqXixNkfV8LtUk=;
        fh=q/Ho+qC8zoG13YGcaDFqVtdxEFbEGvZECaG8EpXnSD0=;
        b=THFzubOixUVAjmQuxBufuKX7O4W/Nken1fkDBESyGllRMBbzShNWOYOGFFuCe3EWYw
         lr0MjSxtZnF0/v6fgNUYE4ibb+RuQZ6n9Q7C0PdGsVUFxX6s3SwCgw4KDifQBcpNCtOb
         6GMpPn0foIOVD4SCcgPHB/x+ucIYNIuZKP5kSQ3BjyOXnrG/pICeW2ZXpqVsoy6VxOdH
         K9qcszGSiH5Pte+iEBHnCw0/IvHP5x4ejaqZxoUJGVGvktj3YtrRsSPD+ti/Am79jlWz
         645iWS3yRA6HyyzdstXNHhsMQmZmrlNlu2vTL0FAPlp6oE9Rnn++4+BsZz0W0V0KlJcv
         Xqfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794171856; x=1794776656; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aD9KkTYA+V0OgBJo6GWeq/EhlcUOUcqXixNkfV8LtUk=;
        b=G++GzkudpuIRUjCHovZUJEEthKbYCRvzZVIurFDcQf9vO9hf9ORdWeO/6ZBb6O5VG+
         3aXR54r+PrLkbUFFsFhXCfN1NoKUasoLHQB3rCZQJGtgcUCtVsYKij2ofWuvfD13Bxsn
         Zuk1r7qjr4WAfYjvaXmoGvlKuFnsKm6gBiwG3kP7BCGSQPgqNWGnwOj7NVGviNJnadg7
         jSTjgWwKb4X+8IUmRPBgbhiXP/TT9cXmCSMMr9MqI6Wr9BsXMWlkqHveDSSZDl79ceD2
         lkkxceeVHt8siIyjqMiB4pxaMBogDoi0wNJ4JeHnSQhMr8CfAbn7hEzCV9b4kNZ2zwux
         al3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794171856; x=1794776656;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aD9KkTYA+V0OgBJo6GWeq/EhlcUOUcqXixNkfV8LtUk=;
        b=ckYK70EYAGdzReSTPLYaiqtssmg9X8/phoq2iFYeOaI7XrF925AFzO6DjASdx0Ho3I
         IFtuRG0hsnzPN55csK5W1IUpmwsAYYZBEKQSJ7CdeTBwYvqSH96ePqNw9Etm76/q+6VB
         279A7U9fkmMASazqOgq0G0vX/MEfxxBK93eccMkCp9Ca7Q2XRiPc+API06ZENxtxQuyW
         9VUlqZTkm3ukXliyc2eR8aqIb/V5jJDW1QyL56T3tMOtxaYiruSv3pZ4ueIVLSVExS9T
         SqfNrEu4KTiTn5Cqwy3wwMu5aeBu2DBMvdTMtASJdwIIp+u55d7bnfVsZk3y+hx5BH3Y
         BOJg==
X-Gm-Message-State: APuU4Z+f3gVcHU5y5NGNgFBBvy1m2AP4jKH4NaL6WLQCwDCIXForea+g
	axNfhsQ61E/+eN/FOqZsk67GgybUZyvHeIpQSjfdvxNFoYgf8juGUjxzoQAr8ohJVBUVCcJmp3D
	cdwDqiT3g5jMHhS1cfG3G5mkXWRmWBh4=
X-Gm-Gg: AYBFou0dQhmYZ4bZgZ0RMeMi36vW20pCR7vzPzmxSd51IQqX2X4oeHgjS0rvh5Bk8vF
	Oz+g81a80acT0VHePi8le7d6+ni+X2W4H7L86ShTUgrZ4xhzcL29B7unwhO9BUroiiy0sygXdky
	D9/OBrJfiE3lBn4e+Br98ZJcDKzOoQPFo4sasi//rcKYD37VWIJDWMJQs6w3AUTi/Mx1625l+dm
	Wmr6m7RYupUODEwB3ROo5l76jwXdc0DfAaKLDbqr32irAx8cx9E+l4YAI8wrMehqt4P9+5bjept
	UNU3eIL38ST0A3IYufPuuewa9k3VC9u0PLpib6iGydQto6mzdad8Fr2WxooGhy9RqXcCSx4wzBJ
	5ypKed8cr6iwzwgtQuVanw8u4SQ/ePdRLngzMTnVW3h65l2YpOxVGKDLYVIxNPz8MKyg0C+3Pp6
	abAITEro/lcyHwD4pa+uyGjaLq/YvDHM+W+ejclR6tVX8GMw==
X-Received: by 2002:a05:690e:4084:b0:67b:f3b8:aef2 with SMTP id
 956f58d0204a3-67c3d96bd85mr1048843d50.25.1794171856330; Sun, 08 Nov 2026
 13:04:16 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAOUQ8cou-i0qNmFRsMxrjuGNKaBii1ggwGS-pjMuuexNJfBCWA@mail.gmail.com>
 <87bj81yph4.wl-tiwai@suse.de>
In-Reply-To: <87bj81yph4.wl-tiwai@suse.de>
From: James Barnette <calmasacow@gmail.com>
Date: Sun, 8 Nov 2026 15:04:05 -0600
X-Gm-Features: AclHuK-qtf0evE3Awf_aHn_FL5q2UGLOXfJ5GbudpDwzrvWsDsLyg93jvIpn0Eg
Message-ID: <CAOUQ8cqRBXwhrQRN1ASgNZGrAFk=JXv9zNyrYg67a7U7Ng0QDQ@mail.gmail.com>
Subject: Re: [BUG] snd-usb-audio: Elgato XLR Dock 0fd9:00a6 capture silent
 when playback starts first
To: tiwai@suse.de
Cc: linux-sound@vger.kernel.org, tiwai@suse.com, perex@perex.cz
Content-Type: text/plain; charset="UTF-8"

Hi Takashi,

Thank you for the suggestion. Yes, enforcing implicit feedback made
playback-first capture work in these tests.

I tested on kernel 7.2.15-1-omarchy with the same Elgato XLR Dock
(0fd9:00a6, bcdDevice 2.10), ALSA card 4 / hw:4,0. The direct ALSA
trials used 48 kHz, S24_3LE, stereo zero playback and two-second mono
capture. Hardware gain remained 49.50 dB, unmuted; PCM remained -23.50
dB, unmuted.

The named flag was rejected with:
snd_usb_audio: unknown flag generic_implicit_fb while parsing param quirk_flags

I instead applied quirk_flags=0fd9:00a6:20000 (bit 17,
QUIRK_FLAG_GENERIC_IMPLICIT_FB) and rebound only the Dock. I did not
unload/reload snd_usb_audio or create a modprobe.d configuration. The
read-only (0444) sysfs implicit_fb parameter stayed N and was not used
to enable this. I verified the active stream configuration changed
from explicit sync endpoint 0x81 to capture endpoint 0x82, with
"Implicit Feedback Mode: Yes".

Results (nonzero samples out of 96000; peak):

Setting Start order Nonzero/96000 Peak
Baseline playback-first 0/96000 0
Baseline capture-first 95697/96000 0.0308
Baseline playback-first 0/96000 0
Baseline capture-first 95708/96000 0.0294
20000 playback-first 95993/96000 0.0326
20000 capture-first 95705/96000 0.0375
20000 playback-first 95990/96000 0.0343
20000 capture-first 95706/96000 0.0380

At baseline, playback-first failed in 2/2 trials and capture-first
worked in 2/2. With the flag, both orders worked in 2/2 trials each.

After testing, I cleared quirk_flags and rebound only the Dock. The
stream configuration returned to "Implicit Feedback Mode: No", sync
endpoint 0x81 and Feedback Format 18.14. I restored the PipeWire
duplex profile output:analog-stereo+input:mono-fallback; mixer
settings were unchanged. Card mappings remained Dock 4 and Guermok 3.
No persistent configuration was left behind.

Does this warrant a device-specific generic implicit feedback quirk
for 0fd9:00a6? I can test a proposed patch on the physical device.

Thank you,
James Barnette
