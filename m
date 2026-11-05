Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793891883;
	b=dt7JBHzOxGEj8n3flzofVwrZCrSKaqNj2gjp6ZoNDdRiY9R8DhAhDSEWRlGUehI52rLG
	 ict/b3xey6k7iQQa+4ye60dcEkbuEqhChUxtwwL9/mLWH+ZJGnamH3DB0IZrttDGUoSgW
	 RisfrdqEc2y5LfTMlIhfom200AbmOWjYa6H+4TgoxEXMvSoYUZPFoOodl0w9FBuseEfvV
	 RsmU+1/m0sFFzJK4kK5NtaHd5HNoET5DECSDVDBRBEO7fuwT1dRN0MvKnJfFBfU1yJotk
	 CjnxlT+f228rbU8h/cNZoyCeFJ1S7+AaShgLF3HxIJZq4y+lN6r2Ys9oeuj95MLU33w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=fDDI0ICOXRM+4q2hS4/B6DqJvK+vjUtavhksnftiP9s=;
	b=pJr3BDS2ZO+BRzZJDoYVwMt74s3mJye8aGydgRUJhMhEmN+VbvtLyiLgTup8K5syxnyk
	 dtdBxLNXAgfk3tmXCSbDEwTM47Cdow1RqH1Kx2mtvD+oj6jee9w2wyijUhvWrWhaZbyuR
	 CmXpeC8CZmw3bb0oFUAW/WWLOhjQbcp/ymG3/GksCMVOqV4X3gtQoPAnDYgcNHCejKuoL
	 4kzXtcTewAxmmD/YwPogHi7ju4at8aQZAcDnJK3Y0SBJ/k7ocXymNyG77yiZF5rJWy9tR
	 3iWBW5mZ+hpBT4vgnFQhlv13rTXJmbd1DFywOtKE3Vgz0V6wicqfl8j+htcSiL2oLhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IdriMpsH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D09D606A332
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 15:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D09D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IdriMpsH
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9851592ada1so552722241.0
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 07:18:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793891882; cv=none;
        d=google.com; s=arc-20260327;
        b=cLHCSVr5oB/6TtK3pbqEKzIw0KmISUv3EENsQapnw7YCB2Uq6nSBLNUypgVLbXx1hE
         BFZmyobG32pUrRlenpRN1UqhpcYmINO15FcanqCjR7IDZykKqh4tyiXz7VZ59girSyIA
         FRCbFzogDmt+DCENpAuu4pLkzidzC7IEpBvDecohz9udeooOCIGITopwJcvuOkR2QWSd
         S6+d9cYZMpbh8H/eKP7NSJFg91XU1IVzOEaRZfB/Eek1jAxwgZznYNeEp4JQZKbdvat+
         fWEP5mJJfrLu8aQvHH2ktEzzjeIQxrvIWQOtNnfM9icRsE44+En3WGSqRgWmKKgYcMio
         aD2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=fDDI0ICOXRM+4q2hS4/B6DqJvK+vjUtavhksnftiP9s=;
        fh=4NCoiD1ZtZ8/p9FTv2ZRkBveXnXkH9PDm/PKW4JDxLU=;
        b=s0HtbXRNAS8+U48+jd1txGKlAkCLlsBNmrBGnD8xHy0zaDw/S1c7lXABJy0Q0i3Nut
         XFFO3faaJp8nDPfuaVNkbbhTmqDJPnMehUuJKqsLJyeXRffRC55dH7xpgOeO+uwS7sRI
         U2Ry8VZzTf/wyhn4Laeyvozws0KPxoC/1qNtS5JAbSw1i6WE0bW7JBfUdj2DreW5RIWd
         GBdEasYFATQA60MNdvZrPlpVgbLK9Mr4m4ahXmPi7f2N4+RHRFAQB7q6UZW2NZTiY5BR
         NGyc6OBycR2kGCAXl+m1JSKML1V7xUEuJsVhQALUY8eMh85/d1vs04cAFsvWL1fWre0l
         RmOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793891882; x=1794496682; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fDDI0ICOXRM+4q2hS4/B6DqJvK+vjUtavhksnftiP9s=;
        b=IdriMpsHxuXT6e1n2hXKAy4BvSMkSHhAmGPKtbRCltvRmqcwxiqdA+uePXVKKQobfe
         AfsHcFGmzgW5pE6Ql28BPM9aplN8r1lD8mgQj+vQtTpoQfT9MHYrANwKKv8Sx+ZWsR/K
         9TvZJQ/uepWFViDBK2YoDmHmjlAM6MbCGz4EVhwkqXyVkoiNuJAj6ZqxiEn0araDTpNh
         vovzhOAp8CdmSBZy0lTjLhdemdP0xpAXhlS7wkm6V/390dNocngTDRIoJhe04vDMmJtR
         Zwi5jLIwSEYAOICwdEfdRU4I45NwahTpvuEeg+1MNxUP5VfyjHnnO4s948+aNS9H4XIg
         ajrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891882; x=1794496682;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fDDI0ICOXRM+4q2hS4/B6DqJvK+vjUtavhksnftiP9s=;
        b=m+5lgqJZyoCBNIYGpOpblSjPBh3bsUpNwP++Wh16WASuPatjRaJmmaHcA+QP1GjXOT
         kjHK4Rh8AKVg18AZ5fBjiDyF+vxuHN0Q9bPS2QrBOwFoBIUJlb1Ps+fQgdNcSI8hbTeI
         NuJP6eOge8/RazgcmSnYcNaRoCRFAWvAcRqI6L+ktO9UozMLVjsB2E2Kjv93gmgDCAOg
         2MXE2aypvECdceHK0KwhXZAqikZaaHCwOugIf1tYzkJ6RRGquaUOS9dkkvn530t0roNn
         bsWelWvZ0mMk4WA44LpvZ/aUJ4ov0LlgYVhIdomFsXscSKo/sJLEtvvTYoEN9hIcLhW3
         TKiw==
X-Forwarded-Encrypted: i=1; AKwUvBw54Q25RTYa14cKYhbWaW72lm0F9ve3NLHvPCo5WHxFNGmsauN8UY6ENDmw20z6KmatzGOqatpqCPycHg==@vger.kernel.org
X-Gm-Message-State: APuU4Z89EWEo/L8RxCqMt6bFFTlY8Ttw8h3YTODwOMYJAFxNbIS+wt5W
	9QHfCUOyHo5C3Vt+xM5Mg9BPLG9lMsOrrV6amlEqZ/u0a0NbzIjBpWaMJWOwniU67tHRHxgjaMI
	8pNOITBREUCJV2nMoOz4wpmBC8atklvA=
X-Gm-Gg: AYBFou3IrOBSlDJc6HNgGsyCnozatWq38vxRl9gr23VXe35rkUOKHQ0jj2aZOQDhe+H
	+9k9+Rmm0R8QFANo80S8LwMv+z9UvGXo7fbwJCFJa8x8PdmiQDqpqCdq8XAuSbWe8z54zi0qm6P
	9b17xM1O2v8823HKCfzlyWHKoNyuyGSzBYk9zLGJYN8/7Y2NAK8dyHLDzEg2orslGe+iMrWcVA4
	iZ/sgPYTgsGNPa5SfbAthaljqUhQ6oTnu96FABbTx2NsnLMCWDPHSaDp1Ey4TX0zBQz5amLqR77
	9bvcPM59i30algdOgcLter3SVC3y5Ghe4nRyptKQH9mHGqwa25YavNFUeh8LlCocPCboRQYNxEW
	8l3DyJV81ae+quQh1yG9amJfZIm+XJoieqxS9CXi9LqRgxecPNIfSsNmhMxvZP7IE/Vsrm+EwSC
	Al7zuhmjkynpjL
X-Received: by 2002:a05:6102:1483:b0:7cc:1ace:fd06 with SMTP id
 ada2fe7eead31-7d07264004cmr7537993137.20.1793891881909; Thu, 05 Nov 2026
 07:18:01 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Krzysztof Wasiucionek <kwasiek@gmail.com>
Date: Thu, 5 Nov 2026 16:17:50 +0100
X-Gm-Features: AclHuK90XU4JzRKVq0JJzfUhHT5tXzMsp5UI7nHy2Kz6KnblvwFIoazGN4kpTUc
Message-ID: <CAMODhBLTBPb5DG_kfjsF2Pj_8F+KFmG6N4vd=8MJM6n07nCC9A@mail.gmail.com>
Subject: [REGRESSION] rt721-sdca: PCM open fails with -ENODATA on 7.3 (AMD ACP
 SoundWire, ASUS ProArt PX13)
To: oder_chiou@realtek.com, Vijendar.Mukunda@amd.com
Cc: broonie@kernel.org, linux-sound@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

after updating from 7.2 to the 7.3 series, the rt721-sdca jack codec on
my laptop can no longer be opened at all. Speakers (TAS2783 on the same
link) keep working at the ALSA level, but userspace loses the UCM HiFi
profile because of the rt721 failure.

Hardware
--------
Machine : ASUS ProArt PX13 HN7306EAC (Ryzen AI Max, "Strix Halo")
Card : 1 [amdsoundwire]: amd-soundwire
ASUSTeKCOMPUTERINC.-ProArtPX13HN7306EAC-1.0-HN7306EAC
Link 1 : rt721-sdca (sdw:0:1:025d:0721:01)
2x TAS2783 (sdw:0:1:0102:0000:01:8 / :01:b)

Kernels (CachyOS builds)
------------------------
Good: 7.2.7 - UCM HiFi profile available, jack and speakers work,
no rt721 errors
Bad : 7.3.1 - see below (7.3.0 was installed in between, not tested
separately)

Symptoms on 7.3.1
-----------------
From boot, every open of the rt721 PCMs (hw:1,0 SimpleJack playback,
hw:1,1 SimpleJack capture) fails:

rt721-sdca sdw:0:1:025d:0721:01: ASoC error (-61): at
snd_soc_pcm_component_pm_runtime_get() on sdw:0:1:025d:0721:01
SDW1-PIN0-PLAYBACK-SimpleJack: ASoC error (-61): at __soc_pcm_open()
on SDW1-PIN0-PLAYBACK-SimpleJack

$ speaker-test -D hw:1,0 -c 2 -r 48000 -F S16_LE -t wav -l 1
Playback open error: -61,No data available

The peripheral is enumerated and attached:

/sys/bus/soundwire/devices/sdw:0:1:025d:0721:01/status Attached
/sys/bus/soundwire/devices/sdw:0:1:025d:0721:01/device_number 3
/sys/bus/soundwire/devices/sdw:0:1:025d:0721:01/power/runtime_status suspended

Writing "on" to power/control does not help; open still returns -61.

TAS2783 playback on hw:1,2 works on 7.3.1 (speaker-test plays both
channels).

Userspace impact: PipeWire 1.6.10 / ACP rejects the whole UCM HiFi verb
("Profile 'HiFi' mapping 'HiFi: Headphones: sink': output PCM open
failed"), leaving only the pro-audio profile, so the internal speakers
are not usable in a normal desktop setup. Same userspace on 7.2.7
gives a working HiFi profile.

I can test patches or provide full dmesg / additional debug output.

#regzbot introduced: v7.2..v7.3

Thanks,
Krzysztof Wasiucionek
