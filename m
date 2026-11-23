Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795460714;
	b=XUfHv8EwvpF2+es2h8x7s2H/VrxcqL/fE5o/ZrAZepYwYB9sn51zDCUU+CzTsGtWXlUp
	 wXsmVbDIpzhOCVOqk3qY3qQ1tleEkt20e9anYdHY8bYQbYzyptEhIhY6zPjDHwZj/iLR0
	 epK+7pceOylSy7n5uysFb7w8QCQ1zLhOGrHgpTXwZVdG7J2XQen692zfDnClJxg0RET9/
	 /P9HJPcN+/43lvuyy4FfPe4nR9angjkRffDuIKfBcO/GMy24px/imBmbee8rfpyAd5424
	 ejWK3zXyBvxCY3/68eWOIiu4KAVjgexa8+VMik1L2EIQJ4tCTzuzvbFXKQCnRRXLSGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460714;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LwrHxArz75EBMlZwYdEEn39cd59Ttq2A5JJyQ5KoHrw=;
	b=tHgqUbG0VPomD85WjVGGKYsNfdE7sUgpiPKCpyxNx4Bc+HSleaitIOo6mc5XllYiJUt8
	 2Kxkf2S9nzKScbBhB2NDfp5csy1ZnVyR9Z8z6HMjopLo8k3N9myMDsxrafhly6wsICJAZ
	 Bjn4ZvQhBu9NrQ1c+LtIg1fTDsDoqa3fF6Cq+meZXGH1HlrZ4LbmOt01We3y2DJyajb6v
	 j+FwL8fnnxOAzq7N5+23uMKsIWu8pwWQlkml/77o1TUz6P4ioH7yMBXKmCzG8stUXhquW
	 25CxwF7Khj/2JBwpdN6jWtPZV5WdV6XtgTW8aq4vyKc5OTnyfKxz5/EqWAchOflb1JQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UqrBHEv1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D706606A31A;
	Mon, 23 Nov 2026 19:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UqrBHEv1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795460713;
	b=JWPm5Bn9eALFeOm1iOXKJZOFugLtVQoI6Efj6xCuk7mdV0EdRpm2uI3LgfDYf61KQblJ
	 ITndvpesmA9UbelHwA3VMIakGMe4VLOdPBE6lfijPXIpw0j9vSxdOUraKZxNkh7LZQYV9
	 I89qD9dgoDL26NdmNFdzwPxPJd08TAPqFg1EasickvdR6uimVAxyA2DVLZmwIc+pSKJBk
	 +IZWkSKHnBERFU7qSgX6sveR5KJfQQmHyKkITEtOsXbYpPeVnbtHx+ShwfXKlMvMrotsS
	 8DIGOgl8lSPaIDM4VSJJm80E+qYnWuunBlZVIe1fXSDcqR0/GRLC8/VofN+1mt+Txlw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795460713;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LwrHxArz75EBMlZwYdEEn39cd59Ttq2A5JJyQ5KoHrw=;
	b=M+ZdA5exH5rBuA/tVFzpR7OLN4L37jvjOAHQK3IdPoC04bDN0GRbnwx0yUEDnFzIgIKl
	 Vi/Bn/zilUbD88E7MMf3IwFrO3dDu99vbnqtal8lVnjtKcCFY+vTSgi6bMmEsdMgP+35+
	 Wz5EPHmqnfMTZY0Rpb5Qd1Fj5fTVbfi1KZWMs2avm3NsB/eU+LAkv2xDWNNRkTyl2IKna
	 6ddlrUOI1Y1u1h5d/liHucb6xQ5v/ichYlkuqmjfvdN0uzLWOrZEZ6R4E8x02MdRhIY/c
	 VUd0UoGS+IqbZ8keqLUeB1bN9jX2CXXHFx6ORIp5Xx5I1EdfXkILMfIoipw5TKmgAPw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0786C1F000C6;
	Mon, 23 Nov 2026 19:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795460713;
	bh=LwrHxArz75EBMlZwYdEEn39cd59Ttq2A5JJyQ5KoHrw=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=UqrBHEv1+QMdS65qAMT/SSo4VgxWjh/4LlUom1iyzLHlu0l9GYGhU+xyfgPDsSVgH
	 e7+Xzsp1qTBE4K6eyXLUeibId4lUAOLwroGrDotelygSKZj1hysYfutwIRVsxnwHsy
	 7M/cU/E1mj3J8xSuguF9w3QXThsbJWRRX7fSZeDtARZC4WdfMryRbkE7+TsNOIfG7a
	 D1XoK3n+KzCTNH8LexfHZqYCGNtL/7JUfHKhpxpMsJNGPQLQfzDAvs3llXFZV9ewMF
	 /LHEjatql1xFF31imWO6EP9bdCJhhHAOHRAFJ3JgMhmd59nthkw08U8EbIhkzPTO7u
	 4vZAY9/buxkZg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 887E34C5A7;
	Mon, 23 Nov 2026 19:05:05 +0000 (UTC)
From: Lorenzo Argentieri via B4 Relay <devnull+uni.lorenzo.a.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 20:05:05 +0100
Subject: [PATCH] ALSA: hda/realtek: Enable speaker amp on ONEXPLAYER X1 i
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
Message-Id: <20261123-oxp-x1-amp-v1-1-8b61da12d092@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MwQmAMAwF0FXCPxtoIyh2FfEgmmoOamlBCuLug
 m+A96BoNi0I9CDrbcWuE4F8Q1j2+dyUbUUgiJPOe2n5qomr5/lIHKOTQVyrOvRoCClrtPpn4/S
 +H+YFkA9cAAAA
X-Change-ID: 20261123-oxp-x1-amp-ff029203ee97
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lorenzo Argentieri <uni.lorenzo.a@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795460705; l=5648;
 i=uni.lorenzo.a@gmail.com; s=20261123; h=from:subject:message-id;
 bh=p+vj4gtJ8f10edLkmyCCujVv4evAJNe4qqqgUaEN8Po=;
 b=jzIfid0FwYIE/RjC4FARKhdvo3wKbzPkYochhS7oV6AkXPJcWWTCBawfXY8ZczjBepxNS3zL5
 e9vI9dQIEoDDSS9oaQt4GkDAe1HGIiQ5uQO7QckOeCm+qXR3M60hFAI
X-Developer-Key: i=uni.lorenzo.a@gmail.com; a=ed25519;
 pk=b03MEcj4eqHxAtJC+G7tYbx5b58C77y/G5Sd5OgiaY0=
X-Endpoint-Received: by B4 Relay for uni.lorenzo.a@gmail.com/20261123 with
 auth_id=1619
X-Original-From: Lorenzo Argentieri <uni.lorenzo.a@gmail.com>
Reply-To: uni.lorenzo.a@gmail.com
Content-Transfer-Encoding: 7bit

From: Lorenzo Argentieri <uni.lorenzo.a@gmail.com>

The internal speakers of the ONE-NETBOOK ONEXPLAYER X1 i (Intel Core
Ultra 7 155H, ALC245, subsystem ID 1f75:1602) are almost inaudible on
Linux. They are driven by a Realtek smart amplifier at I2C address 0x10,
behind the ALC245 coefficient tunnel. The firmware leaves the amplifier
unconfigured, and the Windows driver programs it at initialization.

Add a fixup that replays the register writes of the Windows driver
through the tunnel: coefficient 0x24 selects the amplifier, 0x25/0x26
hold the register address, 0x28 the value, and writing 0xb023 to 0x29
starts the transfer. Bit 5 of 0x29 is a self-clearing go bit; poll it
instead of using a fixed delay (a write completes in about 200 us).

The sequence was captured from Windows by the onexplayer2pro-audio-fix
project and decoded here. Its reads and address probes were dropped,
leaving 46 amplifier register writes. The fixup runs at every codec
init, so the configuration is restored after system resume.

Tested on ONEXPLAYER X1 i, BIOS 2.42, after a full power-off: a test
tone played through the speakers and recorded by the internal microphone
is about 50 dB louder with this fixup than without it.

Link: https://github.com/feederchain/onexplayer2pro-audio-fix
Signed-off-by: Lorenzo Argentieri <uni.lorenzo.a@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 69 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index a6b5e8987..ca7fcc271 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1909,6 +1909,69 @@ static void alc298_fixup_alc1316_amp(struct hda_codec *codec,
 	}
 }
 
+/*
+ * The ONEXPLAYER X1 i drives its speakers through a Realtek smart amplifier at
+ * I2C address 0x10, reached over the ALC245 coefficient tunnel. The firmware
+ * leaves the amplifier unconfigured, so the speakers stay silent. The register
+ * writes below replay what the Windows driver does at initialization.
+ *
+ * Tunnel layout: coefficient 0x24 selects the amplifier, 0x25 and 0x26 carry
+ * the high and low halves of the register address, 0x28 the value, and 0x29
+ * commits. Bit 5 of the commit word is a self-clearing go bit; a write takes
+ * about 200 us.
+ */
+static void alc245_onexplayer_amp_write(struct hda_codec *codec, u32 reg, u8 val)
+{
+	int i;
+
+	alc_write_coef_idx(codec, 0x24, 0x0010);
+	alc_write_coef_idx(codec, 0x25, reg >> 16);
+	alc_write_coef_idx(codec, 0x26, reg & 0xffff);
+	alc_write_coef_idx(codec, 0x27, 0x0000);
+	alc_write_coef_idx(codec, 0x28, val);
+	alc_write_coef_idx(codec, 0x29, 0xb023);
+
+	for (i = 0; i < 10; i++) {
+		if (!(alc_read_coef_idx(codec, 0x29) & 0x0020))
+			return;
+		usleep_range(100, 200);
+	}
+	codec_warn(codec, "amp write timeout, reg 0x%x\n", reg);
+}
+
+static void alc245_fixup_onexplayer_amp(struct hda_codec *codec,
+					const struct hda_fixup *fix, int action)
+{
+	static const struct {
+		u32 reg;
+		u8 val;
+	} init_seq[] = {
+		{ 0xf10a, 0x09 }, { 0xf104, 0xf6 }, { 0xf105, 0x22 },
+		{ 0xf10b, 0x2c }, { 0xf10b, 0x7c }, { 0xc000, 0x01 },
+		{ 0xf20d, 0x00 }, { 0xf212, 0x3e }, { 0xc001, 0x02 },
+		{ 0xc003, 0x22 }, { 0xc004, 0x44 }, { 0xc005, 0x44 },
+		{ 0xc007, 0x64 }, { 0xc00e, 0xe7 }, { 0xf223, 0x7f },
+		{ 0xf224, 0xdb }, { 0xf225, 0xee }, { 0xf226, 0x3f },
+		{ 0xf227, 0x0f }, { 0xf21a, 0x78 }, { 0xf242, 0x3c },
+		{ 0xc120, 0x40 }, { 0xc125, 0x03 }, { 0xc321, 0x0b },
+		{ 0xc200, 0xd8 }, { 0xc201, 0x27 }, { 0xc202, 0x0f },
+		{ 0xc400, 0x0e }, { 0xc401, 0x43 }, { 0xc402, 0xe0 },
+		{ 0xc403, 0x00 }, { 0xc404, 0x4c }, { 0xc406, 0x40 },
+		{ 0xc407, 0x02 }, { 0xc408, 0x3f }, { 0xc300, 0x01 },
+		{ 0x41001888, 0x00 }, { 0xc121, 0x0b }, { 0xf102, 0x00 },
+		{ 0xf103, 0x00 }, { 0xf104, 0xf5 }, { 0xf105, 0x23 },
+		{ 0xf109, 0x00 }, { 0xf10a, 0x0b }, { 0xf10b, 0x4c },
+		{ 0xf10b, 0x5c },
+	};
+	int i;
+
+	if (action != HDA_FIXUP_ACT_INIT)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(init_seq); i++)
+		alc245_onexplayer_amp_write(codec, init_seq[i].reg, init_seq[i].val);
+}
+
 static void alc298_fixup_samsung_amp(struct hda_codec *codec,
 				     const struct hda_fixup *fix, int action)
 {
@@ -4553,6 +4616,7 @@ enum {
 	ALC256_FIXUP_ASUS_SPEAKER_COEFS,
 	ALC245_FIXUP_MINISFORUM_V3_MIC_NO_PRESENCE,
 	ALC287_FIXUP_TAS2781_I2C_DAC,
+	ALC245_FIXUP_ONEXPLAYER_AMP,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -7472,6 +7536,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC245_FIXUP_BASS_HP_DAC
 	},
+	[ALC245_FIXUP_ONEXPLAYER_AMP] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc245_fixup_onexplayer_amp,
+	},
 };
 
 static const struct hda_quirk alc269_fixup_tbl[] = {
@@ -8750,6 +8818,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1f4c, 0xe001, "Minisforum V3 (SE)",
 		      ALC245_FIXUP_MINISFORUM_V3_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1f66, 0x0105, "Ayaneo Portable Game Player", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x1f75, 0x1602, "ONEXPLAYER X1 i", ALC245_FIXUP_ONEXPLAYER_AMP),
 	SND_PCI_QUIRK(0x2014, 0x800a, "Positivo ARN50", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x2039, 0x0001, "Inspur S14-G1", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x2145, 0x0001, "Star Labs StarFighter", ALC233_FIXUP_STARLABS_STARFIGHTER),

---
base-commit: 11ef0d515100259c7979f5b4c61b6ea97c6cdc27
change-id: 20261123-oxp-x1-amp-ff029203ee97

Best regards,
-- 
Lorenzo Argentieri <uni.lorenzo.a@gmail.com>


