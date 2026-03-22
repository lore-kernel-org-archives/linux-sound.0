Received: from sonic310-21.consmr.mail.gq1.yahoo.com (sonic310-21.consmr.mail.gq1.yahoo.com [98.137.69.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8617E326941
	for <linux-sound@vger.kernel.org>; Sun, 22 Mar 2026 18:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.69.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774203503; cv=none; b=NHqM08ZabzZ5g+rjt0DILvIAkHmqbiAvw7QjLFBcidvOqRln0AJfJVtf3RFcO9tWjAtyejoo8GabuSjT9AK9qcPCCfk+b/gn0bBfSLzd7JJGvJFsWk55NxUV+Uo6iyLGEwup1IDY/nm1/fns3SUu9Hze/PMQjSs+iBo0vNqcIkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774203503; c=relaxed/simple;
	bh=3XPz0TpJeEJUHytAvhNEBJqVtBJvIEpXQV49Ya0wOZE=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:MIME-Version:Date; b=t0V1f5K2wUyYPn2edjwlGFy0xbfacjcvwXWD0z1uuLjehl0QMvzt3Z8kTeUc+37MtWU1QNtZDrbQ766l2cYCU7Dj93mPU3mGX2Gq/rdSKVO4qpajJL2141quf5WGRR8fJ5tiS4qBwOgrCEprxBrSDdq4Z80bMh0Rrk2rYoKcCDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=RqaEliKv; arc=none smtp.client-ip=98.137.69.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="RqaEliKv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1774203502; bh=E8cmqUjtKiQTm+qe1NtgWIbpB1Uq2y+ZMOhDzO8ORTQ=; h=From:To:Cc:Subject:Date:From:Subject:Reply-To; b=RqaEliKvub8EbewoqIQ4FJ2SZ9HJnDIcAvMUmpEz3mkTQv6ctANCZBrPb1VQKGJH5P6ZpMCYh2lQc38XRWFM170fu0aYWDyYI66zD52ukbiyVlLlm5ISgQFcQYrlb6zJdrm71Ms3OObT8H+ZWA29hVAbBcaUwCzdEPZHhKqc9meuMe71c2DJengzYm3r/sYEHRKMBc9o90FWyWVdOHYrFJUVdHTIw3QsawfDO1XJf0GcIbK0FbZ01chgVG0o0aAX0f1zGwaktgGWVkHSqke8a+iVgAmZ62NcRzBncQnxwJtiyCvQkgZ3sdf2RXClxHg+74io6zRoiijaBN0dsmonug==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1774203502; bh=m1Fj7arPvbdN4mT7c3x/0pHLNTYamZHHC0e06F7QVm8=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=FOiPYIjCxIHBhMdcM7ROpwUbmQ1YzkVcPFe/CpG8nOsjDgAUD+hLPOxM6Mk+PsC/B2WVFaqTqfHJVzxP+GudggkEac10VMhwG608BzZJA2K5P77jEBi1CZKYQ39fwfN71BnAp9s20nxPwZF73nN5c73FQpGkbAi3AT+OIO4IbBQdn1occCqJQdym1X+uTBlqhpku56qAeRXp7EcQJ8RZZnia12h3sl5nZgKinsL7KfiEKABM9ASVJNjK/drfAP6Ep4RHOYJkNaa5+6Cswf4S881l6Nonbl7JkOz46yxv3DOLdgfZigOMnACLQGC4vaNyAmpsGPlDaVw8/h4SWgOjvA==
Message-ID: <567500035.239617.1774203502195@yahoo.com>
X-YMail-OSG: UE5WiFEVM1n9VWlOgajqLDgeo9sm4LnMGC5UC9DIexpHKNQj2aS9qNf6.jPvMSn
 cPu..bzuJFkHlCZDdPea6NoYlaHTkoDayR2lx4E77oTAUr3owBIc9.eDxiBx3naWb.GrAg0E36F5
 YUWD8HjzmvlDH7IrT4Rr528tiwRrRuyJD1hooCL4J2zw.q_VVXlrbve0ZPRSQc.I5Zvsf0kpL0Ot
 orITiLnLcl1ef0xUayVDbmuXhKJMf2U_rPIlJ.NZpI9BgC1W3Uj5XR8lNizvExaQ0bTgrvgjimRi
 AEUE8eZ0RZHoD.kNWv9MwcYmbFkFUemOxTEt99xw8FlcTiOLjwjpSoWrsVy4TvqMTxPRZ2qAZZBZ
 SptwUGqdNjiyb.C6QOyPlKC1izdvwrU0tKI0dcAv6BQJotKdozq4CK399hd0Oy0awhdawpiZzyXz
 _Zp9zgY0ych2AcRxQqTRjJR6fPfU9gbCasgkvK_BRsrE3ZETVgxSe4w7G9M0bMV9dlz_mWycRnjc
 0HF8MWupLIdjdsYq4L2yxXJ9wmTD0k4LHAYji6ndsGBUsK6ytylq3hGjtYQ.cTo689DiHl2WTCRB
 14ynnJGZeGrqvIVjePvpd6ZY9HvNjNPL22xmnDOkZjfANyZFnmskeGlx8Nigl_hgXJ6mtIsMppsD
 wstH9OfYEqH5jIAkHwIVO1Ua4eQLUe8c3T5Qd39gJlnSthqqy2FC4wza62oy0VeRpZlnCm.bQE.S
 fx8NCqLAwBLlWian3cQ87_l7bZOhjziaZSPIXErT.i2U6BEPlfFAs818Z8n5gpkv3uTWb5HtAr9I
 xjmjRXwcVEvgY63ZCoZ3yWKs0X1qeC6663_suZIW.TVjMKmWDc9wA70KDEbCD5rKt31FJjdoV1gO
 RgX8GLHYfgl98NrI82Gr9nl34STssbBehQ2KHmW.qNsT8.2NEfFLWR3wETWpNomTDxirbu08s0zE
 EhuGBFTIgMJ_tJ1SvSzEKWc5re0du0xor2Ur_5iU45Y0cIQ89SgTp.uQTE_dEzwNJP.tCKifgrDI
 .LoHackv_5_y2uV5xGRO59BEzWt7v61Y3M4j5Q8lE7r5eomKFDemcHLlkhVizMLX0o7ck312wLcX
 wZ46a2UvWh2YP0_4Q1Iac1oJRjvfjYBasoFp_rzp.dc49ClHKk_L8B0bBr0aMisui69lGPTPQpz5
 IX_p0P7B.hCWnTMhEYBnmoraavla7E2Dh_HdIrKOVaOqzHKHxf9neS67xHZtBls9cjB.nQwAf3tJ
 cUSg2.hYOETOx40Wty4If1QLj6ub8dNW8v8KF13lBB6fVOAddhAaCltWgalRSnbUxjge7HdHpGoJ
 6fWjtCvdIxWK5efEy.kPeuoFxhTKui3yIOgIe7gpPowkCGE_9o3yqqm6cpIu.pKWut_JEFvQjeRj
 rFHP4EB5vNcho1CLI8Pk3HQH8QkoAVHEm9oUwc66P6VxT3wgRjn7ijWUJBEyjYjE4WCPK8xIdm2v
 4pKG5oF7nhu0vSb2O5i0W1c6zYEVyXXvjrR6tQ1iPnIhJ2QRTn8Dod5lHRccLqt7tzM6gkNfp134
 e7euvjCn4ZkD7hCw3xwSQbWZaRzTC.3EzYTTtUKg_6d68qZK4pE9dlifKQIVTXDNhu8iBgMTsr3J
 TmqzdJMKnNO5j93I5P6I.QO5__OOPH1yCvGXCALpGo1KCmrLXyqXFWQ6oaay.oOO43QvRfZBc5pd
 SRiWeMNpOZUI89lLsr1o5z3bnOEXb67DvoU8554LG__f4vNIzb7w6jkCsvRUmQuG2yuNYBcfonP2
 QPc4JFwqN29mdFuYdHWNlDO0dU0Y1NbZvHSQg36nnoRvM7K.f.9Skjxe54yY6GefQgi1B4uq2JMv
 B3sfE3D2MGjWb6TAdxKD19XvxvgENOdW060tdaV_VDrhsRT0uGvY7jlcUa10Ij1FrOFgu8.M2faK
 MX08S9Mb__avlsuPkrFbUblIu4UCV5OcOGGbUeVrJ2QK.wxY8ZmZP7TtfkfJaic4.qSy9mq6Atdp
 WOspkFXGbsgetl8DFhvaM.c3MrigSDKs7BWHCumlSefrYnD31Wnll7h8GgotMygsrDSxzVlILXES
 iAouLO2jflidRWWTHAzurCn7SjQzsbJeoxNg7VXpniNrna_HktXkaXPIJ0_Zi1sUizbG6ChbKE1c
 7mytzTY5MpzDhIOq8alRn9dM3.s.qDF0VbEDTEUnGXvbl3H6go9_Kk8tymXibm2v_q5UNBLpEeW3
 W336k2wNFzm5izQc4HTchrldz8ZPJj8lYJRSdaFfYTWLGW5DWLF60RTylBazZ9i4vlBU_qfM-
X-Sonic-MF: <Odin_B@yahoo.com>
X-Sonic-ID: 0b547923-d154-421a-a635-0e10fffff872
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.gq1.yahoo.com with HTTP; Sun, 22 Mar 2026 18:18:22 +0000
Received: by hermes--production-ne1-555c74f9db-px59t (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 3bf0f9e767e88c1c0115a3e30b7375b7;
          Sun, 22 Mar 2026 17:37:52 +0000 (UTC)
From: Odin Brodersen <Odin_B@yahoo.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de, perex@perex.cz, linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Yoga 7 2-in-1 16AKP10 (17aa:391d)
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 22 Mar 2026 17:37:52 +0000 (UTC)
X-Mailer: WebService/1.1.25380 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

The Lenovo Yoga 7 2-in-1 16AKP10 (subsystem ID 17aa:391d) shares the
same ALC287 codec and bass speaker pin layout as the Yoga 7 2-in-1
14AKP10 (17aa:391c), which already has a quirk entry. Without this
fixup the kernel picks up the PCI SSID 17aa:38b5 (PCIe bridge) instead
of the codec SSID, leaving the bass speaker pin (Node 0x17) inactive
and the master volume uncontrollable.

Apply the existing ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN fixup to
17aa:391d to match the behaviour of the 14-inch sibling.

Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=221210
Tested-by: Odin Brodersen <Odin_B@yahoo.com>

Signed-off-by: Odin Brodersen <Odin_B@yahoo.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7576,6 +7576,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x38b4, "Legion Slim 7 16IRH8", ALC287_FIXUP_CS35L41_I2C_2),
 	HDA_CODEC_QUIRK(0x17aa, 0x391c, "Lenovo Yoga 7 2-in-1 14AKP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
+	HDA_CODEC_QUIRK(0x17aa, 0x391d, "Lenovo Yoga 7 2-in-1 16AKP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x38b5, "Legion Slim 7 16IRH8", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x38b6, "Legion Slim 7 16APH8", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x38b7, "Legion Slim 7 16APH8", ALC287_FIXUP_CS35L41_I2C_2),
--
2.43.0

