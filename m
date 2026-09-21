Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AFC4B7A5C
	for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 20:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790024173; cv=none; b=seCh2f3uPUJknHVY8LjHi1YRBi5G1dQCWvrKOENx3ewpq3rKwNlCSD3OLUBQuJwIp5FANlm2tI73EcycrV7lJYWHf4Jpet6stqwqA/pkt7RcF6BXATajENPMNxp4/d9S/D178+loKauaQPxRu2pGjt7NdQjt06EzxxALLoK/cwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790024173; c=relaxed/simple;
	bh=A2hAXDL1yhQpjh3NU4zPA1KPllUHNnj33L7VBoeoxO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EvzNW49Wg+tSQGerX7AwXDuoRJhVvO7X0MapFZ/z5/Uz9yK4UlhfNO5U5oYCByfhjk5cK1LVaLtf62gm7O8HE9/jz6IpVbeekGDshcnJFhe8sBAoY9jnxXC9FE4WwV2z6GdbYCAz+D0Cv4g1zLPRjxZ9mBY9dzvczQPNYRkbB6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sneemgp.com; spf=pass smtp.mailfrom=sneemgp.com; dkim=pass (2048-bit key) header.d=sneemgp.com header.i=@sneemgp.com header.b=vJb9cJWJ; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sneemgp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sneemgp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sneemgp.com header.i=@sneemgp.com header.b="vJb9cJWJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sneemgp.com;
	s=protonmail; t=1790024160; x=1790283360;
	bh=18QEgK0VzxrrBKglg6VLGbU7rW+WGx/zDepPNLTZ7gk=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=vJb9cJWJUY3ViGQUvrKFyrjzJfpZ6XHnQXzRqelYO86Ajvz0HRyqcZtRFPcPkF29V
	 wOn/iidNp67woWAYmBEpmGTtzqjjrr4+3q3k7vcD+53PhjPtpkcvcJCVY0dElj5FYM
	 S1b88SdaVrV+voHq94zd89FiZYLREXPs9fH3zxlWUcqP/LpSAoy9IOI1f3OsNfE6Bx
	 ROZ2HI8UOH4WmeP8hvMbmH+V5k273oCsahxlCElXJbPkCTItL/oXKtsBCurEZ+fa75
	 eUW13EIlw8i07NE91aqPmqPw3FyP7HukhW01BdbjEh8b4lcJOLL+fNdB6wURdlsoII
	 jP7gHwZ0n/qiA==
X-Pm-Submission-Id: 4hpb9V5kkSz1DDs2
From: Hernan Ganzo <gp@sneemgp.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	Hernan Ganzo <gp@sneemgp.com>
Subject: [PATCH] ALSA: hda/realtek: Limit internal mic boost on HP Pavilion 15 (103c:2164)
Date: Mon, 21 Sep 2026 21:55:38 +0100
Message-ID: <20260921205538.41192-1-gp@sneemgp.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Pavilion 15 with the ALC3227 codec (SSID 103c:2164) exposes the full
four-step internal mic boost on pin 0x12: nsteps=3 with stepsize=0x2f, that is
0, 12, 24 and 36 dB. Combined with the ADC capture gain of +30 dB the analogue
cascade reaches 66 dB, and the internal microphone clips on the ambient noise of
a quiet room; the upper two steps are unusable at any useful input level. This
is the defect class ALC269_FIXUP_LIMIT_INT_MIC_BOOST exists for.

The machine matches no SSID quirk and falls through to the pin table, which
selects ALC269_FIXUP_HP_MUTE_LED_MIC1 through a pin signature shared with
several other HP models. Add an SSID entry instead, using
ALC269_FIXUP_LIMIT_INT_MIC_BOOST_MUTE_LED: the existing fixup that applies
alc269_fixup_limit_int_mic_boost() and chains to the same mute LED fixup, as
already done for 103c:218b. The boost becomes 0 or 12 dB and the LED handling is
unchanged.

Tested on the affected machine by selecting the same fixup through the model
string (snd-hda-intel.model), which bypasses the SSID and pin tables, with the
driver confirming the selection:

  snd_hda_codec_alc269 hdaudioC1D0: ALC3227: picked fixup limit-mic-boost (model specified)

With that, Internal Mic Boost reports Limits 0 - 1 (0 or 12 dB) instead of 0 - 3
(0 to 36 dB), so alc269_fixup_limit_int_mic_boost() clamps this codec's internal
mic pin as intended. Note that /proc/asound/card1/codec#0 keeps printing the
unclamped hardware caps (nsteps=0x03): that file reads codec parameters uncached
by design, while the fixup overrides the driver's cached parameter that the
control is built from.

This does not by itself make the default capture volume sane -- the remaining
12 dB on top of the +30 dB ADC gain is still hotter than this machine's usable
operating point. It removes the two unusable steps from the hardware range, which
is what a quirk of this class can do.

Signed-off-by: Hernan Ganzo <gp@sneemgp.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 5127a11..54c2060 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7303,6 +7303,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x164b, "Dell", ALC293_FIXUP_DELL1_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x1586, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC2),
 	SND_PCI_QUIRK(0x103c, 0x18e6, "HP", ALC269_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x2164, "HP Pavilion 15 Notebook PC", ALC269_FIXUP_LIMIT_INT_MIC_BOOST_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x218b, "HP", ALC269_FIXUP_LIMIT_INT_MIC_BOOST_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x21f9, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
 	SND_PCI_QUIRK(0x103c, 0x2210, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
