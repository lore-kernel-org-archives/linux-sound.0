Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6BC13DBA0;
	Sun, 15 Mar 2026 10:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773570010; cv=none; b=UyCP7Dta7/+/UbGl9/xfPaxVwZHK8heFwxjOvf81eYYhR0wL9MkAD8ZDmK12gLGizlbvKyL4298/YkZUHAhF3wdzxYXg3wgPEZoF6ijNzyYcEIdpVq4NAHSxdZ5ogwcUIQaf9QgxPWNKDRKN8Sxz04mhcCKoWzSmPqnhHKK6nZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773570010; c=relaxed/simple;
	bh=XjLwXxc5WEaImPpGK2Wx0lC6UiXCApXmlQW7xJZ+C1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LFndc0ORUJjADTJtgMntG2i4yNjrcN5j9Rvhsg4zwfQUZi6PDPIQu46s0LfeVKMtJy240ci8d3QA0MgNpJ+E9M35OzjHvv0n4gYX4Yo2aal2BSZLqsZE51cFuUzi2k9/sgZ9EJWAZdy1d0P8yioZ2jPH6j0+s6JxzZjBuavt/N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jaytek.org; spf=pass smtp.mailfrom=jaytek.org; dkim=pass (2048-bit key) header.d=jaytek.org header.i=@jaytek.org header.b=41j2+RYe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GcgW+FGN; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jaytek.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaytek.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jaytek.org header.i=@jaytek.org header.b="41j2+RYe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GcgW+FGN"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9B9D87A00B6;
	Sun, 15 Mar 2026 06:20:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 15 Mar 2026 06:20:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaytek.org; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1773570007; x=1773656407; bh=b2QXvXAl/bqYQMLMJ/Sak
	h9qTpYvjN9nJK2zydGWfJM=; b=41j2+RYexRPKnYU83pQt9VSpn7ElTDg1pbkLc
	SeKjxM3XL1Nh74LPwux1KQpluwzOoSh0+QCLs3bhifkTvYUO/bTJUY+tUDg2BhPm
	g+MqyAtjesqmbzKP99/94JP4fKsWvWfSB0YqPXjLUniGigbTRZPgRzi90p7WnSyQ
	72//Yc5DtvxyPriUxJ5taGN5uysBPnjev3p4nHXosSfhCY1s14N0vxn9Di2sb8vq
	92CZFu0N5//UNJL+4Up7GqIZhB2ghrOto59fUFrkS/sMaZu5/7j4jiPbgyLhbDow
	tfGi1pmpdgvr8bAKuaJmX5/h2rNx8VO5kG+5vdulF0aHeAiog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1773570007; x=1773656407; bh=b2QXvXAl/bqYQMLMJ/Sakh9qTpYvjN9nJK2
	zydGWfJM=; b=GcgW+FGNS1BBuGCOHjgYi0arJ0mFrj7hrt8SrKuUoIQINY3kd+n
	5sAx9Dq2DmlVgdhA+piVAY+HF8ej37dICGp2JFMDIpEu57oA5EhIxL2GL5dA/7CG
	6AByxSsvD7gXskgWzodJ8p+bRE3FDrKGgjk8jVlZAnuwFHO4V+aU2SoADavjt7mA
	ojGg8lporWw1bfz07X7v1/kkuc2s4dK4e4ALHBbkFmBBJl+mXhU8WEAVxf38AdhX
	Ic0HNrg0BTkA09lqOmoRXJ5myGoaWLEZpV/gp3lP6tdEFbEMeF7xDnQEakQdRtNV
	3fJP80rzASxrgZRdmKIYqfNB27kJ3CCRsBQ==
X-ME-Sender: <xms:1oe2abdt03PxfGhe0pW4SlU3lwbC4ViUOTscFbh7jo5WM3zGzqRk9A>
    <xme:1oe2aStL7aGWImTUr_ehxygSi63OmPLpI2an0_pPg102edHaRFOxOQLUWFdesIQ_q
    sC9KBjH7-WTzBsPQJk1Japvo8i9uaqlU3f3onhXUGYw8fWiiI1HNsA0>
X-ME-Received: <xmr:1oe2aUlgS-5bZa1V-kLHam05VwRY2_GbNVL9FaDVGOSDZm5tU3Kbyt2lfAo9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvleehvddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeflrghmvghsucghrghstghhsghishgthhcuoehjrghmvghssehjrgih
    thgvkhdrohhrgheqnecuggftrfgrthhtvghrnhepveejjeetkeelgefffeekveefvdethf
    ehfedvheehfeehteeuieffgfeutdduffehnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepjhgrmhgvshesjhgrhihtvghkrdhorhhgpdhnsggprh
    gtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehpvghrvgigsehp
    vghrvgigrdgtiidprhgtphhtthhopehtihifrghisehsuhhsvgdrtghomhdprhgtphhtth
    hopehlihhnuhigqdhsohhunhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepjhgrmhgvshesjhgrhihtvghkrdhorhhg
X-ME-Proxy: <xmx:1oe2aczu4UNb6gl-8prjyD6n_TY1HkwZ6Y2S2fXbEPZt41B0ek6eig>
    <xmx:1oe2aeM8B0YuTCdb5wEwzcjAOQXG5PiZOa9tx3PtGDlS4st6kpvQzQ>
    <xmx:1oe2aQogfkSklnanY3Aoui7qSHKyGnfDdWVNAYupbVnrhFjFGNyvWw>
    <xmx:1oe2afH6d_jKvXvHT3NNgeO4Q3nRAayCbbEPK5rv6E12EvY_ZCIbbQ>
    <xmx:14e2abqCr2nVEZly-5O24-1FUOk_voMtEFUh7TmOI7TSEnQz0MJvaEoE>
Feedback-ID: i7b2e480f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 15 Mar 2026 06:20:05 -0400 (EDT)
From: James Waschbisch <james@jaytek.org>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	james@jaytek.org
Subject: [PATCH] ALSA: hda/realtek: Enable rear line-out pins on MSI EC79 (ALCS1200A)
Date: Sun, 15 Mar 2026 05:19:50 -0500
Message-ID: <20260315101950.130380-1-james@jaytek.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On MSI systems with subsystem ID 1462:ec79 using the Realtek ALCS1200A
codec, the rear line-out pins (0x14, 0x15, 0x16) are parsed as line
outputs but do not come up with active pin widget control after boot.
This leaves analog output on the rear jacks unavailable until userspace
manually reprograms the codec.

Add a board-specific fixup that disables line-out/speaker automute and
forces pins 0x14, 0x15, and 0x16 to PIN_OUT during HDA_FIXUP_ACT_INIT,
while also clearing the output amp mute on those nodes.

Tested-on: MSI X570 Gaming Pro WiFi (1462:ec79, ALCS1200A)

Signed-off-by: James Waschbisch <james@jaytek.org>
---
 sound/hda/codecs/realtek/alc882.c | 38 +++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc882.c b/sound/hda/codecs/realtek/alc882.c
index 529fecd5b..2bf266a25 100644
--- a/sound/hda/codecs/realtek/alc882.c
+++ b/sound/hda/codecs/realtek/alc882.c
@@ -60,6 +60,7 @@ enum {
 	ALC887_FIXUP_ASUS_AUDIO,
 	ALC887_FIXUP_ASUS_HMIC,
 	ALCS1200A_FIXUP_MIC_VREF,
+	ALCS1200A_FIXUP_MSI_EC79,
 	ALC888VD_FIXUP_MIC_100VREF,
 };
 
@@ -261,6 +262,36 @@ static void alc887_fixup_asus_jack(struct hda_codec *codec,
 	spec->gen.hp_automute_hook = alc887_asus_hp_automute_hook;
 }
 
+static void alcs1200a_fixup_msi_ec79(struct hda_codec *codec,
+				     const struct hda_fixup *fix, int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+		spec->gen.automute_lo = 0;
+		spec->gen.automute_speaker = 0;
+		return;
+	}
+
+	if (action != HDA_FIXUP_ACT_INIT)
+		return;
+
+	/* Front / Surround / CLFE line-out pins */
+	snd_hda_set_pin_ctl(codec, 0x14, PIN_OUT);
+	snd_hda_set_pin_ctl(codec, 0x15, PIN_OUT);
+	snd_hda_set_pin_ctl(codec, 0x16, PIN_OUT);
+
+	/* Unmute both output amp channels on all three pins */
+	snd_hda_codec_amp_update(codec, 0x14, 0, HDA_OUTPUT, 0, 0x80, 0);
+	snd_hda_codec_amp_update(codec, 0x14, 1, HDA_OUTPUT, 0, 0x80, 0);
+
+	snd_hda_codec_amp_update(codec, 0x15, 0, HDA_OUTPUT, 0, 0x80, 0);
+	snd_hda_codec_amp_update(codec, 0x15, 1, HDA_OUTPUT, 0, 0x80, 0);
+
+	snd_hda_codec_amp_update(codec, 0x16, 0, HDA_OUTPUT, 0, 0x80, 0);
+	snd_hda_codec_amp_update(codec, 0x16, 1, HDA_OUTPUT, 0, 0x80, 0);
+}
+
 static const struct hda_fixup alc882_fixups[] = {
 	[ALC882_FIXUP_ABIT_AW9D_MAX] = {
 		.type = HDA_FIXUP_PINS,
@@ -553,6 +584,12 @@ static const struct hda_fixup alc882_fixups[] = {
 			{}
 		}
 	},
+	[ALCS1200A_FIXUP_MSI_EC79] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alcs1200a_fixup_msi_ec79,
+		.chained = true,
+		.chain_id = ALCS1200A_FIXUP_MIC_VREF,
+	},
 	[ALC888VD_FIXUP_MIC_100VREF] = {
 		.type = HDA_FIXUP_PINCTLS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -636,6 +673,7 @@ static const struct hda_quirk alc882_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1458, 0xa0cd, "Gigabyte X570 Aorus Master", ALC1220_FIXUP_GB_X570),
 	SND_PCI_QUIRK(0x1458, 0xa0ce, "Gigabyte X570 Aorus Xtreme", ALC1220_FIXUP_GB_X570),
 	SND_PCI_QUIRK(0x1458, 0xa0d5, "Gigabyte X570S Aorus Master", ALC1220_FIXUP_GB_X570),
+	SND_PCI_QUIRK(0x1462, 0xec79, "MSI ALCS1200A", ALCS1200A_FIXUP_MSI_EC79),
 	SND_PCI_QUIRK(0x1462, 0x11f7, "MSI-GE63", ALC1220_FIXUP_CLEVO_P950),
 	SND_PCI_QUIRK(0x1462, 0x1228, "MSI-GP63", ALC1220_FIXUP_CLEVO_P950),
 	SND_PCI_QUIRK(0x1462, 0x1229, "MSI-GP73", ALC1220_FIXUP_CLEVO_P950),
-- 
2.53.0

