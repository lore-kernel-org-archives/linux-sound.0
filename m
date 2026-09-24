Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DF548F839
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 19:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790276840; cv=pass; b=s118I+CQPNT2rSBebJch3t8A39wa7mWUX8+Q+sYo0TEnt8aHqO+dMkmdD3twC7IHiRoKLhFv1A2M269u4PF/N3RGH5ZQOnQp6OC6yqqnkudJfdb2MLTYdk0TtPSl8F2vfVFGWzmtF8Mv4RR2tIb9YEyg2rn2FXqnlkuzOh/X0/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790276840; c=relaxed/simple;
	bh=2/WSTd+y14je9JhFv7F2CKwFJHzDIRhxHXeTsRcXI4M=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=h1bJF/zhw8Cu8XmeGebhM9yqmkpSMInwBjn4H7RxqamUbVJRFuJyr9pSjMGpszUbiiB1rEHZrGwkpwIemH15LxlPKYnO1kWhzSFSjAp3bHrIGwACG0fDNJpGEvKfFtsMSVglP16UfjKpTiTnwwzxFJ0WuD8fHYfjP01qQJsdAt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l8BG0eot; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l8BG0eot"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91058dd77a2so2122046d6.3
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 12:07:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790276837; cv=none;
        d=google.com; s=arc-20260327;
        b=GC9J41zP1y2CItVUUGAx8lKq+89ZDQtEZIkq38OQgYZDMtAAIO3spIqXCjF8751sE8
         jj4uAFmzZhEf+81cQlwXZDMHxx7E5XZUuKWc4B40fqGZo5Wes7uSpc4pzOWfYFhQ0je9
         w4x6Y/0i55ZG5BCXWA9X4o6Q5wEINMGOoZZuaomWkla49cyu1ONEdGyXZF3x58W35clV
         Ga5Ej1XVEfZkQEBSP+dEdzYyj9G+3VoEEYofT5yxgaxZageE/BbXkvOqP1rS3Ydm5xDM
         QAJgFQ0btieoh9bjD1rPRcfz5Qwl9HxRJJrjXu7G7iYj5S80QM3XL+cvInEEG5t+l3sj
         wCdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=TbGyLnRmRC0d4l9XcpapWGcpMTyVPfqjUoe7endFhiQ=;
        fh=2D8RZyyngEoPxez0xHYceT5YfwXJMmezuTutI4GlhmY=;
        b=GHflzPBSRD3578d+cQCMYC6cp2hzsYF0fy1hJ1ceo0wF6tzuMbaY1eEju5CwdaIYfT
         Ps4h85Ome+GBsiI1lr6iPZY8LjYDUOSRs8tmHkXltAbONYoeoCrE9LmBR+kJOViBmNGS
         gWnaIz8nhoHF+1AGF4GwuGpyxAoNvgE63WgDmGjrlZ5DoesGaUJS1i2E0viN9p97BtbT
         iyWtvZ+Ftem0Pu104/d3hE8HE/ug1AAQK2/mmwB/cpQQvz2C0ttuzvysol1isD4LJcFv
         c/bfKjGjqE4IVyG6r7gA2tXtXe9SaIVzIz8ZVpfebtsF6ahr9H5jvDlEHU753QCfuE2B
         jRAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790276837; x=1790881637; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TbGyLnRmRC0d4l9XcpapWGcpMTyVPfqjUoe7endFhiQ=;
        b=l8BG0eotwp70quZkcAIWLVhV1A+acRnbuuhhpuF74/3mA35Vp2tcDpCAKesAZgJXRd
         djktvhDNStUX7n/CiQi3M2VWALU1TLShv9bIXAAkKKf0NXgJmKU3tM6apuA0ccFC65Op
         DCTDfgVXigNfSOglAkhwg99SgAAPmn9o5qup1btKAdVAX4q8DcyebyV8Z4oTGXDM3Ifa
         yjsi4IcRELq2b/Q3KfFAVpBNk5KoE1NNdKzpNu5JDPPaWgfNBYNXEOeNvFtCrT3GEn44
         eV1JK0q6GWMweO8ENIzZKfGsKluNny7Up5KCY9p9A+fiUNFzfKw/WT+sKCzieg5bUOZS
         lQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790276837; x=1790881637;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TbGyLnRmRC0d4l9XcpapWGcpMTyVPfqjUoe7endFhiQ=;
        b=l3voRBEQ1Cdq+/9382AO6wXDzpZ3GKlbCRkFCQU11+AycWkyH7DfPBakjCKSN00zJ2
         UfLxMSpA/OolBLwvpv2PD9Qv70zK0Mj3PLVse89xG1+8yM7DQZx47U/1/C+kDp/GZhyb
         iO2bofk3bhGxqY+RaX/RIWL5R0oMQ98Hvgl+bjByuBn7ijehzji2qGzkwno2lS0TcPmd
         0d3hMWKm9FmQ/dpP6+r7EcLB0AbJjOMIWv5zw38nGCOS6zR8LLioz0oKWcaNBJYrjvgV
         g8PcDN2I6DYwXQExoCpe/Vq+TMlohzhftXXYhrX0xV6vHxDpjI1qSGBIx+9h6rmsukD3
         HCmw==
X-Gm-Message-State: AFuF++ksPumwZkg4cJz+fZMFBE3c/7uUB9IhEMXDcXvu6ZipVtYZuBBz
	ltxm918Wh3sd7PcsFqtREQP0/Ju+4KePJmbTadMR2c0ipPD22wOGkbUp6m7+Hghr9gTGHvybwD1
	iy+iPj1ZyNX4AvrW/SIWvldzGA8OW+FdWPf6BKrs=
X-Gm-Gg: AYBFou3Y36yDpMXGXedHqpWuX6ZZx0c0wOMjPiPh7hO4M5LhunCFcFMw6Sjii7ZNtwU
	Ibxt5xEH85x3pH+bVzfQKw7RThvPbUw/tQilAFy7u2ZTJLOkuOIVaVsAEHY6aXpELP9r4tblpHE
	a0BrAdJQF50jUhUXs2o8Wy9KgAGsDKvbCpBElhynvSojuN0FSmpqGIY9snZF03tbDPYAKeag1YJ
	acv3sxJribLvfNDSDIYjkkgjlg7YL+Yn8ljYRtws3XneTgh38/U5qcbZa3X4YiHMGaBiahxI8U6
	DIJIr9JSEA5GwyKrlYi75TJh86u4GHRMlCiNJdnWBnxJYWYec/3dr5JZIXDtXaVIwMRb7pq2LVh
	6TDtL3RV9F6/rbVXgLCZxUaLMU2ARIKUaat8B9dOkA1Ia4qsKty9i39VBMHHnIgYHTuYwH2lmlw
	==
X-Received: by 2002:a05:6214:3202:b0:910:41ff:e822 with SMTP id
 6a1803df08f44-9142f747831mr4503746d6.29.1790276836842; Thu, 24 Sep 2026
 12:07:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Zach Low <zach.low98@gmail.com>
Date: Thu, 24 Sep 2026 14:07:07 -0500
X-Gm-Features: AclHuK__dxqDx_AjD9clsPfZDHcyBSxB20RKSq8flo_ygj_IKf1UOQP7NKAx3IE
Message-ID: <CALBELDjo6G7tyrFTJE_N6UMCXkyr80kwG+Db+40+c4b3+QUJ+Q@mail.gmail.com>
Subject: [RFC] ALSA: hda/realtek: Dell Latitude 7440 (1028:0c0d) speaker amp
 hisses while muted
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>, Kailang Yang <kailang@realtek.com>, Zach Low <zach.low98@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

The internal speakers on a Dell Latitude 7440 (SKU 0C0D, ALC289,
PCI SSID 1028:0c0d) emit a loud high-pitched hiss while the output is
muted. It reproduces from a live USB, so it is not a userspace
configuration issue.

Hardware / software
-------------------
  Laptop:   Dell Latitude 7440, product SKU 0C0D
  Codec:    Realtek ALC289, Subsystem Id 0x10280c0d
  Driver:   snd_hda_intel (not SOF)
  Kernel:   7.1.8+deb13-amd64 (Debian 13 / LMDE 7)
  Fixup:    quirk table matches by PCI SSID; the fixup name is not printed
            on this build, but the table entry for 0x1028:0x0c0d appears to
            be ALC289_FIXUP_RTK_AMP_DUAL_SPK ("Dell Oasis")
  dmesg:    ALC289: picked fixup  for PCI SSID 1028:0c0d
            autoconfig for ALC289: line_outs=2 (0x17/0x14/0x0/0x0/0x0)
            type:speaker

Symptom
-------
When the output is muted (desktop mute, or the Master / Speaker /
Bass Speaker switches in alsamixer) while a stream is playing, a hiss
comes from the speakers. It stops when both "Master" and "Bass Speaker"
are switched back on, even with "Speaker" (pin 0x17) left muted.
Muting again brings it back.

Findings
--------
1. Codec dumps (linked below, quiet and noisy states) differ only in
   the pin amp mute state. In the noisy state NID 0x14 (Bass Speaker)
   and NID 0x17 (Speaker) both have Amp-Out vals [0x80 0x80]; in the
   quiet state both are [0x00 0x00]. Only the mute of 0x14 matters:
   unmuting 0x14 alone is enough to stop the hiss.
2. Both speaker pins are fed by the same DAC (NID 0x02), and both have
   EAPD enabled (0x2).
3. snd_hda_intel power_save=0 and power_save_controller=N make no
   difference.
4. With the hiss present, running

     hda-verb /dev/snd/hwC0D0 0x14 SET_EAPD_BTL 0x0

   stops it immediately. However, with EAPD on 0x14 off, all speaker
   output is silent even when unmuted, until EAPD is set back to 0x2.
   So EAPD on 0x14 appears to gate the shared speaker amplifier, and
   the amplifier hisses when it stays enabled while its inputs are
   muted.
5. Making PipeWire use a software mixer (api.alsa.soft-mixer) avoids the
   hardware mute and hides the hiss, but leaves the hardware volume low
   and changes the sound, so it is only a workaround.

Question
--------
It looks like EAPD on the bass speaker pin (0x14) should follow the
mute state so the amplifier is only enabled when sound is wanted. Is
that the right way to handle this amp, or is there a coefficient/GPIO
setting that keeps it quiet while muted? The same fixup is used for
1028:0c0b and 1028:0c0e, so those machines may be affected too, but I
have only tested the 0c0d.

I'm happy to test any patch.

Links
-----
  codec0_quiet.txt:
https://privatebin.net/?38b6afa8d5f8fafa#6RGSdUzd1cquzFqbgyvgTmP71qSNfw3gsxrdCoJr9fgM
  codec0_noisy.txt:
https://privatebin.net/?2ce6b8dfba9e71c9#7WxpV7fmEUtUc7UKoZBeoSB4he5Wumqr3w8BjactUC6b
  diff of the two:
https://privatebin.net/?1ef495132ba35d13#AcsVmEjnG2BmPUEvKkbomomt5rJagPdcxJzm4VEBdU94
  alsa-info output:
https://privatebin.net/?79cdf993c90dc485#2xUz1SgFEUESjc26gSZi9JTx7Q2dWaTtXc4BzWNSZxRN

Thanks,


Zach Low
