Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793998264;
	b=Cav3U0sff373SchKmLOLqb+1/H/PI0hF7p7CFiQARdMykt8pYB4MTpTyn9s79QaZQKvP
	 /mFuMi/wiWEbHayaDHg+219eL+zT4zEJErJopq2K2bliRrcU1Qk9Oq54uQjR6FYCvVmO6
	 SkrqgS3I95LhQoMwK8pEqjcn/+q1/TLgGCPp4AyzF9Tl7/FQdaPmv0TjwvIMdO1sbaB5w
	 QJXCQvAZ98tfiVLiRC5rQloYeeMYkmwqgRc9hLwN97AdKXvuuTTdso8E2mVxe76puHVjl
	 eFIImTM2aCVy1VImzMu3shHrtsrxw3asiDLCDtNssaHY/q7v6sRwwdFAFzUIPclOFBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793998264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=cLzvJMVvplTAItMLAARGpBIr6UmHk5O/wuxWTnhHIsk=;
	b=d2QVGTL7jn71zUfRm1EyZfbfEAz/C/C0LlCpc6ZVjty2Ew9lPZT6VnaAY+odWh3GRwPF
	 nAFHSGyoNEQF4spaGzpKrhN7IuMpe6z+LgJ67RuHwYaBH/PouPMXWZAQW+Q92/AnsXBCI
	 KAzkjIOHx3VJZQXlNq9Ez1ZXbU4wvWZrIob+57w56auUyuuCk6WnG68Eb73/BLBmBt9Kk
	 6+iLljbaVix5gWhyVqj/N+a1a2Wosem+4LRY89is8M+tkpWZG8Jj0zLlFjFcU2sQTs0LG
	 +KSud3/RULBRfaSHBcC6+0Ya6q5ELBmKEJH9IgRAkX6bTUUgae68e+UIEiuxTg2A2DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NUBD40ky;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D14606A32D
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 20:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32D14606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NUBD40ky
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so1528346c88.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 12:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793998263; x=1794603063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLzvJMVvplTAItMLAARGpBIr6UmHk5O/wuxWTnhHIsk=;
        b=NUBD40kyjtGjEy4a+yKQZ1M2hpN9/b2ZoS/It3RnkhS+524C0pYe+oy3I6tovE7bGs
         GU9jF043Zt4whv7L1NfAQ5p04kxL/tP5RAnM49D5PNHA/YMjSrdkPd45DxQZ+51goPjh
         VkUSbfHIohFl8db2DgBiEAERFX4d6JNSf33vcsNlmKpCNfPq7WWQjunnIb2xy2HS9D4y
         FcwmlTqj+A7eYDGbnkv4WaEnZQFt/k3RHFzSVetQAdOyRCJuMzlQFKjtjPghJ0VKxijm
         nzrBmloKmAQxvlroDdRQdQs4+GyOhlbTaH9yWSKPyF3vVOBDNepEfHnTCrxONMjBRZm/
         g9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793998263; x=1794603063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLzvJMVvplTAItMLAARGpBIr6UmHk5O/wuxWTnhHIsk=;
        b=srSfg3Btta5WdVvwqPw9YqBZbLJdjPzq/cM9DMPTuSwF5hKF0bqjMdPUP79Q7WMfMn
         dm/RkjzbzxPGHmvmD9v0Eq49ErU0+SlJwdzaodQkWl5brhrtgM/c/reguBf9mb3dmgGA
         imoUZOGYTDZIlVaHqc88xwOIjhJvs6ERJaDF616YKSorLqcQV58iw2QAKz1jSW5XGuPG
         MVHspQfmmWcortWcUaWeUHQJ4RDFwVmGmcmLxjGEoJKRocA4kXbW6+pFcvaVsQJZSEz6
         9vuRanB2Oy9Jg2sKug1k29CvG43os3kXQuR9W3OAJZdM/Lo6UJ0rxpde0sEBE8WB6KvU
         VstA==
X-Gm-Message-State: APuU4Z+38OVhGlIKT9nvgcUUMQIHDHu9FBJSIGh2bhcewKN4eic1ykHa
	lfAjeSz2d5Jzb1cFOri0ay5Lk/o4tc0ebmHu7dJvHw9uT1f1ZQvxqHes
X-Gm-Gg: AYBFou3kzaxlsO/oH7MZo6f7b18A3SFLL96tUEtQUmg/zR9lz6s+frwacQfEzuPv55Q
	uCL82l5ps3Ty+dS8FLCTQJ/QFpjC3avlObsb6lubY7teWg7gnOui9JijMf5yJSdbrXnnJ6fg4r5
	Yg4MFREqo6/CHsf3jLerYxZf5enOXqZZp2b0C9M2EqfEU3lw5HON05hfPeLe5FEk34EkebbmA/R
	WYtatMsVGQe/lkCJjLW5dAZArJQgk/Nw1HUoSOPrKjSvBE8evYui7mjHGkHcgkg7OE6iByWq0iC
	UiVN4rG0pP+7M6F/9DwfDuKQxN3AYjY/laGV89OhJp0620RsH+MwW39v8Bhoe0wWq8lZ1h305sF
	JRmhq3B50KRBBPotjhpzRjEq/bqghx1MCuBPJPkUyU8XBTOewj+bEzc3IESTC7bt/abHk9s3lNm
	yxJe1h72TYEvjs0cSSykMT9YpTEHbFCEHSbGkLbgmEUIezzuEO+c3o6IsmGRMNEFk3VVEPBzEQB
	hr0b7WgB3yidEG8OmGHLuTyWivL/rMKPnrq0hEf32Ss+sOA028nduMzSEaDwTT7Z5MyslILZzoR
	AnoxbiKqvr9YD1jrblp++PsuXnkGw00f3NdNuqWmDjY8ETmSrSbO+8DAB1Bb7xZB+IFjYVugmeT
	4P1dqLKh/
X-Received: by 2002:a05:701b:465a:b0:192:fd91:c567 with SMTP id a92af1059eb24-1b25d315b9amr4036297c88.11.1793998262901;
        Fri, 06 Nov 2026 12:51:02 -0800 (PST)
Received: from LAPTOP-DPAKMOI4.it.purdue.edu (pal-210-106-74.itap.purdue.edu. [128.210.106.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4d36efsm8445952c88.17.2026.11.06.12.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:51:02 -0800 (PST)
From: Yifei Gao <gyf161023@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yifei Gao <gyf161023@gmail.com>
Subject: [PATCH 0/2] ALSA: hdsp, hdspm: Fix unlocked control_register updates in MIDI paths
Date: Fri,  6 Nov 2026 20:50:45 +0000
Message-ID: <20261106205050.8048-1-gyf161023@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hdsp and hdspm keep a software copy of the card's control register and
update it read-modify-write under the card lock, except in some MIDI
input paths, where concurrent updates can be lost.

In 2011, commit c0da00145f9a ("ALSA: hdspm - Fix locking in
snd_hdspm_midi_input_read") fixed the MIDI work side in hdspm. The
interrupt handler side was left unlocked, and hdsp has both problems.
Patch 1 fixes hdsp. Patch 2 fixes the remaining interrupt handler side
in hdspm.

Both issues were found by static analysis. The patches are
compile-tested only (W=1). I have no access to this hardware, so tests
on a real card would be very welcome.

Yifei Gao (2):
  ALSA: hdsp: Serialize control_register updates in MIDI input paths
  ALSA: hdspm: Take hdspm->lock when masking MIDI interrupts in IRQ
    handler

 sound/pci/rme9652/hdsp.c  | 16 ++++++++++++----
 sound/pci/rme9652/hdspm.c |  8 +++++---
 2 files changed, 17 insertions(+), 7 deletions(-)

-- 
2.34.1

