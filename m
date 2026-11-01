Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.166
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793544806;
	b=HQphjmzuRHqgoJ97wHmt8qrX6CH22FgGHf7pZNTghKeQzHLrKE7zWH0nmjS6oq4VGpwq
	 KdOWa1BkowH6nHh7JHmXUCbxY3SfH9fZsfunLCqoR/VH3LJdWyjIhnKSyELEG1ONIrie1
	 6rKs/D+EJdeLnCMBIntMpotMsVXGAflXQVx/AsVerpThHZ+SOtrMVVYQnQqLAXkG5Nbw1
	 3c66nB2XQ0z5siMEZeS3ehWkXuXlUUPP22gUmd/BTg7Fxo9SBZPUrG8il+Pi4HbaprX+j
	 UCSuIq0q74F+GxcsT5RqsNpOVJF/zQYv/btBuWbguS2Fdzpk4rTLjnrN52EqHMnp72A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793544806;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Subject:From:To:Cc:References:Organization:Message-ID:Date:
	 X-Mailer:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=46gvrjJkkEAAte/F2HPQxRDwXOoV/JLiqnK4lMTYSB0=;
	b=v9z3hVWTPQcVwYYEqGAM9D+Nfj9Poz2W0ZBfTP6rumsZZ489+k/Raw9yp02Fply5mrj1
	 MLxRsVyXVORlRcqMT9poLkkpNZvFCFlCZ8411YF1R0SkzEpNDJwUu6fnoy0RLNBQBLGN0
	 A0096diibzxJRqkldiCTaBxy56e8D7ltnUxhTgVG57ZTZOffKVsaEpqJVlxX2esc5qgTF
	 yjlQ5Yp1OFZPZD5AcKoCw3BaM3wnxlvEdhYubCfKXntkSRzkBMjstAi7Q3EzPiA2JsBlN
	 RXfqNaaNjtXGvc5vqWRodCbrxBGALFchnLbd/g+sEl4RF4ej882iowV+QMqMkcF3q3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xenosoft.de;
	spf=none smtp.mailfrom=xenosoft.de;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=SF9Fam3H;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=vD19QXKD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.166
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0314606A324
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 14:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0314606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=SF9Fam3H;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=vD19QXKD
ARC-Seal: i=1; a=rsa-sha256; t=1793544789; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=YTpVAkV7DbJQw/HebBhuQbEAR/O9IkL2/ENsYPrP5Q+eyvqwJrNb0JmDV/SnsbUgLX
    7HFJhdb3bNzURqAy/aSiC3NuGIMQEKGGHdy2D4GC8diEEd0LRXCpRmZF7IVUh9kPAPwA
    LsA3eBGY0o0wRYjVT02kWCpcBnsPmKOPVB9UyPHf7S3QHDhmVk8vtskuZhYD+WykHwpe
    7+7jy+a6cacr08YgiPgfzPMiizgSrdLW4F+jee0dsNCAlVMLgQTQYPA+KW33m1jX00vz
    Dox6CDUWxoDS910N/vmAQrow402zM7MA9C5Xj12jd/Az69wB5j8aLvZZaNugBZTO4L11
    Cicw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1793544789;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=46gvrjJkkEAAte/F2HPQxRDwXOoV/JLiqnK4lMTYSB0=;
    b=gmY2dXfP5ZzKvU7IlhcsZY8oV8lpeOS+eFRmsifI76mOrIa6Bw0p+fTlqDJ1Pm3c09
    SjiY89/CoHptWzCo/sc5j1n19VFb+0dS9pfwXxPyMZwoAFzgUHzm69tVrjsTCg+SCyDZ
    b4Lzs6Z8D9NrB4krurS4qstD5KVFZ2qAwoe6+iMI7QHPs9ZWOyZrYuv3DKYX7yjRJyyk
    hpLqaVQLCUbGj9pOw90LbQP4mFgPTnV8a1qkJi2eAfRB+kQ99kHjfqYuvtCe+5DLst5o
    FS3vyhpCWtTX5wXlEGVMpubz/Cck5ia+HfLes0KMoD15p5C4DXG7s8wxBXIfutrXyCyF
    6DMw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793544789;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=46gvrjJkkEAAte/F2HPQxRDwXOoV/JLiqnK4lMTYSB0=;
    b=SF9Fam3Hhre7LR+2avBkrhBtNNVkSqnN+G7jcqJ32JXKho1pdPZ/Gpm7rjhHkCKwKe
    gjAsgSEA71rEcvFc/PRJT4CMBPvw5hzWncmN6yfa5R9qgg++f+tV5v06R/GTwsLp9Yk5
    /3W+5VcVPkg4bqaVov1AEPoLwEO0u+y5PfeDdA2kVfoIW73gQQqokbe3WzQnoaSdCtD6
    nRgu630S5fEGNAndFp9Zk8roz+yzoyNkZwh4fboQn+cOiVptZa5SDi6mHQJTtDhO/DUm
    ToK/AiG8dbbiz0C8KaLCPBuSnLnBEmQ65ECGxGFviaaPXUlnTuArsfUMNCyAdgnx70Da
    4GbQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793544789;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=46gvrjJkkEAAte/F2HPQxRDwXOoV/JLiqnK4lMTYSB0=;
    b=vD19QXKDvZ3lNNRxSTM+0aEzNT5pi8rEbbUPs2+QUA9tS6Jdgu3xM/5xFMgs+C5yxB
    qduFud0eAbqey5T2ulAg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIi+m7xzg"
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 55.6.3 DYNA|AUTH)
    with ESMTPSA id e825d92A1Er86Jd
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 1 Nov 2026 15:53:08 +0100 (CET)
Subject: Void PPC: PulseAudio issue with sound updates 7.4-rc1
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: zzzccc427@gmail.com
Cc: tiwai@suse.de, perex@perex.cz, linux-sound@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson"
 <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Damien Stewart <hypexed@yahoo.com.au>, Christian Zigotzky <info@xenosoft.de>
References: <41a2e39a-5637-8afa-f84f-f79e63b3b56e@xenosoft.de>
Organization: A-EON Open Source
Message-ID: <3452eb30-44be-cdd1-72e9-c15e145a6444@xenosoft.de>
Date: Sun, 1 Nov 2026 15:53:07 +0100
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
In-Reply-To: <41a2e39a-5637-8afa-f84f-f79e63b3b56e@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/11/26 10:15, Christian Zigotzky wrote:
> Hi,
>
> Although PulseAudio recognises the sound cards, it is unable to 
> successfully initialise the corresponding output profiles on Void PPC 
> since the sound updates 7.4-rc1 [1]. The output via ALSA works.
>
> Tested with the onboard HDA ATI SB sound device, Soundblaster LIVE 
> Player 1024 PCI card, AMD HDMI audio and with USB audio. Strangely 
> enough Pulseaudio can enable the sound devices on MintPPC32. I think 
> the latest sound updates are responsible for the issue on Void PPC.
>
> I bisected last week [2] and ad28d2f607d1792c04531f2c5fd9ac0bf5bdcc9c 
> (ALSA: pcm: Serialize and check HW_REFINE ioctls) is the first bad 
> commit.
>
> I was able to revert the first bad commit and this solved the issue. [2]
>
> Then I created a patch for reverting the bad commit. [3]
>
> Could you please check the sound updates 7.4-rc1? [1]
>
> Thanks,
> Christian
>
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=75c1cb8178fe84403fd95236ddf21754f0a4156c
> [2] https://github.com/chzigotzky/kernels/issues/21
> [3] 
> https://github.com/chzigotzky/kernels/commit/644ec7c1f2f812d5eb89741e643f742596a49b2d
> [4] Screenshots:
>      - With the sound updates: 
> https://i.ibb.co/675Yjxvd/Kernel-7-4-0-with-sound-updates.png
>      - With the patched kernel: 
> https://i.ibb.co/9HDrnnm1/Kernel-7-4-0-alpha8-Power-PC-1.png and 
> https://i.ibb.co/vx77FdHV/Kernel-7-4-0-alpha8-Power-PC-2.png
>

The sound-fixes-7.4-rc1 [1] don't solve the issue with PulseAudio on 
Void PPC. We still need the sound patch [2] for reverting the bad commit.

- Christian

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e9954f3fbddd25e1a01b7e5a0b72fb8b564204e0
[2] 
https://raw.githubusercontent.com/chzigotzky/kernels/refs/heads/main/patches/e5500/sound.patch

-- 
Sent with BrassMonkey 35.0.2 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_35.0.2)

