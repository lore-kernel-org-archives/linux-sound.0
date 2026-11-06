Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=103.117.158.92
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793960638;
	b=meid87NQgW91VYdPZA3FzjLQERI2ctLPZKldfNJNX2AV+mG8hUs1UG+TUwJ2a1r8gZ11
	 nDOUJBxUwQqIHVxE5d2tXgUV0ZVKF/f+OnndWIhoX+rMjeF65xvB/ZfZOuA7JMyS0wZpX
	 ymq+9jK2TFrBKMWcXkgiQTx19yShJiC/R13K31AdTIsOo8s9EAVfh/n16Dlnn/P8ZP1u+
	 9uDRXmw/QZ/bHMXtup9oIHIH4noHthv42KrnpO28qVanAJ2REHWFOW6d7nkzySScow7ed
	 aizNLnDCtXpSnwN6LDjofqJm3WU56t0dHDWNeC7hqSn/xBhvGb4jpzdbXLK4UHwnHEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960638;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version:
	 X-ZohoMailClient;
	bh=Y2Zdq7IXq96MJVt43cwcd4HttRVEJbNMfpGilaVz3f8=;
	b=URZmqdqmPuILA+7YZ6tz/6ZsI/QvVPj3FOu8LjRx9eyZwFSnf9dhJm/zWejmvkVGJ0dB
	 tlAA9pj3kwpGZKc41MORskCT+hGSCdhrHI3nQ2zm1Y6YWpqnEAQy0TIF7Vd8GmQREXh0B
	 1X8qXuCaVfB+dbEbsGdvuEDm86BoWkcQ83rmIm5wD20FG8Q3cuadSCJoPeVz6Qo9K9/uV
	 s/2YcX9aAeVim9ZZghtN94kH0IDYbMDZP6vXB+yMTdXq+nZqhDyjzQ/RlCBKkiSO04Ncc
	 K6QIgwZFFp6BaRpFJa3SeMkpcbcujxpr6vxrd4mY06uXfXG+no50CaXKWih+V93wc6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zohomail.in;
	spf=pass smtp.mailfrom=zohomail.in;
	dkim=pass header.d=zohomail.in header.i=@zohomail.in header.a=rsa-sha256 header.s=zoho header.b=NQXk7Zz5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=103.117.158.92
Received: from sender-pp-o92.zoho.in (sender-pp-o92.zoho.in [103.117.158.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BD0606A32C
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 10:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43BD0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zohomail.in header.i=@zohomail.in header.a=rsa-sha256 header.s=zoho header.b=NQXk7Zz5
ARC-Seal: i=1; a=rsa-sha256; t=1793960632; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=QZmZE8f/Q+ZpaTwn4v1ANgkqPpwhHWEQnHB6acKYVuqVfVjhzUoNaMvGUex/bdffr0dapCVqXsvWd0B9U3Yf3yvOju+Rz4rCkdz68NJZqcTYHRiwnJR1TKUIMab199YVMXZnt0kmznzFV2E8T+AAPdkWbodDTQ2u3eF0Gk9ax60=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1793960632; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Y2Zdq7IXq96MJVt43cwcd4HttRVEJbNMfpGilaVz3f8=; 
	b=K0wLIh5mM/n/urEyoOGriNWBxSQt/NLO4J0rDrhHJuygR5rA+K7NQ3+HhbMd1O/Tc0BlgqtwmwRcHMHMT2u2VcdkX2U5409ELV9FTM7Y2V0OkQTuhR9pv0WQFWtcOeWc9+w40PtrtThBWa9RD6sg3bxgpK7/CAYKUPI8wvuXZ4w=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=devajuice@zohomail.in;
	dmarc=pass header.from=<devajuice@zohomail.in>
DKIM-Signature: a=rsa-sha256; b=NQXk7Zz5ax3Z/EVoLOsMuR5GPxCJHJq4Y+LBTakxdlBAjgY51O+eW4/tuZ20Rol7TD1Sl3T0vbRrCWz7wHEv8zYO+eP1p6bFO8aCUucr6x3I3hzAaJfDqCJS9ClUYaLu1csQ+3IoyCmA/9fdlZICtYDxM9FM5eez3AcD1Krl3w8=; c=relaxed/relaxed; s=zoho; d=zohomail.in; v=1; bh=Y2Zdq7IXq96MJVt43cwcd4HttRVEJbNMfpGilaVz3f8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.in with SMTPS id 1793960631205417.380679251301;
	Fri, 6 Nov 2026 15:53:51 +0530 (IST)
From: Devajith Jijush <devajuice@zohomail.in>
To: linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: hda/conexant: Add quirk for Acer TravelLite TL05-41M
Date: Fri, 06 Nov 2026 15:53:45 +0530
Message-ID: <179396062556.127350.15308705935335598574@zohomail.in>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ZohoMailClient: External

The Acer TravelLite TL05-41M (subsystem 0x1558a600) uses a Conexant
CX11880 codec whose analog output amplifier is enabled by codec GPIO
bit 1.  The driver has no quirk for this machine, so the line is never
raised and both the internal speakers and the 3.5 mm combo jack stay
silent, while the microphone on the same jack, USB and Bluetooth audio
work normally.

Add a fixup that sets GPIO bit 1 on this subsystem ID.  It is applied
from the HDA_FIXUP_ACT_INIT hook, since the codec loses the GPIO state
on a power transition and the line would otherwise stay off after the
first runtime power save.

Note that the existing CXT_FIXUP_GPIO1 fixup raises GPIO bit 0, which
has no effect on this board.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222238
Signed-off-by: Devajith Jijush <devajuice@zohomail.in>
---
Note for reviewers: the GPIO behaviour was verified on the affected
machine with hda-verb; I have not built a kernel with this patch, so the
code path itself is untested.  Setting the same three GPIO bits from
userspace makes both the internal speakers and the headphone jack work.

 sound/hda/codecs/conexant.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index a141c94..623e466 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -289,6 +289,7 @@ enum {
 	CXT_FIXUP_HEADPHONE_MIC_PIN,
 	CXT_FIXUP_HEADPHONE_MIC,
 	CXT_FIXUP_GPIO1,
+	CXT_FIXUP_AMP_GPIO1,
 	CXT_FIXUP_ASPIRE_DMIC,
 	CXT_FIXUP_THINKPAD_ACPI,
 	CXT_FIXUP_LENOVO_XPAD_ACPI,
@@ -826,6 +827,17 @@ static void cxt_fixup_hp_a_u(struct hda_codec *codec,
 		cxt_setup_gpio_unmute(codec, 0x2);
 }
 
+/* Acer TravelLite TL05-41M: the analog output amplifier is enabled by
+ * codec GPIO bit 1.  The codec loses the GPIO state on a power
+ * transition, so this must be applied on every init, not only at probe.
+ */
+static void cxt_fixup_amp_gpio1(struct hda_codec *codec,
+				const struct hda_fixup *fix, int action)
+{
+	if (action == HDA_FIXUP_ACT_INIT)
+		snd_hda_codec_set_gpio(codec, 0x02, 0x02, 0x02, 0);
+}
+
 /* Huawei MateBook 14 (SN6140): the speaker output follows the headphone
  * pin's connection select in hardware.  Both pins must be routed to the
  * shared DAC 0x10, which carries the playback stream; the generic
@@ -1001,6 +1013,10 @@ static const struct hda_fixup cxt_fixups[] = {
 			{ }
 		},
 	},
+	[CXT_FIXUP_AMP_GPIO1] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cxt_fixup_amp_gpio1,
+	},
 	[CXT_FIXUP_ASPIRE_DMIC] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cxt_fixup_stereo_dmic,
@@ -1222,6 +1238,8 @@ static const struct hda_quirk cxt5066_fixups[] = {
 	SND_PCI_QUIRK(0x14f1, 0x0252, "MBX-Z60MR100", CXT_FIXUP_HP_A_U),
 	SND_PCI_QUIRK(0x14f1, 0x0265, "SWS JS201D", CXT_PINCFG_SWS_JS201D),
 	SND_PCI_QUIRK(0x152d, 0x0833, "OLPC XO-1.5", CXT_FIXUP_OLPC_XO),
+	SND_PCI_QUIRK(0x1558, 0xa600, "Acer TravelLite TL05-41M",
+		      CXT_FIXUP_AMP_GPIO1),
 	SND_PCI_QUIRK(0x17aa, 0x20f2, "Lenovo T400", CXT_PINCFG_LENOVO_TP410),
 	SND_PCI_QUIRK(0x17aa, 0x215e, "Lenovo T410", CXT_PINCFG_LENOVO_TP410),
 	SND_PCI_QUIRK(0x17aa, 0x215f, "Lenovo T510", CXT_PINCFG_LENOVO_TP410),
@@ -1255,6 +1273,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
 static const struct hda_model_fixup cxt5066_fixup_models[] = {
 	{ .id = CXT_FIXUP_STEREO_DMIC, .name = "stereo-dmic" },
 	{ .id = CXT_FIXUP_GPIO1, .name = "gpio1" },
+	{ .id = CXT_FIXUP_AMP_GPIO1, .name = "amp-gpio1" },
 	{ .id = CXT_FIXUP_HEADPHONE_MIC_PIN, .name = "headphone-mic-pin" },
 	{ .id = CXT_PINCFG_LENOVO_TP410, .name = "tp410" },
 	{ .id = CXT_FIXUP_THINKPAD_ACPI, .name = "thinkpad" },
-- 
2.56.0

