Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795104516;
	b=N0XycVntjyfuNhsdb76nxKCPVLz3+t+rNJP+qDpYzAoiYCRJg3uP1wCLVABSoakZ7XaD
	 tPEC2/EcRq9E4uWtXP1J9LidayhM1FcyCUxgdOkAoXLipSbVemz52ysRlV/muCtK5lmxU
	 0TfH7SROaInepSEPairF+Qt6wHKbULOtu7/xWbaMcSOvZgqBV3TsCgYOWwDmyphhd+WVs
	 efUW9hpipiAkyXxa00oc/GQWPtd2lT6aZ0s/a1UxOVV2ycCxH9574go8FVE8mUoWl1oHh
	 j4e0Gn2ienGahjwyB5ssJJrvqFC9kk50iYaaTWu/2trg3Ss9CYF5FBmLR7g7PfAo6XQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104516;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=Fd+8j+GErHf0o/bktf+/AUxw3NVz+5Tg+yc2CRLrlKs=;
	b=r3bMqh8Q9BggiVeSsmNrZD5u01uv1QSn3lb7XW9R7NT0Q3uE5UHyZQJgAjPgI5/UpvCu
	 z8qXkr7i6is5uvmcZI1MoS9Z3Bo83HqjoiUiKeMcj1pk5gTj0McvexkQuzLW+POqnnb6b
	 /odKuMR9bjzRgbVwyF0mLrHz7BUnqyy0HmDkyDGOgcOmPG31/29uerIS7ERwd29oNDPll
	 b3oI0mGgxdxzKN8JS/RHTppzGq6Ox3HX/YB4+ztykrmbt82FxmI+FOnaWcYMvuQmub3EE
	 qcql06axtTZBLBj/5hk6IrcTT5drZgk6nciS5LOUljf3pVzQuRKsOtSmbmzLlyK8NMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=afNzsNR8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BA7606A32C
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 16:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=afNzsNR8
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795104516;
	b=MbwncTskhFvqSOgVCkNU7gtkHWpXBC9+r9RTPze34QzBgcgBY/bMH/7u5O+ysC3DMyft
	 YXeah/jcd7PAbP53mWz/P/FA0HSHPkuVIyG8/mqUuwPmlrjDEYtG7EnGD5O1LuKqv0nGq
	 LYgCZqGV7pVtzGvSh1bhB8IEAEA3eeDWJVHrtF9u1SNkJTqC9+wS8Rqy0aHa5JfvM/0Ll
	 Q79SS1NP5S9bVuLql5MS4ZkNy1Imc0qzvKsg056gLBUJ/OvBQfA0wOp/u9VitdvIuBy1I
	 fp4E4S3Z+4NOrTVDCEM8wT4qPE1RvfKqe3PhRRy6I1aOZr4LqDxZHIz+e1GdQFIRTog==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795104516;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Fd+8j+GErHf0o/bktf+/AUxw3NVz+5Tg+yc2CRLrlKs=;
	b=dTVliJ+LuZQG843c2DxOkmjnCExuhmMOjBfRNGX5vcsvG0ArzaIwttGBTAhM/ClvvoGP
	 NVJaygGqge6qQlyAZbJMAnXqJIW0MPeypy860nRXxRUEe5H+T42ppqUfAHvqL63h/Gdy6
	 6IkPxF0ukjC9KW30bkH+nscZloWCteAzsY2da0BHNTVRfqa+Rv+JOUeFnQrKwelMNLnMq
	 9CCJdGRaV9bCOYLA1D6vhtK5+FSWVYPTyZtYMCC5RUOHwnCnKeaJszr0/bbfjpk14wDxi
	 INGB6sZUE5wr7AGS9Y8nED0L0Aq/eaIPgBppKHqa6FwA1/7E1iiT3QUCZXoN47udKag==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AD01E1F000C5;
	Thu, 19 Nov 2026 16:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795104516;
	bh=Fd+8j+GErHf0o/bktf+/AUxw3NVz+5Tg+yc2CRLrlKs=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=afNzsNR8vF4cj6mhmEouUXSbWHYFrJsqVKEsXBcQdZCdTmgpyYr/Kbj1TmeO/w/Yv
	 BttBpqJeITT+P1EXpRkjzqN22SSkVkEHMCrysPH0st0BcKnRMbuh+K/6j5WsiUbVYU
	 FD1SB9RtnEuIw17ZVgjHIj4ij7QfJNcP+4bBS2u16baMF0f9B/9YmK3Jd2uQtU90QT
	 dG7dqtkU/f/W8vRiI73fpJC3acCOteU/JubyUGGVZGU8Pa1eFfTerMRLmaVH6K0TwO
	 Y+G08vLm7FKs56dBqYDyENN1Tba81tQyLbuhviFDD82t0wrJqUcvPed+o5pkQ4F4Rd
	 k7pGGA2Y+i4Bg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0B5EB4B32A;
	Thu, 19 Nov 2026 16:08:35 +0000 (UTC)
From: Brian Harring via B4 Relay <devnull+ferringb.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] ALSA: usb-audio: Mixer quirks for ASRock X870E
 Taichi
Date: Thu, 19 Nov 2026 17:08:17 +0100
Message-Id: <20261119-alc4082-taichi-v2-0-03ad1352f807@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw7CIBBFf6WZtRhAaKkr/8N0gThtx/RhABtN0
 38X6trlSc49d4WAnjDAuVjB40KB5imBPBTgejt1yOieGCSXpRDcMDs4xY1k0ZLridlWVaZudVW
 eENLo6bGl9x68Nj8Or9sDXcyVbPQU4uw/++Misvc3vgjGWa2k1oYbI3R16UZLw9HNIzTbtn0Bv
 R2Byr4AAAA=
X-Change-ID: 20261108-alc4082-taichi-af4789f5763e
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, Brian Harring <ferringb@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2863; i=ferringb@gmail.com;
 h=from:subject:message-id;
 bh=z6tUUulU6XunTD/d4f4XsZ4mbFtZJgNSWiAiriTFi6Y=;
 b=owGbwMvMwCW26vPpzMb96zwZT6slMWT9l2fyv8A9kz3q05tXXvm3RJcyOl7dOJu7esqMgBf/8
 iu47RK2d3xkYRDjYpgppsjy4EvOG4X4W99cjS65wMxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 rgZuJmbOrs5GBqZuLo5uZiamxkYuRiYmjo5uxs5OZpYWhk5ujq4klAxenAMw1gb6MDBOtn4RsdN
 u7YblZ6vG4H89leysVruz6nVn0xGr1i+bXLrsZGTrilx9xY1howyO267jhpuwgwZbLznyL76Y/E
 3EV3bBtEz8A
X-Developer-Key: i=ferringb@gmail.com; a=openpgp;
 fpr=E9C121C8F3E4519A7E8E7E39C5068414B0C044B7
X-Endpoint-Received: by B4 Relay for ferringb@gmail.com/default with
 auth_id=1454
X-Original-From: Brian Harring <ferringb@gmail.com>
Reply-To: ferringb@gmail.com

The ASRock X870E Taichi / Taichi Lite onboard audio (26ce:0a0b, Realtek
ALC4082) has its headphone volume control misassigned to the rear
output, resulting in the rear output being full volume and only
mutable, and the headphones falling back to software control.

Patch 1 uses the existing ALC4080 map to correct the assignment. This is
a fix: the headphones get their actual hardware control, and the rear
output falls back to software.

Patch 2 adds a hardware volume control for the rear output through the
ESS ES9219 DAC behind it.

Validation was against alsa-ucm-conf 1.2.16 and a 7.3.3 kernel. The
resultant changes to the PipeWire sinks are below:

7.3.3:
  SPDIF       HARDWARE HW_MUTE_CTRL DECIBEL_VOLUME LATENCY
  Speaker     HARDWARE HW_MUTE_CTRL HW_VOLUME_CTRL DECIBEL_VOLUME LATENCY
  Headphones  HARDWARE DECIBEL_VOLUME LATENCY

with remap:
  SPDIF       HARDWARE HW_MUTE_CTRL DECIBEL_VOLUME LATENCY
  Speaker     HARDWARE HW_MUTE_CTRL DECIBEL_VOLUME LATENCY
  Headphones  HARDWARE HW_MUTE_CTRL HW_VOLUME_CTRL DECIBEL_VOLUME LATENCY

with remap + ES9219:
  SPDIF       HARDWARE HW_MUTE_CTRL DECIBEL_VOLUME LATENCY
  Speaker     HARDWARE HW_MUTE_CTRL HW_VOLUME_CTRL DECIBEL_VOLUME LATENCY
  Headphones  HARDWARE HW_MUTE_CTRL HW_VOLUME_CTRL DECIBEL_VOLUME LATENCY

---
Changes in v2:

The sashiko issues reported in [1] should be fully addressed, enumerated
below.
- patch 1: sashiko: correct the comment stating the wrong feature unit.
- patch 2: sashiko: update the cache only upon success, and now do it per
  channel.  Channels are now named left/right for clarity.
- patch 2: use FIELD_* functions for the cache.
- Link to v1: https://patch.msgid.link/20261108-alc4082-taichi-v1-0-942558088157@gmail.com

For the usage of FIELD_* functions, I realize that may seem like overkill-
I did this for clarity, and since in probing the driver a bit further,
there is some logic in there related to microphone boosts.  That probably
has relevance to bugs like [2], despite that being ALC4080 specific.

[1] https://lore.kernel.org/linux-sound/sashiko-outbox-203925@kernel.org/
[2] https://bugzilla.kernel.org/show_bug.cgi?id=218913

To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Signed-off-by: Brian Harring <ferringb@gmail.com>

---
Brian Harring (2):
      ALSA: usb-audio: Use ALC4080 mixer map for ASRock X870E Taichi
      ALSA: usb-audio: Add ES9219 speaker volume for ASRock X870E Taichi

 sound/usb/mixer_maps.c   |  14 ++--
 sound/usb/mixer_quirks.c | 177 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 186 insertions(+), 5 deletions(-)
---
base-commit: 94dd534d2eb96ceea4e36f3d3f0651a1abaa9b99
change-id: 20261108-alc4082-taichi-af4789f5763e

Best regards,
--  
Brian Harring <ferringb@gmail.com>


