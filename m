Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839156;
	b=VFsaJLVBIGA4yKHkncgPhFCOmfW+UHyFiRA4Oaq7jUwdh+b1deOhTvTOwMB5KibE08HV
	 EsyOE7/I30T9G5m6qSmIgil3ej7HdWIo429r4wjai9i9OojgaARxX5V4rujE7b+F1PsFM
	 WXWc2UDMmFjFtPfZTVo/c/loogenzretkIBaQuwFQDpVsdGiMlSyUpsZ3HAhMhosKXV7s
	 QhbZYd+OdoNkI9BkX+tdQtrOlQCOPREHOend8R+42SdWsqlUgAauUXkxvhVFMT4HCPi50
	 eTzbj3DcJfEYJmHwnITWbrYecRAQEXbhgcMNOjc8W4MKXu+YHB2fAB/cmTNM1fwDcGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839156;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=pEFh2wPZQpup6AZ9YhdJSve3FCh4nhgpe999E3sblJs=;
	b=0VHze+uWgw/VlbOvPLWH+fQjlUGbhgdW0CnnaKShBdT2YNwgKRLzITh7O7bcROvBLRrC
	 Ku6diTFc39XOK1CBZmI6FWXjN9TLY/tfxJ2c8rGvQrwUvEjGBEakJIB65u5fjD52pc0Tv
	 DtZIp1LuSR66e3PL4rINw8lTJK3pgTKCfnNlu8HqEMPhD2y7XPs/abFnnXOoTeNFuLr1i
	 FQhI/FFUFa3SO8HMTiWwiVFRfW8cWlTCXwVEMUWfFXl79ClGQ43hvFqN0JghhhybA1z9w
	 S97uPvNSZ/9+ZP812q7JazFmylbQfwxoCBIIugek20zZhE8TLjEg4TuGiRRBVZQn/Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=VtL5M3ji;
	arc=none smtp.remote-ip=109.224.244.123
Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165DD606A31C
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 14:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 165DD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=VtL5M3ji
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794839152; x=1795098352;
	bh=pEFh2wPZQpup6AZ9YhdJSve3FCh4nhgpe999E3sblJs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VtL5M3jiObas39sbwRthDGa88ktTFadUDDTlhBE3qiE/mSzpRWCge1mqnmWsZ5lGK
	 Q1ikVHd9Ah898iRZLT5nRlLpz3WiRR3hCFlFHF5q1jLCQ2272UIAqgc40EIYEZ1dCF
	 hSQKUhWkTr3utEAAicxfOMNoujskqmSKmol1stq2g5BUUWWOi2mIBJ1P98yAB1wo6W
	 gGec7yQw0YoZTFHHq6k3a7Gg3zr5+EOthKC1W1FT8HGkVrAj2/wrB5cb0+ZtEd/sdM
	 4XgjJ7oTk3TdegX9KcmI06K7Zch1ZqRWrLd0xYoCQYqiUMXC25HK3obQGvQtOqQ+1e
	 qeze9KvQEXjhA==
Date: Mon, 16 Nov 2026 14:25:47 +0000
To: tiwai@suse.de, Devin Christensen <dchristensen8@proton.me>
From: Devin Christensen <dchristensen8@proton.me>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, rafael@gexdigital.net
Subject: [PATCH 0/2] ALSA: hda/ca0132: Fix AE-5 strip color glitch and add on-card LEDs
Message-ID: <20261116142542.4178770-1-dchristensen8@proton.me>
In-Reply-To: <87qzgkyi5l.wl-tiwai@suse.de>
References: <20261116140237.4137662-1-dchristensen8@proton.me> <87qzgkyi5l.wl-tiwai@suse.de>
Feedback-ID: 45895322:user:proton
X-Pm-Message-ID: bc18f016753c5400f84a94010f3bc794ab04e3e6
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Split into a 2-patch series per Takashi's review:

- Patch 1 is a standalone fix for the external WS2812 strip color
  corruption glitch during rapid updates, targeted for 7.4-rc (carries
  the Fixes tag).
- Patch 2 adds ALSA card control support for the 5 on-board APA102
  RGB LEDs, targeted for 7.5.

Thanks,
Devin

Devin Christensen (2):
  ALSA: hda/ca0132: Fix AE-5 LED strip color corruption during animation
  ALSA: hda/ca0132: Add Sound BlasterX AE-5 on-card RGB LED support

 sound/hda/codecs/ca0132.c | 151 +++++++++++++++++++++++++++++---------
 1 file changed, 116 insertions(+), 35 deletions(-)

--=20
2.56.0

