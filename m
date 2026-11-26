Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795676659;
	b=ty4hbVtAC6UQNiPz/yqFoG20tXm3iNo1E5XMyg3/7EsUBC/zdV807gHIvzEWE7Pd+8g3
	 Oyk5XN71DsuI4fKWmSTMsME8IYMYUg4yH+4Oz4L21OxDvyOJmFTShHBxVBdKSKay41RsZ
	 F2jFgC8zYh0Xqo+/tdMQYLJSSQn5dO8Y5lkFSSXJZLa2pgsTput9L6bhIZEllysNjVJjc
	 oMyPW0p7HmG0uNiXvtjp9ZkSqJFuxJk1mE12FlHWTAUOZPDRMQKB2vhnJaMENV7UQSEeu
	 C/Ip12H48osL7FMQ4xlY1yl8hVaOfNwrzHuPn0mEgtc0rB4lvF80LX5qBXdCEWQEYRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=yGvBvYGWK+mC71ObyxvpPB7MWSlsSJBWFVbyDYkaqO4=;
	b=VBfcUsJzcgV4wkFqcxGVDTRC0QC7/OH0lMl1a7UFpo7cg79ALyWfF1yCty2IthLfLrrj
	 XecNAcCy7hRVdVCKu6beAirdWgmpqg7f2sh6v+THjjgyO9xWRYSAaTS2t2byVMyrlUqzt
	 sYmjHzjCs9cMd7kp2yKJmcsruSX3t5qdF6/mV6Ft0bgyUq8xRXQzzJ/F355ZUB+HNpcsP
	 /SJsv86Ll1Lc990DkLkaKHUy9xZ0jNNZWeqUlY+4cT8gmLnkikuMLZFO+z+4VUOxXqX28
	 wz1QTCbTtq7t4USMpwduFMPzW/4QkPVfClR0h0nl8xcCbz5zE0/H5BEU90J0WNiLkrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y2KxQ3sp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584C7606A31C
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 07:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 584C7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y2KxQ3sp
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdeaf4ea5e0so893791a12.1
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 23:04:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795676659; cv=none;
        d=google.com; s=arc-20260327;
        b=J9w4VdBFFSJBmhxu2HAu3dSZEm6tiW39j/jJUMsT5PNiQz2gjbbw5G/zowrwmiN4VN
         yOzyPLzsGexTAQKhWVIXUnjSYP+9WsWAnFJR434yrdBMAnrguN5TGndTIfvkYKvoLzER
         eC2qIJg14pQsJTERUjTvdsGOTxzR6ijM/C8L4fNspzQJuKfTTlbhl+MxmRRH2GBSJucY
         N4seb5ifOkF2vNnSIi/LbpvEjoaAc7o4Pc6Zy3vsDcgt/pTUldlbJUueMTvtIzp2s1cy
         rep93BtwY9bR0rFK6Df2w7NX8QlWJd6V+Vhmm0+Y0qbgzn58XJrojeKEnmARvfh3YFwE
         Zp3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=yGvBvYGWK+mC71ObyxvpPB7MWSlsSJBWFVbyDYkaqO4=;
        fh=7xL33lZ3DZeA6adqGVHVFCb+oWnTbg0PgQbJ47YnPsI=;
        b=Gb1GqnfpHm4GFrIZGH9FEh//RW/D1Vib3thCJEw7/+3Y9n7x/sStAgKHA7zYAySFs8
         zL1vsj/jTijt0aKXKS/l32nch35oSgvMkLocDv/5bc5AdmFnGdKjOs4TUKBjcfR3VFuN
         QuGhqQr8GN5+2pyq5KjJF3W7lVj+RD3CTgU2Bq0OtutY20H3/O4ohGfJF/8bsRE8O31B
         xcEDQsdock/2Zm877f3pRNavbFHpG6NBVSNm86trXJGY50vT1fXvgi5IQ/2T0ui6CJ97
         Ya8vi6hgtRDgcyp4iPjkFfylXBbZBQJTgL9+K1IbNHNqOk6qSSFvZFS4jNz5kclWMuuo
         QpcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795676659; x=1796281459; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yGvBvYGWK+mC71ObyxvpPB7MWSlsSJBWFVbyDYkaqO4=;
        b=Y2KxQ3spksYOEmuEUyR6NkBrzFfof6DfBqf5ft5VC1wgYpbOhZ/jenhe8W2hm+JGLT
         EewNzuFZtr0M8WJU1RjbM8pk07X3DROwZ9yV5gkiwMNsB3N3bezEccH9JZDJKhqhlI+i
         5nBbfqz87qvjlLAiceLVeQ9Gov5TYJbijUoCCGxe920c55WZkCc87qzH2Xdz2f3fRUlK
         sYH9HT3M3qii63znrHtmJSMMhdhPssB5MHGgKPU1GPRbFsinyY/j+c6VbGEKVK3aY4DH
         cQeyfVD+xYaVNsfTaGdwcuV6w1ft9lU+VY0iDcCfezVYQea8vxre7lb2Vj9eXGVDW7AN
         G1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676659; x=1796281459;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yGvBvYGWK+mC71ObyxvpPB7MWSlsSJBWFVbyDYkaqO4=;
        b=ooMG+D16vgPMrOB2+m1aG6m9MdkxUUZp0Pfmh/SPf/mgHyAWYfZNir8UMsC+wFUvxz
         cNI9xG38RU2Kf0mihp06qOBEZOkAn7yDo/ck6miAyRnpKtg5lw1FmUvtpylfR6wdcdr2
         mFHuXeNzHAf5fmxBuZplsGngm+RD6OUN7mSYOlNB10xJ37NpUNNnFE5NZPljFfCpFzdI
         Qe9OeDg9AfY3Jhyvkg6zGITrh3erZPOknL8OIHC4kd7l/kdZxUKiGrfCNNLYekgyAPf5
         78gMH0IMGcDm1l173xjsD0dduEeKtTK/+/FFTJD3TbMZ39m9QiMGr2r3kWl8ZOayqxPS
         Dkfw==
X-Gm-Message-State: APuU4Z+cAYXChaXxJD6pDbbWBoi+dZUfMd//touLt6gLdXrptnrVLcyr
	wu0WTyROnW6ydvW73JtO8ZrIAznT3xKr251hI+Z770CRNFYMgPRbJ5gT8BmrhSMh/hlDh1eVYO5
	JcJjFbCJbQ+ftz8C2QGau2Oyt5ZiEaE/xl7hq
X-Gm-Gg: AZFdTZek7s4kcpPYN+0/WHuvQS1K2dscCrbWxEkRj5S4Woxn3bWXAoSGxqn1yG9ZZNq
	eocm2MvyLHyTgxMAKNXB+WZF0gg72H+thykkbfHAcjrkmlCIjhg/9Z1zahyd1W9914wJCqr02ZS
	eNAlFwMnpUB+6CNQXGRfVmwOn7GSBkJcDvfdWXtMzq2KPZw5gCT4ybuv9CmUY0mOMwUIxo9DGd3
	X+AZRd5BU8dXApVtqD/dlG/UtzgyfXxhWj9i+IX9bmJdkMNz95aG9VaxeSgdYr8tXyVCzptaOki
	2FSweOUgfrucMS7EOP9xULXgC5dgwrjzm2qkUNITp+0O46GzaGtl9J2j0uF/5MwdWEw0YKCiaBg
	G/IF/fhp6WOfTmbnqcGtmfqQaF4CkEzrHSGUutJrOlCaXsMOdX0uhPtGfHL3LGkHjaJGAr1QaCm
	P8+Td1QJdZTt8C4Kw7UTYTxjBoRhz4XyRHxX4M2m4HIqDv+OvGHjt1dWpCCg7tJ/C/XqWjXUH1E
	SjU/llkVhTeksOyR4+DKkqaFkRV+Myjyuv30zamHA==
X-Received: by 2002:a17:90b:4406:b0:3ac:36c7:c144 with SMTP id
 98e67ed59e1d1-3b41c93cbfdmr12643941a91.28.1795676658435; Wed, 25 Nov 2026
 23:04:18 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: dahmane dahim <dahmanedahim04@gmail.com>
Date: Thu, 26 Nov 2026 08:03:41 +0100
X-Gm-Features: Aa3M54qceJ8DXVVBRcMnQvCRk_fcu7VQMgRV1I2LAv0LtgcImmPlsuh6ygGAe8k
Message-ID: <CAM8-Xq_80fp-Tv4R5aoyKtVhH8On=TMOxZY66goYtQDP9o1XDA@mail.gmail.com>
Subject: ALSA: hda/conexant: HUAWEI HKD-WXX (152d:1350) speakers driven by
 headphone amp
To: linux-sound@vger.kernel.org, tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"

Hello,

(Resending: my first message was rejected by the list because my mail
client added an HTML part.)

On my HUAWEI laptop (board HKD-WXX-PCB, BIOS 1.22 of 2023-08-30,
Conexant CX11880 under sof-hda-dsp, kernel 6.18.65-1-lts) the internal
speakers are only audible while "Headphone Playback Switch" is on.
"Speaker Playback Switch" has no audible effect.

This looks like the same wiring reported for a MACHD-WXX9 in
alsa-ucm-conf issue #863, which was closed there as a kernel driver
problem. Mine is a second affected model.

IDs:
  codec vendor 14f1:1f86, subsystem 152d:1350
  card long name: HUAWEI-HKD_WXX-M1010-HKD_WXX_PCB

Autoconfig:
  line_outs=1 (0x17) type:speaker, speaker_outs=0, hp_outs=1 (0x16)
  pin 0x16: 0x03211040 (HP Out, Ext Left)
  pin 0x17: 0x91170110 (Speaker, Int Rear, NO_PRESENCE)
  pin 0x17 connection list: 0x10 0x11*  (0x11 selected)

Measurements while playing a tone (speaker-test -D plughw:0,0) with
Headphone switch off, Speaker switch on:
  Node 0x10 Amp-Out [0xac 0xac] (muted), Converter stream=1
  Node 0x11 Amp-Out [0x48 0x48] (unmuted), Converter stream=1
  -> no sound

After "amixer -c 0 sset Headphone unmute":
  Node 0x10 Amp-Out [0x2c 0x2c], Node 0x11 unchanged
  -> tone audible

With Speaker Playback Switch off and Headphone Playback Switch on, the
tone is still audible. So the audible path goes through the Node 0x10
amp, even though pin 0x17 reports Node 0x11 as its selected input.

Volume: Headphone Playback Volume (default 44/74, -30 dB) sets the
speaker loudness. Speaker Playback Volume only changes the audible
level in roughly the bottom 6% of its range and has no audible effect
above that.

Jack: with a headphone plugged in, the jack is detected, but the
internal speakers keep playing. "Auto-Mute Mode" is Disabled by
default; I have not yet tested enabling it. This matches the behavior
in #863 (speakers and headphones share one amplifier).

Userspace sees this as the speakers being silent after boot, because
the stock UCM Speaker profile does not enable the Headphone switch.
I believe the codec controls should be fixed in the driver instead.

Would a quirk for subsystem 152d:1350 in patch_conexant.c be the right
approach? I'm happy to test patches or run further tests, and can
provide the full /proc/asound/card0/codec#0 and alsa-info output on
request.

Thanks,
Dahmane
