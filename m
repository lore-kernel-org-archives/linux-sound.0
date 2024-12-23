Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E625E746E
	for <linux-sound@vger.kernel.org>; Mon, 23 Dec 2024 01:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734916828; cv=none; b=EsZKc1C1VD5qbHpyho5+LB3uOubn7VPUzQMXZnHP3fNWWWiXF72Xa9yupi9ASwxdDfdjEPeH23UzBYrzQ9LdkCoAQzPjh8EtLVxQPZfZuL7+NbErpVm6g+wkarfS/qdEIAxeMZ1P/EQCKhRsBwHD01Pj1NGlL5B+YtQSNdlbqu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734916828; c=relaxed/simple;
	bh=Mpq8ba1xFB+qSupciSlaxlOFNRGxaKy+SXfPUb5xTYc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=fKvqiWRD1HDD9UybfGYWRstRk+DwEWoz0amAPWZi9X+YdDafDpjDkl2xrvMXu/PN0x6iWON82d5d2K7a5HRYpdIAQ0B8Vb2mD1lKJ0Mr+cZAupcAJ51Cqh/JJYQW274g/FB5878PTxvz7Tv0VOBMQZm1iOCyP2FCOT4LgjRsOmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RyJgsClZ; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyJgsClZ"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa67f31a858so652676066b.2
        for <linux-sound@vger.kernel.org>; Sun, 22 Dec 2024 17:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734916824; x=1735521624; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KvevOcVN/wlibGXSzUXrgqifw8XXqJFcRi/0mVVt0rQ=;
        b=RyJgsClZ0Ir3tvaVU5lht/R4HbK7stxdjmTTQAjdVSTLkMFcNCDAwpesRo4us1b3Qb
         MpDoxA6QmHeW2Wfy3VSD0VI8811LszM2ds6LNuFConWDU11ayRqxufiRi+c0bAbf3XRN
         T/GgpifVpuBOPGoX4voURhMwUgxORCRoeLgTIFmFsYdwRHePsh0O8zBcSbGPMaeux/5H
         qijDlQbtP/sOd0oHwQulF0Q76vwOj0agMR0mP56DADYqxrLH89NssTlJ7JVBfwdHx6H7
         Hz0Qu2o5hTOD/0ptgks0kHzhR0awfvHIvl1N+/wYtVl8tPDPDwbSufhSIEE4IsbC/b31
         jUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734916824; x=1735521624;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KvevOcVN/wlibGXSzUXrgqifw8XXqJFcRi/0mVVt0rQ=;
        b=phuqY7Xfv0GjnpxDylFKf7wJEFPlfJWPyyNLBa17NEcp5IcTuMlT9R1hp+S14AJfyI
         k1CH0X3S5Yc37sitoeFKhUOryLqBtG9ozJhiWwKZ6oWK2fYEQ+W67UEJo3NJTgLAq75w
         5IiSbnFA3tPO9WDPJjroNhn6hprcwymRHodpoD+RT9/xgyrIqHmIs6MeA/kMwW8xDkAJ
         RVxLG6GrEMbeuIBcsZfkKhk2y3PCOLoVRaDsJv43MgGEPI1x0eLiRH8Mqssc14PUdu3Q
         bxxALS5paHMzHTBBwXez3Wl+7bPNwW+1aeK/ug2UmoooMsP82hFeEP0QHEDoACl85UaW
         3UeA==
X-Forwarded-Encrypted: i=1; AJvYcCXNt9rH95vYaWNJggVbDO4Odeh62KT6g7fCWSk6CqQqaZ57s+nuTY7GMxD2JcBB6+zHU5c+HXKoa9qPFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQtU4EvpmVAnEQKppLlqpx7aor8qYD/YKwWFG0fUzk5ZABh+C0
	8Pt4W65LeaTO81V4Lnzq1ceTdBgfkfhSFFdWyA4dd9wUh7saBBoF+bFSo08BE1jjUA4qHnt8gtK
	0xYVxGzD69StZaAh+AX5xfiPH4R8=
X-Gm-Gg: ASbGncs6+5tvPsIdNpS2mb2A8oF7iObAfKrHXMZZRMHYHHVec40jtPAoe7pCs6tQ2cN
	JDgAeXRIcZuZBWJ6R7kxPMOYsQJnnm/H4yzzb
X-Google-Smtp-Source: AGHT+IHphxOceIWAYyvNQvRH7V7HjGerkWtBk5HFpO/milygqD3QaKnYKs2DLgEH07sZBFVOKKvkhCoNqfKElPUypUQ=
X-Received: by 2002:a17:907:7b9f:b0:aa6:800a:1295 with SMTP id
 a640c23a62f3a-aac27026cf3mr899026066b.5.1734916823997; Sun, 22 Dec 2024
 17:20:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Taco Jerkface <tacodog311@gmail.com>
Date: Sun, 22 Dec 2024 18:20:12 -0700
Message-ID: <CAEQPD4TFwLf9Dcj=Kg9vO8OY4Mf0yE0JNn0vbiF7MZxc9GJvEw@mail.gmail.com>
Subject: LG Gram laptop drivers
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
	Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I was given your email addresses by Armin Wolf whom I reached out to previously.

I have a new LG 16T90SP-K.AD89U1 LG 2-in-1, which has issues with the
Fn keys. Specifically the keyboard backlight, the microphone mute, and
the camera disable buttons do not seem to do anything.

Additionally the mute and volume up/down buttons only register on  the
downpress and not the uppress, so this workaround is required.

https://askubuntu.com/questions/1314193/fixing-broken-volume-up-down-and-mute-keys-on-lg-gram-14-2-in-1

Finally, there is also a bug with the audio, mentioned here
https://bugzilla.kernel.org/show_bug.cgi?id=212041#c14

This requires executing this verbs file on each reboot to mitigate.
https://gist.githubusercontent.com/eddy-geek/ef86267fbec87479aba905302909921a/raw/

Let me know if there is any way I can get some of these fixed.

Cheers
