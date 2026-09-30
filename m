Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE1D476CC2
	for <linux-sound@vger.kernel.org>; Wed, 30 Sep 2026 22:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790808604; cv=none; b=qF7LCCK4H2zkGjK5gejXeVoAv6B6y9ab0JKnTCP6crlGFkiqbgqQ+KZZJzTTmYEnXJTNkc4QrZ0SSbyW0KPqRIhSEmGHwv/lAhM1Md388ZQK+dNU8fFP48VUBJqC1IRCCAz0e5N87gB2uwvnzbHIMw4rwW28Fj5RveESIMfM8v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790808604; c=relaxed/simple;
	bh=WizLIhM6TlbVNKCi1noWPXGUULrd9AFMwA2m8n/wriE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jwcAMx69+9LTLZN9oh6wNJB2fn7yWByJvHQa9kpcTr2YizjePJYPDnKqKQSOwKfJgw58gGpVnCbT7uE9vPblAtKiGCtFzMIjbnxvG5L1/eo+jU++qhwEv6wNtQbjEboaI7JStXpC2dFU56gPWGwiS5co7GffrO63fYFgrJJXosE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2PsvEkh; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2PsvEkh"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so37706145e9.0
        for <linux-sound@vger.kernel.org>; Wed, 30 Sep 2026 15:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790808600; x=1791413400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MajK9XnMSU/e1T6MRJFZkvlCwouooPRliaUc8H8wySg=;
        b=c2PsvEkhfXz6xbWmjSMoMBzUOvfaVjjYlT/FL8c4mGbIGYSM8aNFe6vKv68A6IsHRj
         l0rkGboMkRmApbRw6M26P5OIzNuYonDI/B1n6zq2y10WDHHRFQFVxfbw4DR7PDaKG3Eg
         KylWrF9MuYkDVOlabcgsGrg8Eu8AK21ozaT9hE1qcm6rjdfRIqomdzez81K617tT8kuI
         YicnTv74zFSAespPYiKXSv54K5shf2RoRVXKiZyloLJX3E91XP1eRqI371R2sKyFnL0c
         vj4Gyq/+amc4SXITnAGbBjDNkYI/STJn0XTvI7Bk/gf4BpMsMneziIcdmEgC3q1QfE4+
         0ZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790808600; x=1791413400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MajK9XnMSU/e1T6MRJFZkvlCwouooPRliaUc8H8wySg=;
        b=mwpqx6aSxHwwbd1gu4iGKHeoal4nS2ApL+/dKOxH4Ut8nRaCrLwg2M4WqOYr8f57j6
         O5YiJCGu5+WJYQNaO0LhQ7xQvZsjLkAZx84mvqHIxGmJR3s2+xNH+VOeqXsvY97tav4K
         P4jNhXJyBds8NaBMrvTWWCNQaqIsiI6atTOuO6wRRSu6l1uiygXKASZnT7xVQGYoyjAz
         b6WT765xDe8dyG+oaIKYO8dfG762PcJHnn76v4/+J8w/qWicokO5Cj3THfwPGpPkTR1X
         iBMotcEK1FsT4VxMmLI18ykbaZ7yU8aQRHCkWiAFNpsC/txtmoGQkvRtC2UR1Xyi5yM+
         Keeg==
X-Forwarded-Encrypted: i=1; AKwUvBxAfplBs32LqsC2q+Uj8oqdB8DAnMJ37k1HR0oIHmMq4eaRglT7IFHOWk8LwyAPUz0LYphmrXWKJ782gw==@vger.kernel.org
X-Gm-Message-State: AFuF++nRn1XaMXuyDYl7fobW01bntqK5zkYPfNGHomdJnC48zzhtQntV
	TRiqgTsuXtafyRNSYC1H2ivwFj8czKbIIEKW9dw4fvXJz0tbd34fZMxo
X-Gm-Gg: AYBFou0xC+kSpUX9AjSA/Agc4s4VBdvQfRjpVWpMInHmJFoTWc6pSBJWWoZcDKbvqmD
	i4Wg79Yf/0DEO1SNg6xmUm+6/BQTbJAiB7y76N02+aJdN+ziXBAVAl6Dk12xTNjsuDec4TWxPUl
	BvyaAZYhADtoiEHZFTWZiAweEKGcd99Z1yiPmnWXqn6aV50mQB346zXMn7DU2lr0FTXokpKWo9Q
	OC1ZMzYsA2FOZm49TRndcge3GAd5+EnVuPIk1hOFTTwxzNoXnd6aFiuPfh4wTf2cHS1Y7bVkmIj
	E9PRzWyJmTYPwnD2zxnxhlxDlrYi4EIGcUYPW7d+1PE0IFp+TfOElQMUbsn9ZSI+h6o5/cXAj02
	hRzSjAu84aGn5Ht1/O+3O/OL6Zb8cLm9hOYQuXI/R22n9OSRKJDgdpsGi9sXl0q3LzZBkzwcGcI
	MZio8UGFBGcq5ZHp0zPWq1KjGkYeeKQXeON1rj4WQihxLZOWbd4DennCRaLS7lfdHqykV9R0kg+
	6Re4B3nVDP15vKUUlv4/OpxncMr8XZ6abvBKeap8xCJLzYryKy7R2oHhqocNuHSvDSwip0=
X-Received: by 2002:a05:600c:8b33:b0:4a0:20c7:6d4c with SMTP id 5b1f17b1804b1-4a020c77b5bmr1641235e9.0.1790808599991;
        Wed, 30 Sep 2026 15:49:59 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f922ac4sm16411015e9.6.2026.09.30.15.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 15:49:59 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	tiwai@suse.de,
	linux-sound@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: Re: [PATCH v7 2/2] ALSA: usb-audio: bind the Topping M62's vendor controls
Date: Thu,  1 Oct 2026 03:49:54 +0500
Message-ID: <20260930224954.121402-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930215023.39C5A1F00898@smtp.kernel.org>
References: <20260930215023.39C5A1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 30 Sep 2026 21:50:22 +0000, sashiko-bot@kernel.org wrote:
> Does this lockless teardown open a time-of-check to time-of-use race
> window before the tm context is freed by devres?

No. The two paths are serialized by the usb_device lock, and on the
M62 the path does not exist.

The failed probe runs with the device locked. usb_bus_type sets
need_parent_lock, so the driver core takes the parent's lock around an
interface probe (__driver_attach(), device_driver_attach()), and at
enumeration the interfaces are added by usb_set_configuration(), whose
caller must own the device lock. really_probe() unwinds a failed probe
with device_unbind_cleanup() inside that region, so
topping_master_teardown() runs with the usb_device locked.

The disconnect does too. usb_audio_disconnect() runs from
usb_disconnect(), which holds usb_lock_device() across
usb_disable_device(), or from an unbind through device_driver_detach(),
which takes the same lock. A later snd_usb_mixer_free() finds
mixer->disconnected set and returns before private_free.

So cpu1 and cpu2 in the sequence above cannot overlap.

As for the premise: on the M62 only the AudioControl interface goes
through usb_audio_probe(); the streaming interfaces are claimed from
its probe. If that probe fails, chip->num_interfaces is still 0 and
usb_audio_probe() frees the card itself, which runs
topping_private_free() before the driver core unwinds devres.

-- 
Thanks,
Mikhail.
