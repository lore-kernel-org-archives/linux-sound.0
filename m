Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793524563;
	b=bpxFhSJwLMU0HQBHQu8tKz+jDNvcADmh01k880jfPS4NPxbc58b6U0AHpdiTsaq8vU5O
	 RnilanrySTzlJNYj++q1Gy51R7VK+MMw7YGBwD9EccUCbghcRJ58DdVcWMbLdhybHftaY
	 OT1yGzgT8fyiYUWqQCeq2LvP8NkcT7vg9H1eIPvEsvcq3p9Sa2TJxn5vqmWnOuZhn2aXT
	 MvTEazr/ZLwcsI8SUDTUUVkb6trhED9uagtUEFaQph51AopKGlXWIc/ErC/+Lo1sStjjz
	 Fr9ASYPOmVHzaDP7qCkU2vuJ5Kj+bq165dln2XUsBBivTdJ0ujYSTA+3venH/A8Wc4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793524563;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:To:Cc:From:Subject:Organization:Message-ID:Date:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=8g2RT8ZOSnoGGAR+ArF59vBen9DTimqtAvKPyxShy9M=;
	b=JdiwXqES2JEgr9itY7zT2W1uJyUmrJcs9qZab8QvJ7dzYTXhljWvMIvBwSS9TUzwhN/d
	 N37PAgK8C9O+FCJ6QNBTK41Vh6OvM1Rdk+GMpiSO4XC5oeeJbuxvSifNlaplASK3DjKpp
	 mvJs1Zp6x0/LbOhQyesMc4r6iqNm9apeQcdsNwam7ecigkV8ZZNJTftdhr5NyQwMe1hO5
	 6+cx9hzn2NLdhzeMNbLO6G7atmE08F5+AKDzVTQgZTMrfsp/YzWNOBm6JpkuFZ+WTjfSM
	 iOj5Dyn+qYz3M8j7FgT/ic4Prw3Ti//8Yu/VjArd7Ep0AUQeBFkO45Wth/g0lxjJgDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xenosoft.de;
	spf=none smtp.mailfrom=xenosoft.de;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=sgkkj1uq;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=auce2M9l;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.169
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBB7606A324
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 09:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBBB7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=sgkkj1uq;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=auce2M9l
ARC-Seal: i=1; a=rsa-sha256; t=1793524547; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=oboHnIFHx2tvpTFzzKDHEVxesOd9NhN6nWBlYcuh7nEiqshui4OcKC/fsh73xitV7B
    kkuxUp6hqg2zzHepp+NRyonqE1r3YHaHWYLP1WDkOYFbcFMWoIzYGl1F3Tbhkyb5avpo
    re5rCW32MrxLoDY0850r04X1FOhqhw1RtjnVvuTJmp4SWzngVxraU205HFE/JbJcCoh/
    cvvy5qBhuDKHz2irbcnNSYek2OQHHrKyXK5H0BDKep59yJZ0/KNOY1KOlsZX2YJRf1nV
    3XqBuAa3m86+0C4Uyb7Nrb5wXKaeaixS+5I3S0E9CNpQqSTAYqI76W9fUVV/FHQI/Mvp
    0iVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1793524547;
    s=strato-dkim-0002; d=strato.com;
    h=Date:Message-ID:Subject:From:Cc:To:Cc:Date:From:Subject:Sender;
    bh=8g2RT8ZOSnoGGAR+ArF59vBen9DTimqtAvKPyxShy9M=;
    b=jjxzRQ5pLHqSO+Q3B0hAb444XnTQceEkWqfPntc6n1mmym0HkD4x216taNEYtURQ+q
    9B1FLF/6CVVh5G21oG+Cot1pL4IsbP+OyA8bwBtrchDg5k5JSPtU0Ad7izfcnpwpA6pk
    GIhyNJ8FkD5xt0j9PzeefGRAsvWdtQAQ9+9pcIS6JaAr5Kd0qnT3DmjgGz2+ww3uvpr9
    n6IySoHIFn1mHAbOb7TeONQKTh8ngc7sHG76oNm90kwtXNb6hx2Q57M8w6J4dKerBogz
    8UrF47oMR4NMqkukkRs9Np2xANCGl+x/ZDRRykUVQIUlDOFT/Rt0p174kstKHHvNyfBU
    cTuA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793524547;
    s=strato-dkim-0002; d=xenosoft.de;
    h=Date:Message-ID:Subject:From:Cc:To:Cc:Date:From:Subject:Sender;
    bh=8g2RT8ZOSnoGGAR+ArF59vBen9DTimqtAvKPyxShy9M=;
    b=sgkkj1uqxuJiszBPuzH+GvKLnXgEc6TKyM6M+zjRSotE8JfG9WOYO3wo88MG6cgst4
    VxmvL8OCWYBr7ls4AwhElZibQ51yDmPOw0eoxDYaWcT662/nEGASthJ+NwKG6KI0n2mg
    jYactX9LaqzwQUSph/CMleKx64nn9NiicWY8BR/DzN6rsCAdf4XbfYYXk+O3B313W7VH
    +o2amtR8inPEEaM4WeJz3r/49sJ69+v/WHDiSRRMDwUdRl7myqzyHoR4g6KqqgZbRrjV
    sCdicwG3c7T5M9DZIQlw0aan7vtXRPri+vHvpWt6Q0DJSfpEGIJuN7r/k+VNKJgAL+dQ
    inHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793524547;
    s=strato-dkim-0003; d=xenosoft.de;
    h=Date:Message-ID:Subject:From:Cc:To:Cc:Date:From:Subject:Sender;
    bh=8g2RT8ZOSnoGGAR+ArF59vBen9DTimqtAvKPyxShy9M=;
    b=auce2M9l/v+iXqGMmvYu1N0kHsUqZZL27upCyE0m9nB2o3Z6gkdA2dImIDmQm5JY1S
    /Lkj9Lmo5zdFQazf1UAw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIi+m7xzg"
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 55.6.3 DYNA|AUTH)
    with ESMTPSA id e825d92A19Fl53U
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 1 Nov 2026 10:15:47 +0100 (CET)
To: zzzccc427@gmail.com
Cc: tiwai@suse.de, perex@perex.cz, linux-sound@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson"
 <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Damien Stewart <hypexed@yahoo.com.au>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Void PPC: PulseAudio issue with sound updates 7.4-rc1
Organization: A-EON Open Source
Message-ID: <41a2e39a-5637-8afa-f84f-f79e63b3b56e@xenosoft.de>
Date: Sun, 1 Nov 2026 10:15:47 +0100
X-Mailer: BrassMonkey/35.0.2
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Although PulseAudio recognises the sound cards, it is unable to 
successfully initialise the corresponding output profiles on Void PPC 
since the sound updates 7.4-rc1 [1]. The output via ALSA works.

Tested with the onboard HDA ATI SB sound device, Soundblaster LIVE 
Player 1024 PCI card, AMD HDMI audio and with USB audio. Strangely 
enough Pulseaudio can enable the sound devices on MintPPC32. I think the 
latest sound updates are responsible for the issue on Void PPC.

I bisected last week [2] and ad28d2f607d1792c04531f2c5fd9ac0bf5bdcc9c 
(ALSA: pcm: Serialize and check HW_REFINE ioctls) is the first bad commit.

I was able to revert the first bad commit and this solved the issue. [2]

Then I created a patch for reverting the bad commit. [3]

Could you please check the sound updates 7.4-rc1? [1]

Thanks,
Christian

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=75c1cb8178fe84403fd95236ddf21754f0a4156c
[2] https://github.com/chzigotzky/kernels/issues/21
[3] 
https://github.com/chzigotzky/kernels/commit/644ec7c1f2f812d5eb89741e643f742596a49b2d
[4] Screenshots:
      - With the sound updates: 
https://i.ibb.co/675Yjxvd/Kernel-7-4-0-with-sound-updates.png
      - With the patched kernel: 
https://i.ibb.co/9HDrnnm1/Kernel-7-4-0-alpha8-Power-PC-1.png and 
https://i.ibb.co/vx77FdHV/Kernel-7-4-0-alpha8-Power-PC-2.png

-- 
Sent with BrassMonkey 35.0.2 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_35.0.2)

