Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795540485;
	b=t+Hek//IftN+GBKDBCO09xOdBmJCrCwaq99Qu0P1ZAd2kifkawe58yHaUS6bgA2bX5HT
	 GA0uDgZJebyHZXCoqDh+Ap21SjXwAOWKcOjzsbVbYkcSjKIrUkdNrlrzrMv/6AX9ZkeEZ
	 3dDv2XbMH7U1u6AwVGGutt4ii/kSLJOYemawg6oKEtGz7nkS+GS6OBwgXEA1FthOdPDih
	 e/Ik0mteY//5V3k9jNB98JpV+YQmsh1ZYpStwkojGXZcQ1SzhQsWPBTTAlvBQm5qeukox
	 Uw/dozuxC0NUfBLS1RIF6KIkslm1PcMMZZt0M4RR9cCyFU9XMS2i0xM37WzOGryjnYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=JkdWMaHEFhRQdcJF52mb3PfKCcY/Nh7fWEhObHmnxjg=;
	b=zAzE0gBblmov8yZximQ2Br/leMVboZJDuuzb1gCHJ4QInJ6nLyMcNa9eMVBwBfWTw+v4
	 oLQhGQ/NFNd965kftQh4/uAZ9O2lu+F0MUARA0hZDNd+tHCNgJKz02+5IMpcZC15UWGJx
	 0rRv90g8jtIIEV8KLIisCNhOdSaveak0aLDcJzcUdd/H0ZChYDPbOE/o1vnfXAtZXvSJq
	 I+e2jH4H+xJ1nzocZxmqAxloOAdYUDPgf/Y9pFD5eEpof8wM+gD7pekjJM+L22COYdHy0
	 Vveg8UEYq9MVx5BoQUI7aIWifBxLaTfQw8c5THjveGrZMaWL/yMusrgNumXK38vFkHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z7KTeB31;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D69606A31E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 17:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41D69606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z7KTeB31
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67db3a48dc6so5595207d50.3
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 09:14:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795540484; cv=none;
        d=google.com; s=arc-20260327;
        b=N2FAsA7x0kjOGSwi0bbcl2L94TEmf4Pkoe8D5bE2HijKHuR5u1gYR2pgoDytHes3t0
         w1dWUstwNV4oVlE7xewfzYe8Rs+JgaufdRqHOJ5jxZnoupYL1wJYHan2gsjwfydjH4Hq
         s62Q1UXuN3CKc4JaMsTiZikhJ2bee99NJ0MeOCKNrSBjQIzJkci8i06OKn25ByL/FMSm
         OFxK9vhAP9df749CMcN/XguIV1BKvLqc4zQgOXHVDbpfqMcLsb1/ygGFKnJPwx65chFP
         CmRnvJtfA7cF8xisCWEX+K/NmxtRgCiw7UR5y/BhL4d4kdhh4nE/PtabuTuCIU+C7VHT
         6DYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=JkdWMaHEFhRQdcJF52mb3PfKCcY/Nh7fWEhObHmnxjg=;
        fh=as0RKDD+fiaXY4YDNdBk6vOP3zUZaQ8btkrhg7iUBLs=;
        b=pO3NJNV/zO6tGsVKzZGrH6LVb9JxV8rqwTOWvm0CRbLBH0lAB6KNZvbC5oEu9x0Gu7
         cKSpP8vntXuz3znqhY6iYpPApiCUA8DFIbs3oktM5yESCk+THzL1BaHvirQY7m1VCSrN
         gmNpOzOC1jQFznT792e+Loh3MQxxGJfcH9A1qBy9hcsWMN1BsQAchMGSjBB7nEjXb3Wk
         nV0wHlkfnzDQEprFBEmkvqZLpc52dLNsFEA1fRa3w0Men/hx/PsoEbxZpD5BZIhYgUEL
         sgBSwl/fuuybafysgZQtNevI0vk67qZ1ds9aUgU8qpiaH/WJIgO2HYoydy46pWJI9DX1
         z6nA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795540484; x=1796145284; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JkdWMaHEFhRQdcJF52mb3PfKCcY/Nh7fWEhObHmnxjg=;
        b=z7KTeB316xkirr0lBY+IESnjjl138z/7lWdqMnlDue9XDOGqRWzXx4rkDb39MV6MRF
         fqA3ofXGn/J0iYyW/2s4hlVvHMsOki3/SfsWuDKiLvPyeswnUnWR8YoxCjUbqSsHuKCQ
         tYkE1emMnPH/rh/UZYuu0v9j8FV8BLnnCSppYhCWn8D1CyexFPEYTqiyqXfxRSGBmWBc
         QrEtMxKX62uEUP9lnV+s+aP25f+P5Et6cwruC0xSaULsXvay4Lw7RWNpAT2Di1tUgnpQ
         eTvoUHskvA747Bw4hhWaYf9cGwq60lMIryfRhWOdA1sNxWU3u8XZNFbZMDNKa/fuMekV
         DDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540484; x=1796145284;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JkdWMaHEFhRQdcJF52mb3PfKCcY/Nh7fWEhObHmnxjg=;
        b=qdJ5iJmHkWDHwTNQU5rJIjqWi0Dpj3nbAiaXvxH9OuzGJpEJlU8hEVdzjhTz1p1M5e
         5dvEI1RlVf72zhosT4bJtNYrvqJTUyk1132fNjI0ImpT8gL96KZi1jUZga1DcXZm2q0j
         F4vpJUI/KezZ2QFCMcA1kjFDmMcNNrYeQHAdBToflQAQ8pKZOPuKanK41W5J1UM+MYj6
         yipOw7U9KPQ+4IuqNBoCwibAcnz6a8mN+3Kf1SspzyIZACeBY97lida0SSO/0uOyOrrF
         GL5YPYR7Htf+EQ1ux/sdE6ab8Ve9zBUxXzdt9rs8NpvG9BSlvqd85nfxBP9pHjAxx+KT
         zh7A==
X-Gm-Message-State: APuU4Z+5kGdgOtiAnuiso5WxXISLqhRViM5UJRm+DFbkPP+gGJSSAHb0
	5eq9KG2u2KrQdgsxOm0cZqSXqA9TFf93aTIHRVPdCx9OeNkqBQCSqlLzZGOq8IiRQ+fHiBsFjrr
	CFC/ICVjXedz+teBJG2dwPRXTa7aU2lzk/qRI
X-Gm-Gg: AZFdTZehVcAYjcWnSn5S0Qro29mIGXLfpufkNH70aYPMlYxuNTjwUT0i8H0U/1Wppew
	K6wgr5hQEDkUE79If/5+ztY7jcbSHsV0P/+qmEq2UOLYyrg4hYHBtvc04tY+FC2/OfJtBSnYVyb
	2iz3/BDfleqSnLbZPebrZg+ShEfiXn4zTRhJIQjQoaEpVmiQN8BugVW8HjIAGsihjZvK12KSOjc
	fvZS8MfARxN+Rr5Dyfc5AVYZg/4PRtgEC8ZbCPjbs9QjUwgI1gY+8rP2jTWFQ3VMDjS1IOfYkLk
	bxOUhCvcAGM0dt+OyL/nJu7GheFwYPRQ83G5EcbeTwDcODceGqaPNq/0skcJGdnB1QCQYL000Xi
	Due1yhK7HEOtPKy28juVBQ4PhZAkwHHd9qPJzZ2SA1bHRj5fOvgxf9zfHG/EyawMTZWpfYWgpTF
	vqssIsclMW7czX7pW1WsMilV/vBHuzVV1HyyNxwViIJmMJOQ==
X-Received: by 2002:a05:690e:408d:b0:67d:c305:ca1f with SMTP id
 956f58d0204a3-67df43f32b9mr5238531d50.53.1795540483977; Tue, 24 Nov 2026
 09:14:43 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Heitor Tetzner <heitortetzner2015@gmail.com>
Date: Tue, 24 Nov 2026 14:14:32 -0300
X-Gm-Features: Aa3M54qLLhIRgkQA03Pq1y7nKl3LutElEJHWbD3ZeSizSk_0CvVudE6JpYuE7gA
Message-ID: <CAK+ZZPougcEpmUO1iUbFmSMKhZbTkh9CnBD8QYfY09R-MC6KgA@mail.gmail.com>
Subject: ALC245: static noise on headphones after boot on Acer Nitro ANV15-51,
 fixed by suspend/resume
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com, perex@perex.cz
Content-Type: text/plain; charset="UTF-8"

Hello,

On my Acer Nitro V 15 (ANV15-51) the headphone output has a constant
static noise after boot. The noise goes away after a suspend/resume
cycle (or after replugging the headphones). It happens on most
boots, so it looks like the codec is left in a bad state at init and
gets fully re-initialized on resume.

Hardware / software:
  Machine:   Acer Nitro ANV15-51
  BIOS:      V1.60
  Codec:     Realtek ALC245, subsystem id 0x1025171e
  Audio:     Intel with SOF (skl_hda_dsp_generic), HDA codec on the
             headphone jack
  Kernel:    7.0.0-43-generic (Linux Mint); also seen with 7.3.5 on NixOS
  Distros:   reproduced on Fedora, Linux Mint and NixOS, so it does not
             look distro-specific
  Firmware:  linux-firmware and sof-firmware installed, no change

What I observed:
  Reading the codec with hda-verb on the Realtek hwC device (measured on
  NixOS, kernel 7.3.5), coefficient 0x46 changes across the suspend/resume
  cycle that removes the noise:

    Before suspend (noise present):  coef 0x46 = 0x4,  coef 0x67 = 0xf083
    After suspend (noise gone):      coef 0x46 = 0x14, coef 0x67 = 0xf083
    Jack 0x21 presence is 0x80000000 in both cases.

  A short suspend (rtcwake -m mem -s 5) is a reliable workaround.

alsa-info output:
https://gist.github.com/heitortetznerpereira/4c408a2789a0df64e795880d260a2474

I have not bisected the kernel yet. I can test patches or provide
more data (full coefficient dump before/after resume, dmesg) if that
helps.

Thanks,
Heitor Tetzner Pereira
