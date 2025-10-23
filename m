Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACAD301487
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 08:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761208745; cv=none; b=Nj2jNEsyQFTLlL8WjdwufipqUKsTX7KI+4g3HoHCoHmQQaZmdxwpvfH9uHVlgXoVvyOXE8H3BLTHVxcb13XEek/a9FYIamBY5WkP1rgrpsBi03YH2bKHJfluPzomASZtq/8MI/Eib9FK6EZMGyYLLdP2CpH7056KppUpQW3cpks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761208745; c=relaxed/simple;
	bh=YHCtYC3JHx7ZuNvxBrh1S4STYMPLg1PU1e+XsMn0yQQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rm54LiZ6dUN+K5yoJMRW2Xhmki7tuXzXnCtg0e4NSmGmsEncKqAs+NvYP3Xtr7T+XsvDnjfA8Jhn1gb2GTLgAFAuxq2ygncEWIuAHrgboPRZS//wE6S6QV/z6IszfnKuTvRRM/6kA1Qt/GLOnumAU/c0NrGXeAqVwopL1Sg/NAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mv6w7RC2; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mv6w7RC2"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso3897895e9.0
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 01:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761208740; x=1761813540; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3mJOyiYunt9aNPJzwK9Ms8OGd5zyBhnLNdsm6DFVnsQ=;
        b=mv6w7RC29MjpDcUjiMtCvRqWbV6VAQfcy6yD1jE/3bziCvI3/mMEliMFl/PMLJfKU7
         ux4iuDyPMXQW7AIf6BLPrZwhEl6NoYZVfVIuOsvHWMoRhbu5U1g+PQMbFbfVhDxlp55p
         0mUoaZIFP/Up+NuPXPqw7nw/D1rNFnDl0t7tErTJmnE239lnI74tvU+waLj/LElqcHM9
         pRoJNQgmTTxLDnVE2q5b/BluMte5dsisW6nGaSgSPMfschNHEdKwNMPgwVfnqIo6ttJZ
         +h+RgNZxxOQ8M32Kxq0GtNVSF7L78gowQWPaSJu+hPQMnXxwbTMg7jw0yAppfGoxdvSS
         //zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761208740; x=1761813540;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mJOyiYunt9aNPJzwK9Ms8OGd5zyBhnLNdsm6DFVnsQ=;
        b=IICAyNF/rj8SzIjB+sodJn372JzMJiFgTpnCk9wL0sqZt7a+9Fqp5rBCkM1p/hF0bp
         TTcrAXPE55Z2NRAw7P8zWUVkFCPx9G/4alwAWe3ruvrLbA4w8e3iRBVOfdDiSyEdtTfL
         kO/v2Fb5/PSUvtcYjMRGRjgytIO8ynyKJwZIMplhHz0hHkKgkxrP8s7raM3y8WJmCImx
         puPzczutuxEdQucetMp2bWaJrPNfGp5crI2188FCoP3qOu0tczoqiCszW6dA4xOOiD9Y
         JmqOuSVJEYXxp8aKXjS3gFmER5DOSngmYXdMELKAfvhZ6u866kpSOfcd4z3tH6WyOdtE
         qFfA==
X-Gm-Message-State: AOJu0YzgaLsc1BYFrXptHikH0VR1nXweqWYwVnhcZJh3ZcM35z3DnpZt
	AfWQZ7j7TKDypda9gnD9+Mqk3tlkXmWqZovLoUytXJqhlWFPG2h2iPtt3oyJ3QncGa+Qd+mgIwG
	9rIAo
X-Gm-Gg: ASbGncsNIEc/hlBt+rKiDXlzZnztqaPfgKAVuxifW8PwoRbcYTsnuy1zmpmPCYA9g1I
	EVbBxHxpiK0xl2Z8AL6Hd1M9zsAMbxNfqicPQ9t0cTpae+FYTZEnvnyTUmvBe4R8S3fQLNqf1fU
	lE0fHQnn3aZ4sH8VeTa5vAMJNYPPzOFzLCuqy6awJuEWnecVCtiW7YUDaE6qDr8+bsLLB8YzNbQ
	g20ZFGOMs4TFcbSFwLBci9UMlg95/TkDQwL7Vzv0dFzCaGF20c/m39Loh/Dqo/Cw82p/n2yTOkD
	OM1qZlLBN35EB+9bfBXfpmAoBUNJXslC56vNIoAvgzqQjsq27ice+9PiRGI+wyHl9alupJTDdnA
	8NRgv1JRr7ttIWg4+hcIt2MZz631Zfay7/Y6S9H26Kuh1uYzmg5s0SwEypxCDjqKaO92nCoNLIc
	XyOPwj3zXT
X-Google-Smtp-Source: AGHT+IHZPIfuSE+47joxmboB43O2qZzeBrVCZKqKXjqRkc7h7HbXUi7+Z2IUpbYTiK+Ssk3XGD+H+Q==
X-Received: by 2002:a05:600c:5299:b0:470:ff87:6c2d with SMTP id 5b1f17b1804b1-4711791781fmr188308805e9.29.1761208740049;
        Thu, 23 Oct 2025 01:39:00 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:6aef:b8f:aa92:c859])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475cae9f571sm25134965e9.7.2025.10.23.01.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 01:38:59 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: John Williams <porschemad911@gmail.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: PROBLEM: Linux 6.17.4 - no audio on Hardkernel Odroid Go Ultra
In-Reply-To: <9e966ea8-487e-4d0a-bf39-61428b3f9163@gmail.com> (John Williams's
	message of "Thu, 23 Oct 2025 14:34:38 +1100")
References: <9e966ea8-487e-4d0a-bf39-61428b3f9163@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 23 Oct 2025 10:38:59 +0200
Message-ID: <1jldl22esc.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 23 Oct 2025 at 14:34, John Williams <porschemad911@gmail.com> wrote:

> [1.] One line summary of the problem: Linux 6.17.4 - no audio on Hardkernel Odroid Go Ultra
>
> [2.] Full description of the problem/report: I am working on upgrading ROCKNIX on the Odroid Go Ultra from Linux 6.12.43 to 6.17.4 (via 6.16.9 as an interim step for testing) - PR https://github.com/ROCKNIX/distribution/pull/1898
>
> Kernel config was updated via 'olddefconfig' from 6.12.43 to 6.17.4
>
> Audio works fine with 6.12.43, works fine (after a wireplumber restart, not on first boot) with 6.16.9, but does not work at all with 6.17.4.
>
> No sound cards / sinks picked up by alsa / pactl / wpctl.
>
> dmesg log is attached (desg.txt), important messages are:
>
> [    1.916788] ALSA device list:
> [    1.916818]   No soundcards found.
> ...
> [   17.645092] platform sound: deferred probe pending: (reason unknown)
> [   17.645109] platform ff642340.audio-controller: deferred probe pending: axg-tdmin: failed to get reset
> [   17.645115] platform ff642540.audio-controller: deferred probe pending: axg-tdmout: failed to get reset
>

You are missing CONFIG_RESET_MESON_AUX

> [3.] Keywords (i.e., modules, networking, kernel): amlogic, meson, axg, sound, audio
>
> [4.] Kernel information
> [4.1.] Kernel version (from /proc/version): Linux version 6.17.4 (docker@323dec686e20) (aarch64-rocknix-linux-gnueabi-gcc-14.2.0 (GCC) 14.2.0, GNU ld (GNU Binutils) 2.44) #1 SMP PREEMPT Wed Oct 22 23:21:15 UTC 2025
> [4.2.] Kernel .config file: see attached .config
>
> [5.] Most recent kernel version which did not have the bug: 6.16.9
>
> [6.] Output of Oops.. message (if applicable) with symbolic information
>      resolved (see Documentation/admin-guide/bug-hunting.rst)
>
> [7.] A small shell script or example program which triggers the
>      problem (if possible)
>
> [8.] Environment
>
> [8.1.] Software (add the output of the ver_linux script here)
>
> Linux S922X 6.17.4 #1 SMP PREEMPT Wed Oct 22 23:21:15 UTC 2025 aarch64 GNU/Linux
>
> Util-linux          	799088
> Mount               	799088
> Module-init-tools   	34.2
> E2fsprogs           	1.47.0
> Linux C++ Library   	6.0.33
> Dynamic linker (ldd)	2.40
> Procps              	4.0.5
> Udev                	255
> Modules Loaded      	cdc_ether cdc_ncm cfg80211 drm_shmem_helper gpu_sched nfnetlink ntfs3 overlay panfrost pkcs8_key_parser rfkill rocknix_joypad rtc_meson_vrtc usbnet zram zsmalloc
>
>
> [8.2.] Processor information (from /proc/cpuinfo): see attached cpuinfo.txt
> [8.3.] Module information (from /proc/modules): see attached modules.txt
> [8.4.] Loaded driver and hardware information (/proc/ioports, /proc/iomem): see attached iomem.txt
> [8.5.] PCI information ('lspci -vvv' as root): N/A - no PCI bus
> [8.6.] SCSI information (from /proc/scsi/scsi): N/A - no SCSI
>
> [8.7.] Other information that might be relevant to the problem
>        (please look in /proc and include all information that you
>        think to be relevant):
>
> - see attached alsa-info.txt.XXXX7OPGP3 (no soundcards found)
> - see attached decompiled devicetree pulled from the Odroid Go Ultra
>
> [X.] Other notes, patches, fixes, workarounds:
>
> In testing this issue, I have removed any downstream patches to relevant devicetree nodes, these results are purely with the 6.17.4 mainline devicetrees.
>
> I apologize if I have not filled this issue report correctly, this is my first attempt.
>
> Regards,
>
> John Williams
> porschemad911@gmail.com
>
> [2. text/plain; .config]...
>
> [3. text/plain; dmesg.txt]...
>
> [4. text/plain; cpuinfo.txt]...
>
> [5. text/plain; modules.txt]...
>
> [6. text/plain; iomem.txt]...
>
> [7. text/plain; alsa-info.txt.XXXX7OPGP3]...
>
> [8. audio/vnd.dts; meson-g12b-odroid-go-ultra.dts]...

-- 
Jerome
