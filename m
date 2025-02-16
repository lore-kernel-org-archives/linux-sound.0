Received: from mx1.mythic-beasts.com (mx1.mythic-beasts.com [46.235.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD00F42070
	for <linux-sound@vger.kernel.org>; Sun, 16 Feb 2025 23:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739749827; cv=none; b=AxuhTOGyVOTsdj9WetYCjV0LyOlODYwgEj94YxnW5n1XqzGKlVw4oQFBtO7/gNg7kEIT4NV7jwcIwluzqJqyYWGajrydMgCi4PvKpM7GV7GB8kG2vtLOn3QwT9OAaUgpZ37P7y46f0ad3jjsenn0IFnhemJlka4wYfuFuqHjK4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739749827; c=relaxed/simple;
	bh=Zru3qjjZ/xHjkvhXoWel5L2BRG5dcqbEAecT6k3izBU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=BrfgmmRMzD8R60VcFwQ2nKJQBEr0IWemAtDEyKShiBZh9UJi4SF/9caoYTT0rALFz01C1AFQHe4fIB4bmO5bdihkenoCyY14+B/bxU/lWqk+fCIICUBNbfTmAFwnenD6DZlA1Tk0B62PlOaRkFO3ZICE7zVKF4a6iwZzGCtYCDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pelago.org.uk; spf=pass smtp.mailfrom=pelago.org.uk; dkim=pass (2048-bit key) header.d=pelago.org.uk header.i=@pelago.org.uk header.b=vDk9SP2H; arc=none smtp.client-ip=46.235.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pelago.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pelago.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pelago.org.uk header.i=@pelago.org.uk header.b="vDk9SP2H"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=pelago.org.uk; s=mythic-beasts-k1; h=To:Subject:From:Date;
	bh=E20lXXT++Nd36TJqc3nT2gD7SfgfFAHeV6k5+TWAs5g=; b=vDk9SP2HHs0ZoN3IAMkjh3kl4R
	bqYMyCJU3rUgxgsn5mm+dkF53kFTp9fGBQcvQAaeiNXk8cQBsOT/o67jILRIhkztTn22aRtHaeULC
	f+Jhu2/LeYFr1zTgs386PSqQi3BsNZWoJPjtJfhZ+dsZq3HVGWLDvog7TAMuvnV9Jern1to0zD7Nt
	nKCEFF60xPeJvuUg4BnHF/PXoZ4RH/5PT84mXejGVyYZiNlePLqmJu4aR2pmOr+BStXUSg8rTP1UC
	iB77u0/RnViQDeqyCyU2W+py8PU7bfQObz6V+P/U6MiCkTkEn13vEnH4ALFJ7OUnLG4J2s9Put03K
	oJ0aXJbQ==;
Received: by mailhub-cam-d.mythic-beasts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <john-linux@pelago.org.uk>)
	id 1tjnxc-00AyhI-AC; Sun, 16 Feb 2025 23:22:04 +0000
Message-ID: <5eb4305d-48b2-43a4-a30e-2bbe8d409146@pelago.org.uk>
Date: Sun, 16 Feb 2025 23:21:57 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: John Veness <john-linux@pelago.org.uk>
Subject: [PATCH] ALSA: hda/conexant: Add quirk for HP ProBook 450 G4 mute LED
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org
Content-Language: en-GB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BlackCat-Spam-Score: 0

Allows the LED on the dedicated mute button on the HP ProBook 450 G4 laptop
to change colour correctly.

Signed-off-by: John Veness <john-linux@pelago.org.uk>
---
I have only tested this with 6.13, but I expect it could be applied to older
stable kernels too. The HP ProBook 450 G4 laptop was released in 2017. 

 sound/pci/hda/patch_conexant.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index 4985e72b9..34874039a 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -1090,6 +1090,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
        SND_PCI_QUIRK(0x103c, 0x814f, "HP ZBook 15u G3", CXT_FIXUP_MUTE_LED_GPIO),
        SND_PCI_QUIRK(0x103c, 0x8174, "HP Spectre x360", CXT_FIXUP_HP_SPECTRE),
        SND_PCI_QUIRK(0x103c, 0x822e, "HP ProBook 440 G4", CXT_FIXUP_MUTE_LED_GPIO),
+       SND_PCI_QUIRK(0x103c, 0x8231, "HP ProBook 450 G4", CXT_FIXUP_MUTE_LED_GPIO),
        SND_PCI_QUIRK(0x103c, 0x828c, "HP EliteBook 840 G4", CXT_FIXUP_HP_DOCK),
        SND_PCI_QUIRK(0x103c, 0x8299, "HP 800 G3 SFF", CXT_FIXUP_HP_MIC_NO_PRESENCE),
        SND_PCI_QUIRK(0x103c, 0x829a, "HP 800 G3 DM", CXT_FIXUP_HP_MIC_NO_PRESENCE),
-- 
2.48.1

