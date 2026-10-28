Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.16.231.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793210069;
	b=muIV1XHpcLFSS+zNPZ1pXBa8OhM+DpkNsnipidXmX9emC9B7tUcZ4PKWT9h7Go1Pd2lC
	 VvDlWSi7fzcpXquJ8Axzp1wyXCzepqEszmvy4gLGtnGrAXUDOs4pzUekg0sfEPlY+qWno
	 BvRXZO2FKoTb7x6WKRWEQX7nFpnOo7MJHc6FbHBzJujX2StIQY+4PTm18hLC2GqsVCwSB
	 ThvGapV/ToIjbERAxWSkQIE8H/vne8K5M0oSihEtO1zw9AKX7pwv9GsDsiZSzFL2hI57z
	 6M/OT7ezPH+o1UF1LdJDCmE0PUFOdOhukhgaBE9Y5s3tfly+ZbK1n4AQMFnKsP4kf1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793210069;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=XXrDco9SijffJ4ztKloYW3z6O1sVnDjpBXTNoBJ1m14=;
	b=M9MkkgRUseT98RvyTKJ5K5Odm7O673Rn4IYcM6W2uq3jUnhkKI0B3/moE6VYZuaw18J8
	 z5ChhGf5w3AWhBpa9353zxrabeEx2PdZIPAq0pOmfPDpyd7H6WdKYRCZuA2yNnd7vJVv/
	 bzlVpH4ZUS1YacHLbtg1hJlRswjv8B43lLEAg4pfHVgd5pvkQjsDXDoRk++ZwA0/BJYXS
	 InRmhtflVhWt7k01SAYwqJI68tTNLeLl5Lth5O55TuZCrXv22RQb6fZsQXvlwS/v5Xoe2
	 uzya5jLie0k8uzrUaaHlNzbmvacFJg/XzNE+CGzSqxRjljxV19/rCKIcdCJsFwqfljg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=b4.vu;
	spf=pass smtp.mailfrom=b4.vu;
	dkim=pass header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1 header.b=fGhV5szF;
	arc=none smtp.remote-ip=203.16.231.148
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F6B606A31C
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 17:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2F6B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1 header.b=fGhV5szF
Received: by m.b4.vu (Postfix, from userid 1000)
	id 6793F604B6CF; Thu, 29 Oct 2026 04:24:21 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 6793F604B6CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1793210061; bh=XXrDco9SijffJ4ztKloYW3z6O1sVnDjpBXTNoBJ1m14=;
	h=Date:From:To:Cc:Subject:From;
	b=fGhV5szFHUkAp+cAEdgVxkmC5pK1Fv8Tu7NXGliGHUByXZdbaox4EQhVfumDruBWN
	 W13/UFlNj3K42ALMSnEiJ42RdplCqxm9tDjuCFplw+uVJbBi7F2aKREpdRLlBFi3wX
	 3E3y+f0SmOr/UwvRgSWCs53FguV8nDebMhn0lvOEyfM90xMSliUXFChtGzE5WocryF
	 llWITmZRL6LzcdNbcuik5JG0vaYj7LEAre9+RxsikUUbiPcarJ+hT19HmgG51Enxhm
	 E8jbBss2xp+UT6WY/YPUf1qsVldFtt5L17wNJU4RaHYm6zTbMZFOueUOR555f5uqiL
	 pGsNQQZBiAd6A==
Date: Thu, 29 Oct 2026 04:24:21 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 0/2] ALSA: scarlett2: Support Gen 4 firmware 2432 and 2449
Message-ID: <cover.1793207190.git.g@b4.vu>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Focusrite Control 2 1.1210 updates the Solo, 2i2, and 4i4 Gen 4 to
firmware 2452. Firmware 2449 onwards moves the settings the driver
uses, so without these patches the driver reads and writes the wrong
settings, and the 2i2 can lock up until it is rebooted.

Geoffrey D. Bennett (2):
  ALSA: scarlett2: Allow config sets to override port counts
  ALSA: scarlett2: Update offsets for Gen 4 firmware 2432 and 2449

 sound/usb/mixer_scarlett2.c | 287 ++++++++++++++++++++++++++++++++++--
 1 file changed, 278 insertions(+), 9 deletions(-)

-- 
2.56.0

