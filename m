Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793966479;
	b=lBsgEtprB6ZhLvAMTRSMNGtv4dkMPNXkVUQKXSAQ3v/5CrSk8viR2qGo1hM9t7lSplMO
	 HPYyFWeGsmUjoYTgzJGhMcC/FwTt6rKtdZ2CLP9i4oAVPZd28+5lnnfo75UFmGg7pEZ+D
	 FEXaf82z1LLV59UIvMdlI3URo1wWDByvPVuyklsnOzHFlL/gkRX0VmZZcO7cEofLxVWnx
	 79EuXqP+c2qWEFm6/cH/GGH22KopaDfKy03g35csG0iaLlJ5T4bP5nlxa8W9WqimuxKq+
	 an2GTkrzsXX1lmJOIXNlsJlcGB9uILQJZJ2BsFhEElv8w5323YzMsZRyWjDAhoW6u7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=7Atkv8Av9+Ao+eHQuMY+XWjPUUdTG2IMTe5rVcJzpas=;
	b=CALv/DGwIWU/M48VhOASRb+UWo0NXGfZudoosC6Id/wsp0pHQ/5QN/XUR6YnGOaQGEdY
	 /T1+0VM07mDL4n/92Q2IuzvArezc1yLVUKUIdxovLimKP/5YaPA09vfBtcegaH33q2nYR
	 ZxF70utu9cnXW7PKWI8Hfva5KKDSeHAUXAPvXNlbEoiMYwfyEeNN2RFn15N36SD86a5be
	 C/4+xB8iurHy9RkOquGMzyGBLPvaTbLSASf2cvGxo0N2hDEtWsldTMF4ZHqiXRd/Vklzu
	 fiYEyE8an+gK4HRW+H81nvLomfu/G617G+ezFduDXCCuwFpNJOeH/bKNL9q3DdsoLAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=janfabian.cz;
	spf=none smtp.mailfrom=janfabian.cz;
	dkim=pass header.d=janfabian-cz.20260707.gappssmtp.com header.i=@janfabian-cz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=m9WyR+EH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B87606A33C
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 12:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31B87606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=janfabian.cz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=janfabian.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=janfabian-cz.20260707.gappssmtp.com header.i=@janfabian-cz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=m9WyR+EH
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-9440304604aso62454285a.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 04:01:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793966473; cv=none;
        d=google.com; s=arc-20260327;
        b=GzoHPffl733PqgsYLZsMgwKggATKvvNIHp8W21Bc8u0mMbptV0fbWpw/cO+gfqducv
         dsgRGtvXm92G4eYpyuo1hNE2NYY0rNW6AlBsQBczf4TneiVJ4nCc5JwfnaDjBRM4FEBa
         VJb8BR1Xv9kt6LfI3eRMMey+aYcUcCk6FD4MUMVguxGAinfU7fHdQTHYrroinqGt68On
         B3HclSKFhrWaqlF9W/+O8l20iMMa1ZTBjCjgAZfTigjRZCUpdZ2jHAR6wHFHbZffWm1J
         AKJzNKEq7DgNBTg4NeTA5N9cs9iR+L3I8zKj9cjY4HzczCcfEyqxjoFZXXGzd+6lhfT7
         kigg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=7Atkv8Av9+Ao+eHQuMY+XWjPUUdTG2IMTe5rVcJzpas=;
        fh=XzgVJpB6RXxE0LaeUsp1Ql4KqgxTpJ2x6Dva+oB7h58=;
        b=R+VUmNqC7TcrnMRuOUPSAy+SQf9BeUDGVmNOxdBXU2IGMWf7nXFhRxRFGpOgarD+Ii
         YkuVle3O2IxEyVlcpQDH8ryyCGfgOxbcfl0o9v4Fq/ej5V9V3VaFy0iHsLrgUeFDcnHC
         FIlnXvU/8yU6rp7tUA/Kgr9V6abXTdA9vgB+KibQGR6wCaoZ/QLSvbC6JgZQPlEm6bYV
         lB9jBXPKBlTBOWThJ4UWHMetQjC2fWq7EbjGDlQ59YYwfWXLHPhIauTa9ADakeWo5zG1
         Wst4sB/5sAbWv4LOcis56OVArTSCyesIYQO3SHQvLdjtc/W8ZiVjoF1SuOSpCXe4rewr
         yICA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=janfabian-cz.20260707.gappssmtp.com; s=20260707; t=1793966473; x=1794571273; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Atkv8Av9+Ao+eHQuMY+XWjPUUdTG2IMTe5rVcJzpas=;
        b=m9WyR+EHYRDo2JoRU0miwDWW4tloiONj6mV5//vpPrT13wUC2RC07ROw+sj0IXP/kZ
         gWf70A8DRbiIQgR/LedqAaAD47/bn6N88fwuARqVz1U0dy29akqg9a/IMvPuvo+Wr7hs
         7VWaEpODH6rzz7ycrPVG7h62avoXiUDejWV4L+uc2LA1BRgoTxmcvChcxGDoIJdaVLNA
         wIJiXevH9Q9dpwJsQ5h6quAobXG+KKWQUSbVPtCgOucYZpUdT5vV7Uxaaw2/SCIgSu1f
         u4/tNWB13GzmBY7MUy/Fp2/Q0iI5YQkJvBogtjjrM7i7FK/6UbIlXVBB2OAwwvt7nABT
         yKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966473; x=1794571273;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7Atkv8Av9+Ao+eHQuMY+XWjPUUdTG2IMTe5rVcJzpas=;
        b=nuPlRz49prtwN0KKP/FUXsbwEWgc83Zo1HTlk01cPK+9rF0eOEQqN7NSUOtfj5AYAE
         PdVwaStz0a1dIEnZzUxz9T6bHJ97THQBx1TxfykwOgeG03N3aqZzMj7TbFbIt9IlNzPJ
         O8OvgbgAkGd9TSCyIaY/TsmyNgLk5AGASCzaB+s+8JK3nCk74mRx0qIJ513asERdpgGf
         /Unwztc97waR86U4UQilkXZkZX8+rVpY49s1NjZfyHaega0HP+eyZVT4Gmr/xT3qHd8K
         eAbTTXi3JMwd2rw7LzAapQIVbEDgJXtUxlkEar6dvVTvDFddYotoDJlRhw/onaoHIgMK
         Pj0A==
X-Forwarded-Encrypted: i=1; AKwUvBwFLs3C3jlIHf6wTbzagQ7EoqhihQ1RFN/Rs3CSqbRbtuemLakJ6yEbJOkXddHNS4P8Bden8J7vpbiBZA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+OuUt2r40B5G+nTiy3N//U8xD81q5ffLoPYQBBokoaLTpBEcog
	IfyJKSbmoqcqHkARsgHLWS+6/PyiiUHT7Rma8/HIHYVERb0VDDSsIF/1LQ/eLGBgIjLWUxJ+4Mf
	diSp0tdNeGLu0vHN2LYRoMmb2vktOWQmHaGRld7J8rA==
X-Gm-Gg: AYBFou3nL2RWnPepcwe0381ttyn1DyeQ6TH/PQGrK6StOI0NzMLVgX6QWBWZ4jI4Xo3
	4uxKFEL9OhmhzfqLsorIhGxFYz4apyXJMy34RkV10ofvGbZw0Qx/5Jq6DOJ//AkVg+PtLrb4pKZ
	N9Jw/RlQQfmdG2CIeOviBacYfS+Ei2955kClfXmsOSgoPgCxvrLRECSGzhn+hSR1+MgYEwxaqX5
	wfbzas3JOhLSQKYQ/5nI3DpPJGux/oKGqKgb5dd1/9dgtvRk0M/Nf9+r76sMRYGT3BtYzTEng/L
	9QNDnOaQMoimLl87813vAXqZMcgveNCpn3TUqPhWr5KmCCMtIWsAD7usqMDNM2GDi6iXqsT6f84
	LRX/Ob3miiwqyd+GqsHSpJNNp78+hpckGSuAPYScOT4SbzTWHpyBXkwKnRXJtXHcispk/n9lHvp
	lVKAXXUGQbDW7Hf1JFYhk8Jej2oeJz5exnxhsWhXNRuM7AmEAJ9kZDIFP5
X-Received: by 2002:a05:620a:2794:b0:939:b0c8:b068 with SMTP id
 af79cd13be357-945f34bc0a1mr254496385a.16.1793966472954; Fri, 06 Nov 2026
 04:01:12 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Jan Fabian <mail@janfabian.cz>
Date: Fri, 6 Nov 2026 13:01:01 +0100
X-Gm-Features: AclHuK9A-2FTFvlKyzhSApeifYzSQH0lEyNG7mAx3QstJCDBSgdJAuxX-NobXGY
Message-ID: <CAEwhnkgosQd5hnN0qkH_xVrxngfhCpnALR6Gi7M1j-4tnSEKOw@mail.gmail.com>
Subject: Re: [REGRESSION] Speaker pop/chirp on Meteor Lake ALC287 (17aa:231e)
 -- 6.12.73 to 6.12.85
To: tiwai@suse.de
Cc: kailang@realtek.com, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, mikekarcic@protonmail.com, 
	regressions@lists.linux.dev, sean@starlabs.systems, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

(Reply to https://lore.kernel.org/all/87jysdv4qg.wl-tiwai@suse.de/
sent from webmail, so it may not thread automatically.)

Hi Takashi, Kailang,

Another data point from an X1 Carbon Gen 12 with the same codec and
SSID, which behaves like Mike's: the pop is still there with
46c862f5419e. Turning AMP silence detection back on at runtime removes
it, with no kernel rebuild.

Hardware: ThinkPad X1 Carbon Gen 12 (21KC004TGE), BIOS N3YET86W (1.51),
Core Ultra 7 155U. ALC287, vendor 0x10ec0287, subsystem 0x17aa231e,
revision 0x100002.

Software: Ubuntu 26.04, kernel 7.0.0-42-generic (based on 7.0.14), SOF
firmware 2.14.1.1 with sof-hda-generic-2ch.tplg, PipeWire 1.6.2,
WirePlumber 0.5.13.

I checked the compiled module to confirm 46c862f5419e is in effect:
alc287_alc1318_playback_pcm_hook only calls alc_write_coefex_idx, and
alc287_fixup_lenovo_thinkpad_with_alc1318 calls alc_process_coef_fw
twice. So dis_coefs runs once at probe, and en_coefs isn't present.

Symptom: a pop about 5 s after any sound. The sink goes from idle to
suspended exactly 5 s after playback ends, matching WirePlumber's
default timeout. Setting session.suspend-timeout-seconds = 0 stops the
pop, but costs roughly 1-2 W at idle on battery (about 4.4 W against
2.4 W), so it isn't a good workaround here.

Runtime test, writing the old en_coefs values:

  for p in "0x24 0x0013" "0x25 0x0000" "0x26 0xC203" \
           "0x28 0x0084" "0x29 0xb023"; do
    set -- $p
    hda-verb /dev/snd/hwC0D0 0x20 SET_COEF_INDEX $1
    hda-verb /dev/snd/hwC0D0 0x20 SET_PROC_COEF $2
  done

Results, by ear, on one boot:

- Before the write: a pop about 5 s after a bell.
- After the write: no pop after two bells, with the sink still
  suspending normally.
- The 630fbc6e870e scenario: a 13 s all-zero stream from one pw-play,
  with three bells from a second pw-play starting 7 s in. All three
  were audible, with no pop afterwards. That was one run, so it says
  little about the original no-sound bug.
- The write also works with the sink and codec runtime-suspended: no
  pop after a bell in a later run.

Not tested yet: whether the setting survives system suspend or
hibernate.

Since Kailang confirmed the same SSID shows different behaviour, is
there something I can read from this machine that would separate the
two groups, such as an amp revision? I'm also happy to test a patch.
From a quick look, master still has the probe-time dis_coefs call as
of late October.

Thanks,
JF
