Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.200.178.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088524;
	b=4uQHjrG3rfPFwqY51HOBH3cGcTcQMjOR7iAAN5nOaPhau/vIaq4HCu1Q4mzBm7QV47xy
	 FDQoCL2GyzbbC3nBCx77auFuE2HrsSurN5oJL2+r1FhcZiFNk+ohk6aQtuAlfq8JHRm1Z
	 739yp/cylGvRgckt3HX5hKBCVvKrG7iPwFr5jS2Dm7vXtObBM3Wx0As40DWmVYGcSWYiv
	 /B0R95ggVPnAWWZ7GUz4R1kykIdY2SZ17evtvbToCoHTjwC8REYcvBzTZ4gyqVYrqoiHN
	 j4Ha7JJdcPiH7GGMW6kzuX3/2dY/SHcmen2fGIuJIg/BLL2MnyYeUwG9RIwN5nfbA0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088524;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:Sender;
	bh=+puhOe4ZiA6N5UTEpi85xZ5HZ1/FgBewFrPJB4jYC3A=;
	b=2z6iogX0nPVta+IjkbnZ4HPBXL+LKGh3lm2M9GjHcCqAM9qZqMWX0OdhTgteV3qB8W7G
	 awnfbQwhvQUQFMkMFTnbMe5ymoUmfHZU/sW8k+q4cYjEbn+hIo8PPO8d3u7a8UDIDQmhM
	 7eBiWqfpKm1tMEsXHaU6sZXTFKywy4L/52G0rT0XxbwcovFgkgx9e4J3okrcbHCMS8CQn
	 NO9TSS3S7bIEOr/vU10ysRNo7/1USXtYQqTZCMe1YNb0UleSeWkwo4JAoAuuhGn/CJex3
	 i8ppO8QZAG9hvMQcnkw9qSK6vsfIYnzXWtIrJtqGMiR1/XS7in8aTElOOPpYJhgPhHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tsoy.me;
	spf=pass smtp.mailfrom=puleglot.ru;
	dkim=pass header.d=tsoy.me header.i=@tsoy.me header.a=rsa-sha256 header.s=mymail header.b="VC4hWIB/";
	arc=none smtp.remote-ip=185.200.178.21
Received: from puleglot.ru (puleglot.ru [185.200.178.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF269606A31B
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 08:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF269606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tsoy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puleglot.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=tsoy.me header.i=@tsoy.me header.a=rsa-sha256 header.s=mymail header.b=VC4hWIB/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
	s=mymail; h=Sender:MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=+puhOe4ZiA6N5UTEpi85xZ5HZ1/FgBewFrPJB4jYC3A=; b=VC4hWIB/kQXwsYk3GCeMyBaGxa
	5Lkh7LKLJmrjG/mlvf27PTpHH34i4vqd6OAhJQpunAdLxISJyGzocs17PusTudo1LussbJ3ZGwvKg
	oQ+o5PNGb2YyV1HnsIueIbvzZvNQEZb6UVzpqSecBE9rgeQ0FLBs19n6Sr/tQEyBKyC0=;
Received: from [2a0c:db40:0:8104:10::5]
	by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <puleglot@puleglot.ru>)
	id 1xLcEU-00000002XvM-0YWs;
	Tue, 27 Oct 2026 11:08:34 +0300
Message-ID: <e3654ac68b87030805b5ab46fc6b20b119a204ba.camel@tsoy.me>
Subject: Re: [PATCH] ALSA: usb-audio: MOTU MicroBook II playback fix
From: Alexander Tsoy <alexander@tsoy.me>
To: Takashi Iwai <tiwai@suse.de>, Sally Marcher <marcher@student.tugraz.at>
Cc: linux-sound@vger.kernel.org, tiwai@suse.com, perex@perex.cz
Date: Tue, 27 Oct 2026 11:08:32 +0300
In-Reply-To: <87qzhb38er.wl-tiwai@suse.de>
References: <6690AE3A-5D2A-488D-BB09-1588948491D9@student.tugraz.at>
		<abf3bf13-4f91-4026-89ea-74b5f42ea935@student.tugraz.at>
		<fc46e94ecb01b6f09ad3548e1654d128d74dea03.camel@tsoy.me>
		<1ceb66f2-d5c2-4419-b75f-33afb2f52fbd@student.tugraz.at>
		<e79d259f7a3892aba307b3674b235c53b68e1ed3.camel@tsoy.me>
		<d5dfd044-69f6-4fc3-9884-6599d88afb55@student.tugraz.at>
	 <87qzhb38er.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Sender: puleglot@puleglot.ru

=D0=92 =D0=92=D1=82, 27/10/2026 =D0=B2 08:33 +0100, Takashi Iwai =D0=BF=D0=
=B8=D1=88=D0=B5=D1=82:
> On Mon, 26 Oct 2026 17:01:32 +0100,
> Sally Marcher wrote:
> >=20
> > Hi,
> > patch is attached to this email.
>=20
> OK, I applied manually now.

Thanks!

I just want to add some context here for the history. I replied to
original thread on alsa-devel ML, but it seems MTA on alsa-project.org
is currently down.

This device is not class compliant and all endpoints are contained in a
single interface. snd_usb_parse_datainterval() probably returns=20
bInterval of the first endpoint which is an Interrupt endpoint with=20
bInterval=3D4. That's why datainterval needs to be set explicitly.
