Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794164324;
	b=F0nyWNWHh3jNi02/bmJSuYOFFAWgGF6wz3+2y4gG90u3Rt47bnPtXvv8zoA/Gd2A3Ghr
	 8NT7RH7hK6MreiXyU/wer9gErbFrbgkjPaD5mgpEftI60NqkzOefwFV/p+kYbK6+UUnUz
	 4peaTmufreg3LmCPl8pyG4PN9b46MN/VVC0jYfX0qPkwpvSUwKn42kaxw6cPvM820ObDm
	 Z6e+Ym3dgEQyhIpGOy8QI3BUYQwGD6l7TvEsLqcAR27jM0/7S2TIkLrlD7lLxfIpRirl9
	 5fmFpl3NoSUinS0Da7OMs1xcE+sp76iIksbTy0w8vWAM9A0nkSwuiEMzp0+FsMq7tAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164324;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xRDJd5NYLaOusNVX6Wns1ljKf9BM3JatMBzaJnEexsM=;
	b=WqQ19ySzXsk8QE0/KkuARHsqp4tKv/h/Rzns2qeiuxstrZcK1DAHii47KT8wtNWKKBow
	 n4WDiwTS7V6BqHT0faaD4jyJM6VHZq1zil33dUchm7SmuhXiyMhiyL89dWZwG3k6MjTAo
	 OMp373xUuems7iFNlxPebt5UhE6CtfsSJW+NkcHAvDD2kDByu4VIN+NTjSLoLBDEBI9V1
	 /X/BpMrfLsm3AwfAm16UbZpAorMelpCaqZE+lbnam1PQ0K4bbZJfBRFTfw19h9vLQcxB7
	 TTlGDLrvhCXiLldKgq4palyeIP6TFdDEshthgPLiPeEWQrR3ZiIvUyZqwMBB7ygjFRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PdUINWuQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08269606A31C
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 18:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PdUINWuQ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794164323;
	b=bYFwPup0BIwwRKcWe7Sf17l9T16mj0qLHFlbilvXmPr//gLP7fwJQzOO9sqlrP78NRx3
	 3ptLER+xJqmhtvhH6IQS55KlC2IX+sIaykW9mni3RUC4KLZ3ZUllvzp75qYjms04714Sd
	 MXzeZsLWwbroZY58GPAw9Q9Od8Tlr09za7HpjtlTeXPOggfJzC8KYKnh3gug0RTi5WWFc
	 6SuVc9XBj5KR7B+XvfsQrT5sSjNI+ROLeOtF4F1g0ccq/jLE4Evwmso8huGCQt1K0zBC+
	 cj5W7SOBKKZqmfVc1Zg3EkRCFU4dT53wjRN+BADphn6EUhEoq3WEZZJHSO0zgB8STVA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794164323;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xRDJd5NYLaOusNVX6Wns1ljKf9BM3JatMBzaJnEexsM=;
	b=ad0ZIapMyJ5/C5cWsTXMDOeqJXzFESJoH0DaqBTSiDDtAfMke1fKzoA9o+mFYPx3EOja
	 GHPsyVBeTQ18ehQ6KDZKhXsRfCafRRzDH8tJjRIPWOAQePf1cysX96rl7GkxQCBhmi/Oh
	 eP8OQP4czy1K3RenMUJ9qxoIbqrP+a/783nJPOyOex04IdqJ0XwBzMArxfwBFCeV2Waai
	 NQCorvmmIzQ6c98adrd91+jcHWotJ8X2PLsNjBxO1pX+fXdlnXH7ZrHJOPO0BbVfFZGOP
	 2jgwisghdPmOdf1cPWwBZsz3bSlo13nascGKgKb01JAf8pT0rlv4Vh4sdWiygrgHBZQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E58FF1F008A1;
	Sun,  8 Nov 2026 18:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794164323;
	bh=xRDJd5NYLaOusNVX6Wns1ljKf9BM3JatMBzaJnEexsM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PdUINWuQBavcQ0jqyorw7E6HJI+1kpJyerZrKGHlzjcZ8O4gaRCZGJO73vLWPSM4h
	 /Bz03Fh022bkSgz2ZBj3eklSmLvVs4o4e6aozpkcWaiHorh83HZJcc6ROsYKTPZPic
	 re6hJXKZt1quQCWD0YB+ZBfzwERKUluEDMMiiJsVLrtJtPxKr8NIOyf8B+Y/HRKdAI
	 ETuu+3AuU88C+4SqMmKy1N2SXe+fgiwq6I3q2Ho+0WCKuriGGFFgrgtsm2drg/b9KR
	 axmGHbTswuiGPdigpZ4grF0i24ISjXC8gP+MBzdARVNVL+cG9YcSprSuHqt970+6us
	 eQoQSV7ar75Fg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 629604802C;
	Sun,  8 Nov 2026 18:58:42 +0000 (UTC)
From: Brian Harring via B4 Relay <devnull+ferringb.gmail.com@kernel.org>
Date: Sun, 08 Nov 2026 19:58:37 +0100
Subject: [PATCH 1/2] ALSA: usb-audio: Use ALC4080 mixer map for ASRock
 X870E Taichi
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
Message-Id: <20261108-alc4082-taichi-v1-1-942558088157@gmail.com>
References: <20261108-alc4082-taichi-v1-0-942558088157@gmail.com>
In-Reply-To: <20261108-alc4082-taichi-v1-0-942558088157@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, Brian Harring <ferringb@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1909; i=ferringb@gmail.com;
 h=from:subject:message-id;
 bh=YFJDQUD6ho4yYhVd2+xptui1yDzMTqZ5XF6AawOmfYI=;
 b=owGbwMvMwCW26vPpzMb96zwZT6slMWR9OJb4TGHG8xOXVG9x3T/v/uXhi+nZ9WG5l2tPfa0Jv
 +23aPuTwI6PLAxiXAwzxRRZHnzJeaMQf+ubq9ElF5g5rEwgQ6RFGhiAgIWBLzcxr9RIx0jPVNtQ
 zxDI0DGKh8jpMWhkFheXphbpphUUOeTllySWZObnFevlF6TmFaQX6KVlppVkZOQXFacCjdDLSy1
 xNXAzMXN2dTYyMHVzcXQzMzE1NnIxMjFxdHQzdnYys7QwdHJzdDWxZODiFIC55rMnw/8o2/hc7o
 C4n8vd7rOwh/TZZrofDtqTMldXUHpz0kLNdesZGY68ffNmcdK0n63mVkf8Kg9kT/zmKKc/7WpX9
 o65UTMt/fgB
X-Developer-Key: i=ferringb@gmail.com; a=openpgp;
 fpr=E9C121C8F3E4519A7E8E7E39C5068414B0C044B7
X-Endpoint-Received: by B4 Relay for ferringb@gmail.com/default with
 auth_id=1454
X-Original-From: Brian Harring <ferringb@gmail.com>
Reply-To: ferringb@gmail.com
Content-Transfer-Encoding: 7bit

From: Brian Harring <ferringb@gmail.com>

The ASRock X870E Taichi / Taichi Lite onboard audio (26ce:0a0b, Realtek
ALC4082) has the same problem as the MSI ALC4080 boards already using
this map: all its playback feature units are named "PCM", so the UCM
profile pairs the headphone volume with the rear output's mute. Its
unit IDs match, so use the same map, renamed to alc408x_map now that
it's no longer MSI-only.

Signed-off-by: Brian Harring <ferringb@gmail.com>
---
 sound/usb/mixer_maps.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 9218ca6314ad..15065ee3f363 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -486,8 +486,8 @@ static const struct usbmix_name_map aorus_master_alc1220vb_map[] = {
 	{}
 };
 
-/* MSI MPG X570S Carbon Max Wifi with ALC4080  */
-static const struct usbmix_name_map msi_mpg_x570s_carbon_max_wifi_alc4080_map[] = {
+/* ALC4080/ALC4082 boards with this playback feature unit layout */
+static const struct usbmix_name_map alc408x_map[] = {
 	{ 29, "Speaker Playback" },
 	{ 30, "Front Headphone Playback" },
 	{ 32, "IEC958 Playback" },
@@ -770,15 +770,19 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 	},
 	{	/* MSI MPG X570S Carbon Max Wifi */
 		.id = USB_ID(0x0db0, 0x419c),
-		.map = msi_mpg_x570s_carbon_max_wifi_alc4080_map,
+		.map = alc408x_map,
 	},
 	{	/* MSI MAG X570S Torpedo Max */
 		.id = USB_ID(0x0db0, 0xa073),
-		.map = msi_mpg_x570s_carbon_max_wifi_alc4080_map,
+		.map = alc408x_map,
 	},
 	{	/* MSI MAG B850M MORTAR WIFI */
 		.id = USB_ID(0x0db0, 0xcc78),
-		.map = msi_mpg_x570s_carbon_max_wifi_alc4080_map,
+		.map = alc408x_map,
+	},
+	{	/* ASRock X870E Taichi / Taichi Lite (ALC4082) */
+		.id = USB_ID(0x26ce, 0x0a0b),
+		.map = alc408x_map,
 	},
 	{	/* MSI TRX40 */
 		.id = USB_ID(0x0db0, 0x543d),

-- 
2.56.0


