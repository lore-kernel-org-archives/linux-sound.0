Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608765;
	b=2/gVKlwynNXF4tIZqGMAmB5PmZhIxMzgwd5MHK8e660RZpcFdKcoCLhTrUCvkZKdI7D5
	 QOT37dFDhvkClMx77hgX+99s4BzA8FTA7u7aJ6GB0iwJMO04+8wEprrb5OaaUrZGZso/E
	 tTUe74Ww1AddWtUElHqpp9ayA8GoNfBugDknIiOeQiyqNjGkT0ZKbMM+A6T9I/4XFaJnJ
	 4/dPD28X+0jyLG8p/BnRbKalRK2YdE4kSml/73ms3+8tdPeiAVme9YtkN5fMDJlOubeZc
	 NwR5l4iYlXm5J5kQNzTTgYajajYDAMtKzPbaSjzGazEhlBE9EdkfzVz7L70CRDP2xXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=//D9wA3M6w3lytBQpSdqS+hZczeIlR8TRbTjX887EP0=;
	b=2KX1QkWLzln1iaGWJcBv+WhzkRVy3hjgLfEsssOo3Q+m5f66uCPAf2kEcaOsMSxWxroh
	 tq2y9GqSqrwsT4EWPGIOhjfhODEPeHzkNHo+0Gcr/cE5tGV1MnqwJvsBWevRUZbJmrW1l
	 u20yJBK+Cu8CMuijygnjOJjMB1r6K2ebO+pQoLCXBqyy4xzofLGK9v1hq34DqfDmO2jE9
	 O7gliGbstAj396ziMl0wm2sOju90MmUfj9OY7vrkGobUbosh0saG3V3tVUl8nKXWszWbi
	 bA2gB6YqGUzF6kNFT2UEZBHV5uraICeJ8ahcEw/DP92Sy2kwmHceZf0Cbj1TZJvyNKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="H/Ka9WcA";
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDCF606A321
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 12:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BDCF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H/Ka9WcA
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-386c336eab8so2063419eec.0
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 04:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795608764; x=1796213564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=//D9wA3M6w3lytBQpSdqS+hZczeIlR8TRbTjX887EP0=;
        b=H/Ka9WcAjDtI2y79zLW8fBFIoxGLcCgbWbcxb8PJPteex8WBU2/NINuedxrihk15Ei
         73MZUws50LXumgmQhNyX0xXmJN5GDhQ8cFSfp9uza1qgramF1FEIVYCtBxe/QyvB13mX
         tPzXPrlJDYLw7OEK+HRXqvGjqBr3TNXom0wcD8TJLHkY+o9smXuztTDX1uvuQLi1Pm9L
         C4iS71RjkbgHSFc1+9hWh5cAxZEZT44xfpqQ3NCEQHQFM1X7wHM2hhVlV/oYHgsIqTVA
         0oXN9yPyv56Ea1KrBIqK587JgpoZC67VlFj93DBxn4rL4fzCTA+S3EWPpHDC6jPkX3Pz
         cYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608764; x=1796213564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//D9wA3M6w3lytBQpSdqS+hZczeIlR8TRbTjX887EP0=;
        b=bNwn58MRobyMqWY79VLLHpyj9YoM67NpJCl+JLfxbX3JSoKGp5cxBTivey+FRUJtOt
         riRRjf3YBV2L0k982jamnI7v37gD1ex7T9r8qBopwROIHyXgVo2IhrxyVFurepu1hrfX
         QhWqaJZo+F6UNFvxZYO2XHQ8DvOvFNFXyGexkUTmo3HJYZ9ICC2eXK3+enadIBwkQES/
         i/pEjeVVBsWFUgU3JsOK4ifNNAqdmcp0n5FXKv0Mprm97O88PTx/+1fjAmGmzdS6bSmU
         a/sXo9GUxFIi7qzvCArNusHUALFWm9v6L67IB5a2s98FCc8NO2Na/1uNZuwAIjFM9w4w
         nQXQ==
X-Forwarded-Encrypted: i=1; AL+hErEqoXQxcZAySeJ2LFrj02RV2wlRioV52pvzyUVROaWIeHnNAjRxm+/Cg8mFKgEN/D610xyK2fdYu39v4g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9jyhjwJ7892qbSCddJFuFTJcrPnYSB3EES1ndX4O/4wOAlEz5X
	jw/fPNVhMHSbUyspPpUgoA47vaIRT3sOGbJNJJ+wWQl8H0uWTnjMjJg8wzOtTA==
X-Gm-Gg: AZFdTZd02wl/3ZAliJpLnkQVYzo1HFeQK2q7JPgYQGh20MNY/ct/DSwjSvrjiFGuwPn
	99f1DCCgZ14aAEjHKH8ufX4bifJn4zWzb9Vn+gabXuE5GkK0Lsw/X1us3uhMkGDchruxZqXU8oL
	Ea1RKiIjl+kFCjDq20HIkhVo4koW/vp20XIxHcfr5dYsDEBgkXO5k2GwU61jxe0+1s9EQhxg2Vi
	s6EfZzP/rP70LiPk6rl7O9BMpQop1qky9e7/6u1eXTEza9ldOGtUxgCZnhlFQ0XSl13NkrCZg7N
	hScTepPdLCAljIG7Tv/Yl1pZ59c0eXSGkUakvWCeanKvdZUosoxhvJWdOON4689X0Z1uH/91iBK
	EMgkWMlFJM0GwjKt/zB5UoxKW0picQRRKOpIyJ8eYFsta9IPpyeoiQM3AmFO7qWRcZwSaC7dWwq
	1TKzwOf0INUFtcsRX1Y3/Bj33zo/OHHG3tpKdu3M0WDOXDzpSqsYHBluKnTEIHTWNB/oSJZJHqP
	VeaNyysMhIZgiOmL8dmvGg2BBmBDcIz5Z8ov1HuHBJES25jAdtm0jJ7qeH2RSsjePWIwuMXZm7X
	wPQXmO/nvr24GhEIiDr2aVXjQndvaMNkr9mM7iGI/3WCiAvxxt8kag==
X-Received: by 2002:a05:7301:1a85:b0:36a:79cd:12df with SMTP id 5a478bee46e88-3856fe5ae43mr19541708eec.9.1795608764148;
        Wed, 25 Nov 2026 04:12:44 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm12234336eec.17.2026.11.25.04.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:12:43 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Clemens Ladisch <clemens@ladisch.de>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 0/3] ALSA: bebob/oxfw: bound AV/C response walks to the response length
Date: Wed, 25 Nov 2026 20:12:35 +0800
Message-Id: <20261125121238.1602172-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The BeBoB and OXFW drivers walk three AV/C responses by counts that the
device puts into the response. None of the walks is checked against the
length of the response. A count that is too large reads past the
response buffer, or later past a stored copy of the format.

Each patch rejects such a response with -EIO. A complete response is
handled as before. The formats in the Griffin FireWave dump at [1] pass
the new check. I found no such dump of a BeBoB device.

Found with a CodeQL-based static analysis tool that we are developing.
Each case was reproduced in a userspace harness under AddressSanitizer.
Not tested on hardware. Compile-tested with W=1 on next-20261116.

I used an LLM to help write the harnesses and these patches.

[1] https://lore.kernel.org/all/543FD6AA.5080004@sakamocchi.jp/

Maoyi Xie (3):
  ALSA: bebob: bound the channel position walk to the response length
  ALSA: bebob: bound the stream format entries to the response length
  ALSA: oxfw: bound the stream format entries to the response length

 sound/firewire/bebob/bebob.h         |  2 +-
 sound/firewire/bebob/bebob_command.c |  5 +++--
 sound/firewire/bebob/bebob_stream.c  | 15 +++++++++++++--
 sound/firewire/oxfw/oxfw-stream.c    | 22 ++++++++++++++++++++--
 4 files changed, 37 insertions(+), 7 deletions(-)

-- 
2.34.1

