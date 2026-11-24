Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795555260;
	b=JLWiOkG3vtZk8cVglT/xlFT/0vUiwigYZZS14Du0vVaXckw8NWlVZql0b4ScD0rkgmlY
	 BgiuveKaSVeOM/q6nSa5nggbydDl6z3oKYuAWF7VxAgWLU6uluab2k9UgNyB7IzG3+b33
	 CYMbJnSYleBRPYs1vFiqLo1bO1l1x+AathevvPUT4jrJj6o5uggyAMx4HOOmMYK/WFYxZ
	 Wq43cPcFoktVJB0wAL6GG2Tyao97F606pmJvjNHrxERG7tLpei89SBTOPs5WfoLmooANu
	 wzPV9TabSZrpBw9vFBFudfssaJ7Tw+TgJImJkeVhbH57WkJ7GT1KFOzMgY4TlyVQkhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555260;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CAtKq77gs0BR/Cws+RXFDjTb8Jty3Q6oIejbW8lqGGw=;
	b=kLkHWCBC/oYWflG7EaXSFGrLOCqMowg4+aSjNkF7XS5pMiDIGxyaAFX1O20qbPto1TtP
	 V1suOkm52tP9R1UezRiqpH22NuJdyzy8TnxGI8BtSwseKmQU8OqyEOZAJyQwMn+LCSyo7
	 jJwwwna3HDqB2mTdMjbQYx7/Dw/mjXiQbCkfZOhOa4s5N1UxY+PUG58EATCqzPhkAoc39
	 8I83jEMi6PoRwbztK3jAeEQ/9Txwt9lqqXtMjuic/czwNxkf5SCKn7rfl+WdPQnkBaK/O
	 zaX61PwGL78bCFjcG7mvwei0+/6DCbUYyXd8zS/8MEwzMfa2EsLQIzzQ5bXgEGPFmBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YQ2PYKLE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24230606A31E;
	Tue, 24 Nov 2026 21:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YQ2PYKLE
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795555259;
	b=ZlCJvfkp+VIwiJHkxOFDB0VAOpavU7xbVuSoPKAE8f27dn4cGLP9fcaX9WKEdPnfoJuD
	 YZd/FKQD2Gh9yUk6xRsEH0adK+kaU7Cd6397CHpCN07yzSWrxELUgogfxuCnsWHm5A9qt
	 /dKWmqkXP2FBD8KZF1sNR4mwqpF3Ukxb2oQkCbsZvn5sGLmObJdSOxnyTo41JlwnKIxfU
	 6lPIOIAw+ufdL33yyiwdfD2igSi4sSzmtS+yvDRNcWRnOcm3Nq95M1SLBnbNOrdKd/igH
	 4kVKV+RulEYuiCALc4NCeOyGxO2AK+zDlno4uqfBil72TNnNDFPrmwHz4T3vuGBqz9w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795555259;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CAtKq77gs0BR/Cws+RXFDjTb8Jty3Q6oIejbW8lqGGw=;
	b=jXdzXJjgunu1CELCYDS74jKiNhvBlaYrpdr9iHmtDf2KcO4TqUTeVzGYIissqaCSOgQw
	 A9/0EH0iUHZukD4PYvpRLAUNL7u42K8cLEDf8MsKAbqnX+Y8YA3Th3/UCruVUlL7jbMjf
	 V5XefveAaQR45GfmpiFwKt3L9XjPSOaDzjEesEAqcsmTYdxY/hq3vgAUqwxJwGF9Jl/5s
	 tP+Q5VtnHDE/Ktsre2Yn/SZyNMvaO2ShnmyfbCfIOjT7OEDy8iDhgwWc5ty2ze9/M/2k1
	 w7C6O30HHUNR8cmKHC08732TLDScrxB57PeHhIdYJ0hc6KfUR7hnI4kEpAqnBDC3zkQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C8E9D1F000C4;
	Tue, 24 Nov 2026 21:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795555259;
	bh=CAtKq77gs0BR/Cws+RXFDjTb8Jty3Q6oIejbW8lqGGw=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=YQ2PYKLEoPgUCSPZs6gnv29HsqW86+mcE/EFw0rtDWnOyh9odhcVXyv5Gwd4GO9yj
	 80dP7q2LHs5z9tJIcFrlatNRItDGMBc6x/iy3Kuto0ZkEFaKAIOsKoprlU7ugAwE0g
	 G8k95aqAiqR0SfV2eHeyFzG5ovrWG5PRsGHufD1Luk/fw+2CrynpLsCy3bqIQ3Stsv
	 R+ZQa20u+ZR1p3hoZXiBAEioxUsNr6IYCD/100UWFlZ5mrlB7hcgKOS9gRtfsXHNlO
	 VWFFqmj5vpKM5sxHoAZ++ntYt3EOavLVNiZeyPZhhPo7n37PB6lY59kSvV6m0mj6A+
	 G4NnMidOtpcZQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2E09E4CBAD;
	Tue, 24 Nov 2026 21:20:56 +0000 (UTC)
From: Dennis Rijsdijk via B4 Relay <devnull+hello.dennis.gg@kernel.org>
Date: Tue, 24 Nov 2026 22:20:43 +0100
Subject: [PATCH] ALSA: usb-audio: Add generic implicit feedback quirk for
 Elgato Wave:3
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
Message-Id: <20261124-b4-implicit-fb-v1-1-99c0526a01f0@dennis.gg>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrE2iDYKriIW2U0b8pUUk4u6K5
 bd47wJPjslDFV3g6GDPyxwg4gh0384dIZtgkInMhZApqhR5WkfWvKFVaE3ZmqRQNjMEIVodWT6
 /Yd389rsaSG/vBe77AQvbFslyAAAA
X-Change-ID: 20261124-b4-implicit-fb-fd9ad08bf5de
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dennis Rijsdijk <hello@dennis.gg>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795555255; l=3251;
 i=hello@dennis.gg; s=20261124; h=from:subject:message-id;
 bh=CzYUiFQBTbT9Wdib/6UNKHXDgSKzREc3eNWxs3jvMew=;
 b=DbonznYWejqOtUOztk3MIPT4LAC+q7AltktqxAfi3MCSaeBL99sZx5Y9WcajOEkxaar4VC5fW
 qyPiAOczWkUAcVDc7cxy8SkrZJzjpTzhl10IF0SUlea4Cu4C3zCSIGh
X-Developer-Key: i=hello@dennis.gg; a=ed25519;
 pk=/uxm3Y6aevSpcZaCD38mlhmVoNlmJW2YgX3OS0SRGuM=
X-Endpoint-Received: by B4 Relay for hello@dennis.gg/20261124 with
 auth_id=1632
X-Original-From: Dennis Rijsdijk <hello@dennis.gg>
Reply-To: hello@dennis.gg
Content-Transfer-Encoding: 7bit

From: Dennis Rijsdijk <hello@dennis.gg>

The Elgato Wave:3 (0fd9:0070) records digital silence from its
microphone when capture is started while playback to its headphone
jack is already running. Starting capture first works. With PipeWire
this makes the microphone go silent when an application starts
recording while audio is playing.

The Elgato XLR Dock had the same problem and was fixed by enforcing the
generic implicit feedback mode. The same flag fixes the Wave:3: with it,
capture returns audio in both start orders. One case remains at 96 kHz,
which the device advertises but Elgato's specifications do not list
(only 48 kHz): when playback starts first right after the device ran at
48 kHz, capture is still occasionally silent (2 of 10 tries, against
every try without the flag). At a steady rate, and at 48 kHz in all
cases tried, it did not happen.

Add a quirk entry for the device.

The patch and this description were prepared with an AI coding
assistant (Claude Code, Claude Opus 5.5); I reproduced the problem and
tested the fix on the device.

Link: https://lore.kernel.org/all/CAOUQ8cqoTYm-0xeh1jk6bPo7Qd81+rFBz+my-ByMudzZ_6E0wQ@mail.gmail.com/
Signed-off-by: Dennis Rijsdijk <hello@dennis.gg>
---
Tested on v7.4-rc4 with the stock driver and
quirk_flags=0fd9:0070:generic_implicit_fb (same effect as this entry),
Wave:3 firmware bcdDevice 1.24. Silence below means all-zero samples.

- aplay/arecord on hw: directly, playback started first:
  - 48 kHz: silent every time without the flag; with it, 0 silent in 60+
    starts, also right after the device ran at 96 kHz.
  - 96 kHz: silent without the flag; with it, 0 silent in 30 starts at a
    steady rate, but 2 of 10 silent when a 48 kHz stream ran just before
    (and 4 of 23 in runs where WirePlumber reopened the device at 48 kHz
    in between).
  - Capture-first, and stopping/restarting playback during capture, had
    audio throughout at both rates.
- PipeWire 1.6.10: capture started while music played had audio in 6/6
  tries at 48 kHz and 8/8 with the clock forced to 96 kHz (it was silent
  every time before), and after a WirePlumber restart.
- No audible glitches on the headphones during listening sessions.

Unrelated to this patch, also without the flag: at 96 kHz the first
~12 ms of a capture that starts the endpoint are full-scale noise; this
does not happen at 48 kHz.
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index bcc93e50b..bd00db820 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2684,6 +2684,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_FIXED_RATE),
 	DEVICE_FLG(0x0fd9, 0x0008, /* Hauppauge HVR-950Q */
 		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
+	DEVICE_FLG(0x0fd9, 0x0070, /* Elgato Wave:3 */
+		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x0fd9, 0x00a6, /* Elgato XLR Dock */
 		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x1038, 0x1294, /* SteelSeries Arctis Pro Wireless */

---
base-commit: c3c132d63840093a3ca4bd09e7434614c1bd07e3
change-id: 20261124-b4-implicit-fb-fd9ad08bf5de

Best regards,
--  
Dennis Rijsdijk <hello@dennis.gg>


