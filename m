Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317785;
	b=U2MTanyuxlpzvegBh/dv3qiaWbQjg163MjpNET3LyHIOWPBjvAu8oiu2kpOHivbe+uxD
	 RJ3jfw2VP+uFxm7jQy3/S/FZXQzOY2cQ2kd7ZCdiSK0hsyIQMdlmoiWKSAbtLyizAl0O6
	 wohYh057XXQcKbD/NIoCl4eWlQRSFaYiN7kfa1nJTc351pp5GQmwlDQ51AsZyOxFrL1ac
	 zlhwvIqyasS2gpVrmAluq8yZfg43Gm74mJjUDAF3BOClU/dkZqg0vLVZNdLg0bk5bzQfs
	 b9cgr8HFUfED78ip2Q9TaSIoPnwpx7gg+IwnLZwWjL6QO0LnoUbrULPVzyDu9oyIGkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317785;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type;
	bh=LP5DUahL5hEGeUCAmx9TodRjN6W7SnWiOWsPXfAnq20=;
	b=L29UyHFNeN64TgRuhqu5gxgwODvlb2vU5UD7TezOmpMyVNsu2RhxX9xlF6E0fTrtKQah
	 QbgND3E2CKomZRMokgRvXm88FD+qEep4FlivUHSr5SMAivKzldSOcq/lWQX1l7u0IAvqW
	 VqMBT8SG9aBw/Z6gwPuDwzvIOwwApMPs0zSBDYUngwdlKBTWzHvoTPTPT7IeoDmMauK9V
	 h6PsBuh/pmHzm9qoYB35LdRTdu0lgMlHU4sgFP9EskxGY1bai6I3Vx/MIUcxihM0j8Tkz
	 s9+3Zkt3mluqqdm5by/uhhRF5f2gSR91whOiqUtLrbd25E082dZaDvE0Ti5VJfNQmjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=httpd.dev;
	spf=pass smtp.mailfrom=httpd.dev;
	dkim=pass header.d=httpd.dev header.i=@httpd.dev header.a=rsa-sha256 header.s=protonmail3 header.b=SuuMi19m;
	arc=none smtp.remote-ip=185.70.43.17
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837F5606A750
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 13:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 837F5606A750
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=httpd.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=httpd.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=httpd.dev header.i=@httpd.dev header.a=rsa-sha256 header.s=protonmail3 header.b=SuuMi19m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=httpd.dev;
	s=protonmail3; t=1794317782; x=1794576982;
	bh=LP5DUahL5hEGeUCAmx9TodRjN6W7SnWiOWsPXfAnq20=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=SuuMi19mExpWvO7BEz/aPH6x1ZAuQZOPnnFssHLJi59zQMy9ErfM7KW2cA/mxdO7V
	 HsgN8s4EggKFypJWKQsCJVt1rgZUv9hz0IZCYkTtPQziufTx3PDtCoc+YFMrsUaHNI
	 0wM6ciO+ndLzNyOaC630hNyOgXkd0vOulXxUGO4iWQpeh51AI9qXCB/8jgAt6mNTX/
	 zHj6xAXKxjXdNAJQtpav9BlS+uQ6ZoI58DFhEz0P5el5X8M78KvCWtKRNQ+Qu06iid
	 J+YcacGnyHksCtAa+ftIWkM2Uq0M1I6YyPrI1Aag81HncLcN6XfLV14r1cImGvnDj+
	 lJwrvriMpiy3Q==
Date: Tue, 10 Nov 2026 13:36:18 +0000
To: Takashi Iwai <tiwai@suse.de>
From: Angel J <iamanaws@httpd.dev>
Cc: linux-sound@vger.kernel.org, tiwai@suse.com, perex@perex.cz, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix the Dell XPS 8940 headset microphone
Message-ID: <57Kgu-Pdq28OE2JHZjO7YEuS6RCOZLFiDoZO8uqMUieYwA58mHOkRbbZADWKNQsocsNCzH1GkU4pSEhpi-l3mZenIkWdjdNsOHVlbAxGsXQ=@httpd.dev>
In-Reply-To: <877bilusui.wl-tiwai@suse.de>
References: <20261103150336.507675-1-iamanaws@httpd.dev> <87wlqtukxh.wl-tiwai@suse.de> <5ncUNWXphcObbYD04quaQMbD0tGoekaHB-QQrX5tgC7sSbzoT9jRVrbY9PyT6mRbww0G9-voA6Y98HjvPg7U25kmeybfQALp5NsNKym-3pc=@httpd.dev> <877bilusui.wl-tiwai@suse.de>
Feedback-ID: 163474212:user:proton
X-Pm-Message-ID: d2ae0ac7342a2d4a561fe2c0c999f1679f4bb8c7
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------51db2c8cd588198dac492970fd6cbb821e3868a5e08392649e89ef17f38b4b8d"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------51db2c8cd588198dac492970fd6cbb821e3868a5e08392649e89ef17f38b4b8d
Content-Type: multipart/mixed;boundary=---------------------a59ac8069a939afc0c30510d3cf1c046

-----------------------a59ac8069a939afc0c30510d3cf1c046
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

On Monday, November 9th, 2026 at 22:02, Takashi Iwai <tiwai@suse.de> wrote=
:
> On Mon, 09 Nov 2026 18:58:47 +0100,
> Angel J wrote:
> > Thanks for reviewing. My understanding is that the guidelines require
> > a known identity, without necessarily requiring disclosure of a full
> > name. I consistently use =E2=80=9CAngel J=E2=80=9D and this email addr=
ess for kernel
> > contributions. My PCI fix, commit 8805840aad73, was merged with the sa=
me
> > author identity and Signed-off-by.
>
> Is your identity really already widely known in the kernel community?
> I see only one recent commit in the past, and I can't see it's really
> "known".

Hi Takashi,

No, I'm a new contributor and not widely known, and a full name would
not change that. I don't read "known identity" as requiring it, though.
Documentation/process/submitting-patches.rst asks for "a known identity
(sorry, no anonymous contributions.)", which I understand as excluding
anonymous contributions rather than requiring a full name.

"Angel J" is the name I use consistently for my public work, and I can
be reached at this address.

Let me know if you read the guideline differently.

Thanks,
Angel J

-----------------------a59ac8069a939afc0c30510d3cf1c046--

--------51db2c8cd588198dac492970fd6cbb821e3868a5e08392649e89ef17f38b4b8d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0FgmrzHcEJEBoBbwppzUxnRRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmf0dLddnTK8HGBE4Npk/vY90vg40LeKPLdPciT8
AJ0pHxYhBEAFf9htFyVnqZzmVhoBbwppzUxnAACQiAD/bOvZ2DvPjy/t0gvI
+drzxU829S+5ui2U3m1AmudLRu4BANNsNJnQDb3oMeOJVnlaW+kL4GErTZ7V
WvJmyhZJ4LAO
=O1tT
-----END PGP SIGNATURE-----


--------51db2c8cd588198dac492970fd6cbb821e3868a5e08392649e89ef17f38b4b8d--

