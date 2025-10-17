Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6EC33A02F
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 11:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760699514; cv=none; b=iBNlg76YM/BE4XM9o1CGfsaxTGCs7mIt3ZhoLuBSD7XTUg3ma817csTAxf1ckEOIvxVFxC4jKMRuSWLQp7Ya5mfIiahjEfnczCMvv3djA0yKe7t1CwDDjuhEchPWHWtxPMUTpldFSQURa7Rp3E3a+uJWUzV7WgK2ssQO1yuUngg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760699514; c=relaxed/simple;
	bh=6eZO9Xbj701w7qLtm81Adj7AnBqtMcMZlGOj6zqFMlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IW4ovrZaPfm4iMde3naYosjIbgP36kkPl4705NVJYqXszOa4zNGkAVWdpEosTimALymp9W9oVJOBoXDB10BKEghYYDNq3mS+D6z5bdbbbWnr+MTjfV7Ye5prEHVgcgXCYDsfQmqx3Kw/wPMxUX3mut+l5WZ5sNuWDwgbs2PIUW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=Xhw05X5p; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=j92sMo7k; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="Xhw05X5p";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="j92sMo7k"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8BF0014000E2;
	Fri, 17 Oct 2025 07:11:49 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Fri, 17 Oct 2025 07:11:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1760699509; x=1760785909; bh=8QHHl3iDx0
	7N/znV8QO//2TwxkeZ5xNt6PgtHowgaNY=; b=Xhw05X5pRJP+gs9O9Idm0IBdXH
	yzsxWC2YsLVhuWlNkDiI9fYUu/0qkTCNIbwgX1XXDQ8AOEMYOF5NJk4lc9Fo95Gf
	xWg0sGb7gX0TIqpMEJ6w1SrTDsHTFffLTrZfImzLL+UZ+nAjeQ4+v8CV6bDTSE1/
	TiCbtEwQxuddBTco/5yyCRsLI/NViZI3a7qM7Qt2uLxsdA8fOwvVsetwfOI84yHx
	EzGF2Tvf52tmxzlrDANaMrDZyGkzCELXEXOhC1NCvys96MNPkydyY17YIVl6cwkp
	lBFqChGSRu+t6U9TxgRfGF2DGHZX3O1JaetboKb7iUM14YbIr6B//easjftw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1760699509; x=1760785909; bh=8QHHl3iDx07N/znV8QO//2TwxkeZ5xNt6Pg
	tHowgaNY=; b=j92sMo7kRsX1eCJtbJ/AW2CCIqUZTKSfbBaWGzN2zNbRqKzH7OK
	AbPAUELxff8IAJZSvw3dosofdnaZFgomhEsykGvaJ6X1Mnu1iN/L1o3edXslHBU1
	75n3qh9nH/YJvB4DIJ8GU2Nwvfb/m55daFWb4Wg+pdM3x+mLwNDT0T85D/XK1o5h
	iSqwwy8k76Ke0b+l4VVMr2035A3j2HZwVWIs/ZmV+wPDalPPcuoWS3E2w9jxYtf8
	IXPkEcFN4hsogVlVATkOM2O04QPGbC/g63M4vX9gaOFcn8b6yaXjHs7yPJI3kp0e
	xnN4ShJOBNybA7e32E5qVC+vWLh36VirWdQ==
X-ME-Sender: <xms:dSTyaM_7hUMwjy4u2eAukOctuWuuaWtSIoGauFGY5KeMccm8oqnFJw>
    <xme:dSTyaKvQr52Jz53mo5gjhBR5RiUZTzfLwQhxWqTrPNnuPlnld7ivZ-Zif1tjC8Hnz
    mPXUiDdoHrvBPM2p6fvWQQmeNaS-KdmILceIBOJbuDEv-t5biCmGaA>
X-ME-Received: <xmr:dSTyaPpwQvXeNNxRcUwNIV3ryRnh-Y8tkrZUDDyDZF2evozdW4hh78OCLwTvU68zBgZ-Q0EYpE550nVey8pYjySgJabcz1HeBp86NFp2pIuoaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdeltddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
    sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeffvdeuleffveekud
    fhteejudffgefhtedtgfeutdfgvdfgueefudehveehveekkeenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrg
    hmohgttghhihdrjhhppdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehtihifrghisehsuhhsvgdruggvpdhrtghpthhtoheplhhinhhugidqsh
    houhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:dSTyaHn_HDkJsEdrRnf7no23RfKs0Q_5uv09UBB2JrAJRK6NZaqKiw>
    <xmx:dSTyaDz6MbrWWADd3L2e8sLgqF-N1ZRsle9r-HvZ44fC54lXMc9Gjg>
    <xmx:dSTyaPleAYNQ0QXSmwCKfo8YF-J7n26Twjmu6ylFA5quEaEAfoOWpg>
    <xmx:dSTyaMfYCVpZT51VXzbSzyJbX_nZdXzuwozMr5kEkgUiF_I7Kw4zIg>
    <xmx:dSTyaIUdKJkBgY0vifQMI17OmjDmMHcZuN4ZP9MJm4b9RwQjGg1sNMSf>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Oct 2025 07:11:48 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: dice: add support for TASCAM IF-FW/DM MkII
Date: Fri, 17 Oct 2025 20:11:45 +0900
Message-ID: <20251017111145.263295-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TEAC Corporation launched IF-FW/DM MkII as an add-in card for TASCAM
DM-3200 and DM-4800. This card uses TC Applied Technologies DICE II
ASIC.

This commit supports the add-in card. The configuration ROM content
includes some quirks:

- The category value stored in chip_ID_hi field of bus information block
  is zero.
- The value of model in unit directory (0x00022e) is different from the
  one in root directory (0x000006).

The hardware allows users to select the total number of audio data channels
available for system from 16 and 32 channels for both input and output
direction. In 16-channel mode,  all audio data are transferred in a
single isochronous packet stream, while in 32-channel mode, they are
transferred across two streams. After the user changes the channel
configuration on the hardware panel, the device temporarily disappears
from the bus and reappears with the new stream formats. During device
probing the ALSA dice driver checks the number of available isochronous
packet streams to determine the active mode of the hardware.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/dice/Makefile    |  2 +-
 sound/firewire/dice/dice-teac.c | 43 +++++++++++++++++++++++++++++++++
 sound/firewire/dice/dice.c      | 13 ++++++++++
 sound/firewire/dice/dice.h      |  1 +
 4 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 sound/firewire/dice/dice-teac.c

diff --git a/sound/firewire/dice/Makefile b/sound/firewire/dice/Makefile
index 36e25a3cf3c6..478cd7a08fb5 100644
--- a/sound/firewire/dice/Makefile
+++ b/sound/firewire/dice/Makefile
@@ -2,5 +2,5 @@
 snd-dice-y := dice-transaction.o dice-stream.o dice-proc.o dice-midi.o \
 		 dice-pcm.o dice-hwdep.o dice.o dice-tcelectronic.o \
 		 dice-alesis.o dice-extension.o dice-mytek.o dice-presonus.o \
-		 dice-harman.o dice-focusrite.o dice-weiss.o
+		 dice-harman.o dice-focusrite.o dice-weiss.o dice-teac.o
 obj-$(CONFIG_SND_DICE) += snd-dice.o
diff --git a/sound/firewire/dice/dice-teac.c b/sound/firewire/dice/dice-teac.c
new file mode 100644
index 000000000000..29febddfe3a5
--- /dev/null
+++ b/sound/firewire/dice/dice-teac.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0
+// dice-teac.c - a part of driver for DICE based devices
+//
+// Copyright (c) 2025 Takashi Sakamoto
+
+#include "dice.h"
+
+int snd_dice_detect_teac_formats(struct snd_dice *dice)
+{
+	__be32 reg;
+	u32 data;
+	int err;
+
+	err = snd_dice_transaction_read_tx(dice, TX_NUMBER, &reg, sizeof(reg));
+	if (err  < 0)
+		return err;
+
+	dice->tx_pcm_chs[0][SND_DICE_RATE_MODE_LOW] = 16;
+	dice->tx_pcm_chs[0][SND_DICE_RATE_MODE_MIDDLE] = 16;
+	dice->tx_midi_ports[0] = 1;
+
+	data = be32_to_cpu(reg);
+	if (data > 1) {
+		dice->tx_pcm_chs[1][SND_DICE_RATE_MODE_LOW] = 16;
+		dice->tx_pcm_chs[1][SND_DICE_RATE_MODE_MIDDLE] = 16;
+	}
+
+	err = snd_dice_transaction_read_rx(dice, RX_NUMBER, &reg, sizeof(reg));
+	if (err  < 0)
+		return err;
+
+	dice->rx_pcm_chs[0][SND_DICE_RATE_MODE_LOW] = 16;
+	dice->rx_pcm_chs[0][SND_DICE_RATE_MODE_MIDDLE] = 16;
+	dice->rx_midi_ports[0] = 1;
+
+	data = be32_to_cpu(reg);
+	if (data > 1) {
+		dice->rx_pcm_chs[1][SND_DICE_RATE_MODE_LOW] = 16;
+		dice->rx_pcm_chs[1][SND_DICE_RATE_MODE_MIDDLE] = 16;
+	}
+
+	return 0;
+}
diff --git a/sound/firewire/dice/dice.c b/sound/firewire/dice/dice.c
index bcbe80344328..85d265c7d544 100644
--- a/sound/firewire/dice/dice.c
+++ b/sound/firewire/dice/dice.c
@@ -22,6 +22,7 @@ MODULE_LICENSE("GPL");
 #define OUI_PRESONUS		0x000a92
 #define OUI_HARMAN		0x000fd7
 #define OUI_AVID		0x00a07e
+#define OUI_TEAC		0x00022e
 
 #define DICE_CATEGORY_ID	0x04
 #define WEISS_CATEGORY_ID	0x00
@@ -458,6 +459,18 @@ static const struct ieee1394_device_id dice_id_table[] = {
 		.match_flags = IEEE1394_MATCH_VERSION,
 		.version     = DICE_INTERFACE,
 	},
+	// Tascam IF-FW/DM MkII for DM-3200 and DM-4800.
+	{
+		.match_flags	= IEEE1394_MATCH_VENDOR_ID |
+				  IEEE1394_MATCH_MODEL_ID |
+				  IEEE1394_MATCH_SPECIFIER_ID |
+				  IEEE1394_MATCH_VERSION,
+		.vendor_id	= OUI_TEAC,
+		.model_id	= OUI_TEAC,
+		.specifier_id	= OUI_TEAC,
+		.version	= 0x800006,
+		.driver_data = (kernel_ulong_t)snd_dice_detect_teac_formats,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(ieee1394, dice_id_table);
diff --git a/sound/firewire/dice/dice.h b/sound/firewire/dice/dice.h
index 4c0ad7335998..7744ea6a0791 100644
--- a/sound/firewire/dice/dice.h
+++ b/sound/firewire/dice/dice.h
@@ -233,5 +233,6 @@ int snd_dice_detect_presonus_formats(struct snd_dice *dice);
 int snd_dice_detect_harman_formats(struct snd_dice *dice);
 int snd_dice_detect_focusrite_pro40_tcd3070_formats(struct snd_dice *dice);
 int snd_dice_detect_weiss_formats(struct snd_dice *dice);
+int snd_dice_detect_teac_formats(struct snd_dice *dice);
 
 #endif

base-commit: ec2e0fb07d789976c601bec19ecced7a501c3705
-- 
2.51.0

