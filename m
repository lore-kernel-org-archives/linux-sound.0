Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794164324;
	b=sPdVTS0j53Y20CIxAP2k/eLKQLGvxpRWW3VMRT7ZSmuXAHxOhR2mJcxBtetD3mkynEuF
	 vTKT7HRJbObPVuN7lwy4gFw+kc34Vq+Q4xlmhyWVLEn3mnAhjKZuSi43PDIVZvgCwxpRA
	 4yonTv/LT+rnPcjDHrRfMoBIjifT1AuxWyjyx8p9sBuXkMSU0g96RCG50nEFKpu7N6kzn
	 2UHrJV9KuDKm8qW8oSGY+fq8IY/hizASDrcc8h/TQvrSRAuAnh6BpSRE595jjxHeuvgnF
	 1CePlC+MtgBBW04USUeDOVKxfFzIw0RVSpYXnBtZFM92uGXhwmOhq6IMQyUquIE75Uw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164324;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=fldGJEceihg6AajnQqeNttt+oLLVlnev2nnBr/7bsms=;
	b=sq9ce8QQ4nfp+O/h2s615jiv2lrH/l1YQiOkZ6WXy/BOUn0JCNhaBv4Zt6k+Kd8Mvjao
	 A173VE4IdpQXeyseXhXgnBjZp3dGFuIp4GGtmASONHhmMdYHB+7BctOCJPwGTvT/43xB/
	 Y+Hvwtnw1+i0kxuECUmrhcrUEe0l5IohZn/oeP5AwwDnrucXcY1oSJY3Dt6CSE8DZXKnl
	 4sGMiKn+NgQlh5guNheJgwkuWcGuixfIGWIcrDtapGOQf6U3d+cAWz8CcjJGScWdo6qZK
	 xse+lhwRBRlHNw8EkHTS0loEUJic0YshKBqD3yY6rBnZmdSGw2z0CaBAT5S1YVAuSyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aMjANRmA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0831C606A320
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 18:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aMjANRmA
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794164323;
	b=osmm6Xf95MwxCCdNzgY0yHNXNmLX6sjhtlel75yotG0N8yF3TigOyCfjkYKTsxLs9rOt
	 nZmD9kwC8Ea+X6iE+WA8ULSL4Nhl7szBCc52YyU6ez2XUvncIqWSl7xN3rsDDoUA34JwX
	 Y22uIe++pz/4kD30PKD2XMburS42psQMkqFilxOW8Vx2EXguFd7X6uta1ZLXimxezM/aV
	 bjAQbwySL6XTtBcWsvAUS4cgN2Yix+ElVV/KOhDzufP3b5x+ep1Pu1ASG+WdQaQc0vBY0
	 ZFj4Uszb5nX4dOm2zmqjKa53hRTc2a/0/Frx+FbfcK6fiX41lj14Rbz3liLIO/roSYg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794164323;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=fldGJEceihg6AajnQqeNttt+oLLVlnev2nnBr/7bsms=;
	b=TuwLJla40yYsdQDyW5zIzaXLAAFcm7fj4NjPPQO9yREGvkhCyInnQHcw6Bg6xOdYQTfV
	 xGfxL/ynw2+MXxQ0+q8taJlSqKp5q3lcf/g0XLFrx/U4uL8+H1UZeURktn9MiSoi8Ak5X
	 x6+LaOiHbRQyWFuxWhjMDpmDRWLcsPmLOfC73AlZQYQ/isT8nwimcOOH6NKPluLQt1swm
	 brreY/d4J9re6HTip35Po20UhoIPoYue3KjSbcEAwVo8B/TcCbPhMJqsyKHrpbk10Bf8Z
	 svUgqfRihv4RdWhr1fwmS4FUQMLXbR/y/zy6BRBsj6wFZHdWzgZRUNgKjJxI1SdbtvQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E58AE1F0089F;
	Sun,  8 Nov 2026 18:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794164323;
	bh=fldGJEceihg6AajnQqeNttt+oLLVlnev2nnBr/7bsms=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=aMjANRmAf7WTg/SiyZTspJYVwFGW9pFBJSkGp+QmEoiwvPM0JY1RHXsUfi1YAFy2V
	 ehCLwbyJPln+gdf7EC4DPXuECPPuIJIM6jxGoGNRo9lyhD4gd8ti9NgFnRs5ZRZM8z
	 Hj1SckLy0I8V6HtAB/KQU/CTtFxck16PHmTU6Vao0qJ70sm4v+9sih45vF56itMJFn
	 U+Rlcmg4X39mz3yJzsaavLGLI+ZJqGhP/xKwg8dgNvEtOtyE54cHSW+Q4nlA8HasQI
	 fKgMNSaS4XBQPXtt9qdrRnarWlecMh28Rb9YRWKH7Xb5qDM/2yb+Je+D4nLk5VDo3e
	 SG8Dnx26/uOuQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 47C1248037;
	Sun,  8 Nov 2026 18:58:42 +0000 (UTC)
From: Brian Harring via B4 Relay <devnull+ferringb.gmail.com@kernel.org>
Subject: [PATCH 0/2] Subject: [PATCH 0/2] ALSA: usb-audio: Mixer quirks for
 ASRock X870E Taichi
Date: Sun, 08 Nov 2026 19:58:36 +0100
Message-Id: <20261108-alc4082-taichi-v1-0-942558088157@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDVp669cRSyqpowI0iIScXfF8
 lu8d4FHR+ihii5weJCnZQ4QcQRm0HOPjLpgkFzmQnDF9GRSriTbNJmBmLZpoUqbFXmCEKLVoaX
 zG9bNb7+3I5rtvcB9P563ci5yAAAA
X-Change-ID: 20261108-alc4082-taichi-af4789f5763e
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, Brian Harring <ferringb@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1872; i=ferringb@gmail.com;
 h=from:subject:message-id;
 bh=vrFXkHUybNoqbXxYoKxBLOsUmPlm1G96lF/xP/jdz/U=;
 b=owGbwMvMwCW26vPpzMb96zwZT6slMWR9OJaYfIRj5rKe2oOi+5ruWijVbJJ9dWvaTdeE7g9F+
 3WtmJ/ZdHxkYRDjYpgppsjy4EvOG4X4W99cjS65wMxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 rgZuJmbOrs5GBqZuLo5uZiamxkYuRiYmjo5uxs5OZpYWhk5ujq4klAxenAMw1C00Y/hcqHnQzFl
 U4M/uDeUza/WzP50vvblvc8SzgkppnmXTUw0RGhsXxYosCyzc5Vb+aFx6hN+2ZyG+PgzFm9uENk
 2Ya8ySd5QUA
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

Signed-off-by: Brian Harring <ferringb@gmail.com>
---
Brian Harring (2):
      ALSA: usb-audio: Use ALC4080 mixer map for ASRock X870E Taichi
      ALSA: usb-audio: Add ES9219 speaker volume for ASRock X870E Taichi

 sound/usb/mixer_maps.c   |  14 +++--
 sound/usb/mixer_quirks.c | 157 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 166 insertions(+), 5 deletions(-)
---
base-commit: 94dd534d2eb96ceea4e36f3d3f0651a1abaa9b99
change-id: 20261108-alc4082-taichi-af4789f5763e

Best regards,
--  
Brian Harring <ferringb@gmail.com>


