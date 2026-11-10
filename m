Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326739;
	b=dRQKU1TLiwMxNy3vZ2UC/3y/HxUMXgestoDrS1Q6a5ELZfHqxbmZt9zsUOsGg+KZ3ALk
	 uq0QgV728ndUzlA7j8I5d83KGANNG1prinpJaXA1VItJRzx1TXOVyasXtNZqv7uzc9LcM
	 09bWOCAiFXdQawkug4jyeqroYGVptCSs8S9hywvDCiAZty+icOqOQc/q6WO0wOiktRHUz
	 JcI//RjcNzUwFa833q/XZLWPt+ejEaWihP6N8LeWKoYULnj9jyYp45Rr/iB6bl1JQpYRf
	 TnRyY7HxK7IXQ0cRGAuqn3ogQCDX90xz6PJtfTjTtIu8RA865trupFXaubhzNkrDzKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hELu8QwX+qFD/DnVT/P2rFt7tx59zhJVYLvINkhGp1Q=;
	b=N7E2dMUuaGwKde3G2rfklrvpU25Keb/O3Qbp1hp14i+HvTDtLP57hojmcta9QLofte7e
	 bacQJmlqsShxY+5arsrwFRd1fLPMYTPWIfcugxZaHYW4bL29Cch0L9aJFwGaf78LkHgpb
	 bxaor036gQdY2KqxF1nYQsBdSf388HOdMRgWynUEOkBMo4ZMVit5esptOtCxqe9RAVp5W
	 n8tLJFJntFOjX01DHEfKxPcZEUJkC8uGjKdjV8yzMzsMQo/T6Wr6XwRHiiV4QB/7vjQQL
	 /IjDfdKYItX5kERYZUxWLCzbGvdxuibdyC+HLVBbxPSAcC9zCNeKIYb/tzV1bNdXYIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zsIDDtZ5;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F04D606A31C
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 16:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F04D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zsIDDtZ5
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7f48c750afcso1381003a34.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 08:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326738; x=1794931538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hELu8QwX+qFD/DnVT/P2rFt7tx59zhJVYLvINkhGp1Q=;
        b=zsIDDtZ5sks72bWAQZKuHIr6mYn0Zl8cMA0em/UNdi/b/oi8VKgjksDjHUrZrW6ajN
         J6KjkKPPreD+8yRabuQ3VTAaBuTfy5BGjpCXlB7YwFt7GReXARJCt97PS63nLrpPvtPz
         GhdZB5viDbXScVkopHFjd/woRTgoxek2S/qDubyLMAWAVy8aPm3+Xe2xssaqnTGHc4i8
         VoxvhIqeDupkuAbHKXdPd6Bq5cqsiVGq+sQ2c+l5stBqjLbOvCbNJbXsXyd6VEtAYlcT
         JH3Ksvq46UNAj4ZQeOl8jq9VVFHkoefC575jsSnfYg+E7l5tu9t2+brd832dMysfL+Lm
         G5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326738; x=1794931538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hELu8QwX+qFD/DnVT/P2rFt7tx59zhJVYLvINkhGp1Q=;
        b=AkgGPl1zfalBlBM2RvRFF7KzNhirrHjovYc5Ahbmuflg5f37gc2pzziMmaceshNYfZ
         F0WmZ6CgoV2HfL4uDSvWzHVHzYHLv+tmUE1dS5ZMs7kSSF523gUvwi52deVrwYUWCVQp
         4z2ck0aVGtwGs9d6FcLrEvd3ZmoOhMNc3b94u6MI5O7/ErEJz7opia5r8rgfjuAvEg10
         qAErBQ4LPZiQOn7jy0tB4plp1y1XoxC8dXnNhLKyd4UDZP5mOUZLNqt3EKQc9c/IWQcq
         AE5t283Xr16idFFAGhzxcG9ZR1qD23Lk6ZvRy46NzN6l3H1Cdcs/Unp3AhrhX0AvCmrx
         B+Kw==
X-Forwarded-Encrypted: i=1; AL+hErHzOmEj6XVfmlIjZk4imlZOvVx59uQCx8hVJiGDi/dh7Q0SZ+BKeLzJFsl3jv3eAmrfkeOzKRnEFaGDVw==@vger.kernel.org
X-Gm-Message-State: APuU4Z97eUldbDHrZrTQ8PzJX7xjBaESsM5qlFLRYse9DdDTdOU1EX3b
	ObjTmZYawqlPKl8XGCElt5e0kHBAEqSP/BVLtGd4QNuXGyrF52AkJN0T
X-Gm-Gg: AYBFou0znOZBiSbMnducZhnHGZpJVgiccoLQrRNi8WY1GotK/Ul9a8j11gokkk9nCn+
	YqpbuynV08QncQ2pFVXa8aCG+yaNDW3jC7Z6iIgwN1N2vtpWSpzTh0fETl/PSOPzJGMAVl8zzm+
	C+9c7EdC5TnlrxJNNQcMZYWhbCBrM7A1LdXkPr6gaMQ0VdFSnZucu2L6ZFZkJ0TYt5loZS7X8WE
	a5950PU49todFu/JjOWtcp5Iwer8Dhhz6yxA/3CBWBI4byLY3+g687Lk143R82pd0ix71uDyy6C
	dGB0XCMUh1UzLxcDHQ5APJ4UyWYLnnZORB6xg7aD65m2izS10rmdqLBUYdUXR7NUPw6ppVlMkPG
	dfRCAlyzWVJR2slylfhaA03LqXBODGo8kfEYxNhq84g0XYYiRfQMcljIVd2jvmfGrmwkYKGd0Da
	uiiYqKXRnX+gjm0COK70lcA/JGG6hdS46XThXtIsK8Pw68cY6vwiF8OgrkzU64f8VMKcCBPk1p5
	HYZq2Rb6YL8yx3oxt4rrGfGIEBwHsTwJJGj0sIhOL1SCS20NFg9L6uLZ5grPVNGCCaP0dUQ1yrc
	H+MfxZNUqEksfHRT34xKfdO01H7RUralfPpnmOKX8eS2JDgIrDpy9Kv5lshz65P4MIhhUBI=
X-Received: by 2002:a05:6808:1524:b0:4c3:4e34:c69e with SMTP id 5614622812f47-5683c9eae0bmr2080731b6e.8.1794326738280;
        Tue, 10 Nov 2026 08:05:38 -0800 (PST)
Received: from localhost.localdomain ([103.170.54.93])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905f2faf5sm2434105b6e.13.2026.11.10.08.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:05:37 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH v3] ALSA: control: Validate element info in compat ioctl
Date: Tue, 10 Nov 2026 16:05:10 +0000
Message-ID: <20261110160510.2697-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87y0b1ug39.wl-tiwai@suse.de>
References: <87y0b1ug39.wl-tiwai@suse.de>
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

Hi Takashi,

The validation in snd_ctl_elem_write() happens too late. Before calling 
snd_ctl_elem_write(), the compat handler calls copy_ctl_value_from_user(), which 
uses the type and count returned by get_ctl_type() to determine how many values to copy.

If the control's info callback returns an invalid count, the integer and boolean paths 
can access beyond the fixed-size integer value array. Other paths can also calculate a 
copy size larger than the available kernel buffer.

The read path has a similar issue. It uses the same type and count when copying the values 
back to userspace, which can result in an out-of-bounds read from the kernel buffer.

So, validation in snd_ctl_elem_write() cannot prevent these problems because the unsafe 
accesses can happen before it is called.

Using __snd_ctl_elem_info() in get_ctl_type() ensures that the type and count are validated 
before they are used by the compat handlers. It also reuses the existing element ID handling 
and access checks.

Therefore, I think this validation is necessary.

Best regards,

Sreeraj
