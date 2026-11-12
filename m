Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794451050;
	b=bwggAIFSIMiR7JLk5+H/3jvUO5DkM+BsSZRg5jURv0NmyAX5AofZ4lIpXZmzG4vz3BuT
	 oFaqqX4rbgRrfZqZxjuLz1cs4AkINltyH4YOTSDlsmbzBp079HNqdhc+hN0Kpy1otocaI
	 1f629gNLdlwKwC43D/RO8+J0bdU5eKzaEH/jCCorwF6fYoLXnl7wTCGmgs4On1QRclnFc
	 RHIXMMVCb/scDoHFN8uPbQBWInHQqJH53mUljFxeAqCpykpYO6JgIyD4GxOd0hE8K5NI2
	 fMMgrryaAmFIXjcq2/DkSM6ywbuAwrT+mOLFjoOraEDbmT6CO312q29dP2sW4DCQS0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794451050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qesAj1YookgsGmrIJwAsR78h/897pOPyfNqHIr92fhY=;
	b=zkkkKgBIHNJiUu4Qx4rH4uqxTLqeDkGwkNdyqshY+jA9UjCwMZ8GczZzdITy2U2JjQBJ
	 Qq2iUVDxcVGZf71XqppOmWg5V+3OPuIwEkiphJcjPc6zrVwm6KAOA3hjL7ESJd8+CqL+w
	 Ea8KQJt4dVQVgEtPnoVltyFyv7Bn3qLZgEx9xLowVmFJ3F7rwGnbYPwCMA/LatYK7oe9X
	 CW2BK+6uWZ8x73YEzguaKmdT64c9IxV62bwLAI6prouesjeQF0z8mirhdB3SSexmIL3+3
	 FkGNVu6mWcggGTHyhmBr2qIWOASUmF1arrbDa0ABMA82CVSTyGnxlhc2KqmxA2co2qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YV4Ocd83;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083A8606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 02:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 083A8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YV4Ocd83
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-85c1135c286so2592928a34.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 18:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794451049; x=1795055849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qesAj1YookgsGmrIJwAsR78h/897pOPyfNqHIr92fhY=;
        b=YV4Ocd83ZEL6dSY1lGsRgph/VYFnqOTTFu2Q0BYLMoRdywdLSI/Yg+H+J4bpxQS0a+
         erlu/L0yvGS1teBCU5edcLKPoej2u+ygT5sWEYhf6CnKJ/ttWbyNBcACUVt5ByO8Q2FL
         0RWB9k7qEkfjatxHmTBJU2ePy7sYq+BlYVxvZCBj2tTYRfm6FQFm5dHnMYoVO07231cG
         KMp+X9fgVk+lzlf0viaoG3TZGHVRsRnGT+WIPPgZ9uHFkWkeOslLTyP4OUUJkFgDRjAO
         aPZ/nX5+CtTSD1QIcCSgznP9Rprpb1i6RP48Ipb6g6I5vhFGru8J9A/O3Vov1Xh3fDob
         lJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794451049; x=1795055849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qesAj1YookgsGmrIJwAsR78h/897pOPyfNqHIr92fhY=;
        b=q8Gr4q7m/y2kpbqfEzuDdToC4GQtj8qUK3/TJXTTrmSFmNSrQwUKAm8XBfQuaeECzU
         wy8h2DOyISYYZNNXKa4Y4Mh4BBx09eP2K3859PRaRgRWIBJRunqaRo0yAui4VWRo3KVu
         6lUIm1PzhEOV6f8lFHg9/ZfLne7nJDxDH/pd3YBVQnha5FD5oSYGIMlEPhGoNseaCYKQ
         sKhtxs83BcheqZWkYPNM3va9LRA1YDPCoK8IQQuEPAvGeACFWvw0RlOqgvBaiSONp5Zg
         kik7TFa/MMetE7AFzlNj9a+Y56UByBgZR76zHxQ/7XC8YbhixGwzU16I3xRcTTJzSM27
         GamA==
X-Forwarded-Encrypted: i=1; AL+hErGCFAqwdbxw7qVRpWALCYGF97XFoMGuc+6MaeNqhaj2KDWlb5ccUpz9LmDSY2zQD/gWGfRNufajVCJyEg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8TtO/JwaDLX/GW9sOkom02HdGHY/0WggmpTMfgJXY7dLiPlECf
	sp29PnjQDYGbuBo72z23YDpbx1fJzWh2SD6urTbFvwnmJq17SaSwwDB0wGHyPA==
X-Gm-Gg: AYBFou015aBvQuszd15mYa2qE9Ja1oFeXUwMhwtMCwho8X/UcoJDLZmFZQUg7VpV8D3
	exk1G2QPxYgKY5IfunJILEwJPMOtSCWKgZlBrld2MhDiDNeP7WTsgNG+h2KbKKsi07PmLXvGfxX
	hdRblTa4GrLqjK59/Cu5h5ZYlWhnRSi7sGPQm1N5IqrWe3G9RDXCUJRaBKA1u+OlGoTuJS+4w42
	tJIaKhm5cwHV0tLvRQfKhLF8CdL1G2Xged5bEst9CkF2qYnkm+KOTetu6Xqb1YxWxuMzhsIbslp
	1MkuQe52Pf3zhHmHP+Eam2lPHpKfj992C933eOSHDRnTTNEC5eDXSyUbdTjmohV0bZeIA/uI3O9
	ZgIYj9IqdU6kOy9r/vMnY4/zKoJYxwmJNBUcZen5gSd1swC+mWbLKSA70bc2hIkqSUPmn8LwcEr
	liwDXP3c1UugF8z+86J2VQqy93E4rLrD/MKUJ083bNiDocj/wYDIxtzzZYRfUXs0jRtCbhSTxaK
	Tc9AOozS7BDJKnI7NWkVuaOEfyLaq1MgGQkC8ctMr6l6KqETYOJD8x99R/sd/pLdyEKxzPiqp+U
	+3u7Yp+5+U3GWonBtCB/JA9H5fNT/zFXb5vuX1NxXtbPaw==
X-Received: by 2002:a05:6870:c254:b0:49d:d617:b692 with SMTP id 586e51a60fabf-4ae46c72dd6mr3963756fac.49.1794451048782;
        Wed, 11 Nov 2026 18:37:28 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22f6a1c7sm4327310fac.6.2026.11.11.18.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 18:37:26 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 0/6] ALSA: mixer_audient: Cache rework and simplifications
Date: Wed, 11 Nov 2026 20:37:14 -0600
Message-ID: <20261112023720.1503814-1-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <avOFQAGTVkCXgs2l@khmer.arcnet>
References: <avOFQAGTVkCXgs2l@khmer.arcnet>
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

On Tue, Nov 10, 2026 at 09:57:40PM +0100, Christian Ruppert wrote:
> I realized that usb_mixer_elem_info already contains an integer array for
> caching we could use instead of our manually allocated cache. I suspect we
> should rework patch 10 accordingly.

I like the idea. When I read the code for it, I saw a few more places
where the driver could be simpler. It seemed easier to show them as
patches than to describe them, so here they are for you to try on the
EVO4. Please take what you like and drop the rest.

> I'll prepare a new patch 10 but won't be able to test before the week-end.

Patches 3 to 6 need the cache change as a base, so patch 2 is my
version of it, only so that the rest can be tested. Please replace it
with yours. Two questions came up when I wrote it:

- The notify paths clear info->cached unless get_cur_broken is set. A
  write-only control could not read its value back after that. Patch 2
  sets get_cur_broken for the write-only controls. Is that a correct
  use of the field?
- The interrupt path clears the bit of the channel number in the
  message, and channel 0 clears all bits. Patch 2 uses the channel
  index in the element as the bit. Would the channel number of the
  request fit your EVO4 events better?

> Do you think it makes sense to refactor FU12 caching as well?

Yes, I think so: the driver then has one cache. Patch 6 does it.

The patches:

1. Not for merging. It has the changes from your review as one diff,
   so that patches 2 to 6 apply to the RFC with the enum fix.
2. Use cached and cache_val[] of usb_mixer_elem_info.
3. Replace INIT_HW, FORCE_SET and CACHE with an access mode:
   read-back, cached or write-only. The tables use only these three
   combinations of the flags. Do you plan to use another combination
   on the EVO4, for example INIT_HW on a control that can be read? If
   so, I will drop this patch.
4. Fill the cache on the first get or put, not at probe. The probe
   then sends 12 fewer GET requests on the EVO4 and 56 fewer on the
   iD14. Is there a reason for the EVO4 to read at probe?
5. Use one get and one put for booleans, integers and enums. This
   changes the code path of the EVO4 controls, which I cannot test.
6. Use the same cache for the FU 12 control.

Patches 2 to 6 make mixer_audient.c about 100 lines shorter (227
insertions, 324 deletions). Only patch 4 is meant to change behaviour.

Each patch builds with W=1 without warnings, and checkpatch --strict
shows no errors or warnings. On the iD14 MkI (stable 7.2.15) the read
and write checks of the controls pass with all six patches, change
events included. In 7.2.15 cached is still an int, so that build used
bit masks in place of the bitmap calls.

If some of these look useful, please take them into your new RFC in
any form you like. I can also fold them into the earlier patches, if
that saves you time.

Thanks,
Will

Will Porter (6):
  ALSA: mixer_audient: Fold in the review changes to patches 12-16
  ALSA: mixer_audient: Use the cache of usb_mixer_elem_info
  ALSA: mixer_audient: Replace three flags with an access mode
  ALSA: mixer_audient: Fill the cache on first use
  ALSA: mixer_audient: Use one get and one put for all control types
  ALSA: mixer_audient: Use the same cache for the iD14 MkI FU 12 control

 sound/usb/mixer_audient.c | 589 ++++++++++++++++----------------------
 sound/usb/mixer_quirks.c  |   2 -
 2 files changed, 251 insertions(+), 340 deletions(-)

-- 
2.47.3

