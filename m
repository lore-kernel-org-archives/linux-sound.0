Received: from sender4-pp-g121.zoho.com (sender4-pp-g121.zoho.com [136.143.188.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FA9611E;
	Sun,  8 Feb 2026 13:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770557468; cv=pass; b=gHM8FS+MdKxGeLfjmFoVqwOBZOrMRkMP5TJ0VpmYaMlhUITymqtmfXyk5wn0MstR3iIG3uDuh9R6OWRPwBHM0NsOYhSJY+NUtcV3QvICzEcC8U4c4RWe+0Pz3SzOds3CldkEkRexsrN+5aDhOD1rn5Zjv4hrHp6+lwsFHWIAIvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770557468; c=relaxed/simple;
	bh=/O5mKxoGV28/wNnM44sF4XWh64/pKH6bZPe77nUaEXY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V65NBooZCOlfhTi0Tyl/eQoeS6ZZZSoQD97zlPFhzu7+fxDR7KkZy6GnUibHCN/N1Zc2FeAea6tryuTeDWyVjcptOaYt82/hvCBe4hi9psWNFCJ/1YqR39XSsfA6aBlGAg55M7cf0lRialtCxJFRKglXd88zOndmV1sTwkktGkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=L6R8myzt; arc=pass smtp.client-ip=136.143.188.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="L6R8myzt"
ARC-Seal: i=1; a=rsa-sha256; t=1770557451; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=C6GFsPkbI+7EiGnA72heIJKBz8+OUwD5yWgtj84bCdviwWn4P5c/TXVkqsqF1qFvxMolqvyjP9oXzgC1h6gZ7HXAC7yTCdcjarhREZo7jjQcRAAtq/JpsrWA2fWSoFeAumzYE6N/PiT9iWGOjErG67NyZDr/lLNE/WAVYMlfK6c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770557451; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DGpU7aDJggpGbJTfo5yQwlJlfHLNXv5oGb8mywPX4u4=; 
	b=NecZl9s7vd8f0kUgEM8+rkPnEP4nY6nuEBYyXUfnBs7pE/qyTaHt8zPXzb+DweRRVtUR0v6TjQHl7q3jZekLHSnkWcDQUZba+H4BjAmzR1xs0/FmKOQoBDrRqhMQN6Akt2Xgu0Z7X9M72j+qufdHqFpmZj4mkaREXh/Wj7lKIq0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770557451;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=DGpU7aDJggpGbJTfo5yQwlJlfHLNXv5oGb8mywPX4u4=;
	b=L6R8myztm+CKpHFtqfYCBDiWdBR0BV9GToaDbeJvX8hu2JJiTH6NAR3PBIqaqAjW
	8ZA6jn18+ehMwQOA22SKfd5EtfEprm8HIoRqZx8KfWujvfLEScsKQZHGop2SjZ9S/n3
	HVDW8FsomyJUKAD3QS6NXSMYTwb11YSaMWnbk+MoPKV3evBmfJURytZZtk4dRM+vP/5
	JI8pLHnSfN4uwpB4VRUFhqdbcuJAP46x5cIlbE8BwnmvSGYlI7fEnGU34AtggPypHqU
	N2JOhySUQUSYMbTNUcCeq0MsYx1ppTBFonxzDLzsK5cD1DDERXIYQKufnKs0eKfHdIx
	tNZj+x8rLA==
Received: by mx.zohomail.com with SMTPS id 1770557447085157.3678129429951;
	Sun, 8 Feb 2026 05:30:47 -0800 (PST)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harin Lee <me@harin.net>
Subject: [PATCH] ALSA: ctxfi: Add quirk for SE-300PCIE variant (160b:0102)
Date: Sun,  8 Feb 2026 22:30:01 +0900
Message-ID: <20260208133001.680550-1-me@harin.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add quirk for the Onkyo SE-300PCIE variant with PCI subsystem ID
(160b:0102). This variant (OK0011) was found in the official Windows
driver packages.

Also, reorder entries and fix the indentation to maintain
consistency.

Signed-off-by: Harin Lee <me@harin.net>
---
 sound/pci/ctxfi/ctatc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/pci/ctxfi/ctatc.c b/sound/pci/ctxfi/ctatc.c
index 227d8c8490e1..a25a599fc5be 100644
--- a/sound/pci/ctxfi/ctatc.c
+++ b/sound/pci/ctxfi/ctatc.c
@@ -52,18 +52,19 @@ static const struct snd_pci_quirk subsys_20k1_list[] = {
 static const struct snd_pci_quirk subsys_20k2_list[] = {
 	SND_PCI_QUIRK(PCI_VENDOR_ID_CREATIVE, PCI_SUBDEVICE_ID_CREATIVE_SB0760,
 		      "SB0760", CTSB0760),
-	SND_PCI_QUIRK(PCI_VENDOR_ID_CREATIVE, PCI_SUBDEVICE_ID_CREATIVE_SB1270,
-		      "SB1270", CTSB1270),
 	SND_PCI_QUIRK(PCI_VENDOR_ID_CREATIVE, PCI_SUBDEVICE_ID_CREATIVE_SB08801,
 		      "SB0880", CTSB0880),
 	SND_PCI_QUIRK(PCI_VENDOR_ID_CREATIVE, PCI_SUBDEVICE_ID_CREATIVE_SB08802,
 		      "SB0880", CTSB0880),
 	SND_PCI_QUIRK(PCI_VENDOR_ID_CREATIVE, PCI_SUBDEVICE_ID_CREATIVE_SB08803,
 		      "SB0880", CTSB0880),
+	SND_PCI_QUIRK(PCI_VENDOR_ID_CREATIVE, PCI_SUBDEVICE_ID_CREATIVE_SB1270,
+		      "SB1270", CTSB1270),
+	SND_PCI_QUIRK(0x160b, 0x0101, "OK0010", CTOK0010),
+	SND_PCI_QUIRK(0x160b, 0x0102, "OK0010", CTOK0010),
 	SND_PCI_QUIRK_MASK(PCI_VENDOR_ID_CREATIVE, 0xf000,
 			   PCI_SUBDEVICE_ID_CREATIVE_HENDRIX, "HENDRIX",
 			   CTHENDRIX),
-	SND_PCI_QUIRK(0x160b, 0x0101, "OK0010", CTOK0010),
 	{ } /* terminator */
 };
 
@@ -78,8 +79,8 @@ static const char *ct_subsys_name[NUM_CTCARDS] = {
 	[CTSB0760]	= "SB076x",
 	[CTHENDRIX]	= "Hendrix",
 	[CTSB0880]	= "SB0880",
-	[CTSB1270]      = "SB1270",
-	[CTOK0010]    = "OK0010",
+	[CTSB1270]	= "SB1270",
+	[CTOK0010]	= "OK0010",
 	[CT20K2_UNKNOWN] = "Unknown",
 };
 
-- 
2.53.0

