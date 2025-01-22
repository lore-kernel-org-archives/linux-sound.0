Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D612111CA0
	for <linux-sound@vger.kernel.org>; Wed, 22 Jan 2025 00:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737507509; cv=none; b=fnV586/8auXzQt/+3Fzau2XdJPE2w4UQ0FlwPnt9oVJ3fmbIH6I2Z3qkKm00FBzHH6B9UwbUo/TbUhbq21HentCKo0gyyB0OOCQya5UJvsJxgNArlqbAngxIa7dCy0tNvi/aOh0XvYD8GZwlZL88MUJoHFZKF7lkn09KVx487cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737507509; c=relaxed/simple;
	bh=0zQdnMFmSWpmMe+EfAiM8zzV78pVs/URU9jUUfmtJHI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Ls7l3wv+Lda/M8kWav86TwqGdlKuAnQEf9HYlJMAzM+LhISa3vu5iMEQ7txrBKPBf86gy3s1vWPSLfcEwzyUnRxp+Wr4nHiIEA3AjFCmD1s5G2CkCMewxAP3cNZ3Ps1gSMC13pGUDSNSfCsRLD80Wu1uHKRMye55lCyNdZIe/iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anislandsomewhere.com; spf=none smtp.mailfrom=anislandsomewhere.com; dkim=pass (2048-bit key) header.d=anislandsomewhere-com.20230601.gappssmtp.com header.i=@anislandsomewhere-com.20230601.gappssmtp.com header.b=sOQ1a/nX; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anislandsomewhere.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=anislandsomewhere.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anislandsomewhere-com.20230601.gappssmtp.com header.i=@anislandsomewhere-com.20230601.gappssmtp.com header.b="sOQ1a/nX"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3a9caa3726fso1165995ab.1
        for <linux-sound@vger.kernel.org>; Tue, 21 Jan 2025 16:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anislandsomewhere-com.20230601.gappssmtp.com; s=20230601; t=1737507507; x=1738112307; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T4h+Wlutw6yiE+b0hbU5HhjjStbr5XY31EPMgsoUPcw=;
        b=sOQ1a/nXYNpGrMgz6WRh7xU5/bWaKOq1AO8BASGC9zZnL0PSGNkjHCfUC4giva2XiW
         NU2JhdF00ouhVgSXEbv+WYqyzbhdPavjtSoaNnFSqxbVYPhtgtr7mecDzuT29VbAD4GH
         +ek0ddB61PscCuZk3cFgyYa0Pnjtzu9KIR4ZBRFEx9hgz/8vuQ25uJ1+LT9pQ1MgJY+l
         wMDYZYMMl7Iaxw2q18WZ8SbRcn4wq6w42ZI1Lbw/m3+aGr0jRSkW2GtG+UxmATUP+UGs
         OAFRUmNtDZWSm0TuF/IGSNfUGYY4OyykFQDoie1DTh3DB3rRcfvX1M66wTUb2PKjJ3DK
         y2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737507507; x=1738112307;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T4h+Wlutw6yiE+b0hbU5HhjjStbr5XY31EPMgsoUPcw=;
        b=ZVJWuDAhrMOzMT8b4DV5WFFKCqBIMCToKPagQEmqHacS23eS58IfVh8CJZ/Psda542
         EpfUbZ8565Ysg9/Muj7qJ0dyXz467xkNpYT0pUOZ96luwHfsqmFGrkyo+/HMyE2/mBgF
         cP6hu+xS1v5sfcXt20I0tv4FBNwseCpTDXp3CFGcVhZ3vwbDWbJEu5WV/D+6ypTLkqrc
         m8zEQrBs3z2qm3Acl55a6HlK3rbYo/aevOZLpy1N7a9mzaEQaUAANDZdyiu1kjnP+iEb
         UN3B8GI68BWwtmaV8kM+aiZ6wP1K3gjjtvG+yRPjvnHxy9jNLwj3yW0uiO0afFX/lWFB
         VG6g==
X-Gm-Message-State: AOJu0YwWMvmEz8wbkb8tBfW9SOIxZVFBYacc/XjP9Sk+TydLSFA3sC+S
	lxs1AAUBC+d9PAn7Ornj+7lMDsmiP2/5u/pU4o9bfudrGdfo02HmD5jipFSAY3WhxiyhXvlEerh
	3J6J+RkREC/ocJxwlV5KbwFwO9uWI0BWmZ/qeUF+6UrXvjJXx0d4=
X-Gm-Gg: ASbGnctNt9ivjWCNEDaDU8gOGJJLA6GjY7qy9iKjmmug/Mf+fck6FyRkXiDOovOh8bS
	OuWTV7GESlNuCeMnIU1+Is/K/tGpDzSW6u+WM0E2GWx05WKMKJWo=
X-Google-Smtp-Source: AGHT+IGPquxAI/l58tF+uHh6Lj65ovOUWGToT+QdyduLQi+5OJIw6PfRdQ16j1elL1CD02PF+VOHPzLPZSVB9K08R/M=
X-Received: by 2002:a05:6e02:12c6:b0:3ce:7a41:d885 with SMTP id
 e9e14a558f8ab-3ce8496337bmr244989365ab.1.1737507506744; Tue, 21 Jan 2025
 16:58:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Samantha Glocker <iam@anislandsomewhere.com>
Date: Tue, 21 Jan 2025 19:58:16 -0500
X-Gm-Features: AbW1kvYiwY1lMc3N4DYttL1SAQ88rgwCV0xjEO8uhlFBsHmR5FnozFKP5A7zHwU
Message-ID: <CAGPQRHYd48U__UKYj2jJnT4+dnNNoWRBi+wj6zPRn=JpNMBUrg@mail.gmail.com>
Subject: possible issue with ALSA: hda/realtek: Use codec SSID matching for
 Lenovo devices
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"

Hi, I'm a kernel maintainer from nobara and ASUS-Linux.

I've bifurcated an issue with sound on Lenovo Legion laptop(s)
starting from mainline 6.12.5, verified on Fedora proper, Nobara, and
CachyOS.

From the changelog,
https://patch.msgid.link/20241008120233.7154-4-tiwai@suse.de looks
like a likely candidate due to touching TAS2781 / TIA2781.

The issue will possibly affect sound on any or all Lenovo Legion Gen 8 and 9.

The obvious difference in dmesg on my Legion Pro 7 Gen 8 (16ARX8H) on
6.12.5, is the following line is completely missing:
[    4.761665] snd_hda_codec_realtek hdaudioC1D0: bound
i2c-TIAS2781:00 (ops tas2781_hda_comp_ops
[snd_hda_scodec_tas2781_i2c])

This suggests the TI amplifier is never identified.

(A second issue is LenovoLegionLinux DKMS not loading at all as of
6.12.5. I believe this is a separate issue, but it could be related to
how that project detects laptop models. Mentioning it here for
completeness.)

Best regards,
Samantha Glocker (SammiLucia)
