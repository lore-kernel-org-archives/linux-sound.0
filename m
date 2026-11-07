Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.216.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794056751;
	b=Ayztj82hw9adOVE+VdCY3IaU6CfFeyJWUL9EopAyHm81Qc6ubmYAHyG3mE3zeAbaH1qY
	 vq8vlUDkNIvv+MFQWFasGJF9w0Kl6vgPTzTvMAFzE1CwVgc8NhzRcI1AphdCo5qPb2/ts
	 ljEdjbQ0zuKAF10dytrAFdUK2XJm+fwmEo2bn7FjIGX2vTRn8O/TxiGziy61+sgSgpON0
	 6XyrE/EhgdexdKycZJVF2KWDz/V0QwctjRlR2xQmUdQxJOdqOJGLpywXq3Y3GK/jPbweo
	 27Ejcak5WNEM7DaByNLe3b3vnWy1OyDTIkdMWmDVID6uZwwweyu+jEnr48nCKIonkEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794056751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=oQJywcCCzEM8mXQiNt3fOzLIyIQh4hJRiekOYxmYR74=;
	b=i/C139lDZJBbrVx9b0MhWA5+FH4YdliRgXXHy6js+kF9mTpgjhrsoE0xdJIGRtXvAUYy
	 C+cpWmS1rt492TGmBNbsMi48w6fJd7p+tbyddljGxXpufllq2T3fy78m4HzUFmyXM7vA/
	 asjaGHrc5pJLGpO/vfDp6WIZlWuF/vjwGRDloDQxh9tTQ5NG4hN81cqUL6XYTrBl/vIhW
	 BLhsiVgUS2azUldOqeU5gUZCxUrzuh3z7pz5yM9SRyafSwIT0IJsdwkXCKiTzn5kxXq8Q
	 hC7l/5tpTI/vI7T0yvqy11tht9Eu6FJTNiodXwcVPuodZC94FtgOE0s+wKxiYxNy96w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FLbKviSq;
	arc=fail smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603DE606A32F
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 13:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 603DE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FLbKviSq
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso877286a91.3
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 05:05:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794056751; cv=none;
        d=google.com; s=arc-20260327;
        b=FndgVSvD2uoiYlOFiGUGtF8Q30jedqP8xV2bIC4HegFunGusRZTTEyWBEp/DVMwtCD
         DueTpHw+YBELC5k1rSQ0DbGe1SmlfJF9SbhuZWqD1Fj8lpwHar2B9pyZdxMrMktBLkG1
         W68480zXe51jvsVgNvXz2C5/SIMN5pv4C6EoluqCGgLQNWXNPJRabCnNASiSkXOb6c3r
         IhgHHKgBCrXqEw/IKM8XJdoVF4zPVaLZxk0ReqaYgqr7UpXn696hkn8WEyhgGYgxyZqB
         CU0PXtAjYssL5dBZVhpNFPl8eBdF32XYO4NWEHY6D5Qd8LO18K3DNYsMcB/rC/YJAcWX
         gQKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=oQJywcCCzEM8mXQiNt3fOzLIyIQh4hJRiekOYxmYR74=;
        fh=lFFAwFYWH417aA9EDv+TedxBUQOBnDH+gwJx0J4a0rw=;
        b=fhLQRZHtT01JQCbCi/JNNkaCNcLsO8YNW480d2hC44UfGQfEK7NeAruOvmR6y+9Pkc
         zLo0yiU4QBoT0EkzUT8telRuzr/6M3BCO0hmOie2ndeP4OvwnsmMYQ4LxDgaM87HkrQN
         JZjwu+zQgclmCoozqzI5Y//4zdbgL8RhK2LQM4+CIsenuXeXYwT0NVmgAe6bDrjxedgv
         wrBg4DQC0GPSfcnHr6FCcn9cH1OXw71l7OsmjdpFgAd9Rl/QhX98+tNEFnizD6NGVgJ4
         otDhhcz+g1izXTavmUrUNCLZ/dMzxqheveVFWGGSzWgcygpc9RrClUEg9kRfCjVQsDzD
         ACBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794056751; x=1794661551; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oQJywcCCzEM8mXQiNt3fOzLIyIQh4hJRiekOYxmYR74=;
        b=FLbKviSqVPHw0jjOiHqL8zF9TZPiXOyLOoY7/ZzZCprYr8XeFPQ0JBXf9NuEhgyXP0
         /6vE0gCRNIMa2jibUdJ54+IKM0kGvbgE5pCIUoWxCS+Byl9bCH95305djdXHPGgIzRbq
         986x3HLgc1RmLfOEoug1djDbKhB+HAdsFYa7VMuHP9uP40audXgnfwPZbap6Eq9zWvu6
         RZXc13ych4UUrTtpEpTpnsM8nH94JnvPbaZkTjw1Vp3Mv8Qa6Vh8sHANeh5ZosRh2ibT
         uqbTI+m6HnLks/VxIpCGYWULfmhZCdC4B98QMHd6huAAowXrJRP1EeupKYNgarYPdCcl
         a5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794056751; x=1794661551;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oQJywcCCzEM8mXQiNt3fOzLIyIQh4hJRiekOYxmYR74=;
        b=VapqvMXiVTvu2Bm3MBLJwAM8Ig0u//k4MhXTLggwDwJk3akt5UlmRkGDH18Cng4QRc
         QgFqEbUQE071qnGTQIls8l3yfwq475mwGqNqPZq0XG2yiTPYnME0CIl85yLpHf8agApb
         UntIuRt1GAU/Z2PNGLLG4SfRvXVjGZyJDrQwmqvI2JFIad0mm4OJmsXiLeY+9SuhKyvc
         Cd5iEJ1sJH6zQDHmaf1v5tkmjcT3dbdWmETqB6jo/+BB3PbblejhXCUPy1Rw7XlTtrW8
         beu41HnZleqLRYmku2SioBYJCwSsikr9uEjCHOZm7TzY13vXgD0QAPddEbVhWaj71gGa
         ke/Q==
X-Forwarded-Encrypted: i=1; AL+hErEA7OWwCZOhpVT/2gW938v398OUf2FAzco5z20aooyiYS6pAkFwGC00NRPatcP4O2nujRbmUH+v/JS1oQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z95JTvdAYyqdwf3YL0DMVOF00zOyghBzg+K34is8IILhMzCiMoZ
	oeoPkh8TawIqMUCtAav6R1gI21+pMDKPUjWkHoxMUs0b31m0ITXk/4UA+hqmo7uz1WqHS5v8VXd
	wqInJZ3R1Y1Xty4ALV2uK02DqCXazLx4=
X-Gm-Gg: AYBFou3velUsNTz36KTHgTawM3naba5FNB5LBXJ8H+kXMqjm9Ud7aZRfFf86080Q9Vv
	2BIVqrVenksiXg1W0Sh/C8r9xWHaIVk9BVYbyXrJkpUaguV1Y1XV3j5QSsE2LgdG0DRJg3piBRd
	ALsc/ErOijZiFBqNmKSZqjBhXPXZ6QOn1eAbAImTEHSzKDh4qK8WfaeysGMRKpEcNnl9f7kA0Gq
	9XAsqkaoNeFCVQxzxmkasoklrCKUiIMrixJQ7B8cH+SieZHgmh0QBIZmXoC1WoMI415pA0oIDXw
	siFUykORlTGZVVsA9j+s8DbpnzS5S4qpE1sTQ764Xw7ALMLE4aVzq6QxYg3mFkS+nQ0cdZcWdsP
	pKoIVxMUke2OzxvIeG6RAOvMJAbNQ1gfeDaqXUA==
X-Received: by 2002:a17:90a:d88e:b0:3ad:c482:ae9a with SMTP id
 98e67ed59e1d1-3b0db5ed5f3mr5380332a91.1.1794056750595; Sat, 07 Nov 2026
 05:05:50 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Laszlo Burian <blktk2000@gmail.com>
Date: Sat, 7 Nov 2026 08:05:39 -0500
X-Gm-Features: AclHuK_Nu6d4jiQSpYGFEFSB-JOYChIi0OQWBT09P6aoABeV0XFldC_HzcBMWc0
Message-ID: <CAFgCxzCT2uo7ujUJN6V7gsKHcC=61A=oqptzX0Ktnnb7qeqnVw@mail.gmail.com>
Subject: [REGRESSION 6.12.y] ALSA: usb-audio: please backport 70b4db7d2581
 ("ALSA: usb-audio: Use the right limit for PCM OOB check")
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, linux-sound@vger.kernel.org, tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"

Hi,

please backport the following commit to 6.12.y:

  70b4db7d2581 ("ALSA: usb-audio: Use the right limit for PCM OOB check")

It fixes ef5749ef8b30 ("ALSA: usb-audio: Prevent excessive number of
frames"), which was backported to 6.12.114 as 81e4b0009f2a, but the fix
itself is not in 6.12.y yet (checked up to 6.12.116).

Upstream, ef5749ef8b30 caused choppy sound on a Behringer UMC2020HD
(https://bugzilla.kernel.org/show_bug.cgi?id=220997). I see what looks like
the same regression on a Fractal Audio Axe-Fx III (USB 2466:8010,
snd-usb-audio, implicit-feedback playback):

  - 6.12.113 (Debian 6.12.113-1): playback works
  - 6.12.115 (Debian 6.12.115-2): playback stalls. The PCM is RUNNING
    but never moves; /proc/asound/cardN/pcm0p/sub0/status shows hw_ptr
    stuck at 0, and clients like PipeWire/Firefox hang waiting on the sink.

Going back to 6.12.113 makes it work again. The only usb-audio change
between those two releases is 81e4b0009f2a. Its check
"frames + counts >= ep->max_urb_frames" cuts playback URBs off early,
and 70b4db7d2581 replaces it with a check against ctx->buffer_size.

The later 06be918062ad ("ALSA: usb-audio: Bound packet copies by the PCM
buffer size", Cc: stable) touches the same lines and depends on
70b4db7d2581.

#regzbot introduced: 81e4b0009f2a
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=220997

Thanks,
Laszlo
