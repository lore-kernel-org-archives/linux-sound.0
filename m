Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA9A405C46
	for <linux-sound@vger.kernel.org>; Sun, 17 May 2026 00:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778977117; cv=pass; b=Wfgl1dbpvi1y7xti4ZnEIq1zjwvz2Q50XpAj1Anqvr1vMjHJWwuv9To1MH2qPAXhw5QI6jWHgjXFxCjUNdz+G2eH6Un5DUwx4bcM6pJGtWcsTY1B8FOqLSisRckoNq3F9k9+X/xkMe/m2FFsq6uhut4X2kqmYEp9JI3pf8MI8m8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778977117; c=relaxed/simple;
	bh=LlKaBj7SO8MV2Kb6ua1zCe7p+43tNvCE8OLKsyLueEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t280mqyhHbwYBqMGrHrjoXXuM6sitBuZoAlfLI61tODf0uahN3iFQkL7QrOYotAXdwlFxicJa511IaTTRF8Q+0P/qVubB4zDrwUjDl3SDEbIlloUeLzRBZm4H1HzdIQZytiBA/FYE/WQVUXXhBT7EfBTxj1Lx7OErUzy1+8/TOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtNoQebK; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtNoQebK"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b45cb89f7eso6762915ad.0
        for <linux-sound@vger.kernel.org>; Sat, 16 May 2026 17:18:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778977116; cv=none;
        d=google.com; s=arc-20240605;
        b=ghzDadXZ1ZuyHTu+RPrQRlnVqvczqELEcGhSQLPNTZD5wBNT47YHyu73BW6ydE3Xz/
         oI5PIl3w0mIGc1HsAKf6OutFhHnX/kpFjyi5/gNnmszHVoVJuhSYgieePPQhlcJHH8RB
         DO3WYBqyITBM3Za4nkq14uaiA7NGfc29yfhdkSCs7bvivkWoFfAeD8i8BA+LwVGYX1vl
         6gxlWxc6MKtrLNVi0PrhIbM4WvzMLA73Q7RikS8e5oIY0GJPablfSmRPbGmt7N53nPVQ
         OoGxjbLNnvUHKNsHWlx2VkCTIyz8aNGySVDHY8Zan/vUACWgjp2jiQZAv3e/9Y1EDRUD
         PywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mwlQ5BpuuzTZAL1LxPwbMkdpasTg6SIqMpf1zg1uo5Q=;
        fh=wT97OTxrsL6HksTv/ScKDpvOdWSKVIkxaOzHL7grn0E=;
        b=SH+9hWXeKyeUpm5foYxi4m856HMBM9ZWpx1wVd/wTna988JEL2A+4bhrLeqM7TUQjX
         kU+W47WnJ8MIhOGvE6N5AOZRAaJHjEmBUTTQrashqzSH/YfoijjlCAWs1ceJZ/lzh8Y3
         yxKR6EvSJ6WCIcdFmabY2ahCxBmnN8dJ1qPhxHiq1e2HKCNkFg8RXz9v3Rbbmwuxx9iu
         pIFotJJ9CWSXMi13RPEVfUOABwOJdWaVpruWOKw6VoHthW4ULRRfeRrVVtciQtLAY4/O
         WO8rnfHlV4kiYmJfQQ7iaAnRv/pnodGpPDONQmGJTBbMq+Al0gZCocpJHCScuDdaBfB6
         3T+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778977116; x=1779581916; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mwlQ5BpuuzTZAL1LxPwbMkdpasTg6SIqMpf1zg1uo5Q=;
        b=EtNoQebKyCKh3o5/k/pkWCsPSpRDL6Qpny1m8T8LbyR+LutgpsthNMPmy09SbxaLyx
         jozm1UCJvq6z6v/xyGJD/5+zPJJ4Rk/G3gCJeuJuUOcB/8FVgj6TyKuV6q2fEHf9xZMW
         6vXlWov3itefYAdaToBltlP/zyfXviS0fquNMt/U1hno1XplkI1m81hgRMYZ9I9Fqc3s
         XpqIhT3tyQQJyKU30u4Noa+cs81uuYlE4PWolqXzvVCyWSseLOmz4HF3+rkQoUIhJk0T
         idLkSxqSkmAGEvN/YzdLcXtFYu9o6xXkB3K0Yml6cAJ5jVOeMFOx/ktrXNH+09En6Uod
         ZeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778977116; x=1779581916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwlQ5BpuuzTZAL1LxPwbMkdpasTg6SIqMpf1zg1uo5Q=;
        b=O9E4vfPZa7DHY8uZnVntDk+Nb7+cjA4wLlwmyAVCW7I0M0tjKLXPB0j0tKHSSgw9U0
         wl0xZsVr7UZAywRAyOzy6MtF/SkU3gzQBpZXFfx3QoQ6aY97reazC0vDvdcvFpBCoLTU
         6jwIHzMqg4Of2us56D5wi715hCbK76G61I4TslLxo28iYMo9/rQdsFZqUMye7Lgpgide
         2B+RosjMC3899rXf3V3N5dkTBBbNecIA113IjzJXIcdZ3Y30TaP8YJ+2XJR/6/buDVdx
         W0zT+394de5WGDor+j2ZslE8WLN8dNtsxX0vYlALTWjUfpDBsebLg3TNfNKpTF1htDFc
         oOOQ==
X-Forwarded-Encrypted: i=1; AFNElJ8CmIGPKfH0IIWZjk5bC2+YZbC5IkILKM+Mb0Lm1e1rFGN3Q1A1NQgCoVnq0v9j7g68y6WE/H1+Yh45Tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxgXP+xdUH9uRGMpC6olyVXD3/kvTJLsd9wTpqBVQ+DHxwjIE7
	OOnJkrVaDFKgaz+vgJny06tc7gqfJrTC2jSw2Z8nvdvlI45/RYY+LapKS7Y6gW+imd+DxqiYc9d
	hZzDt3EJyolVAeAiYxXWcWbNkq35dykY=
X-Gm-Gg: Acq92OHDDHSNbLVq3DvF1x9pC3ZWycu9pU6NFHwlkc9njALBGV8UZOxLJksvR7qLwTo
	a1gB5DfhNcFXluQcjVB1KVcvaedHXUCSD7L+mLGa+s/EjJbxXdSQTEwQt/x1XSjTEErRjPrSW+R
	3oQibO3ZOWR4BsWHI6l/FCaqynyTtgZ+FTSkTWe0qYBtGY0BnC9hsL4yFwzXRrJHQZcwtI67Nj1
	Y2eD1rK9NkejC8enwCnyS7CFa63sNtAUHWcQyXlcRf/hBCJ2IpWCoXTSl9SgLwNsInu5gn1weR+
	KZsexpRW3Q85Cu7ZPi/e9cbDDGNFqdOO80+p1yToDJaL16Z1aqw=
X-Received: by 2002:a17:903:3c30:b0:2bd:7ff4:ab0b with SMTP id
 d9443c01a7336-2bd7ff4b216mr106672755ad.39.1778977115676; Sat, 16 May 2026
 17:18:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513104329.81592-1-phucduc.bui@gmail.com> <20260513104329.81592-3-phucduc.bui@gmail.com>
 <agUknFcDIfwrOCld@sirena.co.uk> <CAABR9nHfXi5G4+sVnLbWWJctQHkWASTzTwiV424bO6BXZDqX+Q@mail.gmail.com>
 <agZ92TVjcYpEv_eH@sirena.co.uk> <CAABR9nHR13e3d46_Z7Q8ZkjQzKbkcPs2Er4sAvq6G1EEj-xoXw@mail.gmail.com>
 <agfd4gvQ_m3Zt8GP@sirena.co.uk>
In-Reply-To: <agfd4gvQ_m3Zt8GP@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sun, 17 May 2026 07:18:24 +0700
X-Gm-Features: AVHnY4JFQ_P1OHVLxDYOkHcfJiy2AJrIGhHUyvcIGLB3nM-OzzVXfHcxNMGpPaI
Message-ID: <CAABR9nF2GePScGzjbPs3Fzj_qiiWcP0D0+SciyPw1J9kTR4GUw@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: stm: stm32_i2s: Use guard() for spin locks
To: Mark Brown <broonie@kernel.org>
Cc: Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,


> There are likely to be different considerations for different drivers,
> on some systems the power savings from managing the clocks may not be
> meaingful or we may need the clocks for register access.  In general
> it's nicer to actively manage the clocks but it's not super urgent to do
> so from a framework point of view, it's more a how much work the people
> working on the individual drivers want to do and if there's a use case
> for specific hardware.

Understood, and thank you for the clarification.
That gives me a better understanding of the considerations around PM/clock
handling in these drivers.

Best Regard,
Phuc
