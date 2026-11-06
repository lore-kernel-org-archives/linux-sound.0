Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982741;
	b=Q33ryKzapk+DKzdjlQO9w/1+Q0DkpVeSviUOhgeLnrbqRaIyAtT27prncm00mqTwZjLP
	 rjnuZF4Xos/FYAvBRV7lYxwVNN1rTemYMc0KZ6geab//9uisnQLGtMOK3/TwTwUgHKUuO
	 Sjo87EZWVUU/ipx4yJl/ZauoPd/zjZT9hGriRcCs7fJalnjpRYY20yWqDGzPVirI8Irm4
	 CHL0KwnG5ppjsDOYqYk8UgR6dgo3Vrfd+2dqV9IqlfJjTNxMpq6GKInnAB7Q+wjqNQxAj
	 YlGr6G5D5DUjDL2Bv0vKhlG1G4FkmVhqLX4dshKu/49zoRDp2pZgd2yHxVWXWjhMklQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RChgsve2szNJ3b5mAMnEQC1I71q5nELdLnWCslX6oGg=;
	b=KqzICLwEG2Bowd/aszebK9YZbbxpFsvmTOmLTiDvwGC5DWK8nXCLXs06XUvgoFx5utxB
	 x4sIlMA74XLGDiXBLrRCJaNjSYd2pxSraHjI92EhuMfOf3kEVDzv4PR5ulRFxxRZ/ZosV
	 VZHliEVJ/hTqYEAQRnPp1oJZc+5AWuNiGxThlD+3J2gV3yL+gmEf6FQqLyvK5oCgBJWTd
	 2NlPzhPxS3UNRDU3XP0WXneFoULmjklEc7u5tR+zBgX4QdPsYkYfmmeJOGOgNPH7hExJa
	 SpSkf5ZjJvlwxzNKYNXLgP/y8yqI9zUoiwmWmFFQxMakAdIGdPt9isnV27S5yUWWaSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H30F4iRA;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FB7606A329
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 16:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01FB7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H30F4iRA
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-846566246e8so763031a34.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 08:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982740; x=1794587540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RChgsve2szNJ3b5mAMnEQC1I71q5nELdLnWCslX6oGg=;
        b=H30F4iRAZHRzzH5WqhMuQWK1dOfasDflfDyAkereNzfCXgfkwzOX08//+6E8j0newJ
         r2IPmpTD0+U+52P178zcJgYo/BV48kw4iFJolgvxzMiUn3IbluFrq3jr4KIEQE7Y3ZxE
         IBuGc19Y6z51+DyWyW4WY4dGxRof3bkjzbyCrZa7aREFgVqf9uoaegf7IjfUFxg9CAtC
         cSS5q04HZaIMjjRTGI0JkKdKvPjKi3+bzky/rB4t+AzCjiRdHiDbJqWKuKNKD6qF51jV
         bYuyW0WwVPbyR3OHmnnf7oXGwUHIe3Mtv96AwRgyCHg2hNWFoHMnYTciyHLbjslTMd5i
         oeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982740; x=1794587540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RChgsve2szNJ3b5mAMnEQC1I71q5nELdLnWCslX6oGg=;
        b=dRDSJBfDOyxgEMfaU9a8wIgDUunfPmPP15qE7p2ax8ugFt6E+70WSRujm7lQ2mgMYr
         vkZYakb+qT2jV+DOEuU7wv3pP1HR20Ud1h1CHGFjfB682cgVsNsPqgRNX8VgUWcWDMpM
         5rf9dkm8uMxOIgKAX2bs75uuD0IdeKutj0QIXwE45/AObcrJJ1B68Hg47U/SoQSkizkn
         4WgrA/xXCd+6H26uUCMEW8lPg2cwaOF8G2WCgkgbqRLHee4EK78Wi33UdDNEcgiK+M7X
         e6Z2dhpdKZpCdBa6eSh7brm4bEj0YVGZ+nMAPsP/046LT3mFzj0DA/Ox+DEkbcBVab+m
         JzuA==
X-Forwarded-Encrypted: i=1; AKwUvBzbSvJunlz0bjhKQw6KL1J4W51z10UVgsEPGE9iOaAwooE1Sz2FATPt62XyPb4YT1B/jTMvJe0ig5YVlw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/jHxidwISgNoDxWYTaz4EUWP55nKltkZhW/2yk7n1X+8jpsysA
	ao/DGEjGE06+yl9HIuXA33EDGEjNyj4tiwotqX/Q4WqD9hFS4uDKfzxC
X-Gm-Gg: AYBFou3M3sNIPWJJnCCWy+IaNs75ptOnu2JaMg32NV2N0NK01eCL0lZn4TOe54TpHNd
	+xUlw5czcdW4qv1bkjh39Vr6TfEpSoXa8JdIVSQa1L1PJ9+WFs/tV9/XrAos+wG91JnrfW1FneC
	JpobGo7QOcFWWNrHsskef/xf0OpmYkfXeBfrokMUsYgjPjtLJ/SOY7RcMH8GLNNyVVf0V/N98z5
	mxvFClzM6cDNzko37cDug9+l2xnK/5ieI+mowkkIn865g0Cz0o4RINil7zX3ynELN3qgyGcdWCm
	QuiIe7MGYcjkVDoNcEmvvz3xjQFwOvBdepgc/fJEj7atHSKD8z2dO+OHvTkGlTAjTJYJCZUloQK
	q1jB+D3YbprdHvTYQKlCrqnBVe9XNMSQ1HSzy3+R5tqOYJjIItNBhq+ZX9Ig+dD1QxgG1mAF0xC
	DSmqEtlcGQjBrzGnCeSyWqAHfup2f3MDjhRwTNkGaAFUDWSDVUAJXPWCaC5z1qKgjPfGrYrxzz4
	5+klXGswJ7kByYBv/bThyZyfgVPkD2DzI4YlK5SdGTJCADNK+XgX7Vkzeoc6XGHWASu9zu1r6Zb
	QZP6OFo0/yS1oDgmvMcQ54hSlMBKqPjXzMRR+/LNTGC+7A==
X-Received: by 2002:a05:6830:4487:b0:821:dd7e:330a with SMTP id 46e09a7af769-85f1cf9a329mr1922143a34.8.1793982739784;
        Fri, 06 Nov 2026 08:32:19 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:19 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 00/16] ALSA: usb-audio: Audient driver and iD14 MkI support
Date: Fri,  6 Nov 2026 10:31:13 -0600
Message-ID: <20261106163129.1006907-1-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aupn1wwW7w08M3gu@khmer.arcnet>
References: <aupn1wwW7w08M3gu@khmer.arcnet>
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

Hi Christian,

On Wed, Nov 04, 2026 at 12:01:47AM +0100, Christian Ruppert wrote:
> I guess that depends how we define force_set. In my mind it's literally
> force set, i.e. for write-only values we must explicitly specify both
> FORCE_SET and CACHE.

That definition makes sense to me. With it, the read before the write
is fine: an uncached FORCE_SET control is one the device can read.

I also prefer the current return value. If a put always returned 1,
the kernel would send a change event even when alsactl restores an
unchanged value. So I dropped my diff. Patch 10 has only the comment
typo fixed and the blank line removed.

> Is there a reason 4, 5 and 6 are separate? They should all be one big
> update in the device definition tables without any code changes, right?

Right, they add only table entries, the device ID and the map lines.
They are now one patch (15 of this series).

> Happy to review and test an RFC of the complete series until he's back and
> takes a decision.

Thanks, here it is: your 11 RFC V2 patches, then the five iD14
patches. It sits on top of your four mixer_evo fixes. I can rebase
it once Takashi decides how those go in.

Patches 12 to 16:
- 12 adds a step size to integer controls (the iD14 volumes move in
  1 dB steps).
- 13 adds enumerated controls (routing, iD key function, talkback
  source, digital input mode).
- 14 gives the iD14 MkI its own mixer map; the MkII keeps the shared
  one.
- 15 adds the iD14 MkI controls: monitor section, routing, mixer
  matrix and the write-only controls.
- 16 replaces the generic FU 12 control, whose GET returns stale data.

Base: sound master 603a4df9e6ae with your four fixes (Patchwork series
1193966). Each patch builds on its own with W=1 without warnings. On
an iD14 MkI (7.2.11 stable), the complete series passed the same read
and write checks as RFC V2, change events included.

Thanks,
Will

Christian Ruppert (11):
  ALSA: rename mixer_evo to mixer_audient
  ALSA: mixer_audient: explicitly define full control names
  ALSA: mixer_audient: clarify USB control message definition
  ALSA: mixer_audient: Add length check to USB transfer
  ALSA: mixer_audient: make USB control transfer size configurable
  ALSA: mixer_audient: Allow arbitrary boolean control values
  ALSA: mixer_audient: Add integer range checks
  ALSA: mixer_audient: Add control initialization at probe
  ALSA: mixer_audient: Add readback-free parameter set
  ALSA: mixer_audient: add control value caching
  ALSA: mixer_audient: Create matrix programmatically

Will Porter (5):
  ALSA: mixer_audient: Add a step size to integer controls
  ALSA: mixer_audient: Add enumerated controls
  ALSA: usb-audio: Give the Audient iD14 MkI its own mixer map
  ALSA: mixer_audient: Add Audient iD14 MkI controls
  ALSA: mixer_audient: Replace the Audient iD14 MkI FU 12 control

 MAINTAINERS               |    7 +-
 sound/usb/Makefile        |    2 +-
 sound/usb/mixer_audient.c | 1342 +++++++++++++++++++++++++++++++++++++
 sound/usb/mixer_audient.h |   13 +
 sound/usb/mixer_evo.c     |  526 ---------------
 sound/usb/mixer_evo.h     |   12 -
 sound/usb/mixer_maps.c    |   10 +-
 sound/usb/mixer_quirks.c  |    7 +-
 8 files changed, 1374 insertions(+), 545 deletions(-)
 create mode 100644 sound/usb/mixer_audient.c
 create mode 100644 sound/usb/mixer_audient.h
 delete mode 100644 sound/usb/mixer_evo.c
 delete mode 100644 sound/usb/mixer_evo.h


base-commit: 603a4df9e6ae60a26adb335fe8d8f6e8f19e5d8e
prerequisite-patch-id: 522b05214a3c615ec30e50574b2bcc9c6c55dc3c
prerequisite-patch-id: 4c58588cb3fd46832de61018d60452ad1f5de1f9
prerequisite-patch-id: e15c90c1732110d25b16d26b4f919715cae7f5be
prerequisite-patch-id: 02c9ab9c3fd4cc8617060c81eed06affae2da0d2
-- 
2.47.3

