Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C4C21B9F6;
	Mon, 15 Jun 2026 03:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781494595; cv=none; b=NrAM6VE2vx2FQHchdKPEo3wTy6A8B1+Fh6va4G4kybPW40kJePvmUqT8wP8woNIg72VbtcOTYLg5kBuEjPtUPbgIiLNQvIQKx2st1S3gUdtqJMvZFv3J4bkVdm60yO0R6EXAh89fpfzLzMVCr0toq0bmFnyEbDvesuijYSLrfWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781494595; c=relaxed/simple;
	bh=Cv4wQ4NVXZKcKU3xYHVLgX3DCXBmDKFtCGk4XQR8tOo=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NqKQVN2bd6A57ZWM20C0cZJulMz4ZYi12yIjXOv9hFPZrgpOJ64v0EhVsj8nNfhJUdQay2z/A3gP0ZmHW8FtpzCClTXyWqqt4sP9Cpx0MabDPB8ZucogLfN7X6qGgCe3IrSQVTkVH6j410vqLqOfaEtZFKca0d0BBg1ppBgoKUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=e25uubo7; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="e25uubo7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1781494584; x=1781753784;
	bh=Cv4wQ4NVXZKcKU3xYHVLgX3DCXBmDKFtCGk4XQR8tOo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=e25uubo7zns+gc8v0W0g4hJGEVWbRpp//ExPjI6I8vAtWq44EdZaLVHFqhQTXDD69
	 zhFzgWgUaxkKCJzez1i+gjXUvn/tGpECjlulm7rKXhB+brWaLg/cqBYWO3v+gKb7EE
	 bOyXFRvPtx4Bn/dkUUsrzNBAD8dJUYjSt5QbG9VJvk1ZpXiikyROPCNWw4/ylNnyM+
	 rQ1uJdlO3/Pe2wOgZG7DiJC24tCMW0d5BPEKcE2Jk2Ji4yl0dYBW75l3FcEu00ua8s
	 EYjIHJNWcgBLg27JkwS17CKw4pTzQiyr8DJK8Il24M+zmrOjVe9tjDkiwJGm3IVT/H
	 EUdORwW8UlQjQ==
Date: Mon, 15 Jun 2026 03:36:20 +0000
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Colton Jones <cjones1308@pm.me>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, Colton Jones <cjones1308@pm.me>
Subject: [PATCH] ALSA: hda/realtek: Add CS35L41 I2C quirk for ASUS UM3405GA
Message-ID: <20260615033619.7-1-cjones1308@pm.me>
Feedback-ID: 150760865:user:proton
X-Pm-Message-ID: 43d1bc5e4cb00b37425aa6f349750619a94d7791
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The ASUS Zenbook 14 UM3405GA uses a Realtek ALC294 codec with two
Cirrus Logic CS35L41 speaker amplifiers exposed through the CSC3551 ACPI
device. The machine reports the Realtek subsystem ID 1043:19f4.

Without a PCI quirk, the codec falls back to generic pin matching and the
internal speakers remain silent even though PCM playback completes.

Add the UM3405GA subsystem ID and reuse the same ASUS I2C headset-mic
fixup used by the closely related UM3406HA. That fixup configures the
headset microphone pin and chains to CS35L41 I2C speaker-amp binding.

Signed-off-by: Colton Jones <cjones1308@pm.me>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/a=
lc269.c
index 000000000000..000000000000 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7298,6 +7298,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] =
=3D {
 =09SND_PCI_QUIRK(0x1043, 0x1982, "ASUS B1400CEPE", ALC256_FIXUP_ASUS_HPE),
 =09SND_PCI_QUIRK(0x1043, 0x19ce, "ASUS B9450FA", ALC294_FIXUP_ASUS_HPE),
 =09SND_PCI_QUIRK(0x1043, 0x19e1, "ASUS UX581LV", ALC295_FIXUP_ASUS_MIC_NO_=
PRESENCE),
+=09SND_PCI_QUIRK(0x1043, 0x19f4, "ASUS UM3405GA", ALC294_FIXUP_ASUS_I2C_HE=
ADSET_MIC),
 =09SND_PCI_QUIRK(0x1043, 0x1a13, "Asus G73Jw", ALC269_FIXUP_ASUS_G73JW),
 =09SND_PCI_QUIRK(0x1043, 0x1a63, "ASUS UX3405MA", ALC294_FIXUP_ASUS_SPI_HE=
ADSET_MIC),
 =09SND_PCI_QUIRK(0x1043, 0x1a83, "ASUS UM5302LA", ALC294_FIXUP_CS35L41_I2C=
_2),
--=20
2.50.0

