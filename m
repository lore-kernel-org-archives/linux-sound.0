Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795350809;
	b=Xn+rOUWqwnpHR4QwlXeJqLvic+abJEY8c5xoVri2lbZ+zVg3XMXF5mPN9EnC2f2xSJuj
	 Y4UGBPLnhnkw7bh5XgjTBH4sGVEJqo0tKvgeDTsraZG+jClR0GVRkqKtZLMFL8xizQ1jA
	 2oYAqPSM8mrLOmksCjoa7M76r6JBrcSLSUtJlLP+K5JAT16UXMcTklTTF2ZJD/QAAMw0n
	 1CtCVV+vgDt/JLHGL3NKC1KIdwTPy1t+MLpCwoHRpnxsSLJBmFiCCyBPUACaWYQsM7rLI
	 eMS0EAPISUUrGUCg5AJ5bQljWSRroxg6NIk/S3bqwXWMi0n4cTVovn1GxT/PX843ZwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795350809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=mQSjetySFxySrdFsQnf4hXL8mHfJwGrWJrGkJrf8wZI=;
	b=bpwYnKWOta32lPlP2XauiR4RSfSvZnFWfOgCT9Z4umgJtQx0czC9eGLnWB993ScRO24E
	 MAlW7KLSfKXtsoqKJE7Qc0uqCsyK0UxenFQaiogOkKqQeDwqPL1RrHSBKC3FetY0H3pe0
	 CNeiUU7f0y5zjMqEyRzWIHMcRaW8Pau71lNNzkEd57HEP0xqLRHG2YWUuGRTcTjw0OBnz
	 sSZwPzdqHE5D2GWS7v4eJJkKxsDtYGGlJ+327SO6TDyhWwRmdJFyZJEx3hhQmEu01XlBl
	 D/jry9S8aylQ2L+h4QLh+efVZ352u/hDc9zz5kgcuv9GPDV1hraNAHV8IiVoC5cMGIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cBARAejg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ABE606A320
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 12:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88ABE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cBARAejg
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f02b9c1f6fso15712555ad.0
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 04:33:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795350808; cv=none;
        d=google.com; s=arc-20260327;
        b=dK8nWtTgw7G60QwKpoNqTFmq3hcezRN64BX9A4Y1ijJNZ+Foep+tvYxdMgSz8VTa8B
         0278G14zgabECouAyF5eDC0z/hL8W5mDEMOy2gM9wTAGPW4BCinQmM9+SCrGY0ZB7qAL
         BJiseuz3uCSVylLKpF5u5c2h3VkAX7XVkc/q+o1VytBL4Z+tUe/3Ue24ankFeIxXRsrO
         rfN8n3wxd+c6s4Oalf4HoMtJ//GP/Mj3KsV8SeE/D/oHItPoQtOIfWU6jTEs0jXfj9Fd
         Sc3VuPDooJiueztcusap3uNa7SGbiVZC1OhmeIEL60k5accJgQYGI8e+szMCl5z77CpJ
         7Udw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=mQSjetySFxySrdFsQnf4hXL8mHfJwGrWJrGkJrf8wZI=;
        fh=kpr3ikDI9t/iP00V5GxYhsBExhJhFddqJGY75LSRDmw=;
        b=KdO/OXOnhGMVQi/75N5rg6XnqvSoUCi0Jg8Esbmmpk/50EoaVPOc3Is+s3Gs3MAeBK
         s/zu8ckxSLHILEotKwa7uE9b8IIqMAH2d6d8zzQLLi5iQd5QX2HWeE2TvLm1tZinrey9
         41GLA1J5YquAzCKiUFf8CoQqSyVpvQyGutSFKz2Fi1r+9SOgBfPsZrsCpXAdmbFbekNW
         q2P5pmMebptp5FMgxw5U8hdUxVBo46OZah/b+KXYRKNnqHbBV6sZzznlMBZbzmaivnsw
         A0PM3t2f0+mLedWpGRnMRp1MkRDPTt8yQ4CEH6cF67tDV5wkCzyFzSct5QNJAoOD/TWG
         jH3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795350808; x=1795955608; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mQSjetySFxySrdFsQnf4hXL8mHfJwGrWJrGkJrf8wZI=;
        b=cBARAejgxOx6xXiqpE187jdVmpGKDGkp6/USGkDqWQunao29yY9TgMddtpuTMLoMp6
         GBpXghwuDt+Q7ovz76cLHtLBp5ouo0K11LTqXeFuGLwKUWw3W4rYAVdtmpLC7+GCYWM1
         0wwU1y3BrXK9+TpvyzADRAxqvFgz8OJhNxw7Dzdu9xdqw+6S25rOAyENueI7lw9FOLic
         zjyfOOvLrmqVsAXoo2GMiXFZehUcRUzHT8QN96CmcsZMpelAm1gND0JAZeU62Nh4v4Hk
         LRACKXpQjCUvsRZKsozRKmoaohdS+7QNconMsP6yQI3sD5s2VX2za98JvHi089HuE/ek
         mXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795350808; x=1795955608;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQSjetySFxySrdFsQnf4hXL8mHfJwGrWJrGkJrf8wZI=;
        b=RMEnqg8numsWp+7/Nj0O+qdQAi2UenYy/lzFwLFshg0giUe0YqAWJKbzF6/T2klAIV
         uWNmf8cQbjcPnuW5MMNd9JLRS1i8ykaN8u8MH2QfEbB6vpr3HWX+gzb+MWS/cLtKDdDQ
         REeO6et2Welgv9ftYJZ+7HbzPcBGGhk5csSKtFH1cVslHlUpQnlo+sJAYWYghzqY3LXK
         9S/4uSxSbzJcVTU3tYIU40zYoF8SB7FtcaU4sHk4BFhLLb/D4/eiup7rmQ+qbSSBJ1YD
         +h3NGh2lVVXWmE1wPSoVsHhTZrxcEv098hyangKfy/xVnIxT8UKnGzkSza4y8f0lYGES
         oJBA==
X-Gm-Message-State: APuU4Z/o12GFTlzPe78avDc2wLYgi6GblCBm487fPa26M4pAekc6X54/
	tR0oGBZZyOdyfrbtL4KQdiKSvHYX+S00oS7qJBb8d6f2NiQ3jUuVxYRmeGVuxMlaFVgOvQV5u4t
	H/BRKkfW78lc5ljFzeb0hpEFCtZdjoJqlowvi35s=
X-Gm-Gg: AZFdTZcYihYy9z8Gvwmz23dqrTRZORKj+FPEhwjGSiUW5nAF0ex85HC6R9sHQcB2nfB
	iNE80gvQ+H6MCcdekxD5K4GQFtyIGwF/fFZVppxZweXqu5mMuYdo4kVzSui/MahVaHuuwuyJ0TJ
	SWV5hU9AqijUT/gIZ8LG7oFob5JChJ7HegUSb/0V53quw8crCv+i+yPK8bVuvm1Fm3xluqV4VPp
	jNLRf/Zn7oqcK1Ao7kN9sXXPMKZwmWHAxoiTE/Rwa0sNx68cVJKNw2K1X7pLCFPVF5AxzO/xxF1
	SFMH638rlghF7GLNCP0J92K5mBNHp3k/yAhQlKuULxRUkFmKYa5qguDFc9ShPzo4+r6DRJFgbkG
	sXUjWlDljq3zfdbxRXeu8Yoy+RqHKxKzFfu2HTz/3Qjw8u8aKSex3KeDgy7fm8NVSOZUM
X-Received: by 2002:a17:902:e5c5:b0:2e9:528c:b9ea with SMTP id
 d9443c01a7336-2f03f18ed69mr63272275ad.11.1795350807684; Sun, 22 Nov 2026
 04:33:27 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Youngjun Joo <yjsimonj@gmail.com>
Date: Sun, 22 Nov 2026 21:33:16 +0900
X-Gm-Features: Aa3M54q8NAm0wI3bJgIbzziySQP_L0r1wNzDxJx6EvBaoTyxU3Q2WBvTTN5Uvwk
Message-ID: <CA+sj2qJ4TtTpHC0HKuKwfTvJ0srHkC=YazSrOWJ7aRPpWB581Q@mail.gmail.com>
Subject: [BUG] ALSA: hda/realtek: ALC298 headphone jack silent on LG gram Pro
 16 (16Z90TP, SSID 1854:055a)
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

The 3.5mm headphone jack produces no sound on an LG gram Pro 16
(16Z90TP-KA5WK). Internal speakers work fine, and the headphone
jack works on Windows on the same machine. It also used to work
on this machine with an older Arch Linux kernel, but I don't know
the exact version.

Hardware:
- Laptop: LG gram Pro 16, 16Z90TP-KA5WK
- Codec: Realtek ALC298, Subsystem ID 0x1854055a
- Driver: SOF (sof-hda-dsp), Intel Meteor Lake HDMI codec
- Kernel: 7.3.4-arch1-2 (Arch Linux)

Symptoms:
- Plugging in headphones is detected ("Headphone Jack" = on) and
  the speakers get auto-muted, but nothing comes out of the
  headphones.
- Also silent when playing directly via ALSA with PipeWire stopped:
  speaker-test -c2 -t wav -D plughw:0,0

Codec state looks correct:
- Pin 0x21: Pin Default 0x03211020 (HP Out at Ext Left),
  Pin-ctls 0xc0 (OUT HP), connected to mixer 0x0c <- DAC 0x02
- DAC 0x02 amp-out 0x7f, Master/Headphone at 100% and unmuted

Things tried with hda-verb, none helped:
- 0x1a SET_PIN_WIDGET_CONTROL 0xc5
- 0x21 / 0x14 SET_EAPD_BTLENABLE 0x02
- 0x21 SET_CONNECT_SEL 0 / 1
- GPIO 0-3 set as output high (MASK/DIRECTION/DATA 0x0f)

alsa-info output:
https://paste.rs/empRo

I'm happy to test patches or provide more information.

I'm really sorry for writing this with ai becuase I'm not good at
English and linux. I did everything I can but I cannot find any ways
so I'm writing email. Sorry...

Thanks
