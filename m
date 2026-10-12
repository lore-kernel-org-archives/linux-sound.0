Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10F5415B8A
	for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 11:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802837; cv=none; b=AG9NavNsCM3MjHO9xeoJx31Qe2RQ3mk0B6YkmbPDW+UFwTkYliN5eJI8IW0thwx+bTanbU+y8ke4SildxkyUWruOsWLnlxE3qcpVepOmGIGMMviMSZ5kxVGtsU25oHvEdXjRGAVrc8mqhL5AFc+zxVuFQY7hJ+osnXa2mxAqocY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802837; c=relaxed/simple;
	bh=CpCCfw7ehhImm9+Ydlxn7JOCqI+BquXQeaZ7KbRFhM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jzWroEq0Cq/Jl2pazBLvQfDmE7CKIwWIOlNpMKcxA0lolQb26b1DTQJY6kHRElFK10axPjVhSoBJHfYOnNO3grpoSTde/YnoQWCOWaAlxmWuKxRc+0pBEDU/KL5Drnycl9o3cGxtUWddbwb6Ll0TVhw4YvYQH9YGAQX0r7Ayj2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goncalom.dev; spf=pass smtp.mailfrom=goncalom.dev; dkim=pass (2048-bit key) header.d=goncalom.dev header.i=@goncalom.dev header.b=a1H9rcXM; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=GklNJ5aY; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goncalom.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goncalom.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goncalom.dev header.i=@goncalom.dev header.b="a1H9rcXM";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="GklNJ5aY"
DKIM-Signature: a=rsa-sha256; b=a1H9rcXM3adQUCTo97lpOBVl4sG1IJ9mMc9ObBDHhEV1JGV5W5bg8EEBS1Q5a+KPm4sPuqZhMazx+w+58QH8gAsrkWevgCcn8Oxnrpq0ZMNEUCGI7RPF9oBWN+oFWo5kMqkhLXYushok2KaxWysaUzJO+2Dc3DOoBVtoYA3+QTiYya/h01Qf5tRRWhsNiLp4nZtwQoMrYmCHMl7eRqNjL1uZWXoQ3hNCfmvRDARXwO5aOEpM4oEHS1+vzOkMxioe7Q1bHppIROGvPDu5lgZYtwyMslUjnaktT9sbDtIbi5YmqyfWhrxWTcXKeVMOWclbFPys8sIeXrQLZVvB1KAYFw==; s=purelymail2; d=goncalom.dev; v=1; bh=CpCCfw7ehhImm9+Ydlxn7JOCqI+BquXQeaZ7KbRFhM8=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=GklNJ5aYw253cLRuc6xn6iKJ3uEswli/8JosEq7GA4FDGdVff72NMfIqqcJZsxW5X2rh/y00XngEpugX6rQJptFaNsxlyX67NNHADBY+WgMc3CcEe63asswv3YkqYPB4LSzY44cXVtHUTgTrMwJ7fT2O4e5BiGw7Wyv9yTJlxFKlrKsvh1Z5VyIPiARPgWuozNHqJt5abS7ndaro4P+CIxuPtGsfCirfborTWs1f0U1hmRJWECJQjk2ufpHNE49/NAbZK1zU+EYYniycIdn6YrjB4bOCPiD4gadrBpk7XOrv2YsXhDVGdT3Xyywdycw80WtZ39JKZSiV14gByCpljA==; s=purelymail2; d=purelymail.com; v=1; bh=CpCCfw7ehhImm9+Ydlxn7JOCqI+BquXQeaZ7KbRFhM8=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 1098697:38908:null:purelymail
X-Pm-Original-To: linux-sound@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 684982422;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 12 Oct 2026 11:00:33 +0000 (UTC)
From: =?UTF-8?q?Gon=C3=A7alo=20Miranda?= <me@goncalom.dev>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	=?UTF-8?q?Gon=C3=A7alo=20Miranda?= <me@goncalom.dev>
Subject: [PATCH v2] ALSA: hda/conexant: Add quirk for Acer Aspire Go 16 mic mute LED
Date: Mon, 12 Oct 2026 12:00:24 +0100
Message-ID: <20261012110024.25310-1-me@goncalom.dev>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail

The Acer Aspire Go 16 (AG16-71P) uses a Conexant SN6180 codec
(subsystem ID 0x1025:0x1937) with the microphone mute LED wired
to GPIO4. Add a quirk entry so the kernel drives the LED in sync
with the microphone mute state.

The fixup reuses the existing cxt_setup_mute_led() helper with
mask 0x10, matching the behavior verified on the hardware.

Changes in v2:
- Moved the quirk entry to the correct position in PCI SSID sort
  order, as requested by Takashi Iwai.

Signed-off-by: Gon=C3=A7alo Miranda <me@goncalom.dev>
---
 sound/hda/codecs/conexant.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 40da2832b..bf0321ba8 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -283,6 +283,7 @@ enum {
 =09CXT_FIXUP_HP_SPECTRE,
 =09CXT_FIXUP_HP_GATE_MIC,
 =09CXT_FIXUP_MUTE_LED_GPIO,
+=09CXT_FIXUP_ACER_ASPIRE_GO_MUTE_LED,
 =09CXT_FIXUP_HP_ELITEONE_OUT_DIS,
 =09CXT_FIXUP_HP_ZBOOK_MUTE_LED,
 =09CXT_FIXUP_HEADSET_MIC,
@@ -786,6 +787,13 @@ static void cxt_fixup_hp_zbook_mute_led(struct hda_cod=
ec *codec,
 =09=09cxt_setup_mute_led(codec, 0x10, 0x20);
 }
=20
+static void cxt_fixup_acer_aspire_go_mute_led(struct hda_codec *codec,
+=09=09=09=09=09      const struct hda_fixup *fix, int action)
+{
+=09if (action =3D=3D HDA_FIXUP_ACT_PRE_PROBE)
+=09=09cxt_setup_mute_led(codec, 0, 0x10);
+}
+
 static void cxt_fixup_hp_a_u(struct hda_codec *codec,
 =09=09=09     const struct hda_fixup *fix, int action)
 {
@@ -985,6 +993,10 @@ static const struct hda_fixup cxt_fixups[] =3D {
 =09=09.type =3D HDA_FIXUP_FUNC,
 =09=09.v.func =3D cxt_fixup_mute_led_gpio,
 =09},
+=09[CXT_FIXUP_ACER_ASPIRE_GO_MUTE_LED] =3D {
+=09=09.type =3D HDA_FIXUP_FUNC,
+=09=09.v.func =3D cxt_fixup_acer_aspire_go_mute_led,
+=09},
 =09[CXT_FIXUP_HP_ELITEONE_OUT_DIS] =3D {
 =09=09.type =3D HDA_FIXUP_FUNC,
 =09=09.v.func =3D cxt_fixup_update_pinctl,
@@ -1083,6 +1095,7 @@ static const struct hda_quirk cxt5066_fixups[] =3D {
 =09SND_PCI_QUIRK(0x1025, 0x054c, "Acer Aspire 3830TG", CXT_FIXUP_ASPIRE_DM=
IC),
 =09SND_PCI_QUIRK(0x1025, 0x054f, "Acer Aspire 4830T", CXT_FIXUP_ASPIRE_DMI=
C),
 =09SND_PCI_QUIRK(0x1025, 0x136d, "Acer Swift SF314", CXT_FIXUP_ACER_SWIFT_=
HP),
+=09SND_PCI_QUIRK(0x1025, 0x1937, "Acer Aspire Go 16", CXT_FIXUP_ACER_ASPIR=
E_GO_MUTE_LED),
 =09SND_PCI_QUIRK(0x103c, 0x8079, "HP EliteBook 840 G3", CXT_FIXUP_HP_DOCK)=
,
 =09SND_PCI_QUIRK(0x103c, 0x807C, "HP EliteBook 820 G3", CXT_FIXUP_HP_DOCK)=
,
 =09SND_PCI_QUIRK(0x103c, 0x80FD, "HP ProBook 640 G2", CXT_FIXUP_HP_DOCK),
--=20
2.56.0

