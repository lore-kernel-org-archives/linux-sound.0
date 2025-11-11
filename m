Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE6520297E
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 08:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762848512; cv=none; b=FIKA8LObyZoAZLsTxe+5ep3lzj6Lc6KOqsu9eaFUIPWKAjS2zv12kSxOgiihnsOBXJZEMTcbrnVLRbOb0rUa305an0kBUgkExI0q6tA4Xhb15UB8pnbV6uswHMq3BOMp+PA08kKZuoICzgyXEU7exEzLWiVBd7u77SknZum21lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762848512; c=relaxed/simple;
	bh=/EzhxUbgXu8TwphJDNg/nG6YdPSxeoOM709DbPBznw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BXoSR5Ze3Lr2qI9/xoChtYCgWPsFjdOS92p4tKfBP/GFAAOYVhHgcmFT3m//X2TFHAYSS8QZ4L8MhiNacdVML1kSXAv05zLQLjZICRDt/CA3X4YH61Qx4HRUv1Kb1/Sa7dL9cmLf2IOrAOGFgBT0jcZlHwIQzvxUlSKsKAjZWmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9lzz7Wb; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9lzz7Wb"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b3720e58eso1934390f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762848509; x=1763453309; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EzhxUbgXu8TwphJDNg/nG6YdPSxeoOM709DbPBznw0=;
        b=W9lzz7WbCkEDK12RoaXsBUeDy1V47hSyLmtCQQS9t/5FTlZI7fKa92tyUFW7RLVRd4
         BJkV/0kkRjvYMVXrYaFRXt+MVZv5q/pweieSwwZ7VU+JIELWqFgD0bheJHpOQYR63ON4
         GTlNcMM000B0O/VTp1AAANjlih+YgQP181Vby4hatmS/9ZM6ZdG4eDHAt90qsJ7Pvmsf
         rBYtQLt5E/kTSFk+zt/CJGMii6X5v2c2chUmNe/IZJSkVeo1/fODkyLCNA4L+VVIXtK6
         hcD/4jZALJgZQpoyn3OS+kfFoqQj/X63HXSTn3xnSV2k8QtVb+HRuMmGFS8jRmd9/5v1
         SvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762848509; x=1763453309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/EzhxUbgXu8TwphJDNg/nG6YdPSxeoOM709DbPBznw0=;
        b=VCqAkBwGvVStYg0VrLrnSA0aztW6dWcZSsOAtG0Fr6Fz2CF/hUT72fT7sXR7cPZbAa
         42iIbCi8ek+5FyucBw1wEwbFNCBn8QIOzCpEYIx49uMlCYjJ5ebP5ySsiboCuBRPP5m5
         Gc8a7coUHtijTQg7pu0mWfS9EvKgkPbKii45tICOk6Gt/sJ8DiMGb5+Ic6O+om1BvpBW
         AzDeldi3YUS1gZTjwi7Y3ITLtziup+moRGghImwX2JZRI2TmUPlsO4OrUrdUaydS3G74
         LHowA0WdbSyWAebv1jrInn0PcVl781fTkyH5thjxBba68P7Su/H36IYjpRdMsmDrqhLH
         Yp2A==
X-Forwarded-Encrypted: i=1; AJvYcCWSwN6B7qhKFzTlDCYN2y2AQZzrI0BTz8c8Hq6Q614CAU0xt38ylr5QPyCzRyRdFETrk2qqxacQnXIJAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwpdU6zRZSHiLdVE9msy07MDkq/K+m/bPV5lIqe/OwHbp0d72f
	ykzPq8Bc6uNNzXiPWlSj+rR5XCZUhxB2haR0mQM9mCwqc+81GyDzgISYXz1h1q8Ppt2Dwgo6roF
	Bfuy9572thjKV1T3fGacxUmgi/D4tJSY=
X-Gm-Gg: ASbGnctVsfKp9Yu1JovRAbhcreIir7ZynmciYYXaCv8CyFOCXWsKR75PVDp8HPvQA8W
	A1zk/s5YW5BFXOj9RhZk2kiZk9qVJa7QdPQtBp6t/c/pEPZBe11U6ZdYHASFmkhV5hBLDiVwW4A
	hnE5/VbIVvN6fWwaMVKixEnq+0Z8rqmDmvLlcf1RfYSl6+pH598lm9G4k5BVxhk94LUPR32hWCG
	vFOK1JswwW6QpoFNzv6yeQtbFewpW2Hf9Sk3tkKt3gKuCi8096fnFUltqi6dtF4xAprB0mOFM19
	CGayaJHGMHwFI/gEl64cHOEr/qtfwWEpnasUniG5XHNRfDUY7I6yKVGvVHYl3ghV
X-Google-Smtp-Source: AGHT+IFvSfTIU4Z4qFzOo2YJfLilhL94JX4cA1j/1rEFPdljVva6t9U+b00rwrHwvs9/nnWZ5H+ImqldCjksQoIqQAs=
X-Received: by 2002:a05:6000:40cd:b0:429:b958:218a with SMTP id
 ffacd0b85a97d-42b2dc4967amr8587827f8f.28.1762848508970; Tue, 11 Nov 2025
 00:08:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c6d506f7-f13b-4d57-a522-a2ccd09e7a1f@cosmicgizmosystems.com> <20251111074205.1533558-1-lugathe2@gmail.com>
In-Reply-To: <20251111074205.1533558-1-lugathe2@gmail.com>
From: The-Luga <lugathe2@gmail.com>
Date: Tue, 11 Nov 2025 05:08:16 -0300
X-Gm-Features: AWmQ_bmDNcXrvdWFtWzr7GXasgYB3WfrnIRIsSzhNeM-NRsY4FCwIBHXAWepbOU
Message-ID: <CALvgqEBS3NJxdJ1LF2j5g3q0DTyU=ZSFyeygDP1eitgRwSjvmQ@mail.gmail.com>
Subject: Re: [PATCH] The Edifier QR30 USB speaker, identified as: Jieli
 Technology EDIFIER Hal0 2.0 SE 2d99:a101, reports a HID interface that needs
 HID_QUIRK_ALWAYS_POLL to ensure it does not crash when changing the RGB
 brightness with the physical knob.
To: linuxhid@cosmicgizmosystems.com
Cc: bentiss@kernel.org, dmitry.torokhov@gmail.com, jikos@kernel.org, 
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, linuxsound@cosmicgizmosystems.com, 
	michal.pecio@gmail.com, stern@rowland.harvard.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you all! This was my first time contributing.

>ALSA and the rest are triggered to bump the volume up or down with the
>Consumer Control Volume Up and Volume Down events. Those HID usages are
>declared in the other HID interface but never fired as your testing shows.

Thank you for the suggestion! I might try something like that in the
future. For now, I=E2=80=99m happy mapping the codes of the speaker. Revers=
e
engineering is so much fun! I hope this patch helps others avoid the
frustration I experienced with this bug haha.
