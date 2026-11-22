Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795360834;
	b=OUyFKTQZr8d6duj26dWkZ9LkK5HTykq1rlh1tp37BriHluIubSJ4LTrg4ZBS291md6NW
	 A5k3G//OR6nDE92qQMc9h7F6M57mSg8j5aC49FcZ/lw/FoB5uQgSNbIu54lOuPkQzoARJ
	 NMwTJC3vIl3Yl/9rdCRp02fj1rebkcXi355EXDUqba7dY8lPEw3OgJeBFMDLuYg74NJZn
	 wS7aFFcvHl7cb9MMi3b/0BokgDH43p3W43QLPXTZrwsyON6iC/ZlNy4UR+okbvZmvUm0U
	 1EjJ0jwYNRwTmmCsFtBq/n6qy/bCPpfuJ9kLkeoJjzWDjZUhEzjxeK4DuRLVu3FmB4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795360834;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=Faw1z5OuqgmjifxQaRWGrUSs6Tj+QqcvQdsZJqga8Hg=;
	b=uT+KWVRcXfzm346qply/nU4kYzibCOt/SxwdXgFL8zAW7R+/VyRtvc0tqAnmHId7gyM2
	 kChZ+Gm5tq+GVRpBl4ZGUxqUI7xJxbQmSEgxLcWdI+4mjOJxfJoOltBZjLKePni9yHane
	 g7BM4tMT4RkDszallrJ32r6KdUzYPm6wp1KALgFxyrI8eYpuMNQ/H/iaUZj+9IBK8rR1U
	 Vkt9O1opp5/kU4P/arn4+QJrAYmu10H3f+NBJcegd4oYMcBE8y3XTiWRcT/8tdwhfSLxI
	 ZRLtIwUbSz8enHVHC04COfNg+/uLWCscfIQJymDoPjrG+jQuzmSp/JtTgOSXGSRn98w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ua4GthKS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D9E606A320
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 15:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3D9E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ua4GthKS
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5ee1e4e3abcso908401e0c.1
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 07:20:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795360833; cv=none;
        d=google.com; s=arc-20260327;
        b=SCXdkyYQGltaUYY+FDrfJgyq/5bCp26RR/I+DWnTjg5K4Vuox8DiU3rqwjHrpqaiIG
         fy7ENyt9+Z3fkdzIUnMushcT0JSabbFKrJ1AU8VJSWljfmCCXEk/rdEHX25kr2BlpghX
         8DNVgMjRwNleVENEAvi85RwKg941Y1swmlBlCKc0464+x5AGU+eraob1aBlPZ/uosWSy
         vLMTVPii+hUAuf0jKaCSd/Q2i1aCbVBPP2En1/A7buBEZrNlV2CqrT6Vit15EzbNq2Y0
         HZvrrpi4ohmFcTBIuCumXX9yZksrLcyxTmtTiKow+RGN4GxGxC2v0dJoyjwaCg7JENRI
         I+uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Faw1z5OuqgmjifxQaRWGrUSs6Tj+QqcvQdsZJqga8Hg=;
        fh=rKUy8rb93LKKZ0pa7pjPW+7ipFqiQv4UcQ8XKV1KKQU=;
        b=VtNSwM1qwOgr87EZPvhbSAqF5JdQFd2LFo0+8GS9FslsAYaScfwCnUqAhA4nwIXspL
         8+22KF09GjEetW4HQyGmXgSWMwUugdLXlNQUdkF0H7HdkPDmDu4OOqLP401caYwYeTEa
         DOeEl/WA0GcCOVPG9M7555DwK4qCjuiBPTxmy58MFsOzNryUdzl5HzOzm6r8vKK8Lo/b
         yiOyMKgpdxmGrpLrLh+rmdar7h7Qfhv7MdPqISJ/Lzza2sla3vTtPW/v1ymK/3VOCOpq
         Swmh7mCZqRxRTU8h97K5u99PZ9vrkc1Q/ZjUMhaz4o4G5Arup9sQO6GJAVjZs9z1h/2I
         GI9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795360833; x=1795965633; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Faw1z5OuqgmjifxQaRWGrUSs6Tj+QqcvQdsZJqga8Hg=;
        b=ua4GthKSddTZws2P9MHLQ3M7nQSl3NbjrKurzmAu1XgiFbjPleZ2BEbx3CUTA3x/gg
         Fi8tr5QICwGdTa0DcWkphVVIMAXmdiiyLwIOu9P4iGKPGOtctnz5ROJBPc/mYpwq/+ps
         QL2DZaqUUyt1+eSuMO6dbNB1GlyT3JIFJ+hY0iJUtrR9ANOlfJVfu0DtCB3cCZoMaJbm
         amSSuVm8N3/BQ4uKGuibu9zZOy7/dO8mvE8YDZ2hZTZeCGE/oO08+0wHuC/fDQlv95W2
         Ps/NWzg+iM/LMxWJlrOEPFMKYYmRvkgetWsu+r83hdpm5OloUf3CLxopGO1j3GV/KIO+
         LDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795360833; x=1795965633;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Faw1z5OuqgmjifxQaRWGrUSs6Tj+QqcvQdsZJqga8Hg=;
        b=KdUGGVY32dtIEOfrz3fHb+bR7MccH8Fc8DmMDEjwb+UgqC76jd91lUFM3qLZVWSijH
         IoePm8gvaCflElNO6QMb0hFHn+b54hSxNkFU0SeF2FNYF59Lja4GDkG7npi6v/DoJxDc
         2eWdiq/EHh5JOK2qlsYSeg8PS4DXpijSaneMCAT/3SdPju0BVfpc+rVW02lllVqoPW2z
         gMUq1FQZVyrMg3erltMkLN5MQfIoEFADnCKhRDWHlhadrhRdmj/013uwlnVcw1Vpq4zg
         9Joiau0Jx3sYUE4qtWLns1HaOidB6/97W2EKI2QlxBrldGO/q4cfxZ97bEsPdAP0rAqt
         fiOA==
X-Gm-Message-State: APuU4Z+9owAZe3PXiVBkLCR3CxZIFMQ6MshrV0aQGEqkiOvDHK1CF7Wg
	Ybxayp1lD1mssComRulqT40cZhhLFsagAJ6uEzH/G+Rto3ZmNBU2tobEciiFquHXvT2KPxDwVOg
	mtr5smtB/W/oIgmFTB0OF8ZH0nBoUEnSYOCtO
X-Gm-Gg: AZFdTZdvBHEYY384GN0m9eupVLPAowS17MTDhXMPy1LAvNA3Tj5ZZ172oxajWNuVOIO
	ZTUftt/xE3j5for9AXdXFrtkrfMTT20yc5VgedRBzSMVVTtHvfnYsCF0Q6Oe3Bq8yAP3shfjDm4
	3JSeKeusMwmwS19KZ7BBvvKuZ7ft3goiVRYwGx8R5Q1i/mvL7G9uhBgSIGGCGnKXGvLldfx1A/x
	v/Nl19xGJtmmiFVcozhxLvBsn+gpCGGEjXBiO9/1FbpYaUUQZlvf/EpJRxGoph5aUTimzO5noeG
	4X4LLmLvQ6+WoKOnHRQMtvOvZ0qWtTWpOe1+d6fQNwi+2m/GUBqpqFXINWMk4xxNX8AaDU3qFNR
	2Vgn8Sz7lholVe47mBmEh8BZKFSad0ypymtKn66BZEYrLbXJKezLulpHllQ/rg/HGPPFY1gCIvE
	DgDEyfnxj5QuqE1Qi3cmQxUgcDwiMk0nFZQoQkLE/EbSKZmqHS6Mx7x0hYKHj1yejuiGJkChCFd
	tV7bpV0mq+2kijSfTR8Xaj3pB/ARQZZZEhIIwvpBbc7Aw2FQvLQKi+huUdilNQuyId69Xyh1eUs
	teUkF+igHKSAi8tYCti1pr1cPtAFeB8=
X-Received: by 2002:a05:6122:1307:b0:5ea:94cd:c5d7 with SMTP id
 71dfb90a1353d-5ee8af38b50mr4221540e0c.16.1795360832824; Sun, 22 Nov 2026
 07:20:32 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Edward Bentall <bentallea@gmail.com>
Date: Mon, 23 Nov 2026 00:20:22 +0900
X-Gm-Features: Aa3M54o7RKMJL3fzpEL1IaMOczmIBR9ElvH0QCK-sKspkkVX2DtZ-camTfHlhgc
Message-ID: <CACw1+JKrBchGqHH8i27FYnLS9L87dUfp0UTYZyvqTG0cuQ2dNw@mail.gmail.com>
Subject: [REGRESSION] Lenovo Legion Pro 7 16IRX9H: codec SSID 17aa:38cb also
 affected by speaker regression
To: tiwai@suse.de
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Takashi,

Sorry for the double tap. My first email accidentally was in HTML and
not in plain text.

I'm reporting another codec subsystem ID affected by the speaker
regression discussed here:

https://lore.kernel.org/CAFjFWEjt+DPJ_gM1uTBZ_NoV6-3mi57ArjZ_Qdah2DqY-GCD1w@mail.gmail.com

My laptop is a Lenovo Legion Pro 7 16IRX9H, product 83DE.

Hardware:
- Codec: Realtek ALC287
- Codec subsystem ID: 0x17aa38cb
- PCI subsystem ID shown in the kernel fixup log: 17aa:3842

Kernels:
- Works: 6.18.60-3-cachyos-lts
- Internal speakers silent: 7.3.5-2-cachyos

On the affected kernel, the log showed:
ALC287: picked fixup for PCI SSID 17aa:3842

Setting the following module option appears to restore the speakers:
options snd_hda_intel model=17aa:38cb

The patch shown in the existing thread covers codec SSID 17aa:38cd.
Could you check whether codec SSID 17aa:38cb also needs to be covered?

I have tested the model option workaround, not the proposed kernel
patch itself.

Thanks!

-- 
~Edward Bentall
