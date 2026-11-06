Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=103.117.158.92
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793977741;
	b=ba8lxLglentD+2YQKT4Xk56GGuw8FEPKzjYQ7XXzGktj25a6wgRbwb17BUi3Q8SsOF3N
	 YVFJfj1PDgGkQuB3khAsLQ6kAORj24xACeMArQj5vzuS9X+PqyOABPbGYo5TUt2JxLP90
	 hi7s7l1CECPxPIOZZtBZ2r1OrW9Rt6zoq+zwgKqrR1vN61IVicZ/HdaJeEXYmAAN/TN9j
	 Vg288+k81mFK04IoIPyu9QAFJ7tfPDTNILkQ7MWTpljkKBgM4IB2a8a5l86dIzUHp7Yoh
	 aeOapYzKhYQ0ib0468Cc3q45Zd29ISmJAQOX0qSKz4wfs6mDGCdrRNoqaOeMqi919UA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977741;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-ZohoMailClient;
	bh=DHnDmhTpXSthYKveDp+hDBOWTjXzObj/yOJt/IJ7VLw=;
	b=ck6epCNlJUIDZLF5nol5kkjw+2FCwztcFtAMpGJTzzwDH8xgm4Epe8OQ35gywoCE016Y
	 PgC5tE7RT+OEYLZKa/Xx3YzKYMlCQQ2PLtwHma2oYSCPG/ZG3ZGpawCMGQ+Ven7ZHErKC
	 +jvuPWQtRmlu7uUcm9GdxMWOeAxHyMJpVPJ3FKzqZ1cbho32oia4r2W8HhemktD8UTzNR
	 mmgjWPCpQ3uBD+rnn82lIXvhmzF/v1NDx1KeUb5Kwk+VhJKf6dzPlfSg5LGoFLjPfAdFU
	 IX0e2xDadpWeRtXnRz0N/CZQkBW+Get7wcDFo7S4j895S7vrbkkqNNaQKLPtlYx38Ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zohomail.in;
	spf=pass smtp.mailfrom=zohomail.in;
	dkim=pass header.d=zohomail.in header.i=@zohomail.in header.a=rsa-sha256 header.s=zoho header.b=sLggOKiq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=103.117.158.92
Received: from sender-pp-o92.zoho.in (sender-pp-o92.zoho.in [103.117.158.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB247606A326
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 15:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB247606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zohomail.in header.i=@zohomail.in header.a=rsa-sha256 header.s=zoho header.b=sLggOKiq
ARC-Seal: i=1; a=rsa-sha256; t=1793977735; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=KdO97T4+KuNNNrIv5LhoUBRSw2Va2p/5jwmEy49UvtdoOlcBgD9gFibyTk5D9Cb3OX+sZdk5dzqhq1fT99s+9UNjTwnn8XOgMvs4kSWwIXQxvq+TQCm/U1G7RmSUOUnTeUv5MLWqZylrOCHf9O6LC3puwlZeREMmtRROa4HfukI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1793977735; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DHnDmhTpXSthYKveDp+hDBOWTjXzObj/yOJt/IJ7VLw=; 
	b=UA6hBuIxg3TQL8rFqexqN0cOs7XtOtwN0vU9Wkvu1Yf2XhrE6mufutzFvhhZqws4nOlPjG8QAyssoldG0OeoaKdSZVTV2LQhPTloNxvVX8iXCU7+zoIl57lNfhhy6sSOGoCnvTtuoXgdGdkA7zJAM4dBOGe78++zT+SM1eLIHfM=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=devajuice@zohomail.in;
	dmarc=pass header.from=<devajuice@zohomail.in>
DKIM-Signature: a=rsa-sha256; b=sLggOKiqLcqHzj9cz7OV4Qya3pzvb1la7pzu0UZjZB3GY59HxMTjsRNQAvUMapuIKDJO7sA+zkhm7NiyvQ/RNaKOs6yHFNAG8xFo4YDLdIAMYLL6wIlA+1JlQbfz1d0ZyegET8QpOZxctmdXkpLaxvZlAw67Ke9+DVbdFlMFRYA=; c=relaxed/relaxed; s=zoho; d=zohomail.in; v=1; bh=DHnDmhTpXSthYKveDp+hDBOWTjXzObj/yOJt/IJ7VLw=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.in with SMTPS id 1793977734731840.0421982075925;
	Fri, 6 Nov 2026 20:38:54 +0530 (IST)
From: Devajith Jijush <devajuice@zohomail.in>
To: linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2] ALSA: hda/conexant: Add quirk for Acer TravelLite TL05-41M
Date: Fri, 06 Nov 2026 20:38:49 +0530
Message-ID: <179397772915.270716.9671410898445846938@zohomail.in>
In-Reply-To: <179396062556.127350.15308705935335598574@zohomail.in>
References: <179396062556.127350.15308705935335598574@zohomail.in>
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

Add a CXT_FIXUP_GPIO2 fixup that raises GPIO bit 1 for this subsystem
ID.  The verbs are registered as init verbs, so they are replayed after
every codec resume, which matters because the codec loses the GPIO
state on a power transition.

Note that the existing CXT_FIXUP_GPIO1 fixup raises GPIO bit 0, which
has no effect on this board.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222238
Signed-off-by: Devajith Jijush <devajuice@zohomail.in>
---
v2:
- Use HDA_FIXUP_VERBS like the existing CXT_FIXUP_GPIO1 fixup and drop
  the helper function, as suggested by Takashi Iwai.
- Drop the new model string; the quirk can be selected with the SSID
  alias model=1558:a600 instead.
- The verbs are registered as init verbs and replayed after codec
  resume, so the GPIO state is restored without a separate init hook.

 sound/hda/codecs/conexant.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index a141c94..b0fa1cb 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -289,6 +289,7 @@ enum {
 	CXT_FIXUP_HEADPHONE_MIC_PIN,
 	CXT_FIXUP_HEADPHONE_MIC,
 	CXT_FIXUP_GPIO1,
+	CXT_FIXUP_GPIO2,
 	CXT_FIXUP_ASPIRE_DMIC,
 	CXT_FIXUP_THINKPAD_ACPI,
 	CXT_FIXUP_LENOVO_XPAD_ACPI,
@@ -1001,6 +1002,15 @@ static const struct hda_fixup cxt_fixups[] = {
 			{ }
 		},
 	},
+	[CXT_FIXUP_GPIO2] = {
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = (const struct hda_verb[]) {
+			{ 0x01, AC_VERB_SET_GPIO_MASK, 0x02 },
+			{ 0x01, AC_VERB_SET_GPIO_DIRECTION, 0x02 },
+			{ 0x01, AC_VERB_SET_GPIO_DATA, 0x02 },
+			{ }
+		},
+	},
 	[CXT_FIXUP_ASPIRE_DMIC] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cxt_fixup_stereo_dmic,
@@ -1222,6 +1232,8 @@ static const struct hda_quirk cxt5066_fixups[] = {
 	SND_PCI_QUIRK(0x14f1, 0x0252, "MBX-Z60MR100", CXT_FIXUP_HP_A_U),
 	SND_PCI_QUIRK(0x14f1, 0x0265, "SWS JS201D", CXT_PINCFG_SWS_JS201D),
 	SND_PCI_QUIRK(0x152d, 0x0833, "OLPC XO-1.5", CXT_FIXUP_OLPC_XO),
+	SND_PCI_QUIRK(0x1558, 0xa600, "Acer TravelLite TL05-41M",
+		      CXT_FIXUP_GPIO2),
 	SND_PCI_QUIRK(0x17aa, 0x20f2, "Lenovo T400", CXT_PINCFG_LENOVO_TP410),
 	SND_PCI_QUIRK(0x17aa, 0x215e, "Lenovo T410", CXT_PINCFG_LENOVO_TP410),
 	SND_PCI_QUIRK(0x17aa, 0x215f, "Lenovo T510", CXT_PINCFG_LENOVO_TP410),
-- 
2.56.0

